# NC_10 -- IBM Composer. CX-CX adjacency: do two CX share one bracket pair?
from qiskit import QuantumRegister, QuantumCircuit
qreg_q = QuantumRegister(2, 'q')
circuit = QuantumCircuit(qreg_q)

circuit.h(qreg_q[0])
circuit.cx(qreg_q[0], qreg_q[1])
circuit.cx(qreg_q[0], qreg_q[1])
