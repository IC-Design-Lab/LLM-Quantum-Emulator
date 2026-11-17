from qiskit import QuantumCircuit

# Circuit_02
qc = QuantumCircuit(2)
qc.h(0)
qc.h(1)
qc.swap(0, 1)
