from qiskit import QuantumCircuit

# Circuit_07
qc = QuantumCircuit(2)
qc.h(0)
qc.cx(0, 1)
qc.h(0)
