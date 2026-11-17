---
circuit: Circuit1_23
circuit_alt_name: Circuit_07
corpus_type: code_example
family: 2qubit-16bit
qubits: 2
gate_sequence: ["h(0)", "cx(0,1)", "h(0)"]
gate_count: 3
logical_gate_count: 3
instantiation_count: 5
verified: chisel_ground_truth
ground_truth_file: Circuit1_23_ground_truth.sv
structural_signature: "2q|h(q0);cx(q0,1);h(q0)"
golden_derivation: simulation_confirmed
---

# Circuit1_23 — h(0), cx(0,1), h(0) (2-qubit, 16-bit)

## Circuit specification
```
qubits: 2
family: 2qubit-16bit
depth: 3
gates:
  h(q0)
  cx(q0,1)
  h(q0)
```

## Library composition (the non-derivable mapping)
3 logical gates -> 5 instantiations: h(0), then bracketed cx (CompatiblePerm -> CNGate -> CompatiblePerm), then a trailing UNbracketed h(0). Differs from Circuit1_45 ONLY in the final wrapper (HGate vs SXGate) - retrieval must use the full ordered sequence. Variant set: base only.
Provenance: additionally simulation-confirmed in ModelSim - see experiment/matched_arms/ground_truth/GOLDEN_DERIVATION.md (`golden_derivation` key).

## Ground-truth Verilog (wiring section)
```verilog

  wire [15:0] _m_3_io_out_QSV_0_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_3_io_out_QSV_0_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_3_io_out_QSV_1_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_3_io_out_QSV_1_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_3_io_out_QSV_2_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_3_io_out_QSV_2_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_3_io_out_QSV_3_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_3_io_out_QSV_3_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire        _m_3_io_out_valid;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_2_io_out_QSV_0_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_2_io_out_QSV_0_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_2_io_out_QSV_1_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_2_io_out_QSV_1_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_2_io_out_QSV_2_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_2_io_out_QSV_2_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_2_io_out_QSV_3_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_2_io_out_QSV_3_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire        _m_2_io_out_valid;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_1_io_out_QSV_0_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_1_io_out_QSV_0_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_1_io_out_QSV_1_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_1_io_out_QSV_1_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_1_io_out_QSV_2_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_1_io_out_QSV_2_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_1_io_out_QSV_3_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_1_io_out_QSV_3_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire        _m_1_io_out_valid;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_io_out_QSV_0_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_io_out_QSV_0_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_io_out_QSV_1_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_io_out_QSV_1_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_io_out_QSV_2_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_io_out_QSV_2_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_io_out_QSV_3_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_io_out_QSV_3_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire        _m_io_out_valid;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  HGate2QubitVector16bit m (	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
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
    .io_in_valid    (io_in_valid),
    .io_out_QSV_0_0 (_m_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_io_out_QSV_3_1),
    .io_out_valid   (_m_io_out_valid)
  );
  CompatiblePerm m_1 (	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_io_out_QSV_0_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_0_1  (_m_io_out_QSV_0_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_1_0  (_m_io_out_QSV_1_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_1_1  (_m_io_out_QSV_1_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_2_0  (_m_io_out_QSV_2_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_2_1  (_m_io_out_QSV_2_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_3_0  (_m_io_out_QSV_3_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_3_1  (_m_io_out_QSV_3_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_valid    (_m_io_out_valid),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_out_QSV_0_0 (_m_1_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_1_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_1_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_1_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_1_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_1_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_1_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_1_io_out_QSV_3_1),
    .io_out_valid   (_m_1_io_out_valid)
  );
  CNGate2QubitVector16bit m_2 (	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_1_io_out_QSV_0_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_0_1  (_m_1_io_out_QSV_0_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_1_0  (_m_1_io_out_QSV_1_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_1_1  (_m_1_io_out_QSV_1_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_2_0  (_m_1_io_out_QSV_2_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_2_1  (_m_1_io_out_QSV_2_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_3_0  (_m_1_io_out_QSV_3_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_3_1  (_m_1_io_out_QSV_3_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_valid    (_m_1_io_out_valid),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_out_QSV_0_0 (_m_2_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_2_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_2_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_2_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_2_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_2_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_2_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_2_io_out_QSV_3_1),
    .io_out_valid   (_m_2_io_out_valid)
  );
  CompatiblePerm m_3 (	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_2_io_out_QSV_0_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_0_1  (_m_2_io_out_QSV_0_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_1_0  (_m_2_io_out_QSV_1_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_1_1  (_m_2_io_out_QSV_1_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_2_0  (_m_2_io_out_QSV_2_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_2_1  (_m_2_io_out_QSV_2_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_3_0  (_m_2_io_out_QSV_3_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_3_1  (_m_2_io_out_QSV_3_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_valid    (_m_2_io_out_valid),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_out_QSV_0_0 (_m_3_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_3_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_3_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_3_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_3_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_3_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_3_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_3_io_out_QSV_3_1),
    .io_out_valid   (_m_3_io_out_valid)
  );
  HGate2QubitVector16bit m_4 (	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_3_io_out_QSV_0_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_0_1  (_m_3_io_out_QSV_0_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_1_0  (_m_3_io_out_QSV_1_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_1_1  (_m_3_io_out_QSV_1_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_2_0  (_m_3_io_out_QSV_2_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_2_1  (_m_3_io_out_QSV_2_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_3_0  (_m_3_io_out_QSV_3_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_3_1  (_m_3_io_out_QSV_3_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_valid    (_m_3_io_out_valid),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_out_QSV_0_0 (io_out_QSV_0_0),
    .io_out_QSV_0_1 (io_out_QSV_0_1),
    .io_out_QSV_1_0 (io_out_QSV_1_0),
    .io_out_QSV_1_1 (io_out_QSV_1_1),
    .io_out_QSV_2_0 (io_out_QSV_2_0),
    .io_out_QSV_2_1 (io_out_QSV_2_1),
    .io_out_QSV_3_0 (io_out_QSV_3_0),
    .io_out_QSV_3_1 (io_out_QSV_3_1),
    .io_out_valid   (io_out_valid)
  );
endmodule
```
