from qiskit import QuantumCircuit

# NC_03 — free run of two singles on q0 before a CX (x(0) is a corpus first)
qc = QuantumCircuit(2)
qc.h(0)
qc.x(0)
qc.cx(0, 1)
