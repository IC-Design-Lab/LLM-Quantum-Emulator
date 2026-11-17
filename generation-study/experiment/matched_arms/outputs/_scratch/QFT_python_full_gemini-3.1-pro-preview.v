module QFT (
  input  wire        clock,
  input  wire        reset,
  input  wire [7:0]  io_in_QSV_0_0,
  input  wire [7:0]  io_in_QSV_0_1,
  input  wire [7:0]  io_in_QSV_1_0,
  input  wire [7:0]  io_in_QSV_1_1,
  input  wire [7:0]  io_in_QSV_2_0,
  input  wire [7:0]  io_in_QSV_2_1,
  input  wire [7:0]  io_in_QSV_3_0,
  input  wire [7:0]  io_in_QSV_3_1,
  input  wire [7:0]  io_in_QSV_4_0,
  input  wire [7:0]  io_in_QSV_4_1,
  input  wire [7:0]  io_in_QSV_5_0,
  input  wire [7:0]  io_in_QSV_5_1,
  input  wire [7:0]  io_in_QSV_6_0,
  input  wire [7:0]  io_in_QSV_6_1,
  input  wire [7:0]  io_in_QSV_7_0,
  input  wire [7:0]  io_in_QSV_7_1,
  input  wire        io_in_valid,

  output wire [7:0]  io_out_QSV_0_0,
  output wire [7:0]  io_out_QSV_0_1,
  output wire [7:0]  io_out_QSV_1_0,
  output wire [7:0]  io_out_QSV_1_1,
  output wire [7:0]  io_out_QSV_2_0,
  output wire [7:0]  io_out_QSV_2_1,
  output wire [7:0]  io_out_QSV_3_0,
  output wire [7:0]  io_out_QSV_3_1,
  output wire [7:0]  io_out_QSV_4_0,
  output wire [7:0]  io_out_QSV_4_1,
  output wire [7:0]  io_out_QSV_5_0,
  output wire [7:0]  io_out_QSV_5_1,
  output wire [7:0]  io_out_QSV_6_0,
  output wire [7:0]  io_out_QSV_6_1,
  output wire [7:0]  io_out_QSV_7_0,
  output wire [7:0]  io_out_QSV_7_1,
  output wire        io_out_valid
);

  // Stage 0 (m) wires (omitting 3_1 and 7_1 as m_1 drops them)
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

  // Stage 1 (m_1) wires
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

  // Stage 2 (m_2) wires
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

  // Stage 3 (m_3) wires
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

  // Stage 4 (m_4) wires
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

  // Stage 5 (m_5) wires (omitting 3_1 and 7_1 as m_6 drops them)
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

  // Stage 6 (m_6) wires
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

  // Stage 7 (m_7) wires
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

  // Stage 8 (m_8) wires
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

  // Stage 9 (m_9) wires
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

  // Stage 10 (m_10) wires
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

  // Stage 11 (m_11) wires
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

  // Stage 0: H(0)
  HGate3QubitVector8bit m (
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
    .io_out_QSV_0_0(_m_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_io_out_QSV_3_0),
    .io_out_QSV_4_0(_m_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_io_out_QSV_7_0),
    .io_out_valid(_m_io_out_valid)
  );

  // Stage 1: CS(1, 0)
  CSGate3QubitVector8bit m_1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_io_out_QSV_3_0),
    .io_in_QSV_4_0(_m_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_io_out_QSV_7_0),
    .io_in_valid(_m_io_out_valid),
    .io_out_QSV_0_0(_m_1_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_1_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_1_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_1_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_1_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_1_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_1_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_1_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_1_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_1_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_1_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_1_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_1_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_1_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_1_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_1_io_out_QSV_7_1),
    .io_out_valid(_m_1_io_out_valid)
  );

  // Stage 2: Permutation for CT(2, 0)
  CompatiblePerm m_2 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_1_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_1_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_1_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_1_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_1_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_1_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_1_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_1_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_1_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_1_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_1_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_1_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_1_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_1_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_1_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_1_io_out_QSV_7_1),
    .io_in_valid(_m_1_io_out_valid),
    .io_out_QSV_0_0(_m_2_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_2_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_2_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_2_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_2_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_2_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_2_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_2_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_2_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_2_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_2_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_2_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_2_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_2_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_2_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_2_io_out_QSV_7_1),
    .io_out_valid(_m_2_io_out_valid)
  );

  // Stage 3: CT(2, 0)
  CTGate3QubitVector8bit m_3 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_2_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_2_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_2_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_2_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_2_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_2_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_2_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_2_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_2_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_2_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_2_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_2_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_2_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_2_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_2_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_2_io_out_QSV_7_1),
    .io_in_valid(_m_2_io_out_valid),
    .io_out_QSV_0_0(_m_3_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_3_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_3_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_3_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_3_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_3_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_3_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_3_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_3_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_3_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_3_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_3_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_3_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_3_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_3_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_3_io_out_QSV_7_1),
    .io_out_valid(_m_3_io_out_valid)
  );

  // Stage 4: Permutation restoring/setting up H(1)
  CompatiblePerm_1 m_4 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_3_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_3_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_3_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_3_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_3_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_3_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_3_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_3_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_3_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_3_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_3_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_3_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_3_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_3_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_3_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_3_io_out_QSV_7_1),
    .io_in_valid(_m_3_io_out_valid),
    .io_out_QSV_0_0(_m_4_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_4_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_4_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_4_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_4_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_4_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_4_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_4_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_4_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_4_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_4_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_4_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_4_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_4_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_4_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_4_io_out_QSV_7_1),
    .io_out_valid(_m_4_io_out_valid)
  );

  // Stage 5: H(1)
  HGate3QubitVector8bit m_5 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_4_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_4_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_4_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_4_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_4_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_4_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_4_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_4_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_4_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_4_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_4_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_4_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_4_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_4_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_4_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_4_io_out_QSV_7_1),
    .io_in_valid(_m_4_io_out_valid),
    .io_out_QSV_0_0(_m_5_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_5_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_5_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_5_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_5_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_5_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_5_io_out_QSV_3_0),
    .io_out_QSV_4_0(_m_5_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_5_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_5_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_5_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_5_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_5_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_5_io_out_QSV_7_0),
    .io_out_valid(_m_5_io_out_valid)
  );

  // Stage 6: CS(2, 1)
  CSGate3QubitVector8bit m_6 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_5_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_5_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_5_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_5_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_5_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_5_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_5_io_out_QSV_3_0),
    .io_in_QSV_4_0(_m_5_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_5_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_5_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_5_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_5_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_5_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_5_io_out_QSV_7_0),
    .io_in_valid(_m_5_io_out_valid),
    .io_out_QSV_0_0(_m_6_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_6_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_6_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_6_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_6_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_6_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_6_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_6_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_6_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_6_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_6_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_6_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_6_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_6_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_6_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_6_io_out_QSV_7_1),
    .io_out_valid(_m_6_io_out_valid)
  );

  // Stage 7: Permutation for H(2)
  CompatiblePerm_2 m_7 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_6_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_6_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_6_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_6_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_6_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_6_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_6_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_6_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_6_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_6_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_6_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_6_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_6_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_6_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_6_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_6_io_out_QSV_7_1),
    .io_in_valid(_m_6_io_out_valid),
    .io_out_QSV_0_0(_m_7_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_7_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_7_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_7_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_7_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_7_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_7_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_7_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_7_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_7_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_7_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_7_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_7_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_7_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_7_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_7_io_out_QSV_7_1),
    .io_out_valid(_m_7_io_out_valid)
  );

  // Stage 8: H(2)
  HGate3QubitVector8bit m_8 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_7_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_7_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_7_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_7_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_7_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_7_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_7_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_7_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_7_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_7_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_7_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_7_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_7_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_7_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_7_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_7_io_out_QSV_7_1),
    .io_in_valid(_m_7_io_out_valid),
    .io_out_QSV_0_0(_m_8_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_8_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_8_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_8_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_8_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_8_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_8_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_8_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_8_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_8_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_8_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_8_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_8_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_8_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_8_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_8_io_out_QSV_7_1),
    .io_out_valid(_m_8_io_out_valid)
  );

  // Stage 9: Permutation
  CompatiblePerm m_9 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_8_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_8_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_8_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_8_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_8_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_8_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_8_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_8_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_8_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_8_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_8_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_8_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_8_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_8_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_8_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_8_io_out_QSV_7_1),
    .io_in_valid(_m_8_io_out_valid),
    .io_out_QSV_0_0(_m_9_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_9_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_9_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_9_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_9_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_9_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_9_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_9_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_9_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_9_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_9_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_9_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_9_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_9_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_9_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_9_io_out_QSV_7_1),
    .io_out_valid(_m_9_io_out_valid)
  );

  // Stage 10: SWAP
  SWGate3QubitVector8bit m_10 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_9_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_9_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_9_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_9_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_9_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_9_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_9_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_9_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_9_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_9_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_9_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_9_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_9_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_9_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_9_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_9_io_out_QSV_7_1),
    .io_in_valid(_m_9_io_out_valid),
    .io_out_QSV_0_0(_m_10_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_10_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_10_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_10_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_10_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_10_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_10_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_10_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_10_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_10_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_10_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_10_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_10_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_10_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_10_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_10_io_out_QSV_7_1),
    .io_out_valid(_m_10_io_out_valid)
  );

  // Stage 11: Permutation
  CompatiblePerm_2 m_11 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_10_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_10_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_10_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_10_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_10_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_10_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_10_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_10_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_10_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_10_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_10_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_10_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_10_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_10_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_10_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_10_io_out_QSV_7_1),
    .io_in_valid(_m_10_io_out_valid),
    .io_out_QSV_0_0(_m_11_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_11_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_11_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_11_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_11_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_11_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_11_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_11_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_11_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_11_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_11_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_11_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_11_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_11_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_11_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_11_io_out_QSV_7_1),
    .io_out_valid(_m_11_io_out_valid)
  );

  // Stage 12: Permutation (drives output)
  CompatiblePerm m_12 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_11_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_11_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_11_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_11_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_11_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_11_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_11_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_11_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_11_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_11_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_11_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_11_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_11_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_11_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_11_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_11_io_out_QSV_7_1),
    .io_in_valid(_m_11_io_out_valid),
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
