module Shor (
  input  logic        clock,
  input  logic        reset,
  input  logic [7:0]  io_in_QSV_0_0,   input  logic [7:0]  io_in_QSV_0_1,
  input  logic [7:0]  io_in_QSV_1_0,   input  logic [7:0]  io_in_QSV_1_1,
  input  logic [7:0]  io_in_QSV_2_0,   input  logic [7:0]  io_in_QSV_2_1,
  input  logic [7:0]  io_in_QSV_3_0,   input  logic [7:0]  io_in_QSV_3_1,
  input  logic [7:0]  io_in_QSV_4_0,   input  logic [7:0]  io_in_QSV_4_1,
  input  logic [7:0]  io_in_QSV_5_0,   input  logic [7:0]  io_in_QSV_5_1,
  input  logic [7:0]  io_in_QSV_6_0,   input  logic [7:0]  io_in_QSV_6_1,
  input  logic [7:0]  io_in_QSV_7_0,   input  logic [7:0]  io_in_QSV_7_1,
  input  logic [7:0]  io_in_QSV_8_0,   input  logic [7:0]  io_in_QSV_8_1,
  input  logic [7:0]  io_in_QSV_9_0,   input  logic [7:0]  io_in_QSV_9_1,
  input  logic [7:0]  io_in_QSV_10_0,  input  logic [7:0]  io_in_QSV_10_1,
  input  logic [7:0]  io_in_QSV_11_0,  input  logic [7:0]  io_in_QSV_11_1,
  input  logic [7:0]  io_in_QSV_12_0,  input  logic [7:0]  io_in_QSV_12_1,
  input  logic [7:0]  io_in_QSV_13_0,  input  logic [7:0]  io_in_QSV_13_1,
  input  logic [7:0]  io_in_QSV_14_0,  input  logic [7:0]  io_in_QSV_14_1,
  input  logic [7:0]  io_in_QSV_15_0,  input  logic [7:0]  io_in_QSV_15_1,
  input  logic [7:0]  io_in_QSV_16_0,  input  logic [7:0]  io_in_QSV_16_1,
  input  logic [7:0]  io_in_QSV_17_0,  input  logic [7:0]  io_in_QSV_17_1,
  input  logic [7:0]  io_in_QSV_18_0,  input  logic [7:0]  io_in_QSV_18_1,
  input  logic [7:0]  io_in_QSV_19_0,  input  logic [7:0]  io_in_QSV_19_1,
  input  logic [7:0]  io_in_QSV_20_0,  input  logic [7:0]  io_in_QSV_20_1,
  input  logic [7:0]  io_in_QSV_21_0,  input  logic [7:0]  io_in_QSV_21_1,
  input  logic [7:0]  io_in_QSV_22_0,  input  logic [7:0]  io_in_QSV_22_1,
  input  logic [7:0]  io_in_QSV_23_0,  input  logic [7:0]  io_in_QSV_23_1,
  input  logic [7:0]  io_in_QSV_24_0,  input  logic [7:0]  io_in_QSV_24_1,
  input  logic [7:0]  io_in_QSV_25_0,  input  logic [7:0]  io_in_QSV_25_1,
  input  logic [7:0]  io_in_QSV_26_0,  input  logic [7:0]  io_in_QSV_26_1,
  input  logic [7:0]  io_in_QSV_27_0,  input  logic [7:0]  io_in_QSV_27_1,
  input  logic [7:0]  io_in_QSV_28_0,  input  logic [7:0]  io_in_QSV_28_1,
  input  logic [7:0]  io_in_QSV_29_0,  input  logic [7:0]  io_in_QSV_29_1,
  input  logic [7:0]  io_in_QSV_30_0,  input  logic [7:0]  io_in_QSV_30_1,
  input  logic [7:0]  io_in_QSV_31_0,  input  logic [7:0]  io_in_QSV_31_1,
  input  logic        io_in_valid,

  output logic [7:0]  io_out_QSV_0_0,  output logic [7:0]  io_out_QSV_0_1,
  output logic [7:0]  io_out_QSV_1_0,  output logic [7:0]  io_out_QSV_1_1,
  output logic [7:0]  io_out_QSV_2_0,  output logic [7:0]  io_out_QSV_2_1,
  output logic [7:0]  io_out_QSV_3_0,  output logic [7:0]  io_out_QSV_3_1,
  output logic [7:0]  io_out_QSV_4_0,  output logic [7:0]  io_out_QSV_4_1,
  output logic [7:0]  io_out_QSV_5_0,  output logic [7:0]  io_out_QSV_5_1,
  output logic [7:0]  io_out_QSV_6_0,  output logic [7:0]  io_out_QSV_6_1,
  output logic [7:0]  io_out_QSV_7_0,  output logic [7:0]  io_out_QSV_7_1,
  output logic [7:0]  io_out_QSV_8_0,  output logic [7:0]  io_out_QSV_8_1,
  output logic [7:0]  io_out_QSV_9_0,  output logic [7:0]  io_out_QSV_9_1,
  output logic [7:0]  io_out_QSV_10_0, output logic [7:0]  io_out_QSV_10_1,
  output logic [7:0]  io_out_QSV_11_0, output logic [7:0]  io_out_QSV_11_1,
  output logic [7:0]  io_out_QSV_12_0, output logic [7:0]  io_out_QSV_12_1,
  output logic [7:0]  io_out_QSV_13_0, output logic [7:0]  io_out_QSV_13_1,
  output logic [7:0]  io_out_QSV_14_0, output logic [7:0]  io_out_QSV_14_1,
  output logic [7:0]  io_out_QSV_15_0, output logic [7:0]  io_out_QSV_15_1,
  output logic [7:0]  io_out_QSV_16_0, output logic [7:0]  io_out_QSV_16_1,
  output logic [7:0]  io_out_QSV_17_0, output logic [7:0]  io_out_QSV_17_1,
  output logic [7:0]  io_out_QSV_18_0, output logic [7:0]  io_out_QSV_18_1,
  output logic [7:0]  io_out_QSV_19_0, output logic [7:0]  io_out_QSV_19_1,
  output logic [7:0]  io_out_QSV_20_0, output logic [7:0]  io_out_QSV_20_1,
  output logic [7:0]  io_out_QSV_21_0, output logic [7:0]  io_out_QSV_21_1,
  output logic [7:0]  io_out_QSV_22_0, output logic [7:0]  io_out_QSV_22_1,
  output logic [7:0]  io_out_QSV_23_0, output logic [7:0]  io_out_QSV_23_1,
  output logic [7:0]  io_out_QSV_24_0, output logic [7:0]  io_out_QSV_24_1,
  output logic [7:0]  io_out_QSV_25_0, output logic [7:0]  io_out_QSV_25_1,
  output logic [7:0]  io_out_QSV_26_0, output logic [7:0]  io_out_QSV_26_1,
  output logic [7:0]  io_out_QSV_27_0, output logic [7:0]  io_out_QSV_27_1,
  output logic [7:0]  io_out_QSV_28_0, output logic [7:0]  io_out_QSV_28_1,
  output logic [7:0]  io_out_QSV_29_0, output logic [7:0]  io_out_QSV_29_1,
  output logic [7:0]  io_out_QSV_30_0, output logic [7:0]  io_out_QSV_30_1,
  output logic [7:0]  io_out_QSV_31_0, output logic [7:0]  io_out_QSV_31_1,
  output logic        io_out_valid
);

  // Helper macro for wire declarations to keep the structure clear
  `define DECL_STAGE(SUF) \
  wire [7:0] _m``SUF``_io_out_QSV_0_0, _m``SUF``_io_out_QSV_0_1, _m``SUF``_io_out_QSV_1_0, _m``SUF``_io_out_QSV_1_1; \
  wire [7:0] _m``SUF``_io_out_QSV_2_0, _m``SUF``_io_out_QSV_2_1, _m``SUF``_io_out_QSV_3_0, _m``SUF``_io_out_QSV_3_1; \
  wire [7:0] _m``SUF``_io_out_QSV_4_0, _m``SUF``_io_out_QSV_4_1, _m``SUF``_io_out_QSV_5_0, _m``SUF``_io_out_QSV_5_1; \
  wire [7:0] _m``SUF``_io_out_QSV_6_0, _m``SUF``_io_out_QSV_6_1, _m``SUF``_io_out_QSV_7_0, _m``SUF``_io_out_QSV_7_1; \
  wire [7:0] _m``SUF``_io_out_QSV_8_0, _m``SUF``_io_out_QSV_8_1, _m``SUF``_io_out_QSV_9_0, _m``SUF``_io_out_QSV_9_1; \
  wire [7:0] _m``SUF``_io_out_QSV_10_0, _m``SUF``_io_out_QSV_10_1, _m``SUF``_io_out_QSV_11_0, _m``SUF``_io_out_QSV_11_1; \
  wire [7:0] _m``SUF``_io_out_QSV_12_0, _m``SUF``_io_out_QSV_12_1, _m``SUF``_io_out_QSV_13_0, _m``SUF``_io_out_QSV_13_1; \
  wire [7:0] _m``SUF``_io_out_QSV_14_0, _m``SUF``_io_out_QSV_14_1, _m``SUF``_io_out_QSV_15_0, _m``SUF``_io_out_QSV_15_1; \
  wire [7:0] _m``SUF``_io_out_QSV_16_0, _m``SUF``_io_out_QSV_16_1, _m``SUF``_io_out_QSV_17_0, _m``SUF``_io_out_QSV_17_1; \
  wire [7:0] _m``SUF``_io_out_QSV_18_0, _m``SUF``_io_out_QSV_18_1, _m``SUF``_io_out_QSV_19_0, _m``SUF``_io_out_QSV_19_1; \
  wire [7:0] _m``SUF``_io_out_QSV_20_0, _m``SUF``_io_out_QSV_20_1, _m``SUF``_io_out_QSV_21_0, _m``SUF``_io_out_QSV_21_1; \
  wire [7:0] _m``SUF``_io_out_QSV_22_0, _m``SUF``_io_out_QSV_22_1, _m``SUF``_io_out_QSV_23_0, _m``SUF``_io_out_QSV_23_1; \
  wire [7:0] _m``SUF``_io_out_QSV_24_0, _m``SUF``_io_out_QSV_24_1, _m``SUF``_io_out_QSV_25_0, _m``SUF``_io_out_QSV_25_1; \
  wire [7:0] _m``SUF``_io_out_QSV_26_0, _m``SUF``_io_out_QSV_26_1, _m``SUF``_io_out_QSV_27_0, _m``SUF``_io_out_QSV_27_1; \
  wire [7:0] _m``SUF``_io_out_QSV_28_0, _m``SUF``_io_out_QSV_28_1, _m``SUF``_io_out_QSV_29_0, _m``SUF``_io_out_QSV_29_1; \
  wire [7:0] _m``SUF``_io_out_QSV_30_0, _m``SUF``_io_out_QSV_30_1, _m``SUF``_io_out_QSV_31_0, _m``SUF``_io_out_QSV_31_1; \
  wire _m``SUF``_io_out_valid;

  `DECL_STAGE()
  `DECL_STAGE(_1)
  `DECL_STAGE(_2)
  `DECL_STAGE(_3)
  `DECL_STAGE(_4)
  `DECL_STAGE(_5)
  `DECL_STAGE(_6)
  `DECL_STAGE(_7)
  `DECL_STAGE(_8)
  `DECL_STAGE(_9)
  `DECL_STAGE(_10)
  `DECL_STAGE(_11)
  `DECL_STAGE(_12)
  `DECL_STAGE(_13)
  `DECL_STAGE(_14)

  `undef DECL_STAGE

  // Helper macro for instance wiring
  `define MAP_QSV(PRE, SUF) \
    .io_in_QSV_0_0(PRE``_0_0), .io_in_QSV_0_1(PRE``_0_1), .io_in_QSV_1_0(PRE``_1_0), .io_in_QSV_1_1(PRE``_1_1), \
    .io_in_QSV_2_0(PRE``_2_0), .io_in_QSV_2_1(PRE``_2_1), .io_in_QSV_3_0(PRE``_3_0), .io_in_QSV_3_1(PRE``_3_1), \
    .io_in_QSV_4_0(PRE``_4_0), .io_in_QSV_4_1(PRE``_4_1), .io_in_QSV_5_0(PRE``_5_0), .io_in_QSV_5_1(PRE``_5_1), \
    .io_in_QSV_6_0(PRE``_6_0), .io_in_QSV_6_1(PRE``_6_1), .io_in_QSV_7_0(PRE``_7_0), .io_in_QSV_7_1(PRE``_7_1), \
    .io_in_QSV_8_0(PRE``_8_0), .io_in_QSV_8_1(PRE``_8_1), .io_in_QSV_9_0(PRE``_9_0), .io_in_QSV_9_1(PRE``_9_1), \
    .io_in_QSV_10_0(PRE``_10_0), .io_in_QSV_10_1(PRE``_10_1), .io_in_QSV_11_0(PRE``_11_0), .io_in_QSV_11_1(PRE``_11_1), \
    .io_in_QSV_12_0(PRE``_12_0), .io_in_QSV_12_1(PRE``_12_1), .io_in_QSV_13_0(PRE``_13_0), .io_in_QSV_13_1(PRE``_13_1), \
    .io_in_QSV_14_0(PRE``_14_0), .io_in_QSV_14_1(PRE``_14_1), .io_in_QSV_15_0(PRE``_15_0), .io_in_QSV_15_1(PRE``_15_1), \
    .io_in_QSV_16_0(PRE``_16_0), .io_in_QSV_16_1(PRE``_16_1), .io_in_QSV_17_0(PRE``_17_0), .io_in_QSV_17_1(PRE``_17_1), \
    .io_in_QSV_18_0(PRE``_18_0), .io_in_QSV_18_1(PRE``_18_1), .io_in_QSV_19_0(PRE``_19_0), .io_in_QSV_19_1(PRE``_19_1), \
    .io_in_QSV_20_0(PRE``_20_0), .io_in_QSV_20_1(PRE``_20_1), .io_in_QSV_21_0(PRE``_21_0), .io_in_QSV_21_1(PRE``_21_1), \
    .io_in_QSV_22_0(PRE``_22_0), .io_in_QSV_22_1(PRE``_22_1), .io_in_QSV_23_0(PRE``_23_0), .io_in_QSV_23_1(PRE``_23_1), \
    .io_in_QSV_24_0(PRE``_24_0), .io_in_QSV_24_1(PRE``_24_1), .io_in_QSV_25_0(PRE``_25_0), .io_in_QSV_25_1(PRE``_25_1), \
    .io_in_QSV_26_0(PRE``_26_0), .io_in_QSV_26_1(PRE``_26_1), .io_in_QSV_27_0(PRE``_27_0), .io_in_QSV_27_1(PRE``_27_1), \
    .io_in_QSV_28_0(PRE``_28_0), .io_in_QSV_28_1(PRE``_28_1), .io_in_QSV_29_0(PRE``_29_0), .io_in_QSV_29_1(PRE``_29_1), \
    .io_in_QSV_30_0(PRE``_30_0), .io_in_QSV_30_1(PRE``_30_1), .io_in_QSV_31_0(PRE``_31_0), .io_in_QSV_31_1(PRE``_31_1), \
    .io_out_QSV_0_0(SUF``_0_0), .io_out_QSV_0_1(SUF``_0_1), .io_out_QSV_1_0(SUF``_1_0), .io_out_QSV_1_1(SUF``_1_1), \
    .io_out_QSV_2_0(SUF``_2_0), .io_out_QSV_2_1(SUF``_2_1), .io_out_QSV_3_0(SUF``_3_0), .io_out_QSV_3_1(SUF``_3_1), \
    .io_out_QSV_4_0(SUF``_4_0), .io_out_QSV_4_1(SUF``_4_1), .io_out_QSV_5_0(SUF``_5_0), .io_out_QSV_5_1(SUF``_5_1), \
    .io_out_QSV_6_0(SUF``_6_0), .io_out_QSV_6_1(SUF``_6_1), .io_out_QSV_7_0(SUF``_7_0), .io_out_QSV_7_1(SUF``_7_1), \
    .io_out_QSV_8_0(SUF``_8_0), .io_out_QSV_8_1(SUF``_8_1), .io_out_QSV_9_0(SUF``_9_0), .io_out_QSV_9_1(SUF``_9_1), \
    .io_out_QSV_10_0(SUF``_10_0), .io_out_QSV_10_1(SUF``_10_1), .io_out_QSV_11_0(SUF``_11_0), .io_out_QSV_11_1(SUF``_11_1), \
    .io_out_QSV_12_0(SUF``_12_0), .io_out_QSV_12_1(SUF``_12_1), .io_out_QSV_13_0(SUF``_13_0), .io_out_QSV_13_1(SUF``_13_1), \
    .io_out_QSV_14_0(SUF``_14_0), .io_out_QSV_14_1(SUF``_14_1), .io_out_QSV_15_0(SUF``_15_0), .io_out_QSV_15_1(SUF``_15_1), \
    .io_out_QSV_16_0(SUF``_16_0), .io_out_QSV_16_1(SUF``_16_1), .io_out_QSV_17_0(SUF``_17_0), .io_out_QSV_17_1(SUF``_17_1), \
    .io_out_QSV_18_0(SUF``_18_0), .io_out_QSV_18_1(SUF``_18_1), .io_out_QSV_19_0(SUF``_19_0), .io_out_QSV_19_1(SUF``_19_1), \
    .io_out_QSV_20_0(SUF``_20_0), .io_out_QSV_20_1(SUF``_20_1), .io_out_QSV_21_0(SUF``_21_0), .io_out_QSV_21_1(SUF``_21_1), \
    .io_out_QSV_22_0(SUF``_22_0), .io_out_QSV_22_1(SUF``_22_1), .io_out_QSV_23_0(SUF``_23_0), .io_out_QSV_23_1(SUF``_23_1), \
    .io_out_QSV_24_0(SUF``_24_0), .io_out_QSV_24_1(SUF``_24_1), .io_out_QSV_25_0(SUF``_25_0), .io_out_QSV_25_1(SUF``_25_1), \
    .io_out_QSV_26_0(SUF``_26_0), .io_out_QSV_26_1(SUF``_26_1), .io_out_QSV_27_0(SUF``_27_0), .io_out_QSV_27_1(SUF``_27_1), \
    .io_out_QSV_28_0(SUF``_28_0), .io_out_QSV_28_1(SUF``_28_1), .io_out_QSV_29_0(SUF``_29_0), .io_out_QSV_29_1(SUF``_29_1), \
    .io_out_QSV_30_0(SUF``_30_0), .io_out_QSV_30_1(SUF``_30_1), .io_out_QSV_31_0(SUF``_31_0), .io_out_QSV_31_1(SUF``_31_1)

  // Stage 0: CompatiblePerm
  CompatiblePerm m (
    .clock(clock), .reset(reset),
    .io_in_valid(io_in_valid),
    .io_out_valid(_m_io_out_valid),
    `MAP_QSV(io_in_QSV, _m_io_out_QSV)
  );

  // Stage 1: HGate5QubitVector8bit (H on Q0)
  HGate5QubitVector8bit m_1 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_io_out_valid),
    .io_out_valid(_m_1_io_out_valid),
    `MAP_QSV(_m_io_out_QSV, _m_1_io_out_QSV)
  );

  // Stage 2: CompatiblePerm_1
  CompatiblePerm_1 m_2 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_1_io_out_valid),
    .io_out_valid(_m_2_io_out_valid),
    `MAP_QSV(_m_1_io_out_QSV, _m_2_io_out_QSV)
  );

  // Stage 3: CompatiblePerm_2
  CompatiblePerm_2 m_3 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_2_io_out_valid),
    .io_out_valid(_m_3_io_out_valid),
    `MAP_QSV(_m_2_io_out_QSV, _m_3_io_out_QSV)
  );

  // Stage 4: CNGate5QubitVector8bit (CX on Q0, Q1)
  CNGate5QubitVector8bit m_4 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_3_io_out_valid),
    .io_out_valid(_m_4_io_out_valid),
    `MAP_QSV(_m_3_io_out_QSV, _m_4_io_out_QSV)
  );

  // Stage 5: CompatiblePerm_3
  CompatiblePerm_3 m_5 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_4_io_out_valid),
    .io_out_valid(_m_5_io_out_valid),
    `MAP_QSV(_m_4_io_out_QSV, _m_5_io_out_QSV)
  );

  // Stage 6: CompatiblePerm_4
  CompatiblePerm_4 m_6 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_5_io_out_valid),
    .io_out_valid(_m_6_io_out_valid),
    `MAP_QSV(_m_5_io_out_QSV, _m_6_io_out_QSV)
  );

  // Stage 7: CNGate5QubitVector8bit (CX on Q1, Q2)
  CNGate5QubitVector8bit m_7 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_6_io_out_valid),
    .io_out_valid(_m_7_io_out_valid),
    `MAP_QSV(_m_6_io_out_QSV, _m_7_io_out_QSV)
  );

  // Stage 8: CompatiblePerm_5
  CompatiblePerm_5 m_8 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_7_io_out_valid),
    .io_out_valid(_m_8_io_out_valid),
    `MAP_QSV(_m_7_io_out_QSV, _m_8_io_out_QSV)
  );

  // Stage 9: CompatiblePerm_6
  CompatiblePerm_6 m_9 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_8_io_out_valid),
    .io_out_valid(_m_9_io_out_valid),
    `MAP_QSV(_m_8_io_out_QSV, _m_9_io_out_QSV)
  );

  // Stage 10: CNGate5QubitVector8bit (CX on Q2, Q3)
  CNGate5QubitVector8bit m_10 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_9_io_out_valid),
    .io_out_valid(_m_10_io_out_valid),
    `MAP_QSV(_m_9_io_out_QSV, _m_10_io_out_QSV)
  );

  // Stage 11: CompatiblePerm_7
  CompatiblePerm_7 m_11 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_10_io_out_valid),
    .io_out_valid(_m_11_io_out_valid),
    `MAP_QSV(_m_10_io_out_QSV, _m_11_io_out_QSV)
  );

  // Stage 12: CompatiblePerm_8
  CompatiblePerm_8 m_12 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_11_io_out_valid),
    .io_out_valid(_m_12_io_out_valid),
    `MAP_QSV(_m_11_io_out_QSV, _m_12_io_out_QSV)
  );

  // Stage 13: CNGate5QubitVector8bit (CX on Q3, Q4)
  CNGate5QubitVector8bit m_13 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_12_io_out_valid),
    .io_out_valid(_m_13_io_out_valid),
    `MAP_QSV(_m_12_io_out_QSV, _m_13_io_out_QSV)
  );

  // Stage 14: CompatiblePerm_9
  CompatiblePerm_9 m_14 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_13_io_out_valid),
    .io_out_valid(_m_14_io_out_valid),
    `MAP_QSV(_m_13_io_out_QSV, _m_14_io_out_QSV)
  );

  // Stage 15: CompatiblePerm_10 (final output routing)
  CompatiblePerm_10 m_15 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_14_io_out_valid),
    .io_out_valid(io_out_valid),
    `MAP_QSV(_m_14_io_out_QSV, io_out_QSV)
  );

  `undef MAP_QSV

endmodule
