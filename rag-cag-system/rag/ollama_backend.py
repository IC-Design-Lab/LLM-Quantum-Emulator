"""Local Ollama backend — a drop-in for generate_manifest.generate().

WHY OLLAMA AND NOT TRANSFORMERS
-------------------------------
Target hardware is an RTX 5070 Laptop: Blackwell, compute capability sm_120, 8 GB
VRAM. The transformers path needs a torch built against CUDA 12.8 (anything older
loads fine and then dies at the first kernel launch) plus bitsandbytes with its own
sm_120 support, to fit a 7B in 8 GB. Ollama ships prebuilt CUDA binaries that already
handle Blackwell and a Q4_K_M GGUF that is both smaller and leaner on KV cache:

    HF + bitsandbytes NF4   ~5.5 GB weights + ~0.9 GB KV @16k  = ~7.0 GB  (tight)
    Ollama Q4_K_M           ~4.7 GB weights + ~0.9 GB KV @16k  = ~5.6 GB  (fits)

Same model family (Qwen2.5-Coder-7B-Instruct), different runtime. This arm is
plumbing validation at zero cost, so runtime choice is not a measurement variable.

THE SILENT-TRUNCATION HAZARD (the reason this file exists at all)
-----------------------------------------------------------------
Ollama defaults to num_ctx=4096. The ARM 3 prompt is ~15k tokens. At the default,
llama.cpp silently DROPS the front of the prompt — which is SECTION 1, the manifest —
and returns a confident, wrong answer that looks like a metric failure. That is
exactly the "do not silently truncate" failure mode this project forbids.

So this backend does not trust the default:
  * num_ctx is sized from the actual prompt plus an output reserve, before sending;
  * after the call, prompt_eval_count is checked against num_ctx. If the server
    evaluated ~num_ctx tokens, the prompt hit the ceiling and was truncated — the
    run is REJECTED rather than reported.

RESULTS FROM THIS BACKEND ARE NOT COMPARABLE TO THE GEMINI ARMS. Different model,
different quantisation. It answers "does the metric surface the right example and
does the pipeline run", not "how good is the output".
"""

from __future__ import annotations

import json
import urllib.error
import urllib.request

DEFAULT_OLLAMA_MODEL = "qwen2.5-coder:7b"
OLLAMA_URL = "http://localhost:11434"

# Qwen2.5-Coder-7B native context. Beyond this needs YaRN and is not attempted.
MODEL_MAX_CTX = 32768

# Tokens held back for the answer when auto-sizing num_ctx. A 2-qubit top level runs
# 200-400 lines; Shor's ground truth is ~1,240. 6k is generous for the 2-qubit family
# and deliberately not enough for Shor — which this backend should not be asked to do.
OUTPUT_RESERVE = 6144

CTX_GRANULARITY = 2048


class _Usage:
    """Mimics google.genai usage_metadata so the caller needs no branching."""

    def __init__(self, prompt_tokens: int, output_tokens: int):
        self.prompt_token_count = prompt_tokens
        self.candidates_token_count = output_tokens
        self.thoughts_token_count = None  # no separate thinking channel


class _Response:
    """Mimics the google.genai response surface: .text and .usage_metadata."""

    def __init__(self, text: str, prompt_tokens: int, output_tokens: int, raw: dict):
        self.text = text
        self.usage_metadata = _Usage(prompt_tokens, output_tokens)
        self.raw = raw


def size_context(approx_prompt_tokens: int, max_out: int | None = None) -> int:
    """num_ctx big enough for prompt + answer, rounded up, capped at the model max.

    approx_prompt_tokens is a chars/4 estimate, which badly UNDERCOUNTS these prompts.
    MEASURED on the Circuit0_3 example prompt: 39,263 chars -> approx 10,127 tokens,
    but the tokenizer actually produced 14,124. That is 2.78 chars/token, so chars/4
    undercounts by 39%. The original 1.25 safety factor was therefore INSUFFICIENT
    (10,127 * 1.25 = 12,659 < 14,124) and only avoided truncation because the output
    reserve absorbed the shortfall. Raised to 1.60 on that measurement.

    Undersizing causes silent truncation; oversizing only costs KV-cache VRAM.
    """
    reserve = max_out if max_out else OUTPUT_RESERVE
    need = int(approx_prompt_tokens * 1.60) + reserve
    rounded = -(-need // CTX_GRANULARITY) * CTX_GRANULARITY
    return min(rounded, MODEL_MAX_CTX)


def estimate_vram_gb(num_ctx: int) -> float:
    """Rough total VRAM: Q4_K_M weights + fp16 KV cache.

    Qwen2.5-Coder-7B: 28 layers, 4 KV heads (GQA), head_dim 128, fp16 K and V
      -> 2 * 28 * 4 * 128 * 2 bytes = 57,344 B/token
    """
    weights_gb = 4.7
    kv_gb = num_ctx * 57344 / 1e9
    return round(weights_gb + kv_gb + 0.4, 2)  # +0.4 compute buffers


def check_server(model: str) -> None:
    try:
        with urllib.request.urlopen(f"{OLLAMA_URL}/api/tags", timeout=10) as r:
            tags = json.loads(r.read())
    except urllib.error.URLError as e:
        raise SystemExit(
            f"ERROR: cannot reach Ollama at {OLLAMA_URL} ({e}).\n"
            f"       Start it, then retry:  ollama serve"
        )
    names = [m["name"] for m in tags.get("models", [])]
    if model not in names and f"{model}:latest" not in names:
        raise SystemExit(
            f"ERROR: model {model!r} is not pulled. Available: {names}\n"
            f"       Pull it with:  ollama pull {model}"
        )


def generate(prompt: str, model: str, system: str, num_ctx: int,
             max_out: int | None = None, timeout: int = 1800):
    """Returns (_Response, exact_prompt_tokens). Raises on truncation."""
    options = {
        "num_ctx": num_ctx,
        "temperature": 0.0,
        # Fixed seed for run-to-run reproducibility on this machine. It does NOT
        # guarantee identical output across different GPUs or Ollama versions.
        "seed": 0,
    }
    if max_out:
        options["num_predict"] = max_out

    body = json.dumps({
        "model": model,
        "prompt": prompt,
        "system": system,
        "stream": False,
        "options": options,
    }).encode()

    req = urllib.request.Request(
        f"{OLLAMA_URL}/api/generate", body, {"Content-Type": "application/json"}
    )
    with urllib.request.urlopen(req, timeout=timeout) as r:
        d = json.loads(r.read())

    pe = d.get("prompt_eval_count", 0)
    ec = d.get("eval_count", 0)

    # --- the truncation guard --------------------------------------------
    # If the server evaluated within a whisker of num_ctx, the prompt hit the
    # ceiling and its FRONT (the manifest) was dropped. Reject; do not report.
    if pe >= num_ctx - 64:
        raise SystemExit(
            f"ERROR: prompt_eval_count={pe:,} is at the num_ctx ceiling "
            f"({num_ctx:,}).\n"
            f"       The prompt was TRUNCATED — the manifest at the front of the\n"
            f"       prompt was silently dropped, so this result is invalid.\n"
            f"       Raise --num-ctx (model max {MODEL_MAX_CTX:,}) and re-run."
        )
    if d.get("done_reason") == "length":
        print(f"  WARNING: generation stopped at the num_predict limit "
              f"({max_out}); the module is INCOMPLETE.")

    return _Response(d.get("response", ""), pe, ec, d), pe
