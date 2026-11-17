#!/usr/bin/env python3
"""
build_matched_arms.py — Emit MATCHED circuit specs in two formats from .qpy source.

Design principle: the circuit description carries ONLY the circuit. All hardware
knowledge (module names, perm rules, encoding, pipeline) is supplied separately via
the prompt level's attachments — identical for both formats.

This produces, for each distinct circuit:
  python_specs/Circuit_NN.py    — Qiskit construction code
  json_specs/Circuit_NN.json    — the SAME information, as JSON

The two are informationally equivalent: gates, targets, qubit count, module name.
Nothing else. That makes input_format a clean single variable.

Usage:
    python build_matched_arms.py <subcircuits_dir> <output_root>
"""
import sys, os, glob, json
from qiskit import qpy


def extract(qc):
    """Pull the logical circuit: ordered gates with their qubit targets."""
    ops = []
    for instr in qc.data:
        gate = instr.operation.name
        if gate in ("measure", "barrier"):
            continue                      # hardware implements only unitary gates
        qubits = [qc.find_bit(q).index for q in instr.qubits]
        ops.append((gate, qubits))
    return ops


def to_python(ops, nq, name):
    lines = ["from qiskit import QuantumCircuit", "", f"# {name}",
             f"qc = QuantumCircuit({nq})"]
    for gate, qubits in ops:
        lines.append(f"qc.{gate}({', '.join(str(q) for q in qubits)})")
    return "\n".join(lines) + "\n"


def to_json(ops, nq, name):
    """Same content as the Python: circuit only. NO hardware fields."""
    return {
        "circuit_name": name,
        "num_qubits": nq,
        "operations": [
            {"step": i, "gate": g, "qubits": q} for i, (g, q) in enumerate(ops)
        ],
        "module_name": name,
    }


def main():
    if len(sys.argv) < 3:
        print(__doc__); sys.exit(1)
    subdir, root = sys.argv[1], sys.argv[2]
    pdir = os.path.join(root, "python_specs")
    jdir = os.path.join(root, "json_specs")
    os.makedirs(pdir, exist_ok=True); os.makedirs(jdir, exist_ok=True)

    seen = {}
    for path in sorted(glob.glob(os.path.join(subdir, "*.qpy"))):
        with open(path, "rb") as f:
            for qc in qpy.load(f):
                ops = extract(qc)
                key = tuple((g, tuple(q)) for g, q in ops)
                if key not in seen:
                    seen[key] = (ops, qc.num_qubits)

    print(f"{'circuit':<14} {'gates':<38} files")
    print("-" * 72)
    for i, (key, (ops, nq)) in enumerate(seen.items()):
        name = f"Circuit_{i:02d}"
        # python arm
        with open(os.path.join(pdir, f"{name}.py"), "w") as f:
            f.write(to_python(ops, nq, name))
        # json arm — matched content
        with open(os.path.join(jdir, f"{name}.json"), "w") as f:
            json.dump(to_json(ops, nq, name), f, indent=2)
        seq = " -> ".join(f"{g}{q}" for g, q in ops)
        print(f"{name:<14} {seq:<38} .py + .json")

    print(f"\n{len(seen)} circuits x 2 formats written under {root}/")
    print("\nBoth formats carry IDENTICAL information (gates, targets, qubits, name).")
    print("All hardware knowledge (gate library, perm rules, encoding, pipeline)")
    print("must be supplied by the PROMPT LEVEL attachments — same for both arms.")


if __name__ == "__main__":
    main()
