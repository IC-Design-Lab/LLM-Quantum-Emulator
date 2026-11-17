"""Generate novel 2-qubit specs covering the structural classes the corpus lacks.

The 9 corpus circuits span only FOUR bracket profiles and never exercise:
  * a LEADING bracket        (every corpus circuit opens with a free gate on q0)
  * TWO OR MORE separate bracket runs (all have 0 or 1)
  * a bracket run of length 3+        (max observed is 2)
  * a bare native cx(1,0)             (every corpus cx is cx(0,1))

Those are exactly the cases where the retrieved example has the wrong structure, so
they are the real generalization test. Each candidate is screened for H-safety
(rag/hsafe.py) before being written: a circuit that feeds a negative amplitude into
an H fails on this hardware regardless of the Verilog, and scoring it would measure
the library's SplitMultiplier bug rather than the system.

    python rag/make_novel_specs.py            # report only
    python rag/make_novel_specs.py --write    # write new_circuits/specs/GEN_*.py
"""

from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "rag"))
sys.path.insert(0, str(ROOT))

OUT = ROOT / "new_circuits" / "specs"

# (name, [(gate, qubits)], intended structural class)
CANDIDATES = [
    ("GEN_01", [("x", [1]), ("h", [0])], "leading bracket, len 1"),
    ("GEN_02", [("sx", [1]), ("sxdg", [1]), ("h", [0])], "leading bracket, run len 2"),
    ("GEN_03", [("h", [0]), ("x", [1]), ("h", [0]), ("sx", [1])], "TWO bracket runs"),
    ("GEN_04", [("h", [0]), ("sx", [1]), ("h", [0]), ("x", [1]), ("h", [0])],
     "two runs, free-separated"),
    ("GEN_05", [("h", [0]), ("x", [1]), ("sx", [1]), ("sxdg", [1])], "run of THREE"),
    ("GEN_06", [("h", [0]), ("x", [1]), ("sx", [1]), ("sxdg", [1]), ("swap", [0, 1])],
     "run of three + trailing swap"),
    ("GEN_07", [("h", [0]), ("cx", [1, 0])], "bare native cx(1,0), no bracket"),
    ("GEN_08", [("h", [0]), ("cx", [1, 0]), ("cx", [0, 1])],
     "native cx then bracketed cx"),
    ("GEN_09", [("h", [0]), ("swap", [0, 1]), ("x", [1]), ("swap", [0, 1])],
     "swap-separated bracket"),
    ("GEN_10", [("h", [0]), ("sx", [0]), ("sxdg", [0]), ("x", [0])],
     "all-native, zero brackets, len 4"),
    ("GEN_11", [("x", [1]), ("h", [0]), ("cx", [0, 1])], "leading bracket + cx"),
    ("GEN_12", [("h", [0]), ("cx", [0, 1]), ("h", [0]), ("cx", [1, 0])],
     "bracketed cx then native cx"),
    ("GEN_13", [("sx", [1]), ("h", [0]), ("x", [1]), ("h", [0])],
     "leading bracket + second run"),
    ("GEN_14", [("h", [0]), ("swap", [0, 1]), ("h", [0])], "swap between natives"),
    ("GEN_15", [("x", [1]), ("sx", [1]), ("h", [0]), ("sxdg", [1])],
     "leading run 2 + later run"),
]

TEMPLATE = """from qiskit import QuantumCircuit
qc = QuantumCircuit(2)
{body}
"""


def source(gates) -> str:
    body = "\n".join(f"qc.{g}({', '.join(map(str, qs))})" for g, qs in gates)
    return TEMPLATE.format(body=body)


def main(argv) -> int:
    import tempfile
    import canonical_converter as cc
    from example_retrieval import bracket_flags, bracket_runs
    from hsafe import screen

    write = "--write" in argv
    OUT.mkdir(parents=True, exist_ok=True)
    print(f"  {'name':<8} {'runs':<26} {'H-safe':<7} {'input':<6} class")
    kept, dropped = [], []
    for name, gates, cls in CANDIDATES:
        src = source(gates)
        with tempfile.NamedTemporaryFile("w", suffix=".py", delete=False,
                                         encoding="utf-8") as f:
            f.write(src)
            tmp = Path(f.name)
        try:
            toks = cc.gate_tokens(cc.load_circuit(tmp))
            runs = bracket_runs(bracket_flags(toks))
            hs = screen(tmp)
            ok = hs["safe"] or hs["salvage_input"]
            inp = hs["default_input"] if hs["safe"] else (hs["salvage_input"] or "-")
            print(f"  {name:<8} {str(runs):<26} {('YES' if ok else 'NO'):<7} "
                  f"{inp:<6} {cls}")
            (kept if ok else dropped).append((name, src, inp, cls, runs))
        finally:
            tmp.unlink(missing_ok=True)

    print(f"\n  evaluable: {len(kept)}/{len(CANDIDATES)}   "
          f"dropped for H-safety: {[d[0] for d in dropped] or 'none'}")

    profiles = {}
    for name, _, _, cls, runs in kept:
        profiles.setdefault(str(runs), []).append(name)
    print(f"  distinct bracket profiles covered: {len(profiles)} "
          f"(corpus has 4 across 9 circuits)")
    for prof, names in sorted(profiles.items()):
        print(f"      {prof:<28} {names}")

    if write:
        for name, src, inp, cls, _ in kept:
            (OUT / f"{name}.py").write_text(src, encoding="utf-8")
        print(f"\n  wrote {len(kept)} specs -> {OUT.relative_to(ROOT)}")
    else:
        print("\n  (report only; pass --write to create the spec files)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
