"""H-safety screen — which circuits can be fairly evaluated on this hardware.

THE HARDWARE BUG (not ours to fix; reported as a finding)
---------------------------------------------------------
`SplitMultiplier` zero-extends a signed fixed-point value:

    automatic logic [23:0] _GEN = {8'h0, io_a};   // should be sign-extended

so any negative amplitude (0x8000-0xFFFF in Q2.14) becomes a large positive and
the product is garbage. CORRECTION (2026-09-15, from the RTL): the zero-extension
appears only in the nine 2-qubit (16-bit) ground truths, where SplitMultiplier is
instantiated inside `HadamardGate` and nowhere else; those files contain no `TGate`.
QFT_ground_truth.sv:22 and Shor_ground_truth.sv:22 sign-extend and are unaffected,
so this screen is conservative for the 8-bit families. It is duplicated, not
shared, so it affects every H. `SqrtXGate`/`SqrtXDaggerGate` are correct — they
scale by 1/2 with a sign-extended shift `{Real0[15], Real0[15:1]}`, which is the
fix template if it is ever patched.

Consequence: a circuit that feeds a negative amplitude into an H produces wrong
hardware output NO MATTER how correct the generated Verilog is. Scoring such a
circuit measures the library's bug, not the RAG system. They are screened out and
the excluded fraction is reported as a limitation.

WHAT THIS CHECKS
----------------
The testbench drives ONE basis input, chosen (as in verify_generated.py) to be
discriminating — its golden must not be invariant under swapping states 1 and 2,
otherwise the test can pass vacuously. This walks the circuit from that input and
reports the first H that receives a negative amplitude component.

If the default input is unsafe, every other basis input is tried: a circuit is
salvageable when some input is both discriminating AND H-safe. That recovers
circuits that would otherwise be discarded.

    python rag/hsafe.py <spec.py> [<spec.py> ...]
    python rag/hsafe.py <file.qpy>              # every circuit in the container
    python rag/hsafe.py --dir new_circuits/specs
"""

from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "rag"))
sys.path.insert(0, str(ROOT))

TOL = 1e-9


def _labels(n_qubits: int) -> list[str]:
    return [format(i, f"0{n_qubits}b") for i in range(2 ** n_qubits)]


def discriminating(qc, label: str) -> bool:
    """Golden must not be invariant under swapping basis states 1 and 2.

    Same criterion verify_generated.py uses to pick its input; a vacuous pass
    nearly invalidated an earlier run.
    """
    import numpy as np
    from qiskit.quantum_info import Statevector
    g = Statevector.from_label(label).evolve(qc).data
    p = g.copy()
    p[1], p[2] = g[2], g[1]
    return not np.allclose(g, p, atol=TOL)


def first_unsafe_h(qc, label: str):
    """(gate_index, gate_name, most negative component) at the first unsafe H."""
    import numpy as np
    from qiskit import QuantumCircuit
    from qiskit.quantum_info import Statevector

    state = Statevector.from_label(label)
    for idx, inst in enumerate(qc.data):
        op = inst.operation
        if op.name in ("measure", "barrier"):
            continue
        if op.name == "h":
            d = state.data
            worst = min(list(d.real) + list(d.imag))
            if worst < -TOL:
                return idx, op.name, worst
        step = QuantumCircuit(qc.num_qubits)
        step.append(op, [qc.find_bit(q).index for q in inst.qubits])
        state = state.evolve(step)
    return None


def screen(spec_path: Path) -> dict:
    import canonical_converter as cc
    qc = cc.load_circuit(spec_path)
    labels = _labels(qc.num_qubits)

    # the input verify_generated.py would pick
    default = next((l for l in labels if discriminating(qc, l)), labels[0])
    hit = first_unsafe_h(qc, default)

    alt = None
    if hit is not None:
        for l in labels:
            if l != default and discriminating(qc, l) and first_unsafe_h(qc, l) is None:
                alt = l
                break

    return {
        "circuit": cc.ref_name(spec_path),
        "qubits": qc.num_qubits,
        "gates": cc.gate_tokens(qc),
        "default_input": default,
        "safe": hit is None,
        "first_unsafe": hit,
        "salvage_input": alt,
    }


def main(argv) -> int:
    import canonical_converter as cc
    if argv and argv[0] == "--dir":
        specs = cc.expand_refs([str(Path(argv[1]) / "*.py"),
                                str(Path(argv[1]) / "*.qpy")])
    else:
        specs = cc.expand_refs(argv)
    if not specs:
        print(__doc__)
        return 1

    rows = [screen(p) for p in specs]
    print(f"  {'circuit':<14} {'in':>5}  {'H-SAFE':<8} {'salvage':<8} detail")
    n_safe = n_salv = 0
    for r in rows:
        if r["safe"]:
            n_safe += 1
            detail = " ".join(r["gates"])[:52]
            print(f"  {r['circuit']:<14} |{r['default_input']}>  {'YES':<8} {'-':<8} {detail}")
        else:
            i, name, worst = r["first_unsafe"]
            salv = r["salvage_input"] or "none"
            if r["salvage_input"]:
                n_salv += 1
            print(f"  {r['circuit']:<14} |{r['default_input']}>  {'NO':<8} "
                  f"{('|'+salv+'>') if r['salvage_input'] else 'none':<8} "
                  f"gate {i} ({name}) sees {worst:+.4f}")
    total = len(rows)
    print(f"\n  H-safe on default input : {n_safe}/{total}")
    print(f"  salvageable via alt input: {n_salv}")
    print(f"  EVALUABLE                : {n_safe + n_salv}/{total} "
          f"({100*(n_safe+n_salv)/total:.0f}%)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
