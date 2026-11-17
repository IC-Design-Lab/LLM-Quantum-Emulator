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

  `define DECLARE_STAGE_WIRES(PREFIX) \
    wire       PREFIX``_io_out_valid; \
    wire [7:0] PREFIX``_io_out_QSV_0_0,  PREFIX``_io_out_QSV_0_1,  PREFIX``_io_out_QSV_1_0,  PREFIX``_io_out_QSV_1_1; \
    wire [7:0] PREFIX``_io_out_QSV_2_0,  PREFIX``_io_out_QSV_2_1,  PREFIX``_io_out_QSV_3_0,  PREFIX``_io_out_QSV_3_1; \
    wire [7:0] PREFIX``_io_out_QSV_4_0,  PREFIX``_io_out_QSV_4_1,  PREFIX``_io_out_QSV_5_0,  PREFIX``_io_out_QSV_5_1; \
    wire [7:0] PREFIX``_io_out_QSV_6_0,  PREFIX``_io_out_QSV_6_1,  PREFIX``_io_out_QSV_7_0,  PREFIX``_io_out_QSV_7_1; \
    wire [7:0] PREFIX``_io_out_QSV_8_0,  PREFIX``_io_out_QSV_8_1,  PREFIX``_io_out_QSV_9_0,  PREFIX``_io_out_QSV_9_1; \
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

  `define MAP_STAGE(INST, TYPE, IN_PREFIX, OUT_PREFIX) \
    TYPE INST ( \
      .clock(clock), .reset(reset), \
      .io_in_valid(IN_PREFIX``_valid), \
      .io_in_QSV_0_0(IN_PREFIX``_QSV_0_0),   .io_in_QSV_0_1(IN_PREFIX``_QSV_0_1),   .io_in_QSV_1_0(IN_PREFIX``_QSV_1_0),   .io_in_QSV_1_1(IN_PREFIX``_QSV_1_1), \
      .io_in_QSV_2_0(IN_PREFIX``_QSV_2_0),   .io_in_QSV_2_1(IN_PREFIX``_QSV_2_1),   .io_in_QSV_3_0(IN_PREFIX``_QSV_3_0),   .io_in_QSV_3_1(IN_PREFIX``_QSV_3_1), \
      .io_in_QSV_4_0(IN_PREFIX``_QSV_4_0),   .io_in_QSV_4_1(IN_PREFIX``_QSV_4_1),   .io_in_QSV_5_0(IN_PREFIX``_QSV_5_0),   .io_in_QSV_5_1(IN_PREFIX``_QSV_5_1), \
      .io_in_QSV_6_0(IN_PREFIX``_QSV_6_0),   .io_in_QSV_6_1(IN_PREFIX``_QSV_6_1),   .io_in_QSV_7_0(IN_PREFIX``_QSV_7_0),   .io_in_QSV_7_1(IN_PREFIX``_QSV_7_1), \
      .io_in_QSV_8_0(IN_PREFIX``_QSV_8_0),   .io_in_QSV_8_1(IN_PREFIX``_QSV_8_1),   .io_in_QSV_9_0(IN_PREFIX``_QSV_9_0),   .io_in_QSV_9_1(IN_PREFIX``_QSV_9_1), \
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
      .io_out_valid(OUT_PREFIX``_valid), \
      .io_out_QSV_0_0(OUT_PREFIX``_QSV_0_0),   .io_out_QSV_0_1(OUT_PREFIX``_QSV_0_1),   .io_out_QSV_1_0(OUT_PREFIX``_QSV_1_0),   .io_out_QSV_1_1(OUT_PREFIX``_QSV_1_1), \
      .io_out_QSV_2_0(OUT_PREFIX``_QSV_2_0),   .io_out_QSV_2_1(OUT_PREFIX``_QSV_2_1),   .io_out_QSV_3_0(OUT_PREFIX``_QSV_3_0),   .io_out_QSV_3_1(OUT_PREFIX``_QSV_3_1), \
      .io_out_QSV_4_0(OUT_PREFIX``_QSV_4_0),   .io_out_QSV_4_1(OUT_PREFIX``_QSV_4_1),   .io_out_QSV_5_0(OUT_PREFIX``_QSV_5_0),   .io_out_QSV_5_1(OUT_PREFIX``_QSV_5_1), \
      .io_out_QSV_6_0(OUT_PREFIX``_QSV_6_0),   .io_out_QSV_6_1(OUT_PREFIX``_QSV_6_1),   .io_out_QSV_7_0(OUT_PREFIX``_QSV_7_0),   .io_out_QSV_7_1(OUT_PREFIX``_QSV_7_1), \
      .io_out_QSV_8_0(OUT_PREFIX``_QSV_8_0),   .io_out_QSV_8_1(OUT_PREFIX``_QSV_8_1),   .io_out_QSV_9_0(OUT_PREFIX``_QSV_9_0),   .io_out_QSV_9_1(OUT_PREFIX``_QSV_9_1), \
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
      .io_out_QSV_30_0(OUT_PREFIX``_QSV_30_0), .io_out_QSV_30_1(OUT_PREFIX``_QSV_30_1), .io_out_QSV_31_0(OUT_PREFIX``_QSV_31_0), .io_out_QSV_31_1(OUT_PREFIX``_QSV_31_1) \
    );

  // Step 0: H on q0 (target = 0, no perm needed)
  `MAP_STAGE(m, HGate5QubitVector8bit, io_in, _m_io_out)
  
  // Step 1: CX on q0, q1 (target = 1, perm needed)
  `MAP_STAGE(m_1, CompatiblePerm, _m_io_out, _m_1_io_out)
  `MAP_STAGE(m_2, CNGate5QubitVector8bit, _m_1_io_out, _m_2_io_out)
  `MAP_STAGE(m_3, CompatiblePerm_1, _m_2_io_out, _m_3_io_out)
  
  // Step 2: CX on q1, q2 (target = 2, perm needed)
  `MAP_STAGE(m_4, CompatiblePerm_2, _m_3_io_out, _m_4_io_out)
  `MAP_STAGE(m_5, CNGate5QubitVector8bit, _m_4_io_out, _m_5_io_out)
  `MAP_STAGE(m_6, CompatiblePerm_3, _m_5_io_out, _m_6_io_out)
  
  // Step 3: CX on q2, q3 (target = 3, perm needed)
  `MAP_STAGE(m_7, CompatiblePerm_4, _m_6_io_out, _m_7_io_out)
  `MAP_STAGE(m_8, CNGate5QubitVector8bit, _m_7_io_out, _m_8_io_out)
  `MAP_STAGE(m_9, CompatiblePerm_5, _m_8_io_out, _m_9_io_out)
  
  // Step 4: CX on q3, q4 (target = 4, perm needed)
  `MAP_STAGE(m_10, CompatiblePerm_6, _m_9_io_out, _m_10_io_out)
  `MAP_STAGE(m_11, CNGate5QubitVector8bit, _m_10_io_out, _m_11_io_out)
  `MAP_STAGE(m_12, CompatiblePerm_7, _m_11_io_out, io_out)

  `undef DECLARE_STAGE_WIRES
  `undef MAP_STAGE

endmodule
