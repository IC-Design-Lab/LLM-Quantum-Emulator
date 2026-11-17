"""Shared primitives for the generation system.

Extracted so the working system does not import from `generate.py`, which is the
original baseline arm and is kept only as experimental evidence. Nothing in the
system should depend on an archived experiment.

Contents: the system instruction, spec canonicalisation, token estimation, fence
stripping, and the model call. `canonical_converter.py` is imported, never
reimplemented -- the same converter must run on corpus specs and on incoming
queries or structural matching is comparing different things.
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

DEFAULT_MODEL = "gemini-3.5-flash"

SYSTEM_INSTRUCTION = """\
You are generating top-level SystemVerilog for an FPGA quantum-circuit simulator.

Your task: given a logical quantum circuit specification, emit ONE top-level module \
that IMPLEMENTS that circuit by INSTANTIATING pre-existing, already-verified library \
modules and wiring them together in sequence.

Hard requirements:
- The top-level is WIRING ONLY. Do NOT implement gate logic, arithmetic, always \
blocks, or any behavioural code. Every operation is performed by instantiating a \
library module.
- Do NOT define or redeclare the library modules. They already exist and are compiled \
separately. Only instantiate them.
- Use module names EXACTLY as they appear in the reference context. Never invent, \
abbreviate, or pluralise a module name, and never adapt a name from one family to \
another.
- Chain the stages: each instantiation's io_out_* ports feed the next stage's io_in_* \
ports through intermediate wires, and io_in_valid / io_out_valid chain the same way. \
The first stage takes the top-level inputs; the last stage drives the top-level outputs.
- Declare intermediate wires for every inter-stage connection.
- Use named port connections (.port_name(signal)), never positional.

Output ONLY the Verilog source. No explanation, no markdown fences."""


def die(msg: str):
    print(f"\nERROR: {msg}", file=sys.stderr)
    raise SystemExit(1)


def approx_tokens(text: str) -> int:
    """Rough size estimate. UNDERCOUNTS these prompts by ~40% (measured: 2.78
    chars/token against a chars/4 estimate), so never size a hard limit from it
    without a margin."""
    return len(text) // 4


def canonicalize(spec_ref):
    """(canonical text, structural signature, QuantumCircuit) for a spec reference.

    Accepts a `.py` spec or a `.qpy` circuit reference (`file.qpy#3`); the '#N'
    index is part of the reference, so existence is checked on the path alone.
    """
    sys.path.insert(0, str(ROOT))
    import canonical_converter as cc

    path, _ = cc.split_ref(spec_ref)
    if not path.exists():
        die(f"spec not found: {path}")
    qc = cc.load_circuit(spec_ref)
    return cc.canonical_text(qc), cc.signature(qc), qc


def strip_fences(text: str) -> tuple[str, bool]:
    m = re.search(r"```(?:systemverilog|verilog|sv)?\s*\n(.*?)```", text, re.S)
    if m:
        return m.group(1).strip() + "\n", True
    return text.strip() + "\n", False


def count_prompt_tokens(prompt: str, model: str, api_key: str):
    """Exact input token count. A free metadata call -- no generation is billed."""
    from google import genai

    client = genai.Client(api_key=api_key)
    try:
        return client.models.count_tokens(model=model, contents=prompt).total_tokens
    except Exception as e:                                     # noqa: BLE001
        print(f"  (count_tokens unavailable: {e})")
        return None


def call_gemini(prompt: str, model: str, api_key: str, max_output_tokens=None):
    from google import genai
    from google.genai import types

    client = genai.Client(api_key=api_key)
    cfg = dict(system_instruction=SYSTEM_INSTRUCTION, temperature=0.0)
    if max_output_tokens:
        cfg["max_output_tokens"] = max_output_tokens
    return client.models.generate_content(
        model=model, contents=prompt, config=types.GenerateContentConfig(**cfg))
