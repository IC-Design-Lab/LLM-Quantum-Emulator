from qiskit import QuantumCircuit

# Circuit_08
qc = QuantumCircuit(2)
qc.h(0)
qc.cx(0, 1)
qc.sx(0)
