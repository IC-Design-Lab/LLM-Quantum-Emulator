module Shor (
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
  output wire [7:0] io_out_QSV_31_1,
  output wire       io_out_valid
);

  // Define macro to minimize repetitive wire declarations
  `define DECLARE_STAGE_WIRES(STG) \
    wire [7:0] ``STG``_io_out_QSV_0_0, ``STG``_io_out_QSV_0_1, ``STG``_io_out_QSV_1_0, ``STG``_io_out_QSV_1_1, \
               ``STG``_io_out_QSV_2_0, ``STG``_io_out_QSV_2_1, ``STG``_io_out_QSV_3_0, ``STG``_io_out_QSV_3_1, \
               ``STG``_io_out_QSV_4_0, ``STG``_io_out_QSV_4_1, ``STG``_io_out_QSV_5_0, ``STG``_io_out_QSV_5_1, \
               ``STG``_io_out_QSV_6_0, ``STG``_io_out_QSV_6_1, ``STG``_io_out_QSV_7_0, ``STG``_io_out_QSV_7_1, \
               ``STG``_io_out_QSV_8_0, ``STG``_io_out_QSV_8_1, ``STG``_io_out_QSV_9_0, ``STG``_io_out_QSV_9_1, \
               ``STG``_io_out_QSV_10_0, ``STG``_io_out_QSV_10_1, ``STG``_io_out_QSV_11_0, ``STG``_io_out_QSV_11_1, \
               ``STG``_io_out_QSV_12_0, ``STG``_io_out_QSV_12_1, ``STG``_io_out_QSV_13_0, ``STG``_io_out_QSV_13_1, \
               ``STG``_io_out_QSV_14_0, ``STG``_io_out_QSV_14_1, ``STG``_io_out_QSV_15_0, ``STG``_io_out_QSV_15_1, \
               ``STG``_io_out_QSV_16_0, ``STG``_io_out_QSV_16_1, ``STG``_io_out_QSV_17_0, ``STG``_io_out_QSV_17_1, \
               ``STG``_io_out_QSV_18_0, ``STG``_io_out_QSV_18_1, ``STG``_io_out_QSV_19_0, ``STG``_io_out_QSV_19_1, \
               ``STG``_io_out_QSV_20_0, ``STG``_io_out_QSV_20_1, ``STG``_io_out_QSV_21_0, ``STG``_io_out_QSV_21_1, \
               ``STG``_io_out_QSV_22_0, ``STG``_io_out_QSV_22_1, ``STG``_io_out_QSV_23_0, ``STG``_io_out_QSV_23_1, \
               ``STG``_io_out_QSV_24_0, ``STG``_io_out_QSV_24_1, ``STG``_io_out_QSV_25_0, ``STG``_io_out_QSV_25_1, \
               ``STG``_io_out_QSV_26_0, ``STG``_io_out_QSV_26_1, ``STG``_io_out_QSV_27_0, ``STG``_io_out_QSV_27_1, \
               ``STG``_io_out_QSV_28_0, ``STG``_io_out_QSV_28_1, ``STG``_io_out_QSV_29_0, ``STG``_io_out_QSV_29_1, \
               ``STG``_io_out_QSV_30_0, ``STG``_io_out_QSV_30_1, ``STG``_io_out_QSV_31_0, ``STG``_io_out_QSV_31_1; \
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

  // Define macro to minimize repetitive instance port bindings
  `define BIND_STAGE_PORTS(IN_PREFIX, OUT_PREFIX) \
    .io_in_QSV_0_0(IN_PREFIX``_QSV_0_0), .io_in_QSV_0_1(IN_PREFIX``_QSV_0_1), .io_in_QSV_1_0(IN_PREFIX``_QSV_1_0), .io_in_QSV_1_1(IN_PREFIX``_QSV_1_1), \
    .io_in_QSV_2_0(IN_PREFIX``_QSV_2_0), .io_in_QSV_2_1(IN_PREFIX``_QSV_2_1), .io_in_QSV_3_0(IN_PREFIX``_QSV_3_0), .io_in_QSV_3_1(IN_PREFIX``_QSV_3_1), \
    .io_in_QSV_4_0(IN_PREFIX``_QSV_4_0), .io_in_QSV_4_1(IN_PREFIX``_QSV_4_1), .io_in_QSV_5_0(IN_PREFIX``_QSV_5_0), .io_in_QSV_5_1(IN_PREFIX``_QSV_5_1), \
    .io_in_QSV_6_0(IN_PREFIX``_QSV_6_0), .io_in_QSV_6_1(IN_PREFIX``_QSV_6_1), .io_in_QSV_7_0(IN_PREFIX``_QSV_7_0), .io_in_QSV_7_1(IN_PREFIX``_QSV_7_1), \
    .io_in_QSV_8_0(IN_PREFIX``_QSV_8_0), .io_in_QSV_8_1(IN_PREFIX``_QSV_8_1), .io_in_QSV_9_0(IN_PREFIX``_QSV_9_0), .io_in_QSV_9_1(IN_PREFIX``_QSV_9_1), \
    .io_in_QSV_10_0(IN_PREFIX``_QSV_10_0), .io_in_QSV_10_1(IN_PREFIX``_QSV_10_1), .io_in_QSV_11_0(IN_PREFIX``_QSV_11_0), .io_in_QSV_11_1(IN_PREFIX``_QSV_11_1), \
    .io_in_QSV_12_0(IN_PREFIX``_QSV_12_0), .io_in_QSV_12_1(IN_PREFIX``_QSV_12_1), .io_in_QSV_13_0(IN_PREFIX``_QSV_13_0), .io_in_QSV_13_1(IN_PREFIX``_QSV_13_1), \
    .io_in_QSV_14_0(IN_PREFIX``_QSV_14_0), .io_in_QSV_14_1(IN_PREFIX``_QSV_14_1), .io_in_QSV_15_0(IN_PREFIX``_QSV_15_0), .io_in_QSV_15_1(IN_PREFIX``_QSV_15_1), \
    .io_in_QSV_16_0(IN_PREFIX``_QSV_16_0), .io_in_QSV_16_1(IN_PREFIX``_QSV_16_1), .io_in_QSV_17_0(IN_PREFIX``_QSV_17_0), .io_in_QSV_17_1(IN_PREFIX``_QSV_17_1), \
    .io_in_QSV_18_0(IN_PREFIX``_QSV_18_0), .io_in_QSV_18_1(IN_PREFIX``_QSV_18_1), .io_in_QSV_19_0(IN_PREFIX``_QSV_19_0), .io_in_QSV_19_1(IN_PREFIX``_QSV_19_1), \
    .io_in_QSV_20_0(IN_PREFIX``_QSV_20_0), .io_in_QSV_20_1(IN_PREFIX``_QSV_20_1), .io_in_QSV_21_0(IN_PREFIX``_QSV_21_0), .io_in_QSV_21_1(IN_PREFIX``_QSV_21_1), \
    .io_in_QSV_22_0(IN_PREFIX``_QSV_22_0), .io_in_QSV_22_1(IN_PREFIX``_QSV_22_1), .io_in_QSV_23_0(IN_PREFIX``_QSV_23_0), .io_in_QSV_23_1(IN_PREFIX``_QSV_23_1), \
    .io_in_QSV_24_0(IN_PREFIX``_QSV_24_0), .io_in_QSV_24_1(IN_PREFIX``_QSV_24_1), .io_in_QSV_25_0(IN_PREFIX``_QSV_25_0), .io_in_QSV_25_1(IN_PREFIX``_QSV_25_1), \
    .io_in_QSV_26_0(IN_PREFIX``_QSV_26_0), .io_in_QSV_26_1(IN_PREFIX``_QSV_26_1), .io_in_QSV_27_0(IN_PREFIX``_QSV_27_0), .io_in_QSV_27_1(IN_PREFIX``_QSV_27_1), \
    .io_in_QSV_28_0(IN_PREFIX``_QSV_28_0), .io_in_QSV_28_1(IN_PREFIX``_QSV_28_1), .io_in_QSV_29_0(IN_PREFIX``_QSV_29_0), .io_in_QSV_29_1(IN_PREFIX``_QSV_29_1), \
    .io_in_QSV_30_0(IN_PREFIX``_QSV_30_0), .io_in_QSV_30_1(IN_PREFIX``_QSV_30_1), .io_in_QSV_31_0(IN_PREFIX``_QSV_31_0), .io_in_QSV_31_1(IN_PREFIX``_QSV_31_1), \
    .io_out_QSV_0_0(OUT_PREFIX``_QSV_0_0), .io_out_QSV_0_1(OUT_PREFIX``_QSV_0_1), .io_out_QSV_1_0(OUT_PREFIX``_QSV_1_0), .io_out_QSV_1_1(OUT_PREFIX``_QSV_1_1), \
    .io_out_QSV_2_0(OUT_PREFIX``_QSV_2_0), .io_out_QSV_2_1(OUT_PREFIX``_QSV_2_1), .io_out_QSV_3_0(OUT_PREFIX``_QSV_3_0), .io_out_QSV_3_1(OUT_PREFIX``_QSV_3_1), \
    .io_out_QSV_4_0(OUT_PREFIX``_QSV_4_0), .io_out_QSV_4_1(OUT_PREFIX``_QSV_4_1), .io_out_QSV_5_0(OUT_PREFIX``_QSV_5_0), .io_out_QSV_5_1(OUT_PREFIX``_QSV_5_1), \
    .io_out_QSV_6_0(OUT_PREFIX``_QSV_6_0), .io_out_QSV_6_1(OUT_PREFIX``_QSV_6_1), .io_out_QSV_7_0(OUT_PREFIX``_QSV_7_0), .io_out_QSV_7_1(OUT_PREFIX``_QSV_7_1), \
    .io_out_QSV_8_0(OUT_PREFIX``_QSV_8_0), .io_out_QSV_8_1(OUT_PREFIX``_QSV_8_1), .io_out_QSV_9_0(OUT_PREFIX``_QSV_9_0), .io_out_QSV_9_1(OUT_PREFIX``_QSV_9_1), \
    .io_out_QSV_10_0(OUT_PREFIX``_QSV_10_0), .io_out_QSV_10_1(OUT_PREFIX``_QSV_10_1), .io_out_QSV_11_0(OUT_PREFIX``_QSV_11_0), .io_out_QSV_11_1(OUT_PREFIX``_QSV_11_1), \
    .io_out_QSV_12_0(OUT_PREFIX``_QSV_12_0), .io_out_QSV_12_1(OUT_PREFIX``_QSV_12_1), .io_out_QSV_13_0(OUT_PREFIX``_QSV_13_0), .io_out_QSV_13_1(OUT_PREFIX``_QSV_13_1), \
    .io_out_QSV_14_0(OUT_PREFIX``_QSV_14_0), .io_out_QSV_14_1(OUT_PREFIX``_QSV_14_1), .io_out_QSV_15_0(OUT_PREFIX``_QSV_15_0), .io_out_QSV_15_1(OUT_PREFIX``_QSV_15_1), \
    .io_out_QSV_16_0(OUT_PREFIX``_QSV_16_0), .io_out_QSV_16_1(OUT_PREFIX``_QSV_16_1), .io_out_QSV_17_0(OUT_PREFIX``_QSV_17_0), .io_out_QSV_17_1(OUT_PREFIX``_QSV_17_1), \
    .io_out_QSV_18_0(OUT_PREFIX``_QSV_18_0), .io_out_QSV_18_1(OUT_PREFIX``_QSV_18_1), .io_out_QSV_19_0(OUT_PREFIX``_QSV_19_0), .io_out_QSV_19_1(OUT_PREFIX``_QSV_19_1), \
    .io_out_QSV_20_0(OUT_PREFIX``_QSV_20_0), .io_out_QSV_20_1(OUT_PREFIX``_QSV_20_1), .io_out_QSV_21_0(OUT_PREFIX``_QSV_21_0), .io_out_QSV_21_1(OUT_PREFIX``_QSV_21_1), \
    .io_out_QSV_22_0(OUT_PREFIX``_QSV_22_0), .io_out_QSV_22_1(OUT_PREFIX``_QSV_22_1), .io_out_QSV_23_0(OUT_PREFIX``_QSV_23_0), .io_out_QSV_23_1(OUT_PREFIX``_QSV_23_1), \
    .io_out_QSV_24_0(OUT_PREFIX``_QSV_24_0), .io_out_QSV_24_1(OUT_PREFIX``_QSV_24_1), .io_out_QSV_25_0(OUT_PREFIX``_QSV_25_0), .io_out_QSV_25_1(OUT_PREFIX``_QSV_25_1), \
    .io_out_QSV_26_0(OUT_PREFIX``_QSV_26_0), .io_out_QSV_26_1(OUT_PREFIX``_QSV_26_1), .io_out_QSV_27_0(OUT_PREFIX``_QSV_27_0), .io_out_QSV_27_1(OUT_PREFIX``_QSV_27_1), \
    .io_out_QSV_28_0(OUT_PREFIX``_QSV_28_0), .io_out_QSV_28_1(OUT_PREFIX``_QSV_28_1), .io_out_QSV_29_0(OUT_PREFIX``_QSV_29_0), .io_out_QSV_29_1(OUT_PREFIX``_QSV_29_1), \
    .io_out_QSV_30_0(OUT_PREFIX``_QSV_30_0), .io_out_QSV_30_1(OUT_PREFIX``_QSV_30_1), .io_out_QSV_31_0(OUT_PREFIX``_QSV_31_0), .io_out_QSV_31_1(OUT_PREFIX``_QSV_31_1)

  // Stage 1: H(0)
  HGate5QubitVector8bit m (
    .clock(clock), .reset(reset), .io_in_valid(io_in_valid), .io_out_valid(_m_io_out_valid),
    `BIND_STAGE_PORTS(io_in, _m_io_out)
  );

  // Stage 2: Permutation before CX(0, 1)
  CompatiblePerm m_1 (
    .clock(clock), .reset(reset), .io_in_valid(_m_io_out_valid), .io_out_valid(_m_1_io_out_valid),
    `BIND_STAGE_PORTS(_m_io_out, _m_1_io_out)
  );

  // Stage 3: CX(0, 1)
  CNGate5QubitVector8bit m_2 (
    .clock(clock), .reset(reset), .io_in_valid(_m_1_io_out_valid), .io_out_valid(_m_2_io_out_valid),
    `BIND_STAGE_PORTS(_m_1_io_out, _m_2_io_out)
  );

  // Stage 4: Permutation after CX(0, 1)
  CompatiblePerm_1 m_3 (
    .clock(clock), .reset(reset), .io_in_valid(_m_2_io_out_valid), .io_out_valid(_m_3_io_out_valid),
    `BIND_STAGE_PORTS(_m_2_io_out, _m_3_io_out)
  );

  // Stage 5: Permutation before CX(1, 2)
  CompatiblePerm_2 m_4 (
    .clock(clock), .reset(reset), .io_in_valid(_m_3_io_out_valid), .io_out_valid(_m_4_io_out_valid),
    `BIND_STAGE_PORTS(_m_3_io_out, _m_4_io_out)
  );

  // Stage 6: CX(1, 2)
  CNGate5QubitVector8bit m_5 (
    .clock(clock), .reset(reset), .io_in_valid(_m_4_io_out_valid), .io_out_valid(_m_5_io_out_valid),
    `BIND_STAGE_PORTS(_m_4_io_out, _m_5_io_out)
  );

  // Stage 7: Permutation after CX(1, 2)
  CompatiblePerm_3 m_6 (
    .clock(clock), .reset(reset), .io_in_valid(_m_5_io_out_valid), .io_out_valid(_m_6_io_out_valid),
    `BIND_STAGE_PORTS(_m_5_io_out, _m_6_io_out)
  );

  // Stage 8: Permutation before CX(2, 3)
  CompatiblePerm_4 m_7 (
    .clock(clock), .reset(reset), .io_in_valid(_m_6_io_out_valid), .io_out_valid(_m_7_io_out_valid),
    `BIND_STAGE_PORTS(_m_6_io_out, _m_7_io_out)
  );

  // Stage 9: CX(2, 3)
  CNGate5QubitVector8bit m_8 (
    .clock(clock), .reset(reset), .io_in_valid(_m_7_io_out_valid), .io_out_valid(_m_8_io_out_valid),
    `BIND_STAGE_PORTS(_m_7_io_out, _m_8_io_out)
  );

  // Stage 10: Permutation after CX(2, 3)
  CompatiblePerm_5 m_9 (
    .clock(clock), .reset(reset), .io_in_valid(_m_8_io_out_valid), .io_out_valid(_m_9_io_out_valid),
    `BIND_STAGE_PORTS(_m_8_io_out, _m_9_io_out)
  );

  // Stage 11: Permutation before CX(3, 4)
  CompatiblePerm_6 m_10 (
    .clock(clock), .reset(reset), .io_in_valid(_m_9_io_out_valid), .io_out_valid(_m_10_io_out_valid),
    `BIND_STAGE_PORTS(_m_9_io_out, _m_10_io_out)
  );

  // Stage 12: CX(3, 4)
  CNGate5QubitVector8bit m_11 (
    .clock(clock), .reset(reset), .io_in_valid(_m_10_io_out_valid), .io_out_valid(_m_11_io_out_valid),
    `BIND_STAGE_PORTS(_m_10_io_out, _m_11_io_out)
  );

  // Stage 13: Permutation after CX(3, 4)
  CompatiblePerm_7 m_12 (
    .clock(clock), .reset(reset), .io_in_valid(_m_11_io_out_valid), .io_out_valid(io_out_valid),
    `BIND_STAGE_PORTS(_m_11_io_out, io_out)
  );

endmodule
