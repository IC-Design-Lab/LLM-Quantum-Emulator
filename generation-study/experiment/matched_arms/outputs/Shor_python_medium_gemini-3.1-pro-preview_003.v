module Shor(
  input        clock,
  input        reset,
  input  [7:0] io_in_QSV_0_0, io_in_QSV_0_1, io_in_QSV_1_0, io_in_QSV_1_1, io_in_QSV_2_0, io_in_QSV_2_1, io_in_QSV_3_0, io_in_QSV_3_1,
  input  [7:0] io_in_QSV_4_0, io_in_QSV_4_1, io_in_QSV_5_0, io_in_QSV_5_1, io_in_QSV_6_0, io_in_QSV_6_1, io_in_QSV_7_0, io_in_QSV_7_1,
  input  [7:0] io_in_QSV_8_0, io_in_QSV_8_1, io_in_QSV_9_0, io_in_QSV_9_1, io_in_QSV_10_0, io_in_QSV_10_1, io_in_QSV_11_0, io_in_QSV_11_1,
  input  [7:0] io_in_QSV_12_0, io_in_QSV_12_1, io_in_QSV_13_0, io_in_QSV_13_1, io_in_QSV_14_0, io_in_QSV_14_1, io_in_QSV_15_0, io_in_QSV_15_1,
  input  [7:0] io_in_QSV_16_0, io_in_QSV_16_1, io_in_QSV_17_0, io_in_QSV_17_1, io_in_QSV_18_0, io_in_QSV_18_1, io_in_QSV_19_0, io_in_QSV_19_1,
  input  [7:0] io_in_QSV_20_0, io_in_QSV_20_1, io_in_QSV_21_0, io_in_QSV_21_1, io_in_QSV_22_0, io_in_QSV_22_1, io_in_QSV_23_0, io_in_QSV_23_1,
  input  [7:0] io_in_QSV_24_0, io_in_QSV_24_1, io_in_QSV_25_0, io_in_QSV_25_1, io_in_QSV_26_0, io_in_QSV_26_1, io_in_QSV_27_0, io_in_QSV_27_1,
  input  [7:0] io_in_QSV_28_0, io_in_QSV_28_1, io_in_QSV_29_0, io_in_QSV_29_1, io_in_QSV_30_0, io_in_QSV_30_1, io_in_QSV_31_0, io_in_QSV_31_1,
  input        io_in_valid,
  output [7:0] io_out_QSV_0_0, io_out_QSV_0_1, io_out_QSV_1_0, io_out_QSV_1_1, io_out_QSV_2_0, io_out_QSV_2_1, io_out_QSV_3_0, io_out_QSV_3_1,
  output [7:0] io_out_QSV_4_0, io_out_QSV_4_1, io_out_QSV_5_0, io_out_QSV_5_1, io_out_QSV_6_0, io_out_QSV_6_1, io_out_QSV_7_0, io_out_QSV_7_1,
  output [7:0] io_out_QSV_8_0, io_out_QSV_8_1, io_out_QSV_9_0, io_out_QSV_9_1, io_out_QSV_10_0, io_out_QSV_10_1, io_out_QSV_11_0, io_out_QSV_11_1,
  output [7:0] io_out_QSV_12_0, io_out_QSV_12_1, io_out_QSV_13_0, io_out_QSV_13_1, io_out_QSV_14_0, io_out_QSV_14_1, io_out_QSV_15_0, io_out_QSV_15_1,
  output [7:0] io_out_QSV_16_0, io_out_QSV_16_1, io_out_QSV_17_0, io_out_QSV_17_1, io_out_QSV_18_0, io_out_QSV_18_1, io_out_QSV_19_0, io_out_QSV_19_1,
  output [7:0] io_out_QSV_20_0, io_out_QSV_20_1, io_out_QSV_21_0, io_out_QSV_21_1, io_out_QSV_22_0, io_out_QSV_22_1, io_out_QSV_23_0, io_out_QSV_23_1,
  output [7:0] io_out_QSV_24_0, io_out_QSV_24_1, io_out_QSV_25_0, io_out_QSV_25_1, io_out_QSV_26_0, io_out_QSV_26_1, io_out_QSV_27_0, io_out_QSV_27_1,
  output [7:0] io_out_QSV_28_0, io_out_QSV_28_1, io_out_QSV_29_0, io_out_QSV_29_1, io_out_QSV_30_0, io_out_QSV_30_1, io_out_QSV_31_0, io_out_QSV_31_1,
  output       io_out_valid
);

  `define DECLARE_STAGE_WIRES(STG) \
    wire [7:0] ``STG``_io_out_QSV_0_0, ``STG``_io_out_QSV_0_1, ``STG``_io_out_QSV_1_0, ``STG``_io_out_QSV_1_1; \
    wire [7:0] ``STG``_io_out_QSV_2_0, ``STG``_io_out_QSV_2_1, ``STG``_io_out_QSV_3_0, ``STG``_io_out_QSV_3_1; \
    wire [7:0] ``STG``_io_out_QSV_4_0, ``STG``_io_out_QSV_4_1, ``STG``_io_out_QSV_5_0, ``STG``_io_out_QSV_5_1; \
    wire [7:0] ``STG``_io_out_QSV_6_0, ``STG``_io_out_QSV_6_1, ``STG``_io_out_QSV_7_0, ``STG``_io_out_QSV_7_1; \
    wire [7:0] ``STG``_io_out_QSV_8_0, ``STG``_io_out_QSV_8_1, ``STG``_io_out_QSV_9_0, ``STG``_io_out_QSV_9_1; \
    wire [7:0] ``STG``_io_out_QSV_10_0, ``STG``_io_out_QSV_10_1, ``STG``_io_out_QSV_11_0, ``STG``_io_out_QSV_11_1; \
    wire [7:0] ``STG``_io_out_QSV_12_0, ``STG``_io_out_QSV_12_1, ``STG``_io_out_QSV_13_0, ``STG``_io_out_QSV_13_1; \
    wire [7:0] ``STG``_io_out_QSV_14_0, ``STG``_io_out_QSV_14_1, ``STG``_io_out_QSV_15_0, ``STG``_io_out_QSV_15_1; \
    wire [7:0] ``STG``_io_out_QSV_16_0, ``STG``_io_out_QSV_16_1, ``STG``_io_out_QSV_17_0, ``STG``_io_out_QSV_17_1; \
    wire [7:0] ``STG``_io_out_QSV_18_0, ``STG``_io_out_QSV_18_1, ``STG``_io_out_QSV_19_0, ``STG``_io_out_QSV_19_1; \
    wire [7:0] ``STG``_io_out_QSV_20_0, ``STG``_io_out_QSV_20_1, ``STG``_io_out_QSV_21_0, ``STG``_io_out_QSV_21_1; \
    wire [7:0] ``STG``_io_out_QSV_22_0, ``STG``_io_out_QSV_22_1, ``STG``_io_out_QSV_23_0, ``STG``_io_out_QSV_23_1; \
    wire [7:0] ``STG``_io_out_QSV_24_0, ``STG``_io_out_QSV_24_1, ``STG``_io_out_QSV_25_0, ``STG``_io_out_QSV_25_1; \
    wire [7:0] ``STG``_io_out_QSV_26_0, ``STG``_io_out_QSV_26_1, ``STG``_io_out_QSV_27_0, ``STG``_io_out_QSV_27_1; \
    wire [7:0] ``STG``_io_out_QSV_28_0, ``STG``_io_out_QSV_28_1, ``STG``_io_out_QSV_29_0, ``STG``_io_out_QSV_29_1; \
    wire [7:0] ``STG``_io_out_QSV_30_0, ``STG``_io_out_QSV_30_1, ``STG``_io_out_QSV_31_0, ``STG``_io_out_QSV_31_1; \
    wire       ``STG``_io_out_valid;

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

  `define BIND_STAGE_PORTS(IN_PREFIX, OUT_PREFIX) \
    .clock(clock), .reset(reset), \
    .io_in_valid(IN_PREFIX``io_in_valid), \
    .io_in_QSV_0_0(IN_PREFIX``io_in_QSV_0_0), .io_in_QSV_0_1(IN_PREFIX``io_in_QSV_0_1), .io_in_QSV_1_0(IN_PREFIX``io_in_QSV_1_0), .io_in_QSV_1_1(IN_PREFIX``io_in_QSV_1_1), \
    .io_in_QSV_2_0(IN_PREFIX``io_in_QSV_2_0), .io_in_QSV_2_1(IN_PREFIX``io_in_QSV_2_1), .io_in_QSV_3_0(IN_PREFIX``io_in_QSV_3_0), .io_in_QSV_3_1(IN_PREFIX``io_in_QSV_3_1), \
    .io_in_QSV_4_0(IN_PREFIX``io_in_QSV_4_0), .io_in_QSV_4_1(IN_PREFIX``io_in_QSV_4_1), .io_in_QSV_5_0(IN_PREFIX``io_in_QSV_5_0), .io_in_QSV_5_1(IN_PREFIX``io_in_QSV_5_1), \
    .io_in_QSV_6_0(IN_PREFIX``io_in_QSV_6_0), .io_in_QSV_6_1(IN_PREFIX``io_in_QSV_6_1), .io_in_QSV_7_0(IN_PREFIX``io_in_QSV_7_0), .io_in_QSV_7_1(IN_PREFIX``io_in_QSV_7_1), \
    .io_in_QSV_8_0(IN_PREFIX``io_in_QSV_8_0), .io_in_QSV_8_1(IN_PREFIX``io_in_QSV_8_1), .io_in_QSV_9_0(IN_PREFIX``io_in_QSV_9_0), .io_in_QSV_9_1(IN_PREFIX``io_in_QSV_9_1), \
    .io_in_QSV_10_0(IN_PREFIX``io_in_QSV_10_0), .io_in_QSV_10_1(IN_PREFIX``io_in_QSV_10_1), .io_in_QSV_11_0(IN_PREFIX``io_in_QSV_11_0), .io_in_QSV_11_1(IN_PREFIX``io_in_QSV_11_1), \
    .io_in_QSV_12_0(IN_PREFIX``io_in_QSV_12_0), .io_in_QSV_12_1(IN_PREFIX``io_in_QSV_12_1), .io_in_QSV_13_0(IN_PREFIX``io_in_QSV_13_0), .io_in_QSV_13_1(IN_PREFIX``io_in_QSV_13_1), \
    .io_in_QSV_14_0(IN_PREFIX``io_in_QSV_14_0), .io_in_QSV_14_1(IN_PREFIX``io_in_QSV_14_1), .io_in_QSV_15_0(IN_PREFIX``io_in_QSV_15_0), .io_in_QSV_15_1(IN_PREFIX``io_in_QSV_15_1), \
    .io_in_QSV_16_0(IN_PREFIX``io_in_QSV_16_0), .io_in_QSV_16_1(IN_PREFIX``io_in_QSV_16_1), .io_in_QSV_17_0(IN_PREFIX``io_in_QSV_17_0), .io_in_QSV_17_1(IN_PREFIX``io_in_QSV_17_1), \
    .io_in_QSV_18_0(IN_PREFIX``io_in_QSV_18_0), .io_in_QSV_18_1(IN_PREFIX``io_in_QSV_18_1), .io_in_QSV_19_0(IN_PREFIX``io_in_QSV_19_0), .io_in_QSV_19_1(IN_PREFIX``io_in_QSV_19_1), \
    .io_in_QSV_20_0(IN_PREFIX``io_in_QSV_20_0), .io_in_QSV_20_1(IN_PREFIX``io_in_QSV_20_1), .io_in_QSV_21_0(IN_PREFIX``io_in_QSV_21_0), .io_in_QSV_21_1(IN_PREFIX``io_in_QSV_21_1), \
    .io_in_QSV_22_0(IN_PREFIX``io_in_QSV_22_0), .io_in_QSV_22_1(IN_PREFIX``io_in_QSV_22_1), .io_in_QSV_23_0(IN_PREFIX``io_in_QSV_23_0), .io_in_QSV_23_1(IN_PREFIX``io_in_QSV_23_1), \
    .io_in_QSV_24_0(IN_PREFIX``io_in_QSV_24_0), .io_in_QSV_24_1(IN_PREFIX``io_in_QSV_24_1), .io_in_QSV_25_0(IN_PREFIX``io_in_QSV_25_0), .io_in_QSV_25_1(IN_PREFIX``io_in_QSV_25_1), \
    .io_in_QSV_26_0(IN_PREFIX``io_in_QSV_26_0), .io_in_QSV_26_1(IN_PREFIX``io_in_QSV_26_1), .io_in_QSV_27_0(IN_PREFIX``io_in_QSV_27_0), .io_in_QSV_27_1(IN_PREFIX``io_in_QSV_27_1), \
    .io_in_QSV_28_0(IN_PREFIX``io_in_QSV_28_0), .io_in_QSV_28_1(IN_PREFIX``io_in_QSV_28_1), .io_in_QSV_29_0(IN_PREFIX``io_in_QSV_29_0), .io_in_QSV_29_1(IN_PREFIX``io_in_QSV_29_1), \
    .io_in_QSV_30_0(IN_PREFIX``io_in_QSV_30_0), .io_in_QSV_30_1(IN_PREFIX``io_in_QSV_30_1), .io_in_QSV_31_0(IN_PREFIX``io_in_QSV_31_0), .io_in_QSV_31_1(IN_PREFIX``io_in_QSV_31_1), \
    .io_out_valid(OUT_PREFIX``io_out_valid), \
    .io_out_QSV_0_0(OUT_PREFIX``io_out_QSV_0_0), .io_out_QSV_0_1(OUT_PREFIX``io_out_QSV_0_1), .io_out_QSV_1_0(OUT_PREFIX``io_out_QSV_1_0), .io_out_QSV_1_1(OUT_PREFIX``io_out_QSV_1_1), \
    .io_out_QSV_2_0(OUT_PREFIX``io_out_QSV_2_0), .io_out_QSV_2_1(OUT_PREFIX``io_out_QSV_2_1), .io_out_QSV_3_0(OUT_PREFIX``io_out_QSV_3_0), .io_out_QSV_3_1(OUT_PREFIX``io_out_QSV_3_1), \
    .io_out_QSV_4_0(OUT_PREFIX``io_out_QSV_4_0), .io_out_QSV_4_1(OUT_PREFIX``io_out_QSV_4_1), .io_out_QSV_5_0(OUT_PREFIX``io_out_QSV_5_0), .io_out_QSV_5_1(OUT_PREFIX``io_out_QSV_5_1), \
    .io_out_QSV_6_0(OUT_PREFIX``io_out_QSV_6_0), .io_out_QSV_6_1(OUT_PREFIX``io_out_QSV_6_1), .io_out_QSV_7_0(OUT_PREFIX``io_out_QSV_7_0), .io_out_QSV_7_1(OUT_PREFIX``io_out_QSV_7_1), \
    .io_out_QSV_8_0(OUT_PREFIX``io_out_QSV_8_0), .io_out_QSV_8_1(OUT_PREFIX``io_out_QSV_8_1), .io_out_QSV_9_0(OUT_PREFIX``io_out_QSV_9_0), .io_out_QSV_9_1(OUT_PREFIX``io_out_QSV_9_1), \
    .io_out_QSV_10_0(OUT_PREFIX``io_out_QSV_10_0), .io_out_QSV_10_1(OUT_PREFIX``io_out_QSV_10_1), .io_out_QSV_11_0(OUT_PREFIX``io_out_QSV_11_0), .io_out_QSV_11_1(OUT_PREFIX``io_out_QSV_11_1), \
    .io_out_QSV_12_0(OUT_PREFIX``io_out_QSV_12_0), .io_out_QSV_12_1(OUT_PREFIX``io_out_QSV_12_1), .io_out_QSV_13_0(OUT_PREFIX``io_out_QSV_13_0), .io_out_QSV_13_1(OUT_PREFIX``io_out_QSV_13_1), \
    .io_out_QSV_14_0(OUT_PREFIX``io_out_QSV_14_0), .io_out_QSV_14_1(OUT_PREFIX``io_out_QSV_14_1), .io_out_QSV_15_0(OUT_PREFIX``io_out_QSV_15_0), .io_out_QSV_15_1(OUT_PREFIX``io_out_QSV_15_1), \
    .io_out_QSV_16_0(OUT_PREFIX``io_out_QSV_16_0), .io_out_QSV_16_1(OUT_PREFIX``io_out_QSV_16_1), .io_out_QSV_17_0(OUT_PREFIX``io_out_QSV_17_0), .io_out_QSV_17_1(OUT_PREFIX``io_out_QSV_17_1), \
    .io_out_QSV_18_0(OUT_PREFIX``io_out_QSV_18_0), .io_out_QSV_18_1(OUT_PREFIX``io_out_QSV_18_1), .io_out_QSV_19_0(OUT_PREFIX``io_out_QSV_19_0), .io_out_QSV_19_1(OUT_PREFIX``io_out_QSV_19_1), \
    .io_out_QSV_20_0(OUT_PREFIX``io_out_QSV_20_0), .io_out_QSV_20_1(OUT_PREFIX``io_out_QSV_20_1), .io_out_QSV_21_0(OUT_PREFIX``io_out_QSV_21_0), .io_out_QSV_21_1(OUT_PREFIX``io_out_QSV_21_1), \
    .io_out_QSV_22_0(OUT_PREFIX``io_out_QSV_22_0), .io_out_QSV_22_1(OUT_PREFIX``io_out_QSV_22_1), .io_out_QSV_23_0(OUT_PREFIX``io_out_QSV_23_0), .io_out_QSV_23_1(OUT_PREFIX``io_out_QSV_23_1), \
    .io_out_QSV_24_0(OUT_PREFIX``io_out_QSV_24_0), .io_out_QSV_24_1(OUT_PREFIX``io_out_QSV_24_1), .io_out_QSV_25_0(OUT_PREFIX``io_out_QSV_25_0), .io_out_QSV_25_1(OUT_PREFIX``io_out_QSV_25_1), \
    .io_out_QSV_26_0(OUT_PREFIX``io_out_QSV_26_0), .io_out_QSV_26_1(OUT_PREFIX``io_out_QSV_26_1), .io_out_QSV_27_0(OUT_PREFIX``io_out_QSV_27_0), .io_out_QSV_27_1(OUT_PREFIX``io_out_QSV_27_1), \
    .io_out_QSV_28_0(OUT_PREFIX``io_out_QSV_28_0), .io_out_QSV_28_1(OUT_PREFIX``io_out_QSV_28_1), .io_out_QSV_29_0(OUT_PREFIX``io_out_QSV_29_0), .io_out_QSV_29_1(OUT_PREFIX``io_out_QSV_29_1), \
    .io_out_QSV_30_0(OUT_PREFIX``io_out_QSV_30_0), .io_out_QSV_30_1(OUT_PREFIX``io_out_QSV_30_1), .io_out_QSV_31_0(OUT_PREFIX``io_out_QSV_31_0), .io_out_QSV_31_1(OUT_PREFIX``io_out_QSV_31_1)

  HGate5QubitVector8bit m (
    `BIND_STAGE_PORTS(io_in_QSV_, _m_io_out_QSV_)
  );

  CompatiblePerm m_1 (
    `BIND_STAGE_PORTS(_m_io_out_QSV_, _m_1_io_out_QSV_)
  );

  CNGate5QubitVector8bit m_2 (
    `BIND_STAGE_PORTS(_m_1_io_out_QSV_, _m_2_io_out_QSV_)
  );

  CompatiblePerm_1 m_3 (
    `BIND_STAGE_PORTS(_m_2_io_out_QSV_, _m_3_io_out_QSV_)
  );

  CompatiblePerm_2 m_4 (
    `BIND_STAGE_PORTS(_m_3_io_out_QSV_, _m_4_io_out_QSV_)
  );

  CNGate5QubitVector8bit m_5 (
    `BIND_STAGE_PORTS(_m_4_io_out_QSV_, _m_5_io_out_QSV_)
  );

  CompatiblePerm_3 m_6 (
    `BIND_STAGE_PORTS(_m_5_io_out_QSV_, _m_6_io_out_QSV_)
  );

  CompatiblePerm_4 m_7 (
    `BIND_STAGE_PORTS(_m_6_io_out_QSV_, _m_7_io_out_QSV_)
  );

  CNGate5QubitVector8bit m_8 (
    `BIND_STAGE_PORTS(_m_7_io_out_QSV_, _m_8_io_out_QSV_)
  );

  CompatiblePerm_5 m_9 (
    `BIND_STAGE_PORTS(_m_8_io_out_QSV_, _m_9_io_out_QSV_)
  );

  CompatiblePerm_6 m_10 (
    `BIND_STAGE_PORTS(_m_9_io_out_QSV_, _m_10_io_out_QSV_)
  );

  CNGate5QubitVector8bit m_11 (
    `BIND_STAGE_PORTS(_m_10_io_out_QSV_, _m_11_io_out_QSV_)
  );

  CompatiblePerm_7 m_12 (
    `BIND_STAGE_PORTS(_m_11_io_out_QSV_, _m_12_io_out_QSV_)
  );

  CompatiblePerm_8 m_13 (
    `BIND_STAGE_PORTS(_m_12_io_out_QSV_, _m_13_io_out_QSV_)
  );

  CompatiblePerm_9 m_14 (
    `BIND_STAGE_PORTS(_m_13_io_out_QSV_, _m_14_io_out_QSV_)
  );

  CompatiblePerm_10 m_15 (
    `BIND_STAGE_PORTS(_m_14_io_out_QSV_, io_out_QSV_)
  );

  `undef DECLARE_STAGE_WIRES
  `undef BIND_STAGE_PORTS

endmodule
