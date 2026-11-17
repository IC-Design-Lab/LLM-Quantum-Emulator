# Results — RAG + CAG for quantum-circuit Verilog composition

One system, one evaluation. Per-circuit tables are in `detail/`; raw run records are
the `eval_v2_results_*.json` files beside this one.

## The system

    spec.py
      -> legality check          does every gate exist in this family?
      -> CAG  corpus_v2/         gate map, exact port lists, composition rulebook
                                 (~2.4k tokens, injected in full, every time)
      -> RAG  one worked example structurally matched, leave-one-out enforced
      -> generate               gemini-3.5-flash, temperature 0
      -> static lint            free; catches errors before a simulation is spent
      -> repair (<= 2 rounds)   driven by the lint findings
      -> functional verification ModelSim vs a Qiskit golden statevector

Correctness is decided by SIMULATION, not by comparison against a reference file.
The expected statevector comes from the Qiskit spec, so a circuit absent from the
corpus is scored exactly like one inside it, and a circuit wired differently but
computing the correct state passes.

    python rag/generate_v2.py <spec.py>     # generate
    python rag/eval_v2.py --specs "<glob>"  # generate + verify a set

## Result

| set | what it tests | pass |
|---|---|---|
| 2q corpus (leave-one-out) | cannot retrieve its own answer | 9/9 |
| 2q held-out | authored independently, never seen | 9/9 |
| 2q novel | structural classes absent from the corpus | 11/12 |
| 3q novel | QFT family: h, cs, cp, swap | 7/8 |
| 5q novel | Shor family: 32-state vectors | 5/5 |
| 3q+5q supplied | user-authored, delivered as `.qpy` | 12/12 |

    circuits scored                    55
    functional PASS                    53/55  (96%)
    failures attributed to GENERATION  1   (G3_06, found by the covering re-check)
    failures attributed to HARDWARE    1   (GEN_02)
    generation attempts per circuit    1.07
    cost                               1.12M output-rate tokens

CORRECTED 2026-09-17: this was 54/55 with no generation failure. That count scored
every circuit from one screened input. Re-simulating the 25 scored 3- and 5-qubit
designs from H-safe inputs that jointly detect every qubit transposition
(`python paper/coverage_check.py --cover` -> `paper/data/coverage.csv`) fails
`G3_06`: spec `swap(0,1) h(0)`, emitted `SWGate, CompatiblePerm_2, HGate`, so
`CompatiblePerm_2` cancels the swap -- the G3_01 defect. `|000>` cannot see it; `|001>`
is wrong by 91 LSB. The other 24 match with no component more than 1 LSB off.
`rag/consolidate.py` applies the downgrade from the CSV; the result JSONs are unchanged.

The same script (`--v56`) verifies the `V5_6` route: with the route removed, the
design is 91-92 LSB off from `|00100>` and `|01000>`; as generated it is at most 2 LSB
off (8-bit Hadamard rounding). See `paper/data/v56_route.csv`.

## Generalization is measured, not asserted

Each 2-qubit circuit has a BRACKET PROFILE -- the pattern of where the hardware needs
permutation wrappers. The nine corpus circuits span FOUR profiles; the evaluation
covers SIXTEEN. Twelve appear in no example the retriever can reach, including every
case where copying the nearest example would be wrong: leading brackets, two separate
bracket runs, runs of three, long unbracketed sequences.

## Why it works: context sufficiency, not retrieval quality

| measured failure | change |
|---|---|
| the critical permutation document was retrieved in **0 of 7** queries; 2 of 5 slots went to a gate with no hardware and to a file discarded during assembly | stop using similarity search for essential knowledge -- inject the whole family context |
| 3 circuits failed with 32 port errors each: names without interfaces | port lists harvested from verified hardware, always included |
| all 3 CNOT circuits dropped their permutation wrappers -- no document stated the rule | a composition rulebook, derived by measuring the hardware |
| a local 7B model lost the structure inside 179 lines of port connections | worked examples condensed to the module sequence plus one formatting sample |

