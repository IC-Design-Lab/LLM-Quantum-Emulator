# NC_09 -- IBM Composer. Leading bracket: perm is the FIRST instantiation.
from qiskit import QuantumRegister, QuantumCircuit
qreg_q = QuantumRegister(2, 'q')
circuit = QuantumCircuit(qreg_q)

circuit.x(qreg_q[1])
circuit.h(qreg_q[0])
