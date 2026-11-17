from qiskit import QuantumCircuit

# NC_04 — EDGE PROBE: CX adjacent to a bracketed single. Sharing unverified in corpus.
qc = QuantumCircuit(2)
qc.h(0)
qc.x(1)
qc.cx(0, 1)