The resulting prompt is ~6x smaller than the retrieval-heavy version while carrying
strictly more of the knowledge that mattered.

### Which context is load-bearing — ablated, not assumed

Same nine held-out circuits, same model and temperature, one section withheld per run.

| condition | interface knowledge from | pass@1 | lint errors, attempt 1 | final |
|---|---|---|---|---|
| full context | document + example | 9/9 | 0 | 9/9 |
| minus interfaces | example only | 9/9 | 0 | 9/9 |
| minus rulebook | document + example | 9/9 | 0 | 9/9 |
| minus example | document only | 9/9 | 0 | 9/9 |
| **minus example AND interfaces** | **neither** | **0/9** | **5–17 each** | **9/9** |

Three results, and only the third is the one we set out to find.

**Interface knowledge is necessary, and it is supplied twice.** Every single-section
ablation is null because the port list appears both in the interfaces document and in
the worked example's verbatim instantiation block. Remove both and every generation is
statically wrong on the first attempt. The redundancy is why removing either alone
costs nothing -- which is a fact about the prompt's design, not evidence that context
does not matter.

**The composition rulebook is NOT required at 2 qubits.** Withholding it changes
nothing: 9/9, zero lint errors, every generation still matching the derived rule. At
this width the composition is evidently recoverable from the example alone. This does
not transfer to the wider families, where the rulebook carries facts no example
demonstrates -- notably the route around the missing 2/3 permutation.

**Lint-driven repair recovers completely from total interface ignorance.** In the
condition where the model has never been shown a port name, it invents plausible ones,
the lint catches all 5-17 of them against the harvested catalog, and one repair round
returns 9/9. The strongest evidence for the repair loop came from the condition built
to break it.

The claim this supports is therefore narrower than "context beats retrieval": interface
knowledge must be present somewhere, the system provides it redundantly, the rulebook
is not load-bearing at 2 qubits, and static lint plus one repair round is enough to
recover when the knowledge is absent entirely.

### The rulebook IS load-bearing at 5 qubits

The 2-qubit null above is width-dependent. Repeating it on the widest family, on the
one circuit where the rulebook demonstrably carries information no example does:

| circuit | with rulebook | without |
|---|---|---|
| `G5_01` `h cx(0,1)` control | PASS 64/64 | PASS 64/64 |
| `V5_1` `h cx(1,0) cx(2,0)` control | PASS 64/64 | PASS 64/64 |
| `V5_2` `h(q1) cx(2,1)` control | PASS 64/64 | PASS 64/64 |
| **`V5_6` `h(q2) h(q3) h(q0)`** | **PASS 64/64** | **FAIL — will not compile** |

`V5_6` is the circuit whose residual layout is the qubit-2/3 exchange, the one
transposition with no module. The worked example cannot teach the workaround: Shor's
closing cascade is `_1, _4, _9, _10` and the `_9, _10, _9` triple appears nowhere in
it. Only the rulebook states it.

**The predicted failure did not happen.** Without the rulebook the model did not invent
`CompatiblePerm_7`. It adopted a different strategy entirely -- undo each permutation
immediately rather than accumulate and close, 7 instantiations instead of 9 -- which
never needs the 2/3 exchange at all. That strategy is sound in principle; the
generation failed on a duplicate wire declaration.

So the honest reading is weaker than "the model cannot route around the gap without
being told". What is measured: the rulebook changes which composition strategy the
model adopts, and on this circuit the alternative produced code that does not compile,
while the three controls were unaffected. n = 1 on the failure, and the mechanism is
a naming collision rather than a knowledge gap, so this is evidence that the document
matters at width, not proof of why.

## Two defects found in the reference hardware

**The 5-qubit reference is wrong.** It ends with one permutation too many and leaves
qubits 3 and 4 exchanged. Undetected because the project's test input is invariant
under that exchange. Confirmed in simulation: 16 instantiations FAIL from a sensitive
input; the same circuit minus the final permutation PASSES all 64 checks.
*Structural comparison against that reference would have scored the defect as correct.*

