# NC_07 -- IBM Composer. Minimal SplitMultiplier bug reproducer: H.H = I.
from qiskit import QuantumRegister, QuantumCircuit
qreg_q = QuantumRegister(2, 'q')
circuit = QuantumCircuit(qreg_q)

circuit.h(qreg_q[0])
circuit.h(qreg_q[0])
