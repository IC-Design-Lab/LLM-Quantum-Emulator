from qiskit import QuantumCircuit
qc = QuantumCircuit(3)
qc.h(0)
qc.swap(0,2)
