# NC_08 -- IBM Composer. Does the multiplier bug hit SX as well as H?
from qiskit import QuantumRegister, QuantumCircuit
qreg_q = QuantumRegister(2, 'q')
circuit = QuantumCircuit(qreg_q)

circuit.h(qreg_q[0])
circuit.sx(qreg_q[0])
