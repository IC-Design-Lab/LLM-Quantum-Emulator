from qiskit import QuantumCircuit

# NC_02 — bracket run of THREE (corpus max is two): tests hoisting depth
qc = QuantumCircuit(2)
qc.h(0)
qc.x(1)
qc.sx(1)
qc.h(1)
qc.swap(0, 1)
