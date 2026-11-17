# the 2qubit-16bit family, complete

Verdict is FUNCTIONAL throughout: ModelSim against a Qiskit golden statevector
computed from the spec. No ground-truth .sv is consulted, so corpus and novel
circuits are scored identically. Full per-circuit table: consolidated-2qubit.txt

## Result

| set | what it tests | circuits | pass@1 |
|---|---|---|---|
| CORPUS (leave-one-out) | cannot retrieve its own answer | 9 | **9/9** |
| HELD-OUT (NC, authored in IBM Quantum Composer) | never seen, independent author | 9 | **9/9** |
| NOVEL (GEN, built to cover missing profiles) | bracket structures the corpus lacks | 12 | **11/12** |

    circuits scored                  30
    functional PASS                  29/30  (97%)
    failures attributed to GENERATION 0
    failures attributed to HARDWARE   1
    PASS excluding hardware defects   29/29 (100%)
    generation attempts per circuit   1.00   -- no repair round was ever needed
    cost   in 113,439  out 110,439  thinking 165,944  (output-rate 276,383)

Every one of the 29 passes also "matches rulebook exactly": the rule-derived module
sequence and the independent functional check agree on all of them.

## Generalization is measured, not asserted

The evaluation covers **16 distinct bracket profiles**. The 9 corpus circuits span
only **4**. Twelve profiles therefore appear in NO worked example available to the
retriever, including every case where copying the retrieved example would be wrong:

| profile | first seen in | why it is hard |
|---|---|---|
| `brk1 free1` | GEN_01, NC_09 | LEADING bracket — every corpus circuit opens with a free gate |
| `free1 brk1 free1 brk1` | GEN_03, NC_06 | TWO separate bracket runs — corpus has at most one |
| `free1 brk3` / `free1 brk3 free1` | GEN_05, GEN_06 | run of THREE — corpus maximum is two |
| `free3`, `free4` | GEN_14, GEN_10 | long all-native runs, zero brackets |
| `brk1 free1 brk1` | GEN_11 | leading bracket AND a second run |

A system that only worked on CORPUS would be memorising. Passing 11/12 on profiles the
corpus does not contain is composition.

## The single failure is hardware, and it is proven

GEN_02's composition MATCHES THE RULEBOOK EXACTLY; it fails in simulation. Isolation
tests establish why:

- `sx` alone vs Qiskit: PASS. `sxdg` alone: PASS.
- `sx` then `sxdg` (mathematically identity) returns **-I** — a global phase the
  hardware introduces and Qiskit does not model. Physically -I and I are the same state.
- That negative amplitude then reaches the following H gate, whose `SplitMultiplier`
  zero-extends signed values, and the output saturates (0x87c3 = -1.879 where 0x2d41 =
  +0.707 was expected).

So the generation is correct and the hardware is not. Counting this as a generation
error would overstate the system's error rate AND hide a real library defect.

**This also bounds the H-safety screen.** `rag/hsafe.py` reasons over Qiskit's exact
statevector, where `sx . sxdg = +I` and nothing is negative — so it certifies GEN_02 as
safe. The hardware disagrees. H-safety cannot be decided from Qiskit alone; the screen
is OPTIMISTIC and must be described that way. Deciding it soundly needs either a
hardware-phase model or empirical per-circuit screening.

## Cost

276,383 output-rate tokens for the complete 30-circuit family, ~9.2k per circuit.
Prompts are ~2.4k tokens (Arm 2 used ~14k) while carrying strictly more of the
knowledge that mattered.

## Honest limitations

1. One family. 3q is largely unevaluable on this hardware (QFT is H-unsafe from every
   discriminating input); 5q needs the corrected reference (FINDING_shor_reference_bug).
2. The composition rulebook was derived by hand from ground truth and is
   domain-informed, not generic structural similarity.
3. Amplitude comparison is exact-to-tolerance, not up-to-global-phase. That is
   physically stricter than necessary and can produce false failures; it did not
   change any result here, since GEN_02 fails by saturation rather than phase.
4. Single model, temperature 0. Determinism verified, so one call per circuit is
   sufficient, but no cross-model claim is supported. A local 7B failed the same
   prompts (see held-out-evaluation), which is evidence that context does not substitute
   for capability.
