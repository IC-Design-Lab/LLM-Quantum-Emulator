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

  // Generate intermediate wires for each pipeline step
  // Format macro-like lists for wire declarations to prevent code bloat
  `define DECLARE_STAGE_WIRES(PREFIX) \
    wire [7:0] PREFIX``_QSV_0_0, PREFIX``_QSV_0_1, PREFIX``_QSV_1_0, PREFIX``_QSV_1_1, \
               PREFIX``_QSV_2_0, PREFIX``_QSV_2_1, PREFIX``_QSV_3_0, PREFIX``_QSV_3_1, \
               PREFIX``_QSV_4_0, PREFIX``_QSV_4_1, PREFIX``_QSV_5_0, PREFIX``_QSV_5_1, \
               PREFIX``_QSV_6_0, PREFIX``_QSV_6_1, PREFIX``_QSV_7_0, PREFIX``_QSV_7_1, \
               PREFIX``_QSV_8_0, PREFIX``_QSV_8_1, PREFIX``_QSV_9_0, PREFIX``_QSV_9_1, \
               PREFIX``_QSV_10_0, PREFIX``_QSV_10_1, PREFIX``_QSV_11_0, PREFIX``_QSV_11_1, \
               PREFIX``_QSV_12_0, PREFIX``_QSV_12_1, PREFIX``_QSV_13_0, PREFIX``_QSV_13_1, \
               PREFIX``_QSV_14_0, PREFIX``_QSV_14_1, PREFIX``_QSV_15_0, PREFIX``_QSV_15_1, \
               PREFIX``_QSV_16_0, PREFIX``_QSV_16_1, PREFIX``_QSV_17_0, PREFIX``_QSV_17_1, \
               PREFIX``_QSV_18_0, PREFIX``_QSV_18_1, PREFIX``_QSV_19_0, PREFIX``_QSV_19_1, \
               PREFIX``_QSV_20_0, PREFIX``_QSV_20_1, PREFIX``_QSV_21_0, PREFIX``_QSV_21_1, \
               PREFIX``_QSV_22_0, PREFIX``_QSV_22_1, PREFIX``_QSV_23_0, PREFIX``_QSV_23_1, \
               PREFIX``_QSV_24_0, PREFIX``_QSV_24_1, PREFIX``_QSV_25_0, PREFIX``_QSV_25_1, \
               PREFIX``_QSV_26_0, PREFIX``_QSV_26_1, PREFIX``_QSV_27_0, PREFIX``_QSV_27_1, \
               PREFIX``_QSV_28_0, PREFIX``_QSV_28_1, PREFIX``_QSV_29_0, PREFIX``_QSV_29_1, \
               PREFIX``_QSV_30_0, PREFIX``_QSV_30_1, PREFIX``_QSV_31_0, PREFIX``_QSV_31_1; \
    wire PREFIX``_valid;

  `DECLARE_STAGE_WIRES(_m_io_out)
  `DECLARE_STAGE_WIRES(_m_1_io_out)
  `DECLARE_STAGE_WIRES(_m_2_io_out)
  `DECLARE_STAGE_WIRES(_m_3_io_out)
  `DECLARE_STAGE_WIRES(_m_4_io_out)
  `DECLARE_STAGE_WIRES(_m_5_io_out)
  `DECLARE_STAGE_WIRES(_m_6_io_out)
  `DECLARE_STAGE_WIRES(_m_7_io_out)
  `DECLARE_STAGE_WIRES(_m_8_io_out)
  `DECLARE_STAGE_WIRES(_m_9_io_out)
  `DECLARE_STAGE_WIRES(_m_10_io_out)
  `DECLARE_STAGE_WIRES(_m_11_io_out)
  `DECLARE_STAGE_WIRES(_m_12_io_out)
  `DECLARE_STAGE_WIRES(_m_13_io_out)
  `DECLARE_STAGE_WIRES(_m_14_io_out)

  `undef DECLARE_STAGE_WIRES

  // Helper macro for mapping the 32 QSV amplitudes in named port format
  `define MAP_QSV_PORTS(PREFIX) \
    .io_in_QSV_0_0(PREFIX``_0_0), .io_in_QSV_0_1(PREFIX``_0_1), \
    .io_in_QSV_1_0(PREFIX``_1_0), .io_in_QSV_1_1(PREFIX``_1_1), \
    .io_in_QSV_2_0(PREFIX``_2_0), .io_in_QSV_2_1(PREFIX``_2_1), \
    .io_in_QSV_3_0(PREFIX``_3_0), .io_in_QSV_3_1(PREFIX``_3_1), \
    .io_in_QSV_4_0(PREFIX``_4_0), .io_in_QSV_4_1(PREFIX``_4_1), \
    .io_in_QSV_5_0(PREFIX``_5_0), .io_in_QSV_5_1(PREFIX``_5_1), \
    .io_in_QSV_6_0(PREFIX``_6_0), .io_in_QSV_6_1(PREFIX``_6_1), \
    .io_in_QSV_7_0(PREFIX``_7_0), .io_in_QSV_7_1(PREFIX``_7_1), \
    .io_in_QSV_8_0(PREFIX``_8_0), .io_in_QSV_8_1(PREFIX``_8_1), \
    .io_in_QSV_9_0(PREFIX``_9_0), .io_in_QSV_9_1(PREFIX``_9_1), \
    .io_in_QSV_10_0(PREFIX``_10_0), .io_in_QSV_10_1(PREFIX``_10_1), \
    .io_in_QSV_11_0(PREFIX``_11_0), .io_in_QSV_11_1(PREFIX``_11_1), \
    .io_in_QSV_12_0(PREFIX``_12_0), .io_in_QSV_12_1(PREFIX``_12_1), \
    .io_in_QSV_13_0(PREFIX``_13_0), .io_in_QSV_13_1(PREFIX``_13_1), \
    .io_in_QSV_14_0(PREFIX``_14_0), .io_in_QSV_14_1(PREFIX``_14_1), \
    .io_in_QSV_15_0(PREFIX``_15_0), .io_in_QSV_15_1(PREFIX``_15_1), \
    .io_in_QSV_16_0(PREFIX``_16_0), .io_in_QSV_16_1(PREFIX``_16_1), \
    .io_in_QSV_17_0(PREFIX``_17_0), .io_in_QSV_17_1(PREFIX``_17_1), \
    .io_in_QSV_18_0(PREFIX``_18_0), .io_in_QSV_18_1(PREFIX``_18_1), \
    .io_in_QSV_19_0(PREFIX``_19_0), .io_in_QSV_19_1(PREFIX``_19_1), \
    .io_in_QSV_20_0(PREFIX``_20_0), .io_in_QSV_20_1(PREFIX``_20_1), \
    .io_in_QSV_21_0(PREFIX``_21_0), .io_in_QSV_21_1(PREFIX``_21_1), \
    .io_in_QSV_22_0(PREFIX``_22_0), .io_in_QSV_22_1(PREFIX``_22_1), \
    .io_in_QSV_23_0(PREFIX``_23_0), .io_in_QSV_23_1(PREFIX``_23_1), \
    .io_in_QSV_24_0(PREFIX``_24_0), .io_in_QSV_24_1(PREFIX``_24_1), \
    .io_in_QSV_25_0(PREFIX``_25_0), .io_in_QSV_25_1(PREFIX``_25_1), \
    .io_in_QSV_26_0(PREFIX``_26_0), .io_in_QSV_26_1(PREFIX``_26_1), \
    .io_in_QSV_27_0(PREFIX``_27_0), .io_in_QSV_27_1(PREFIX``_27_1), \
    .io_in_QSV_28_0(PREFIX``_28_0), .io_in_QSV_28_1(PREFIX``_28_1), \
    .io_in_QSV_29_0(PREFIX``_29_0), .io_in_QSV_29_1(PREFIX``_29_1), \
    .io_in_QSV_30_0(PREFIX``_30_0), .io_in_QSV_30_1(PREFIX``_30_1), \
    .io_in_QSV_31_0(PREFIX``_31_0), .io_in_QSV_31_1(PREFIX``_31_1)

  `define MAP_QSV_OUT_PORTS(PREFIX) \
    .io_out_QSV_0_0(PREFIX``_0_0), .io_out_QSV_0_1(PREFIX``_0_1), \
    .io_out_QSV_1_0(PREFIX``_1_0), .io_out_QSV_1_1(PREFIX``_1_1), \
    .io_out_QSV_2_0(PREFIX``_2_0), .io_out_QSV_2_1(PREFIX``_2_1), \
    .io_out_QSV_3_0(PREFIX``_3_0), .io_out_QSV_3_1(PREFIX``_3_1), \
    .io_out_QSV_4_0(PREFIX``_4_0), .io_out_QSV_4_1(PREFIX``_4_1), \
    .io_out_QSV_5_0(PREFIX``_5_0), .io_out_QSV_5_1(PREFIX``_5_1), \
    .io_out_QSV_6_0(PREFIX``_6_0), .io_out_QSV_6_1(PREFIX``_6_1), \
    .io_out_QSV_7_0(PREFIX``_7_0), .io_out_QSV_7_1(PREFIX``_7_1), \
    .io_out_QSV_8_0(PREFIX``_8_0), .io_out_QSV_8_1(PREFIX``_8_1), \
    .io_out_QSV_9_0(PREFIX``_9_0), .io_out_QSV_9_1(PREFIX``_9_1), \
    .io_out_QSV_10_0(PREFIX``_10_0), .io_out_QSV_10_1(PREFIX``_10_1), \
    .io_out_QSV_11_0(PREFIX``_11_0), .io_out_QSV_11_1(PREFIX``_11_1), \
    .io_out_QSV_12_0(PREFIX``_12_0), .io_out_QSV_12_1(PREFIX``_12_1), \
    .io_out_QSV_13_0(PREFIX``_13_0), .io_out_QSV_13_1(PREFIX``_13_1), \
    .io_out_QSV_14_0(PREFIX``_14_0), .io_out_QSV_14_1(PREFIX``_14_1), \
    .io_out_QSV_15_0(PREFIX``_15_0), .io_out_QSV_15_1(PREFIX``_15_1), \
    .io_out_QSV_16_0(PREFIX``_16_0), .io_out_QSV_16_1(PREFIX``_16_1), \
    .io_out_QSV_17_0(PREFIX``_17_0), .io_out_QSV_17_1(PREFIX``_17_1), \
    .io_out_QSV_18_0(PREFIX``_18_0), .io_out_QSV_18_1(PREFIX``_18_1), \
    .io_out_QSV_19_0(PREFIX``_19_0), .io_out_QSV_19_1(PREFIX``_19_1), \
    .io_out_QSV_20_0(PREFIX``_20_0), .io_out_QSV_20_1(PREFIX``_20_1), \
    .io_out_QSV_21_0(PREFIX``_21_0), .io_out_QSV_21_1(PREFIX``_21_1), \
    .io_out_QSV_22_0(PREFIX``_22_0), .io_out_QSV_22_1(PREFIX``_22_1), \
    .io_out_QSV_23_0(PREFIX``_23_0), .io_out_QSV_23_1(PREFIX``_23_1), \
    .io_out_QSV_24_0(PREFIX``_24_0), .io_out_QSV_24_1(PREFIX``_24_1), \
    .io_out_QSV_25_0(PREFIX``_25_0), .io_out_QSV_25_1(PREFIX``_25_1), \
    .io_out_QSV_26_0(PREFIX``_26_0), .io_out_QSV_26_1(PREFIX``_26_1), \
    .io_out_QSV_27_0(PREFIX``_27_0), .io_out_QSV_27_1(PREFIX``_27_1), \
    .io_out_QSV_28_0(PREFIX``_28_0), .io_out_QSV_28_1(PREFIX``_28_1), \
    .io_out_QSV_29_0(PREFIX``_29_0), .io_out_QSV_29_1(PREFIX``_29_1), \
    .io_out_QSV_30_0(PREFIX``_30_0), .io_out_QSV_30_1(PREFIX``_30_1), \
    .io_out_QSV_31_0(PREFIX``_31_0), .io_out_QSV_31_1(PREFIX``_31_1)

  // Stage 0: Permutation Layer
  CompatiblePerm m (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(io_in_QSV),
    .io_in_valid(io_in_valid),
    `MAP_QSV_OUT_PORTS(_m_io_out),
    .io_out_valid(_m_io_out_valid)
  );

  // Stage 1: Hadamard Gate on Qubit 0
  HGate5QubitVector8bit m_1 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_io_out),
    .io_in_valid(_m_io_out_valid),
    `MAP_QSV_OUT_PORTS(_m_1_io_out),
    .io_out_valid(_m_1_io_out_valid)
  );

  // Stage 2: Permutation Layer
  CompatiblePerm_1 m_2 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_1_io_out),
    .io_in_valid(_m_1_io_out_valid),
    `MAP_QSV_OUT_PORTS(_m_2_io_out),
    .io_out_valid(_m_2_io_out_valid)
  );

  // Stage 3: Permutation Layer
  CompatiblePerm_2 m_3 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_2_io_out),
    .io_in_valid(_m_2_io_out_valid),
    `MAP_QSV_OUT_PORTS(_m_3_io_out),
    .io_out_valid(_m_3_io_out_valid)
  );

  // Stage 4: Controlled-Not Gate 1 (cx(0,1))
  CNGate5QubitVector8bit m_4 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_3_io_out),
    .io_in_valid(_m_3_io_out_valid),
    `MAP_QSV_OUT_PORTS(_m_4_io_out),
    .io_out_valid(_m_4_io_out_valid)
  );

  // Stage 5: Permutation Layer
  CompatiblePerm_3 m_5 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_4_io_out),
    .io_in_valid(_m_4_io_out_valid),
    `MAP_QSV_OUT_PORTS(_m_5_io_out),
    .io_out_valid(_m_5_io_out_valid)
  );

  // Stage 6: Permutation Layer
  CompatiblePerm_4 m_6 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_5_io_out),
    .io_in_valid(_m_5_io_out_valid),
    `MAP_QSV_OUT_PORTS(_m_6_io_out),
    .io_out_valid(_m_6_io_out_valid)
  );

  // Stage 7: Controlled-Not Gate 2 (cx(1,2))
  CNGate5QubitVector8bit m_7 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_6_io_out),
    .io_in_valid(_m_6_io_out_valid),
    `MAP_QSV_OUT_PORTS(_m_7_io_out),
    .io_out_valid(_m_7_io_out_valid)
  );

  // Stage 8: Permutation Layer
  CompatiblePerm_5 m_8 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_7_io_out),
    .io_in_valid(_m_7_io_out_valid),
    `MAP_QSV_OUT_PORTS(_m_8_io_out),
    .io_out_valid(_m_8_io_out_valid)
  );

  // Stage 9: Permutation Layer
  CompatiblePerm_6 m_9 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_8_io_out),
    .io_in_valid(_m_8_io_out_valid),
    `MAP_QSV_OUT_PORTS(_m_9_io_out),
    .io_out_valid(_m_9_io_out_valid)
  );

  // Stage 10: Controlled-Not Gate 3 (cx(2,3))
  CNGate5QubitVector8bit m_10 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_9_io_out),
    .io_in_valid(_m_9_io_out_valid),
    `MAP_QSV_OUT_PORTS(_m_10_io_out),
    .io_out_valid(_m_10_io_out_valid)
  );

  // Stage 11: Permutation Layer
  CompatiblePerm_7 m_11 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_10_io_out),
    .io_in_valid(_m_10_io_out_valid),
    `MAP_QSV_OUT_PORTS(_m_11_io_out),
    .io_out_valid(_m_11_io_out_valid)
  );

  // Stage 12: Permutation Layer
  CompatiblePerm_8 m_12 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_11_io_out),
    .io_in_valid(_m_11_io_out_valid),
    `MAP_QSV_OUT_PORTS(_m_12_io_out),
    .io_out_valid(_m_12_io_out_valid)
  );

  // Stage 13: Controlled-Not Gate 4 (cx(3,4))
  CNGate5QubitVector8bit m_13 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_12_io_out),
    .io_in_valid(_m_12_io_out_valid),
    `MAP_QSV_OUT_PORTS(_m_13_io_out),
    .io_out_valid(_m_13_io_out_valid)
  );

  // Stage 14: Permutation Layer
  CompatiblePerm_9 m_14 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_13_io_out),
    .io_in_valid(_m_13_io_out_valid),
    `MAP_QSV_OUT_PORTS(_m_14_io_out),
    .io_out_valid(_m_14_io_out_valid)
  );

  // Stage 15: Permutation Layer (Final Restore to Canonical Order)
  CompatiblePerm_10 m_15 (
    .clock(clock),
    .reset(reset),
    `MAP_QSV_PORTS(_m_14_io_out),
    .io_in_valid(_m_14_io_out_valid),
    `MAP_QSV_OUT_PORTS(io_out_QSV),
    .io_out_valid(io_out_valid)
  );

  `undef MAP_QSV_PORTS
  `undef MAP_QSV_OUT_PORTS

endmodule