**The variant-numbering gap is a capability hole.** Measuring every permutation module
shows the 5-qubit family provides 9 of 10 possible qubit exchanges, and the missing one
sits exactly in the numbering gap. A legitimate circuit can need an exchange the
hardware cannot perform directly; knowing the legal names does not help, the model must
route through an intermediate qubit.

## Input format: `.qpy` reaches the system identically to `.py`

Circuits arrive either as Python specs or as `.qpy`, Qiskit's binary serialisation --
what Composer and hardware jobs export. A container holds many circuits, so `#N`
selects one.

A sample of 16 `.qpy` files holds **128 circuits, 9 structurally distinct** -- batch
output, 119 repeats. Those 9 are the 2-qubit corpus re-serialised, which is what makes
them the right set for an equivalence test rather than a coverage claim:

| check | result |
|---|---|
| canonical text, signature, retrieved example vs the `.py` original | 9/9 identical |
| full pipeline, generate through ModelSim | **9/9 PASS**, 8/8 checks each |
| attempts | 9/9 at pass@1, no repair, no lint error |

Every generation matched the rulebook exactly. Reading a circuit from binary changes
nothing about how it is scored, so results from the two formats can be reported
together. Cost: 86k output-rate tokens.

A second `.qpy` set was then supplied from outside the project -- twelve circuits
written in IBM Quantum Composer, six 3-qubit and six 5-qubit, none of them seen
before. **12/12 PASS**, 11 at pass@1; the one repair fixed genuinely unconnected
ports. These are the first circuits in the evaluation the system never had a hand in
choosing.

**The missing permutation is handled, not memorised.** One supplied circuit --
`h(q2) h(q3) h(q0)` -- leaves the layout needing exactly the qubit-2/3 exchange, the
one transposition with no hardware module. The generated closing cascade is
`CompatiblePerm_9, CompatiblePerm_10, CompatiblePerm_9`: the route through qubit 4.
The model did not invent `CompatiblePerm_7`; it composed the workaround, and the
result passes 64/64. No prior circuit had exercised this.

### QFT itself, generated without any example

QFT is the one 3-qubit corpus circuit, so leave-one-out leaves its family with no
worked example at all -- which is why it was never in the scored set, and why
generating it is the harshest single-circuit test available: composition rulebook and
interfaces only, nothing to imitate.

Generated at attempt 1, lint clean, and the 13-instantiation module sequence is
**identical to the verified reference, including the choice of permutation variant at
every position** (`rag/output_v2/QFT_v2.v` vs the top level of
`corpus/code_examples/QFT/QFT_ground_truth.sv`).

This is a structural verdict, not a functional one: QFT cannot be simulated against
its golden because its controlled-phase gates trigger the Hadamard sign bug
(limitation 4). It is therefore reported here, outside the 55-circuit functional
count.

## Synthesis: the generated hardware is the reference hardware

All 14 designs were synthesised and routed in Vivado 2025.2 for `xcu250-figd2104-2L-e`
at a 4.000 ns constraint. Raw numbers and the full caveats are in
[`vivado/`](vivado/).

**10 of 11 cycle counts match the verified reference exactly.** None is longer, and
`ShorFixed` is one cycle SHORTER because it drops the redundant permutation. The
reference is not merely wrong; it is also a cycle slower.

Both columns are measured by `paper/measure_cycles.py` under one procedure rather than
transcribed from two sources, which is what changed this from the 7 exact / 3 longer
that `vivado/comparison.csv` shows. The three formerly-longer rows are `Circuit_02`,
`Circuit_03` and `Circuit_07`; the poster's Chisel figure is the only source that puts
them one lower, and their module sequences are identical to the reference top level,
instantiation for instantiation. On a fixed-latency library that identity forces equal
cycle counts, which is what measurement finds. See [`vivado/README.md`](vivado/README.md)
and `paper/data/cycles_check.txt`.

