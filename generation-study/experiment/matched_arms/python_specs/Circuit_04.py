from qiskit import QuantumCircuit

# Circuit_04
qc = QuantumCircuit(2)
qc.h(0)
qc.sxdg(1)
qc.swap(0, 1)
