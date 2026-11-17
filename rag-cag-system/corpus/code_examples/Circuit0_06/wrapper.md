---
circuit: Circuit0_06
circuit_alt_name: Circuit_00
corpus_type: code_example
family: 2qubit-16bit
qubits: 2
gate_sequence: ["h(0)", "swap(0,1)"]
gate_count: 2
logical_gate_count: 2
instantiation_count: 2
verified: chisel_ground_truth
ground_truth_file: Circuit0_06_ground_truth.sv
structural_signature: "2q|h(q0);swap(q0,1)"
module_name_in_payload: Circuit0_06NOCOMMENTS
---

# Circuit0_06 — h(0), swap(0,1) (2-qubit, 16-bit)

## Circuit specification
```
qubits: 2
family: 2qubit-16bit
depth: 2
gates:
  h(q0)
  swap(q0,1)
```

## Library composition (the non-derivable mapping)
2 logical gates -> 2 instantiations with NO CompatiblePerm at all: both h(0) and swap(0,1) need no permutation bracket. The only example in the corpus with zero marshalling. Payload quirk: the top module is named `Circuit0_06NOCOMMENTS` (see `module_name_in_payload`), not `Circuit0_06`.

## Ground-truth Verilog (wiring section)
```verilog

  wire [15:0] _m_io_out_QSV_0_0;
  wire [15:0] _m_io_out_QSV_0_1;
  wire [15:0] _m_io_out_QSV_1_0;
  wire [15:0] _m_io_out_QSV_1_1;
  wire [15:0] _m_io_out_QSV_2_0;
  wire [15:0] _m_io_out_QSV_2_1;
  wire [15:0] _m_io_out_QSV_3_0;
  wire [15:0] _m_io_out_QSV_3_1;
  wire        _m_io_out_valid;
  HGate2QubitVector16bit m (
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
  SWGate2QubitVector16bit m_1 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_io_out_QSV_3_1),
    .io_in_valid    (_m_io_out_valid),
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
