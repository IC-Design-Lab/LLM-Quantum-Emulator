module Circuit0_06 (
  input         clock,
  input         reset,
  input  [15:0] io_in_QSV_0_0,
  input  [15:0] io_in_QSV_0_1,
  input  [15:0] io_in_QSV_1_0,
  input  [15:0] io_in_QSV_1_1,
  input  [15:0] io_in_QSV_2_0,
  input  [15:0] io_in_QSV_2_1,
  input  [15:0] io_in_QSV_3_0,
  input  [15:0] io_in_QSV_3_1,
  input         io_in_valid,
  output [15:0] io_out_QSV_0_0,
  output [15:0] io_out_QSV_0_1,
  output [15:0] io_out_QSV_1_0,
  output [15:0] io_out_QSV_1_1,
  output [15:0] io_out_QSV_2_0,
  output [15:0] io_out_QSV_2_1,
  output [15:0] io_out_QSV_3_0,
  output [15:0] io_out_QSV_3_1,
  output        io_out_valid
);

  // Stage 1: H on qubit 0 (target q0 -> no perm)
  wire [15:0] s1_QSV_0_0, s1_QSV_0_1;
  wire [15:0] s1_QSV_1_0, s1_QSV_1_1;
  wire [15:0] s1_QSV_2_0, s1_QSV_2_1;
  wire [15:0] s1_QSV_3_0, s1_QSV_3_1;
  wire        s1_valid;

  HGate2QubitVector16bit h_q0 (
    .clock         (clock),
    .reset         (reset),
    .io_in_valid   (io_in_valid),
    .io_in_QSV_0_0 (io_in_QSV_0_0),
    .io_in_QSV_0_1 (io_in_QSV_0_1),
    .io_in_QSV_1_0 (io_in_QSV_1_0),
    .io_in_QSV_1_1 (io_in_QSV_1_1),
    .io_in_QSV_2_0 (io_in_QSV_2_0),
    .io_in_QSV_2_1 (io_in_QSV_2_1),
    .io_in_QSV_3_0 (io_in_QSV_3_0),
    .io_in_QSV_3_1 (io_in_QSV_3_1),
    .io_out_valid  (s1_valid),
    .io_out_QSV_0_0(s1_QSV_0_0),
    .io_out_QSV_0_1(s1_QSV_0_1),
    .io_out_QSV_1_0(s1_QSV_1_0),
    .io_out_QSV_1_1(s1_QSV_1_1),
    .io_out_QSV_2_0(s1_QSV_2_0),
    .io_out_QSV_2_1(s1_QSV_2_1),
    .io_out_QSV_3_0(s1_QSV_3_0),
    .io_out_QSV_3_1(s1_QSV_3_1)
  );

  // Stage 2: CNOT control q1, target q0 (target q0 -> no perm)
  CNGate2QubitVector16bit cnot_c1_t0 (
    .clock         (clock),
    .reset         (reset),
    .io_in_valid   (s1_valid),
    .io_in_QSV_0_0 (s1_QSV_0_0),
    .io_in_QSV_0_1 (s1_QSV_0_1),
    .io_in_QSV_1_0 (s1_QSV_1_0),
    .io_in_QSV_1_1 (s1_QSV_1_1),
    .io_in_QSV_2_0 (s1_QSV_2_0),
    .io_in_QSV_2_1 (s1_QSV_2_1),
    .io_in_QSV_3_0 (s1_QSV_3_0),
    .io_in_QSV_3_1 (s1_QSV_3_1),
    .io_out_valid  (io_out_valid),
    .io_out_QSV_0_0(io_out_QSV_0_0),
    .io_out_QSV_0_1(io_out_QSV_0_1),
    .io_out_QSV_1_0(io_out_QSV_1_0),
    .io_out_QSV_1_1(io_out_QSV_1_1),
    .io_out_QSV_2_0(io_out_QSV_2_0),
    .io_out_QSV_2_1(io_out_QSV_2_1),
    .io_out_QSV_3_0(io_out_QSV_3_0),
    .io_out_QSV_3_1(io_out_QSV_3_1)
  );

endmodule
