---
circuit: Circuit0_2
circuit_alt_name: Circuit_02
corpus_type: code_example
family: 2qubit-16bit
qubits: 2
gate_sequence: ["h(0)", "h(1)", "swap(0,1)"]
gate_count: 3
logical_gate_count: 3
instantiation_count: 5
verified: chisel_ground_truth
ground_truth_file: Circuit0_2_ground_truth.sv
structural_signature: "2q|h(q0);h(q1);swap(q0,1)"
---

# Circuit0_2 — h(0), h(1), swap(0,1) (2-qubit, 16-bit)

## Circuit specification
```
qubits: 2
family: 2qubit-16bit
depth: 2
gates:
  h(q0)
  h(q1)
  swap(q0,1)
```

## Library composition (the non-derivable mapping)
3 logical gates -> 5 instantiations: the second h targets qubit 1 and is bracketed CompatiblePerm -> HGate -> CompatiblePerm; the identical HGate wrapper appears both unbracketed (h(0)) and bracketed (h(1)). Variant set used: base `CompatiblePerm` only.

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
  HGate2QubitVector16bit m_2 (	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
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
  SWGate2QubitVector16bit m_4 (	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
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
