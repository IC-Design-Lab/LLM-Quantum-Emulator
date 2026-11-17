---
circuit: QFT
circuit_alt_name: QFT
corpus_type: code_example
family: qft-3qubit-8bit
qubits: 3
gate_sequence: ["h(0)", "cs(1,0)", "cp(pi/4)@2,0", "h(1)", "cs(2,1)", "h(2)", "swap(0,2)"]
gate_count: 7
logical_gate_count: 7
instantiation_count: 13
verified: chisel_ground_truth
ground_truth_file: QFT_ground_truth.sv
structural_signature: "3q|h(q0);cs(q1,0);cp(pi/4)@q2,0;h(q1);cs(q2,1);h(q2);swap(q0,2)"
---

# QFT — h(0), cs(1,0), cp(pi/4)@2,0, h(1), cs(2,1), h(2), swap(0,2) (QFT 3-qubit, 8-bit)

## Circuit specification
```
qubits: 3
family: qft-3qubit-8bit
depth: 6
gates:
  h(q0)
  cs(q1,0)
  cp(pi/4)@q2,0
  h(q1)
  cs(q2,1)
  h(q2)
  swap(q0,2)
```

## Library composition (the non-derivable mapping)
7 logical gates -> 13 instantiations. cp(pi/4) maps to CTGate3QubitVector8bit. Perm placement is NOT one-bracket-per-gate: cs(1,0) directly follows h(0) unbracketed, and the circuit CLOSES with a two-perm cascade (CompatiblePerm_2 -> CompatiblePerm) after SWGate that has no counterpart in the spec. Variant set used: base, `_1`, `_2` - the complete QFT-family set.

