# Provenance of the FPGA synthesis results

The synthesis numbers in this repository — Table IV of the paper, `paper/data/hardware.csv`,
and `rag-cag-system/results/vivado/` — were produced outside it. This file records how,
so the numbers can be read correctly and audited without the Vivado projects.

## Who ran them, and with what

| | |
|---|---|
| Run by | Spencer Buchanan, University of Houston–Clear Lake |
| Tool | Vivado v.2025.2.1 (as the reports record it) |
| Device | `xcu250-figd2104-2L-e` (Virtex UltraScale+ XCU250, the AMD Alveo U250) |
| Clock constraint | 4.000 ns on `clock` |
| Reports kept | post-route utilization, post-route timing summary, power; plus the synthesis-stage utilization and timing summary |
| Designs | 14, each in its own Vivado project |

The 70 report files are in `rag-cag-system/results/vivado/reports/<design>/`.

## One Vivado project per design, never batched

Batching the designs into one project breaks elaboration, for two reasons:

- **Top-level names collide.** Most 2-qubit tops are literally `module Circuit`, and two
  of the 5-qubit tops are both named `Shor`.
- **Library module names are reused at different widths.** `CompatiblePerm` exists in the
  2-, 3- and 5-qubit families with the same name and different port widths.

Each design was therefore elaborated alone, with its top module set explicitly. The top
module names are not uniform and do not follow the file names: `Circuit_03_v2.v`'s top is
`QuantumCircuit`, and `QFT_v2.v`'s top is `QFT_3Qubit_8bit`. The per-design table in
`rag-cag-system/results/vivado/synthesis-inputs/README.md` lists the top for each file.

## Each run compiled a design file and its support file together

Sources for one run were `designs/<stem>` **plus** `support/<stem>_gen_support.sv`.

- The files in `designs/` are **wiring-only top levels**: they instantiate library
  modules and chain their ports, and contain no gate logic. Synthesizing `designs/`
  alone black-boxes every instantiated module and produces meaningless numbers.
- The files in `support/` are **not ground truth**. Each is the verified gate library
  sliced down to exactly the gate and permutation modules that one design instantiates.
  There are 13, one per design that needs one.
- **`ShorFixed.sv` is the exception.** It is self-contained and defines all 55 of its own
  modules. It takes no support file; adding one fails compilation with duplicate modules.

## Out-of-context runs

**Three** designs were synthesized out-of-context: `G5_05_v2`, `ShorFixed` and
`V5_6_v2`. Each is a 5-qubit top level presenting 1,028 pins, against the 676 the
`xcu250-figd2104-2L-e` makes available, so the design cannot be placed with its I/O.

The evidence is the `Bonded IOB` row of each routed utilization report: it reads **0**
for exactly those three, and **260** for all eleven other designs, against 676 available.
`paper/data/hardware.csv` carries `out_of_context=True` for the same three, and
`paper/make_tables.py` reads that column rather than a hard-coded list.

Out-of-context runs give accurate **internal** timing, but that timing is not guaranteed
once the design is encapsulated by other circuitry. The three numbers are internally
valid and comparable with each other, and potentially optimistic in absolute terms. They
also report lower dynamic power than smaller in-context designs, because no I/O is
placed.

Composer authorship is not the reason. `U3_5_v2` was authored in IBM Quantum Composer
and was placed **in-context** (260 bonded IOBs); what forces an out-of-context run is the
pin count of a 5-qubit top level, not where the circuit came from.

## The Circuit 7 correction

A correction was issued for Circuit 7 after the first report package: its Fmax and its
latency in nanoseconds were slightly wrong in the first version and were superseded.
The figures in this repository are the corrected ones — Fmax 613.12 MHz and latency
16.31 ns, not the superseded 612.37 MHz and 16.33 ns. `rag-cag-system/results/vivado/README.md`
records the same re-run. Nothing else changed: the cycle count and the resource counts
were unaffected.

## What cannot be reproduced from this repository

**The synthesis results cannot be regenerated here.** The Vivado projects (`.xpr`), the
constraints file and any synthesis script were not retained; only the reports were. The
numbers in the paper can be re-read and re-parsed from the reports, and the parsing is
reproducible (`paper/make_tables.py` reads `paper/data/hardware.csv`, which
`paper/measure_cycles.py` writes from the reports), but the runs themselves would have to
be set up again from the inputs below.

## The exact inputs that were sent

`rag-cag-system/results/vivado/synthesis-inputs/` is the package that was handed over for
these runs: `designs/` (14 files), `support/` (13 files), `verification_manifest.json`,
and a `README.md` with the top-module table and the flow requirements. It is included so
the runs stay auditable without the project files. The support file for `QFT_v2` is
present, which identifies this as the final build rather than the earlier 12-file one.
