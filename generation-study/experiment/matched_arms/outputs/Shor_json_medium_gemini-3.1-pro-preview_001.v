module Shor(
  input        clock,
  input        reset,
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
  input        io_in_valid,
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
  output       io_out_valid
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
  `DECLARE_STAGE_WIRES(_m_12)
  `DECLARE_STAGE_WIRES(_m_13)
  `DECLARE_STAGE_WIRES(_m_14)

  `define MAP_PORTS(INST, IN_PREF, OUT_PREF) \
    .clock(clock), .reset(reset), \
    .io_in_QSV_0_0(IN_PREF``_0_0), .io_in_QSV_0_1(IN_PREF``_0_1), .io_in_QSV_1_0(IN_PREF``_1_0), .io_in_QSV_1_1(IN_PREF``_1_1), \
    .io_in_QSV_2_0(IN_PREF``_2_0), .io_in_QSV_2_1(IN_PREF``_2_1), .io_in_QSV_3_0(IN_PREF``_3_0), .io_in_QSV_3_1(IN_PREF``_3_1), \
    .io_in_QSV_4_0(IN_PREF``_4_0), .io_in_QSV_4_1(IN_PREF``_4_1), .io_in_QSV_5_0(IN_PREF``_5_0), .io_in_QSV_5_1(IN_PREF``_5_1), \
    .io_in_QSV_6_0(IN_PREF``_6_0), .io_in_QSV_6_1(IN_PREF``_6_1), .io_in_QSV_7_0(IN_PREF``_7_0), .io_in_QSV_7_1(IN_PREF``_7_1), \
    .io_in_QSV_8_0(IN_PREF``_8_0), .io_in_QSV_8_1(IN_PREF``_8_1), .io_in_QSV_9_0(IN_PREF``_9_0), .io_in_QSV_9_1(IN_PREF``_9_1), \
    .io_in_QSV_10_0(IN_PREF``_10_0), .io_in_QSV_10_1(IN_PREF``_10_1), .io_in_QSV_11_0(IN_PREF``_11_0), .io_in_QSV_11_1(IN_PREF``_11_1), \
    .io_in_QSV_12_0(IN_PREF``_12_0), .io_in_QSV_12_1(IN_PREF``_12_1), .io_in_QSV_13_0(IN_PREF``_13_0), .io_in_QSV_13_1(IN_PREF``_13_1), \
    .io_in_QSV_14_0(IN_PREF``_14_0), .io_in_QSV_14_1(IN_PREF``_14_1), .io_in_QSV_15_0(IN_PREF``_15_0), .io_in_QSV_15_1(IN_PREF``_15_1), \
    .io_in_QSV_16_0(IN_PREF``_16_0), .io_in_QSV_16_1(IN_PREF``_16_1), .io_in_QSV_17_0(IN_PREF``_17_0), .io_in_QSV_17_1(IN_PREF``_17_1), \
    .io_in_QSV_18_0(IN_PREF``_18_0), .io_in_QSV_18_1(IN_PREF``_18_1), .io_in_QSV_19_0(IN_PREF``_19_0), .io_in_QSV_19_1(IN_PREF``_19_1), \
    .io_in_QSV_20_0(IN_PREF``_20_0), .io_in_QSV_20_1(IN_PREF``_20_1), .io_in_QSV_21_0(IN_PREF``_21_0), .io_in_QSV_21_1(IN_PREF``_21_1), \
    .io_in_QSV_22_0(IN_PREF``_22_0), .io_in_QSV_22_1(IN_PREF``_22_1), .io_in_QSV_23_0(IN_PREF``_23_0), .io_in_QSV_23_1(IN_PREF``_23_1), \
    .io_in_QSV_24_0(IN_PREF``_24_0), .io_in_QSV_24_1(IN_PREF``_24_1), .io_in_QSV_25_0(IN_PREF``_25_0), .io_in_QSV_25_1(IN_PREF``_25_1), \
    .io_in_QSV_26_0(IN_PREF``_26_0), .io_in_QSV_26_1(IN_PREF``_26_1), .io_in_QSV_27_0(IN_PREF``_27_0), .io_in_QSV_27_1(IN_PREF``_27_1), \
    .io_in_QSV_28_0(IN_PREF``_28_0), .io_in_QSV_28_1(IN_PREF``_28_1), .io_in_QSV_29_0(IN_PREF``_29_0), .io_in_QSV_29_1(IN_PREF``_29_1), \
    .io_in_QSV_30_0(IN_PREF``_30_0), .io_in_QSV_30_1(IN_PREF``_30_1), .io_in_QSV_31_0(IN_PREF``_31_0), .io_in_QSV_31_1(IN_PREF``_31_1), \
    .io_out_QSV_0_0(OUT_PREF``_0_0), .io_out_QSV_0_1(OUT_PREF``_0_1), .io_out_QSV_1_0(OUT_PREF``_1_0), .io_out_QSV_1_1(OUT_PREF``_1_1), \
    .io_out_QSV_2_0(OUT_PREF``_2_0), .io_out_QSV_2_1(OUT_PREF``_2_1), .io_out_QSV_3_0(OUT_PREF``_3_0), .io_out_QSV_3_1(OUT_PREF``_3_1), \
    .io_out_QSV_4_0(OUT_PREF``_4_0), .io_out_QSV_4_1(OUT_PREF``_4_1), .io_out_QSV_5_0(OUT_PREF``_5_0), .io_out_QSV_5_1(OUT_PREF``_5_1), \
    .io_out_QSV_6_0(OUT_PREF``_6_0), .io_out_QSV_6_1(OUT_PREF``_6_1), .io_out_QSV_7_0(OUT_PREF``_7_0), .io_out_QSV_7_1(OUT_PREF``_7_1), \
    .io_out_QSV_8_0(OUT_PREF``_8_0), .io_out_QSV_8_1(OUT_PREF``_8_1), .io_out_QSV_9_0(OUT_PREF``_9_0), .io_out_QSV_9_1(OUT_PREF``_9_1), \
    .io_out_QSV_10_0(OUT_PREF``_10_0), .io_out_QSV_10_1(OUT_PREF``_10_1), .io_out_QSV_11_0(OUT_PREF``_11_0), .io_out_QSV_11_1(OUT_PREF``_11_1), \
    .io_out_QSV_12_0(OUT_PREF``_12_0), .io_out_QSV_12_1(OUT_PREF``_12_1), .io_out_QSV_13_0(OUT_PREF``_13_0), .io_out_QSV_13_1(OUT_PREF``_13_1), \
    .io_out_QSV_14_0(OUT_PREF``_14_0), .io_out_QSV_14_1(OUT_PREF``_14_1), .io_out_QSV_15_0(OUT_PREF``_15_0), .io_out_QSV_15_1(OUT_PREF``_15_1), \
    .io_out_QSV_16_0(OUT_PREF``_16_0), .io_out_QSV_16_1(OUT_PREF``_16_1), .io_out_QSV_17_0(OUT_PREF``_17_0), .io_out_QSV_17_1(OUT_PREF``_17_1), \
    .io_out_QSV_18_0(OUT_PREF``_18_0), .io_out_QSV_18_1(OUT_PREF``_18_1), .io_out_QSV_19_0(OUT_PREF``_19_0), .io_out_QSV_19_1(OUT_PREF``_19_1), \
    .io_out_QSV_20_0(OUT_PREF``_20_0), .io_out_QSV_20_1(OUT_PREF``_20_1), .io_out_QSV_21_0(OUT_PREF``_21_0), .io_out_QSV_21_1(OUT_PREF``_21_1), \
    .io_out_QSV_22_0(OUT_PREF``_22_0), .io_out_QSV_22_1(OUT_PREF``_22_1), .io_out_QSV_23_0(OUT_PREF``_23_0), .io_out_QSV_23_1(OUT_PREF``_23_1), \
    .io_out_QSV_24_0(OUT_PREF``_24_0), .io_out_QSV_24_1(OUT_PREF``_24_1), .io_out_QSV_25_0(OUT_PREF``_25_0), .io_out_QSV_25_1(OUT_PREF``_25_1), \
    .io_out_QSV_26_0(OUT_PREF``_26_0), .io_out_QSV_26_1(OUT_PREF``_26_1), .io_out_QSV_27_0(OUT_PREF``_27_0), .io_out_QSV_27_1(OUT_PREF``_27_1), \
    .io_out_QSV_28_0(OUT_PREF``_28_0), .io_out_QSV_28_1(OUT_PREF``_28_1), .io_out_QSV_29_0(OUT_PREF``_29_0), .io_out_QSV_29_1(OUT_PREF``_29_1), \
    .io_out_QSV_30_0(OUT_PREF``_30_0), .io_out_QSV_30_1(OUT_PREF``_30_1), .io_out_QSV_31_0(OUT_PREF``_31_0), .io_out_QSV_31_1(OUT_PREF``_31_1)

  HGate5QubitVector8bit m (
    `MAP_PORTS(m, io_in_QSV, _m_io_out_QSV),
    .io_in_valid(io_in_valid),
    .io_out_valid(_m_io_out_valid)
  );

  CompatiblePerm m_1 (
    `MAP_PORTS(m_1, _m_io_out_QSV, _m_1_io_out_QSV),
    .io_in_valid(_m_io_out_valid),
    .io_out_valid(_m_1_io_out_valid)
  );

  CNGate5QubitVector8bit m_2 (
    `MAP_PORTS(m_2, _m_1_io_out_QSV, _m_2_io_out_QSV),
    .io_in_valid(_m_1_io_out_valid),
    .io_out_valid(_m_2_io_out_valid)
  );

  CompatiblePerm_1 m_3 (
    `MAP_PORTS(m_3, _m_2_io_out_QSV, _m_3_io_out_QSV),
    .io_in_valid(_m_2_io_out_valid),
    .io_out_valid(_m_3_io_out_valid)
  );

  CompatiblePerm_2 m_4 (
    `MAP_PORTS(m_4, _m_3_io_out_QSV, _m_4_io_out_QSV),
    .io_in_valid(_m_3_io_out_valid),
    .io_out_valid(_m_4_io_out_valid)
  );

  CNGate5QubitVector8bit m_5 (
    `MAP_PORTS(m_5, _m_4_io_out_QSV, _m_5_io_out_QSV),
    .io_in_valid(_m_4_io_out_valid),
    .io_out_valid(_m_5_io_out_valid)
  );

  CompatiblePerm_3 m_6 (
    `MAP_PORTS(m_6, _m_5_io_out_QSV, _m_6_io_out_QSV),
    .io_in_valid(_m_5_io_out_valid),
    .io_out_valid(_m_6_io_out_valid)
  );

  CompatiblePerm_4 m_7 (
    `MAP_PORTS(m_7, _m_6_io_out_QSV, _m_7_io_out_QSV),
    .io_in_valid(_m_6_io_out_valid),
    .io_out_valid(_m_7_io_out_valid)
  );

  CNGate5QubitVector8bit m_8 (
    `MAP_PORTS(m_8, _m_7_io_out_QSV, _m_8_io_out_QSV),
    .io_in_valid(_m_7_io_out_valid),
    .io_out_valid(_m_8_io_out_valid)
  );

  CompatiblePerm_5 m_9 (
    `MAP_PORTS(m_9, _m_8_io_out_QSV, _m_9_io_out_QSV),
    .io_in_valid(_m_8_io_out_valid),
    .io_out_valid(_m_9_io_out_valid)
  );

  CompatiblePerm_6 m_10 (
    `MAP_PORTS(m_10, _m_9_io_out_QSV, _m_10_io_out_QSV),
    .io_in_valid(_m_9_io_out_valid),
    .io_out_valid(_m_10_io_out_valid)
  );

  CNGate5QubitVector8bit m_11 (
    `MAP_PORTS(m_11, _m_10_io_out_QSV, _m_11_io_out_QSV),
    .io_in_valid(_m_10_io_out_valid),
    .io_out_valid(_m_11_io_out_valid)
  );

  CompatiblePerm_7 m_12 (
    `MAP_PORTS(m_12, _m_11_io_out_QSV, _m_12_io_out_QSV),
    .io_in_valid(_m_11_io_out_valid),
    .io_out_valid(_m_12_io_out_valid)
  );

  CompatiblePerm_8 m_13 (
    `MAP_PORTS(m_13, _m_12_io_out_QSV, _m_13_io_out_QSV),
    .io_in_valid(_m_12_io_out_valid),
    .io_out_valid(_m_13_io_out_valid)
  );

  CompatiblePerm_9 m_14 (
    `MAP_PORTS(m_14, _m_13_io_out_QSV, _m_14_io_out_QSV),
    .io_in_valid(_m_13_io_out_valid),
    .io_out_valid(_m_14_io_out_valid)
  );

  CompatiblePerm_10 m_15 (
    `MAP_PORTS(m_15, _m_14_io_out_QSV, io_out_QSV),
    .io_in_valid(_m_14_io_out_valid),
    .io_out_valid(io_out_valid)
  );

endmodule
