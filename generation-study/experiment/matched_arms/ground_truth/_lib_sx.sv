// SXGate16bit / SXGate2QubitVector16bit -- built by hand, following the EXACT
// wrapping pattern already verified in gate_library_flat_1_0167.sv for
// HGate16bit / HGate2QubitVector16bit (HadamardGate -> HGate16bit -> HGate2QubitVector16bit).
// SqrtXGate.sv (gate_library/SqrtXGate.sv, real CIRCT output) is the primitive;
// these two wrapper layers are structurally identical to the H-gate wrappers,
// just instantiating SqrtXGate instead of HadamardGate. No new logic invented.

module SXGate16bit(
  input         clock,
                reset,
  input  [15:0] io_in_QSV_0_0,
                io_in_QSV_0_1,
                io_in_QSV_1_0,
                io_in_QSV_1_1,
  input         io_in_valid,
  output [15:0] io_out_QSV_0_0,
                io_out_QSV_0_1,
                io_out_QSV_1_0,
                io_out_QSV_1_1,
  output        io_out_valid
);

  SqrtXGate gate (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (io_in_QSV_0_0),
    .io_in_QSV_0_1  (io_in_QSV_0_1),
    .io_in_QSV_1_0  (io_in_QSV_1_0),
    .io_in_QSV_1_1  (io_in_QSV_1_1),
    .io_in_valid    (io_in_valid),
    .io_out_QSV_0_0 (io_out_QSV_0_0),
    .io_out_QSV_0_1 (io_out_QSV_0_1),
    .io_out_QSV_1_0 (io_out_QSV_1_0),
    .io_out_QSV_1_1 (io_out_QSV_1_1),
    .io_out_valid   (io_out_valid)
  );
endmodule

module SXGate2QubitVector16bit(
  input         clock,
                reset,
  input  [15:0] io_in_QSV_0_0,
                io_in_QSV_0_1,
                io_in_QSV_1_0,
                io_in_QSV_1_1,
                io_in_QSV_2_0,
                io_in_QSV_2_1,
                io_in_QSV_3_0,
                io_in_QSV_3_1,
  input         io_in_valid,
  output [15:0] io_out_QSV_0_0,
                io_out_QSV_0_1,
                io_out_QSV_1_0,
                io_out_QSV_1_1,
                io_out_QSV_2_0,
                io_out_QSV_2_1,
                io_out_QSV_3_0,
                io_out_QSV_3_1,
  output        io_out_valid
);

  wire _gate_1_io_out_valid;
  wire _gate_0_io_out_valid;
  SXGate16bit gate_0 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (io_in_QSV_0_0),
    .io_in_QSV_0_1  (io_in_QSV_0_1),
    .io_in_QSV_1_0  (io_in_QSV_1_0),
    .io_in_QSV_1_1  (io_in_QSV_1_1),
    .io_in_valid    (io_in_valid),
    .io_out_QSV_0_0 (io_out_QSV_0_0),
    .io_out_QSV_0_1 (io_out_QSV_0_1),
    .io_out_QSV_1_0 (io_out_QSV_1_0),
    .io_out_QSV_1_1 (io_out_QSV_1_1),
    .io_out_valid   (_gate_0_io_out_valid)
  );
  SXGate16bit gate_1 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (io_in_QSV_2_0),
    .io_in_QSV_0_1  (io_in_QSV_2_1),
    .io_in_QSV_1_0  (io_in_QSV_3_0),
    .io_in_QSV_1_1  (io_in_QSV_3_1),
    .io_in_valid    (io_in_valid),
    .io_out_QSV_0_0 (io_out_QSV_2_0),
    .io_out_QSV_0_1 (io_out_QSV_2_1),
    .io_out_QSV_1_0 (io_out_QSV_3_0),
    .io_out_QSV_1_1 (io_out_QSV_3_1),
    .io_out_valid   (_gate_1_io_out_valid)
  );
  assign io_out_valid = _gate_0_io_out_valid & _gate_1_io_out_valid;
endmodule
