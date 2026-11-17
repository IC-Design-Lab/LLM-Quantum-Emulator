"""corpus_v2 generator — deterministic context + static lint + bounded repair loop.

WHAT CHANGED FROM THE ARMS, AND WHY (every choice traces to a measurement)
--------------------------------------------------------------------------
* NO EMBEDDING RETRIEVAL for critical knowledge. Arm 2's top-5 retrieved
  `compatibleperm_2q16.md` in 0 of 7 queries while spending 2 of 5 slots on a gate
  with no hardware (TGate) and on a conventions file the assembler then deduped
  away. The whole family context is ~1.9k tokens, so it is injected wholesale.
* INTERFACES ARE FIRST-CLASS. Arm 2 failed 3/7 circuits with 32 port-not-found
  errors each because the manifest gave names without port lists.
* THE COMPOSITION RULE IS IN THE PROMPT. All 3 cx circuits were mis-bracketed
  because no document stated that a cx targeting q1 needs a permutation bracket.
* THE WORKED EXAMPLE IS CONDENSED. Full wiring payloads are 179 lines (2q), 692
  (QFT), 3121 (Shor) for 6/13/16 meaningful instantiations. A local 7B model lost
  the structure in that port noise. Since the interface doc already fixes the port
  list and the topology is a pure chain, the example carries ONE full instantiation
  block as a formatting template plus the ordered sequence.
* LINT BEFORE SIMULATION. Free, and it caught 3 of the 4 real Arm-2 failures.
* REPAIR IS BOUNDED and every round is logged, so pass@1 vs pass@repair is
  measurable rather than blurred.

    python rag/generate_v2.py <spec.py> --dry-run          # free, prints the prompt
    python rag/generate_v2.py <spec.py> --backend ollama   # free local iteration
    python rag/generate_v2.py <spec.py>                    # gemini
"""

from __future__ import annotations

import argparse
import json
import os
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
RAG = ROOT / "rag"
sys.path.insert(0, str(RAG))
sys.path.insert(0, str(ROOT))

from core import (  # noqa: E402
    DEFAULT_MODEL, SYSTEM_INSTRUCTION, approx_tokens, call_gemini, canonicalize,
    count_prompt_tokens, die, strip_fences,
)
import families as fam  # noqa: E402
from example_retrieval import (  # noqa: E402
    gate_tokens_from_canonical, load_examples, select_example,
)
from lint_generated import lint, render as render_lint  # noqa: E402

CORPUS = ROOT / "corpus_v2"
OUTPUT = RAG / "output_v2"
MAX_REPAIRS = 2

# Families whose composition rulebook is validated against ground truth. Only for
# these is a COMPOSITION deviation treated as repair-worthy; elsewhere the rule is
# not established and forcing a repair toward it would be guessing.
RULEBOOK_VALIDATED = {"2qubit-16bit"}

INST_BLOCK = re.compile(r"^  ([A-Za-z]\w*)\s+(\w+)\s*\(\s*(?://.*)?$", re.M)


# --------------------------------------------------------------------------
# worked example — condensed
# --------------------------------------------------------------------------
def condense_example(e: dict) -> str:
    """One full instantiation block as a formatting template + the ordered sequence.

    Replaces a 179/692/3121-line payload with ~30 lines. The port list is already
    pinned by the interfaces document; repeating it 6-16 times only dilutes the
    structural signal, which is the part the example exists to teach.
    """
    wiring = e["wiring"]
    lines = wiring.splitlines()
    blocks = []
    for m in INST_BLOCK.finditer(wiring):
        start = wiring[:m.start()].count("\n")
        end = start
        while end < len(lines) and not lines[end].strip().startswith(");"):
            end += 1
        blocks.append((m.group(1), m.group(2), start, end))

    L = [f"### Its verified composition — {len(blocks)} instantiations, in order", ""]
    L.append("```")
    for i, (mod, inst, _, _) in enumerate(blocks):
        src = "top-level inputs" if i == 0 else f"outputs of {blocks[i-1][1]}"
        dst = "top-level outputs" if i == len(blocks) - 1 else "wires"
        L.append(f"  {mod:<26} {inst:<6}   <- {src:<22} -> {dst}")
    L.append("```")
    if blocks:
        _, _, s, e_ = blocks[0]
        L += ["", "One block verbatim, as the exact formatting to follow:", "",
              "```verilog", *[ln.rstrip() for ln in lines[s:e_ + 1]], "```"]
    return "\n".join(L)