**On these 11 circuits the numbers are identical to the prompt-only baseline** -- same
cycles, same LUTs, same FFs. That is expected: the baseline arm had the gate library
attached, and library-attached generation was already conformant. The contribution shows
in `ShorFixed`, and in the three designs with no reference counterpart -- including
`V5_6_v2`, which routes around the missing qubit-2/3 module.

Two measurement cautions carry into any table built from this. The 5-qubit designs had
to be run out-of-context: a 5-qubit top level needs 1,028 pins against the part's 676.
And `latency_ns` is derived as `cycles / Fmax`, so it inherits place-and-route noise --
a re-run moved one design's Fmax by 0.75 MHz with no design change. Cycle counts and
resource counts are the stable quantities.

## Limitations

1. Two rulebooks were revised mid-evaluation. Each fixed a genuine ambiguity in prose
   we had written, not a tuned rule. The first was then tested out-of-sample -- the
   5-qubit family had never seen the revised wording and passed 5/5. The second has no
   untested family remaining. CORRECTED 2026-09-17: only four 3-qubit circuits (G3_01,
   02, 03, 07) were generated under the revised wording; G3_04, 05, 06, 08 predate it
   (their prompts lack it) and were not regenerated. G3_06 repeats the defect.
2. The composition rules were derived by hand from hardware measurement: domain-informed,
   not generic. They also work -- the 2-qubit derivation independently rediscovered the
   known rule, and the 5-qubit derivation predicted a defect before it was observed.
3. Three circuits are outside the 55. NC_02 has no input that is both H-safe and
   discriminating, G5_03 exceeds the model's output limit, and the full 3-qubit QFT is
   left unscored by the same screen that excludes NC_02 (limitation 4 below). The first
   two carry EXCLUDED/ERROR records in the result JSONs; the QFT was never entered into
   a scored set, which is why only two exclusions appear there. All three are measured,
   not assumed.
4. The QFT circuit itself is not scored: no input is both H-safe and discriminating for
   it, so the screen excludes it. CORRECTED 2026-09-15: the earlier wording blamed "a
   sign bug in the Hadamard hardware", but the 8-bit Hadamard sign-extends
   (QFT_ground_truth.sv:22) and the zero-extension defect exists only in the 16-bit
   family. The screen applies its rule to every family, so this exclusion is
   conservative and the circuit may in fact be evaluable -- worth re-testing.
5. Single model at temperature 0, one run per circuit. CORRECTED 2026-09-15:
   determinism was NOT established. The only recorded check was one pair from the
   superseded retrieval arm. Under the current pipeline, four regenerations from
   byte-identical prompts give three identical files and one different (G3_03,
   2026-08-24 vs 08-25: 245 vs 303 lines, same module sequence). No cross-model claim
   is supported either.
6. At 5 qubits, OUTPUT LENGTH is the binding constraint, not reasoning: each
   instantiation carries 132 port connections, 128 of them amplitude ports (counted
   from rag/output_v2/V5_6_v2.v; the earlier figure of 64 counted one direction).
   Emitting the module sequence and expanding it mechanically would cut output ~10x
   and remove this ceiling.
7. The lint was wrong once, in the system's own favour and against it. Its chain check
   compared signal lists positionally, so it rejected every 3-qubit circuit containing a
   CS gate -- a gate that genuinely lacks two input ports and therefore cannot consume
   all of the preceding stage's outputs. Three circuits burned all three attempts on
   this, and the repair made attempt 2 worse than attempt 1. Verdicts were unaffected:
   they still passed simulation once the repairs ran out. The three were re-run after
   the fix and each now passes at the first attempt with a clean lint, which is what
   moved attempts-per-circuit from 1.18 to 1.07 (65 pre-fix attempts over 55 circuits;
   the 1.19 given here previously was a rounding of the same records). The lesson is
   that a static check
   which cannot be satisfied is indistinguishable from one that is never satisfied,
   unless something independent decides correctness -- here, the simulation did.
8. The 30 2-qubit verdicts still rest on one screened input. G3_06 shows such an input
   can pass a wrong design; the covering re-check (paper/coverage_check.py --cover) was
   run only at 3 and 5 qubits.
