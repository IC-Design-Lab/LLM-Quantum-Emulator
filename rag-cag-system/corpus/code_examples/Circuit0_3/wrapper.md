---
circuit: Circuit0_3
circuit_alt_name: Circuit_03
corpus_type: code_example
family: 2qubit-16bit
qubits: 2
gate_sequence: ["h(0)", "x(1)", "h(1)", "swap(0,1)"]
gate_count: 4
logical_gate_count: 4
instantiation_count: 6
verified: chisel_ground_truth
ground_truth_file: Circuit0_3_ground_truth.sv
structural_signature: "2q|h(q0);x(q1);h(q1);swap(q0,1)"
---

# Circuit0_3 — h(0), x(1), h(1), swap(0,1) (2-qubit, 16-bit)

## Circuit specification
```
qubits: 2
family: 2qubit-16bit
depth: 3
gates:
  h(q0)
  x(q1)
  h(q1)
  swap(q0,1)
```

## Library composition (the non-derivable mapping)
4 logical gates -> 6 instantiations: the two CONSECUTIVE qubit-1 gates x(1), h(1) share a SINGLE CompatiblePerm bracket (open once, both gates inside, close once) - brackets are hoisted across adjacent same-target gates, not emitted per gate. Variant set used: base only.

## Ground-truth Verilog (wiring section)
```verilog

  wire [15:0] _m_4_io_out_QSV_0_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_4_io_out_QSV_0_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_4_io_out_QSV_1_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_4_io_out_QSV_1_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_4_io_out_QSV_2_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_4_io_out_QSV_2_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_4_io_out_QSV_3_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_4_io_out_QSV_3_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire        _m_4_io_out_valid;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
  wire [15:0] _m_3_io_out_QSV_0_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_3_io_out_QSV_0_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_3_io_out_QSV_1_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_3_io_out_QSV_1_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_3_io_out_QSV_2_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_3_io_out_QSV_2_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_3_io_out_QSV_3_0;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire [15:0] _m_3_io_out_QSV_3_1;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
  wire        _m_3_io_out_valid;	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
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
  XGate2QubitVector16bit m_2 (	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
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
  HGate2QubitVector16bit m_3 (	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
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
  CompatiblePerm m_4 (	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_3_io_out_QSV_0_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_0_1  (_m_3_io_out_QSV_0_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_1_0  (_m_3_io_out_QSV_1_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_1_1  (_m_3_io_out_QSV_1_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_2_0  (_m_3_io_out_QSV_2_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_2_1  (_m_3_io_out_QSV_2_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_3_0  (_m_3_io_out_QSV_3_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_QSV_3_1  (_m_3_io_out_QSV_3_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_in_valid    (_m_3_io_out_valid),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .io_out_QSV_0_0 (_m_4_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_4_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_4_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_4_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_4_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_4_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_4_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_4_io_out_QSV_3_1),
    .io_out_valid   (_m_4_io_out_valid)
  );
  SWGate2QubitVector16bit m_5 (	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:34:23
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_4_io_out_QSV_0_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_0_1  (_m_4_io_out_QSV_0_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_1_0  (_m_4_io_out_QSV_1_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_1_1  (_m_4_io_out_QSV_1_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_2_0  (_m_4_io_out_QSV_2_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_2_1  (_m_4_io_out_QSV_2_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_3_0  (_m_4_io_out_QSV_3_0),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_QSV_3_1  (_m_4_io_out_QSV_3_1),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
    .io_in_valid    (_m_4_io_out_valid),	// \\src\\main\\scala\\QunatumLayers\\ArithmiticGates\\GeneratePipline.scala:41:23
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
