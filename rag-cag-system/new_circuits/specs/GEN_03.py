from qiskit import QuantumCircuit
qc = QuantumCircuit(2)
qc.h(0)
qc.x(1)
qc.h(0)
qc.sx(1)