# --------------------------------------------------------------------------
# prompt assembly
# --------------------------------------------------------------------------
def read(p: Path) -> str:
    return p.read_text(encoding="utf-8").strip() if p.exists() else ""


# Ablation: which context section to withhold. The claim this system rests on is
# that the PRELOADED family context carries the result, so it has to be possible to
# take a piece away and measure what happens. A withheld section keeps its heading
# and says the content is unavailable, rather than vanishing -- the TASK text refers
# to sections by number, and a dangling reference would confound the manipulation
# with plain confusion.
ABLATABLE = {"interfaces": "SECTION 2", "rulebook": "SECTION 3", "example": "SECTION 4"}


def ablation_suffix(drop) -> str:
    """Artifact-name suffix for an ablation run, so it cannot overwrite the baseline.

    UNDERSCORES ONLY. The name reaches the harness as a tag and ends up inside a
    generated testbench as `module tb_<tag>_gen;`, so any character illegal in a
    Verilog identifier makes the simulation fail to elaborate. A first cut used
    `_no-interfaces`; the hyphen produced no transcript at all and every circuit in
    both conditions scored UNKNOWN with 0/0 checks.
    """
    return "".join(f"_no_{d}" for d in sorted(drop)) if drop else ""


def assemble(canonical: str, family: str, example, attempt: int = 1,
             previous: str = "", findings: str = "", drop=frozenset()) -> str:
    parts = [
        "# SECTION 1 — GATE REFERENCE (all families)\n",
        read(CORPUS / "gates.md"), "",
        f"# SECTION 2 — MODULE INTERFACES for `{family}` (exact, harvested)\n",
        ("Exact port lists are NOT available for this family. Infer every port name "
         "from the worked example in SECTION 4.\n" if "interfaces" in drop
         else read(CORPUS / "interfaces" / f"{family}.md")), "",
    ]

    rules = "" if "rulebook" in drop else read(CORPUS / "composition" / f"{family}.md")
    if rules:
        parts += [f"# SECTION 3 — COMPOSITION RULES for `{family}`\n", rules, ""]
    else:
        parts += [
            f"# SECTION 3 — COMPOSITION RULES for `{family}`\n",
            "No validated rulebook exists for this family yet. Derive the composition "
            "from the worked example in SECTION 4, which is verified hardware: note "
            "which gates carry permutation wrappers, how many, and where. Permutation "
            "modules have NO counterpart in the specification — they are required by "
            "the hardware, not by the logical circuit.\n",
        ]

    if "example" in drop:
        parts += ["# SECTION 4 — WORKED REFERENCE EXAMPLE\n",
                  "(withheld for this run)\n"]
    elif example is not None:
        e = example["_full"]
        parts += [
            "# SECTION 4 — WORKED REFERENCE EXAMPLE (verified hardware)\n",
            f"## {e['circuit']}", "", "### Its specification", "",
            f"```\n{e['canonical'].strip()}\n```", "",
            condense_example(e), "",
        ]
    else:
        parts += ["# SECTION 4 — WORKED REFERENCE EXAMPLE\n",
                  "(none available for this family)\n"]

    parts += ["# SECTION 5 — CIRCUIT TO IMPLEMENT\n",
              f"```\n{canonical.strip()}\n```", ""]

    if attempt == 1:
        parts += [
            "# TASK\n",
            "Emit the complete top-level SystemVerilog module implementing the "
            "SECTION 5 circuit. Apply the SECTION 3 composition rules to decide the "
            "module sequence, and the SECTION 2 interfaces for every port name. "
            "Verilog source only.",
        ]
    else:
        parts += [
            f"# TASK — REPAIR (attempt {attempt})\n",
            "Your previous attempt is below, followed by validator findings. Fix "
            "every error and re-emit the COMPLETE module. Do not explain.", "",
            "## Your previous attempt", "", f"```verilog\n{previous.strip()}\n```", "",
            "## Validator findings", "", f"```\n{findings.strip()}\n```", "",
            "Emit the corrected complete module. Verilog source only.",
        ]
    return "\n".join(parts)


