from qiskit import QuantumCircuit

# NC_05 — EDGE PROBE: cx(1,0), control q1 / target q0. Never occurs in corpus.
# Composer brackets EVERY cx; target-based rule says target q0 -> free. They disagree.
qc = QuantumCircuit(2)
qc.h(0)
qc.cx(1, 0)
