"""Reference oracle — emits the CORRECT top-level SystemVerilog for any 2-qubit circuit.

WHY THIS EXISTS
---------------
The end goal is generating circuits that are NOT in the corpus. Those have no
ground-truth .sv to score against, and the Chisel generator that produced the
existing eleven is not available to elaborate new ones.

This closes that gap. Three facts, each verified against all nine ground truths,
together make the entire top-level file a deterministic function of the spec:

  1. BRACKET RULE — a gate is wrapped in a CompatiblePerm bracket iff it is neither
     a single-qubit gate on q0 nor a swap; consecutive bracketed gates share ONE
     hoisted pair. Fixes the ordered module sequence.

  2. PURE CHAIN — instance k consumes instance k-1's outputs; instance 0 consumes the
     top-level inputs; the last instance drives the top-level outputs. No wire
     crossing at this level: CompatiblePerm carries the same 20-port signature as
     every gate and permutes INTERNALLY.

  3. FIXED NAMING — instances are m, m_1, m_2, ...; instance k's output bus is
     _m_k_io_out_*; wire groups are declared in DESCENDING instance order, omitting
     the last instance (which drives the top-level outputs directly).

So: spec -> module sequence -> full file. No ground truth required.

WHAT THIS IS AND IS NOT
-----------------------
It is an EVALUATOR, not a competitor to the RAG system. It exists only for
`2qubit-16bit`, and only because the rule was derived by hand from nine answers. No
such rule has been derived for qft-3qubit-8bit or shor-5qubit-8bit, and the bracket
rule demonstrably fails there (predicts 9 vs actual 13 on QFT; 7 vs 16 on Shor).
Using it to score novel 2-qubit circuits measures whether the model agrees with the
rule — which is necessary but NOT sufficient for the hardware to be correct.
Simulation against Qiskit's statevector remains the only proof of function.

    python rag/reference_composer.py --validate      # reproduce all 9 ground truths
    python rag/reference_composer.py <spec.py>       # emit the reference for a spec
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
RAG = ROOT / "rag"
sys.path.insert(0, str(RAG))
sys.path.insert(0, str(ROOT))

from example_retrieval import bracket_flags, parse_gate_token  # noqa: E402

CODE_EXAMPLES = ROOT / "corpus" / "code_examples"

GATE_MODULE = {
    "h": "HGate2QubitVector16bit",
    "x": "XGate2QubitVector16bit",
    "sx": "SXGate2QubitVector16bit",
    "sxdg": "SXDGate2QubitVector16bit",
    "swap": "SWGate2QubitVector16bit",
    "cx": "CNGate2QubitVector16bit",
}
PERM = "CompatiblePerm"

# 2 qubits -> 4 basis states, each a complex pair -> 8 sixteen-bit words.
QSV = [f"{i}_{j}" for i in range(4) for j in range(2)]
WIDTH = "[15:0]"


def module_sequence(tokens: list[str]) -> list[str]:
    """Ordered module list from the bracket rule. One perm pair per maximal run."""
    flags = bracket_flags(tokens)
    seq, i = [], 0
    while i < len(flags):
        j = i
        while j < len(flags) and flags[j] == flags[i]:
            j += 1
        mods = [GATE_MODULE[parse_gate_token(t)[0]] for t in tokens[i:j]]
        seq += ([PERM] + mods + [PERM]) if flags[i] == "brk" else mods
        i = j
    return seq


def _inst_name(k: int) -> str:
    return "m" if k == 0 else f"m_{k}"


def _bus(k: int, sig: str) -> str:
    """Instance k's output signal for QSV index or 'valid'."""
    return f"_{_inst_name(k)}_io_out_{'valid' if sig == 'valid' else f'QSV_{sig}'}"


