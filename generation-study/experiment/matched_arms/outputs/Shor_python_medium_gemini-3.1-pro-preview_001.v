module Shor (
  input  logic       clock,
  input  logic       reset,
  input  logic [7:0] io_in_QSV_0_0,
  input  logic [7:0] io_in_QSV_0_1,
  input  logic [7:0] io_in_QSV_1_0,
  input  logic [7:0] io_in_QSV_1_1,
  input  logic [7:0] io_in_QSV_2_0,
  input  logic [7:0] io_in_QSV_2_1,
  input  logic [7:0] io_in_QSV_3_0,
  input  logic [7:0] io_in_QSV_3_1,
  input  logic [7:0] io_in_QSV_4_0,
  input  logic [7:0] io_in_QSV_4_1,
  input  logic [7:0] io_in_QSV_5_0,
  input  logic [7:0] io_in_QSV_5_1,
  input  logic [7:0] io_in_QSV_6_0,
  input  logic [7:0] io_in_QSV_6_1,
  input  logic [7:0] io_in_QSV_7_0,
  input  logic [7:0] io_in_QSV_7_1,
  input  logic [7:0] io_in_QSV_8_0,
  input  logic [7:0] io_in_QSV_8_1,
  input  logic [7:0] io_in_QSV_9_0,
  input  logic [7:0] io_in_QSV_9_1,
  input  logic [7:0] io_in_QSV_10_0,
  input  logic [7:0] io_in_QSV_10_1,
  input  logic [7:0] io_in_QSV_11_0,
  input  logic [7:0] io_in_QSV_11_1,
  input  logic [7:0] io_in_QSV_12_0,
  input  logic [7:0] io_in_QSV_12_1,
  input  logic [7:0] io_in_QSV_13_0,
  input  logic [7:0] io_in_QSV_13_1,
  input  logic [7:0] io_in_QSV_14_0,
  input  logic [7:0] io_in_QSV_14_1,
  input  logic [7:0] io_in_QSV_15_0,
  input  logic [7:0] io_in_QSV_15_1,
  input  logic [7:0] io_in_QSV_16_0,
  input  logic [7:0] io_in_QSV_16_1,
  input  logic [7:0] io_in_QSV_17_0,
  input  logic [7:0] io_in_QSV_17_1,
  input  logic [7:0] io_in_QSV_18_0,
  input  logic [7:0] io_in_QSV_18_1,
  input  logic [7:0] io_in_QSV_19_0,
  input  logic [7:0] io_in_QSV_19_1,
  input  logic [7:0] io_in_QSV_20_0,
  input  logic [7:0] io_in_QSV_20_1,
  input  logic [7:0] io_in_QSV_21_0,
  input  logic [7:0] io_in_QSV_21_1,
  input  logic [7:0] io_in_QSV_22_0,
  input  logic [7:0] io_in_QSV_22_1,
  input  logic [7:0] io_in_QSV_23_0,
  input  logic [7:0] io_in_QSV_23_1,
  input  logic [7:0] io_in_QSV_24_0,
  input  logic [7:0] io_in_QSV_24_1,
  input  logic [7:0] io_in_QSV_25_0,
  input  logic [7:0] io_in_QSV_25_1,
  input  logic [7:0] io_in_QSV_26_0,
  input  logic [7:0] io_in_QSV_26_1,
  input  logic [7:0] io_in_QSV_27_0,
  input  logic [7:0] io_in_QSV_27_1,
  input  logic [7:0] io_in_QSV_28_0,
  input  logic [7:0] io_in_QSV_28_1,
  input  logic [7:0] io_in_QSV_29_0,
  input  logic [7:0] io_in_QSV_29_1,
  input  logic [7:0] io_in_QSV_30_0,
  input  logic [7:0] io_in_QSV_30_1,
  input  logic [7:0] io_in_QSV_31_0,
  input  logic [7:0] io_in_QSV_31_1,
  input  logic       io_in_valid,

  output logic [7:0] io_out_QSV_0_0,
  output logic [7:0] io_out_QSV_0_1,
  output logic [7:0] io_out_QSV_1_0,
  output logic [7:0] io_out_QSV_1_1,
  output logic [7:0] io_out_QSV_2_0,
  output logic [7:0] io_out_QSV_2_1,
  output logic [7:0] io_out_QSV_3_0,
  output logic [7:0] io_out_QSV_3_1,
  output logic [7:0] io_out_QSV_4_0,
  output logic [7:0] io_out_QSV_4_1,
  output logic [7:0] io_out_QSV_5_0,
  output logic [7:0] io_out_QSV_5_1,
  output logic [7:0] io_out_QSV_6_0,
  output logic [7:0] io_out_QSV_6_1,
  output logic [7:0] io_out_QSV_7_0,
  output logic [7:0] io_out_QSV_7_1,
  output logic [7:0] io_out_QSV_8_0,
  output logic [7:0] io_out_QSV_8_1,
  output logic [7:0] io_out_QSV_9_0,
  output logic [7:0] io_out_QSV_9_1,
  output logic [7:0] io_out_QSV_10_0,
  output logic [7:0] io_out_QSV_10_1,
  output logic [7:0] io_out_QSV_11_0,
  output logic [7:0] io_out_QSV_11_1,
  output logic [7:0] io_out_QSV_12_0,
  output logic [7:0] io_out_QSV_12_1,
  output logic [7:0] io_out_QSV_13_0,
  output logic [7:0] io_out_QSV_13_1,
  output logic [7:0] io_out_QSV_14_0,
  output logic [7:0] io_out_QSV_14_1,
  output logic [7:0] io_out_QSV_15_0,
  output logic [7:0] io_out_QSV_15_1,
  output logic [7:0] io_out_QSV_16_0,
  output logic [7:0] io_out_QSV_16_1,
  output logic [7:0] io_out_QSV_17_0,
  output logic [7:0] io_out_QSV_17_1,
  output logic [7:0] io_out_QSV_18_0,
  output logic [7:0] io_out_QSV_18_1,
  output logic [7:0] io_out_QSV_19_0,
  output logic [7:0] io_out_QSV_19_1,
  output logic [7:0] io_out_QSV_20_0,
  output logic [7:0] io_out_QSV_20_1,
  output logic [7:0] io_out_QSV_21_0,
  output logic [7:0] io_out_QSV_21_1,
  output logic [7:0] io_out_QSV_22_0,
  output logic [7:0] io_out_QSV_22_1,
  output logic [7:0] io_out_QSV_23_0,
  output logic [7:0] io_out_QSV_23_1,
  output logic [7:0] io_out_QSV_24_0,
  output logic [7:0] io_out_QSV_24_1,
  output logic [7:0] io_out_QSV_25_0,
  output logic [7:0] io_out_QSV_25_1,
  output logic [7:0] io_out_QSV_26_0,
  output logic [7:0] io_out_QSV_26_1,
  output logic [7:0] io_out_QSV_27_0,
  output logic [7:0] io_out_QSV_27_1,
  output logic [7:0] io_out_QSV_28_0,
  output logic [7:0] io_out_QSV_28_1,
  output logic [7:0] io_out_QSV_29_0,
  output logic [7:0] io_out_QSV_29_1,
  output logic [7:0] io_out_QSV_30_0,
  output logic [7:0] io_out_QSV_30_1,
  output logic [7:0] io_out_QSV_31_0,
  output logic [7:0] io_out_QSV_31_1,
  output logic       io_out_valid
);

  `define DECLARE_STAGE_WIRES(STAGE) \
    logic [7:0] STAGE``_io_out_QSV_0_0, STAGE``_io_out_QSV_0_1, STAGE``_io_out_QSV_1_0, STAGE``_io_out_QSV_1_1; \
    logic [7:0] STAGE``_io_out_QSV_2_0, STAGE``_io_out_QSV_2_1, STAGE``_io_out_QSV_3_0, STAGE``_io_out_QSV_3_1; \
    logic [7:0] STAGE``_io_out_QSV_4_0, STAGE``_io_out_QSV_4_1, STAGE``_io_out_QSV_5_0, STAGE``_io_out_QSV_5_1; \
    logic [7:0] STAGE``_io_out_QSV_6_0, STAGE``_io_out_QSV_6_1, STAGE``_io_out_QSV_7_0, STAGE``_io_out_QSV_7_1; \
    logic [7:0] STAGE``_io_out_QSV_8_0, STAGE``_io_out_QSV_8_1, STAGE``_io_out_QSV_9_0, STAGE``_io_out_QSV_9_1; \
    logic [7:0] STAGE``_io_out_QSV_10_0, STAGE``_io_out_QSV_10_1, STAGE``_io_out_QSV_11_0, STAGE``_io_out_QSV_11_1; \
    logic [7:0] STAGE``_io_out_QSV_12_0, STAGE``_io_out_QSV_12_1, STAGE``_io_out_QSV_13_0, STAGE``_io_out_QSV_13_1; \
    logic [7:0] STAGE``_io_out_QSV_14_0, STAGE``_io_out_QSV_14_1, STAGE``_io_out_QSV_15_0, STAGE``_io_out_QSV_15_1; \
    logic [7:0] STAGE``_io_out_QSV_16_0, STAGE``_io_out_QSV_16_1, STAGE``_io_out_QSV_17_0, STAGE``_io_out_QSV_17_1; \
    logic [7:0] STAGE``_io_out_QSV_18_0, STAGE``_io_out_QSV_18_1, STAGE``_io_out_QSV_19_0, STAGE``_io_out_QSV_19_1; \
    logic [7:0] STAGE``_io_out_QSV_20_0, STAGE``_io_out_QSV_20_1, STAGE``_io_out_QSV_21_0, STAGE``_io_out_QSV_21_1; \
    logic [7:0] STAGE``_io_out_QSV_22_0, STAGE``_io_out_QSV_22_1, STAGE``_io_out_QSV_23_0, STAGE``_io_out_QSV_23_1; \
    logic [7:0] STAGE``_io_out_QSV_24_0, STAGE``_io_out_QSV_24_1, STAGE``_io_out_QSV_25_0, STAGE``_io_out_QSV_25_1; \
    logic [7:0] STAGE``_io_out_QSV_26_0, STAGE``_io_out_QSV_26_1, STAGE``_io_out_QSV_27_0, STAGE``_io_out_QSV_27_1; \
    logic [7:0] STAGE``_io_out_QSV_28_0, STAGE``_io_out_QSV_28_1, STAGE``_io_out_QSV_29_0, STAGE``_io_out_QSV_29_1; \
    logic [7:0] STAGE``_io_out_QSV_30_0, STAGE``_io_out_QSV_30_1, STAGE``_io_out_QSV_31_0, STAGE``_io_out_QSV_31_1; \
    logic       STAGE``_io_out_valid;

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

  `define CONNECT_STAGE(INST, MOD, IN_STAGE, OUT_STAGE) \
    MOD INST ( \
      .clock(clock), \
      .reset(reset), \
      .io_in_QSV_0_0(IN_STAGE``_QSV_0_0), .io_in_QSV_0_1(IN_STAGE``_QSV_0_1), .io_in_QSV_1_0(IN_STAGE``_QSV_1_0), .io_in_QSV_1_1(IN_STAGE``_QSV_1_1), \
      .io_in_QSV_2_0(IN_STAGE``_QSV_2_0), .io_in_QSV_2_1(IN_STAGE``_QSV_2_1), .io_in_QSV_3_0(IN_STAGE``_QSV_3_0), .io_in_QSV_3_1(IN_STAGE``_QSV_3_1), \
      .io_in_QSV_4_0(IN_STAGE``_QSV_4_0), .io_in_QSV_4_1(IN_STAGE``_QSV_4_1), .io_in_QSV_5_0(IN_STAGE``_QSV_5_0), .io_in_QSV_5_1(IN_STAGE``_QSV_5_1), \
      .io_in_QSV_6_0(IN_STAGE``_QSV_6_0), .io_in_QSV_6_1(IN_STAGE``_QSV_6_1), .io_in_QSV_7_0(IN_STAGE``_QSV_7_0), .io_in_QSV_7_1(IN_STAGE``_QSV_7_1), \
      .io_in_QSV_8_0(IN_STAGE``_QSV_8_0), .io_in_QSV_8_1(IN_STAGE``_QSV_8_1), .io_in_QSV_9_0(IN_STAGE``_QSV_9_0), .io_in_QSV_9_1(IN_STAGE``_QSV_9_1), \
      .io_in_QSV_10_0(IN_STAGE``_QSV_10_0), .io_in_QSV_10_1(IN_STAGE``_QSV_10_1), .io_in_QSV_11_0(IN_STAGE``_QSV_11_0), .io_in_QSV_11_1(IN_STAGE``_QSV_11_1), \
      .io_in_QSV_12_0(IN_STAGE``_QSV_12_0), .io_in_QSV_12_1(IN_STAGE``_QSV_12_1), .io_in_QSV_13_0(IN_STAGE``_QSV_13_0), .io_in_QSV_13_1(IN_STAGE``_QSV_13_1), \
      .io_in_QSV_14_0(IN_STAGE``_QSV_14_0), .io_in_QSV_14_1(IN_STAGE``_QSV_14_1), .io_in_QSV_15_0(IN_STAGE``_QSV_15_0), .io_in_QSV_15_1(IN_STAGE``_QSV_15_1), \
      .io_in_QSV_16_0(IN_STAGE``_QSV_16_0), .io_in_QSV_16_1(IN_STAGE``_QSV_16_1), .io_in_QSV_17_0(IN_STAGE``_QSV_17_0), .io_in_QSV_17_1(IN_STAGE``_QSV_17_1), \
      .io_in_QSV_18_0(IN_STAGE``_QSV_18_0), .io_in_QSV_18_1(IN_STAGE``_QSV_18_1), .io_in_QSV_19_0(IN_STAGE``_QSV_19_0), .io_in_QSV_19_1(IN_STAGE``_QSV_19_1), \
      .io_in_QSV_20_0(IN_STAGE``_QSV_20_0), .io_in_QSV_20_1(IN_STAGE``_QSV_20_1), .io_in_QSV_21_0(IN_STAGE``_QSV_21_0), .io_in_QSV_21_1(IN_STAGE``_QSV_21_1), \
      .io_in_QSV_22_0(IN_STAGE``_QSV_22_0), .io_in_QSV_22_1(IN_STAGE``_QSV_22_1), .io_in_QSV_23_0(IN_STAGE``_QSV_23_0), .io_in_QSV_23_1(IN_STAGE``_QSV_23_1), \
      .io_in_QSV_24_0(IN_STAGE``_QSV_24_0), .io_in_QSV_24_1(IN_STAGE``_QSV_24_1), .io_in_QSV_25_0(IN_STAGE``_QSV_25_0), .io_in_QSV_25_1(IN_STAGE``_QSV_25_1), \
      .io_in_QSV_26_0(IN_STAGE``_QSV_26_0), .io_in_QSV_26_1(IN_STAGE``_QSV_26_1), .io_in_QSV_27_0(IN_STAGE``_QSV_27_0), .io_in_QSV_27_1(IN_STAGE``_QSV_27_1), \
      .io_in_QSV_28_0(IN_STAGE``_QSV_28_0), .io_in_QSV_28_1(IN_STAGE``_QSV_28_1), .io_in_QSV_29_0(IN_STAGE``_QSV_29_0), .io_in_QSV_29_1(IN_STAGE``_QSV_29_1), \
      .io_in_QSV_30_0(IN_STAGE``_QSV_30_0), .io_in_QSV_30_1(IN_STAGE``_QSV_30_1), .io_in_QSV_31_0(IN_STAGE``_QSV_31_0), .io_in_QSV_31_1(IN_STAGE``_QSV_31_1), \
      .io_in_valid(IN_STAGE``_valid), \
      .io_out_QSV_0_0(OUT_STAGE``_QSV_0_0), .io_out_QSV_0_1(OUT_STAGE``_QSV_0_1), .io_out_QSV_1_0(OUT_STAGE``_QSV_1_0), .io_out_QSV_1_1(OUT_STAGE``_QSV_1_1), \
      .io_out_QSV_2_0(OUT_STAGE``_QSV_2_0), .io_out_QSV_2_1(OUT_STAGE``_QSV_2_1), .io_out_QSV_3_0(OUT_STAGE``_QSV_3_0), .io_out_QSV_3_1(OUT_STAGE``_QSV_3_1), \
      .io_out_QSV_4_0(OUT_STAGE``_QSV_4_0), .io_out_QSV_4_1(OUT_STAGE``_QSV_4_1), .io_out_QSV_5_0(OUT_STAGE``_QSV_5_0), .io_out_QSV_5_1(OUT_STAGE``_QSV_5_1), \
      .io_out_QSV_6_0(OUT_STAGE``_QSV_6_0), .io_out_QSV_6_1(OUT_STAGE``_QSV_6_1), .io_out_QSV_7_0(OUT_STAGE``_QSV_7_0), .io_out_QSV_7_1(OUT_STAGE``_QSV_7_1), \
      .io_out_QSV_8_0(OUT_STAGE``_QSV_8_0), .io_out_QSV_8_1(OUT_STAGE``_QSV_8_1), .io_out_QSV_9_0(OUT_STAGE``_QSV_9_0), .io_out_QSV_9_1(OUT_STAGE``_QSV_9_1), \
      .io_out_QSV_10_0(OUT_STAGE``_QSV_10_0), .io_out_QSV_10_1(OUT_STAGE``_QSV_10_1), .io_out_QSV_11_0(OUT_STAGE``_QSV_11_0), .io_out_QSV_11_1(OUT_STAGE``_QSV_11_1), \
      .io_out_QSV_12_0(OUT_STAGE``_QSV_12_0), .io_out_QSV_12_1(OUT_STAGE``_QSV_12_1), .io_out_QSV_13_0(OUT_STAGE``_QSV_13_0), .io_out_QSV_13_1(OUT_STAGE``_QSV_13_1), \
      .io_out_QSV_14_0(OUT_STAGE``_QSV_14_0), .io_out_QSV_14_1(OUT_STAGE``_QSV_14_1), .io_out_QSV_15_0(OUT_STAGE``_QSV_15_0), .io_out_QSV_15_1(OUT_STAGE``_QSV_15_1), \
      .io_out_QSV_16_0(OUT_STAGE``_QSV_16_0), .io_out_QSV_16_1(OUT_STAGE``_QSV_16_1), .io_out_QSV_17_0(OUT_STAGE``_QSV_17_0), .io_out_QSV_17_1(OUT_STAGE``_QSV_17_1), \
      .io_out_QSV_18_0(OUT_STAGE``_QSV_18_0), .io_out_QSV_18_1(OUT_STAGE``_QSV_18_1), .io_out_QSV_19_0(OUT_STAGE``_QSV_19_0), .io_out_QSV_19_1(OUT_STAGE``_QSV_19_1), \
      .io_out_QSV_20_0(OUT_STAGE``_QSV_20_0), .io_out_QSV_20_1(OUT_STAGE``_QSV_20_1), .io_out_QSV_21_0(OUT_STAGE``_QSV_21_0), .io_out_QSV_21_1(OUT_STAGE``_QSV_21_1), \
      .io_out_QSV_22_0(OUT_STAGE``_QSV_22_0), .io_out_QSV_22_1(OUT_STAGE``_QSV_22_1), .io_out_QSV_23_0(OUT_STAGE``_QSV_23_0), .io_out_QSV_23_1(OUT_STAGE``_QSV_23_1), \
      .io_out_QSV_24_0(OUT_STAGE``_QSV_24_0), .io_out_QSV_24_1(OUT_STAGE``_QSV_24_1), .io_out_QSV_25_0(OUT_STAGE``_QSV_25_0), .io_out_QSV_25_1(OUT_STAGE``_QSV_25_1), \
      .io_out_QSV_26_0(OUT_STAGE``_QSV_26_0), .io_out_QSV_26_1(OUT_STAGE``_QSV_26_1), .io_out_QSV_27_0(OUT_STAGE``_QSV_27_0), .io_out_QSV_27_1(OUT_STAGE``_QSV_27_1), \
      .io_out_QSV_28_0(OUT_STAGE``_QSV_28_0), .io_out_QSV_28_1(OUT_STAGE``_QSV_28_1), .io_out_QSV_29_0(OUT_STAGE``_QSV_29_0), .io_out_QSV_29_1(OUT_STAGE``_QSV_29_1), \
      .io_out_QSV_30_0(OUT_STAGE``_QSV_30_0), .io_out_QSV_30_1(OUT_STAGE``_QSV_30_1), .io_out_QSV_31_0(OUT_STAGE``_QSV_31_0), .io_out_QSV_31_1(OUT_STAGE``_QSV_31_1), \
      .io_out_valid(OUT_STAGE``_valid) \
    );

  `CONNECT_STAGE(m,    HGate5QubitVector8bit,  io_in,     _m_io_out)
  `CONNECT_STAGE(m_1,  CompatiblePerm,         _m_io_out, _m_1_io_out)
  `CONNECT_STAGE(m_2,  CNGate5QubitVector8bit, _m_1_io_out, _m_2_io_out)
  `CONNECT_STAGE(m_3,  CompatiblePerm_1,       _m_2_io_out, _m_3_io_out)
  `CONNECT_STAGE(m_4,  CompatiblePerm_2,       _m_3_io_out, _m_4_io_out)
  `CONNECT_STAGE(m_5,  CNGate5QubitVector8bit, _m_4_io_out, _m_5_io_out)
  `CONNECT_STAGE(m_6,  CompatiblePerm_3,       _m_5_io_out, _m_6_io_out)
  `CONNECT_STAGE(m_7,  CompatiblePerm_4,       _m_6_io_out, _m_7_io_out)
  `CONNECT_STAGE(m_8,  CNGate5QubitVector8bit, _m_7_io_out, _m_8_io_out)
  `CONNECT_STAGE(m_9,  CompatiblePerm_5,       _m_8_io_out, _m_9_io_out)
  `CONNECT_STAGE(m_10, CompatiblePerm_6,       _m_9_io_out, _m_10_io_out)
  `CONNECT_STAGE(m_11, CNGate5QubitVector8bit, _m_10_io_out, _m_11_io_out)
  `CONNECT_STAGE(m_12, CompatiblePerm_7,       _m_11_io_out, _m_12_io_out)
  `CONNECT_STAGE(m_13, CompatiblePerm_8,       _m_12_io_out, _m_13_io_out)
  `CONNECT_STAGE(m_14, CompatiblePerm_9,       _m_13_io_out, _m_14_io_out)
  `CONNECT_STAGE(m_15, CompatiblePerm_10,      _m_14_io_out, io_out)

  `undef DECLARE_STAGE_WIRES
  `undef CONNECT_STAGE

endmodule
