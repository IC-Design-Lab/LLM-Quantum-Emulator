# NC_06 -- built in IBM Quantum Composer. TWO separate bracket runs.
from qiskit import QuantumRegister, ClassicalRegister, QuantumCircuit

qreg_q = QuantumRegister(2, 'q')
creg_c = ClassicalRegister(4, 'c')
circuit = QuantumCircuit(qreg_q, creg_c)

circuit.h(qreg_q[0])
circuit.x(qreg_q[1])
circuit.swap(qreg_q[0], qreg_q[1])
circuit.x(qreg_q[1])
