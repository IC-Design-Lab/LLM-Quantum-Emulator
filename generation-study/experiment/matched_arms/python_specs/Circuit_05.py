from qiskit import QuantumCircuit

# Circuit_05
qc = QuantumCircuit(2)
qc.h(0)
qc.x(1)
qc.sxdg(1)
qc.swap(0, 1)
