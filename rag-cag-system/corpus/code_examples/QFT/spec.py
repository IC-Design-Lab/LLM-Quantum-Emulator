from qiskit import QuantumCircuit
import math

# QFT
qc = QuantumCircuit(3)
qc.h(0)
qc.cs(1, 0)
qc.cp(math.pi / 4, 2, 0)
qc.h(1)
qc.cs(2, 1)
qc.h(2)
qc.swap(0, 2)
