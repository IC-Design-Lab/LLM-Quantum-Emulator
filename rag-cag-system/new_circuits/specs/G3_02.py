from qiskit import QuantumCircuit
qc = QuantumCircuit(3)
qc.h(0)
qc.cs(1,0)
