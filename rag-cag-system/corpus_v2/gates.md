# Gate reference — all families

One line per gate. Module names are harvested from verified hardware; a dash means
the gate DOES NOT EXIST in that family and a circuit using it there cannot be built.

| gate token | semantics | 2qubit-16bit | qft-3qubit-8bit | shor-5qubit-8bit |
|---|---|---|---|---|
| `h(qN)` | Hadamard on qubit N | `HGate2QubitVector16bit` | `HGate3QubitVector8bit` | `HGate5QubitVector8bit` |
| `x(qN)` | Pauli-X (NOT) | `XGate2QubitVector16bit` | — | — |
| `sx(qN)` | sqrt(X) | `SXGate2QubitVector16bit` | — | — |
| `sxdg(qN)` | sqrt(X)-dagger | `SXDGate2QubitVector16bit` | — | — |
| `swap(qA,B)` | exchange two qubits | `SWGate2QubitVector16bit` | `SWGate3QubitVector8bit` | — |
| `cx(qC,T)` | CNOT, control C target T | `CNGate2QubitVector16bit` | — | `CNGate5QubitVector8bit` |
| `cs(qA,B)` | controlled-S (phase i on \|11>) | — | `CSGate3QubitVector8bit` | — |
| `cp(pi/4)@qA,B` | controlled-T (phase e^{i pi/4} on \|11>) | — | `CTGate3QubitVector8bit` | — |

## Native orientations (verified against ground truth + ModelSim)

- `CNGate2QubitVector16bit` implements **cx(control=q1, target=q0)** natively.
  A spec `cx(q1,0)` instantiates it bare; a spec `cx(q0,1)` requires the
  CompatiblePerm bracket. (ModelSim-confirmed on circuit NC_05 — bracketing a
  cx(1,0) silently builds the OPPOSITE gate.)
- `SWGate2QubitVector16bit` implements swap(q0,q1) natively — never bracketed
  (a 2-qubit swap is position-symmetric).
- Single-qubit gate modules act on **qubit 0** natively; targeting any other
  qubit requires a permutation bracket.
- `cs`/`cp` are symmetric in their two qubits (phase gates); what matters is
  WHICH qubit pair, not direction. Native pair and 3q/5q orientation rules:
  see the family composition rulebook.

## Fixed-point formats

- `2qubit-16bit`: Q2.14 — 1.0 = 0x4000, 1/sqrt(2) = 0x2D41
- `qft-3qubit-8bit`, `shor-5qubit-8bit`: Q1.7 — 1.0 = 0x80, 1/sqrt(2) = 0x5B
