module Shor (
  input  wire       clock,
  input  wire       reset,
  input  wire       io_in_valid,
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
  input  wire [7:0] io_in_QSV_8_0,
  input  wire [7:0] io_in_QSV_8_1,
  input  wire [7:0] io_in_QSV_9_0,
  input  wire [7:0] io_in_QSV_9_1,
  input  wire [7:0] io_in_QSV_10_0,
  input  wire [7:0] io_in_QSV_10_1,
  input  wire [7:0] io_in_QSV_11_0,
  input  wire [7:0] io_in_QSV_11_1,
  input  wire [7:0] io_in_QSV_12_0,
  input  wire [7:0] io_in_QSV_12_1,
  input  wire [7:0] io_in_QSV_13_0,
  input  wire [7:0] io_in_QSV_13_1,
  input  wire [7:0] io_in_QSV_14_0,
  input  wire [7:0] io_in_QSV_14_1,
  input  wire [7:0] io_in_QSV_15_0,
  input  wire [7:0] io_in_QSV_15_1,
  input  wire [7:0] io_in_QSV_16_0,
  input  wire [7:0] io_in_QSV_16_1,
  input  wire [7:0] io_in_QSV_17_0,
  input  wire [7:0] io_in_QSV_17_1,
  input  wire [7:0] io_in_QSV_18_0,
  input  wire [7:0] io_in_QSV_18_1,
  input  wire [7:0] io_in_QSV_19_0,
  input  wire [7:0] io_in_QSV_19_1,
  input  wire [7:0] io_in_QSV_20_0,
  input  wire [7:0] io_in_QSV_20_1,
  input  wire [7:0] io_in_QSV_21_0,
  input  wire [7:0] io_in_QSV_21_1,
  input  wire [7:0] io_in_QSV_22_0,
  input  wire [7:0] io_in_QSV_22_1,
  input  wire [7:0] io_in_QSV_23_0,
  input  wire [7:0] io_in_QSV_23_1,
  input  wire [7:0] io_in_QSV_24_0,
  input  wire [7:0] io_in_QSV_24_1,
  input  wire [7:0] io_in_QSV_25_0,
  input  wire [7:0] io_in_QSV_25_1,
  input  wire [7:0] io_in_QSV_26_0,
  input  wire [7:0] io_in_QSV_26_1,
  input  wire [7:0] io_in_QSV_27_0,
  input  wire [7:0] io_in_QSV_27_1,
  input  wire [7:0] io_in_QSV_28_0,
  input  wire [7:0] io_in_QSV_28_1,
  input  wire [7:0] io_in_QSV_29_0,
  input  wire [7:0] io_in_QSV_29_1,
  input  wire [7:0] io_in_QSV_30_0,
  input  wire [7:0] io_in_QSV_30_1,
  input  wire [7:0] io_in_QSV_31_0,
  input  wire [7:0] io_in_QSV_31_1,

  output wire       io_out_valid,
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
  output wire [7:0] io_out_QSV_8_0,
  output wire [7:0] io_out_QSV_8_1,
  output wire [7:0] io_out_QSV_9_0,
  output wire [7:0] io_out_QSV_9_1,
  output wire [7:0] io_out_QSV_10_0,
  output wire [7:0] io_out_QSV_10_1,
  output wire [7:0] io_out_QSV_11_0,
  output wire [7:0] io_out_QSV_11_1,
  output wire [7:0] io_out_QSV_12_0,
  output wire [7:0] io_out_QSV_12_1,
  output wire [7:0] io_out_QSV_13_0,
  output wire [7:0] io_out_QSV_13_1,
  output wire [7:0] io_out_QSV_14_0,
  output wire [7:0] io_out_QSV_14_1,
  output wire [7:0] io_out_QSV_15_0,
  output wire [7:0] io_out_QSV_15_1,
  output wire [7:0] io_out_QSV_16_0,
  output wire [7:0] io_out_QSV_16_1,
  output wire [7:0] io_out_QSV_17_0,
  output wire [7:0] io_out_QSV_17_1,
  output wire [7:0] io_out_QSV_18_0,
  output wire [7:0] io_out_QSV_18_1,
  output wire [7:0] io_out_QSV_19_0,
  output wire [7:0] io_out_QSV_19_1,
  output wire [7:0] io_out_QSV_20_0,
  output wire [7:0] io_out_QSV_20_1,
  output wire [7:0] io_out_QSV_21_0,
  output wire [7:0] io_out_QSV_21_1,
  output wire [7:0] io_out_QSV_22_0,
  output wire [7:0] io_out_QSV_22_1,
  output wire [7:0] io_out_QSV_23_0,
  output wire [7:0] io_out_QSV_23_1,
  output wire [7:0] io_out_QSV_24_0,
  output wire [7:0] io_out_QSV_24_1,
  output wire [7:0] io_out_QSV_25_0,
  output wire [7:0] io_out_QSV_25_1,
  output wire [7:0] io_out_QSV_26_0,
  output wire [7:0] io_out_QSV_26_1,
  output wire [7:0] io_out_QSV_27_0,
  output wire [7:0] io_out_QSV_27_1,
  output wire [7:0] io_out_QSV_28_0,
  output wire [7:0] io_out_QSV_28_1,
  output wire [7:0] io_out_QSV_29_0,
  output wire [7:0] io_out_QSV_29_1,
  output wire [7:0] io_out_QSV_30_0,
  output wire [7:0] io_out_QSV_30_1,
  output wire [7:0] io_out_QSV_31_0,
  output wire [7:0] io_out_QSV_31_1
);

  // Macros to generate wire definitions and repetitive port mapping
  `define DECLARE_STAGE_WIRES(PREFIX) \
    wire PREFIX``_io_out_valid; \
    wire [7:0] PREFIX``_io_out_QSV_0_0, PREFIX``_io_out_QSV_0_1, PREFIX``_io_out_QSV_1_0, PREFIX``_io_out_QSV_1_1; \
    wire [7:0] PREFIX``_io_out_QSV_2_0, PREFIX``_io_out_QSV_2_1, PREFIX``_io_out_QSV_3_0, PREFIX``_io_out_QSV_3_1; \
    wire [7:0] PREFIX``_io_out_QSV_4_0, PREFIX``_io_out_QSV_4_1, PREFIX``_io_out_QSV_5_0, PREFIX``_io_out_QSV_5_1; \
    wire [7:0] PREFIX``_io_out_QSV_6_0, PREFIX``_io_out_QSV_6_1, PREFIX``_io_out_QSV_7_0, PREFIX``_io_out_QSV_7_1; \
    wire [7:0] PREFIX``_io_out_QSV_8_0, PREFIX``_io_out_QSV_8_1, PREFIX``_io_out_QSV_9_0, PREFIX``_io_out_QSV_9_1; \
    wire [7:0] PREFIX``_io_out_QSV_10_0, PREFIX``_io_out_QSV_10_1, PREFIX``_io_out_QSV_11_0, PREFIX``_io_out_QSV_11_1; \
    wire [7:0] PREFIX``_io_out_QSV_12_0, PREFIX``_io_out_QSV_12_1, PREFIX``_io_out_QSV_13_0, PREFIX``_io_out_QSV_13_1; \
    wire [7:0] PREFIX``_io_out_QSV_14_0, PREFIX``_io_out_QSV_14_1, PREFIX``_io_out_QSV_15_0, PREFIX``_io_out_QSV_15_1; \
    wire [7:0] PREFIX``_io_out_QSV_16_0, PREFIX``_io_out_QSV_16_1, PREFIX``_io_out_QSV_17_0, PREFIX``_io_out_QSV_17_1; \
    wire [7:0] PREFIX``_io_out_QSV_18_0, PREFIX``_io_out_QSV_18_1, PREFIX``_io_out_QSV_19_0, PREFIX``_io_out_QSV_19_1; \
    wire [7:0] PREFIX``_io_out_QSV_20_0, PREFIX``_io_out_QSV_20_1, PREFIX``_io_out_QSV_21_0, PREFIX``_io_out_QSV_21_1; \
    wire [7:0] PREFIX``_io_out_QSV_22_0, PREFIX``_io_out_QSV_22_1, PREFIX``_io_out_QSV_23_0, PREFIX``_io_out_QSV_23_1; \
    wire [7:0] PREFIX``_io_out_QSV_24_0, PREFIX``_io_out_QSV_24_1, PREFIX``_io_out_QSV_25_0, PREFIX``_io_out_QSV_25_1; \
    wire [7:0] PREFIX``_io_out_QSV_26_0, PREFIX``_io_out_QSV_26_1, PREFIX``_io_out_QSV_27_0, PREFIX``_io_out_QSV_27_1; \
    wire [7:0] PREFIX``_io_out_QSV_28_0, PREFIX``_io_out_QSV_28_1, PREFIX``_io_out_QSV_29_0, PREFIX``_io_out_QSV_29_1; \
    wire [7:0] PREFIX``_io_out_QSV_30_0, PREFIX``_io_out_QSV_30_1, PREFIX``_io_out_QSV_31_0, PREFIX``_io_out_QSV_31_1;

  `define MAP_STAGE_INPUTS(PREFIX) \
    .io_in_valid(PREFIX``_io_out_valid), \
    .io_in_QSV_0_0(PREFIX``_io_out_QSV_0_0), .io_in_QSV_0_1(PREFIX``_io_out_QSV_0_1), .io_in_QSV_1_0(PREFIX``_io_out_QSV_1_0), .io_in_QSV_1_1(PREFIX``_io_out_QSV_1_1), \
    .io_in_QSV_2_0(PREFIX``_io_out_QSV_2_0), .io_in_QSV_2_1(PREFIX``_io_out_QSV_2_1), .io_in_QSV_3_0(PREFIX``_io_out_QSV_3_0), .io_in_QSV_3_1(PREFIX``_io_out_QSV_3_1), \
    .io_in_QSV_4_0(PREFIX``_io_out_QSV_4_0), .io_in_QSV_4_1(PREFIX``_io_out_QSV_4_1), .io_in_QSV_5_0(PREFIX``_io_out_QSV_5_0), .io_in_QSV_5_1(PREFIX``_io_out_QSV_5_1), \
    .io_in_QSV_6_0(PREFIX``_io_out_QSV_6_0), .io_in_QSV_6_1(PREFIX``_io_out_QSV_6_1), .io_in_QSV_7_0(PREFIX``_io_out_QSV_7_0), .io_in_QSV_7_1(PREFIX``_io_out_QSV_7_1), \
    .io_in_QSV_8_0(PREFIX``_io_out_QSV_8_0), .io_in_QSV_8_1(PREFIX``_io_out_QSV_8_1), .io_in_QSV_9_0(PREFIX``_io_out_QSV_9_0), .io_in_QSV_9_1(PREFIX``_io_out_QSV_9_1), \
    .io_in_QSV_10_0(PREFIX``_io_out_QSV_10_0), .io_in_QSV_10_1(PREFIX``_io_out_QSV_10_1), .io_in_QSV_11_0(PREFIX``_io_out_QSV_11_0), .io_in_QSV_11_1(PREFIX``_io_out_QSV_11_1), \
    .io_in_QSV_12_0(PREFIX``_io_out_QSV_12_0), .io_in_QSV_12_1(PREFIX``_io_out_QSV_12_1), .io_in_QSV_13_0(PREFIX``_io_out_QSV_13_0), .io_in_QSV_13_1(PREFIX``_io_out_QSV_13_1), \
    .io_in_QSV_14_0(PREFIX``_io_out_QSV_14_0), .io_in_QSV_14_1(PREFIX``_io_out_QSV_14_1), .io_in_QSV_15_0(PREFIX``_io_out_QSV_15_0), .io_in_QSV_15_1(PREFIX``_io_out_QSV_15_1), \
    .io_in_QSV_16_0(PREFIX``_io_out_QSV_16_0), .io_in_QSV_16_1(PREFIX``_io_out_QSV_16_1), .io_in_QSV_17_0(PREFIX``_io_out_QSV_17_0), .io_in_QSV_17_1(PREFIX``_io_out_QSV_17_1), \
    .io_in_QSV_18_0(PREFIX``_io_out_QSV_18_0), .io_in_QSV_18_1(PREFIX``_io_out_QSV_18_1), .io_in_QSV_19_0(PREFIX``_io_out_QSV_19_0), .io_in_QSV_19_1(PREFIX``_io_out_QSV_19_1), \
    .io_in_QSV_20_0(PREFIX``_io_out_QSV_20_0), .io_in_QSV_20_1(PREFIX``_io_out_QSV_20_1), .io_in_QSV_21_0(PREFIX``_io_out_QSV_21_0), .io_in_QSV_21_1(PREFIX``_io_out_QSV_21_1), \
    .io_in_QSV_22_0(PREFIX``_io_out_QSV_22_0), .io_in_QSV_22_1(PREFIX``_io_out_QSV_22_1), .io_in_QSV_23_0(PREFIX``_io_out_QSV_23_0), .io_in_QSV_23_1(PREFIX``_io_out_QSV_23_1), \
    .io_in_QSV_24_0(PREFIX``_io_out_QSV_24_0), .io_in_QSV_24_1(PREFIX``_io_out_QSV_24_1), .io_in_QSV_25_0(PREFIX``_io_out_QSV_25_0), .io_in_QSV_25_1(PREFIX``_io_out_QSV_25_1), \
    .io_in_QSV_26_0(PREFIX``_io_out_QSV_26_0), .io_in_QSV_26_1(PREFIX``_io_out_QSV_26_1), .io_in_QSV_27_0(PREFIX``_io_out_QSV_27_0), .io_in_QSV_27_1(PREFIX``_io_out_QSV_27_1), \
    .io_in_QSV_28_0(PREFIX``_io_out_QSV_28_0), .io_in_QSV_28_1(PREFIX``_io_out_QSV_28_1), .io_in_QSV_29_0(PREFIX``_io_out_QSV_29_0), .io_in_QSV_29_1(PREFIX``_io_out_QSV_29_1), \
    .io_in_QSV_30_0(PREFIX``_io_out_QSV_30_0), .io_in_QSV_30_1(PREFIX``_io_out_QSV_30_1), .io_in_QSV_31_0(PREFIX``_io_out_QSV_31_0), .io_in_QSV_31_1(PREFIX``_io_out_QSV_31_1)

  `define MAP_STAGE_OUTPUTS(PREFIX) \
    .io_out_valid(PREFIX``_io_out_valid), \
    .io_out_QSV_0_0(PREFIX``_io_out_QSV_0_0), .io_out_QSV_0_1(PREFIX``_io_out_QSV_0_1), .io_out_QSV_1_0(PREFIX``_io_out_QSV_1_0), .io_out_QSV_1_1(PREFIX``_io_out_QSV_1_1), \
    .io_out_QSV_2_0(PREFIX``_io_out_QSV_2_0), .io_out_QSV_2_1(PREFIX``_io_out_QSV_2_1), .io_out_QSV_3_0(PREFIX``_io_out_QSV_3_0), .io_out_QSV_3_1(PREFIX``_io_out_QSV_3_1), \
    .io_out_QSV_4_0(PREFIX``_io_out_QSV_4_0), .io_out_QSV_4_1(PREFIX``_io_out_QSV_4_1), .io_out_QSV_5_0(PREFIX``_io_out_QSV_5_0), .io_out_QSV_5_1(PREFIX``_io_out_QSV_5_1), \
    .io_out_QSV_6_0(PREFIX``_io_out_QSV_6_0), .io_out_QSV_6_1(PREFIX``_io_out_QSV_6_1), .io_out_QSV_7_0(PREFIX``_io_out_QSV_7_0), .io_out_QSV_7_1(PREFIX``_io_out_QSV_7_1), \
    .io_out_QSV_8_0(PREFIX``_io_out_QSV_8_0), .io_out_QSV_8_1(PREFIX``_io_out_QSV_8_1), .io_out_QSV_9_0(PREFIX``_io_out_QSV_9_0), .io_out_QSV_9_1(PREFIX``_io_out_QSV_9_1), \
    .io_out_QSV_10_0(PREFIX``_io_out_QSV_10_0), .io_out_QSV_10_1(PREFIX``_io_out_QSV_10_1), .io_out_QSV_11_0(PREFIX``_io_out_QSV_11_0), .io_out_QSV_11_1(PREFIX``_io_out_QSV_11_1), \
    .io_out_QSV_12_0(PREFIX``_io_out_QSV_12_0), .io_out_QSV_12_1(PREFIX``_io_out_QSV_12_1), .io_out_QSV_13_0(PREFIX``_io_out_QSV_13_0), .io_out_QSV_13_1(PREFIX``_io_out_QSV_13_1), \
    .io_out_QSV_14_0(PREFIX``_io_out_QSV_14_0), .io_out_QSV_14_1(PREFIX``_io_out_QSV_14_1), .io_out_QSV_15_0(PREFIX``_io_out_QSV_15_0), .io_out_QSV_15_1(PREFIX``_io_out_QSV_15_1), \
    .io_out_QSV_16_0(PREFIX``_io_out_QSV_16_0), .io_out_QSV_16_1(PREFIX``_io_out_QSV_16_1), .io_out_QSV_17_0(PREFIX``_io_out_QSV_17_0), .io_out_QSV_17_1(PREFIX``_io_out_QSV_17_1), \
    .io_out_QSV_18_0(PREFIX``_io_out_QSV_18_0), .io_out_QSV_18_1(PREFIX``_io_out_QSV_18_1), .io_out_QSV_19_0(PREFIX``_io_out_QSV_19_0), .io_out_QSV_19_1(PREFIX``_io_out_QSV_19_1), \
    .io_out_QSV_20_0(PREFIX``_io_out_QSV_20_0), .io_out_QSV_20_1(PREFIX``_io_out_QSV_20_1), .io_out_QSV_21_0(PREFIX``_io_out_QSV_21_0), .io_out_QSV_21_1(PREFIX``_io_out_QSV_21_1), \
    .io_out_QSV_22_0(PREFIX``_io_out_QSV_22_0), .io_out_QSV_22_1(PREFIX``_io_out_QSV_22_1), .io_out_QSV_23_0(PREFIX``_io_out_QSV_23_0), .io_out_QSV_23_1(PREFIX``_io_out_QSV_23_1), \
    .io_out_QSV_24_0(PREFIX``_io_out_QSV_24_0), .io_out_QSV_24_1(PREFIX``_io_out_QSV_24_1), .io_out_QSV_25_0(PREFIX``_io_out_QSV_25_0), .io_out_QSV_25_1(PREFIX``_io_out_QSV_25_1), \
    .io_out_QSV_26_0(PREFIX``_io_out_QSV_26_0), .io_out_QSV_26_1(PREFIX``_io_out_QSV_26_1), .io_out_QSV_27_0(PREFIX``_io_out_QSV_27_0), .io_out_QSV_27_1(PREFIX``_io_out_QSV_27_1), \
    .io_out_QSV_28_0(PREFIX``_io_out_QSV_28_0), .io_out_QSV_28_1(PREFIX``_io_out_QSV_28_1), .io_out_QSV_29_0(PREFIX``_io_out_QSV_29_0), .io_out_QSV_29_1(PREFIX``_io_out_QSV_29_1), \
    .io_out_QSV_30_0(PREFIX``_io_out_QSV_30_0), .io_out_QSV_30_1(PREFIX``_io_out_QSV_30_1), .io_out_QSV_31_0(PREFIX``_io_out_QSV_31_0), .io_out_QSV_31_1(PREFIX``_io_out_QSV_31_1)

  // Intermediate wire declarations
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

  // Stage 0: H(0)
  HGate5QubitVector8bit m (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(io_in),
    `MAP_STAGE_OUTPUTS(_m)
  );

  // Stage 1: Permutation before CX(0,1)
  CompatiblePerm m_1 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m),
    `MAP_STAGE_OUTPUTS(_m_1)
  );

  // Stage 2: CX(0,1)
  CNGate5QubitVector8bit m_2 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m_1),
    `MAP_STAGE_OUTPUTS(_m_2)
  );

  // Stage 3: Permutation after CX(0,1)
  CompatiblePerm_1 m_3 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m_2),
    `MAP_STAGE_OUTPUTS(_m_3)
  );

  // Stage 4: Permutation before CX(1,2)
  CompatiblePerm_2 m_4 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m_3),
    `MAP_STAGE_OUTPUTS(_m_4)
  );

  // Stage 5: CX(1,2)
  CNGate5QubitVector8bit m_5 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m_4),
    `MAP_STAGE_OUTPUTS(_m_5)
  );

  // Stage 6: Permutation after CX(1,2)
  CompatiblePerm_3 m_6 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m_5),
    `MAP_STAGE_OUTPUTS(_m_6)
  );

  // Stage 7: Permutation before CX(2,3)
  CompatiblePerm_4 m_7 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m_6),
    `MAP_STAGE_OUTPUTS(_m_7)
  );

  // Stage 8: CX(2,3)
  CNGate5QubitVector8bit m_8 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m_7),
    `MAP_STAGE_OUTPUTS(_m_8)
  );

  // Stage 9: Permutation after CX(2,3)
  CompatiblePerm_5 m_9 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m_8),
    `MAP_STAGE_OUTPUTS(_m_9)
  );

  // Stage 10: Permutation before CX(3,4)
  CompatiblePerm_6 m_10 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m_9),
    `MAP_STAGE_OUTPUTS(_m_10)
  );

  // Stage 11: CX(3,4)
  CNGate5QubitVector8bit m_11 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m_10),
    `MAP_STAGE_OUTPUTS(_m_11)
  );

  // Stage 12: Permutation to restore ordering 1/4
  CompatiblePerm_7 m_12 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m_11),
    `MAP_STAGE_OUTPUTS(_m_12)
  );

  // Stage 13: Permutation to restore ordering 2/4
  CompatiblePerm_8 m_13 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m_12),
    `MAP_STAGE_OUTPUTS(_m_13)
  );

  // Stage 14: Permutation to restore ordering 3/4
  CompatiblePerm_9 m_14 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m_13),
    `MAP_STAGE_OUTPUTS(_m_14)
  );

  // Stage 15: Permutation to restore ordering 4/4
  CompatiblePerm_10 m_15 (
    .clock(clock), .reset(reset),
    `MAP_STAGE_INPUTS(_m_14),
    `MAP_STAGE_OUTPUTS(io_out)
  );

endmodule
