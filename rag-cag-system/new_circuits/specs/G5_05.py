from qiskit import QuantumCircuit
qc = QuantumCircuit(5)
qc.h(0)
qc.cx(0,1)
qc.cx(1,2)
