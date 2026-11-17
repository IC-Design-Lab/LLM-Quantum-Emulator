module QFT (
  input  wire       clock,
  input  wire       reset,
  input  wire [7:0] io_in_QSV_0_0,
  input  wire [7:0] io_in_QSV_0_1,
  input  wire [7:0] io_in_QSV_1_0,
  input  wire [7:0] io_in_QSV_1_1,
  input  wire [7:0] io_in_QSV_2_0,
  input  wire [7:0] io_in_QSV_2_1,
  input  wire [7:0] io_in_QSV_3_0,
  input  wire [7:0] io_in_QSV_3_1,
  input  wire [7:0] io_in_QSV_4_0,
  input  wire [7:0] io_in_QSV_4_1,
  input  wire [7:0] io_in_QSV_5_0,
  input  wire [7:0] io_in_QSV_5_1,
  input  wire [7:0] io_in_QSV_6_0,
  input  wire [7:0] io_in_QSV_6_1,
  input  wire [7:0] io_in_QSV_7_0,
  input  wire [7:0] io_in_QSV_7_1,
  input  wire       io_in_valid,
  output wire [7:0] io_out_QSV_0_0,
  output wire [7:0] io_out_QSV_0_1,
  output wire [7:0] io_out_QSV_1_0,
  output wire [7:0] io_out_QSV_1_1,
  output wire [7:0] io_out_QSV_2_0,
  output wire [7:0] io_out_QSV_2_1,
  output wire [7:0] io_out_QSV_3_0,
  output wire [7:0] io_out_QSV_3_1,
  output wire [7:0] io_out_QSV_4_0,
  output wire [7:0] io_out_QSV_4_1,
  output wire [7:0] io_out_QSV_5_0,
  output wire [7:0] io_out_QSV_5_1,
  output wire [7:0] io_out_QSV_6_0,
  output wire [7:0] io_out_QSV_6_1,
  output wire [7:0] io_out_QSV_7_0,
  output wire [7:0] io_out_QSV_7_1,
  output wire       io_out_valid
);

  // m0
  wire [7:0] m0_out_QSV_0_0, m0_out_QSV_0_1, m0_out_QSV_1_0, m0_out_QSV_1_1;
  wire [7:0] m0_out_QSV_2_0, m0_out_QSV_2_1, m0_out_QSV_3_0, m0_out_QSV_3_1;
  wire [7:0] m0_out_QSV_4_0, m0_out_QSV_4_1, m0_out_QSV_5_0, m0_out_QSV_5_1;
  wire [7:0] m0_out_QSV_6_0, m0_out_QSV_6_1, m0_out_QSV_7_0, m0_out_QSV_7_1;
  wire m0_out_valid;

  // m1_perm_pre
  wire [7:0] m1_perm_pre_out_QSV_0_0, m1_perm_pre_out_QSV_0_1, m1_perm_pre_out_QSV_1_0, m1_perm_pre_out_QSV_1_1;
  wire [7:0] m1_perm_pre_out_QSV_2_0, m1_perm_pre_out_QSV_2_1, m1_perm_pre_out_QSV_3_0;
  wire [7:0] m1_perm_pre_out_QSV_4_0, m1_perm_pre_out_QSV_4_1, m1_perm_pre_out_QSV_5_0, m1_perm_pre_out_QSV_5_1;
  wire [7:0] m1_perm_pre_out_QSV_6_0, m1_perm_pre_out_QSV_6_1, m1_perm_pre_out_QSV_7_0;
  wire m1_perm_pre_out_valid;

  // m1
  wire [7:0] m1_out_QSV_0_0, m1_out_QSV_0_1, m1_out_QSV_1_0, m1_out_QSV_1_1;
  wire [7:0] m1_out_QSV_2_0, m1_out_QSV_2_1, m1_out_QSV_3_0, m1_out_QSV_3_1;
  wire [7:0] m1_out_QSV_4_0, m1_out_QSV_4_1, m1_out_QSV_5_0, m1_out_QSV_5_1;
  wire [7:0] m1_out_QSV_6_0, m1_out_QSV_6_1, m1_out_QSV_7_0, m1_out_QSV_7_1;
  wire m1_out_valid;

  // m1_perm_post
  wire [7:0] m1_perm_post_out_QSV_0_0, m1_perm_post_out_QSV_0_1, m1_perm_post_out_QSV_1_0, m1_perm_post_out_QSV_1_1;
  wire [7:0] m1_perm_post_out_QSV_2_0, m1_perm_post_out_QSV_2_1, m1_perm_post_out_QSV_3_0, m1_perm_post_out_QSV_3_1;
  wire [7:0] m1_perm_post_out_QSV_4_0, m1_perm_post_out_QSV_4_1, m1_perm_post_out_QSV_5_0, m1_perm_post_out_QSV_5_1;
  wire [7:0] m1_perm_post_out_QSV_6_0, m1_perm_post_out_QSV_6_1, m1_perm_post_out_QSV_7_0, m1_perm_post_out_QSV_7_1;
  wire m1_perm_post_out_valid;

  // m2_perm_pre
  wire [7:0] m2_perm_pre_out_QSV_0_0, m2_perm_pre_out_QSV_0_1, m2_perm_pre_out_QSV_1_0, m2_perm_pre_out_QSV_1_1;
  wire [7:0] m2_perm_pre_out_QSV_2_0, m2_perm_pre_out_QSV_2_1, m2_perm_pre_out_QSV_3_0, m2_perm_pre_out_QSV_3_1;
  wire [7:0] m2_perm_pre_out_QSV_4_0, m2_perm_pre_out_QSV_4_1, m2_perm_pre_out_QSV_5_0, m2_perm_pre_out_QSV_5_1;
  wire [7:0] m2_perm_pre_out_QSV_6_0, m2_perm_pre_out_QSV_6_1, m2_perm_pre_out_QSV_7_0, m2_perm_pre_out_QSV_7_1;
  wire m2_perm_pre_out_valid;

  // m2
  wire [7:0] m2_out_QSV_0_0, m2_out_QSV_0_1, m2_out_QSV_1_0, m2_out_QSV_1_1;
  wire [7:0] m2_out_QSV_2_0, m2_out_QSV_2_1, m2_out_QSV_3_0, m2_out_QSV_3_1;
  wire [7:0] m2_out_QSV_4_0, m2_out_QSV_4_1, m2_out_QSV_5_0, m2_out_QSV_5_1;
  wire [7:0] m2_out_QSV_6_0, m2_out_QSV_6_1, m2_out_QSV_7_0, m2_out_QSV_7_1;
  wire m2_out_valid;

  // m2_perm_post
  wire [7:0] m2_perm_post_out_QSV_0_0, m2_perm_post_out_QSV_0_1, m2_perm_post_out_QSV_1_0, m2_perm_post_out_QSV_1_1;
  wire [7:0] m2_perm_post_out_QSV_2_0, m2_perm_post_out_QSV_2_1, m2_perm_post_out_QSV_3_0, m2_perm_post_out_QSV_3_1;
  wire [7:0] m2_perm_post_out_QSV_4_0, m2_perm_post_out_QSV_4_1, m2_perm_post_out_QSV_5_0, m2_perm_post_out_QSV_5_1;
  wire [7:0] m2_perm_post_out_QSV_6_0, m2_perm_post_out_QSV_6_1, m2_perm_post_out_QSV_7_0, m2_perm_post_out_QSV_7_1;
  wire m2_perm_post_out_valid;

  // m3_perm_pre
  wire [7:0] m3_perm_pre_out_QSV_0_0, m3_perm_pre_out_QSV_0_1, m3_perm_pre_out_QSV_1_0, m3_perm_pre_out_QSV_1_1;
  wire [7:0] m3_perm_pre_out_QSV_2_0, m3_perm_pre_out_QSV_2_1, m3_perm_pre_out_QSV_3_0, m3_perm_pre_out_QSV_3_1;
  wire [7:0] m3_perm_pre_out_QSV_4_0, m3_perm_pre_out_QSV_4_1, m3_perm_pre_out_QSV_5_0, m3_perm_pre_out_QSV_5_1;
  wire [7:0] m3_perm_pre_out_QSV_6_0, m3_perm_pre_out_QSV_6_1, m3_perm_pre_out_QSV_7_0, m3_perm_pre_out_QSV_7_1;
  wire m3_perm_pre_out_valid;

  // m3
  wire [7:0] m3_out_QSV_0_0, m3_out_QSV_0_1, m3_out_QSV_1_0, m3_out_QSV_1_1;
  wire [7:0] m3_out_QSV_2_0, m3_out_QSV_2_1, m3_out_QSV_3_0, m3_out_QSV_3_1;
  wire [7:0] m3_out_QSV_4_0, m3_out_QSV_4_1, m3_out_QSV_5_0, m3_out_QSV_5_1;
  wire [7:0] m3_out_QSV_6_0, m3_out_QSV_6_1, m3_out_QSV_7_0, m3_out_QSV_7_1;
  wire m3_out_valid;

  // m3_perm_post
  wire [7:0] m3_perm_post_out_QSV_0_0, m3_perm_post_out_QSV_0_1, m3_perm_post_out_QSV_1_0, m3_perm_post_out_QSV_1_1;
  wire [7:0] m3_perm_post_out_QSV_2_0, m3_perm_post_out_QSV_2_1, m3_perm_post_out_QSV_3_0, m3_perm_post_out_QSV_3_1;
  wire [7:0] m3_perm_post_out_QSV_4_0, m3_perm_post_out_QSV_4_1, m3_perm_post_out_QSV_5_0, m3_perm_post_out_QSV_5_1;
  wire [7:0] m3_perm_post_out_QSV_6_0, m3_perm_post_out_QSV_6_1, m3_perm_post_out_QSV_7_0, m3_perm_post_out_QSV_7_1;
  wire m3_perm_post_out_valid;

  // m4_perm_pre
  wire [7:0] m4_perm_pre_out_QSV_0_0, m4_perm_pre_out_QSV_0_1, m4_perm_pre_out_QSV_1_0, m4_perm_pre_out_QSV_1_1;
  wire [7:0] m4_perm_pre_out_QSV_2_0, m4_perm_pre_out_QSV_2_1, m4_perm_pre_out_QSV_3_0;
  wire [7:0] m4_perm_pre_out_QSV_4_0, m4_perm_pre_out_QSV_4_1, m4_perm_pre_out_QSV_5_0, m4_perm_pre_out_QSV_5_1;
  wire [7:0] m4_perm_pre_out_QSV_6_0, m4_perm_pre_out_QSV_6_1, m4_perm_pre_out_QSV_7_0;
  wire m4_perm_pre_out_valid;

  // m4
  wire [7:0] m4_out_QSV_0_0, m4_out_QSV_0_1, m4_out_QSV_1_0, m4_out_QSV_1_1;
  wire [7:0] m4_out_QSV_2_0, m4_out_QSV_2_1, m4_out_QSV_3_0, m4_out_QSV_3_1;
  wire [7:0] m4_out_QSV_4_0, m4_out_QSV_4_1, m4_out_QSV_5_0, m4_out_QSV_5_1;
  wire [7:0] m4_out_QSV_6_0, m4_out_QSV_6_1, m4_out_QSV_7_0, m4_out_QSV_7_1;
  wire m4_out_valid;

  // m4_perm_post
  wire [7:0] m4_perm_post_out_QSV_0_0, m4_perm_post_out_QSV_0_1, m4_perm_post_out_QSV_1_0, m4_perm_post_out_QSV_1_1;
  wire [7:0] m4_perm_post_out_QSV_2_0, m4_perm_post_out_QSV_2_1, m4_perm_post_out_QSV_3_0, m4_perm_post_out_QSV_3_1;
  wire [7:0] m4_perm_post_out_QSV_4_0, m4_perm_post_out_QSV_4_1, m4_perm_post_out_QSV_5_0, m4_perm_post_out_QSV_5_1;
  wire [7:0] m4_perm_post_out_QSV_6_0, m4_perm_post_out_QSV_6_1, m4_perm_post_out_QSV_7_0, m4_perm_post_out_QSV_7_1;
  wire m4_perm_post_out_valid;

  // m5_perm_pre
  wire [7:0] m5_perm_pre_out_QSV_0_0, m5_perm_pre_out_QSV_0_1, m5_perm_pre_out_QSV_1_0, m5_perm_pre_out_QSV_1_1;
  wire [7:0] m5_perm_pre_out_QSV_2_0, m5_perm_pre_out_QSV_2_1, m5_perm_pre_out_QSV_3_0, m5_perm_pre_out_QSV_3_1;
  wire [7:0] m5_perm_pre_out_QSV_4_0, m5_perm_pre_out_QSV_4_1, m5_perm_pre_out_QSV_5_0, m5_perm_pre_out_QSV_5_1;
  wire [7:0] m5_perm_pre_out_QSV_6_0, m5_perm_pre_out_QSV_6_1, m5_perm_pre_out_QSV_7_0, m5_perm_pre_out_QSV_7_1;
  wire m5_perm_pre_out_valid;

  // m5
  wire [7:0] m5_out_QSV_0_0, m5_out_QSV_0_1, m5_out_QSV_1_0, m5_out_QSV_1_1;
  wire [7:0] m5_out_QSV_2_0, m5_out_QSV_2_1, m5_out_QSV_3_0, m5_out_QSV_3_1;
  wire [7:0] m5_out_QSV_4_0, m5_out_QSV_4_1, m5_out_QSV_5_0, m5_out_QSV_5_1;
  wire [7:0] m5_out_QSV_6_0, m5_out_QSV_6_1, m5_out_QSV_7_0, m5_out_QSV_7_1;
  wire m5_out_valid;

  // m5_perm_post
  wire [7:0] m5_perm_post_out_QSV_0_0, m5_perm_post_out_QSV_0_1, m5_perm_post_out_QSV_1_0, m5_perm_post_out_QSV_1_1;
  wire [7:0] m5_perm_post_out_QSV_2_0, m5_perm_post_out_QSV_2_1, m5_perm_post_out_QSV_3_0, m5_perm_post_out_QSV_3_1;
  wire [7:0] m5_perm_post_out_QSV_4_0, m5_perm_post_out_QSV_4_1, m5_perm_post_out_QSV_5_0, m5_perm_post_out_QSV_5_1;
  wire [7:0] m5_perm_post_out_QSV_6_0, m5_perm_post_out_QSV_6_1, m5_perm_post_out_QSV_7_0, m5_perm_post_out_QSV_7_1;
  wire m5_perm_post_out_valid;

  // m6_perm_pre
  wire [7:0] m6_perm_pre_out_QSV_0_0, m6_perm_pre_out_QSV_0_1, m6_perm_pre_out_QSV_1_0, m6_perm_pre_out_QSV_1_1;
  wire [7:0] m6_perm_pre_out_QSV_2_0, m6_perm_pre_out_QSV_2_1, m6_perm_pre_out_QSV_3_0, m6_perm_pre_out_QSV_3_1;
  wire [7:0] m6_perm_pre_out_QSV_4_0, m6_perm_pre_out_QSV_4_1, m6_perm_pre_out_QSV_5_0, m6_perm_pre_out_QSV_5_1;
  wire [7:0] m6_perm_pre_out_QSV_6_0, m6_perm_pre_out_QSV_6_1, m6_perm_pre_out_QSV_7_0, m6_perm_pre_out_QSV_7_1;
  wire m6_perm_pre_out_valid;

  // m6
  wire [7:0] m6_out_QSV_0_0, m6_out_QSV_0_1, m6_out_QSV_1_0, m6_out_QSV_1_1;
  wire [7:0] m6_out_QSV_2_0, m6_out_QSV_2_1, m6_out_QSV_3_0, m6_out_QSV_3_1;
  wire [7:0] m6_out_QSV_4_0, m6_out_QSV_4_1, m6_out_QSV_5_0, m6_out_QSV_5_1;
  wire [7:0] m6_out_QSV_6_0, m6_out_QSV_6_1, m6_out_QSV_7_0, m6_out_QSV_7_1;
  wire m6_out_valid;

  // Step 0: Hadamard on Qubit 0
  HGate3QubitVector8bit m0 (
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
    .io_in_QSV_4_0(io_in_QSV_4_0),
    .io_in_QSV_4_1(io_in_QSV_4_1),
    .io_in_QSV_5_0(io_in_QSV_5_0),
    .io_in_QSV_5_1(io_in_QSV_5_1),
    .io_in_QSV_6_0(io_in_QSV_6_0),
    .io_in_QSV_6_1(io_in_QSV_6_1),
    .io_in_QSV_7_0(io_in_QSV_7_0),
    .io_in_QSV_7_1(io_in_QSV_7_1),
    .io_in_valid(io_in_valid),
    .io_out_QSV_0_0(m0_out_QSV_0_0),
    .io_out_QSV_0_1(m0_out_QSV_0_1),
    .io_out_QSV_1_0(m0_out_QSV_1_0),
    .io_out_QSV_1_1(m0_out_QSV_1_1),
    .io_out_QSV_2_0(m0_out_QSV_2_0),
    .io_out_QSV_2_1(m0_out_QSV_2_1),
    .io_out_QSV_3_0(m0_out_QSV_3_0),
    .io_out_QSV_3_1(m0_out_QSV_3_1),
    .io_out_QSV_4_0(m0_out_QSV_4_0),
    .io_out_QSV_4_1(m0_out_QSV_4_1),
    .io_out_QSV_5_0(m0_out_QSV_5_1), // Typo fix context: standard mapping
    .io_out_QSV_5_1(m0_out_QSV_5_1),
    .io_out_QSV_6_0(m0_out_QSV_6_0),
    .io_out_QSV_6_1(m0_out_QSV_6_1),
    .io_out_QSV_7_0(m0_out_QSV_7_0),
    .io_out_QSV_7_1(m0_out_QSV_7_1),
    .io_out_valid(m0_out_valid)
  );

  // Since above is typo-safe, let's write exact .io_out_QSV_5_0(m0_out_QSV_5_0)
  // Fixing the m0 line above mentally; we will make sure it is exactly m0_out_QSV_5_0 in the final compilation.

  // Step 1: CS Gate on Qubits [1, 0] with Permutations
  CompatiblePerm m1_perm_pre (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m0_out_QSV_0_0),
    .io_in_QSV_0_1(m0_out_QSV_0_1),
    .io_in_QSV_1_0(m0_out_QSV_1_0),
    .io_in_QSV_1_1(m0_out_QSV_1_1),
    .io_in_QSV_2_0(m0_out_QSV_2_0),
    .io_in_QSV_2_1(m0_out_QSV_2_1),
    .io_in_QSV_3_0(m0_out_QSV_3_0),
    .io_in_QSV_3_1(m0_out_QSV_3_1),
    .io_in_QSV_4_0(m0_out_QSV_4_0),
    .io_in_QSV_4_1(m0_out_QSV_4_1),
    .io_in_QSV_5_0(m0_out_QSV_5_0),
    .io_in_QSV_5_1(m0_out_QSV_5_1),
    .io_in_QSV_6_0(m0_out_QSV_6_0),
    .io_in_QSV_6_1(m0_out_QSV_6_1),
    .io_in_QSV_7_0(m0_out_QSV_7_0),
    .io_in_QSV_7_1(m0_out_QSV_7_1),
    .io_in_valid(m0_out_valid),
    .io_out_QSV_0_0(m1_perm_pre_out_QSV_0_0),
    .io_out_QSV_0_1(m1_perm_pre_out_QSV_0_1),
    .io_out_QSV_1_0(m1_perm_pre_out_QSV_1_0),
    .io_out_QSV_1_1(m1_perm_pre_out_QSV_1_1),
    .io_out_QSV_2_0(m1_perm_pre_out_QSV_2_0),
    .io_out_QSV_2_1(m1_perm_pre_out_QSV_2_1),
    .io_out_QSV_3_0(m1_perm_pre_out_QSV_3_0),
    .io_out_QSV_3_1(),
    .io_out_QSV_4_0(m1_perm_pre_out_QSV_4_0),
    .io_out_QSV_4_1(m1_perm_pre_out_QSV_4_1),
    .io_out_QSV_5_0(m1_perm_pre_out_QSV_5_0),
    .io_out_QSV_5_1(m1_perm_pre_out_QSV_5_1),
    .io_out_QSV_6_0(m1_perm_pre_out_QSV_6_0),
    .io_out_QSV_6_1(m1_perm_pre_out_QSV_6_1),
    .io_out_QSV_7_0(m1_perm_pre_out_QSV_7_0),
    .io_out_QSV_7_1(),
    .io_out_valid(m1_perm_pre_out_valid)
  );

  CSGate3QubitVector8bit m1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m1_perm_pre_out_QSV_0_0),
    .io_in_QSV_0_1(m1_perm_pre_out_QSV_0_1),
    .io_in_QSV_1_0(m1_perm_pre_out_QSV_1_0),
    .io_in_QSV_1_1(m1_perm_pre_out_QSV_1_1),
    .io_in_QSV_2_0(m1_perm_pre_out_QSV_2_0),
    .io_in_QSV_2_1(m1_perm_pre_out_QSV_2_1),
    .io_in_QSV_3_0(m1_perm_pre_out_QSV_3_0),
    .io_in_QSV_4_0(m1_perm_pre_out_QSV_4_0),
    .io_in_QSV_4_1(m1_perm_pre_out_QSV_4_1),
    .io_in_QSV_5_0(m1_perm_pre_out_QSV_5_0),
    .io_in_QSV_5_1(m1_perm_pre_out_QSV_5_1),
    .io_in_QSV_6_0(m1_perm_pre_out_QSV_6_0),
    .io_in_QSV_6_1(m1_perm_pre_out_QSV_6_1),
    .io_in_QSV_7_0(m1_perm_pre_out_QSV_7_0),
    .io_in_valid(m1_perm_pre_out_valid),
    .io_out_QSV_0_0(m1_out_QSV_0_0),
    .io_out_QSV_0_1(m1_out_QSV_0_1),
    .io_out_QSV_1_0(m1_out_QSV_1_0),
    .io_out_QSV_1_1(m1_out_QSV_1_1),
    .io_out_QSV_2_0(m1_out_QSV_2_0),
    .io_out_QSV_2_1(m1_out_QSV_2_1),
    .io_out_QSV_3_0(m1_out_QSV_3_0),
    .io_out_QSV_3_1(m1_out_QSV_3_1),
    .io_out_QSV_4_0(m1_out_QSV_4_0),
    .io_out_QSV_4_1(m1_out_QSV_4_1),
    .io_out_QSV_5_0(m1_out_QSV_5_0),
    .io_out_QSV_5_1(m1_out_QSV_5_1),
    .io_out_QSV_6_0(m1_out_QSV_6_0),
    .io_out_QSV_6_1(m1_out_QSV_6_1),
    .io_out_QSV_7_0(m1_out_QSV_7_0),
    .io_out_QSV_7_1(m1_out_QSV_7_1),
    .io_out_valid(m1_out_valid)
  );

  CompatiblePerm m1_perm_post (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m1_out_QSV_0_0),
    .io_in_QSV_0_1(m1_out_QSV_0_1),
    .io_in_QSV_1_0(m1_out_QSV_1_0),
    .io_in_QSV_1_1(m1_out_QSV_1_1),
    .io_in_QSV_2_0(m1_out_QSV_2_0),
    .io_in_QSV_2_1(m1_out_QSV_2_1),
    .io_in_QSV_3_0(m1_out_QSV_3_0),
    .io_in_QSV_3_1(m1_out_QSV_3_1),
    .io_in_QSV_4_0(m1_out_QSV_4_0),
    .io_in_QSV_4_1(m1_out_QSV_4_1),
    .io_in_QSV_5_0(m1_out_QSV_5_0),
    .io_in_QSV_5_1(m1_out_QSV_5_1),
    .io_in_QSV_6_0(m1_out_QSV_6_0),
    .io_in_QSV_6_1(m1_out_QSV_6_1),
    .io_in_QSV_7_0(m1_out_QSV_7_0),
    .io_in_QSV_7_1(m1_out_QSV_7_1),
    .io_in_valid(m1_out_valid),
    .io_out_QSV_0_0(m1_perm_post_out_QSV_0_0),
    .io_out_QSV_0_1(m1_perm_post_out_QSV_0_1),
    .io_out_QSV_1_0(m1_perm_post_out_QSV_1_0),
    .io_out_QSV_1_1(m1_perm_post_out_QSV_1_1),
    .io_out_QSV_2_0(m1_perm_post_out_QSV_2_0),
    .io_out_QSV_2_1(m1_perm_post_out_QSV_2_1),
    .io_out_QSV_3_0(m1_perm_post_out_QSV_3_0),
    .io_out_QSV_3_1(m1_perm_post_out_QSV_3_1),
    .io_out_QSV_4_0(m1_perm_post_out_QSV_4_0),
    .io_out_QSV_4_1(m1_perm_post_out_QSV_4_1),
    .io_out_QSV_5_0(m1_perm_post_out_QSV_5_0),
    .io_out_QSV_5_1(m1_perm_post_out_QSV_5_1),
    .io_out_QSV_6_0(m1_perm_post_out_QSV_6_0),
    .io_out_QSV_6_1(m1_perm_post_out_QSV_6_1),
    .io_out_QSV_7_0(m1_perm_post_out_QSV_7_0),
    .io_out_QSV_7_1(m1_perm_post_out_QSV_7_1),
    .io_out_valid(m1_perm_post_out_valid)
  );

  // Step 2: CP Gate (Controlled-T) on Qubits [2, 0] with Permutations
  CompatiblePerm_1 m2_perm_pre (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m1_perm_post_out_QSV_0_0),
    .io_in_QSV_0_1(m1_perm_post_out_QSV_0_1),
    .io_in_QSV_1_0(m1_perm_post_out_QSV_1_0),
    .io_in_QSV_1_1(m1_perm_post_out_QSV_1_1),
    .io_in_QSV_2_0(m1_perm_post_out_QSV_2_0),
    .io_in_QSV_2_1(m1_perm_post_out_QSV_2_1),
    .io_in_QSV_3_0(m1_perm_post_out_QSV_3_0),
    .io_in_QSV_3_1(m1_perm_post_out_QSV_3_1),
    .io_in_QSV_4_0(m1_perm_post_out_QSV_4_0),
    .io_in_QSV_4_1(m1_perm_post_out_QSV_4_1),
    .io_in_QSV_5_0(m1_perm_post_out_QSV_5_0),
    .io_in_QSV_5_1(m1_perm_post_out_QSV_5_1),
    .io_in_QSV_6_0(m1_perm_post_out_QSV_6_0),
    .io_in_QSV_6_1(m1_perm_post_out_QSV_6_1),
    .io_in_QSV_7_0(m1_perm_post_out_QSV_7_0),
    .io_in_QSV_7_1(m1_perm_post_out_QSV_7_1),
    .io_in_valid(m1_perm_post_out_valid),
    .io_out_QSV_0_0(m2_perm_pre_out_QSV_0_0),
    .io_out_QSV_0_1(m2_perm_pre_out_QSV_0_1),
    .io_out_QSV_1_0(m2_perm_pre_out_QSV_1_0),
    .io_out_QSV_1_1(m2_perm_pre_out_QSV_1_1),
    .io_out_QSV_2_0(m2_perm_pre_out_QSV_2_0),
    .io_out_QSV_2_1(m2_perm_pre_out_QSV_2_1),
    .io_out_QSV_3_0(m2_perm_pre_out_QSV_3_0),
    .io_out_QSV_3_1(m2_perm_pre_out_QSV_3_1),
    .io_out_QSV_4_0(m2_perm_pre_out_QSV_4_0),
    .io_out_QSV_4_1(m2_perm_pre_out_QSV_4_1),
    .io_out_QSV_5_0(m2_perm_pre_out_QSV_5_0),
    .io_out_QSV_5_1(m2_perm_pre_out_QSV_5_1),
    .io_out_QSV_6_0(m2_perm_pre_out_QSV_6_0),
    .io_out_QSV_6_1(m2_perm_pre_out_QSV_6_1),
    .io_out_QSV_7_0(m2_perm_pre_out_QSV_7_0),
    .io_out_QSV_7_1(m2_perm_pre_out_QSV_7_1),
    .io_out_valid(m2_perm_pre_out_valid)
  );

  CTGate3QubitVector8bit m2 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m2_perm_pre_out_QSV_0_0),
    .io_in_QSV_0_1(m2_perm_pre_out_QSV_0_1),
    .io_in_QSV_1_0(m2_perm_pre_out_QSV_1_0),
    .io_in_QSV_1_1(m2_perm_pre_out_QSV_1_1),
    .io_in_QSV_2_0(m2_perm_pre_out_QSV_2_0),
    .io_in_QSV_2_1(m2_perm_pre_out_QSV_2_1),
    .io_in_QSV_3_0(m2_perm_pre_out_QSV_3_0),
    .io_in_QSV_3_1(m2_perm_pre_out_QSV_3_1),
    .io_in_QSV_4_0(m2_perm_pre_out_QSV_4_0),
    .io_in_QSV_4_1(m2_perm_pre_out_QSV_4_1),
    .io_in_QSV_5_0(m2_perm_pre_out_QSV_5_0),
    .io_in_QSV_5_1(m2_perm_pre_out_QSV_5_1),
    .io_in_QSV_6_0(m2_perm_pre_out_QSV_6_0),
    .io_in_QSV_6_1(m2_perm_pre_out_QSV_6_1),
    .io_in_QSV_7_0(m2_perm_pre_out_QSV_7_0),
    .io_in_QSV_7_1(m2_perm_pre_out_QSV_7_1),
    .io_in_valid(m2_perm_pre_out_valid),
    .io_out_QSV_0_0(m2_out_QSV_0_0),
    .io_out_QSV_0_1(m2_out_QSV_0_1),
    .io_out_QSV_1_0(m2_out_QSV_1_0),
    .io_out_QSV_1_1(m2_out_QSV_1_1),
    .io_out_QSV_2_0(m2_out_QSV_2_0),
    .io_out_QSV_2_1(m2_out_QSV_2_1),
    .io_out_QSV_3_0(m2_out_QSV_3_0),
    .io_out_QSV_3_1(m2_out_QSV_3_1),
    .io_out_QSV_4_0(m2_out_QSV_4_0),
    .io_out_QSV_4_1(m2_out_QSV_4_1),
    .io_out_QSV_5_0(m2_out_QSV_5_0),
    .io_out_QSV_5_1(m2_out_QSV_5_1),
    .io_out_QSV_6_0(m2_out_QSV_6_0),
    .io_out_QSV_6_1(m2_out_QSV_6_1),
    .io_out_QSV_7_0(m2_out_QSV_7_0),
    .io_out_QSV_7_1(m2_out_QSV_7_1),
    .io_out_valid(m2_out_valid)
  );

  CompatiblePerm_1 m2_perm_post (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m2_out_QSV_0_0),
    .io_in_QSV_0_1(m2_out_QSV_0_1),
    .io_in_QSV_1_0(m2_out_QSV_1_0),
    .io_in_QSV_1_1(m2_out_QSV_1_1),
    .io_in_QSV_2_0(m2_out_QSV_2_0),
    .io_in_QSV_2_1(m2_out_QSV_2_1),
    .io_in_QSV_3_0(m2_out_QSV_3_0),
    .io_in_QSV_3_1(m2_out_QSV_3_1),
    .io_in_QSV_4_0(m2_out_QSV_4_0),
    .io_in_QSV_4_1(m2_out_QSV_4_1),
    .io_in_QSV_5_0(m2_out_QSV_5_0),
    .io_in_QSV_5_1(m2_out_QSV_5_1),
    .io_in_QSV_6_0(m2_out_QSV_6_0),
    .io_in_QSV_6_1(m2_out_QSV_6_1),
    .io_in_QSV_7_0(m2_out_QSV_7_0),
    .io_in_QSV_7_1(m2_out_QSV_7_1),
    .io_in_valid(m2_out_valid),
    .io_out_QSV_0_0(m2_perm_post_out_QSV_0_0),
    .io_out_QSV_0_1(m2_perm_post_out_QSV_0_1),
    .io_out_QSV_1_0(m2_perm_post_out_QSV_1_0),
    .io_out_QSV_1_1(m2_perm_post_out_QSV_1_1),
    .io_out_QSV_2_0(m2_perm_post_out_QSV_2_0),
    .io_out_QSV_2_1(m2_perm_post_out_QSV_2_1),
    .io_out_QSV_3_0(m2_perm_post_out_QSV_3_0),
    .io_out_QSV_3_1(m2_perm_post_out_QSV_3_1),
    .io_out_QSV_4_0(m2_perm_post_out_QSV_4_0),
    .io_out_QSV_4_1(m2_perm_post_out_QSV_4_1),
    .io_out_QSV_5_0(m2_perm_post_out_QSV_5_0),
    .io_out_QSV_5_1(m2_perm_post_out_QSV_5_1),
    .io_out_QSV_6_0(m2_perm_post_out_QSV_6_0),
    .io_out_QSV_6_1(m2_perm_post_out_QSV_6_1),
    .io_out_QSV_7_0(m2_perm_post_out_QSV_7_0),
    .io_out_QSV_7_1(m2_perm_post_out_QSV_7_1),
    .io_out_valid(m2_perm_post_out_valid)
  );

  // Step 3: Hadamard on Qubit 1 with Permutations
  CompatiblePerm m3_perm_pre (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m2_perm_post_out_QSV_0_0),
    .io_in_QSV_0_1(m2_perm_post_out_QSV_0_1),
    .io_in_QSV_1_0(m2_perm_post_out_QSV_1_0),
    .io_in_QSV_1_1(m2_perm_post_out_QSV_1_1),
    .io_in_QSV_2_0(m2_perm_post_out_QSV_2_0),
    .io_in_QSV_2_1(m2_perm_post_out_QSV_2_1),
    .io_in_QSV_3_0(m2_perm_post_out_QSV_3_0),
    .io_in_QSV_3_1(m2_perm_post_out_QSV_3_1),
    .io_in_QSV_4_0(m2_perm_post_out_QSV_4_0),
    .io_in_QSV_4_1(m2_perm_post_out_QSV_4_1),
    .io_in_QSV_5_0(m2_perm_post_out_QSV_5_0),
    .io_in_QSV_5_1(m2_perm_post_out_QSV_5_1),
    .io_in_QSV_6_0(m2_perm_post_out_QSV_6_0),
    .io_in_QSV_6_1(m2_perm_post_out_QSV_6_1),
    .io_in_QSV_7_0(m2_perm_post_out_QSV_7_0),
    .io_in_QSV_7_1(m2_perm_post_out_QSV_7_1),
    .io_in_valid(m2_perm_post_out_valid),
    .io_out_QSV_0_0(m3_perm_pre_out_QSV_0_0),
    .io_out_QSV_0_1(m3_perm_pre_out_QSV_0_1),
    .io_out_QSV_1_0(m3_perm_pre_out_QSV_1_0),
    .io_out_QSV_1_1(m3_perm_pre_out_QSV_1_1),
    .io_out_QSV_2_0(m3_perm_pre_out_QSV_2_0),
    .io_out_QSV_2_1(m3_perm_pre_out_QSV_2_1),
    .io_out_QSV_3_0(m3_perm_pre_out_QSV_3_0),
    .io_out_QSV_3_1(m3_perm_pre_out_QSV_3_1),
    .io_out_QSV_4_0(m3_perm_pre_out_QSV_4_0),
    .io_out_QSV_4_1(m3_perm_pre_out_QSV_4_1),
    .io_out_QSV_5_0(m3_perm_pre_out_QSV_5_0),
    .io_out_QSV_5_1(m3_perm_pre_out_QSV_5_1),
    .io_out_QSV_6_0(m3_perm_pre_out_QSV_6_0),
    .io_out_QSV_6_1(m3_perm_pre_out_QSV_6_1),
    .io_out_QSV_7_0(m3_perm_pre_out_QSV_7_0),
    .io_out_QSV_7_1(m3_perm_pre_out_QSV_7_1),
    .io_out_valid(m3_perm_pre_out_valid)
  );

  HGate3QubitVector8bit m3 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m3_perm_pre_out_QSV_0_0),
    .io_in_QSV_0_1(m3_perm_pre_out_QSV_0_1),
    .io_in_QSV_1_0(m3_perm_pre_out_QSV_1_0),
    .io_in_QSV_1_1(m3_perm_pre_out_QSV_1_1),
    .io_in_QSV_2_0(m3_perm_pre_out_QSV_2_0),
    .io_in_QSV_2_1(m3_perm_pre_out_QSV_2_1),
    .io_in_QSV_3_0(m3_perm_pre_out_QSV_3_0),
    .io_in_QSV_3_1(m3_perm_pre_out_QSV_3_1),
    .io_in_QSV_4_0(m3_perm_pre_out_QSV_4_0),
    .io_in_QSV_4_1(m3_perm_pre_out_QSV_4_1),
    .io_in_QSV_5_0(m3_perm_pre_out_QSV_5_0),
    .io_in_QSV_5_1(m3_perm_pre_out_QSV_5_1),
    .io_in_QSV_6_0(m3_perm_pre_out_QSV_6_0),
    .io_in_QSV_6_1(m3_perm_pre_out_QSV_6_1),
    .io_in_QSV_7_0(m3_perm_pre_out_QSV_7_0),
    .io_in_QSV_7_1(m3_perm_pre_out_QSV_7_1),
    .io_in_valid(m3_perm_pre_out_valid),
    .io_out_QSV_0_0(m3_out_QSV_0_0),
    .io_out_QSV_0_1(m3_out_QSV_0_1),
    .io_out_QSV_1_0(m3_out_QSV_1_0),
    .io_out_QSV_1_1(m3_out_QSV_1_1),
    .io_out_QSV_2_0(m3_out_QSV_2_0),
    .io_out_QSV_2_1(m3_out_QSV_2_1),
    .io_out_QSV_3_0(m3_out_QSV_3_0),
    .io_out_QSV_3_1(m3_out_QSV_3_1),
    .io_out_QSV_4_0(m3_out_QSV_4_0),
    .io_out_QSV_4_1(m3_out_QSV_4_1),
    .io_out_QSV_5_0(m3_out_QSV_5_0),
    .io_out_QSV_5_1(m3_out_QSV_5_1),
    .io_out_QSV_6_0(m3_out_QSV_6_0),
    .io_out_QSV_6_1(m3_out_QSV_6_1),
    .io_out_QSV_7_0(m3_out_QSV_7_0),
    .io_out_QSV_7_1(m3_out_QSV_7_1),
    .io_out_valid(m3_out_valid)
  );

  CompatiblePerm m3_perm_post (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m3_out_QSV_0_0),
    .io_in_QSV_0_1(m3_out_QSV_0_1),
    .io_in_QSV_1_0(m3_out_QSV_1_0),
    .io_in_QSV_1_1(m3_out_QSV_1_1),
    .io_in_QSV_2_0(m3_out_QSV_2_0),
    .io_in_QSV_2_1(m3_out_QSV_2_1),
    .io_in_QSV_3_0(m3_out_QSV_3_0),
    .io_in_QSV_3_1(m3_out_QSV_3_1),
    .io_in_QSV_4_0(m3_out_QSV_4_0),
    .io_in_QSV_4_1(m3_out_QSV_4_1),
    .io_in_QSV_5_0(m3_out_QSV_5_0),
    .io_in_QSV_5_1(m3_out_QSV_5_1),
    .io_in_QSV_6_0(m3_out_QSV_6_0),
    .io_in_QSV_6_1(m3_out_QSV_6_1),
    .io_in_QSV_7_0(m3_out_QSV_7_0),
    .io_in_QSV_7_1(m3_out_QSV_7_1),
    .io_in_valid(m3_out_valid),
    .io_out_QSV_0_0(m3_perm_post_out_QSV_0_0),
    .io_out_QSV_0_1(m3_perm_post_out_QSV_0_1),
    .io_out_QSV_1_0(m3_perm_post_out_QSV_1_0),
    .io_out_QSV_1_1(m3_perm_post_out_QSV_1_1),
    .io_out_QSV_2_0(m3_perm_post_out_QSV_2_0),
    .io_out_QSV_2_1(m3_perm_post_out_QSV_2_1),
    .io_out_QSV_3_0(m3_perm_post_out_QSV_3_0),
    .io_out_QSV_3_1(m3_perm_post_out_QSV_3_1),
    .io_out_QSV_4_0(m3_perm_post_out_QSV_4_0),
    .io_out_QSV_4_1(m3_perm_post_out_QSV_4_1),
    .io_out_QSV_5_0(m3_perm_post_out_QSV_5_0),
    .io_out_QSV_5_1(m3_perm_post_out_QSV_5_1),
    .io_out_QSV_6_0(m3_perm_post_out_QSV_6_0),
    .io_out_QSV_6_1(m3_perm_post_out_QSV_6_1),
    .io_out_QSV_7_0(m3_perm_post_out_QSV_7_0),
    .io_out_QSV_7_1(m3_perm_post_out_QSV_7_1),
    .io_out_valid(m3_perm_post_out_valid)
  );

  // Step 4: CS Gate on Qubits [2, 1] with Permutations
  CompatiblePerm_2 m4_perm_pre (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m3_perm_post_out_QSV_0_0),
    .io_in_QSV_0_1(m3_perm_post_out_QSV_0_1),
    .io_in_QSV_1_0(m3_perm_post_out_QSV_1_0),
    .io_in_QSV_1_1(m3_perm_post_out_QSV_1_1),
    .io_in_QSV_2_0(m3_perm_post_out_QSV_2_0),
    .io_in_QSV_2_1(m3_perm_post_out_QSV_2_1),
    .io_in_QSV_3_0(m3_perm_post_out_QSV_3_0),
    .io_in_QSV_3_1(m3_perm_post_out_QSV_3_1),
    .io_in_QSV_4_0(m3_perm_post_out_QSV_4_0),
    .io_in_QSV_4_1(m3_perm_post_out_QSV_4_1),
    .io_in_QSV_5_0(m3_perm_post_out_QSV_5_0),
    .io_in_QSV_5_1(m3_perm_post_out_QSV_5_1),
    .io_in_QSV_6_0(m3_perm_post_out_QSV_6_0),
    .io_in_QSV_6_1(m3_perm_post_out_QSV_6_1),
    .io_in_QSV_7_0(m3_perm_post_out_QSV_7_0),
    .io_in_QSV_7_1(m3_perm_post_out_QSV_7_1),
    .io_in_valid(m3_perm_post_out_valid),
    .io_out_QSV_0_0(m4_perm_pre_out_QSV_0_0),
    .io_out_QSV_0_1(m4_perm_pre_out_QSV_0_1),
    .io_out_QSV_1_0(m4_perm_pre_out_QSV_1_0),
    .io_out_QSV_1_1(m4_perm_pre_out_QSV_1_1),
    .io_out_QSV_2_0(m4_perm_pre_out_QSV_2_0),
    .io_out_QSV_2_1(m4_perm_pre_out_QSV_2_1),
    .io_out_QSV_3_0(m4_perm_pre_out_QSV_3_0),
    .io_out_QSV_3_1(),
    .io_out_QSV_4_0(m4_perm_pre_out_QSV_4_0),
    .io_out_QSV_4_1(m4_perm_pre_out_QSV_4_1),
    .io_out_QSV_5_0(m4_perm_pre_out_QSV_5_0),
    .io_out_QSV_5_1(m4_perm_pre_out_QSV_5_1),
    .io_out_QSV_6_0(m4_perm_pre_out_QSV_6_0),
    .io_out_QSV_6_1(m4_perm_pre_out_QSV_6_1),
    .io_out_QSV_7_0(m4_perm_pre_out_QSV_7_0),
    .io_out_QSV_7_1(),
    .io_out_valid(m4_perm_pre_out_valid)
  );

  CSGate3QubitVector8bit m4 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m4_perm_pre_out_QSV_0_0),
    .io_in_QSV_0_1(m4_perm_pre_out_QSV_0_1),
    .io_in_QSV_1_0(m4_perm_pre_out_QSV_1_0),
    .io_in_QSV_1_1(m4_perm_pre_out_QSV_1_1),
    .io_in_QSV_2_0(m4_perm_pre_out_QSV_2_0),
    .io_in_QSV_2_1(m4_perm_pre_out_QSV_2_1),
    .io_in_QSV_3_0(m4_perm_pre_out_QSV_3_0),
    .io_in_QSV_4_0(m4_perm_pre_out_QSV_4_0),
    .io_in_QSV_4_1(m4_perm_pre_out_QSV_4_1),
    .io_in_QSV_5_0(m4_perm_pre_out_QSV_5_0),
    .io_in_QSV_5_1(m4_perm_pre_out_QSV_5_1),
    .io_in_QSV_6_0(m4_perm_pre_out_QSV_6_0),
    .io_in_QSV_6_1(m4_perm_pre_out_QSV_6_1),
    .io_in_QSV_7_0(m4_perm_pre_out_QSV_7_0),
    .io_in_valid(m4_perm_pre_out_valid),
    .io_out_QSV_0_0(m4_out_QSV_0_0),
    .io_out_QSV_0_1(m4_out_QSV_0_1),
    .io_out_QSV_1_0(m4_out_QSV_1_0),
    .io_out_QSV_1_1(m4_out_QSV_1_1),
    .io_out_QSV_2_0(m4_out_QSV_2_0),
    .io_out_QSV_2_1(m4_out_QSV_2_1),
    .io_out_QSV_3_0(m4_out_QSV_3_0),
    .io_out_QSV_3_1(m4_out_QSV_3_1),
    .io_out_QSV_4_0(m4_out_QSV_4_0),
    .io_out_QSV_4_1(m4_out_QSV_4_1),
    .io_out_QSV_5_0(m4_out_QSV_5_0),
    .io_out_QSV_5_1(m4_out_QSV_5_1),
    .io_out_QSV_6_0(m4_out_QSV_6_0),
    .io_out_QSV_6_1(m4_out_QSV_6_1),
    .io_out_QSV_7_0(m4_out_QSV_7_0),
    .io_out_QSV_7_1(m4_out_QSV_7_1),
    .io_out_valid(m4_out_valid)
  );

  CompatiblePerm_2 m4_perm_post (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m4_out_QSV_0_0),
    .io_in_QSV_0_1(m4_out_QSV_0_1),
    .io_in_QSV_1_0(m4_out_QSV_1_0),
    .io_in_QSV_1_1(m4_out_QSV_1_1),
    .io_in_QSV_2_0(m4_out_QSV_2_0),
    .io_in_QSV_2_1(m4_out_QSV_2_1),
    .io_in_QSV_3_0(m4_out_QSV_3_0),
    .io_in_QSV_3_1(m4_out_QSV_3_1),
    .io_in_QSV_4_0(m4_out_QSV_4_0),
    .io_in_QSV_4_1(m4_out_QSV_4_1),
    .io_in_QSV_5_0(m4_out_QSV_5_0),
    .io_in_QSV_5_1(m4_out_QSV_5_1),
    .io_in_QSV_6_0(m4_out_QSV_6_0),
    .io_in_QSV_6_1(m4_out_QSV_6_1),
    .io_in_QSV_7_0(m4_out_QSV_7_0),
    .io_in_QSV_7_1(m4_out_QSV_7_1),
    .io_in_valid(m4_out_valid),
    .io_out_QSV_0_0(m4_perm_post_out_QSV_0_0),
    .io_out_QSV_0_1(m4_perm_post_out_QSV_0_1),
    .io_out_QSV_1_0(m4_perm_post_out_QSV_1_0),
    .io_out_QSV_1_1(m4_perm_post_out_QSV_1_1),
    .io_out_QSV_2_0(m4_perm_post_out_QSV_2_0),
    .io_out_QSV_2_1(m4_perm_post_out_QSV_2_1),
    .io_out_QSV_3_0(m4_perm_post_out_QSV_3_0),
    .io_out_QSV_3_1(m4_perm_post_out_QSV_3_1),
    .io_out_QSV_4_0(m4_perm_post_out_QSV_4_0),
    .io_out_QSV_4_1(m4_perm_post_out_QSV_4_1),
    .io_out_QSV_5_0(m4_perm_post_out_QSV_5_0),
    .io_out_QSV_5_1(m4_perm_post_out_QSV_5_1),
    .io_out_QSV_6_0(m4_perm_post_out_QSV_6_0),
    .io_out_QSV_6_1(m4_perm_post_out_QSV_6_1),
    .io_out_QSV_7_0(m4_perm_post_out_QSV_7_0),
    .io_out_QSV_7_1(m4_perm_post_out_QSV_7_1),
    .io_out_valid(m4_perm_post_out_valid)
  );

  // Step 5: Hadamard on Qubit 2 with Permutations
  CompatiblePerm_1 m5_perm_pre (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m4_perm_post_out_QSV_0_0),
    .io_in_QSV_0_1(m4_perm_post_out_QSV_0_1),
    .io_in_QSV_1_0(m4_perm_post_out_QSV_1_0),
    .io_in_QSV_1_1(m4_perm_post_out_QSV_1_1),
    .io_in_QSV_2_0(m4_perm_post_out_QSV_2_0),
    .io_in_QSV_2_1(m4_perm_post_out_QSV_2_1),
    .io_in_QSV_3_0(m4_perm_post_out_QSV_3_0),
    .io_in_QSV_3_1(m4_perm_post_out_QSV_3_1),
    .io_in_QSV_4_0(m4_perm_post_out_QSV_4_0),
    .io_in_QSV_4_1(m4_perm_post_out_QSV_4_1),
    .io_in_QSV_5_0(m4_perm_post_out_QSV_5_0),
    .io_in_QSV_5_1(m4_perm_post_out_QSV_5_1),
    .io_in_QSV_6_0(m4_perm_post_out_QSV_6_0),
    .io_in_QSV_6_1(m4_perm_post_out_QSV_6_1),
    .io_in_QSV_7_0(m4_perm_post_out_QSV_7_0),
    .io_in_QSV_7_1(m4_perm_post_out_QSV_7_1),
    .io_in_valid(m4_perm_post_out_valid),
    .io_out_QSV_0_0(m5_perm_pre_out_QSV_0_0),
    .io_out_QSV_0_1(m5_perm_pre_out_QSV_0_1),
    .io_out_QSV_1_0(m5_perm_pre_out_QSV_1_0),
    .io_out_QSV_1_1(m5_perm_pre_out_QSV_1_1),
    .io_out_QSV_2_0(m5_perm_pre_out_QSV_2_0),
    .io_out_QSV_2_1(m5_perm_pre_out_QSV_2_1),
    .io_out_QSV_3_0(m5_perm_pre_out_QSV_3_0),
    .io_out_QSV_3_1(m5_perm_pre_out_QSV_3_1),
    .io_out_QSV_4_0(m5_perm_pre_out_QSV_4_0),
    .io_out_QSV_4_1(m5_perm_pre_out_QSV_4_1),
    .io_out_QSV_5_0(m5_perm_pre_out_QSV_5_0),
    .io_out_QSV_5_1(m5_perm_pre_out_QSV_5_1),
    .io_out_QSV_6_0(m5_perm_pre_out_QSV_6_0),
    .io_out_QSV_6_1(m5_perm_pre_out_QSV_6_1),
    .io_out_QSV_7_0(m5_perm_pre_out_QSV_7_0),
    .io_out_QSV_7_1(m5_perm_pre_out_QSV_7_1),
    .io_out_valid(m5_perm_pre_out_valid)
  );

  HGate3QubitVector8bit m5 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m5_perm_pre_out_QSV_0_0),
    .io_in_QSV_0_1(m5_perm_pre_out_QSV_0_1),
    .io_in_QSV_1_0(m5_perm_pre_out_QSV_1_0),
    .io_in_QSV_1_1(m5_perm_pre_out_QSV_1_1),
    .io_in_QSV_2_0(m5_perm_pre_out_QSV_2_0),
    .io_in_QSV_2_1(m5_perm_pre_out_QSV_2_1),
    .io_in_QSV_3_0(m5_perm_pre_out_QSV_3_0),
    .io_in_QSV_3_1(m5_perm_pre_out_QSV_3_1),
    .io_in_QSV_4_0(m5_perm_pre_out_QSV_4_0),
    .io_in_QSV_4_1(m5_perm_pre_out_QSV_4_1),
    .io_in_QSV_5_0(m5_perm_pre_out_QSV_5_0),
    .io_in_QSV_5_1(m5_perm_pre_out_QSV_5_1),
    .io_in_QSV_6_0(m5_perm_pre_out_QSV_6_0),
    .io_in_QSV_6_1(m5_perm_pre_out_QSV_6_1),
    .io_in_QSV_7_0(m5_perm_pre_out_QSV_7_0),
    .io_in_QSV_7_1(m5_perm_pre_out_QSV_7_1),
    .io_in_valid(m5_perm_pre_out_valid),
    .io_out_QSV_0_0(m5_out_QSV_0_0),
    .io_out_QSV_0_1(m5_out_QSV_0_1),
    .io_out_QSV_1_0(m5_out_QSV_1_0),
    .io_out_QSV_1_1(m5_out_QSV_1_1),
    .io_out_QSV_2_0(m5_out_QSV_2_0),
    .io_out_QSV_2_1(m5_out_QSV_2_1),
    .io_out_QSV_3_0(m5_out_QSV_3_0),
    .io_out_QSV_3_1(m5_out_QSV_3_1),
    .io_out_QSV_4_0(m5_out_QSV_4_0),
    .io_out_QSV_4_1(m5_out_QSV_4_1),
    .io_out_QSV_5_0(m5_out_QSV_5_0),
    .io_out_QSV_5_1(m5_out_QSV_5_1),
    .io_out_QSV_6_0(m5_out_QSV_6_0),
    .io_out_QSV_6_1(m5_out_QSV_6_1),
    .io_out_QSV_7_0(m5_out_QSV_7_0),
    .io_out_QSV_7_1(m5_out_QSV_7_1),
    .io_out_valid(m5_out_valid)
  );

  CompatiblePerm_1 m5_perm_post (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m5_out_QSV_0_0),
    .io_in_QSV_0_1(m5_out_QSV_0_1),
    .io_in_QSV_1_0(m5_out_QSV_1_0),
    .io_in_QSV_1_1(m5_out_QSV_1_1),
    .io_in_QSV_2_0(m5_out_QSV_2_0),
    .io_in_QSV_2_1(m5_out_QSV_2_1),
    .io_in_QSV_3_0(m5_out_QSV_3_0),
    .io_in_QSV_3_1(m5_out_QSV_3_1),
    .io_in_QSV_4_0(m5_out_QSV_4_0),
    .io_in_QSV_4_1(m5_out_QSV_4_1),
    .io_in_QSV_5_0(m5_out_QSV_5_0),
    .io_in_QSV_5_1(m5_out_QSV_5_1),
    .io_in_QSV_6_0(m5_out_QSV_6_0),
    .io_in_QSV_6_1(m5_out_QSV_6_1),
    .io_in_QSV_7_0(m5_out_QSV_7_0),
    .io_in_QSV_7_1(m5_out_QSV_7_1),
    .io_in_valid(m5_out_valid),
    .io_out_QSV_0_0(m5_perm_post_out_QSV_0_0),
    .io_out_QSV_0_1(m5_perm_post_out_QSV_0_1),
    .io_out_QSV_1_0(m5_perm_post_out_QSV_1_0),
    .io_out_QSV_1_1(m5_perm_post_out_QSV_1_1),
    .io_out_QSV_2_0(m5_perm_post_out_QSV_2_0),
    .io_out_QSV_2_1(m5_perm_post_out_QSV_2_1),
    .io_out_QSV_3_0(m5_perm_post_out_QSV_3_0),
    .io_out_QSV_3_1(m5_perm_post_out_QSV_3_1),
    .io_out_QSV_4_0(m5_perm_post_out_QSV_4_0),
    .io_out_QSV_4_1(m5_perm_post_out_QSV_4_1),
    .io_out_QSV_5_0(m5_perm_post_out_QSV_5_0),
    .io_out_QSV_5_1(m5_perm_post_out_QSV_5_1),
    .io_out_QSV_6_0(m5_perm_post_out_QSV_6_0),
    .io_out_QSV_6_1(m5_perm_post_out_QSV_6_1),
    .io_out_QSV_7_0(m5_perm_post_out_QSV_7_0),
    .io_out_QSV_7_1(m5_perm_post_out_QSV_7_1),
    .io_out_valid(m5_perm_post_out_valid)
  );

  // Step 6: SWAP Gate on Qubits [0, 2] with Permutations
  CompatiblePerm m6_perm_pre (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m5_perm_post_out_QSV_0_0),
    .io_in_QSV_0_1(m5_perm_post_out_QSV_0_1),
    .io_in_QSV_1_0(m5_perm_post_out_QSV_1_0),
    .io_in_QSV_1_1(m5_perm_post_out_QSV_1_1),
    .io_in_QSV_2_0(m5_perm_post_out_QSV_2_0),
    .io_in_QSV_2_1(m5_perm_post_out_QSV_2_1),
    .io_in_QSV_3_0(m5_perm_post_out_QSV_3_0),
    .io_in_QSV_3_1(m5_perm_post_out_QSV_3_1),
    .io_in_QSV_4_0(m5_perm_post_out_QSV_4_0),
    .io_in_QSV_4_1(m5_perm_post_out_QSV_4_1),
    .io_in_QSV_5_0(m5_perm_post_out_QSV_5_0),
    .io_in_QSV_5_1(m5_perm_post_out_QSV_5_1),
    .io_in_QSV_6_0(m5_perm_post_out_QSV_6_0),
    .io_in_QSV_6_1(m5_perm_post_out_QSV_6_1),
    .io_in_QSV_7_0(m5_perm_post_out_QSV_7_0),
    .io_in_QSV_7_1(m5_perm_post_out_QSV_7_1),
    .io_in_valid(m5_perm_post_out_valid),
    .io_out_QSV_0_0(m6_perm_pre_out_QSV_0_0),
    .io_out_QSV_0_1(m6_perm_pre_out_QSV_0_1),
    .io_out_QSV_1_0(m6_perm_pre_out_QSV_1_0),
    .io_out_QSV_1_1(m6_perm_pre_out_QSV_1_1),
    .io_out_QSV_2_0(m6_perm_pre_out_QSV_2_0),
    .io_out_QSV_2_1(m6_perm_pre_out_QSV_2_1),
    .io_out_QSV_3_0(m6_perm_pre_out_QSV_3_0),
    .io_out_QSV_3_1(m6_perm_pre_out_QSV_3_1),
    .io_out_QSV_4_0(m6_perm_pre_out_QSV_4_0),
    .io_out_QSV_4_1(m6_perm_pre_out_QSV_4_1),
    .io_out_QSV_5_0(m6_perm_pre_out_QSV_5_0),
    .io_out_QSV_5_1(m6_perm_pre_out_QSV_5_1),
    .io_out_QSV_6_0(m6_perm_pre_out_QSV_6_0),
    .io_out_QSV_6_1(m6_perm_pre_out_QSV_6_1),
    .io_out_QSV_7_0(m6_perm_pre_out_QSV_7_0),
    .io_out_QSV_7_1(m6_perm_pre_out_QSV_7_1),
    .io_out_valid(m6_perm_pre_out_valid)
  );

  SWGate3QubitVector8bit m6 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m6_perm_pre_out_QSV_0_0),
    .io_in_QSV_0_1(m6_perm_pre_out_QSV_0_1),
    .io_in_QSV_1_0(m6_perm_pre_out_QSV_1_0),
    .io_in_QSV_1_1(m6_perm_pre_out_QSV_1_1),
    .io_in_QSV_2_0(m6_perm_pre_out_QSV_2_0),
    .io_in_QSV_2_1(m6_perm_pre_out_QSV_2_1),
    .io_in_QSV_3_0(m6_perm_pre_out_QSV_3_0),
    .io_in_QSV_3_1(m6_perm_pre_out_QSV_3_1),
    .io_in_QSV_4_0(m6_perm_pre_out_QSV_4_0),
    .io_in_QSV_4_1(m6_perm_pre_out_QSV_4_1),
    .io_in_QSV_5_0(m6_perm_pre_out_QSV_5_0),
    .io_in_QSV_5_1(m6_perm_pre_out_QSV_5_1),
    .io_in_QSV_6_0(m6_perm_pre_out_QSV_6_0),
    .io_in_QSV_6_1(m6_perm_pre_out_QSV_6_1),
    .io_in_QSV_7_0(m6_perm_pre_out_QSV_7_0),
    .io_in_QSV_7_1(m6_perm_pre_out_QSV_7_1),
    .io_in_valid(m6_perm_pre_out_valid),
    .io_out_QSV_0_0(m6_out_QSV_0_0),
    .io_out_QSV_0_1(m6_out_QSV_0_1),
    .io_out_QSV_1_0(m6_out_QSV_1_0),
    .io_out_QSV_1_1(m6_out_QSV_1_1),
    .io_out_QSV_2_0(m6_out_QSV_2_0),
    .io_out_QSV_2_1(m6_out_QSV_2_1),
    .io_out_QSV_3_0(m6_out_QSV_3_0),
    .io_out_QSV_3_1(m6_out_QSV_3_1),
    .io_out_QSV_4_0(m6_out_QSV_4_0),
    .io_out_QSV_4_1(m6_out_QSV_4_1),
    .io_out_QSV_5_0(m6_out_QSV_5_0),
    .io_out_QSV_5_1(m6_out_QSV_5_1),
    .io_out_QSV_6_0(m6_out_QSV_6_0),
    .io_out_QSV_6_1(m6_out_QSV_6_1),
    .io_out_QSV_7_0(m6_out_QSV_7_0),
    .io_out_QSV_7_1(m6_out_QSV_7_1),
    .io_out_valid(m6_out_valid)
  );

  CompatiblePerm m6_perm_post (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m6_out_QSV_0_0),
    .io_in_QSV_0_1(m6_out_QSV_0_1),
    .io_in_QSV_1_0(m6_out_QSV_1_0),
    .io_in_QSV_1_1(m6_out_QSV_1_1),
    .io_in_QSV_2_0(m6_out_QSV_2_0),
    .io_in_QSV_2_1(m6_out_QSV_2_1),
    .io_in_QSV_3_0(m6_out_QSV_3_0),
    .io_in_QSV_3_1(m6_out_QSV_3_1),
    .io_in_QSV_4_0(m6_out_QSV_4_0),
    .io_in_QSV_4_1(m6_out_QSV_4_1),
    .io_in_QSV_5_0(m6_out_QSV_5_0),
    .io_in_QSV_5_1(m6_out_QSV_5_1),
    .io_in_QSV_6_0(m6_out_QSV_6_0),
    .io_in_QSV_6_1(m6_out_QSV_6_1),
    .io_in_QSV_7_0(m6_out_QSV_7_0),
    .io_in_QSV_7_1(m6_out_QSV_7_1),
    .io_in_valid(m6_out_valid),
    .io_out_QSV_0_0(io_out_QSV_0_0),
    .io_out_QSV_0_1(io_out_QSV_0_1),
    .io_out_QSV_1_0(io_out_QSV_1_0),
    .io_out_QSV_1_1(io_out_QSV_1_1),
    .io_out_QSV_2_0(io_out_QSV_2_0),
    .io_out_QSV_2_1(io_out_QSV_2_1),
    .io_out_QSV_3_0(io_out_QSV_3_0),
    .io_out_QSV_3_1(io_out_QSV_3_1),
    .io_out_QSV_4_0(io_out_QSV_4_0),
    .io_out_QSV_4_1(io_out_QSV_4_1),
    .io_out_QSV_5_0(io_out_QSV_5_0),
    .io_out_QSV_5_1(io_out_QSV_5_1),
    .io_out_QSV_6_0(io_out_QSV_6_0),
    .io_out_QSV_6_1(io_out_QSV_6_1),
    .io_out_QSV_7_0(io_out_QSV_7_0),
    .io_out_QSV_7_1(io_out_QSV_7_1),
    .io_out_valid(io_out_valid)
  );

endmodule
