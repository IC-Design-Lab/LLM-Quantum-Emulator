from qiskit import QuantumCircuit

# Shor
qc = QuantumCircuit(5)
qc.h(0)
qc.cx(0, 1)
qc.cx(1, 2)
qc.cx(2, 3)
qc.cx(3, 4)
