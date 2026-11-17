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

  // Stage 0
  wire [7:0] _m_io_out_QSV_0_0, _m_io_out_QSV_0_1, _m_io_out_QSV_1_0, _m_io_out_QSV_1_1, _m_io_out_QSV_2_0, _m_io_out_QSV_2_1, _m_io_out_QSV_3_0, _m_io_out_QSV_3_1, _m_io_out_QSV_4_0, _m_io_out_QSV_4_1, _m_io_out_QSV_5_0, _m_io_out_QSV_5_1, _m_io_out_QSV_6_0, _m_io_out_QSV_6_1, _m_io_out_QSV_7_0, _m_io_out_QSV_7_1;
  wire _m_io_out_valid;

  // Stage 1 (pruned 3_1 and 7_1 for next stage CSGate3QubitVector8bit)
  wire [7:0] _m_1_io_out_QSV_0_0, _m_1_io_out_QSV_0_1, _m_1_io_out_QSV_1_0, _m_1_io_out_QSV_1_1, _m_1_io_out_QSV_2_0, _m_1_io_out_QSV_2_1, _m_1_io_out_QSV_3_0, _m_1_io_out_QSV_4_0, _m_1_io_out_QSV_4_1, _m_1_io_out_QSV_5_0, _m_1_io_out_QSV_5_1, _m_1_io_out_QSV_6_0, _m_1_io_out_QSV_6_1, _m_1_io_out_QSV_7_0;
  wire _m_1_io_out_valid;

  // Stages 2 to 9
  wire [7:0] _m_2_io_out_QSV_0_0, _m_2_io_out_QSV_0_1, _m_2_io_out_QSV_1_0, _m_2_io_out_QSV_1_1, _m_2_io_out_QSV_2_0, _m_2_io_out_QSV_2_1, _m_2_io_out_QSV_3_0, _m_2_io_out_QSV_3_1, _m_2_io_out_QSV_4_0, _m_2_io_out_QSV_4_1, _m_2_io_out_QSV_5_0, _m_2_io_out_QSV_5_1, _m_2_io_out_QSV_6_0, _m_2_io_out_QSV_6_1, _m_2_io_out_QSV_7_0, _m_2_io_out_QSV_7_1;
  wire _m_2_io_out_valid;
  wire [7:0] _m_3_io_out_QSV_0_0, _m_3_io_out_QSV_0_1, _m_3_io_out_QSV_1_0, _m_3_io_out_QSV_1_1, _m_3_io_out_QSV_2_0, _m_3_io_out_QSV_2_1, _m_3_io_out_QSV_3_0, _m_3_io_out_QSV_3_1, _m_3_io_out_QSV_4_0, _m_3_io_out_QSV_4_1, _m_3_io_out_QSV_5_0, _m_3_io_out_QSV_5_1, _m_3_io_out_QSV_6_0, _m_3_io_out_QSV_6_1, _m_3_io_out_QSV_7_0, _m_3_io_out_QSV_7_1;
  wire _m_3_io_out_valid;
  wire [7:0] _m_4_io_out_QSV_0_0, _m_4_io_out_QSV_0_1, _m_4_io_out_QSV_1_0, _m_4_io_out_QSV_1_1, _m_4_io_out_QSV_2_0, _m_4_io_out_QSV_2_1, _m_4_io_out_QSV_3_0, _m_4_io_out_QSV_3_1, _m_4_io_out_QSV_4_0, _m_4_io_out_QSV_4_1, _m_4_io_out_QSV_5_0, _m_4_io_out_QSV_5_1, _m_4_io_out_QSV_6_0, _m_4_io_out_QSV_6_1, _m_4_io_out_QSV_7_0, _m_4_io_out_QSV_7_1;
  wire _m_4_io_out_valid;
  wire [7:0] _m_5_io_out_QSV_0_0, _m_5_io_out_QSV_0_1, _m_5_io_out_QSV_1_0, _m_5_io_out_QSV_1_1, _m_5_io_out_QSV_2_0, _m_5_io_out_QSV_2_1, _m_5_io_out_QSV_3_0, _m_5_io_out_QSV_3_1, _m_5_io_out_QSV_4_0, _m_5_io_out_QSV_4_1, _m_5_io_out_QSV_5_0, _m_5_io_out_QSV_5_1, _m_5_io_out_QSV_6_0, _m_5_io_out_QSV_6_1, _m_5_io_out_QSV_7_0, _m_5_io_out_QSV_7_1;
  wire _m_5_io_out_valid;
  wire [7:0] _m_6_io_out_QSV_0_0, _m_6_io_out_QSV_0_1, _m_6_io_out_QSV_1_0, _m_6_io_out_QSV_1_1, _m_6_io_out_QSV_2_0, _m_6_io_out_QSV_2_1, _m_6_io_out_QSV_3_0, _m_6_io_out_QSV_3_1, _m_6_io_out_QSV_4_0, _m_6_io_out_QSV_4_1, _m_6_io_out_QSV_5_0, _m_6_io_out_QSV_5_1, _m_6_io_out_QSV_6_0, _m_6_io_out_QSV_6_1, _m_6_io_out_QSV_7_0, _m_6_io_out_QSV_7_1;
  wire _m_6_io_out_valid;
  wire [7:0] _m_7_io_out_QSV_0_0, _m_7_io_out_QSV_0_1, _m_7_io_out_QSV_1_0, _m_7_io_out_QSV_1_1, _m_7_io_out_QSV_2_0, _m_7_io_out_QSV_2_1, _m_7_io_out_QSV_3_0, _m_7_io_out_QSV_3_1, _m_7_io_out_QSV_4_0, _m_7_io_out_QSV_4_1, _m_7_io_out_QSV_5_0, _m_7_io_out_QSV_5_1, _m_7_io_out_QSV_6_0, _m_7_io_out_QSV_6_1, _m_7_io_out_QSV_7_0, _m_7_io_out_QSV_7_1;
  wire _m_7_io_out_valid;
  wire [7:0] _m_8_io_out_QSV_0_0, _m_8_io_out_QSV_0_1, _m_8_io_out_QSV_1_0, _m_8_io_out_QSV_1_1, _m_8_io_out_QSV_2_0, _m_8_io_out_QSV_2_1, _m_8_io_out_QSV_3_0, _m_8_io_out_QSV_3_1, _m_8_io_out_QSV_4_0, _m_8_io_out_QSV_4_1, _m_8_io_out_QSV_5_0, _m_8_io_out_QSV_5_1, _m_8_io_out_QSV_6_0, _m_8_io_out_QSV_6_1, _m_8_io_out_QSV_7_0, _m_8_io_out_QSV_7_1;
  wire _m_8_io_out_valid;
  wire [7:0] _m_9_io_out_QSV_0_0, _m_9_io_out_QSV_0_1, _m_9_io_out_QSV_1_0, _m_9_io_out_QSV_1_1, _m_9_io_out_QSV_2_0, _m_9_io_out_QSV_2_1, _m_9_io_out_QSV_3_0, _m_9_io_out_QSV_3_1, _m_9_io_out_QSV_4_0, _m_9_io_out_QSV_4_1, _m_9_io_out_QSV_5_0, _m_9_io_out_QSV_5_1, _m_9_io_out_QSV_6_0, _m_9_io_out_QSV_6_1, _m_9_io_out_QSV_7_0, _m_9_io_out_QSV_7_1;
  wire _m_9_io_out_valid;

  // Stage 10 (pruned 3_1 and 7_1 for next stage CSGate3QubitVector8bit)
  wire [7:0] _m_10_io_out_QSV_0_0, _m_10_io_out_QSV_0_1, _m_10_io_out_QSV_1_0, _m_10_io_out_QSV_1_1, _m_10_io_out_QSV_2_0, _m_10_io_out_QSV_2_1, _m_10_io_out_QSV_3_0, _m_10_io_out_QSV_4_0, _m_10_io_out_QSV_4_1, _m_10_io_out_QSV_5_0, _m_10_io_out_QSV_5_1, _m_10_io_out_QSV_6_0, _m_10_io_out_QSV_6_1, _m_10_io_out_QSV_7_0;
  wire _m_10_io_out_valid;

  // Stages 11 to 15
  wire [7:0] _m_11_io_out_QSV_0_0, _m_11_io_out_QSV_0_1, _m_11_io_out_QSV_1_0, _m_11_io_out_QSV_1_1, _m_11_io_out_QSV_2_0, _m_11_io_out_QSV_2_1, _m_11_io_out_QSV_3_0, _m_11_io_out_QSV_3_1, _m_11_io_out_QSV_4_0, _m_11_io_out_QSV_4_1, _m_11_io_out_QSV_5_0, _m_11_io_out_QSV_5_1, _m_11_io_out_QSV_6_0, _m_11_io_out_QSV_6_1, _m_11_io_out_QSV_7_0, _m_11_io_out_QSV_7_1;
  wire _m_11_io_out_valid;
  wire [7:0] _m_12_io_out_QSV_0_0, _m_12_io_out_QSV_0_1, _m_12_io_out_QSV_1_0, _m_12_io_out_QSV_1_1, _m_12_io_out_QSV_2_0, _m_12_io_out_QSV_2_1, _m_12_io_out_QSV_3_0, _m_12_io_out_QSV_3_1, _m_12_io_out_QSV_4_0, _m_12_io_out_QSV_4_1, _m_12_io_out_QSV_5_0, _m_12_io_out_QSV_5_1, _m_12_io_out_QSV_6_0, _m_12_io_out_QSV_6_1, _m_12_io_out_QSV_7_0, _m_12_io_out_QSV_7_1;
  wire _m_12_io_out_valid;
  wire [7:0] _m_13_io_out_QSV_0_0, _m_13_io_out_QSV_0_1, _m_13_io_out_QSV_1_0, _m_13_io_out_QSV_1_1, _m_13_io_out_QSV_2_0, _m_13_io_out_QSV_2_1, _m_13_io_out_QSV_3_0, _m_13_io_out_QSV_3_1, _m_13_io_out_QSV_4_0, _m_13_io_out_QSV_4_1, _m_13_io_out_QSV_5_0, _m_13_io_out_QSV_5_1, _m_13_io_out_QSV_6_0, _m_13_io_out_QSV_6_1, _m_13_io_out_QSV_7_0, _m_13_io_out_QSV_7_1;
  wire _m_13_io_out_valid;
  wire [7:0] _m_14_io_out_QSV_0_0, _m_14_io_out_QSV_0_1, _m_14_io_out_QSV_1_0, _m_14_io_out_QSV_1_1, _m_14_io_out_QSV_2_0, _m_14_io_out_QSV_2_1, _m_14_io_out_QSV_3_0, _m_14_io_out_QSV_3_1, _m_14_io_out_QSV_4_0, _m_14_io_out_QSV_4_1, _m_14_io_out_QSV_5_0, _m_14_io_out_QSV_5_1, _m_14_io_out_QSV_6_0, _m_14_io_out_QSV_6_1, _m_14_io_out_QSV_7_0, _m_14_io_out_QSV_7_1;
  wire _m_14_io_out_valid;
  wire [7:0] _m_15_io_out_QSV_0_0, _m_15_io_out_QSV_0_1, _m_15_io_out_QSV_1_0, _m_15_io_out_QSV_1_1, _m_15_io_out_QSV_2_0, _m_15_io_out_QSV_2_1, _m_15_io_out_QSV_3_0, _m_15_io_out_QSV_3_1, _m_15_io_out_QSV_4_0, _m_15_io_out_QSV_4_1, _m_15_io_out_QSV_5_0, _m_15_io_out_QSV_5_1, _m_15_io_out_QSV_6_0, _m_15_io_out_QSV_6_1, _m_15_io_out_QSV_7_0, _m_15_io_out_QSV_7_1;
  wire _m_15_io_out_valid;


  // Step 0: h(0)
  HGate3QubitVector8bit m (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
    .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
    .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
    .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
    .io_in_QSV_4_0(io_in_QSV_4_0), .io_in_QSV_4_1(io_in_QSV_4_1),
    .io_in_QSV_5_0(io_in_QSV_5_0), .io_in_QSV_5_1(io_in_QSV_5_1),
    .io_in_QSV_6_0(io_in_QSV_6_0), .io_in_QSV_6_1(io_in_QSV_6_1),
    .io_in_QSV_7_0(io_in_QSV_7_0), .io_in_QSV_7_1(io_in_QSV_7_1),
    .io_in_valid(io_in_valid),
    .io_out_QSV_0_0(_m_io_out_QSV_0_0), .io_out_QSV_0_1(_m_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_io_out_QSV_1_0), .io_out_QSV_1_1(_m_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_io_out_QSV_2_0), .io_out_QSV_2_1(_m_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_io_out_QSV_3_0), .io_out_QSV_3_1(_m_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_io_out_QSV_4_0), .io_out_QSV_4_1(_m_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_io_out_QSV_5_0), .io_out_QSV_5_1(_m_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_io_out_QSV_6_0), .io_out_QSV_6_1(_m_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_io_out_QSV_7_0), .io_out_QSV_7_1(_m_io_out_QSV_7_1),
    .io_out_valid(_m_io_out_valid)
  );

  // Step 1: cs(1, 0)
  CompatiblePerm m_1 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_io_out_QSV_0_0), .io_in_QSV_0_1(_m_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_io_out_QSV_1_0), .io_in_QSV_1_1(_m_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_io_out_QSV_2_0), .io_in_QSV_2_1(_m_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_io_out_QSV_3_0), .io_in_QSV_3_1(_m_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_io_out_QSV_4_0), .io_in_QSV_4_1(_m_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_io_out_QSV_5_0), .io_in_QSV_5_1(_m_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_io_out_QSV_6_0), .io_in_QSV_6_1(_m_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_io_out_QSV_7_0), .io_in_QSV_7_1(_m_io_out_QSV_7_1),
    .io_in_valid(_m_io_out_valid),
    .io_out_QSV_0_0(_m_1_io_out_QSV_0_0), .io_out_QSV_0_1(_m_1_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_1_io_out_QSV_1_0), .io_out_QSV_1_1(_m_1_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_1_io_out_QSV_2_0), .io_out_QSV_2_1(_m_1_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_1_io_out_QSV_3_0), 
    .io_out_QSV_4_0(_m_1_io_out_QSV_4_0), .io_out_QSV_4_1(_m_1_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_1_io_out_QSV_5_0), .io_out_QSV_5_1(_m_1_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_1_io_out_QSV_6_0), .io_out_QSV_6_1(_m_1_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_1_io_out_QSV_7_0), 
    .io_out_valid(_m_1_io_out_valid)
  );

  CSGate3QubitVector8bit m_2 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_1_io_out_QSV_0_0), .io_in_QSV_0_1(_m_1_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_1_io_out_QSV_1_0), .io_in_QSV_1_1(_m_1_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_1_io_out_QSV_2_0), .io_in_QSV_2_1(_m_1_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_1_io_out_QSV_3_0), 
    .io_in_QSV_4_0(_m_1_io_out_QSV_4_0), .io_in_QSV_4_1(_m_1_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_1_io_out_QSV_5_0), .io_in_QSV_5_1(_m_1_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_1_io_out_QSV_6_0), .io_in_QSV_6_1(_m_1_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_1_io_out_QSV_7_0), 
    .io_in_valid(_m_1_io_out_valid),
    .io_out_QSV_0_0(_m_2_io_out_QSV_0_0), .io_out_QSV_0_1(_m_2_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_2_io_out_QSV_1_0), .io_out_QSV_1_1(_m_2_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_2_io_out_QSV_2_0), .io_out_QSV_2_1(_m_2_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_2_io_out_QSV_3_0), .io_out_QSV_3_1(_m_2_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_2_io_out_QSV_4_0), .io_out_QSV_4_1(_m_2_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_2_io_out_QSV_5_0), .io_out_QSV_5_1(_m_2_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_2_io_out_QSV_6_0), .io_out_QSV_6_1(_m_2_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_2_io_out_QSV_7_0), .io_out_QSV_7_1(_m_2_io_out_QSV_7_1),
    .io_out_valid(_m_2_io_out_valid)
  );

  CompatiblePerm m_3 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_2_io_out_QSV_0_0), .io_in_QSV_0_1(_m_2_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_2_io_out_QSV_1_0), .io_in_QSV_1_1(_m_2_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_2_io_out_QSV_2_0), .io_in_QSV_2_1(_m_2_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_2_io_out_QSV_3_0), .io_in_QSV_3_1(_m_2_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_2_io_out_QSV_4_0), .io_in_QSV_4_1(_m_2_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_2_io_out_QSV_5_0), .io_in_QSV_5_1(_m_2_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_2_io_out_QSV_6_0), .io_in_QSV_6_1(_m_2_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_2_io_out_QSV_7_0), .io_in_QSV_7_1(_m_2_io_out_QSV_7_1),
    .io_in_valid(_m_2_io_out_valid),
    .io_out_QSV_0_0(_m_3_io_out_QSV_0_0), .io_out_QSV_0_1(_m_3_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_3_io_out_QSV_1_0), .io_out_QSV_1_1(_m_3_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_3_io_out_QSV_2_0), .io_out_QSV_2_1(_m_3_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_3_io_out_QSV_3_0), .io_out_QSV_3_1(_m_3_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_3_io_out_QSV_4_0), .io_out_QSV_4_1(_m_3_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_3_io_out_QSV_5_0), .io_out_QSV_5_1(_m_3_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_3_io_out_QSV_6_0), .io_out_QSV_6_1(_m_3_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_3_io_out_QSV_7_0), .io_out_QSV_7_1(_m_3_io_out_QSV_7_1),
    .io_out_valid(_m_3_io_out_valid)
  );

  // Step 2: cp(pi/4, 2, 0)
  CompatiblePerm_1 m_4 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_3_io_out_QSV_0_0), .io_in_QSV_0_1(_m_3_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_3_io_out_QSV_1_0), .io_in_QSV_1_1(_m_3_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_3_io_out_QSV_2_0), .io_in_QSV_2_1(_m_3_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_3_io_out_QSV_3_0), .io_in_QSV_3_1(_m_3_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_3_io_out_QSV_4_0), .io_in_QSV_4_1(_m_3_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_3_io_out_QSV_5_0), .io_in_QSV_5_1(_m_3_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_3_io_out_QSV_6_0), .io_in_QSV_6_1(_m_3_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_3_io_out_QSV_7_0), .io_in_QSV_7_1(_m_3_io_out_QSV_7_1),
    .io_in_valid(_m_3_io_out_valid),
    .io_out_QSV_0_0(_m_4_io_out_QSV_0_0), .io_out_QSV_0_1(_m_4_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_4_io_out_QSV_1_0), .io_out_QSV_1_1(_m_4_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_4_io_out_QSV_2_0), .io_out_QSV_2_1(_m_4_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_4_io_out_QSV_3_0), .io_out_QSV_3_1(_m_4_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_4_io_out_QSV_4_0), .io_out_QSV_4_1(_m_4_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_4_io_out_QSV_5_0), .io_out_QSV_5_1(_m_4_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_4_io_out_QSV_6_0), .io_out_QSV_6_1(_m_4_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_4_io_out_QSV_7_0), .io_out_QSV_7_1(_m_4_io_out_QSV_7_1),
    .io_out_valid(_m_4_io_out_valid)
  );

  CTGate3QubitVector8bit m_5 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_4_io_out_QSV_0_0), .io_in_QSV_0_1(_m_4_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_4_io_out_QSV_1_0), .io_in_QSV_1_1(_m_4_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_4_io_out_QSV_2_0), .io_in_QSV_2_1(_m_4_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_4_io_out_QSV_3_0), .io_in_QSV_3_1(_m_4_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_4_io_out_QSV_4_0), .io_in_QSV_4_1(_m_4_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_4_io_out_QSV_5_0), .io_in_QSV_5_1(_m_4_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_4_io_out_QSV_6_0), .io_in_QSV_6_1(_m_4_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_4_io_out_QSV_7_0), .io_in_QSV_7_1(_m_4_io_out_QSV_7_1),
    .io_in_valid(_m_4_io_out_valid),
    .io_out_QSV_0_0(_m_5_io_out_QSV_0_0), .io_out_QSV_0_1(_m_5_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_5_io_out_QSV_1_0), .io_out_QSV_1_1(_m_5_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_5_io_out_QSV_2_0), .io_out_QSV_2_1(_m_5_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_5_io_out_QSV_3_0), .io_out_QSV_3_1(_m_5_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_5_io_out_QSV_4_0), .io_out_QSV_4_1(_m_5_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_5_io_out_QSV_5_0), .io_out_QSV_5_1(_m_5_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_5_io_out_QSV_6_0), .io_out_QSV_6_1(_m_5_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_5_io_out_QSV_7_0), .io_out_QSV_7_1(_m_5_io_out_QSV_7_1),
    .io_out_valid(_m_5_io_out_valid)
  );

  CompatiblePerm_1 m_6 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_5_io_out_QSV_0_0), .io_in_QSV_0_1(_m_5_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_5_io_out_QSV_1_0), .io_in_QSV_1_1(_m_5_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_5_io_out_QSV_2_0), .io_in_QSV_2_1(_m_5_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_5_io_out_QSV_3_0), .io_in_QSV_3_1(_m_5_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_5_io_out_QSV_4_0), .io_in_QSV_4_1(_m_5_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_5_io_out_QSV_5_0), .io_in_QSV_5_1(_m_5_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_5_io_out_QSV_6_0), .io_in_QSV_6_1(_m_5_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_5_io_out_QSV_7_0), .io_in_QSV_7_1(_m_5_io_out_QSV_7_1),
    .io_in_valid(_m_5_io_out_valid),
    .io_out_QSV_0_0(_m_6_io_out_QSV_0_0), .io_out_QSV_0_1(_m_6_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_6_io_out_QSV_1_0), .io_out_QSV_1_1(_m_6_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_6_io_out_QSV_2_0), .io_out_QSV_2_1(_m_6_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_6_io_out_QSV_3_0), .io_out_QSV_3_1(_m_6_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_6_io_out_QSV_4_0), .io_out_QSV_4_1(_m_6_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_6_io_out_QSV_5_0), .io_out_QSV_5_1(_m_6_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_6_io_out_QSV_6_0), .io_out_QSV_6_1(_m_6_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_6_io_out_QSV_7_0), .io_out_QSV_7_1(_m_6_io_out_QSV_7_1),
    .io_out_valid(_m_6_io_out_valid)
  );

  // Step 3: h(1)
  CompatiblePerm m_7 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_6_io_out_QSV_0_0), .io_in_QSV_0_1(_m_6_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_6_io_out_QSV_1_0), .io_in_QSV_1_1(_m_6_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_6_io_out_QSV_2_0), .io_in_QSV_2_1(_m_6_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_6_io_out_QSV_3_0), .io_in_QSV_3_1(_m_6_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_6_io_out_QSV_4_0), .io_in_QSV_4_1(_m_6_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_6_io_out_QSV_5_0), .io_in_QSV_5_1(_m_6_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_6_io_out_QSV_6_0), .io_in_QSV_6_1(_m_6_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_6_io_out_QSV_7_0), .io_in_QSV_7_1(_m_6_io_out_QSV_7_1),
    .io_in_valid(_m_6_io_out_valid),
    .io_out_QSV_0_0(_m_7_io_out_QSV_0_0), .io_out_QSV_0_1(_m_7_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_7_io_out_QSV_1_0), .io_out_QSV_1_1(_m_7_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_7_io_out_QSV_2_0), .io_out_QSV_2_1(_m_7_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_7_io_out_QSV_3_0), .io_out_QSV_3_1(_m_7_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_7_io_out_QSV_4_0), .io_out_QSV_4_1(_m_7_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_7_io_out_QSV_5_0), .io_out_QSV_5_1(_m_7_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_7_io_out_QSV_6_0), .io_out_QSV_6_1(_m_7_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_7_io_out_QSV_7_0), .io_out_QSV_7_1(_m_7_io_out_QSV_7_1),
    .io_out_valid(_m_7_io_out_valid)
  );

  HGate3QubitVector8bit m_8 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_7_io_out_QSV_0_0), .io_in_QSV_0_1(_m_7_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_7_io_out_QSV_1_0), .io_in_QSV_1_1(_m_7_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_7_io_out_QSV_2_0), .io_in_QSV_2_1(_m_7_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_7_io_out_QSV_3_0), .io_in_QSV_3_1(_m_7_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_7_io_out_QSV_4_0), .io_in_QSV_4_1(_m_7_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_7_io_out_QSV_5_0), .io_in_QSV_5_1(_m_7_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_7_io_out_QSV_6_0), .io_in_QSV_6_1(_m_7_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_7_io_out_QSV_7_0), .io_in_QSV_7_1(_m_7_io_out_QSV_7_1),
    .io_in_valid(_m_7_io_out_valid),
    .io_out_QSV_0_0(_m_8_io_out_QSV_0_0), .io_out_QSV_0_1(_m_8_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_8_io_out_QSV_1_0), .io_out_QSV_1_1(_m_8_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_8_io_out_QSV_2_0), .io_out_QSV_2_1(_m_8_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_8_io_out_QSV_3_0), .io_out_QSV_3_1(_m_8_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_8_io_out_QSV_4_0), .io_out_QSV_4_1(_m_8_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_8_io_out_QSV_5_0), .io_out_QSV_5_1(_m_8_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_8_io_out_QSV_6_0), .io_out_QSV_6_1(_m_8_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_8_io_out_QSV_7_0), .io_out_QSV_7_1(_m_8_io_out_QSV_7_1),
    .io_out_valid(_m_8_io_out_valid)
  );

  CompatiblePerm m_9 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_8_io_out_QSV_0_0), .io_in_QSV_0_1(_m_8_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_8_io_out_QSV_1_0), .io_in_QSV_1_1(_m_8_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_8_io_out_QSV_2_0), .io_in_QSV_2_1(_m_8_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_8_io_out_QSV_3_0), .io_in_QSV_3_1(_m_8_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_8_io_out_QSV_4_0), .io_in_QSV_4_1(_m_8_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_8_io_out_QSV_5_0), .io_in_QSV_5_1(_m_8_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_8_io_out_QSV_6_0), .io_in_QSV_6_1(_m_8_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_8_io_out_QSV_7_0), .io_in_QSV_7_1(_m_8_io_out_QSV_7_1),
    .io_in_valid(_m_8_io_out_valid),
    .io_out_QSV_0_0(_m_9_io_out_QSV_0_0), .io_out_QSV_0_1(_m_9_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_9_io_out_QSV_1_0), .io_out_QSV_1_1(_m_9_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_9_io_out_QSV_2_0), .io_out_QSV_2_1(_m_9_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_9_io_out_QSV_3_0), .io_out_QSV_3_1(_m_9_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_9_io_out_QSV_4_0), .io_out_QSV_4_1(_m_9_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_9_io_out_QSV_5_0), .io_out_QSV_5_1(_m_9_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_9_io_out_QSV_6_0), .io_out_QSV_6_1(_m_9_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_9_io_out_QSV_7_0), .io_out_QSV_7_1(_m_9_io_out_QSV_7_1),
    .io_out_valid(_m_9_io_out_valid)
  );

  // Step 4 & 5: cs(2, 1) and h(2) sharing a perm bracket
  CompatiblePerm_2 m_10 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_9_io_out_QSV_0_0), .io_in_QSV_0_1(_m_9_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_9_io_out_QSV_1_0), .io_in_QSV_1_1(_m_9_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_9_io_out_QSV_2_0), .io_in_QSV_2_1(_m_9_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_9_io_out_QSV_3_0), .io_in_QSV_3_1(_m_9_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_9_io_out_QSV_4_0), .io_in_QSV_4_1(_m_9_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_9_io_out_QSV_5_0), .io_in_QSV_5_1(_m_9_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_9_io_out_QSV_6_0), .io_in_QSV_6_1(_m_9_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_9_io_out_QSV_7_0), .io_in_QSV_7_1(_m_9_io_out_QSV_7_1),
    .io_in_valid(_m_9_io_out_valid),
    .io_out_QSV_0_0(_m_10_io_out_QSV_0_0), .io_out_QSV_0_1(_m_10_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_10_io_out_QSV_1_0), .io_out_QSV_1_1(_m_10_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_10_io_out_QSV_2_0), .io_out_QSV_2_1(_m_10_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_10_io_out_QSV_3_0), 
    .io_out_QSV_4_0(_m_10_io_out_QSV_4_0), .io_out_QSV_4_1(_m_10_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_10_io_out_QSV_5_0), .io_out_QSV_5_1(_m_10_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_10_io_out_QSV_6_0), .io_out_QSV_6_1(_m_10_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_10_io_out_QSV_7_0), 
    .io_out_valid(_m_10_io_out_valid)
  );

  CSGate3QubitVector8bit m_11 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_10_io_out_QSV_0_0), .io_in_QSV_0_1(_m_10_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_10_io_out_QSV_1_0), .io_in_QSV_1_1(_m_10_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_10_io_out_QSV_2_0), .io_in_QSV_2_1(_m_10_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_10_io_out_QSV_3_0), 
    .io_in_QSV_4_0(_m_10_io_out_QSV_4_0), .io_in_QSV_4_1(_m_10_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_10_io_out_QSV_5_0), .io_in_QSV_5_1(_m_10_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_10_io_out_QSV_6_0), .io_in_QSV_6_1(_m_10_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_10_io_out_QSV_7_0), 
    .io_in_valid(_m_10_io_out_valid),
    .io_out_QSV_0_0(_m_11_io_out_QSV_0_0), .io_out_QSV_0_1(_m_11_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_11_io_out_QSV_1_0), .io_out_QSV_1_1(_m_11_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_11_io_out_QSV_2_0), .io_out_QSV_2_1(_m_11_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_11_io_out_QSV_3_0), .io_out_QSV_3_1(_m_11_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_11_io_out_QSV_4_0), .io_out_QSV_4_1(_m_11_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_11_io_out_QSV_5_0), .io_out_QSV_5_1(_m_11_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_11_io_out_QSV_6_0), .io_out_QSV_6_1(_m_11_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_11_io_out_QSV_7_0), .io_out_QSV_7_1(_m_11_io_out_QSV_7_1),
    .io_out_valid(_m_11_io_out_valid)
  );

  HGate3QubitVector8bit m_12 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_11_io_out_QSV_0_0), .io_in_QSV_0_1(_m_11_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_11_io_out_QSV_1_0), .io_in_QSV_1_1(_m_11_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_11_io_out_QSV_2_0), .io_in_QSV_2_1(_m_11_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_11_io_out_QSV_3_0), .io_in_QSV_3_1(_m_11_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_11_io_out_QSV_4_0), .io_in_QSV_4_1(_m_11_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_11_io_out_QSV_5_0), .io_in_QSV_5_1(_m_11_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_11_io_out_QSV_6_0), .io_in_QSV_6_1(_m_11_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_11_io_out_QSV_7_0), .io_in_QSV_7_1(_m_11_io_out_QSV_7_1),
    .io_in_valid(_m_11_io_out_valid),
    .io_out_QSV_0_0(_m_12_io_out_QSV_0_0), .io_out_QSV_0_1(_m_12_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_12_io_out_QSV_1_0), .io_out_QSV_1_1(_m_12_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_12_io_out_QSV_2_0), .io_out_QSV_2_1(_m_12_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_12_io_out_QSV_3_0), .io_out_QSV_3_1(_m_12_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_12_io_out_QSV_4_0), .io_out_QSV_4_1(_m_12_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_12_io_out_QSV_5_0), .io_out_QSV_5_1(_m_12_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_12_io_out_QSV_6_0), .io_out_QSV_6_1(_m_12_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_12_io_out_QSV_7_0), .io_out_QSV_7_1(_m_12_io_out_QSV_7_1),
    .io_out_valid(_m_12_io_out_valid)
  );

  CompatiblePerm_2 m_13 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_12_io_out_QSV_0_0), .io_in_QSV_0_1(_m_12_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_12_io_out_QSV_1_0), .io_in_QSV_1_1(_m_12_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_12_io_out_QSV_2_0), .io_in_QSV_2_1(_m_12_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_12_io_out_QSV_3_0), .io_in_QSV_3_1(_m_12_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_12_io_out_QSV_4_0), .io_in_QSV_4_1(_m_12_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_12_io_out_QSV_5_0), .io_in_QSV_5_1(_m_12_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_12_io_out_QSV_6_0), .io_in_QSV_6_1(_m_12_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_12_io_out_QSV_7_0), .io_in_QSV_7_1(_m_12_io_out_QSV_7_1),
    .io_in_valid(_m_12_io_out_valid),
    .io_out_QSV_0_0(_m_13_io_out_QSV_0_0), .io_out_QSV_0_1(_m_13_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_13_io_out_QSV_1_0), .io_out_QSV_1_1(_m_13_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_13_io_out_QSV_2_0), .io_out_QSV_2_1(_m_13_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_13_io_out_QSV_3_0), .io_out_QSV_3_1(_m_13_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_13_io_out_QSV_4_0), .io_out_QSV_4_1(_m_13_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_13_io_out_QSV_5_0), .io_out_QSV_5_1(_m_13_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_13_io_out_QSV_6_0), .io_out_QSV_6_1(_m_13_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_13_io_out_QSV_7_0), .io_out_QSV_7_1(_m_13_io_out_QSV_7_1),
    .io_out_valid(_m_13_io_out_valid)
  );

  // Step 6: swap(0, 2)
  CompatiblePerm_1 m_14 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_13_io_out_QSV_0_0), .io_in_QSV_0_1(_m_13_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_13_io_out_QSV_1_0), .io_in_QSV_1_1(_m_13_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_13_io_out_QSV_2_0), .io_in_QSV_2_1(_m_13_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_13_io_out_QSV_3_0), .io_in_QSV_3_1(_m_13_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_13_io_out_QSV_4_0), .io_in_QSV_4_1(_m_13_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_13_io_out_QSV_5_0), .io_in_QSV_5_1(_m_13_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_13_io_out_QSV_6_0), .io_in_QSV_6_1(_m_13_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_13_io_out_QSV_7_0), .io_in_QSV_7_1(_m_13_io_out_QSV_7_1),
    .io_in_valid(_m_13_io_out_valid),
    .io_out_QSV_0_0(_m_14_io_out_QSV_0_0), .io_out_QSV_0_1(_m_14_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_14_io_out_QSV_1_0), .io_out_QSV_1_1(_m_14_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_14_io_out_QSV_2_0), .io_out_QSV_2_1(_m_14_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_14_io_out_QSV_3_0), .io_out_QSV_3_1(_m_14_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_14_io_out_QSV_4_0), .io_out_QSV_4_1(_m_14_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_14_io_out_QSV_5_0), .io_out_QSV_5_1(_m_14_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_14_io_out_QSV_6_0), .io_out_QSV_6_1(_m_14_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_14_io_out_QSV_7_0), .io_out_QSV_7_1(_m_14_io_out_QSV_7_1),
    .io_out_valid(_m_14_io_out_valid)
  );

  SWGate3QubitVector8bit m_15 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_14_io_out_QSV_0_0), .io_in_QSV_0_1(_m_14_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_14_io_out_QSV_1_0), .io_in_QSV_1_1(_m_14_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_14_io_out_QSV_2_0), .io_in_QSV_2_1(_m_14_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_14_io_out_QSV_3_0), .io_in_QSV_3_1(_m_14_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_14_io_out_QSV_4_0), .io_in_QSV_4_1(_m_14_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_14_io_out_QSV_5_0), .io_in_QSV_5_1(_m_14_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_14_io_out_QSV_6_0), .io_in_QSV_6_1(_m_14_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_14_io_out_QSV_7_0), .io_in_QSV_7_1(_m_14_io_out_QSV_7_1),
    .io_in_valid(_m_14_io_out_valid),
    .io_out_QSV_0_0(_m_15_io_out_QSV_0_0), .io_out_QSV_0_1(_m_15_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_15_io_out_QSV_1_0), .io_out_QSV_1_1(_m_15_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_15_io_out_QSV_2_0), .io_out_QSV_2_1(_m_15_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_15_io_out_QSV_3_0), .io_out_QSV_3_1(_m_15_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_15_io_out_QSV_4_0), .io_out_QSV_4_1(_m_15_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_15_io_out_QSV_5_0), .io_out_QSV_5_1(_m_15_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_15_io_out_QSV_6_0), .io_out_QSV_6_1(_m_15_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_15_io_out_QSV_7_0), .io_out_QSV_7_1(_m_15_io_out_QSV_7_1),
    .io_out_valid(_m_15_io_out_valid)
  );

  CompatiblePerm_1 m_16 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_15_io_out_QSV_0_0), .io_in_QSV_0_1(_m_15_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_15_io_out_QSV_1_0), .io_in_QSV_1_1(_m_15_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_15_io_out_QSV_2_0), .io_in_QSV_2_1(_m_15_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_15_io_out_QSV_3_0), .io_in_QSV_3_1(_m_15_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_15_io_out_QSV_4_0), .io_in_QSV_4_1(_m_15_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_15_io_out_QSV_5_0), .io_in_QSV_5_1(_m_15_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_15_io_out_QSV_6_0), .io_in_QSV_6_1(_m_15_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_15_io_out_QSV_7_0), .io_in_QSV_7_1(_m_15_io_out_QSV_7_1),
    .io_in_valid(_m_15_io_out_valid),
    .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
    .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
    .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
    .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
    .io_out_QSV_4_0(io_out_QSV_4_0), .io_out_QSV_4_1(io_out_QSV_4_1),
    .io_out_QSV_5_0(io_out_QSV_5_0), .io_out_QSV_5_1(io_out_QSV_5_1),
    .io_out_QSV_6_0(io_out_QSV_6_0), .io_out_QSV_6_1(io_out_QSV_6_1),
    .io_out_QSV_7_0(io_out_QSV_7_0), .io_out_QSV_7_1(io_out_QSV_7_1),
    .io_out_valid(io_out_valid)
  );

endmodule
