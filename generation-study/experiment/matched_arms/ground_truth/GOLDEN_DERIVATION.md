# Golden States — Circuit_07 (HCXH) & Circuit_08 (HCXSX)

**Status: SIMULATION-CONFIRMED**, not hand-derived. Real ground truth was built and
run in ModelSim 2020.1 (see `Circuit_07.sv` / `Circuit_08.sv` / `gate_library_flat_07_08.sv`
in this folder), extending the already-verified Bell/Circuit1_0167 pipeline
(`experiment/ground_truth/Circuit1_0167.sv`) by one real gate-wrapper stage. Input = |00>
(QSV_0 real = 0x4000).

## Pipeline (all real modules, byte-for-byte the same instantiation pattern as the
## verified Bell ground truth, plus one extra stage)
```
m: HGate2QubitVector16bit      (H on q0)
m_1: CompatiblePerm
m_2: CNGate2QubitVector16bit   (CX)     <- CNGate2QubitVector16bit already existed
m_3: CompatiblePerm                        locally (gate_library/gate_library_flat_1_0167.sv);
m_4: HGate2QubitVector16bit    (H, Circuit_07)   no source needed from anyone.
   or SXGate2QubitVector16bit (SX, Circuit_08)   <- built by wrapping the real SqrtXGate
                                                     primitive in the same 2-layer pattern
                                                     already verified for HGate2QubitVector16bit.
```
No perm after m_4: both H and SX target qubit 0, which per architecture_rules.md needs no
permutation bracket.

## Circuit_07 (HCXH) — PASS, matches hand-derived hypothesis exactly
| QSV | real | imag |
|---|---|---|
| 0 | 1FFF | 0000 |
| 1 | 1FFF | 0000 |
| 2 | 1FFF | 0000 |
| 3 | E001 | 0000 |
Latency observed: 156 ns / 10 ns per cycle - settle offset = 13 cycles (matches nominal).

## Circuit_08 (HCXSX) — PASS after correcting 1 hand-derived value
| QSV | real | imag |
|---|---|---|
| 0 | 16A0 | 16A0 |
| 1 | 16A0 | E95F |
| 2 | 16A0 | E95F |
| 3 | 16A0 | 16A0 |
The hand-derived guess for the negative-imaginary entries was `0xE960`; real hardware
rounding produces `0xE95F` (1 LSB lower) — the exact same rounding behavior already
observed on the verified SXdg/Circuit0_4 run, now confirmed rather than assumed.

## Reproduce it yourself
```
vlib work
vlog -sv -work work -modelsimini <modelsim.ini> Circuit_07.sv gate_library_flat_07_08.sv tb_Circuit_07.v
vsim -c -voptargs=+acc -lib work work.tb_Circuit_07 -do "do {<repo>/sim/run.do}"
# repeat with Circuit_08.sv / tb_Circuit_08.v
```
