# Composition rules — family `2qubit-16bit`

How to turn a gate sequence into a top-level module. These rules reproduce all nine
verified ground-truth circuits exactly — every module, in every position — computed
from the specification alone.

## 1. Which gates need a permutation bracket

Library gate modules act on a fixed native qubit position. A gate whose spec target
differs from the native position must be surrounded by a permutation that moves the
state into place and another that moves it back.

A gate needs a bracket **iff**:

| gate | needs bracket? |
|---|---|
| single-qubit gate on **q0** (`h(q0)`, `x(q0)`, `sx(q0)`, `sxdg(q0)`) | **no** — native |
| single-qubit gate on **q1** (`h(q1)`, `x(q1)`, `sx(q1)`, `sxdg(q1)`) | **yes** |
| `swap(q0,1)` | **no** — position-symmetric |
| `cx(q1,0)` (control q1, target q0) | **no** — native orientation of CNGate |
| `cx(q0,1)` (control q0, target q1) | **yes** |

The `cx` rule is about the TARGET qubit, not about `cx` being two-qubit. Bracketing a
`cx(q1,0)` would build the opposite gate — wrong hardware that still looks structurally
plausible.

## 2. Hoisting — consecutive bracketed gates share ONE pair

Do **not** wrap each bracketed gate individually. Group the gate list into maximal runs
of consecutive bracket-needing gates; each run gets exactly one opening and one closing
`CompatiblePerm`.

```
h(q0)  x(q1)  h(q1)  swap(q0,1)
 free   -- bracketed run --   free

-> HGate  CompatiblePerm  XGate  HGate  CompatiblePerm  SWGate      (6 instantiations)

NOT: HGate  Perm XGate Perm  Perm HGate Perm  SWGate                (8 -- wrong)
```

Instantiation count is therefore:

```
count = (number of gates) + 2 x (number of maximal bracketed runs)
```

## 3. The permutation module

At top level, permutations are **always** `CompatiblePerm`. Never instantiate
`SwapPosition2and1atSize4` or `rearrangeTo1stPosition` directly — they use a different
(`io_*_ket_*`) interface and are internal to `CompatiblePerm`. See the interfaces
document.

This family has exactly one permutation (swapping the two qubits' roles), so there are
no numbered `CompatiblePerm` variants here. Numbered variants exist only in the 3-qubit
and 5-qubit families.

## 4. Wiring — a pure feed-forward chain

The top level is a straight chain. No wire crossing at this level: permutation happens
*inside* `CompatiblePerm`.

- Instance k reads instance k-1's outputs.
- Instance 0 reads the top-level inputs (`io_in_QSV_*`, `io_in_valid`).
- The last instance drives the top-level outputs (`io_out_QSV_*`, `io_out_valid`).
- `clock` and `reset` go to every instance.

Naming used by the reference hardware: instances are `m`, `m_1`, `m_2`, ...; instance
k's output bus is `_m_k_io_out_QSV_<state>_<component>` plus `_m_k_io_out_valid`.
Wire declarations are emitted in descending instance order, omitting the last instance
(which drives the top-level ports directly).

## 5. Worked derivation

Spec:

```
qubits: 2
gates:
  h(q0)
  x(q1)
  sxdg(q1)
  swap(q0,1)
```

| gate | target | bracket? |
|---|---|---|
| `h(q0)` | q0, single-qubit | no |
| `x(q1)` | q1, single-qubit | yes |
| `sxdg(q1)` | q1, single-qubit | yes |
| `swap(q0,1)` | swap | no |

Runs: `[free] [bracketed x2] [free]` -> 1 bracketed run.
Count: 4 gates + 2 x 1 = **6**.

```
  HGate2QubitVector16bit    m
  CompatiblePerm            m_1
  XGate2QubitVector16bit    m_2
  SXDGate2QubitVector16bit  m_3
  CompatiblePerm            m_4
  SWGate2QubitVector16bit   m_5
```

## 6. Quick checks before emitting

1. Every instantiated module appears in the interfaces document's instantiable list.
2. Every port name matches the interface exactly — all 20, none invented, none omitted.
3. Instantiation count equals `gates + 2 x runs`.
4. Non-permutation instantiations appear in the same order as the spec's gates.
5. Instance k's inputs are instance k-1's outputs; first reads top-level in; last
   drives top-level out.

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
