"""Derive the composition rule for a family by REPLAYING its ground-truth sequence.

The permutation catalog (rag/permcat.py) measured what every CompatiblePerm variant
does. The remaining unknown is which qubits each GATE module acts on natively. This
recovers that by replay:

  * walk the ground-truth instantiation sequence, tracking a running qubit
    permutation (each CompatiblePerm applies its measured transposition),
  * at each gate, the logical qubits it must be acting on are known from the spec,
    so the NATIVE position is that logical target mapped through the running
    permutation,
  * if a single consistent native position explains every occurrence of a gate,
    the rule is determined; if not, say so rather than average it away.

Once native positions are known, composing ANY circuit in the family is mechanical:
for each gate, permute the needed qubits onto the native positions, apply, and
(optionally) permute back.

    python rag/derive_rule.py --family shor-5qubit-8bit
    python rag/derive_rule.py                       # all families with ground truth
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
RAG = ROOT / "rag"
sys.path.insert(0, str(RAG))
sys.path.insert(0, str(ROOT))

import canonical_converter as cc            # noqa: E402
import families as fam                      # noqa: E402
from example_retrieval import parse_gate_token  # noqa: E402

CE = ROOT / "corpus" / "code_examples"
CATALOG = ROOT / "corpus_v2" / "permutations.json"

CIRCUITS = {"2qubit-16bit": ("Circuit0_3", "Circuit0_3"),
            "qft-3qubit-8bit": ("QFT", "QFTcircuit_8bit_NC"),
            "shor-5qubit-8bit": ("Shor", "ShorCircuit_8bit_NC")}

KW = {"module", "endmodule", "input", "output", "wire", "reg", "logic", "assign",
      "always", "initial", "if", "else", "for", "case", "begin", "end"}


def top_sequence(circuit: str, top: str) -> list[str]:
    p = CE / circuit / f"{circuit}_ground_truth.sv"
    text = p.read_text(encoding="utf-8", errors="replace")
    keep, seq = False, []
    for line in text.splitlines():
        if line.startswith(f"module {top}("):
            keep = True
            continue
        if keep:
            if line.startswith("endmodule"):
                break
            m = re.match(r"^  ([A-Za-z]\w*)\s+\w+\s*\(", re.sub(r"//.*$", "", line))
            if m and m.group(1) not in KW:
                seq.append(m.group(1))
    return seq


def derive(family: str) -> dict:
    circuit, top = CIRCUITS[family]
    catalog = json.loads(CATALOG.read_text(encoding="utf-8"))[family]
    perms = {m: tuple(d["qubit_swap"]) for m, d in catalog.items()
             if d.get("qubit_swap")}
    gate_module = fam.GATE_MODULE[family]
    module_gate = {v: k for k, v in gate_module.items()}

    qc = cc.load_circuit(CE / circuit / "spec.py")
    tokens = cc.gate_tokens(qc)
    n = qc.num_qubits
    seq = top_sequence(circuit, top)

    print(f"\n=== {family} — {circuit} ===")
    print(f"  spec  : {' '.join(tokens)}")
    print(f"  built : {len(seq)} instantiations")

    # perm[logical qubit] = physical position it currently occupies
    pos = list(range(n))
    gi = 0
    observations = {}          # gate name -> set of native position tuples seen
    trace = []
    for module in seq:
        if module in perms:
            a, b = perms[module]
            # the module swaps PHYSICAL positions a and b
            for q in range(n):
                if pos[q] == a:
                    pos[q] = b
                elif pos[q] == b:
                    pos[q] = a
            trace.append(f"    perm {module:<18} swaps positions {a},{b} "
                         f"-> layout {pos}")
        elif module in module_gate:
            if gi >= len(tokens):
                trace.append(f"    !! extra gate module {module} beyond the spec")
                break
            name, targets = parse_gate_token(tokens[gi])
            if module_gate[module] != name:
                trace.append(f"    !! spec expects {name}, hardware has "
                             f"{module_gate[module]}")
            native = tuple(pos[q] for q in targets)
            observations.setdefault(name, set()).add(native)
            trace.append(f"    gate {module:<18} logical {name}{targets} sits at "
                         f"physical {native}")
            gi += 1
        else:
            trace.append(f"    ?? unrecognised module {module}")
    print("\n".join(trace))

    print(f"\n  NATIVE POSITIONS (a gate module always acts on these physical slots)")
    consistent = True
    natives = {}
    for g, obs in sorted(observations.items()):
        ok = len(obs) == 1
        consistent &= ok
        natives[g] = sorted(obs)[0] if ok else None
        print(f"    {g:<6} {sorted(obs)}   {'consistent' if ok else '*** INCONSISTENT ***'}")
    if gi != len(tokens):
        print(f"    !! consumed {gi} of {len(tokens)} spec gates")
        consistent = False
    print(f"    final layout {pos}  {'(identity)' if pos == list(range(n)) else '(NOT identity)'}")
    return {"family": family, "natives": natives, "consistent": consistent,
            "final_layout": pos, "perms": {m: list(v) for m, v in perms.items()}}


def main(argv) -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--family", default=None)
    args = ap.parse_args(argv)
    fams = [args.family] if args.family else list(CIRCUITS)
    out = {}
    for f in fams:
        out[f] = derive(f)
    print("\n" + "=" * 70)
    for f, d in out.items():
        print(f"  {f:<18} {'RULE DETERMINED' if d['consistent'] else 'UNDERDETERMINED'}"
              f"   natives={d['natives']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