## Ground-truth Verilog (wiring section)
```verilog

  wire [7:0] _m_11_io_out_QSV_0_0;
  wire [7:0] _m_11_io_out_QSV_0_1;
  wire [7:0] _m_11_io_out_QSV_1_0;
  wire [7:0] _m_11_io_out_QSV_1_1;
  wire [7:0] _m_11_io_out_QSV_2_0;
  wire [7:0] _m_11_io_out_QSV_2_1;
  wire [7:0] _m_11_io_out_QSV_3_0;
  wire [7:0] _m_11_io_out_QSV_3_1;
  wire [7:0] _m_11_io_out_QSV_4_0;
  wire [7:0] _m_11_io_out_QSV_4_1;
  wire [7:0] _m_11_io_out_QSV_5_0;
  wire [7:0] _m_11_io_out_QSV_5_1;
  wire [7:0] _m_11_io_out_QSV_6_0;
  wire [7:0] _m_11_io_out_QSV_6_1;
  wire [7:0] _m_11_io_out_QSV_7_0;
  wire [7:0] _m_11_io_out_QSV_7_1;
  wire       _m_11_io_out_valid;
  wire [7:0] _m_10_io_out_QSV_0_0;
  wire [7:0] _m_10_io_out_QSV_0_1;
  wire [7:0] _m_10_io_out_QSV_1_0;
  wire [7:0] _m_10_io_out_QSV_1_1;
  wire [7:0] _m_10_io_out_QSV_2_0;
  wire [7:0] _m_10_io_out_QSV_2_1;
  wire [7:0] _m_10_io_out_QSV_3_0;
  wire [7:0] _m_10_io_out_QSV_3_1;
  wire [7:0] _m_10_io_out_QSV_4_0;
  wire [7:0] _m_10_io_out_QSV_4_1;
  wire [7:0] _m_10_io_out_QSV_5_0;
  wire [7:0] _m_10_io_out_QSV_5_1;
  wire [7:0] _m_10_io_out_QSV_6_0;
  wire [7:0] _m_10_io_out_QSV_6_1;
  wire [7:0] _m_10_io_out_QSV_7_0;
  wire [7:0] _m_10_io_out_QSV_7_1;
  wire       _m_10_io_out_valid;
  wire [7:0] _m_9_io_out_QSV_0_0;
  wire [7:0] _m_9_io_out_QSV_0_1;
  wire [7:0] _m_9_io_out_QSV_1_0;
  wire [7:0] _m_9_io_out_QSV_1_1;
  wire [7:0] _m_9_io_out_QSV_2_0;
  wire [7:0] _m_9_io_out_QSV_2_1;
  wire [7:0] _m_9_io_out_QSV_3_0;
  wire [7:0] _m_9_io_out_QSV_3_1;
  wire [7:0] _m_9_io_out_QSV_4_0;
  wire [7:0] _m_9_io_out_QSV_4_1;
  wire [7:0] _m_9_io_out_QSV_5_0;
  wire [7:0] _m_9_io_out_QSV_5_1;
  wire [7:0] _m_9_io_out_QSV_6_0;
  wire [7:0] _m_9_io_out_QSV_6_1;
  wire [7:0] _m_9_io_out_QSV_7_0;
  wire [7:0] _m_9_io_out_QSV_7_1;
  wire       _m_9_io_out_valid;
  wire [7:0] _m_8_io_out_QSV_0_0;
  wire [7:0] _m_8_io_out_QSV_0_1;
  wire [7:0] _m_8_io_out_QSV_1_0;
  wire [7:0] _m_8_io_out_QSV_1_1;
  wire [7:0] _m_8_io_out_QSV_2_0;
  wire [7:0] _m_8_io_out_QSV_2_1;
  wire [7:0] _m_8_io_out_QSV_3_0;
  wire [7:0] _m_8_io_out_QSV_3_1;
  wire [7:0] _m_8_io_out_QSV_4_0;
  wire [7:0] _m_8_io_out_QSV_4_1;
  wire [7:0] _m_8_io_out_QSV_5_0;
  wire [7:0] _m_8_io_out_QSV_5_1;
  wire [7:0] _m_8_io_out_QSV_6_0;
  wire [7:0] _m_8_io_out_QSV_6_1;
  wire [7:0] _m_8_io_out_QSV_7_0;
  wire [7:0] _m_8_io_out_QSV_7_1;
  wire       _m_8_io_out_valid;
  wire [7:0] _m_7_io_out_QSV_0_0;
  wire [7:0] _m_7_io_out_QSV_0_1;
  wire [7:0] _m_7_io_out_QSV_1_0;
  wire [7:0] _m_7_io_out_QSV_1_1;
  wire [7:0] _m_7_io_out_QSV_2_0;
  wire [7:0] _m_7_io_out_QSV_2_1;
  wire [7:0] _m_7_io_out_QSV_3_0;
  wire [7:0] _m_7_io_out_QSV_3_1;
  wire [7:0] _m_7_io_out_QSV_4_0;
  wire [7:0] _m_7_io_out_QSV_4_1;
  wire [7:0] _m_7_io_out_QSV_5_0;
  wire [7:0] _m_7_io_out_QSV_5_1;
  wire [7:0] _m_7_io_out_QSV_6_0;
  wire [7:0] _m_7_io_out_QSV_6_1;
  wire [7:0] _m_7_io_out_QSV_7_0;
  wire [7:0] _m_7_io_out_QSV_7_1;
  wire       _m_7_io_out_valid;
  wire [7:0] _m_6_io_out_QSV_0_0;
  wire [7:0] _m_6_io_out_QSV_0_1;
  wire [7:0] _m_6_io_out_QSV_1_0;
  wire [7:0] _m_6_io_out_QSV_1_1;
  wire [7:0] _m_6_io_out_QSV_2_0;
  wire [7:0] _m_6_io_out_QSV_2_1;
  wire [7:0] _m_6_io_out_QSV_3_0;
  wire [7:0] _m_6_io_out_QSV_3_1;
  wire [7:0] _m_6_io_out_QSV_4_0;
  wire [7:0] _m_6_io_out_QSV_4_1;
  wire [7:0] _m_6_io_out_QSV_5_0;
  wire [7:0] _m_6_io_out_QSV_5_1;
  wire [7:0] _m_6_io_out_QSV_6_0;
  wire [7:0] _m_6_io_out_QSV_6_1;
  wire [7:0] _m_6_io_out_QSV_7_0;
  wire [7:0] _m_6_io_out_QSV_7_1;
  wire       _m_6_io_out_valid;
  wire [7:0] _m_5_io_out_QSV_0_0;
  wire [7:0] _m_5_io_out_QSV_0_1;
  wire [7:0] _m_5_io_out_QSV_1_0;
  wire [7:0] _m_5_io_out_QSV_1_1;
  wire [7:0] _m_5_io_out_QSV_2_0;
  wire [7:0] _m_5_io_out_QSV_2_1;
  wire [7:0] _m_5_io_out_QSV_3_0;
  wire [7:0] _m_5_io_out_QSV_4_0;
  wire [7:0] _m_5_io_out_QSV_4_1;
  wire [7:0] _m_5_io_out_QSV_5_0;
  wire [7:0] _m_5_io_out_QSV_5_1;
  wire [7:0] _m_5_io_out_QSV_6_0;
  wire [7:0] _m_5_io_out_QSV_6_1;
  wire [7:0] _m_5_io_out_QSV_7_0;
  wire       _m_5_io_out_valid;
  wire [7:0] _m_4_io_out_QSV_0_0;
  wire [7:0] _m_4_io_out_QSV_0_1;
  wire [7:0] _m_4_io_out_QSV_1_0;
  wire [7:0] _m_4_io_out_QSV_1_1;
  wire [7:0] _m_4_io_out_QSV_2_0;
  wire [7:0] _m_4_io_out_QSV_2_1;
  wire [7:0] _m_4_io_out_QSV_3_0;
  wire [7:0] _m_4_io_out_QSV_3_1;
  wire [7:0] _m_4_io_out_QSV_4_0;
  wire [7:0] _m_4_io_out_QSV_4_1;
  wire [7:0] _m_4_io_out_QSV_5_0;
  wire [7:0] _m_4_io_out_QSV_5_1;
  wire [7:0] _m_4_io_out_QSV_6_0;
  wire [7:0] _m_4_io_out_QSV_6_1;
  wire [7:0] _m_4_io_out_QSV_7_0;
  wire [7:0] _m_4_io_out_QSV_7_1;
  wire       _m_4_io_out_valid;
  wire [7:0] _m_3_io_out_QSV_0_0;
  wire [7:0] _m_3_io_out_QSV_0_1;
  wire [7:0] _m_3_io_out_QSV_1_0;
  wire [7:0] _m_3_io_out_QSV_1_1;
  wire [7:0] _m_3_io_out_QSV_2_0;
  wire [7:0] _m_3_io_out_QSV_2_1;
  wire [7:0] _m_3_io_out_QSV_3_0;
  wire [7:0] _m_3_io_out_QSV_3_1;
  wire [7:0] _m_3_io_out_QSV_4_0;
  wire [7:0] _m_3_io_out_QSV_4_1;
  wire [7:0] _m_3_io_out_QSV_5_0;
  wire [7:0] _m_3_io_out_QSV_5_1;
  wire [7:0] _m_3_io_out_QSV_6_0;
  wire [7:0] _m_3_io_out_QSV_6_1;
  wire [7:0] _m_3_io_out_QSV_7_0;
  wire [7:0] _m_3_io_out_QSV_7_1;
  wire       _m_3_io_out_valid;
  wire [7:0] _m_2_io_out_QSV_0_0;
  wire [7:0] _m_2_io_out_QSV_0_1;
  wire [7:0] _m_2_io_out_QSV_1_0;
  wire [7:0] _m_2_io_out_QSV_1_1;
  wire [7:0] _m_2_io_out_QSV_2_0;
  wire [7:0] _m_2_io_out_QSV_2_1;
  wire [7:0] _m_2_io_out_QSV_3_0;
  wire [7:0] _m_2_io_out_QSV_3_1;
  wire [7:0] _m_2_io_out_QSV_4_0;
  wire [7:0] _m_2_io_out_QSV_4_1;
  wire [7:0] _m_2_io_out_QSV_5_0;
  wire [7:0] _m_2_io_out_QSV_5_1;
  wire [7:0] _m_2_io_out_QSV_6_0;
  wire [7:0] _m_2_io_out_QSV_6_1;
  wire [7:0] _m_2_io_out_QSV_7_0;
  wire [7:0] _m_2_io_out_QSV_7_1;
  wire       _m_2_io_out_valid;
  wire [7:0] _m_1_io_out_QSV_0_0;
  wire [7:0] _m_1_io_out_QSV_0_1;
  wire [7:0] _m_1_io_out_QSV_1_0;
  wire [7:0] _m_1_io_out_QSV_1_1;
  wire [7:0] _m_1_io_out_QSV_2_0;
  wire [7:0] _m_1_io_out_QSV_2_1;
  wire [7:0] _m_1_io_out_QSV_3_0;
  wire [7:0] _m_1_io_out_QSV_3_1;
  wire [7:0] _m_1_io_out_QSV_4_0;
  wire [7:0] _m_1_io_out_QSV_4_1;
  wire [7:0] _m_1_io_out_QSV_5_0;
  wire [7:0] _m_1_io_out_QSV_5_1;
  wire [7:0] _m_1_io_out_QSV_6_0;
  wire [7:0] _m_1_io_out_QSV_6_1;
  wire [7:0] _m_1_io_out_QSV_7_0;
  wire [7:0] _m_1_io_out_QSV_7_1;
  wire       _m_1_io_out_valid;
  wire [7:0] _m_io_out_QSV_0_0;
  wire [7:0] _m_io_out_QSV_0_1;
  wire [7:0] _m_io_out_QSV_1_0;
  wire [7:0] _m_io_out_QSV_1_1;
  wire [7:0] _m_io_out_QSV_2_0;
  wire [7:0] _m_io_out_QSV_2_1;
  wire [7:0] _m_io_out_QSV_3_0;
  wire [7:0] _m_io_out_QSV_4_0;
  wire [7:0] _m_io_out_QSV_4_1;
  wire [7:0] _m_io_out_QSV_5_0;
  wire [7:0] _m_io_out_QSV_5_1;
  wire [7:0] _m_io_out_QSV_6_0;
  wire [7:0] _m_io_out_QSV_6_1;
  wire [7:0] _m_io_out_QSV_7_0;
  wire       _m_io_out_valid;
  HGate3QubitVector8bit m (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (io_in_QSV_0_0),
    .io_in_QSV_0_1  (io_in_QSV_0_1),
    .io_in_QSV_1_0  (io_in_QSV_1_0),
    .io_in_QSV_1_1  (io_in_QSV_1_1),
    .io_in_QSV_2_0  (io_in_QSV_2_0),
    .io_in_QSV_2_1  (io_in_QSV_2_1),
    .io_in_QSV_3_0  (io_in_QSV_3_0),
    .io_in_QSV_3_1  (io_in_QSV_3_1),
    .io_in_QSV_4_0  (io_in_QSV_4_0),
    .io_in_QSV_4_1  (io_in_QSV_4_1),
    .io_in_QSV_5_0  (io_in_QSV_5_0),
    .io_in_QSV_5_1  (io_in_QSV_5_1),
    .io_in_QSV_6_0  (io_in_QSV_6_0),
    .io_in_QSV_6_1  (io_in_QSV_6_1),
    .io_in_QSV_7_0  (io_in_QSV_7_0),
    .io_in_QSV_7_1  (io_in_QSV_7_1),
    .io_in_valid    (io_in_valid),
    .io_out_QSV_0_0 (_m_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_io_out_QSV_3_0),
    .io_out_QSV_3_1 (/* unused */),
    .io_out_QSV_4_0 (_m_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_io_out_QSV_7_0),
    .io_out_QSV_7_1 (/* unused */),
    .io_out_valid   (_m_io_out_valid)
  );
  CSGate3QubitVector8bit m_1 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_io_out_QSV_3_0),
    .io_in_QSV_4_0  (_m_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_io_out_QSV_7_0),
    .io_in_valid    (_m_io_out_valid),
    .io_out_QSV_0_0 (_m_1_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_1_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_1_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_1_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_1_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_1_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_1_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_1_io_out_QSV_3_1),
    .io_out_QSV_4_0 (_m_1_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_1_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_1_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_1_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_1_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_1_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_1_io_out_QSV_7_0),
    .io_out_QSV_7_1 (_m_1_io_out_QSV_7_1),
    .io_out_valid   (_m_1_io_out_valid)
  );
  CompatiblePerm m_2 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_1_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_1_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_1_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_1_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_1_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_1_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_1_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_1_io_out_QSV_3_1),
    .io_in_QSV_4_0  (_m_1_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_1_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_1_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_1_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_1_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_1_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_1_io_out_QSV_7_0),
    .io_in_QSV_7_1  (_m_1_io_out_QSV_7_1),
    .io_in_valid    (_m_1_io_out_valid),
    .io_out_QSV_0_0 (_m_2_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_2_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_2_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_2_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_2_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_2_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_2_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_2_io_out_QSV_3_1),
    .io_out_QSV_4_0 (_m_2_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_2_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_2_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_2_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_2_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_2_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_2_io_out_QSV_7_0),
    .io_out_QSV_7_1 (_m_2_io_out_QSV_7_1),
    .io_out_valid   (_m_2_io_out_valid)
  );
  CTGate3QubitVector8bit m_3 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_2_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_2_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_2_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_2_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_2_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_2_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_2_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_2_io_out_QSV_3_1),
    .io_in_QSV_4_0  (_m_2_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_2_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_2_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_2_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_2_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_2_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_2_io_out_QSV_7_0),
    .io_in_QSV_7_1  (_m_2_io_out_QSV_7_1),
    .io_in_valid    (_m_2_io_out_valid),
    .io_out_QSV_0_0 (_m_3_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_3_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_3_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_3_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_3_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_3_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_3_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_3_io_out_QSV_3_1),
    .io_out_QSV_4_0 (_m_3_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_3_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_3_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_3_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_3_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_3_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_3_io_out_QSV_7_0),
    .io_out_QSV_7_1 (_m_3_io_out_QSV_7_1),
    .io_out_valid   (_m_3_io_out_valid)
  );
  CompatiblePerm_1 m_4 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_3_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_3_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_3_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_3_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_3_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_3_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_3_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_3_io_out_QSV_3_1),
    .io_in_QSV_4_0  (_m_3_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_3_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_3_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_3_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_3_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_3_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_3_io_out_QSV_7_0),
    .io_in_QSV_7_1  (_m_3_io_out_QSV_7_1),
    .io_in_valid    (_m_3_io_out_valid),
    .io_out_QSV_0_0 (_m_4_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_4_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_4_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_4_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_4_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_4_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_4_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_4_io_out_QSV_3_1),
    .io_out_QSV_4_0 (_m_4_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_4_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_4_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_4_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_4_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_4_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_4_io_out_QSV_7_0),
    .io_out_QSV_7_1 (_m_4_io_out_QSV_7_1),
    .io_out_valid   (_m_4_io_out_valid)
  );
  HGate3QubitVector8bit m_5 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_4_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_4_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_4_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_4_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_4_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_4_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_4_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_4_io_out_QSV_3_1),
    .io_in_QSV_4_0  (_m_4_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_4_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_4_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_4_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_4_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_4_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_4_io_out_QSV_7_0),
    .io_in_QSV_7_1  (_m_4_io_out_QSV_7_1),
    .io_in_valid    (_m_4_io_out_valid),
    .io_out_QSV_0_0 (_m_5_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_5_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_5_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_5_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_5_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_5_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_5_io_out_QSV_3_0),
    .io_out_QSV_3_1 (/* unused */),
    .io_out_QSV_4_0 (_m_5_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_5_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_5_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_5_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_5_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_5_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_5_io_out_QSV_7_0),
    .io_out_QSV_7_1 (/* unused */),
    .io_out_valid   (_m_5_io_out_valid)
  );
  CSGate3QubitVector8bit m_6 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_5_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_5_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_5_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_5_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_5_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_5_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_5_io_out_QSV_3_0),
    .io_in_QSV_4_0  (_m_5_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_5_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_5_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_5_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_5_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_5_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_5_io_out_QSV_7_0),
    .io_in_valid    (_m_5_io_out_valid),
    .io_out_QSV_0_0 (_m_6_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_6_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_6_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_6_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_6_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_6_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_6_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_6_io_out_QSV_3_1),
    .io_out_QSV_4_0 (_m_6_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_6_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_6_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_6_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_6_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_6_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_6_io_out_QSV_7_0),
    .io_out_QSV_7_1 (_m_6_io_out_QSV_7_1),
    .io_out_valid   (_m_6_io_out_valid)
  );
  CompatiblePerm_2 m_7 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_6_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_6_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_6_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_6_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_6_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_6_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_6_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_6_io_out_QSV_3_1),
    .io_in_QSV_4_0  (_m_6_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_6_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_6_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_6_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_6_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_6_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_6_io_out_QSV_7_0),
    .io_in_QSV_7_1  (_m_6_io_out_QSV_7_1),
    .io_in_valid    (_m_6_io_out_valid),
    .io_out_QSV_0_0 (_m_7_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_7_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_7_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_7_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_7_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_7_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_7_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_7_io_out_QSV_3_1),
    .io_out_QSV_4_0 (_m_7_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_7_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_7_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_7_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_7_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_7_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_7_io_out_QSV_7_0),
    .io_out_QSV_7_1 (_m_7_io_out_QSV_7_1),
    .io_out_valid   (_m_7_io_out_valid)
  );
  HGate3QubitVector8bit m_8 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_7_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_7_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_7_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_7_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_7_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_7_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_7_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_7_io_out_QSV_3_1),
    .io_in_QSV_4_0  (_m_7_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_7_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_7_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_7_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_7_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_7_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_7_io_out_QSV_7_0),
    .io_in_QSV_7_1  (_m_7_io_out_QSV_7_1),
    .io_in_valid    (_m_7_io_out_valid),
    .io_out_QSV_0_0 (_m_8_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_8_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_8_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_8_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_8_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_8_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_8_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_8_io_out_QSV_3_1),
    .io_out_QSV_4_0 (_m_8_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_8_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_8_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_8_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_8_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_8_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_8_io_out_QSV_7_0),
    .io_out_QSV_7_1 (_m_8_io_out_QSV_7_1),
    .io_out_valid   (_m_8_io_out_valid)
  );
  CompatiblePerm m_9 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_8_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_8_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_8_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_8_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_8_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_8_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_8_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_8_io_out_QSV_3_1),
    .io_in_QSV_4_0  (_m_8_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_8_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_8_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_8_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_8_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_8_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_8_io_out_QSV_7_0),
    .io_in_QSV_7_1  (_m_8_io_out_QSV_7_1),
    .io_in_valid    (_m_8_io_out_valid),
    .io_out_QSV_0_0 (_m_9_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_9_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_9_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_9_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_9_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_9_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_9_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_9_io_out_QSV_3_1),
    .io_out_QSV_4_0 (_m_9_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_9_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_9_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_9_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_9_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_9_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_9_io_out_QSV_7_0),
    .io_out_QSV_7_1 (_m_9_io_out_QSV_7_1),
    .io_out_valid   (_m_9_io_out_valid)
  );
  SWGate3QubitVector8bit m_10 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_9_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_9_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_9_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_9_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_9_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_9_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_9_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_9_io_out_QSV_3_1),
    .io_in_QSV_4_0  (_m_9_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_9_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_9_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_9_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_9_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_9_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_9_io_out_QSV_7_0),
    .io_in_QSV_7_1  (_m_9_io_out_QSV_7_1),
    .io_in_valid    (_m_9_io_out_valid),
    .io_out_QSV_0_0 (_m_10_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_10_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_10_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_10_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_10_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_10_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_10_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_10_io_out_QSV_3_1),
    .io_out_QSV_4_0 (_m_10_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_10_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_10_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_10_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_10_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_10_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_10_io_out_QSV_7_0),
    .io_out_QSV_7_1 (_m_10_io_out_QSV_7_1),
    .io_out_valid   (_m_10_io_out_valid)
  );
  CompatiblePerm_2 m_11 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_10_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_10_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_10_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_10_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_10_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_10_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_10_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_10_io_out_QSV_3_1),
    .io_in_QSV_4_0  (_m_10_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_10_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_10_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_10_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_10_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_10_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_10_io_out_QSV_7_0),
    .io_in_QSV_7_1  (_m_10_io_out_QSV_7_1),
    .io_in_valid    (_m_10_io_out_valid),
    .io_out_QSV_0_0 (_m_11_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_11_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_11_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_11_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_11_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_11_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_11_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_11_io_out_QSV_3_1),
    .io_out_QSV_4_0 (_m_11_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_11_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_11_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_11_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_11_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_11_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_11_io_out_QSV_7_0),
    .io_out_QSV_7_1 (_m_11_io_out_QSV_7_1),
    .io_out_valid   (_m_11_io_out_valid)
  );
  CompatiblePerm m_12 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_11_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_11_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_11_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_11_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_11_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_11_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_11_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_11_io_out_QSV_3_1),
    .io_in_QSV_4_0  (_m_11_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_11_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_11_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_11_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_11_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_11_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_11_io_out_QSV_7_0),
    .io_in_QSV_7_1  (_m_11_io_out_QSV_7_1),
    .io_in_valid    (_m_11_io_out_valid),
    .io_out_QSV_0_0 (io_out_QSV_0_0),
    .io_out_QSV_0_1 (io_out_QSV_0_1),
    .io_out_QSV_1_0 (io_out_QSV_1_0),
    .io_out_QSV_1_1 (io_out_QSV_1_1),
    .io_out_QSV_2_0 (io_out_QSV_2_0),
    .io_out_QSV_2_1 (io_out_QSV_2_1),
    .io_out_QSV_3_0 (io_out_QSV_3_0),
    .io_out_QSV_3_1 (io_out_QSV_3_1),
    .io_out_QSV_4_0 (io_out_QSV_4_0),
    .io_out_QSV_4_1 (io_out_QSV_4_1),
    .io_out_QSV_5_0 (io_out_QSV_5_0),
    .io_out_QSV_5_1 (io_out_QSV_5_1),
    .io_out_QSV_6_0 (io_out_QSV_6_0),
    .io_out_QSV_6_1 (io_out_QSV_6_1),
    .io_out_QSV_7_0 (io_out_QSV_7_0),
    .io_out_QSV_7_1 (io_out_QSV_7_1),
    .io_out_valid   (io_out_valid)
  );
endmodule
```