# --------------------------------------------------------------------------
# backends
# --------------------------------------------------------------------------
def call_model(prompt: str, args, api_key: str):
    if args.backend == "ollama":
        import ollama_backend as ob
        model = args.ollama_model or ob.DEFAULT_OLLAMA_MODEL
        nctx = args.num_ctx or ob.size_context(approx_tokens(prompt),
                                               args.max_output_tokens)
        resp, _ = ob.generate(prompt, model, SYSTEM_INSTRUCTION, nctx,
                              args.max_output_tokens)
        return resp
    return call_gemini(prompt, args.model, api_key, args.max_output_tokens)


def usage_of(resp):
    u = getattr(resp, "usage_metadata", None)
    if not u:
        return {}
    return {"in": u.prompt_token_count, "out": u.candidates_token_count,
            "think": getattr(u, "thoughts_token_count", None) or 0}


# --------------------------------------------------------------------------
def main(argv) -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("spec")
    ap.add_argument("--backend", default="gemini", choices=["gemini", "ollama"])
    ap.add_argument("--model", default=DEFAULT_MODEL)
    ap.add_argument("--ollama-model", default=None)
    ap.add_argument("--num-ctx", type=int, default=None)
    ap.add_argument("--max-output-tokens", type=int, default=None)
    ap.add_argument("--max-repairs", type=int, default=MAX_REPAIRS)
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--drop", action="append", default=[],
                    choices=sorted(ABLATABLE),
                    help="withhold a context section (repeatable); artifacts are "
                         "suffixed so an ablation cannot overwrite the baseline")
    ap.add_argument("--full-example", action="store_true",
                    help="inject the full wiring payload instead of the condensed form")
    args = ap.parse_args(argv)

    # A spec reference is a `.py` path or a `.qpy` circuit (`file.qpy#3`), so it is
    # resolved through the converter rather than by Path() alone. `ref_name` is what
    # keeps two circuits from writing over each other's artifacts.
    import canonical_converter as _cc
    _path, _index = _cc.split_ref(args.spec)
    spec_path = str(_path.resolve()) + ("" if _index is None else f"#{_index}")
    drop = frozenset(args.drop)
    name = _cc.ref_name(spec_path) + ablation_suffix(drop)
    api_key = os.environ.get("GEMINI_API_KEY") or os.environ.get("GOOGLE_API_KEY")
    if args.backend == "gemini" and not api_key and not args.dry_run:
        die('GEMINI_API_KEY is not set.  PowerShell: $env:GEMINI_API_KEY = "..."')

    print("=" * 72)
    print(f"corpus_v2 generation — {name}")
    print("=" * 72)

    canonical, signature, qc = canonicalize(spec_path)
    family = fam.FAMILY_BY_QUBITS.get(qc.num_qubits)
    if family is None:
        die(f"{qc.num_qubits} qubits has no hardware family "
            f"(have: {sorted(fam.FAMILY_BY_QUBITS)})")
    tokens = gate_tokens_from_canonical(canonical)

    print(f"\nSTAGE 1: spec — {family}, {len(tokens)} gates")
    print("  " + "  ".join(tokens))

    problems = fam.check_legal(family, tokens)
    if problems:
        print("\n  *** CIRCUIT CANNOT BE BUILT ***")
        for p in problems:
            print(f"  - {p}")
        die("refusing to generate: required hardware does not exist. "
            "This is a library limitation, not a generation failure.")
    print("  legality: OK — every gate has a module in this family")

    # leave-one-out is unconditional. For a novel circuit nothing matches, so it is
    # inert; for a corpus circuit it prevents retrieving its own answer.
    sel = select_example(signature, family, tokens, metric="structural")
    example = sel["selected"]
    if sel["excluded_self"]:
        print(f"\nSTAGE 2: example — LEAVE-ONE-OUT excluded {sel['excluded_self']}")
    else:
        print("\nSTAGE 2: example — novel circuit, no self-match to exclude")
    if example:
        print(f"  selected {example['circuit']}  (score {example['score']:.4f}, "
              f"{example['instantiation_count']} instantiations)")
    else:
        print("  none available in this family")

    if args.full_example and example:
        globals()["condense_example"] = lambda e: (
            f"### Its verified composition\n\n```verilog\n{e['wiring']}\n```")

    OUTPUT.mkdir(exist_ok=True)
    log = {"circuit": name, "family": family, "backend": args.backend,
           "example": example["circuit"] if example else None, "attempts": []}

    prompt = assemble(canonical, family, example, drop=drop)
    print(f"\nSTAGE 3: prompt — {len(prompt):,} chars, ~{approx_tokens(prompt):,} tokens")
    dump = OUTPUT / f"{name}_prompt.txt"
    dump.write_text(prompt, encoding="utf-8")
    print(f"  saved {dump.relative_to(ROOT)}")

    if args.dry_run:
        print("\n--dry-run: nothing billed.")
        return 0

    verilog, findings = "", []
    for attempt in range(1, args.max_repairs + 2):
        print(f"\nSTAGE 4.{attempt}: generate ({args.backend})")
        resp = call_model(prompt, args, api_key)
        raw = resp.text or ""
        if not raw.strip():
            die("model returned empty text")
        verilog, _ = strip_fences(raw)
        u = usage_of(resp)
        print(f"  {len(verilog.splitlines())} lines   usage {u}")

        findings = lint(verilog, family, spec_path)
        errs = [f for f in findings if f[0] == "error"]
        # A COMPOSITION deviation is a warning for severity (it still elaborates)
        # but it IS repair-worthy where a validated rulebook exists: for
        # 2qubit-16bit the rule reproduces all nine ground truths exactly, so a
        # deviation is evidence of a defect. It is the dominant observed failure —
        # every cx circuit in the Arm-2 evaluation dropped its permutation bracket
        # and one of those produced a wrong statevector.
        if family in RULEBOOK_VALIDATED:
            errs += [f for f in findings
                     if f[0] == "warn" and f[1].startswith("COMPOSITION")]
        print("  " + render_lint(findings).replace("\n", "\n  "))
        log["attempts"].append({"n": attempt, "usage": u,
                                "lines": len(verilog.splitlines()),
                                "lint_errors": len(errs),
                                "findings": [f"[{s}] {m}" for s, m in findings]})

        out = OUTPUT / f"{name}_v2_attempt{attempt}.v"
        out.write_text(verilog, encoding="utf-8")

        if not errs:
            print(f"  clean at attempt {attempt}")
            break
        if not [f for f in findings if f[0] == "error"]:
            print("  (repair triggered by COMPOSITION deviation, not an "
                  "elaboration error)")
        if attempt == args.max_repairs + 1:
            print(f"  repair budget exhausted ({args.max_repairs})")
            break
        prompt = assemble(canonical, family, example, attempt + 1, verilog,
                          render_lint(findings), drop=drop)

    final = OUTPUT / f"{name}_v2.v"
    final.write_text(verilog, encoding="utf-8")
    log["final_lint_errors"] = len([f for f in findings if f[0] == "error"])
    log["attempts_used"] = len(log["attempts"])
    (OUTPUT / f"{name}_v2_log.json").write_text(json.dumps(log, indent=2),
                                                encoding="utf-8")
    print(f"\n  final -> {final.relative_to(ROOT)}   "
          f"attempts {log['attempts_used']}   lint errors {log['final_lint_errors']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
