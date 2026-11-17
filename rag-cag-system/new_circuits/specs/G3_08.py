from qiskit import QuantumCircuit
qc = QuantumCircuit(3)
qc.h(0)
qc.swap(1,2)
qc.h(1)
