from qiskit import QuantumCircuit

# NC_01 — bracketed SX (corpus has SX only free and SXD only bracketed)
qc = QuantumCircuit(2)
qc.h(0)
qc.sx(1)
qc.swap(0, 1)
