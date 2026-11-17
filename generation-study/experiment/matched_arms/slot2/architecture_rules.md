# Architecture Rules — Quantum State-Vector Simulation Hardware (2-qubit, 16-bit)

## Wrapper rule
Instantiate ONLY the *2QubitVector16bit wrapper modules and CompatiblePerm.
Never instantiate primitive gates (HadamardGate, SwapGate, ControlledNotGate, ...) directly.

## Permutation rule
Insert a CompatiblePerm instance immediately BEFORE and immediately AFTER any gate
whose target qubit is NOT qubit 0. Gates targeting qubit 0, and gates acting on the
full vector (SWAP), need no permutation.
Consecutive gates on the SAME non-zero target share ONE perm bracket:
[perm] gateA -> gateB [perm]  (not [perm]A[perm][perm]B[perm]).

## Valid-signal chain
Stage 0's io_in_valid connects to the top-level io_in_valid. Each later stage's
io_in_valid connects to the PREVIOUS stage's io_out_valid. The final stage's
io_out_valid drives the top-level io_out_valid. No extra logic on the valid path.

## Wiring
First stage inputs connect directly to top-level io_in_QSV ports; last stage outputs
connect directly to top-level io_out_QSV ports. Intermediate wires:
_m_io_out_QSV_X_Y for instance m, then _m_N_io_out_QSV_X_Y for instance m_N.
Also declare matching _m_N_io_out_valid wires. Name instances m, m_1, m_2, ... in
pipeline order.

## Encoding
2-qubit QSV: QSV_0=|00>, QSV_1=|01>, QSV_2=|10>, QSV_3=|11>.
Each amplitude = two 16-bit signals: suffix _0 = real, _1 = imaginary.
Fixed point Q1.15-style with 1.0 = 0x4000, +1/sqrt2 = 0x2D41, -1/sqrt2 = 0xD2BF,
+1/2 = 0x1FFF, -1/2 = 0xE001.  (Q1.15-vs-Q2.14 label: confirm with library owner.)

## Output requirements
Named port mapping only. No initial blocks, no hardcoded delays (#), no
$display/$monitor, no unused/dead wires.
