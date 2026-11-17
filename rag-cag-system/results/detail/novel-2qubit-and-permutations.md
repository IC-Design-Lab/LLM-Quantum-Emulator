# novel-circuit generalization, permutation semantics, reference defect

## 1. Novel 2-qubit circuits (12 circuits, 12 distinct bracket profiles)

The 9 corpus circuits span only FOUR bracket profiles and never exercise a leading
bracket, two separate bracket runs, or a run longer than 2. These 12 were authored to
cover exactly those gaps -- every one is a structural class no worked example
demonstrates.

| circuit | bracket profile | class | verdict |
|---|---|---|---|
| GEN_01 | brk1 free1 | leading bracket | PASS |
| GEN_02 | brk2 free1 | leading run of 2 | FAIL -- hardware, see below |
| GEN_03 | free1 brk1 free1 brk1 | TWO bracket runs | PASS |
| GEN_05 | free1 brk3 | run of THREE | PASS |
| GEN_06 | free1 brk3 free1 | run of 3 + swap | PASS |
| GEN_07 | free2 | bare native cx(1,0) | PASS |
| GEN_08 | free2 brk1 | native then bracketed cx | PASS |
| GEN_09 | free2 brk1 free1 | swap-separated bracket | PASS |
| GEN_10 | free4 | zero brackets, len 4 | PASS |
| GEN_11 | brk1 free1 brk1 | leading bracket + cx | PASS |
| GEN_12 | free1 brk1 free2 | bracketed then native cx | PASS |
| GEN_14 | free3 | swap between natives | PASS |

    pass@1  11/12       every generation matched the rulebook exactly
    cost    in 45,432  out 48,280  thinking 67,997  (output-rate 116,277)

Combined with the 9 held-out NC circuits: **20/21 functional PASS on circuits absent
from the corpus**, spanning 12 bracket profiles the corpus does not contain.

## 2. GEN_02 is a hardware defect, not a generation failure

The generated composition MATCHES THE RULEBOOK EXACTLY. It fails because of an
interaction between two library defects, established by isolation tests:

- `sx` alone vs Qiskit: PASS (8/8). `sxdg` alone: PASS (8/8).
- `sx` then `sxdg` (should be identity): returns **-I**, not I. A global phase the
  hardware introduces and Qiskit does not model. Physically -I == I.
- That negative amplitude then reaches the following H gate, whose `SplitMultiplier`
  zero-extends signed values, and the output saturates to -1.879 (0x87c3) where
  +0.707 (0x2d41) was expected.

**Consequence for the H-safety screen.** `rag/hsafe.py` reasons over Qiskit's exact
statevector, where `sx . sxdg = +I` and nothing goes negative -- so it certifies
GEN_02 as safe. The hardware disagrees. H-safety therefore CANNOT be decided from
Qiskit alone; any gate sequence that the hardware evaluates with an internal phase can
poison a downstream H. The screen is optimistic and must be described that way.

**Recommended (not yet implemented):** compare statevectors up to global phase, which
is the physically correct comparison. It does not change any result here -- GEN_02's
failure is saturation, not phase -- but it removes a class of false failures.

## 3. Permutation semantics measured, not read (rag/permcat.py)

All 13 CompatiblePerm variants across three families were recovered by driving a
distinct tag into every state index and reading where it landed. Every measured
permutation agrees with its module name -- but the check was worth running, because it
is what made section 4 possible.

## 4. Composition rules now derived for all three families (rag/derive_rule.py)

Replaying each reference sequence while tracking the qubit layout recovers the native
position of every gate module:

| family | native positions | consistent | final layout |
|---|---|---|---|
| 2qubit-16bit | h (0), x (0), swap (0,1) | yes | identity |
| qft-3qubit-8bit | h (0), cs (1,0), cp (1,0), swap (1,0) | yes | identity |
| shor-5qubit-8bit | h (0), cx (1,0) | yes | **NOT identity** |

The 2-qubit derivation independently rediscovers the already-known rule, which
validates the method. `cx` native at (1,0) independently confirms the cx(1,0)
orientation found earlier in ModelSim.

## 5. The Shor reference implementation is wrong

See corpus_v2/FINDING_shor_reference_bug.md. Summary: the closing cascade reaches the
identity layout at `CompatiblePerm_9`, and the final `CompatiblePerm_10` breaks it,
leaving qubits 3 and 4 exchanged. ModelSim confirms the 16-instantiation reference
FAILS from |10000> while the 15-instantiation correction PASSES, and that both pass
from |00010> -- the corpus input, which is blind to the defect.

Structural comparison against that reference would have scored the bug as correct.

## 6. Tooling defects fixed this round of work

- `rag/simulate.py` now takes a cross-process lock. ModelSim has ONE shared transcript
  and work library; two concurrent runs silently read each other's verdicts. This
  produced one bogus "no output" result before it was caught.
- `rag/eval_v2.py` now isolates each circuit and retries transient API failures. A
  single `httpx.RemoteProtocolError` plus an unrelated subprocess timeout had aborted a
  sweep and discarded seven already-billed generations; `--reuse` recovers them.
