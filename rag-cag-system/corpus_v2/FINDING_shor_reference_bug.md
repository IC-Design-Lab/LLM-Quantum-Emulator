# The Shor reference implementation is wrong (measured, not inferred)

## Claim

`corpus/code_examples/Shor/Shor_ground_truth.sv` leaves qubits 3 and 4 EXCHANGED.
Its final `CompatiblePerm_10` is one permutation too many. The correct composition is
15 instantiations, not 16.

## How it was found

`rag/permcat.py` measured what every CompatiblePerm variant does by driving a distinct
tag into each state index and reading where each tag lands -- no reliance on module
names. `rag/derive_rule.py` then replayed the ground-truth instantiation sequence while
tracking the running qubit layout:

    perm CompatiblePerm_1   swaps positions 0,2 -> layout [0, 3, 4, 1, 2]
    perm CompatiblePerm_4   swaps positions 1,3 -> layout [0, 1, 4, 3, 2]
    perm CompatiblePerm_9   swaps positions 2,4 -> layout [0, 1, 2, 3, 4]   <- identity
    perm CompatiblePerm_10  swaps positions 3,4 -> layout [0, 1, 2, 4, 3]   <- breaks it

The closing cascade reaches identity at `_9`; `_10` then undoes it.

## Why nobody noticed

The corpus test input |00010> is BLIND to a qubit3<->qubit4 exchange: its golden is
invariant under that swap, so the defect cannot show. Of the 32 basis inputs, 16 are
both H-safe and sensitive to it -- none had been used.

## Confirmation in ModelSim

| design | inst | input | result |
|---|---|---|---|
| ground truth | 16 | \|00010> | PASS 64/64 (blind to the defect) |
| ground truth | 16 | \|10000> | **FAIL** 60/64 |
| final perm removed | 15 | \|10000> | **PASS 64/64** |
| final perm removed | 15 | \|00010> | PASS 64/64 |

The four mismatches are exactly the predicted exchange: state 8 (01000) holds what
belongs at 16 (10000), and 23 (10111) holds what belongs at 15 (01111).

## Consequences

1. `Shor_ground_truth.sv` must NOT be used as a worked example for 5-qubit generation.
   It teaches a composition that produces incorrect hardware, and any system copying
   its structure inherits the defect.
2. The corrected reference is `rag/output_v2/ShorFixed.sv` (15 instantiations).
3. Structural comparison against this reference would have SCORED THE BUG AS CORRECT.
   Only functional verification against a Qiskit golden caught it -- and only from an
   input chosen to be sensitive. Test-input selection is part of the measurement.
4. Every future 5-qubit evaluation must use a swap-sensitive input.

## Method note

This defect was predicted by the derived rule BEFORE it was observed: the replay showed
a non-identity final layout, which prompted the search for a sensitive input. The rule
was derived from the same file it then falsified, which is only possible because the
permutation semantics were measured from hardware rather than read off the reference.
