# Held-out evaluation

Verdict = ModelSim simulation against a Qiskit golden statevector computed from the
spec. No ground-truth .sv involved, so novel circuits score exactly like corpus ones.

## Head-to-head, identical held-out circuits

| circuit | spec | ARM 2 | corpus_v2 | input | checks |
|---|---|---|---|---|---|
| NC_01 | h0 sx1 swap | FAIL (32 port-not-found) | **PASS** | \|00> | 8/8 |
| NC_02 | — | — | EXCLUDED (H-bug) | — | — |
| NC_03 | h0 x0 cx01 | FAIL (wrong statevector) | **PASS** | \|11> | 8/8 |
| NC_04 | h0 x1 cx01 | FAIL (32 port-not-found) | **PASS** | \|01> | 8/8 |
| NC_05 | h0 cx10 | (not evaluable before) | **PASS** | \|00> | 8/8 |
| NC_06 | h0 x1 swap x1 | PASS (category 3) | **PASS** | \|00> | 8/8 |
| NC_07 | — | (excluded before) | **PASS** | \|10> | 8/8 |
| NC_08 | h0 sx0 | PASS | **PASS** | \|00> | 8/8 |
| NC_09 | x1 h0 | FAIL (32 port-not-found) | **PASS** | \|00> | 8/8 |
| NC_10 | h0 cx01 cx01 | PASS (vacuous) | **PASS** | \|00> | 8/8 |

    pass@1       9/9      (no repair round was needed by any circuit)
    pass@repair  9/9
    lint caught  0        (nothing to catch -- every first attempt was clean)
    excluded     1        NC_02, hardware H-bug, no H-safe discriminating input
    cost         in 33,805  out 29,185  thinking 46,407  (output-rate 75,592)

All four Arm-2 failures now pass. Two circuits that were not evaluable before are:
NC_05 (the cx-target bracket-rule fix corrected the oracle) and NC_07 (salvaged by
an explicit H-safe input).

Every generation "matches rulebook exactly" -- the derived module sequence and the
independent functional check agree on all nine.

## Why it moved (each cause was measured, then addressed)

| Arm-2 failure mode | count | corpus_v2 response |
|---|---|---|
| port-not-found (names without interfaces) | 3 | harvested interface doc, always injected |
| dropped permutation bracket on cx | 3 (all cx circuits) | composition rulebook states the cx-target rule |
| CompatiblePerm never retrieved | 0/7 queries | no embedding retrieval for critical knowledge |

Prompt size fell from ~14k tokens (Arm 2) to ~2.4k while carrying strictly more of
the knowledge that mattered. Input tokens per circuit roughly halved (7.6k -> 3.8k);
output-rate cost per circuit is unchanged (~8.4k).

## Validity controls

- HARNESS VALIDATED on known-good hardware in all three families: Circuit0_3 (2q,
  8 checks), QFT (3q, 16), Shor (5q, 64) -- 88 amplitude checks, all PASS.
- NEGATIVE CONTROL: NC_09's design judged against NC_10's golden, using a library
  superset so elaboration succeeds and only values can fail -> FAIL, 4 ok /
  4 mismatched. The statevector comparison genuinely discriminates.
- Inputs are chosen to be permutation-discriminating; a golden invariant under
  swapping states 1 and 2 would let wrong permutation wiring pass vacuously.

## Harness bugs found and fixed this round of work (all would corrupt results silently)

1. 1.0 IS NOT REPRESENTABLE in signed Q1.7. Driving 0x80 as "1.0" drove -1.0, which
   then hit the H-gate SplitMultiplier sign bug. Only the 8-bit (3q/5q) families were
   affected; Q2.14 spans [-2,2) so the 2q family was always fine. Now drives the
   largest representable positive value and scales the golden accordingly.
2. io_out_valid ASSERTS BEFORE DATA SETTLES in the QFT design. Sampling one clock
   after valid returned all-zeros from CORRECT hardware. Now waits for valid, then
   settles 128 clocks.
3. VERDICT CAPTURE was unreliable: run_modelsim.ps1 writes to the console stream, so
   two wrapper attempts reported "elaboration error" for runs that had PASSED.
   rag/simulate.py now reads ModelSim's own transcript file and refuses to guess.
4. Dependency scan required an uppercase module initial, silently omitting the five
   lowercase library modules; broke ANY circuit containing a permutation.
5. Artifact filenames keyed off the model-chosen top module name, which collides
   (three circuits all emitted "Circuit"). Now keyed off the spec.

## Local-model data point (not comparable, reported for honesty)

Qwen2.5-Coder-7B (Q4_K_M) on the same corpus_v2 prompt for NC_09 emitted one module
per gate and omitted the permutation brackets. Two lint-driven repair rounds, with
the exact composition deviation quoted back, did not correct it. Sufficient context
is not sufficient on its own -- it interacts with model capability. Confounded
between model size and quantization; directional only.
