# Composition rules — family `qft-3qubit-8bit`

Every fact below is MEASURED from the verified hardware: each permutation was
recovered by driving a distinct tag into every state index and reading where it
landed, and the native gate positions were recovered by replaying the reference
circuit while tracking the qubit layout.

## The model

The state vector is a fixed array of amplitudes. A gate module is hard-wired to
act on FIXED PHYSICAL SLOTS. To apply a gate to logical qubits that are not
currently in those slots, permute them in, apply the gate, and (when needed)
permute back. `CompatiblePerm` variants are the only way to move qubits.

## Native positions (which physical slots each gate module acts on)

- `h` acts natively on physical position(s) **(0,)**
- `cs` acts natively on physical position(s) **(1,0)**
- `cp` acts natively on physical position(s) **(1,0)**
- `swap` acts natively on physical position(s) **(1,0)**

Physical position 0 is the least-significant qubit index, matching Qiskit.

## Permutation catalog (measured)

| module | exchanges qubits |
|---|---|
| `CompatiblePerm_2` | 0 and 1 |
| `CompatiblePerm_1` | 0 and 2 |
| `CompatiblePerm` | 1 and 2 |

## Procedure

1. Start with the identity layout: logical qubit i sits at physical slot i.
2. For each gate in spec order:
   a. Find where its logical targets currently sit.
   b. If they are already on the native slots, instantiate the gate module bare.
   c. Otherwise instantiate the `CompatiblePerm` variants that move them onto
      the native slots, then the gate module.
3. After the last gate, append whatever permutations restore the IDENTITY
   layout, so the output amplitudes are in the standard order.

## `swap` is a GATE, not a layout change (read this carefully)

Two different things can exchange qubits, and they must never be confused:

- A `swap` GATE in the specification is part of the circuit's logic. It is realised by
  instantiating the family's SW gate module. It does NOT change the layout bookkeeping
  and must NOT be compensated for afterwards.
- A `CompatiblePerm` is bookkeeping only. It exists solely to move logical qubits onto
  the physical slots a gate module is hard-wired to use.

Track the layout ONLY through the `CompatiblePerm` instantiations you add yourself.
Applying a SW gate module leaves the layout exactly as it was.

Appending a permutation "to undo" a specification `swap` produces hardware that
computes the wrong state: the logical swap is cancelled and two amplitudes come out
exchanged.

## The identity requirement is not optional

The final layout MUST be the identity. If it is not, the circuit computes the
right state in the wrong basis order and every amplitude lands in the wrong
output port.

## Reference circuit

`QFT` implements `h(q0) cs(q1,0) cp(pi/4)@q2,0 h(q1) cs(q2,1) h(q2) swap(q0,2)` in 13 instantiations.
