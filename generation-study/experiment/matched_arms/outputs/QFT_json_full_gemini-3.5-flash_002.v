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

  // Stage 0 (m) outputs
  wire [7:0] _m_io_out_QSV_0_0, _m_io_out_QSV_0_1, _m_io_out_QSV_1_0, _m_io_out_QSV_1_1;
  wire [7:0] _m_io_out_QSV_2_0, _m_io_out_QSV_2_1, _m_io_out_QSV_3_0, _m_io_out_QSV_3_1;
  wire [7:0] _m_io_out_QSV_4_0, _m_io_out_QSV_4_1, _m_io_out_QSV_5_0, _m_io_out_QSV_5_1;
  wire [7:0] _m_io_out_QSV_6_0, _m_io_out_QSV_6_1, _m_io_out_QSV_7_0, _m_io_out_QSV_7_1;
  wire       _m_io_out_valid;

  // Stage 1 (m_1) outputs
  wire [7:0] _m_1_io_out_QSV_0_0, _m_1_io_out_QSV_0_1, _m_1_io_out_QSV_1_0, _m_1_io_out_QSV_1_1;
  wire [7:0] _m_1_io_out_QSV_2_0, _m_1_io_out_QSV_2_1, _m_1_io_out_QSV_3_0, _m_1_io_out_QSV_3_1;
  wire [7:0] _m_1_io_out_QSV_4_0, _m_1_io_out_QSV_4_1, _m_1_io_out_QSV_5_0, _m_1_io_out_QSV_5_1;
  wire [7:0] _m_1_io_out_QSV_6_0, _m_1_io_out_QSV_6_1, _m_1_io_out_QSV_7_0, _m_1_io_out_QSV_7_1;
  wire       _m_1_io_out_valid;

  // Stage 2 (m_2) outputs
  wire [7:0] _m_2_io_out_QSV_0_0, _m_2_io_out_QSV_0_1, _m_2_io_out_QSV_1_0, _m_2_io_out_QSV_1_1;
  wire [7:0] _m_2_io_out_QSV_2_0, _m_2_io_out_QSV_2_1, _m_2_io_out_QSV_3_0, _m_2_io_out_QSV_3_1;
  wire [7:0] _m_2_io_out_QSV_4_0, _m_2_io_out_QSV_4_1, _m_2_io_out_QSV_5_0, _m_2_io_out_QSV_5_1;
  wire [7:0] _m_2_io_out_QSV_6_0, _m_2_io_out_QSV_6_1, _m_2_io_out_QSV_7_0, _m_2_io_out_QSV_7_1;
  wire       _m_2_io_out_valid;

  // Stage 3 (m_3) outputs
  wire [7:0] _m_3_io_out_QSV_0_0, _m_3_io_out_QSV_0_1, _m_3_io_out_QSV_1_0, _m_3_io_out_QSV_1_1;
  wire [7:0] _m_3_io_out_QSV_2_0, _m_3_io_out_QSV_2_1, _m_3_io_out_QSV_3_0, _m_3_io_out_QSV_3_1;
  wire [7:0] _m_3_io_out_QSV_4_0, _m_3_io_out_QSV_4_1, _m_3_io_out_QSV_5_0, _m_3_io_out_QSV_5_1;
  wire [7:0] _m_3_io_out_QSV_6_0, _m_3_io_out_QSV_6_1, _m_3_io_out_QSV_7_0, _m_3_io_out_QSV_7_1;
  wire       _m_3_io_out_valid;

  // Stage 4 (m_4) outputs
  wire [7:0] _m_4_io_out_QSV_0_0, _m_4_io_out_QSV_0_1, _m_4_io_out_QSV_1_0, _m_4_io_out_QSV_1_1;
  wire [7:0] _m_4_io_out_QSV_2_0, _m_4_io_out_QSV_2_1, _m_4_io_out_QSV_3_0, _m_4_io_out_QSV_3_1;
  wire [7:0] _m_4_io_out_QSV_4_0, _m_4_io_out_QSV_4_1, _m_4_io_out_QSV_5_0, _m_4_io_out_QSV_5_1;
  wire [7:0] _m_4_io_out_QSV_6_0, _m_4_io_out_QSV_6_1, _m_4_io_out_QSV_7_0, _m_4_io_out_QSV_7_1;
  wire       _m_4_io_out_valid;

  // Stage 5 (m_5) outputs
  wire [7:0] _m_5_io_out_QSV_0_0, _m_5_io_out_QSV_0_1, _m_5_io_out_QSV_1_0, _m_5_io_out_QSV_1_1;
  wire [7:0] _m_5_io_out_QSV_2_0, _m_5_io_out_QSV_2_1, _m_5_io_out_QSV_3_0, _m_5_io_out_QSV_3_1;
  wire [7:0] _m_5_io_out_QSV_4_0, _m_5_io_out_QSV_4_1, _m_5_io_out_QSV_5_0, _m_5_io_out_QSV_5_1;
  wire [7:0] _m_5_io_out_QSV_6_0, _m_5_io_out_QSV_6_1, _m_5_io_out_QSV_7_0, _m_5_io_out_QSV_7_1;
  wire       _m_5_io_out_valid;

  // Stage 6 (m_6) outputs
  wire [7:0] _m_6_io_out_QSV_0_0, _m_6_io_out_QSV_0_1, _m_6_io_out_QSV_1_0, _m_6_io_out_QSV_1_1;
  wire [7:0] _m_6_io_out_QSV_2_0, _m_6_io_out_QSV_2_1, _m_6_io_out_QSV_3_0, _m_6_io_out_QSV_3_1;
  wire [7:0] _m_6_io_out_QSV_4_0, _m_6_io_out_QSV_4_1, _m_6_io_out_QSV_5_0, _m_6_io_out_QSV_5_1;
  wire [7:0] _m_6_io_out_QSV_6_0, _m_6_io_out_QSV_6_1, _m_6_io_out_QSV_7_0, _m_6_io_out_QSV_7_1;
  wire       _m_6_io_out_valid;

  // Stage 7 (m_7) outputs
  wire [7:0] _m_7_io_out_QSV_0_0, _m_7_io_out_QSV_0_1, _m_7_io_out_QSV_1_0, _m_7_io_out_QSV_1_1;
  wire [7:0] _m_7_io_out_QSV_2_0, _m_7_io_out_QSV_2_1, _m_7_io_out_QSV_3_0, _m_7_io_out_QSV_3_1;
  wire [7:0] _m_7_io_out_QSV_4_0, _m_7_io_out_QSV_4_1, _m_7_io_out_QSV_5_0, _m_7_io_out_QSV_5_1;
  wire [7:0] _m_7_io_out_QSV_6_0, _m_7_io_out_QSV_6_1, _m_7_io_out_QSV_7_0, _m_7_io_out_QSV_7_1;
  wire       _m_7_io_out_valid;

  // Stage 8 (m_8) outputs
  wire [7:0] _m_8_io_out_QSV_0_0, _m_8_io_out_QSV_0_1, _m_8_io_out_QSV_1_0, _m_8_io_out_QSV_1_1;
  wire [7:0] _m_8_io_out_QSV_2_0, _m_8_io_out_QSV_2_1, _m_8_io_out_QSV_3_0, _m_8_io_out_QSV_3_1;
  wire [7:0] _m_8_io_out_QSV_4_0, _m_8_io_out_QSV_4_1, _m_8_io_out_QSV_5_0, _m_8_io_out_QSV_5_1;
  wire [7:0] _m_8_io_out_QSV_6_0, _m_8_io_out_QSV_6_1, _m_8_io_out_QSV_7_0, _m_8_io_out_QSV_7_1;
  wire       _m_8_io_out_valid;

  // Stage 9 (m_9) outputs
  wire [7:0] _m_9_io_out_QSV_0_0, _m_9_io_out_QSV_0_1, _m_9_io_out_QSV_1_0, _m_9_io_out_QSV_1_1;
  wire [7:0] _m_9_io_out_QSV_2_0, _m_9_io_out_QSV_2_1, _m_9_io_out_QSV_3_0, _m_9_io_out_QSV_3_1;
  wire [7:0] _m_9_io_out_QSV_4_0, _m_9_io_out_QSV_4_1, _m_9_io_out_QSV_5_0, _m_9_io_out_QSV_5_1;
  wire [7:0] _m_9_io_out_QSV_6_0, _m_9_io_out_QSV_6_1, _m_9_io_out_QSV_7_0, _m_9_io_out_QSV_7_1;
  wire       _m_9_io_out_valid;

  // Stage 10 (m_10) outputs
  wire [7:0] _m_10_io_out_QSV_0_0, _m_10_io_out_QSV_0_1, _m_10_io_out_QSV_1_0, _m_10_io_out_QSV_1_1;
  wire [7:0] _m_10_io_out_QSV_2_0, _m_10_io_out_QSV_2_1, _m_10_io_out_QSV_3_0, _m_10_io_out_QSV_3_1;
  wire [7:0] _m_10_io_out_QSV_4_0, _m_10_io_out_QSV_4_1, _m_10_io_out_QSV_5_0, _m_10_io_out_QSV_5_1;
  wire [7:0] _m_10_io_out_QSV_6_0, _m_10_io_out_QSV_6_1, _m_10_io_out_QSV_7_0, _m_10_io_out_QSV_7_1;
  wire       _m_10_io_out_valid;

  // Stage 11 (m_11) outputs
  wire [7:0] _m_11_io_out_QSV_0_0, _m_11_io_out_QSV_0_1, _m_11_io_out_QSV_1_0, _m_11_io_out_QSV_1_1;
  wire [7:0] _m_11_io_out_QSV_2_0, _m_11_io_out_QSV_2_1, _m_11_io_out_QSV_3_0, _m_11_io_out_QSV_3_1;
  wire [7:0] _m_11_io_out_QSV_4_0, _m_11_io_out_QSV_4_1, _m_11_io_out_QSV_5_0, _m_11_io_out_QSV_5_1;
  wire [7:0] _m_11_io_out_QSV_6_0, _m_11_io_out_QSV_6_1, _m_11_io_out_QSV_7_0, _m_11_io_out_QSV_7_1;
  wire       _m_11_io_out_valid;

  // Stage 0: HGate3QubitVector8bit
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
    .io_out_QSV_3_1(_m_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_io_out_QSV_7_1),
    .io_out_valid(_m_io_out_valid)
  );

  // Stage 1: CSGate3QubitVector8bit
  // Note: io_in_QSV_3_1 and io_in_QSV_7_1 are optimized out on CSGate3QubitVector8bit
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

  // Stage 2: CompatiblePerm
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

  // Stage 3: CTGate3QubitVector8bit
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

  // Stage 4: CompatiblePerm_1
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

  // Stage 5: HGate3QubitVector8bit
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
    .io_out_QSV_3_1(_m_5_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_5_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_5_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_5_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_5_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_5_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_5_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_5_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_5_io_out_QSV_7_1),
    .io_out_valid(_m_5_io_out_valid)
  );

  // Stage 6: CSGate3QubitVector8bit
  // Note: io_in_QSV_3_1 and io_in_QSV_7_1 are optimized out on CSGate3QubitVector8bit
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

  // Stage 7: CompatiblePerm_2
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

  // Stage 8: HGate3QubitVector8bit
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

  // Stage 9: CompatiblePerm
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

  // Stage 10: SWGate3QubitVector8bit
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

  // Stage 11: CompatiblePerm_2
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

  // Stage 12: CompatiblePerm
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