def compose(tokens: list[str], top_name: str = "Circuit") -> str:
    seq = module_sequence(tokens)
    n = len(seq)
    L = [f"module {top_name}("]
    L.append("  input         clock,")
    L.append("                reset,")
    L.append(f"  input  {WIDTH} io_in_QSV_{QSV[0]},")
    L += [f"                io_in_QSV_{s}," for s in QSV[1:]]
    L.append("  input         io_in_valid,")
    L.append(f"  output {WIDTH} io_out_QSV_{QSV[0]},")
    L += [f"                io_out_QSV_{s}," for s in QSV[1:]]
    L.append("  output        io_out_valid")
    L.append(");")
    L.append("")

    # Wire groups: descending instance order, omitting the last (drives top outputs).
    for k in range(n - 2, -1, -1):
        L += [f"  wire {WIDTH} {_bus(k, s)};" for s in QSV]
        L.append(f"  wire        {_bus(k, 'valid')};")
    if n > 1:
        L.append("")

    for k, mod in enumerate(seq):
        src = (lambda s: f"io_in_QSV_{s}") if k == 0 else (lambda s: _bus(k - 1, s))
        src_v = "io_in_valid" if k == 0 else _bus(k - 1, "valid")
        last = (k == n - 1)
        dst = (lambda s: f"io_out_QSV_{s}") if last else (lambda s: _bus(k, s))
        dst_v = "io_out_valid" if last else _bus(k, "valid")

        L.append(f"  {mod} {_inst_name(k)} (")
        L.append("    .clock          (clock),")
        L.append("    .reset          (reset),")
        L += [f"    .io_in_QSV_{s}  ({src(s)})," for s in QSV]
        L.append(f"    .io_in_valid    ({src_v}),")
        L += [f"    .io_out_QSV_{s} ({dst(s)})," for s in QSV]
        L.append(f"    .io_out_valid   ({dst_v})")
        L.append("  );")

    L.append("endmodule")
    return "\n".join(L) + "\n"


def normalize(text: str) -> list[str]:
    """Strip CIRCT source comments and collapse whitespace, for structural compare."""
    out = []
    for line in text.splitlines():
        line = re.sub(r"//.*$", "", line)
        line = re.sub(r"\s+", " ", line).strip()
        if line:
            out.append(line)
    return out


TOP_MODULE = {"Circuit0_06": "Circuit0_06NOCOMMENTS"}


def ground_truth_top(circuit: str) -> list[str]:
    p = CODE_EXAMPLES / circuit / f"{circuit}_ground_truth.sv"
    top = TOP_MODULE.get(circuit, circuit)
    keep, body = False, []
    for line in p.read_text(encoding="utf-8", errors="replace").splitlines():
        if line.startswith(f"module {top}("):
            keep = True
        if keep:
            body.append(line)
            if line.startswith("endmodule"):
                break
    return normalize("\n".join(body))


def tokens_of(circuit: str) -> list[str]:
    canonical = (CODE_EXAMPLES / circuit / "spec_canonical.txt").read_text(
        encoding="utf-8")
    seen, out = False, []
    for line in canonical.splitlines():
        if line.startswith("gates:"):
            seen = True
            continue
        if seen and line.startswith("  "):
            out.append(line.strip())
    return out


def validate() -> int:
    circuits = ["Circuit0_06", "Circuit0_17", "Circuit0_2", "Circuit0_3",
                "Circuit0_4", "Circuit0_5", "Circuit1_0167", "Circuit1_23",
                "Circuit1_45"]
    print("REFERENCE ORACLE — reproducing ground truth from the SPEC ALONE\n")
    print(f"  {'circuit':<14} {'inst':>4} {'lines':>6} {'reproduces ground truth':>25}")
    bad = 0
    for c in circuits:
        toks = tokens_of(c)
        top = TOP_MODULE.get(c, c)
        mine = normalize(compose(toks, top))
        theirs = ground_truth_top(c)
        ok = mine == theirs
        bad += not ok
        print(f"  {c:<14} {len(module_sequence(toks)):>4} {len(theirs):>6} "
              f"{('YES' if ok else 'NO'):>25}")
        if not ok:
            for i, (a, b) in enumerate(zip(mine, theirs), 1):
                if a != b:
                    print(f"      first diff L{i}:\n        mine  : {a}\n"
                          f"        truth : {b}")
                    break
            else:
                print(f"      length differs: {len(mine)} vs {len(theirs)}")
    print(f"\n  {9 - bad}/9 reproduced exactly from the specification alone.")
    if bad:
        print("  The oracle is NOT validated. Do not use it to score novel circuits.")
        return 1
    print("  Oracle validated: novel 2-qubit circuits can be scored without any")
    print("  ground-truth file. Scope: 2qubit-16bit ONLY — the rule fails on QFT/Shor.")
    return 0


def main(argv: list[str]) -> int:
    if not argv or argv[0] == "--validate":
        return validate()
    import canonical_converter as cc
    qc = cc.load_circuit(Path(argv[0]))
    sys.stdout.write(compose(cc.gate_tokens(qc)))
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
