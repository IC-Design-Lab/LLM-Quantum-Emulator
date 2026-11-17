module Circuit_04 (
  input  logic        clock,
  input  logic        reset,
  input  logic [15:0] io_in_QSV_0_0,
  input  logic [15:0] io_in_QSV_0_1,
  input  logic [15:0] io_in_QSV_1_0,
  input  logic [15:0] io_in_QSV_1_1,
  input  logic [15:0] io_in_QSV_2_0,
  input  logic [15:0] io_in_QSV_2_1,
  input  logic [15:0] io_in_QSV_3_0,
  input  logic [15:0] io_in_QSV_3_1,
  input  logic        io_in_valid,
  output logic [15:0] io_out_QSV_0_0,
  output logic [15:0] io_out_QSV_0_1,
  output logic [15:0] io_out_QSV_1_0,
  output logic [15:0] io_out_QSV_1_1,
  output logic [15:0] io_out_QSV_2_0,
  output logic [15:0] io_out_QSV_2_1,
  output logic [15:0] io_out_QSV_3_0,
  output logic [15:0] io_out_QSV_3_1,
  output logic        io_out_valid
);

  // Stage 1 (H) output wires
  wire [15:0] w1_qsv_0_0, w1_qsv_0_1, w1_qsv_1_0, w1_qsv_1_1, w1_qsv_2_0, w1_qsv_2_1, w1_qsv_3_0, w1_qsv_3_1;
  wire w1_valid;

  // Stage 2 (Perm 1) output wires
  wire [15:0] w2_qsv_0_0, w2_qsv_0_1, w2_qsv_1_0, w2_qsv_1_1, w2_qsv_2_0, w2_qsv_2_1, w2_qsv_3_0, w2_qsv_3_1;
  wire w2_valid;

  // Stage 3 (SXD) output wires
  wire [15:0] w3_qsv_0_0, w3_qsv_0_1, w3_qsv_1_0, w3_qsv_1_1, w3_qsv_2_0, w3_qsv_2_1, w3_qsv_3_0, w3_qsv_3_1;
  wire w3_valid;

  // Stage 4 (Perm 2) output wires
  wire [15:0] w4_qsv_0_0, w4_qsv_0_1, w4_qsv_1_0, w4_qsv_1_1, w4_qsv_2_0, w4_qsv_2_1, w4_qsv_3_0, w4_qsv_3_1;
  wire w4_valid;

  // Stage 1: Hadamard on Qubit 0
  HGate2QubitVector16bit inst_0_h (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(io_in_QSV_0_0),
    .io_in_QSV_0_1(io_in_QSV_0_1),
    .io_in_QSV_1_0(io_in_QSV_1_0),
    .io_in_QSV_1_1(io_in_QSV_1_1),
    .io_in_QSV_2_0(io_in_QSV_2_0),
    .io_in_QSV_2_1(io_in_QSV_2_1),
    .io_in_QSV_3_0(io_in_QSV_3_0),
    .io_in_QSV_3_1(io_in_QSV_3_1),
    .io_in_valid(io_in_valid),
    .io_out_QSV_0_0(w1_qsv_0_0),
    .io_out_QSV_0_1(w1_qsv_0_1),
    .io_out_QSV_1_0(w1_qsv_1_0),
    .io_out_QSV_1_1(w1_qsv_1_1),
    .io_out_QSV_2_0(w1_qsv_2_0),
    .io_out_QSV_2_1(w1_qsv_2_1),
    .io_out_QSV_3_0(w1_qsv_3_0),
    .io_out_QSV_3_1(w1_qsv_3_1),
    .io_out_valid(w1_valid)
  );

  // Stage 2: Permutation before Qubit 1 gate
  CompatiblePerm inst_1_perm1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(w1_qsv_0_0),
    .io_in_QSV_0_1(w1_qsv_0_1),
    .io_in_QSV_1_0(w1_qsv_1_0),
    .io_in_QSV_1_1(w1_qsv_1_1),
    .io_in_QSV_2_0(w1_qsv_2_0),
    .io_in_QSV_2_1(w1_qsv_2_1),
    .io_in_QSV_3_0(w1_qsv_3_0),
    .io_in_QSV_3_1(w1_qsv_3_1),
    .io_in_valid(w1_valid),
    .io_out_QSV_0_0(w2_qsv_0_0),
    .io_out_QSV_0_1(w2_qsv_0_1),
    .io_out_QSV_1_0(w2_qsv_1_0),
    .io_out_QSV_1_1(w2_qsv_1_1),
    .io_out_QSV_2_0(w2_qsv_2_0),
    .io_out_QSV_2_1(w2_qsv_2_1),
    .io_out_QSV_3_0(w2_qsv_3_0),
    .io_out_QSV_3_1(w2_qsv_3_1),
    .io_out_valid(w2_valid)
  );

  // Stage 3: SqrtX-Dagger on Qubit 1 (mapped to Qubit 0 after permutation)
  SXDGate2QubitVector16bit inst_2_sxdg (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(w2_qsv_0_0),
    .io_in_QSV_0_1(w2_qsv_0_1),
    .io_in_QSV_1_0(w2_qsv_1_0),
    .io_in_QSV_1_1(w2_qsv_1_1),
    .io_in_QSV_2_0(w2_qsv_2_0),
    .io_in_QSV_2_1(w2_qsv_2_1),
    .io_in_QSV_3_0(w2_qsv_3_0),
    .io_in_QSV_3_1(w2_qsv_3_1),
    .io_in_valid(w2_valid),
    .io_out_QSV_0_0(w3_qsv_0_0),
    .io_out_QSV_0_1(w3_qsv_0_1),
    .io_out_QSV_1_0(w3_qsv_1_0),
    .io_out_QSV_1_1(w3_qsv_1_1),
    .io_out_QSV_2_0(w3_qsv_2_0),
    .io_out_QSV_2_1(w3_qsv_2_1),
    .io_out_QSV_3_0(w3_qsv_3_0),
    .io_out_QSV_3_1(w3_qsv_3_1),
    .io_out_valid(w3_valid)
  );

  // Stage 4: Permutation after Qubit 1 gate
  CompatiblePerm inst_3_perm2 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(w3_qsv_0_0),
    .io_in_QSV_0_1(w3_qsv_0_1),
    .io_in_QSV_1_0(w3_qsv_1_0),
    .io_in_QSV_1_1(w3_qsv_1_1),
    .io_in_QSV_2_0(w3_qsv_2_0),
    .io_in_QSV_2_1(w3_qsv_2_1),
    .io_in_QSV_3_0(w3_qsv_3_0),
    .io_in_QSV_3_1(w3_qsv_3_1),
    .io_in_valid(w3_valid),
    .io_out_QSV_0_0(w4_qsv_0_0),
    .io_out_QSV_0_1(w4_qsv_0_1),
    .io_out_QSV_1_0(w4_qsv_1_0),
    .io_out_QSV_1_1(w4_qsv_1_1),
    .io_out_QSV_2_0(w4_qsv_2_0),
    .io_out_QSV_2_1(w4_qsv_2_1),
    .io_out_QSV_3_0(w4_qsv_3_0),
    .io_out_QSV_3_1(w4_qsv_3_1),
    .io_out_valid(w4_valid)
  );

  // Stage 5: SWAP Gate
  SWGate2QubitVector16bit inst_4_swap (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(w4_qsv_0_0),
    .io_in_QSV_0_1(w4_qsv_0_1),
    .io_in_QSV_1_0(w4_qsv_1_0),
    .io_in_QSV_1_1(w4_qsv_1_1),
    .io_in_QSV_2_0(w4_qsv_2_0),
    .io_in_QSV_2_1(w4_qsv_2_1),
    .io_in_QSV_3_0(w4_qsv_3_0),
    .io_in_QSV_3_1(w4_qsv_3_1),
    .io_in_valid(w4_valid),
    .io_out_QSV_0_0(io_out_QSV_0_0),
    .io_out_QSV_0_1(io_out_QSV_0_1),
    .io_out_QSV_1_0(io_out_QSV_1_0),
    .io_out_QSV_1_1(io_out_QSV_1_1),
    .io_out_QSV_2_0(io_out_QSV_2_0),
    .io_out_QSV_2_1(io_out_QSV_2_1),
    .io_out_QSV_3_0(io_out_QSV_3_0),
    .io_out_QSV_3_1(io_out_QSV_3_1),
    .io_out_valid(io_out_valid)
  );

endmodule
