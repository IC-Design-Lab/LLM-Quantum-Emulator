from qiskit import QuantumCircuit
qc = QuantumCircuit(3)
qc.h(0)
qc.cp(3.141592653589793/4,2,0)
