# Vivado synthesis and place-and-route

Post-route results for the 14 generated designs, and their comparison against the two
baselines the poster reports.

| file | contents |
|---|---|
| `rag_cag_designs.csv` | the 14 RAG+CAG designs: LUTs, FFs, DSPs, power, Fmax, latency |
| `comparison.csv` | the 11 rows with a reference counterpart, three arms side by side |

## Flow

Run by Spencer Buchanan (UHCL). **Vivado 2025.2**, part **`xcu250-figd2104-2L-e`**
(Virtex UltraScale+ XCU250, the device on the Alveo U250), clock `clk` constrained at
**4.000 ns / 250 MHz**. Same part and flow as the earlier baseline runs, so the columns
are comparable.

These are post-route reports for a part, not a deployment: no board file, nothing loaded
onto hardware.

## Result: 10 of 11 cycle counts match the reference exactly

The cycle columns in `comparison.csv` come from two different sources: `chisel_cc` is
transcribed from the poster, `prompt_only_cc` and `rag_cc` from Spencer's runs.
`paper/measure_cycles.py` re-measures **both** columns under one procedure — ModelSim,
first `io_in_valid` edge to first `io_out_valid` edge, applied to the reference `.sv`
and to the generated design alike — and writes `paper/data/cycles.csv`. Compared on
equal terms:

| | count |
|---|---|
| exact match | **10** |
| one cycle longer | 0 |
| one cycle shorter | 1 — `ShorFixed`, by design |

Those measurements sit one cycle above this directory's CSVs on every row of
`comparison.csv` — a counting convention, i.e. which edge the interval starts on. Being
constant, it cancels in every reference-to-generated comparison. `make_tables.py`
re-checks the same offset across all 14 rows of `rag_cag_designs.csv` and stops if it is
not constant, since a difference that varied by design would not be a convention.
`paper/data/cycles_check.txt` holds the row-by-row reconciliation.

**The three rows previously reported as one cycle longer are exact.** For `Circuit_02`,
`Circuit_03` and `Circuit_07` the poster's `chisel_cc` figures (9, 10, 9) are the only
source that disagrees: the measured reference, the measured generated design, and the
poster's own `prompt_only_cc` column all give one more. This resolves what an earlier
version of this file recorded as an extra cycle whose cause "is not established" — there
was no extra cycle. It also removes the tension in that finding, since those three
designs instantiate the same modules in the same order as their references:

```
Circuit_02  H PERM H PERM SW        Circuit_03  H PERM X H PERM SW
Circuit_07  H PERM CN PERM H
```

and on a fixed-latency library identical sequences cannot take different numbers of
cycles. `make_tables.py` verifies that equal cycle counts and identical module sequences
pick out exactly the same 10 designs.

`ShorFixed` is one cycle faster than its reference because it *is* that reference less
one trailing `CompatiblePerm_10` instantiation — the redundant final permutation (see
`../../corpus_v2/FINDING_shor_reference_bug.md`). It is correct *and* a cycle faster.

## Three cautions before quoting these numbers

**The 5-qubit designs were run out-of-context, and had to be.** A 5-qubit top level
needs 32 states x 2 fields x 8 bits x 2 directions + 4 (`clock`, `reset`, `io_in_valid`,
`io_out_valid`) = **1,028 pins**; the XCU250
offers 676. `G5_05_v2`, `ShorFixed` and `V5_6_v2` are flagged `out_of_context=yes` in
the CSV. Internal timing is accurate; it is not guaranteed once the design is wrapped in
other logic. The reference Shor column faces the same limit, so it must have been
produced the same way — confirm before publishing that comparison.

**`latency_ns` is derived, not measured**: `cycles / Fmax x 1000`, exact for all 14 rows.
It therefore inherits Fmax's place-and-route noise. A re-run of `Circuit_07_v2` moved
Fmax 612.37 -> 613.12 MHz and latency 16.33 -> 16.31 ns with no design change. **Cycle
counts and resource counts are the stable quantities; Fmax and nanoseconds are not.**

**QFT's resources disagree with the reference even though its module sequence is
identical** — 1,273 LUTs / 1,940 FFs / 52 DSPs against 3,573 / 2,452 / no DSPs. The
reference build is not inferring DSPs and pays in LUTs instead. That is a synthesis
difference, not a design difference, and should not be read as the generated design
being smaller.

## What the comparison does and does not show

On the 11 original circuits the RAG+CAG numbers are **identical to the prompt-only
column** — same cycle counts, same LUT and FF counts, the same three one-cycle misses.
That is expected rather than disappointing: the prompt-only arm those numbers come from
had the gate library attached, and library-attached generation was already conformant.

These 11 circuits are not where the system's contribution lies. That shows in
`ShorFixed` (correct and a cycle faster than the published reference) and in the three
designs with no reference counterpart at all — `G5_05_v2`, `U3_5_v2`, and `V5_6_v2`,
which exercises the one qubit exchange the hardware has no module for.
