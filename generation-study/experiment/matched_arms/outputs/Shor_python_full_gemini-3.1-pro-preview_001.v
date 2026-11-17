module Shor (
  input  wire       clock,
  input  wire       reset,
  input  wire [7:0] io_in_QSV_0_0, io_in_QSV_0_1, io_in_QSV_1_0, io_in_QSV_1_1,
  input  wire [7:0] io_in_QSV_2_0, io_in_QSV_2_1, io_in_QSV_3_0, io_in_QSV_3_1,
  input  wire [7:0] io_in_QSV_4_0, io_in_QSV_4_1, io_in_QSV_5_0, io_in_QSV_5_1,
  input  wire [7:0] io_in_QSV_6_0, io_in_QSV_6_1, io_in_QSV_7_0, io_in_QSV_7_1,
  input  wire [7:0] io_in_QSV_8_0, io_in_QSV_8_1, io_in_QSV_9_0, io_in_QSV_9_1,
  input  wire [7:0] io_in_QSV_10_0, io_in_QSV_10_1, io_in_QSV_11_0, io_in_QSV_11_1,
  input  wire [7:0] io_in_QSV_12_0, io_in_QSV_12_1, io_in_QSV_13_0, io_in_QSV_13_1,
  input  wire [7:0] io_in_QSV_14_0, io_in_QSV_14_1, io_in_QSV_15_0, io_in_QSV_15_1,
  input  wire [7:0] io_in_QSV_16_0, io_in_QSV_16_1, io_in_QSV_17_0, io_in_QSV_17_1,
  input  wire [7:0] io_in_QSV_18_0, io_in_QSV_18_1, io_in_QSV_19_0, io_in_QSV_19_1,
  input  wire [7:0] io_in_QSV_20_0, io_in_QSV_20_1, io_in_QSV_21_0, io_in_QSV_21_1,
  input  wire [7:0] io_in_QSV_22_0, io_in_QSV_22_1, io_in_QSV_23_0, io_in_QSV_23_1,
  input  wire [7:0] io_in_QSV_24_0, io_in_QSV_24_1, io_in_QSV_25_0, io_in_QSV_25_1,
  input  wire [7:0] io_in_QSV_26_0, io_in_QSV_26_1, io_in_QSV_27_0, io_in_QSV_27_1,
  input  wire [7:0] io_in_QSV_28_0, io_in_QSV_28_1, io_in_QSV_29_0, io_in_QSV_29_1,
  input  wire [7:0] io_in_QSV_30_0, io_in_QSV_30_1, io_in_QSV_31_0, io_in_QSV_31_1,
  input  wire       io_in_valid,
  
  output wire [7:0] io_out_QSV_0_0, io_out_QSV_0_1, io_out_QSV_1_0, io_out_QSV_1_1,
  output wire [7:0] io_out_QSV_2_0, io_out_QSV_2_1, io_out_QSV_3_0, io_out_QSV_3_1,
  output wire [7:0] io_out_QSV_4_0, io_out_QSV_4_1, io_out_QSV_5_0, io_out_QSV_5_1,
  output wire [7:0] io_out_QSV_6_0, io_out_QSV_6_1, io_out_QSV_7_0, io_out_QSV_7_1,
  output wire [7:0] io_out_QSV_8_0, io_out_QSV_8_1, io_out_QSV_9_0, io_out_QSV_9_1,
  output wire [7:0] io_out_QSV_10_0, io_out_QSV_10_1, io_out_QSV_11_0, io_out_QSV_11_1,
  output wire [7:0] io_out_QSV_12_0, io_out_QSV_12_1, io_out_QSV_13_0, io_out_QSV_13_1,
  output wire [7:0] io_out_QSV_14_0, io_out_QSV_14_1, io_out_QSV_15_0, io_out_QSV_15_1,
  output wire [7:0] io_out_QSV_16_0, io_out_QSV_16_1, io_out_QSV_17_0, io_out_QSV_17_1,
  output wire [7:0] io_out_QSV_18_0, io_out_QSV_18_1, io_out_QSV_19_0, io_out_QSV_19_1,
  output wire [7:0] io_out_QSV_20_0, io_out_QSV_20_1, io_out_QSV_21_0, io_out_QSV_21_1,
  output wire [7:0] io_out_QSV_22_0, io_out_QSV_22_1, io_out_QSV_23_0, io_out_QSV_23_1,
  output wire [7:0] io_out_QSV_24_0, io_out_QSV_24_1, io_out_QSV_25_0, io_out_QSV_25_1,
  output wire [7:0] io_out_QSV_26_0, io_out_QSV_26_1, io_out_QSV_27_0, io_out_QSV_27_1,
  output wire [7:0] io_out_QSV_28_0, io_out_QSV_28_1, io_out_QSV_29_0, io_out_QSV_29_1,
  output wire [7:0] io_out_QSV_30_0, io_out_QSV_30_1, io_out_QSV_31_0, io_out_QSV_31_1,
  output wire       io_out_valid
);

  // --- Intermediate Wires ---
  `define DECLARE_STAGE_WIRES(PREFIX) \
    wire _``PREFIX``_io_out_valid; \
    wire [7:0] _``PREFIX``_io_out_QSV_0_0, _``PREFIX``_io_out_QSV_0_1, _``PREFIX``_io_out_QSV_1_0, _``PREFIX``_io_out_QSV_1_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_2_0, _``PREFIX``_io_out_QSV_2_1, _``PREFIX``_io_out_QSV_3_0, _``PREFIX``_io_out_QSV_3_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_4_0, _``PREFIX``_io_out_QSV_4_1, _``PREFIX``_io_out_QSV_5_0, _``PREFIX``_io_out_QSV_5_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_6_0, _``PREFIX``_io_out_QSV_6_1, _``PREFIX``_io_out_QSV_7_0, _``PREFIX``_io_out_QSV_7_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_8_0, _``PREFIX``_io_out_QSV_8_1, _``PREFIX``_io_out_QSV_9_0, _``PREFIX``_io_out_QSV_9_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_10_0, _``PREFIX``_io_out_QSV_10_1, _``PREFIX``_io_out_QSV_11_0, _``PREFIX``_io_out_QSV_11_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_12_0, _``PREFIX``_io_out_QSV_12_1, _``PREFIX``_io_out_QSV_13_0, _``PREFIX``_io_out_QSV_13_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_14_0, _``PREFIX``_io_out_QSV_14_1, _``PREFIX``_io_out_QSV_15_0, _``PREFIX``_io_out_QSV_15_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_16_0, _``PREFIX``_io_out_QSV_16_1, _``PREFIX``_io_out_QSV_17_0, _``PREFIX``_io_out_QSV_17_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_18_0, _``PREFIX``_io_out_QSV_18_1, _``PREFIX``_io_out_QSV_19_0, _``PREFIX``_io_out_QSV_19_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_20_0, _``PREFIX``_io_out_QSV_20_1, _``PREFIX``_io_out_QSV_21_0, _``PREFIX``_io_out_QSV_21_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_22_0, _``PREFIX``_io_out_QSV_22_1, _``PREFIX``_io_out_QSV_23_0, _``PREFIX``_io_out_QSV_23_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_24_0, _``PREFIX``_io_out_QSV_24_1, _``PREFIX``_io_out_QSV_25_0, _``PREFIX``_io_out_QSV_25_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_26_0, _``PREFIX``_io_out_QSV_26_1, _``PREFIX``_io_out_QSV_27_0, _``PREFIX``_io_out_QSV_27_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_28_0, _``PREFIX``_io_out_QSV_28_1, _``PREFIX``_io_out_QSV_29_0, _``PREFIX``_io_out_QSV_29_1; \
    wire [7:0] _``PREFIX``_io_out_QSV_30_0, _``PREFIX``_io_out_QSV_30_1, _``PREFIX``_io_out_QSV_31_0, _``PREFIX``_io_out_QSV_31_1;

  `DECLARE_STAGE_WIRES(m)
  `DECLARE_STAGE_WIRES(m_1)
  `DECLARE_STAGE_WIRES(m_2)
  `DECLARE_STAGE_WIRES(m_3)
  `DECLARE_STAGE_WIRES(m_4)
  `DECLARE_STAGE_WIRES(m_5)
  `DECLARE_STAGE_WIRES(m_6)
  `DECLARE_STAGE_WIRES(m_7)
  `DECLARE_STAGE_WIRES(m_8)
  `DECLARE_STAGE_WIRES(m_9)
  `DECLARE_STAGE_WIRES(m_10)
  `DECLARE_STAGE_WIRES(m_11)
  `DECLARE_STAGE_WIRES(m_12)
  `DECLARE_STAGE_WIRES(m_13)
  `DECLARE_STAGE_WIRES(m_14)
  
  `undef DECLARE_STAGE_WIRES

  // --- Macro for connection lists to avoid repetitive boilerplate ---
  `define MAP_IN(PREFIX) \
    .io_in_valid(PREFIX``_valid), \
    .io_in_QSV_0_0(PREFIX``_QSV_0_0), .io_in_QSV_0_1(PREFIX``_QSV_0_1), .io_in_QSV_1_0(PREFIX``_QSV_1_0), .io_in_QSV_1_1(PREFIX``_QSV_1_1), \
    .io_in_QSV_2_0(PREFIX``_QSV_2_0), .io_in_QSV_2_1(PREFIX``_QSV_2_1), .io_in_QSV_3_0(PREFIX``_QSV_3_0), .io_in_QSV_3_1(PREFIX``_QSV_3_1), \
    .io_in_QSV_4_0(PREFIX``_QSV_4_0), .io_in_QSV_4_1(PREFIX``_QSV_4_1), .io_in_QSV_5_0(PREFIX``_QSV_5_0), .io_in_QSV_5_1(PREFIX``_QSV_5_1), \
    .io_in_QSV_6_0(PREFIX``_QSV_6_0), .io_in_QSV_6_1(PREFIX``_QSV_6_1), .io_in_QSV_7_0(PREFIX``_QSV_7_0), .io_in_QSV_7_1(PREFIX``_QSV_7_1), \
    .io_in_QSV_8_0(PREFIX``_QSV_8_0), .io_in_QSV_8_1(PREFIX``_QSV_8_1), .io_in_QSV_9_0(PREFIX``_QSV_9_0), .io_in_QSV_9_1(PREFIX``_QSV_9_1), \
    .io_in_QSV_10_0(PREFIX``_QSV_10_0), .io_in_QSV_10_1(PREFIX``_QSV_10_1), .io_in_QSV_11_0(PREFIX``_QSV_11_0), .io_in_QSV_11_1(PREFIX``_QSV_11_1), \
    .io_in_QSV_12_0(PREFIX``_QSV_12_0), .io_in_QSV_12_1(PREFIX``_QSV_12_1), .io_in_QSV_13_0(PREFIX``_QSV_13_0), .io_in_QSV_13_1(PREFIX``_QSV_13_1), \
    .io_in_QSV_14_0(PREFIX``_QSV_14_0), .io_in_QSV_14_1(PREFIX``_QSV_14_1), .io_in_QSV_15_0(PREFIX``_QSV_15_0), .io_in_QSV_15_1(PREFIX``_QSV_15_1), \
    .io_in_QSV_16_0(PREFIX``_QSV_16_0), .io_in_QSV_16_1(PREFIX``_QSV_16_1), .io_in_QSV_17_0(PREFIX``_QSV_17_0), .io_in_QSV_17_1(PREFIX``_QSV_17_1), \
    .io_in_QSV_18_0(PREFIX``_QSV_18_0), .io_in_QSV_18_1(PREFIX``_QSV_18_1), .io_in_QSV_19_0(PREFIX``_QSV_19_0), .io_in_QSV_19_1(PREFIX``_QSV_19_1), \
    .io_in_QSV_20_0(PREFIX``_QSV_20_0), .io_in_QSV_20_1(PREFIX``_QSV_20_1), .io_in_QSV_21_0(PREFIX``_QSV_21_0), .io_in_QSV_21_1(PREFIX``_QSV_21_1), \
    .io_in_QSV_22_0(PREFIX``_QSV_22_0), .io_in_QSV_22_1(PREFIX``_QSV_22_1), .io_in_QSV_23_0(PREFIX``_QSV_23_0), .io_in_QSV_23_1(PREFIX``_QSV_23_1), \
    .io_in_QSV_24_0(PREFIX``_QSV_24_0), .io_in_QSV_24_1(PREFIX``_QSV_24_1), .io_in_QSV_25_0(PREFIX``_QSV_25_0), .io_in_QSV_25_1(PREFIX``_QSV_25_1), \
    .io_in_QSV_26_0(PREFIX``_QSV_26_0), .io_in_QSV_26_1(PREFIX``_QSV_26_1), .io_in_QSV_27_0(PREFIX``_QSV_27_0), .io_in_QSV_27_1(PREFIX``_QSV_27_1), \
    .io_in_QSV_28_0(PREFIX``_QSV_28_0), .io_in_QSV_28_1(PREFIX``_QSV_28_1), .io_in_QSV_29_0(PREFIX``_QSV_29_0), .io_in_QSV_29_1(PREFIX``_QSV_29_1), \
    .io_in_QSV_30_0(PREFIX``_QSV_30_0), .io_in_QSV_30_1(PREFIX``_QSV_30_1), .io_in_QSV_31_0(PREFIX``_QSV_31_0), .io_in_QSV_31_1(PREFIX``_QSV_31_1)

  `define MAP_OUT(PREFIX) \
    .io_out_valid(PREFIX``_valid), \
    .io_out_QSV_0_0(PREFIX``_QSV_0_0), .io_out_QSV_0_1(PREFIX``_QSV_0_1), .io_out_QSV_1_0(PREFIX``_QSV_1_0), .io_out_QSV_1_1(PREFIX``_QSV_1_1), \
    .io_out_QSV_2_0(PREFIX``_QSV_2_0), .io_out_QSV_2_1(PREFIX``_QSV_2_1), .io_out_QSV_3_0(PREFIX``_QSV_3_0), .io_out_QSV_3_1(PREFIX``_QSV_3_1), \
    .io_out_QSV_4_0(PREFIX``_QSV_4_0), .io_out_QSV_4_1(PREFIX``_QSV_4_1), .io_out_QSV_5_0(PREFIX``_QSV_5_0), .io_out_QSV_5_1(PREFIX``_QSV_5_1), \
    .io_out_QSV_6_0(PREFIX``_QSV_6_0), .io_out_QSV_6_1(PREFIX``_QSV_6_1), .io_out_QSV_7_0(PREFIX``_QSV_7_0), .io_out_QSV_7_1(PREFIX``_QSV_7_1), \
    .io_out_QSV_8_0(PREFIX``_QSV_8_0), .io_out_QSV_8_1(PREFIX``_QSV_8_1), .io_out_QSV_9_0(PREFIX``_QSV_9_0), .io_out_QSV_9_1(PREFIX``_QSV_9_1), \
    .io_out_QSV_10_0(PREFIX``_QSV_10_0), .io_out_QSV_10_1(PREFIX``_QSV_10_1), .io_out_QSV_11_0(PREFIX``_QSV_11_0), .io_out_QSV_11_1(PREFIX``_QSV_11_1), \
    .io_out_QSV_12_0(PREFIX``_QSV_12_0), .io_out_QSV_12_1(PREFIX``_QSV_12_1), .io_out_QSV_13_0(PREFIX``_QSV_13_0), .io_out_QSV_13_1(PREFIX``_QSV_13_1), \
    .io_out_QSV_14_0(PREFIX``_QSV_14_0), .io_out_QSV_14_1(PREFIX``_QSV_14_1), .io_out_QSV_15_0(PREFIX``_QSV_15_0), .io_out_QSV_15_1(PREFIX``_QSV_15_1), \
    .io_out_QSV_16_0(PREFIX``_QSV_16_0), .io_out_QSV_16_1(PREFIX``_QSV_16_1), .io_out_QSV_17_0(PREFIX``_QSV_17_0), .io_out_QSV_17_1(PREFIX``_QSV_17_1), \
    .io_out_QSV_18_0(PREFIX``_QSV_18_0), .io_out_QSV_18_1(PREFIX``_QSV_18_1), .io_out_QSV_19_0(PREFIX``_QSV_19_0), .io_out_QSV_19_1(PREFIX``_QSV_19_1), \
    .io_out_QSV_20_0(PREFIX``_QSV_20_0), .io_out_QSV_20_1(PREFIX``_QSV_20_1), .io_out_QSV_21_0(PREFIX``_QSV_21_0), .io_out_QSV_21_1(PREFIX``_QSV_21_1), \
    .io_out_QSV_22_0(PREFIX``_QSV_22_0), .io_out_QSV_22_1(PREFIX``_QSV_22_1), .io_out_QSV_23_0(PREFIX``_QSV_23_0), .io_out_QSV_23_1(PREFIX``_QSV_23_1), \
    .io_out_QSV_24_0(PREFIX``_QSV_24_0), .io_out_QSV_24_1(PREFIX``_QSV_24_1), .io_out_QSV_25_0(PREFIX``_QSV_25_0), .io_out_QSV_25_1(PREFIX``_QSV_25_1), \
    .io_out_QSV_26_0(PREFIX``_QSV_26_0), .io_out_QSV_26_1(PREFIX``_QSV_26_1), .io_out_QSV_27_0(PREFIX``_QSV_27_0), .io_out_QSV_27_1(PREFIX``_QSV_27_1), \
    .io_out_QSV_28_0(PREFIX``_QSV_28_0), .io_out_QSV_28_1(PREFIX``_QSV_28_1), .io_out_QSV_29_0(PREFIX``_QSV_29_0), .io_out_QSV_29_1(PREFIX``_QSV_29_1), \
    .io_out_QSV_30_0(PREFIX``_QSV_30_0), .io_out_QSV_30_1(PREFIX``_QSV_30_1), .io_out_QSV_31_0(PREFIX``_QSV_31_0), .io_out_QSV_31_1(PREFIX``_QSV_31_1)

  // Stage 0
  HGate5QubitVector8bit m (
    .clock(clock), .reset(reset),
    `MAP_IN(io_in),
    `MAP_OUT(_m_io_out)
  );

  // Stage 1
  CompatiblePerm m_1 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_io_out),
    `MAP_OUT(_m_1_io_out)
  );

  // Stage 2
  CNGate5QubitVector8bit m_2 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_1_io_out),
    `MAP_OUT(_m_2_io_out)
  );

  // Stage 3
  CompatiblePerm_1 m_3 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_2_io_out),
    `MAP_OUT(_m_3_io_out)
  );

  // Stage 4
  CompatiblePerm_2 m_4 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_3_io_out),
    `MAP_OUT(_m_4_io_out)
  );

  // Stage 5
  CNGate5QubitVector8bit m_5 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_4_io_out),
    `MAP_OUT(_m_5_io_out)
  );

  // Stage 6
  CompatiblePerm_3 m_6 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_5_io_out),
    `MAP_OUT(_m_6_io_out)
  );

  // Stage 7
  CompatiblePerm_4 m_7 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_6_io_out),
    `MAP_OUT(_m_7_io_out)
  );

  // Stage 8
  CNGate5QubitVector8bit m_8 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_7_io_out),
    `MAP_OUT(_m_8_io_out)
  );

  // Stage 9
  CompatiblePerm_5 m_9 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_8_io_out),
    `MAP_OUT(_m_9_io_out)
  );

  // Stage 10
  CompatiblePerm_6 m_10 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_9_io_out),
    `MAP_OUT(_m_10_io_out)
  );

  // Stage 11
  CNGate5QubitVector8bit m_11 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_10_io_out),
    `MAP_OUT(_m_11_io_out)
  );

  // Stage 12
  CompatiblePerm_1 m_12 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_11_io_out),
    `MAP_OUT(_m_12_io_out)
  );

  // Stage 13
  CompatiblePerm_4 m_13 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_12_io_out),
    `MAP_OUT(_m_13_io_out)
  );

  // Stage 14
  CompatiblePerm_9 m_14 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_13_io_out),
    `MAP_OUT(_m_14_io_out)
  );

  // Stage 15
  CompatiblePerm_10 m_15 (
    .clock(clock), .reset(reset),
    `MAP_IN(_m_14_io_out),
    `MAP_OUT(io_out)
  );

  `undef MAP_IN
  `undef MAP_OUT

endmodule
