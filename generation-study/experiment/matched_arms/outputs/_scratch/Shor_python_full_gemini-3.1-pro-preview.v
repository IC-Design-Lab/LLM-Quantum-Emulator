module Shor (
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

  // Auto-generated wire declarations for inter-stage connections
  `define DECLARE_STAGE_WIRES(STG) \
    wire [7:0] STG``_io_out_QSV_0_0, STG``_io_out_QSV_0_1, STG``_io_out_QSV_1_0, STG``_io_out_QSV_1_1, \
               STG``_io_out_QSV_2_0, STG``_io_out_QSV_2_1, STG``_io_out_QSV_3_0, STG``_io_out_QSV_3_1, \
               STG``_io_out_QSV_4_0, STG``_io_out_QSV_4_1, STG``_io_out_QSV_5_0, STG``_io_out_QSV_5_1, \
               STG``_io_out_QSV_6_0, STG``_io_out_QSV_6_1, STG``_io_out_QSV_7_0, STG``_io_out_QSV_7_1, \
               STG``_io_out_QSV_8_0, STG``_io_out_QSV_8_1, STG``_io_out_QSV_9_0, STG``_io_out_QSV_9_1, \
               STG``_io_out_QSV_10_0, STG``_io_out_QSV_10_1, STG``_io_out_QSV_11_0, STG``_io_out_QSV_11_1, \
               STG``_io_out_QSV_12_0, STG``_io_out_QSV_12_1, STG``_io_out_QSV_13_0, STG``_io_out_QSV_13_1, \
               STG``_io_out_QSV_14_0, STG``_io_out_QSV_14_1, STG``_io_out_QSV_15_0, STG``_io_out_QSV_15_1, \
               STG``_io_out_QSV_16_0, STG``_io_out_QSV_16_1, STG``_io_out_QSV_17_0, STG``_io_out_QSV_17_1, \
               STG``_io_out_QSV_18_0, STG``_io_out_QSV_18_1, STG``_io_out_QSV_19_0, STG``_io_out_QSV_19_1, \
               STG``_io_out_QSV_20_0, STG``_io_out_QSV_20_1, STG``_io_out_QSV_21_0, STG``_io_out_QSV_21_1, \
               STG``_io_out_QSV_22_0, STG``_io_out_QSV_22_1, STG``_io_out_QSV_23_0, STG``_io_out_QSV_23_1, \
               STG``_io_out_QSV_24_0, STG``_io_out_QSV_24_1, STG``_io_out_QSV_25_0, STG``_io_out_QSV_25_1, \
               STG``_io_out_QSV_26_0, STG``_io_out_QSV_26_1, STG``_io_out_QSV_27_0, STG``_io_out_QSV_27_1, \
               STG``_io_out_QSV_28_0, STG``_io_out_QSV_28_1, STG``_io_out_QSV_29_0, STG``_io_out_QSV_29_1, \
               STG``_io_out_QSV_30_0, STG``_io_out_QSV_30_1, STG``_io_out_QSV_31_0, STG``_io_out_QSV_31_1; \
    wire       STG``_io_out_valid;

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

  // Stage 0: HGate5QubitVector8bit (m)
  HGate5QubitVector8bit m (
    .clock(clock),
    .reset(reset),
    .io_in_valid(io_in_valid),
    .io_out_valid(_m_io_out_valid),
    .io_in_QSV_0_0(io_in_QSV_0_0), .io_out_QSV_0_0(_m_io_out_QSV_0_0),
    .io_in_QSV_0_1(io_in_QSV_0_1), .io_out_QSV_0_1(_m_io_out_QSV_0_1),
    .io_in_QSV_1_0(io_in_QSV_1_0), .io_out_QSV_1_0(_m_io_out_QSV_1_0),
    .io_in_QSV_1_1(io_in_QSV_1_1), .io_out_QSV_1_1(_m_io_out_QSV_1_1),
    .io_in_QSV_2_0(io_in_QSV_2_0), .io_out_QSV_2_0(_m_io_out_QSV_2_0),
    .io_in_QSV_2_1(io_in_QSV_2_1), .io_out_QSV_2_1(_m_io_out_QSV_2_1),
    .io_in_QSV_3_0(io_in_QSV_3_0), .io_out_QSV_3_0(_m_io_out_QSV_3_0),
    .io_in_QSV_3_1(io_in_QSV_3_1), .io_out_QSV_3_1(_m_io_out_QSV_3_1),
    .io_in_QSV_4_0(io_in_QSV_4_0), .io_out_QSV_4_0(_m_io_out_QSV_4_0),
    .io_in_QSV_4_1(io_in_QSV_4_1), .io_out_QSV_4_1(_m_io_out_QSV_4_1),
    .io_in_QSV_5_0(io_in_QSV_5_0), .io_out_QSV_5_0(_m_io_out_QSV_5_0),
    .io_in_QSV_5_1(io_in_QSV_5_1), .io_out_QSV_5_1(_m_io_out_QSV_5_1),
    .io_in_QSV_6_0(io_in_QSV_6_0), .io_out_QSV_6_0(_m_io_out_QSV_6_0),
    .io_in_QSV_6_1(io_in_QSV_6_1), .io_out_QSV_6_1(_m_io_out_QSV_6_1),
    .io_in_QSV_7_0(io_in_QSV_7_0), .io_out_QSV_7_0(_m_io_out_QSV_7_0),
    .io_in_QSV_7_1(io_in_QSV_7_1), .io_out_QSV_7_1(_m_io_out_QSV_7_1),
    .io_in_QSV_8_0(io_in_QSV_8_0), .io_out_QSV_8_0(_m_io_out_QSV_8_0),
    .io_in_QSV_8_1(io_in_QSV_8_1), .io_out_QSV_8_1(_m_io_out_QSV_8_1),
    .io_in_QSV_9_0(io_in_QSV_9_0), .io_out_QSV_9_0(_m_io_out_QSV_9_0),
    .io_in_QSV_9_1(io_in_QSV_9_1), .io_out_QSV_9_1(_m_io_out_QSV_9_1),
    .io_in_QSV_10_0(io_in_QSV_10_0), .io_out_QSV_10_0(_m_io_out_QSV_10_0),
    .io_in_QSV_10_1(io_in_QSV_10_1), .io_out_QSV_10_1(_m_io_out_QSV_10_1),
    .io_in_QSV_11_0(io_in_QSV_11_0), .io_out_QSV_11_0(_m_io_out_QSV_11_0),
    .io_in_QSV_11_1(io_in_QSV_11_1), .io_out_QSV_11_1(_m_io_out_QSV_11_1),
    .io_in_QSV_12_0(io_in_QSV_12_0), .io_out_QSV_12_0(_m_io_out_QSV_12_0),
    .io_in_QSV_12_1(io_in_QSV_12_1), .io_out_QSV_12_1(_m_io_out_QSV_12_1),
    .io_in_QSV_13_0(io_in_QSV_13_0), .io_out_QSV_13_0(_m_io_out_QSV_13_0),
    .io_in_QSV_13_1(io_in_QSV_13_1), .io_out_QSV_13_1(_m_io_out_QSV_13_1),
    .io_in_QSV_14_0(io_in_QSV_14_0), .io_out_QSV_14_0(_m_io_out_QSV_14_0),
    .io_in_QSV_14_1(io_in_QSV_14_1), .io_out_QSV_14_1(_m_io_out_QSV_14_1),
    .io_in_QSV_15_0(io_in_QSV_15_0), .io_out_QSV_15_0(_m_io_out_QSV_15_0),
    .io_in_QSV_15_1(io_in_QSV_15_1), .io_out_QSV_15_1(_m_io_out_QSV_15_1),
    .io_in_QSV_16_0(io_in_QSV_16_0), .io_out_QSV_16_0(_m_io_out_QSV_16_0),
    .io_in_QSV_16_1(io_in_QSV_16_1), .io_out_QSV_16_1(_m_io_out_QSV_16_1),
    .io_in_QSV_17_0(io_in_QSV_17_0), .io_out_QSV_17_0(_m_io_out_QSV_17_0),
    .io_in_QSV_17_1(io_in_QSV_17_1), .io_out_QSV_17_1(_m_io_out_QSV_17_1),
    .io_in_QSV_18_0(io_in_QSV_18_0), .io_out_QSV_18_0(_m_io_out_QSV_18_0),
    .io_in_QSV_18_1(io_in_QSV_18_1), .io_out_QSV_18_1(_m_io_out_QSV_18_1),
    .io_in_QSV_19_0(io_in_QSV_19_0), .io_out_QSV_19_0(_m_io_out_QSV_19_0),
    .io_in_QSV_19_1(io_in_QSV_19_1), .io_out_QSV_19_1(_m_io_out_QSV_19_1),
    .io_in_QSV_20_0(io_in_QSV_20_0), .io_out_QSV_20_0(_m_io_out_QSV_20_0),
    .io_in_QSV_20_1(io_in_QSV_20_1), .io_out_QSV_20_1(_m_io_out_QSV_20_1),
    .io_in_QSV_21_0(io_in_QSV_21_0), .io_out_QSV_21_0(_m_io_out_QSV_21_0),
    .io_in_QSV_21_1(io_in_QSV_21_1), .io_out_QSV_21_1(_m_io_out_QSV_21_1),
    .io_in_QSV_22_0(io_in_QSV_22_0), .io_out_QSV_22_0(_m_io_out_QSV_22_0),
    .io_in_QSV_22_1(io_in_QSV_22_1), .io_out_QSV_22_1(_m_io_out_QSV_22_1),
    .io_in_QSV_23_0(io_in_QSV_23_0), .io_out_QSV_23_0(_m_io_out_QSV_23_0),
    .io_in_QSV_23_1(io_in_QSV_23_1), .io_out_QSV_23_1(_m_io_out_QSV_23_1),
    .io_in_QSV_24_0(io_in_QSV_24_0), .io_out_QSV_24_0(_m_io_out_QSV_24_0),
    .io_in_QSV_24_1(io_in_QSV_24_1), .io_out_QSV_24_1(_m_io_out_QSV_24_1),
    .io_in_QSV_25_0(io_in_QSV_25_0), .io_out_QSV_25_0(_m_io_out_QSV_25_0),
    .io_in_QSV_25_1(io_in_QSV_25_1), .io_out_QSV_25_1(_m_io_out_QSV_25_1),
    .io_in_QSV_26_0(io_in_QSV_26_0), .io_out_QSV_26_0(_m_io_out_QSV_26_0),
    .io_in_QSV_26_1(io_in_QSV_26_1), .io_out_QSV_26_1(_m_io_out_QSV_26_1),
    .io_in_QSV_27_0(io_in_QSV_27_0), .io_out_QSV_27_0(_m_io_out_QSV_27_0),
    .io_in_QSV_27_1(io_in_QSV_27_1), .io_out_QSV_27_1(_m_io_out_QSV_27_1),
    .io_in_QSV_28_0(io_in_QSV_28_0), .io_out_QSV_28_0(_m_io_out_QSV_28_0),
    .io_in_QSV_28_1(io_in_QSV_28_1), .io_out_QSV_28_1(_m_io_out_QSV_28_1),
    .io_in_QSV_29_0(io_in_QSV_29_0), .io_out_QSV_29_0(_m_io_out_QSV_29_0),
    .io_in_QSV_29_1(io_in_QSV_29_1), .io_out_QSV_29_1(_m_io_out_QSV_29_1),
    .io_in_QSV_30_0(io_in_QSV_30_0), .io_out_QSV_30_0(_m_io_out_QSV_30_0),
    .io_in_QSV_30_1(io_in_QSV_30_1), .io_out_QSV_30_1(_m_io_out_QSV_30_1),
    .io_in_QSV_31_0(io_in_QSV_31_0), .io_out_QSV_31_0(_m_io_out_QSV_31_0),
    .io_in_QSV_31_1(io_in_QSV_31_1), .io_out_QSV_31_1(_m_io_out_QSV_31_1)
  );

  // Auto-generate instances m_1 to m_15
  `define INSTANTIATE_STAGE(MOD, INST, IN_STG, OUT_STG) \
    MOD INST ( \
      .clock(clock), \
      .reset(reset), \
      .io_in_valid(IN_STG``_io_out_valid), \
      .io_out_valid(OUT_STG``_valid), \
      .io_in_QSV_0_0(IN_STG``_io_out_QSV_0_0), .io_out_QSV_0_0(OUT_STG``_QSV_0_0), \
      .io_in_QSV_0_1(IN_STG``_io_out_QSV_0_1), .io_out_QSV_0_1(OUT_STG``_QSV_0_1), \
      .io_in_QSV_1_0(IN_STG``_io_out_QSV_1_0), .io_out_QSV_1_0(OUT_STG``_QSV_1_0), \
      .io_in_QSV_1_1(IN_STG``_io_out_QSV_1_1), .io_out_QSV_1_1(OUT_STG``_QSV_1_1), \
      .io_in_QSV_2_0(IN_STG``_io_out_QSV_2_0), .io_out_QSV_2_0(OUT_STG``_QSV_2_0), \
      .io_in_QSV_2_1(IN_STG``_io_out_QSV_2_1), .io_out_QSV_2_1(OUT_STG``_QSV_2_1), \
      .io_in_QSV_3_0(IN_STG``_io_out_QSV_3_0), .io_out_QSV_3_0(OUT_STG``_QSV_3_0), \
      .io_in_QSV_3_1(IN_STG``_io_out_QSV_3_1), .io_out_QSV_3_1(OUT_STG``_QSV_3_1), \
      .io_in_QSV_4_0(IN_STG``_io_out_QSV_4_0), .io_out_QSV_4_0(OUT_STG``_QSV_4_0), \
      .io_in_QSV_4_1(IN_STG``_io_out_QSV_4_1), .io_out_QSV_4_1(OUT_STG``_QSV_4_1), \
      .io_in_QSV_5_0(IN_STG``_io_out_QSV_5_0), .io_out_QSV_5_0(OUT_STG``_QSV_5_0), \
      .io_in_QSV_5_1(IN_STG``_io_out_QSV_5_1), .io_out_QSV_5_1(OUT_STG``_QSV_5_1), \
      .io_in_QSV_6_0(IN_STG``_io_out_QSV_6_0), .io_out_QSV_6_0(OUT_STG``_QSV_6_0), \
      .io_in_QSV_6_1(IN_STG``_io_out_QSV_6_1), .io_out_QSV_6_1(OUT_STG``_QSV_6_1), \
      .io_in_QSV_7_0(IN_STG``_io_out_QSV_7_0), .io_out_QSV_7_0(OUT_STG``_QSV_7_0), \
      .io_in_QSV_7_1(IN_STG``_io_out_QSV_7_1), .io_out_QSV_7_1(OUT_STG``_QSV_7_1), \
      .io_in_QSV_8_0(IN_STG``_io_out_QSV_8_0), .io_out_QSV_8_0(OUT_STG``_QSV_8_0), \
      .io_in_QSV_8_1(IN_STG``_io_out_QSV_8_1), .io_out_QSV_8_1(OUT_STG``_QSV_8_1), \
      .io_in_QSV_9_0(IN_STG``_io_out_QSV_9_0), .io_out_QSV_9_0(OUT_STG``_QSV_9_0), \
      .io_in_QSV_9_1(IN_STG``_io_out_QSV_9_1), .io_out_QSV_9_1(OUT_STG``_QSV_9_1), \
      .io_in_QSV_10_0(IN_STG``_io_out_QSV_10_0), .io_out_QSV_10_0(OUT_STG``_QSV_10_0), \
      .io_in_QSV_10_1(IN_STG``_io_out_QSV_10_1), .io_out_QSV_10_1(OUT_STG``_QSV_10_1), \
      .io_in_QSV_11_0(IN_STG``_io_out_QSV_11_0), .io_out_QSV_11_0(OUT_STG``_QSV_11_0), \
      .io_in_QSV_11_1(IN_STG``_io_out_QSV_11_1), .io_out_QSV_11_1(OUT_STG``_QSV_11_1), \
      .io_in_QSV_12_0(IN_STG``_io_out_QSV_12_0), .io_out_QSV_12_0(OUT_STG``_QSV_12_0), \
      .io_in_QSV_12_1(IN_STG``_io_out_QSV_12_1), .io_out_QSV_12_1(OUT_STG``_QSV_12_1), \
      .io_in_QSV_13_0(IN_STG``_io_out_QSV_13_0), .io_out_QSV_13_0(OUT_STG``_QSV_13_0), \
      .io_in_QSV_13_1(IN_STG``_io_out_QSV_13_1), .io_out_QSV_13_1(OUT_STG``_QSV_13_1), \
      .io_in_QSV_14_0(IN_STG``_io_out_QSV_14_0), .io_out_QSV_14_0(OUT_STG``_QSV_14_0), \
      .io_in_QSV_14_1(IN_STG``_io_out_QSV_14_1), .io_out_QSV_14_1(OUT_STG``_QSV_14_1), \
      .io_in_QSV_15_0(IN_STG``_io_out_QSV_15_0), .io_out_QSV_15_0(OUT_STG``_QSV_15_0), \
      .io_in_QSV_15_1(IN_STG``_io_out_QSV_15_1), .io_out_QSV_15_1(OUT_STG``_QSV_15_1), \
      .io_in_QSV_16_0(IN_STG``_io_out_QSV_16_0), .io_out_QSV_16_0(OUT_STG``_QSV_16_0), \
      .io_in_QSV_16_1(IN_STG``_io_out_QSV_16_1), .io_out_QSV_16_1(OUT_STG``_QSV_16_1), \
      .io_in_QSV_17_0(IN_STG``_io_out_QSV_17_0), .io_out_QSV_17_0(OUT_STG``_QSV_17_0), \
      .io_in_QSV_17_1(IN_STG``_io_out_QSV_17_1), .io_out_QSV_17_1(OUT_STG``_QSV_17_1), \
      .io_in_QSV_18_0(IN_STG``_io_out_QSV_18_0), .io_out_QSV_18_0(OUT_STG``_QSV_18_0), \
      .io_in_QSV_18_1(IN_STG``_io_out_QSV_18_1), .io_out_QSV_18_1(OUT_STG``_QSV_18_1), \
      .io_in_QSV_19_0(IN_STG``_io_out_QSV_19_0), .io_out_QSV_19_0(OUT_STG``_QSV_19_0), \
      .io_in_QSV_19_1(IN_STG``_io_out_QSV_19_1), .io_out_QSV_19_1(OUT_STG``_QSV_19_1), \
      .io_in_QSV_20_0(IN_STG``_io_out_QSV_20_0), .io_out_QSV_20_0(OUT_STG``_QSV_20_0), \
      .io_in_QSV_20_1(IN_STG``_io_out_QSV_20_1), .io_out_QSV_20_1(OUT_STG``_QSV_20_1), \
      .io_in_QSV_21_0(IN_STG``_io_out_QSV_21_0), .io_out_QSV_21_0(OUT_STG``_QSV_21_0), \
      .io_in_QSV_21_1(IN_STG``_io_out_QSV_21_1), .io_out_QSV_21_1(OUT_STG``_QSV_21_1), \
      .io_in_QSV_22_0(IN_STG``_io_out_QSV_22_0), .io_out_QSV_22_0(OUT_STG``_QSV_22_0), \
      .io_in_QSV_22_1(IN_STG``_io_out_QSV_22_1), .io_out_QSV_22_1(OUT_STG``_QSV_22_1), \
      .io_in_QSV_23_0(IN_STG``_io_out_QSV_23_0), .io_out_QSV_23_0(OUT_STG``_QSV_23_0), \
      .io_in_QSV_23_1(IN_STG``_io_out_QSV_23_1), .io_out_QSV_23_1(OUT_STG``_QSV_23_1), \
      .io_in_QSV_24_0(IN_STG``_io_out_QSV_24_0), .io_out_QSV_24_0(OUT_STG``_QSV_24_0), \
      .io_in_QSV_24_1(IN_STG``_io_out_QSV_24_1), .io_out_QSV_24_1(OUT_STG``_QSV_24_1), \
      .io_in_QSV_25_0(IN_STG``_io_out_QSV_25_0), .io_out_QSV_25_0(OUT_STG``_QSV_25_0), \
      .io_in_QSV_25_1(IN_STG``_io_out_QSV_25_1), .io_out_QSV_25_1(OUT_STG``_QSV_25_1), \
      .io_in_QSV_26_0(IN_STG``_io_out_QSV_26_0), .io_out_QSV_26_0(OUT_STG``_QSV_26_0), \
      .io_in_QSV_26_1(IN_STG``_io_out_QSV_26_1), .io_out_QSV_26_1(OUT_STG``_QSV_26_1), \
      .io_in_QSV_27_0(IN_STG``_io_out_QSV_27_0), .io_out_QSV_27_0(OUT_STG``_QSV_27_0), \
      .io_in_QSV_27_1(IN_STG``_io_out_QSV_27_1), .io_out_QSV_27_1(OUT_STG``_QSV_27_1), \
      .io_in_QSV_28_0(IN_STG``_io_out_QSV_28_0), .io_out_QSV_28_0(OUT_STG``_QSV_28_0), \
      .io_in_QSV_28_1(IN_STG``_io_out_QSV_28_1), .io_out_QSV_28_1(OUT_STG``_QSV_28_1), \
      .io_in_QSV_29_0(IN_STG``_io_out_QSV_29_0), .io_out_QSV_29_0(OUT_STG``_QSV_29_0), \
      .io_in_QSV_29_1(IN_STG``_io_out_QSV_29_1), .io_out_QSV_29_1(OUT_STG``_QSV_29_1), \
      .io_in_QSV_30_0(IN_STG``_io_out_QSV_30_0), .io_out_QSV_30_0(OUT_STG``_QSV_30_0), \
      .io_in_QSV_30_1(IN_STG``_io_out_QSV_30_1), .io_out_QSV_30_1(OUT_STG``_QSV_30_1), \
      .io_in_QSV_31_0(IN_STG``_io_out_QSV_31_0), .io_out_QSV_31_0(OUT_STG``_QSV_31_0), \
      .io_in_QSV_31_1(IN_STG``_io_out_QSV_31_1), .io_out_QSV_31_1(OUT_STG``_QSV_31_1) \
    );

  `INSTANTIATE_STAGE(CompatiblePerm, m_1, _m, _m_1_io_out)
  `INSTANTIATE_STAGE(CNGate5QubitVector8bit, m_2, _m_1, _m_2_io_out)
  `INSTANTIATE_STAGE(CompatiblePerm_1, m_3, _m_2, _m_3_io_out)
  `INSTANTIATE_STAGE(CompatiblePerm_2, m_4, _m_3, _m_4_io_out)
  `INSTANTIATE_STAGE(CNGate5QubitVector8bit, m_5, _m_4, _m_5_io_out)
  `INSTANTIATE_STAGE(CompatiblePerm_3, m_6, _m_5, _m_6_io_out)
  `INSTANTIATE_STAGE(CompatiblePerm_4, m_7, _m_6, _m_7_io_out)
  `INSTANTIATE_STAGE(CNGate5QubitVector8bit, m_8, _m_7, _m_8_io_out)
  `INSTANTIATE_STAGE(CompatiblePerm_5, m_9, _m_8, _m_9_io_out)
  `INSTANTIATE_STAGE(CompatiblePerm_6, m_10, _m_9, _m_10_io_out)
  `INSTANTIATE_STAGE(CNGate5QubitVector8bit, m_11, _m_10, _m_11_io_out)
  `INSTANTIATE_STAGE(CompatiblePerm_1, m_12, _m_11, _m_12_io_out)
  `INSTANTIATE_STAGE(CompatiblePerm_4, m_13, _m_12, _m_13_io_out)
  `INSTANTIATE_STAGE(CompatiblePerm_9, m_14, _m_13, _m_14_io_out)
  `INSTANTIATE_STAGE(CompatiblePerm_10, m_15, _m_14, io_out)

endmodule
