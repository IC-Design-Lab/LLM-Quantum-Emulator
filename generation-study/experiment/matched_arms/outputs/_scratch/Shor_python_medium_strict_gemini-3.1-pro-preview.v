module Shor (
  input clock,
  input reset,
  input [7:0] io_in_QSV_0_0,
  input [7:0] io_in_QSV_0_1,
  input [7:0] io_in_QSV_1_0,
  input [7:0] io_in_QSV_1_1,
  input [7:0] io_in_QSV_2_0,
  input [7:0] io_in_QSV_2_1,
  input [7:0] io_in_QSV_3_0,
  input [7:0] io_in_QSV_3_1,
  input [7:0] io_in_QSV_4_0,
  input [7:0] io_in_QSV_4_1,
  input [7:0] io_in_QSV_5_0,
  input [7:0] io_in_QSV_5_1,
  input [7:0] io_in_QSV_6_0,
  input [7:0] io_in_QSV_6_1,
  input [7:0] io_in_QSV_7_0,
  input [7:0] io_in_QSV_7_1,
  input [7:0] io_in_QSV_8_0,
  input [7:0] io_in_QSV_8_1,
  input [7:0] io_in_QSV_9_0,
  input [7:0] io_in_QSV_9_1,
  input [7:0] io_in_QSV_10_0,
  input [7:0] io_in_QSV_10_1,
  input [7:0] io_in_QSV_11_0,
  input [7:0] io_in_QSV_11_1,
  input [7:0] io_in_QSV_12_0,
  input [7:0] io_in_QSV_12_1,
  input [7:0] io_in_QSV_13_0,
  input [7:0] io_in_QSV_13_1,
  input [7:0] io_in_QSV_14_0,
  input [7:0] io_in_QSV_14_1,
  input [7:0] io_in_QSV_15_0,
  input [7:0] io_in_QSV_15_1,
  input [7:0] io_in_QSV_16_0,
  input [7:0] io_in_QSV_16_1,
  input [7:0] io_in_QSV_17_0,
  input [7:0] io_in_QSV_17_1,
  input [7:0] io_in_QSV_18_0,
  input [7:0] io_in_QSV_18_1,
  input [7:0] io_in_QSV_19_0,
  input [7:0] io_in_QSV_19_1,
  input [7:0] io_in_QSV_20_0,
  input [7:0] io_in_QSV_20_1,
  input [7:0] io_in_QSV_21_0,
  input [7:0] io_in_QSV_21_1,
  input [7:0] io_in_QSV_22_0,
  input [7:0] io_in_QSV_22_1,
  input [7:0] io_in_QSV_23_0,
  input [7:0] io_in_QSV_23_1,
  input [7:0] io_in_QSV_24_0,
  input [7:0] io_in_QSV_24_1,
  input [7:0] io_in_QSV_25_0,
  input [7:0] io_in_QSV_25_1,
  input [7:0] io_in_QSV_26_0,
  input [7:0] io_in_QSV_26_1,
  input [7:0] io_in_QSV_27_0,
  input [7:0] io_in_QSV_27_1,
  input [7:0] io_in_QSV_28_0,
  input [7:0] io_in_QSV_28_1,
  input [7:0] io_in_QSV_29_0,
  input [7:0] io_in_QSV_29_1,
  input [7:0] io_in_QSV_30_0,
  input [7:0] io_in_QSV_30_1,
  input [7:0] io_in_QSV_31_0,
  input [7:0] io_in_QSV_31_1,
  input io_in_valid,
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

  // Auto-generated wire declarations for intermediate stages
  `define DECLARE_STAGE_WIRES(NAME) \
    wire [7:0] NAME``_io_out_QSV_0_0; wire [7:0] NAME``_io_out_QSV_0_1; \
    wire [7:0] NAME``_io_out_QSV_1_0; wire [7:0] NAME``_io_out_QSV_1_1; \
    wire [7:0] NAME``_io_out_QSV_2_0; wire [7:0] NAME``_io_out_QSV_2_1; \
    wire [7:0] NAME``_io_out_QSV_3_0; wire [7:0] NAME``_io_out_QSV_3_1; \
    wire [7:0] NAME``_io_out_QSV_4_0; wire [7:0] NAME``_io_out_QSV_4_1; \
    wire [7:0] NAME``_io_out_QSV_5_0; wire [7:0] NAME``_io_out_QSV_5_1; \
    wire [7:0] NAME``_io_out_QSV_6_0; wire [7:0] NAME``_io_out_QSV_6_1; \
    wire [7:0] NAME``_io_out_QSV_7_0; wire [7:0] NAME``_io_out_QSV_7_1; \
    wire [7:0] NAME``_io_out_QSV_8_0; wire [7:0] NAME``_io_out_QSV_8_1; \
    wire [7:0] NAME``_io_out_QSV_9_0; wire [7:0] NAME``_io_out_QSV_9_1; \
    wire [7:0] NAME``_io_out_QSV_10_0; wire [7:0] NAME``_io_out_QSV_10_1; \
    wire [7:0] NAME``_io_out_QSV_11_0; wire [7:0] NAME``_io_out_QSV_11_1; \
    wire [7:0] NAME``_io_out_QSV_12_0; wire [7:0] NAME``_io_out_QSV_12_1; \
    wire [7:0] NAME``_io_out_QSV_13_0; wire [7:0] NAME``_io_out_QSV_13_1; \
    wire [7:0] NAME``_io_out_QSV_14_0; wire [7:0] NAME``_io_out_QSV_14_1; \
    wire [7:0] NAME``_io_out_QSV_15_0; wire [7:0] NAME``_io_out_QSV_15_1; \
    wire [7:0] NAME``_io_out_QSV_16_0; wire [7:0] NAME``_io_out_QSV_16_1; \
    wire [7:0] NAME``_io_out_QSV_17_0; wire [7:0] NAME``_io_out_QSV_17_1; \
    wire [7:0] NAME``_io_out_QSV_18_0; wire [7:0] NAME``_io_out_QSV_18_1; \
    wire [7:0] NAME``_io_out_QSV_19_0; wire [7:0] NAME``_io_out_QSV_19_1; \
    wire [7:0] NAME``_io_out_QSV_20_0; wire [7:0] NAME``_io_out_QSV_20_1; \
    wire [7:0] NAME``_io_out_QSV_21_0; wire [7:0] NAME``_io_out_QSV_21_1; \
    wire [7:0] NAME``_io_out_QSV_22_0; wire [7:0] NAME``_io_out_QSV_22_1; \
    wire [7:0] NAME``_io_out_QSV_23_0; wire [7:0] NAME``_io_out_QSV_23_1; \
    wire [7:0] NAME``_io_out_QSV_24_0; wire [7:0] NAME``_io_out_QSV_24_1; \
    wire [7:0] NAME``_io_out_QSV_25_0; wire [7:0] NAME``_io_out_QSV_25_1; \
    wire [7:0] NAME``_io_out_QSV_26_0; wire [7:0] NAME``_io_out_QSV_26_1; \
    wire [7:0] NAME``_io_out_QSV_27_0; wire [7:0] NAME``_io_out_QSV_27_1; \
    wire [7:0] NAME``_io_out_QSV_28_0; wire [7:0] NAME``_io_out_QSV_28_1; \
    wire [7:0] NAME``_io_out_QSV_29_0; wire [7:0] NAME``_io_out_QSV_29_1; \
    wire [7:0] NAME``_io_out_QSV_30_0; wire [7:0] NAME``_io_out_QSV_30_1; \
    wire [7:0] NAME``_io_out_QSV_31_0; wire [7:0] NAME``_io_out_QSV_31_1; \
    wire NAME``_io_out_valid;

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

  `define MAP_PORTS(PREV, NEXT) \
    .clock(clock), \
    .reset(reset), \
    .io_in_QSV_0_0(PREV``_QSV_0_0), .io_in_QSV_0_1(PREV``_QSV_0_1), \
    .io_in_QSV_1_0(PREV``_QSV_1_0), .io_in_QSV_1_1(PREV``_QSV_1_1), \
    .io_in_QSV_2_0(PREV``_QSV_2_0), .io_in_QSV_2_1(PREV``_QSV_2_1), \
    .io_in_QSV_3_0(PREV``_QSV_3_0), .io_in_QSV_3_1(PREV``_QSV_3_1), \
    .io_in_QSV_4_0(PREV``_QSV_4_0), .io_in_QSV_4_1(PREV``_QSV_4_1), \
    .io_in_QSV_5_0(PREV``_QSV_5_0), .io_in_QSV_5_1(PREV``_QSV_5_1), \
    .io_in_QSV_6_0(PREV``_QSV_6_0), .io_in_QSV_6_1(PREV``_QSV_6_1), \
    .io_in_QSV_7_0(PREV``_QSV_7_0), .io_in_QSV_7_1(PREV``_QSV_7_1), \
    .io_in_QSV_8_0(PREV``_QSV_8_0), .io_in_QSV_8_1(PREV``_QSV_8_1), \
    .io_in_QSV_9_0(PREV``_QSV_9_0), .io_in_QSV_9_1(PREV``_QSV_9_1), \
    .io_in_QSV_10_0(PREV``_QSV_10_0), .io_in_QSV_10_1(PREV``_QSV_10_1), \
    .io_in_QSV_11_0(PREV``_QSV_11_0), .io_in_QSV_11_1(PREV``_QSV_11_1), \
    .io_in_QSV_12_0(PREV``_QSV_12_0), .io_in_QSV_12_1(PREV``_QSV_12_1), \
    .io_in_QSV_13_0(PREV``_QSV_13_0), .io_in_QSV_13_1(PREV``_QSV_13_1), \
    .io_in_QSV_14_0(PREV``_QSV_14_0), .io_in_QSV_14_1(PREV``_QSV_14_1), \
    .io_in_QSV_15_0(PREV``_QSV_15_0), .io_in_QSV_15_1(PREV``_QSV_15_1), \
    .io_in_QSV_16_0(PREV``_QSV_16_0), .io_in_QSV_16_1(PREV``_QSV_16_1), \
    .io_in_QSV_17_0(PREV``_QSV_17_0), .io_in_QSV_17_1(PREV``_QSV_17_1), \
    .io_in_QSV_18_0(PREV``_QSV_18_0), .io_in_QSV_18_1(PREV``_QSV_18_1), \
    .io_in_QSV_19_0(PREV``_QSV_19_0), .io_in_QSV_19_1(PREV``_QSV_19_1), \
    .io_in_QSV_20_0(PREV``_QSV_20_0), .io_in_QSV_20_1(PREV``_QSV_20_1), \
    .io_in_QSV_21_0(PREV``_QSV_21_0), .io_in_QSV_21_1(PREV``_QSV_21_1), \
    .io_in_QSV_22_0(PREV``_QSV_22_0), .io_in_QSV_22_1(PREV``_QSV_22_1), \
    .io_in_QSV_23_0(PREV``_QSV_23_0), .io_in_QSV_23_1(PREV``_QSV_23_1), \
    .io_in_QSV_24_0(PREV``_QSV_24_0), .io_in_QSV_24_1(PREV``_QSV_24_1), \
    .io_in_QSV_25_0(PREV``_QSV_25_0), .io_in_QSV_25_1(PREV``_QSV_25_1), \
    .io_in_QSV_26_0(PREV``_QSV_26_0), .io_in_QSV_26_1(PREV``_QSV_26_1), \
    .io_in_QSV_27_0(PREV``_QSV_27_0), .io_in_QSV_27_1(PREV``_QSV_27_1), \
    .io_in_QSV_28_0(PREV``_QSV_28_0), .io_in_QSV_28_1(PREV``_QSV_28_1), \
    .io_in_QSV_29_0(PREV``_QSV_29_0), .io_in_QSV_29_1(PREV``_QSV_29_1), \
    .io_in_QSV_30_0(PREV``_QSV_30_0), .io_in_QSV_30_1(PREV``_QSV_30_1), \
    .io_in_QSV_31_0(PREV``_QSV_31_0), .io_in_QSV_31_1(PREV``_QSV_31_1), \
    .io_in_valid(PREV``_valid), \
    .io_out_QSV_0_0(NEXT``_QSV_0_0), .io_out_QSV_0_1(NEXT``_QSV_0_1), \
    .io_out_QSV_1_0(NEXT``_QSV_1_0), .io_out_QSV_1_1(NEXT``_QSV_1_1), \
    .io_out_QSV_2_0(NEXT``_QSV_2_0), .io_out_QSV_2_1(NEXT``_QSV_2_1), \
    .io_out_QSV_3_0(NEXT``_QSV_3_0), .io_out_QSV_3_1(NEXT``_QSV_3_1), \
    .io_out_QSV_4_0(NEXT``_QSV_4_0), .io_out_QSV_4_1(NEXT``_QSV_4_1), \
    .io_out_QSV_5_0(NEXT``_QSV_5_0), .io_out_QSV_5_1(NEXT``_QSV_5_1), \
    .io_out_QSV_6_0(NEXT``_QSV_6_0), .io_out_QSV_6_1(NEXT``_QSV_6_1), \
    .io_out_QSV_7_0(NEXT``_QSV_7_0), .io_out_QSV_7_1(NEXT``_QSV_7_1), \
    .io_out_QSV_8_0(NEXT``_QSV_8_0), .io_out_QSV_8_1(NEXT``_QSV_8_1), \
    .io_out_QSV_9_0(NEXT``_QSV_9_0), .io_out_QSV_9_1(NEXT``_QSV_9_1), \
    .io_out_QSV_10_0(NEXT``_QSV_10_0), .io_out_QSV_10_1(NEXT``_QSV_10_1), \
    .io_out_QSV_11_0(NEXT``_QSV_11_0), .io_out_QSV_11_1(NEXT``_QSV_11_1), \
    .io_out_QSV_12_0(NEXT``_QSV_12_0), .io_out_QSV_12_1(NEXT``_QSV_12_1), \
    .io_out_QSV_13_0(NEXT``_QSV_13_0), .io_out_QSV_13_1(NEXT``_QSV_13_1), \
    .io_out_QSV_14_0(NEXT``_QSV_14_0), .io_out_QSV_14_1(NEXT``_QSV_14_1), \
    .io_out_QSV_15_0(NEXT``_QSV_15_0), .io_out_QSV_15_1(NEXT``_QSV_15_1), \
    .io_out_QSV_16_0(NEXT``_QSV_16_0), .io_out_QSV_16_1(NEXT``_QSV_16_1), \
    .io_out_QSV_17_0(NEXT``_QSV_17_0), .io_out_QSV_17_1(NEXT``_QSV_17_1), \
    .io_out_QSV_18_0(NEXT``_QSV_18_0), .io_out_QSV_18_1(NEXT``_QSV_18_1), \
    .io_out_QSV_19_0(NEXT``_QSV_19_0), .io_out_QSV_19_1(NEXT``_QSV_19_1), \
    .io_out_QSV_20_0(NEXT``_QSV_20_0), .io_out_QSV_20_1(NEXT``_QSV_20_1), \
    .io_out_QSV_21_0(NEXT``_QSV_21_0), .io_out_QSV_21_1(NEXT``_QSV_21_1), \
    .io_out_QSV_22_0(NEXT``_QSV_22_0), .io_out_QSV_22_1(NEXT``_QSV_22_1), \
    .io_out_QSV_23_0(NEXT``_QSV_23_0), .io_out_QSV_23_1(NEXT``_QSV_23_1), \
    .io_out_QSV_24_0(NEXT``_QSV_24_0), .io_out_QSV_24_1(NEXT``_QSV_24_1), \
    .io_out_QSV_25_0(NEXT``_QSV_25_0), .io_out_QSV_25_1(NEXT``_QSV_25_1), \
    .io_out_QSV_26_0(NEXT``_QSV_26_0), .io_out_QSV_26_1(NEXT``_QSV_26_1), \
    .io_out_QSV_27_0(NEXT``_QSV_27_0), .io_out_QSV_27_1(NEXT``_QSV_27_1), \
    .io_out_QSV_28_0(NEXT``_QSV_28_0), .io_out_QSV_28_1(NEXT``_QSV_28_1), \
    .io_out_QSV_29_0(NEXT``_QSV_29_0), .io_out_QSV_29_1(NEXT``_QSV_29_1), \
    .io_out_QSV_30_0(NEXT``_QSV_30_0), .io_out_QSV_30_1(NEXT``_QSV_30_1), \
    .io_out_QSV_31_0(NEXT``_QSV_31_0), .io_out_QSV_31_1(NEXT``_QSV_31_1), \
    .io_out_valid(NEXT``_valid)

  HGate5QubitVector8bit m (
    `MAP_PORTS(io_in, _m_io_out)
  );

  CompatiblePerm m_1 (
    `MAP_PORTS(_m_io_out, _m_1_io_out)
  );

  CNGate5QubitVector8bit m_2 (
    `MAP_PORTS(_m_1_io_out, _m_2_io_out)
  );

  CompatiblePerm_1 m_3 (
    `MAP_PORTS(_m_2_io_out, _m_3_io_out)
  );

  CompatiblePerm_2 m_4 (
    `MAP_PORTS(_m_3_io_out, _m_4_io_out)
  );

  CNGate5QubitVector8bit m_5 (
    `MAP_PORTS(_m_4_io_out, _m_5_io_out)
  );

  CompatiblePerm_3 m_6 (
    `MAP_PORTS(_m_5_io_out, _m_6_io_out)
  );

  CompatiblePerm_4 m_7 (
    `MAP_PORTS(_m_6_io_out, _m_7_io_out)
  );

  CNGate5QubitVector8bit m_8 (
    `MAP_PORTS(_m_7_io_out, _m_8_io_out)
  );

  CompatiblePerm_5 m_9 (
    `MAP_PORTS(_m_8_io_out, _m_9_io_out)
  );

  CompatiblePerm_6 m_10 (
    `MAP_PORTS(_m_9_io_out, _m_10_io_out)
  );

  CNGate5QubitVector8bit m_11 (
    `MAP_PORTS(_m_10_io_out, _m_11_io_out)
  );

  CompatiblePerm_7 m_12 (
    `MAP_PORTS(_m_11_io_out, io_out)
  );

endmodule
