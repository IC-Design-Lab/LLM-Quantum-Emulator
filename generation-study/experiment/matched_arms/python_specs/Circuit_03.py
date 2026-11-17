from qiskit import QuantumCircuit

# Circuit_03
qc = QuantumCircuit(2)
qc.h(0)
qc.x(1)
qc.h(1)
qc.swap(0, 1)
