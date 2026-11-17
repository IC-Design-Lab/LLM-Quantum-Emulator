from qiskit import QuantumCircuit
qc = QuantumCircuit(2)
qc.h(0)
qc.x(1)
qc.sx(1)
qc.sxdg(1)
qc.swap(0, 1)
