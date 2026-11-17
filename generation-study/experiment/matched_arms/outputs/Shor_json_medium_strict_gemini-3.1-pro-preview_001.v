module Shor(
  input  clock,
  input  reset,
  input  [7:0] io_in_QSV_0_0,
  input  [7:0] io_in_QSV_0_1,
  input  [7:0] io_in_QSV_1_0,
  input  [7:0] io_in_QSV_1_1,
  input  [7:0] io_in_QSV_2_0,
  input  [7:0] io_in_QSV_2_1,
  input  [7:0] io_in_QSV_3_0,
  input  [7:0] io_in_QSV_3_1,
  input  [7:0] io_in_QSV_4_0,
  input  [7:0] io_in_QSV_4_1,
  input  [7:0] io_in_QSV_5_0,
  input  [7:0] io_in_QSV_5_1,
  input  [7:0] io_in_QSV_6_0,
  input  [7:0] io_in_QSV_6_1,
  input  [7:0] io_in_QSV_7_0,
  input  [7:0] io_in_QSV_7_1,
  input  [7:0] io_in_QSV_8_0,
  input  [7:0] io_in_QSV_8_1,
  input  [7:0] io_in_QSV_9_0,
  input  [7:0] io_in_QSV_9_1,
  input  [7:0] io_in_QSV_10_0,
  input  [7:0] io_in_QSV_10_1,
  input  [7:0] io_in_QSV_11_0,
  input  [7:0] io_in_QSV_11_1,
  input  [7:0] io_in_QSV_12_0,
  input  [7:0] io_in_QSV_12_1,
  input  [7:0] io_in_QSV_13_0,
  input  [7:0] io_in_QSV_13_1,
  input  [7:0] io_in_QSV_14_0,
  input  [7:0] io_in_QSV_14_1,
  input  [7:0] io_in_QSV_15_0,
  input  [7:0] io_in_QSV_15_1,
  input  [7:0] io_in_QSV_16_0,
  input  [7:0] io_in_QSV_16_1,
  input  [7:0] io_in_QSV_17_0,
  input  [7:0] io_in_QSV_17_1,
  input  [7:0] io_in_QSV_18_0,
  input  [7:0] io_in_QSV_18_1,
  input  [7:0] io_in_QSV_19_0,
  input  [7:0] io_in_QSV_19_1,
  input  [7:0] io_in_QSV_20_0,
  input  [7:0] io_in_QSV_20_1,
  input  [7:0] io_in_QSV_21_0,
  input  [7:0] io_in_QSV_21_1,
  input  [7:0] io_in_QSV_22_0,
  input  [7:0] io_in_QSV_22_1,
  input  [7:0] io_in_QSV_23_0,
  input  [7:0] io_in_QSV_23_1,
  input  [7:0] io_in_QSV_24_0,
  input  [7:0] io_in_QSV_24_1,
  input  [7:0] io_in_QSV_25_0,
  input  [7:0] io_in_QSV_25_1,
  input  [7:0] io_in_QSV_26_0,
  input  [7:0] io_in_QSV_26_1,
  input  [7:0] io_in_QSV_27_0,
  input  [7:0] io_in_QSV_27_1,
  input  [7:0] io_in_QSV_28_0,
  input  [7:0] io_in_QSV_28_1,
  input  [7:0] io_in_QSV_29_0,
  input  [7:0] io_in_QSV_29_1,
  input  [7:0] io_in_QSV_30_0,
  input  [7:0] io_in_QSV_30_1,
  input  [7:0] io_in_QSV_31_0,
  input  [7:0] io_in_QSV_31_1,
  input  io_in_valid,
  output [7:0] io_out_QSV_0_0,
  output [7:0] io_out_QSV_0_1,
  output [7:0] io_out_QSV_1_0,
  output [7:0] io_out_QSV_1_1,
  output [7:0] io_out_QSV_2_0,
  output [7:0] io_out_QSV_2_1,
  output [7:0] io_out_QSV_3_0,
  output [7:0] io_out_QSV_3_1,
  output [7:0] io_out_QSV_4_0,
  output [7:0] io_out_QSV_4_1,
  output [7:0] io_out_QSV_5_0,
  output [7:0] io_out_QSV_5_1,
  output [7:0] io_out_QSV_6_0,
  output [7:0] io_out_QSV_6_1,
  output [7:0] io_out_QSV_7_0,
  output [7:0] io_out_QSV_7_1,
  output [7:0] io_out_QSV_8_0,
  output [7:0] io_out_QSV_8_1,
  output [7:0] io_out_QSV_9_0,
  output [7:0] io_out_QSV_9_1,
  output [7:0] io_out_QSV_10_0,
  output [7:0] io_out_QSV_10_1,
  output [7:0] io_out_QSV_11_0,
  output [7:0] io_out_QSV_11_1,
  output [7:0] io_out_QSV_12_0,
  output [7:0] io_out_QSV_12_1,
  output [7:0] io_out_QSV_13_0,
  output [7:0] io_out_QSV_13_1,
  output [7:0] io_out_QSV_14_0,
  output [7:0] io_out_QSV_14_1,
  output [7:0] io_out_QSV_15_0,
  output [7:0] io_out_QSV_15_1,
  output [7:0] io_out_QSV_16_0,
  output [7:0] io_out_QSV_16_1,
  output [7:0] io_out_QSV_17_0,
  output [7:0] io_out_QSV_17_1,
  output [7:0] io_out_QSV_18_0,
  output [7:0] io_out_QSV_18_1,
  output [7:0] io_out_QSV_19_0,
  output [7:0] io_out_QSV_19_1,
  output [7:0] io_out_QSV_20_0,
  output [7:0] io_out_QSV_20_1,
  output [7:0] io_out_QSV_21_0,
  output [7:0] io_out_QSV_21_1,
  output [7:0] io_out_QSV_22_0,
  output [7:0] io_out_QSV_22_1,
  output [7:0] io_out_QSV_23_0,
  output [7:0] io_out_QSV_23_1,
  output [7:0] io_out_QSV_24_0,
  output [7:0] io_out_QSV_24_1,
  output [7:0] io_out_QSV_25_0,
  output [7:0] io_out_QSV_25_1,
  output [7:0] io_out_QSV_26_0,
  output [7:0] io_out_QSV_26_1,
  output [7:0] io_out_QSV_27_0,
  output [7:0] io_out_QSV_27_1,
  output [7:0] io_out_QSV_28_0,
  output [7:0] io_out_QSV_28_1,
  output [7:0] io_out_QSV_29_0,
  output [7:0] io_out_QSV_29_1,
  output [7:0] io_out_QSV_30_0,
  output [7:0] io_out_QSV_30_1,
  output [7:0] io_out_QSV_31_0,
  output [7:0] io_out_QSV_31_1,
  output io_out_valid
);

  `define DECLARE_STAGE_WIRES(STG) \
    wire [7:0] STG``_io_out_QSV_0_0, STG``_io_out_QSV_0_1, STG``_io_out_QSV_1_0, STG``_io_out_QSV_1_1; \
    wire [7:0] STG``_io_out_QSV_2_0, STG``_io_out_QSV_2_1, STG``_io_out_QSV_3_0, STG``_io_out_QSV_3_1; \
    wire [7:0] STG``_io_out_QSV_4_0, STG``_io_out_QSV_4_1, STG``_io_out_QSV_5_0, STG``_io_out_QSV_5_1; \
    wire [7:0] STG``_io_out_QSV_6_0, STG``_io_out_QSV_6_1, STG``_io_out_QSV_7_0, STG``_io_out_QSV_7_1; \
    wire [7:0] STG``_io_out_QSV_8_0, STG``_io_out_QSV_8_1, STG``_io_out_QSV_9_0, STG``_io_out_QSV_9_1; \
    wire [7:0] STG``_io_out_QSV_10_0, STG``_io_out_QSV_10_1, STG``_io_out_QSV_11_0, STG``_io_out_QSV_11_1; \
    wire [7:0] STG``_io_out_QSV_12_0, STG``_io_out_QSV_12_1, STG``_io_out_QSV_13_0, STG``_io_out_QSV_13_1; \
    wire [7:0] STG``_io_out_QSV_14_0, STG``_io_out_QSV_14_1, STG``_io_out_QSV_15_0, STG``_io_out_QSV_15_1; \
    wire [7:0] STG``_io_out_QSV_16_0, STG``_io_out_QSV_16_1, STG``_io_out_QSV_17_0, STG``_io_out_QSV_17_1; \
    wire [7:0] STG``_io_out_QSV_18_0, STG``_io_out_QSV_18_1, STG``_io_out_QSV_19_0, STG``_io_out_QSV_19_1; \
    wire [7:0] STG``_io_out_QSV_20_0, STG``_io_out_QSV_20_1, STG``_io_out_QSV_21_0, STG``_io_out_QSV_21_1; \
    wire [7:0] STG``_io_out_QSV_22_0, STG``_io_out_QSV_22_1, STG``_io_out_QSV_23_0, STG``_io_out_QSV_23_1; \
    wire [7:0] STG``_io_out_QSV_24_0, STG``_io_out_QSV_24_1, STG``_io_out_QSV_25_0, STG``_io_out_QSV_25_1; \
    wire [7:0] STG``_io_out_QSV_26_0, STG``_io_out_QSV_26_1, STG``_io_out_QSV_27_0, STG``_io_out_QSV_27_1; \
    wire [7:0] STG``_io_out_QSV_28_0, STG``_io_out_QSV_28_1, STG``_io_out_QSV_29_0, STG``_io_out_QSV_29_1; \
    wire [7:0] STG``_io_out_QSV_30_0, STG``_io_out_QSV_30_1, STG``_io_out_QSV_31_0, STG``_io_out_QSV_31_1; \
    wire STG``_io_out_valid;

  `DECLARE_STAGE_WIRES(_m)
  `DECLARE_STAGE_WIRES(_m_1)
  `DECLARE_STAGE_WIRES(_m_2)
  `DECLARE_STAGE_WIRES(_m_3)
  `DECLARE_STAGE_WIRES(_m_4)
  `DECLARE_STAGE_WIRES(_m_5)
  `DECLARE_STAGE_WIRES(_m_6)
  `DECLARE_STAGE_WIRES(_m_7)
  `DECLARE_STAGE_WIRES(_m_8)
  `DECLARE_STAGE_WIRES(_m_9)
  `DECLARE_STAGE_WIRES(_m_10)
  `DECLARE_STAGE_WIRES(_m_11)

  `define CONNECT_STAGE_IN(PORT, STG) \
    .io_in_QSV_0_0(STG``_io_out_QSV_0_0), .io_in_QSV_0_1(STG``_io_out_QSV_0_1), .io_in_QSV_1_0(STG``_io_out_QSV_1_0), .io_in_QSV_1_1(STG``_io_out_QSV_1_1), \
    .io_in_QSV_2_0(STG``_io_out_QSV_2_0), .io_in_QSV_2_1(STG``_io_out_QSV_2_1), .io_in_QSV_3_0(STG``_io_out_QSV_3_0), .io_in_QSV_3_1(STG``_io_out_QSV_3_1), \
    .io_in_QSV_4_0(STG``_io_out_QSV_4_0), .io_in_QSV_4_1(STG``_io_out_QSV_4_1), .io_in_QSV_5_0(STG``_io_out_QSV_5_0), .io_in_QSV_5_1(STG``_io_out_QSV_5_1), \
    .io_in_QSV_6_0(STG``_io_out_QSV_6_0), .io_in_QSV_6_1(STG``_io_out_QSV_6_1), .io_in_QSV_7_0(STG``_io_out_QSV_7_0), .io_in_QSV_7_1(STG``_io_out_QSV_7_1), \
    .io_in_QSV_8_0(STG``_io_out_QSV_8_0), .io_in_QSV_8_1(STG``_io_out_QSV_8_1), .io_in_QSV_9_0(STG``_io_out_QSV_9_0), .io_in_QSV_9_1(STG``_io_out_QSV_9_1), \
    .io_in_QSV_10_0(STG``_io_out_QSV_10_0), .io_in_QSV_10_1(STG``_io_out_QSV_10_1), .io_in_QSV_11_0(STG``_io_out_QSV_11_0), .io_in_QSV_11_1(STG``_io_out_QSV_11_1), \
    .io_in_QSV_12_0(STG``_io_out_QSV_12_0), .io_in_QSV_12_1(STG``_io_out_QSV_12_1), .io_in_QSV_13_0(STG``_io_out_QSV_13_0), .io_in_QSV_13_1(STG``_io_out_QSV_13_1), \
    .io_in_QSV_14_0(STG``_io_out_QSV_14_0), .io_in_QSV_14_1(STG``_io_out_QSV_14_1), .io_in_QSV_15_0(STG``_io_out_QSV_15_0), .io_in_QSV_15_1(STG``_io_out_QSV_15_1), \
    .io_in_QSV_16_0(STG``_io_out_QSV_16_0), .io_in_QSV_16_1(STG``_io_out_QSV_16_1), .io_in_QSV_17_0(STG``_io_out_QSV_17_0), .io_in_QSV_17_1(STG``_io_out_QSV_17_1), \
    .io_in_QSV_18_0(STG``_io_out_QSV_18_0), .io_in_QSV_18_1(STG``_io_out_QSV_18_1), .io_in_QSV_19_0(STG``_io_out_QSV_19_0), .io_in_QSV_19_1(STG``_io_out_QSV_19_1), \
    .io_in_QSV_20_0(STG``_io_out_QSV_20_0), .io_in_QSV_20_1(STG``_io_out_QSV_20_1), .io_in_QSV_21_0(STG``_io_out_QSV_21_0), .io_in_QSV_21_1(STG``_io_out_QSV_21_1), \
    .io_in_QSV_22_0(STG``_io_out_QSV_22_0), .io_in_QSV_22_1(STG``_io_out_QSV_22_1), .io_in_QSV_23_0(STG``_io_out_QSV_23_0), .io_in_QSV_23_1(STG``_io_out_QSV_23_1), \
    .io_in_QSV_24_0(STG``_io_out_QSV_24_0), .io_in_QSV_24_1(STG``_io_out_QSV_24_1), .io_in_QSV_25_0(STG``_io_out_QSV_25_0), .io_in_QSV_25_1(STG``_io_out_QSV_25_1), \
    .io_in_QSV_26_0(STG``_io_out_QSV_26_0), .io_in_QSV_26_1(STG``_io_out_QSV_26_1), .io_in_QSV_27_0(STG``_io_out_QSV_27_0), .io_in_QSV_27_1(STG``_io_out_QSV_27_1), \
    .io_in_QSV_28_0(STG``_io_out_QSV_28_0), .io_in_QSV_28_1(STG``_io_out_QSV_28_1), .io_in_QSV_29_0(STG``_io_out_QSV_29_0), .io_in_QSV_29_1(STG``_io_out_QSV_29_1), \
    .io_in_QSV_30_0(STG``_io_out_QSV_30_0), .io_in_QSV_30_1(STG``_io_out_QSV_30_1), .io_in_QSV_31_0(STG``_io_out_QSV_31_0), .io_in_QSV_31_1(STG``_io_out_QSV_31_1), \
    .io_in_valid(STG``_io_out_valid)

  `define CONNECT_STAGE_OUT(PORT, STG) \
    .io_out_QSV_0_0(STG``_io_out_QSV_0_0), .io_out_QSV_0_1(STG``_io_out_QSV_0_1), .io_out_QSV_1_0(STG``_io_out_QSV_1_0), .io_out_QSV_1_1(STG``_io_out_QSV_1_1), \
    .io_out_QSV_2_0(STG``_io_out_QSV_2_0), .io_out_QSV_2_1(STG``_io_out_QSV_2_1), .io_out_QSV_3_0(STG``_io_out_QSV_3_0), .io_out_QSV_3_1(STG``_io_out_QSV_3_1), \
    .io_out_QSV_4_0(STG``_io_out_QSV_4_0), .io_out_QSV_4_1(STG``_io_out_QSV_4_1), .io_out_QSV_5_0(STG``_io_out_QSV_5_0), .io_out_QSV_5_1(STG``_io_out_QSV_5_1), \
    .io_out_QSV_6_0(STG``_io_out_QSV_6_0), .io_out_QSV_6_1(STG``_io_out_QSV_6_1), .io_out_QSV_7_0(STG``_io_out_QSV_7_0), .io_out_QSV_7_1(STG``_io_out_QSV_7_1), \
    .io_out_QSV_8_0(STG``_io_out_QSV_8_0), .io_out_QSV_8_1(STG``_io_out_QSV_8_1), .io_out_QSV_9_0(STG``_io_out_QSV_9_0), .io_out_QSV_9_1(STG``_io_out_QSV_9_1), \
    .io_out_QSV_10_0(STG``_io_out_QSV_10_0), .io_out_QSV_10_1(STG``_io_out_QSV_10_1), .io_out_QSV_11_0(STG``_io_out_QSV_11_0), .io_out_QSV_11_1(STG``_io_out_QSV_11_1), \
    .io_out_QSV_12_0(STG``_io_out_QSV_12_0), .io_out_QSV_12_1(STG``_io_out_QSV_12_1), .io_out_QSV_13_0(STG``_io_out_QSV_13_0), .io_out_QSV_13_1(STG``_io_out_QSV_13_1), \
    .io_out_QSV_14_0(STG``_io_out_QSV_14_0), .io_out_QSV_14_1(STG``_io_out_QSV_14_1), .io_out_QSV_15_0(STG``_io_out_QSV_15_0), .io_out_QSV_15_1(STG``_io_out_QSV_15_1), \
    .io_out_QSV_16_0(STG``_io_out_QSV_16_0), .io_out_QSV_16_1(STG``_io_out_QSV_16_1), .io_out_QSV_17_0(STG``_io_out_QSV_17_0), .io_out_QSV_17_1(STG``_io_out_QSV_17_1), \
    .io_out_QSV_18_0(STG``_io_out_QSV_18_0), .io_out_QSV_18_1(STG``_io_out_QSV_18_1), .io_out_QSV_19_0(STG``_io_out_QSV_19_0), .io_out_QSV_19_1(STG``_io_out_QSV_19_1), \
    .io_out_QSV_20_0(STG``_io_out_QSV_20_0), .io_out_QSV_20_1(STG``_io_out_QSV_20_1), .io_out_QSV_21_0(STG``_io_out_QSV_21_0), .io_out_QSV_21_1(STG``_io_out_QSV_21_1), \
    .io_out_QSV_22_0(STG``_io_out_QSV_22_0), .io_out_QSV_22_1(STG``_io_out_QSV_22_1), .io_out_QSV_23_0(STG``_io_out_QSV_23_0), .io_out_QSV_23_1(STG``_io_out_QSV_23_1), \
    .io_out_QSV_24_0(STG``_io_out_QSV_24_0), .io_out_QSV_24_1(STG``_io_out_QSV_24_1), .io_out_QSV_25_0(STG``_io_out_QSV_25_0), .io_out_QSV_25_1(STG``_io_out_QSV_25_1), \
    .io_out_QSV_26_0(STG``_io_out_QSV_26_0), .io_out_QSV_26_1(STG``_io_out_QSV_26_1), .io_out_QSV_27_0(STG``_io_out_QSV_27_0), .io_out_QSV_27_1(STG``_io_out_QSV_27_1), \
    .io_out_QSV_28_0(STG``_io_out_QSV_28_0), .io_out_QSV_28_1(STG``_io_out_QSV_28_1), .io_out_QSV_29_0(STG``_io_out_QSV_29_0), .io_out_QSV_29_1(STG``_io_out_QSV_29_1), \
    .io_out_QSV_30_0(STG``_io_out_QSV_30_0), .io_out_QSV_30_1(STG``_io_out_QSV_30_1), .io_out_QSV_31_0(STG``_io_out_QSV_31_0), .io_out_QSV_31_1(STG``_io_out_QSV_31_1), \
    .io_out_valid(STG``_io_out_valid)

  HGate5QubitVector8bit m (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_IN(ignored, ),
    `CONNECT_STAGE_OUT(ignored, _m)
  );

  CompatiblePerm m_1 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_IN(ignored, _m),
    `CONNECT_STAGE_OUT(ignored, _m_1)
  );

  CNGate5QubitVector8bit m_2 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_IN(ignored, _m_1),
    `CONNECT_STAGE_OUT(ignored, _m_2)
  );

  CompatiblePerm_1 m_3 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_IN(ignored, _m_2),
    `CONNECT_STAGE_OUT(ignored, _m_3)
  );

  CompatiblePerm_2 m_4 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_IN(ignored, _m_3),
    `CONNECT_STAGE_OUT(ignored, _m_4)
  );

  CNGate5QubitVector8bit m_5 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_IN(ignored, _m_4),
    `CONNECT_STAGE_OUT(ignored, _m_5)
  );

  CompatiblePerm_3 m_6 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_IN(ignored, _m_5),
    `CONNECT_STAGE_OUT(ignored, _m_6)
  );

  CompatiblePerm_4 m_7 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_IN(ignored, _m_6),
    `CONNECT_STAGE_OUT(ignored, _m_7)
  );

  CNGate5QubitVector8bit m_8 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_IN(ignored, _m_7),
    `CONNECT_STAGE_OUT(ignored, _m_8)
  );

  CompatiblePerm_5 m_9 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_IN(ignored, _m_8),
    `CONNECT_STAGE_OUT(ignored, _m_9)
  );

  CompatiblePerm_6 m_10 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_IN(ignored, _m_9),
    `CONNECT_STAGE_OUT(ignored, _m_10)
  );

  CNGate5QubitVector8bit m_11 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_IN(ignored, _m_10),
    `CONNECT_STAGE_OUT(ignored, _m_11)
  );

  CompatiblePerm_7 m_12 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_IN(ignored, _m_11),
    `CONNECT_STAGE_OUT(ignored, )
  );

endmodule
