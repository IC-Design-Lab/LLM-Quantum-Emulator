# Vivado test package — LLM-Quantum-Emulator generated designs

14 SystemVerilog designs for synthesis + place-and-route. Each design is a top-level
that only INSTANTIATES library modules; the library each one needs is in `support/`.

## How to run one design

Sources for a run = `designs/<file>` + its matching `support/<file>` (same stem).
`ShorFixed.sv` is self-contained (no support file). Set the design's top module from
the table below. The clock port is `clock`, reset is `reset`.

Target and flow MUST match the earlier `quantum_reports` runs or the comparison
columns are invalid:

- part: `xcu250-figd2104`
- same synthesis/implementation strategy and constraints as the earlier
  Circuit_*/QFT/Shor `python_full` runs
- report: post-route utilization (LUT/FF/DSP), post-route timing (Fmax/WNS), power

Latency in the paper = cycle count x clock period. Cycle counts come from
SIMULATION, not Vivado (same method as the existing poster numbers). Only the
Vivado side is needed here.

## The designs

| file | top module | support file | comparison row | verification |
|---|---|---|---|---|
| `Circuit_00_v2.v` | `Circuit` | `Circuit_00_v2_gen_support.sv` | Circuit0_06 | PASS (fresh, 8/8 checks) |
| `Circuit_01_v2.v` | `Circuit` | `Circuit_01_v2_gen_support.sv` | Circuit0_17 | PASS (fresh, 8/8 checks) |
| `Circuit_02_v2.v` | `Circuit` | `Circuit_02_v2_gen_support.sv` | Circuit0_2 | PASS (fresh, 8/8 checks) |
| `Circuit_03_v2.v` | `QuantumCircuit` | `Circuit_03_v2_gen_support.sv` | Circuit0_3 | PASS (fresh, 8/8 checks) |
| `Circuit_04_v2.v` | `Circuit` | `Circuit_04_v2_gen_support.sv` | Circuit0_4 | PASS (fresh, 8/8 checks) |
| `Circuit_05_v2.v` | `Circuit` | `Circuit_05_v2_gen_support.sv` | Circuit0_5 | PASS (fresh, 8/8 checks) |
| `Circuit_06_v2.v` | `Circuit` | `Circuit_06_v2_gen_support.sv` | Circuit1_0167 | PASS (fresh, 8/8 checks) |
| `Circuit_07_v2.v` | `Circuit` | `Circuit_07_v2_gen_support.sv` | Circuit1_23 | PASS (fresh, 8/8 checks) |
| `Circuit_08_v2.v` | `Circuit` | `Circuit_08_v2_gen_support.sv` | Circuit1_45 | PASS (fresh, 8/8 checks) |
| `U3_5_v2.v` | `quantum_circuit` | `U3_5_v2_gen_support.sv` | (new 3q) | PASS (fresh, 16/16 checks) |
| `G5_05_v2.v` | `Shor` | `G5_05_v2_gen_support.sv` | (new 5q) | PASS (fresh, 64/64 checks) |
| `V5_6_v2.v` | `Shor` | `V5_6_v2_gen_support.sv` | (new 5q, missing-module routing) | PASS (fresh, 64/64 checks) |
| `QFT_v2.v` | `QFT_3Qubit_8bit` | `QFT_v2_gen_support.sv` | QFT | STRUCTURAL ONLY (see README) |
| `ShorFixed.sv` | `ShorFixed` | `-` | Shor (corrected, 15 inst) | PASS (fresh, 192/192 over 3 covering inputs) |

DO NOT mix support files between designs: `CompatiblePerm` exists at different
state-vector widths under the same module name in different families, and combining
two families' libraries in one run makes the wrong one elaborate.

## Verification status

Every design except `QFT_v2.v` was re-verified functionally in ModelSim against a
Qiskit-derived golden statevector IMMEDIATELY before this package was built
(see `verification_manifest.json` for the raw records).

`QFT_v2.v` cannot be functionally simulated: the QFT circuit drives negative
amplitudes into Hadamard gates, which triggers a known sign-extension defect in the
gate library itself (documented in the repository). Its verification is structural:
lint-clean, and its 13-instantiation module sequence is IDENTICAL to the verified
reference implementation, including the permutation variant at every position. It
synthesizes normally.

## Name mapping (important)

The 9 `Circuit_NN` designs correspond to the poster/Chisel rows by the mapping in
the table above -- e.g. `Circuit_00` is `Circuit0_06`, NOT `Circuit0_2`. Rows will
silently misalign if this is ignored.

`ShorFixed.sv` is the CORRECTED 15-instantiation Shor: compare it against the
existing Chisel Shor column. The published reference has one extra permutation; this
version removes it and passes all functional checks.

`V5_6_v2.v` has no reference counterpart: it exercises the one qubit exchange that
has no direct hardware module, routed through three permutations. Report its
absolute numbers.
