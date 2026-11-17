from qiskit import QuantumCircuit
qc = QuantumCircuit(2)
qc.h(0)
qc.swap(0, 1)
qc.h(0)
