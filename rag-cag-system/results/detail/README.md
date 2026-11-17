# Detail

`../RESULTS.md` is authoritative. These are the working records behind it, kept because
several document harness defects that would otherwise be invisible in a summary — and a
result is only as trustworthy as the harness that produced it.

| file | covers |
|---|---|
| `held-out-evaluation.md` | The first held-out set, and the measured reasons the approach changed |
| `novel-2qubit-and-permutations.md` | Novel 2-qubit circuits, permutation semantics measured from hardware, and the reference defect |
| `family-2qubit.md` | The 2-qubit family, complete |
| `families-3qubit-5qubit.md` | The 3- and 5-qubit families |
| `consolidated-2qubit.txt` | Raw consolidated table, 2-qubit only |
| `consolidated-all-families.txt` | Raw consolidated table, all families |
| `per_circuit.txt` | Per-circuit dump |

The three table dumps are console output captured verbatim, including local absolute
paths. They are superseded by `../RESULTS.md` and by the `eval_v2_results_*.json` beside
it, which are the machine-readable records `consolidate.py` reads.

These files were written as work proceeded and have been renamed from a
date-based scheme to describe what they test. Content is unchanged apart from the
renaming and the cross-references it required.
