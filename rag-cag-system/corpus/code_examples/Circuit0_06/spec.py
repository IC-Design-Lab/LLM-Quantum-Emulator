from qiskit import QuantumCircuit

# Circuit_00
qc = QuantumCircuit(2)
qc.h(0)
qc.swap(0, 1)
