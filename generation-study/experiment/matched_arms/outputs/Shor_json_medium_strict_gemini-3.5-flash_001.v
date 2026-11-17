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

  // Intermediate wires declaration macro-like sequence
  `define DECLARE_STAGE_WIRES(prefix) \
    wire [7:0] prefix``_QSV_0_0, prefix``_QSV_0_1, prefix``_QSV_1_0, prefix``_QSV_1_1, \
               prefix``_QSV_2_0, prefix``_QSV_2_1, prefix``_QSV_3_0, prefix``_QSV_3_1, \
               prefix``_QSV_4_0, prefix``_QSV_4_1, prefix``_QSV_5_0, prefix``_QSV_5_1, \
               prefix``_QSV_6_0, prefix``_QSV_6_1, prefix``_QSV_7_0, prefix``_QSV_7_1, \
               prefix``_QSV_8_0, prefix``_QSV_8_1, prefix``_QSV_9_0, prefix``_QSV_9_1, \
               prefix``_QSV_10_0, prefix``_QSV_10_1, prefix``_QSV_11_0, prefix``_QSV_11_1, \
               prefix``_QSV_12_0, prefix``_QSV_12_1, prefix``_QSV_13_0, prefix``_QSV_13_1, \
               prefix``_QSV_14_0, prefix``_QSV_14_1, prefix``_QSV_15_0, prefix``_QSV_15_1, \
               prefix``_QSV_16_0, prefix``_QSV_16_1, prefix``_QSV_17_0, prefix``_QSV_17_1, \
               prefix``_QSV_18_0, prefix``_QSV_18_1, prefix``_QSV_19_0, prefix``_QSV_19_1, \
               prefix``_QSV_20_0, prefix``_QSV_20_1, prefix``_QSV_21_0, prefix``_QSV_21_1, \
               prefix``_QSV_22_0, prefix``_QSV_22_1, prefix``_QSV_23_0, prefix``_QSV_23_1, \
               prefix``_QSV_24_0, prefix``_QSV_24_1, prefix``_QSV_25_0, prefix``_QSV_25_1, \
               prefix``_QSV_26_0, prefix``_QSV_26_1, prefix``_QSV_27_0, prefix``_QSV_27_1, \
               prefix``_QSV_28_0, prefix``_QSV_28_1, prefix``_QSV_29_0, prefix``_QSV_29_1, \
               prefix``_QSV_30_0, prefix``_QSV_30_1, prefix``_QSV_31_0, prefix``_QSV_31_1; \
    wire prefix``_valid;

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

  `undef DECLARE_STAGE_WIRES

  // Macro to connect ports easily
  `define CONNECT_PORTS(prefix) \
    .io_in_QSV_0_0(prefix``_QSV_0_0), .io_in_QSV_0_1(prefix``_QSV_0_1), \
    .io_in_QSV_1_0(prefix``_QSV_1_0), .io_in_QSV_1_1(prefix``_QSV_1_1), \
    .io_in_QSV_2_0(prefix``_QSV_2_0), .io_in_QSV_2_1(prefix``_QSV_2_1), \
    .io_in_QSV_3_0(prefix``_QSV_3_0), .io_in_QSV_3_1(prefix``_QSV_3_1), \
    .io_in_QSV_4_0(prefix``_QSV_4_0), .io_in_QSV_4_1(prefix``_QSV_4_1), \
    .io_in_QSV_5_0(prefix``_QSV_5_0), .io_in_QSV_5_1(prefix``_QSV_5_1), \
    .io_in_QSV_6_0(prefix``_QSV_6_0), .io_in_QSV_6_1(prefix``_QSV_6_1), \
    .io_in_QSV_7_0(prefix``_QSV_7_0), .io_in_QSV_7_1(prefix``_QSV_7_1), \
    .io_in_QSV_8_0(prefix``_QSV_8_0), .io_in_QSV_8_1(prefix``_QSV_8_1), \
    .io_in_QSV_9_0(prefix``_QSV_9_0), .io_in_QSV_9_1(prefix``_QSV_9_1), \
    .io_in_QSV_10_0(prefix``_QSV_10_0), .io_in_QSV_10_1(prefix``_QSV_10_1), \
    .io_in_QSV_11_0(prefix``_QSV_11_0), .io_in_QSV_11_1(prefix``_QSV_11_1), \
    .io_in_QSV_12_0(prefix``_QSV_12_0), .io_in_QSV_12_1(prefix``_QSV_12_1), \
    .io_in_QSV_13_0(prefix``_QSV_13_0), .io_in_QSV_13_1(prefix``_QSV_13_1), \
    .io_in_QSV_14_0(prefix``_QSV_14_0), .io_in_QSV_14_1(prefix``_QSV_14_1), \
    .io_in_QSV_15_0(prefix``_QSV_15_0), .io_in_QSV_15_1(prefix``_QSV_15_1), \
    .io_in_QSV_16_0(prefix``_QSV_16_0), .io_in_QSV_16_1(prefix``_QSV_16_1), \
    .io_in_QSV_17_0(prefix``_QSV_17_0), .io_in_QSV_17_1(prefix``_QSV_17_1), \
    .io_in_QSV_18_0(prefix``_QSV_18_0), .io_in_QSV_18_1(prefix``_QSV_18_1), \
    .io_in_QSV_19_0(prefix``_QSV_19_0), .io_in_QSV_19_1(prefix``_QSV_19_1), \
    .io_in_QSV_20_0(prefix``_QSV_20_0), .io_in_QSV_20_1(prefix``_QSV_20_1), \
    .io_in_QSV_21_0(prefix``_QSV_21_0), .io_in_QSV_21_1(prefix``_QSV_21_1), \
    .io_in_QSV_22_0(prefix``_QSV_22_0), .io_in_QSV_22_1(prefix``_QSV_22_1), \
    .io_in_QSV_23_0(prefix``_QSV_23_0), .io_in_QSV_23_1(prefix``_QSV_23_1), \
    .io_in_QSV_24_0(prefix``_QSV_24_0), .io_in_QSV_24_1(prefix``_QSV_24_1), \
    .io_in_QSV_25_0(prefix``_QSV_25_0), .io_in_QSV_25_1(prefix``_QSV_25_1), \
    .io_in_QSV_26_0(prefix``_QSV_26_0), .io_in_QSV_26_1(prefix``_QSV_26_1), \
    .io_in_QSV_27_0(prefix``_QSV_27_0), .io_in_QSV_27_1(prefix``_QSV_27_1), \
    .io_in_QSV_28_0(prefix``_QSV_28_0), .io_in_QSV_28_1(prefix``_QSV_28_1), \
    .io_in_QSV_29_0(prefix``_QSV_29_0), .io_in_QSV_29_1(prefix``_QSV_29_1), \
    .io_in_QSV_30_0(prefix``_QSV_30_0), .io_in_QSV_30_1(prefix``_QSV_30_1), \
    .io_in_QSV_31_0(prefix``_QSV_31_0), .io_in_QSV_31_1(prefix``_QSV_31_1), \
    .io_in_valid(prefix``_valid)

  `define CONNECT_OUT_PORTS(prefix) \
    .io_out_QSV_0_0(prefix``_QSV_0_0), .io_out_QSV_0_1(prefix``_QSV_0_1), \
    .io_out_QSV_1_0(prefix``_QSV_1_0), .io_out_QSV_1_1(prefix``_QSV_1_1), \
    .io_out_QSV_2_0(prefix``_QSV_2_0), .io_out_QSV_2_1(prefix``_QSV_2_1), \
    .io_out_QSV_3_0(prefix``_QSV_3_0), .io_out_QSV_3_1(prefix``_QSV_3_1), \
    .io_out_QSV_4_0(prefix``_QSV_4_0), .io_out_QSV_4_1(prefix``_QSV_4_1), \
    .io_out_QSV_5_0(prefix``_QSV_5_0), .io_out_QSV_5_1(prefix``_QSV_5_1), \
    .io_out_QSV_6_0(prefix``_QSV_6_0), .io_out_QSV_6_1(prefix``_QSV_6_1), \
    .io_out_QSV_7_0(prefix``_QSV_7_0), .io_out_QSV_7_1(prefix``_QSV_7_1), \
    .io_out_QSV_8_0(prefix``_QSV_8_0), .io_out_QSV_8_1(prefix``_QSV_8_1), \
    .io_out_QSV_9_0(prefix``_QSV_9_0), .io_out_QSV_9_1(prefix``_QSV_9_1), \
    .io_out_QSV_10_0(prefix``_QSV_10_0), .io_out_QSV_10_1(prefix``_QSV_10_1), \
    .io_out_QSV_11_0(prefix``_QSV_11_0), .io_out_QSV_11_1(prefix``_QSV_11_1), \
    .io_out_QSV_12_0(prefix``_QSV_12_0), .io_out_QSV_12_1(prefix``_QSV_12_1), \
    .io_out_QSV_13_0(prefix``_QSV_13_0), .io_out_QSV_13_1(prefix``_QSV_13_1), \
    .io_out_QSV_14_0(prefix``_QSV_14_0), .io_out_QSV_14_1(prefix``_QSV_14_1), \
    .io_out_QSV_15_0(prefix``_QSV_15_0), .io_out_QSV_15_1(prefix``_QSV_15_1), \
    .io_out_QSV_16_0(prefix``_QSV_16_0), .io_out_QSV_16_1(prefix``_QSV_16_1), \
    .io_out_QSV_17_0(prefix``_QSV_17_0), .io_out_QSV_17_1(prefix``_QSV_17_1), \
    .io_out_QSV_18_0(prefix``_QSV_18_0), .io_out_QSV_18_1(prefix``_QSV_18_1), \
    .io_out_QSV_19_0(prefix``_QSV_19_0), .io_out_QSV_19_1(prefix``_QSV_19_1), \
    .io_out_QSV_20_0(prefix``_QSV_20_0), .io_out_QSV_20_1(prefix``_QSV_20_1), \
    .io_out_QSV_21_0(prefix``_QSV_21_0), .io_out_QSV_21_1(prefix``_QSV_21_1), \
    .io_out_QSV_22_0(prefix``_QSV_22_0), .io_out_QSV_22_1(prefix``_QSV_22_1), \
    .io_out_QSV_23_0(prefix``_QSV_23_0), .io_out_QSV_23_1(prefix``_QSV_23_1), \
    .io_out_QSV_24_0(prefix``_QSV_24_0), .io_out_QSV_24_1(prefix``_QSV_24_1), \
    .io_out_QSV_25_0(prefix``_QSV_25_0), .io_out_QSV_25_1(prefix``_QSV_25_1), \
    .io_out_QSV_26_0(prefix``_QSV_26_0), .io_out_QSV_26_1(prefix``_QSV_26_1), \
    .io_out_QSV_27_0(prefix``_QSV_27_0), .io_out_QSV_27_1(prefix``_QSV_27_1), \
    .io_out_QSV_28_0(prefix``_QSV_28_0), .io_out_QSV_28_1(prefix``_QSV_28_1), \
    .io_out_QSV_29_0(prefix``_QSV_29_0), .io_out_QSV_29_1(prefix``_QSV_29_1), \
    .io_out_QSV_30_0(prefix``_QSV_30_0), .io_out_QSV_30_1(prefix``_QSV_30_1), \
    .io_out_QSV_31_0(prefix``_QSV_31_0), .io_out_QSV_31_1(prefix``_QSV_31_1), \
    .io_out_valid(prefix``_valid)

  // Stage 0: Hadamard on q0
  HGate5QubitVector8bit m (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(io_in),
    `CONNECT_OUT_PORTS(_m_io_out)
  );

  // Stage 1: CNOT q0 -> q1
  CNGate5QubitVector8bit m_1 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_io_out),
    `CONNECT_OUT_PORTS(_m_1_io_out)
  );

  // Stage 2: Permute before CNOT q1 -> q2
  CompatiblePerm m_2 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_1_io_out),
    `CONNECT_OUT_PORTS(_m_2_io_out)
  );

  // Stage 3: CNOT q1 -> q2 (default layout after perm)
  CNGate5QubitVector8bit m_3 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_2_io_out),
    `CONNECT_OUT_PORTS(_m_3_io_out)
  );

  // Stage 4: Un-permute after CNOT q1 -> q2
  CompatiblePerm_1 m_4 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_3_io_out),
    `CONNECT_OUT_PORTS(_m_4_io_out)
  );

  // Stage 5: Permute before CNOT q2 -> q3
  CompatiblePerm_2 m_5 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_4_io_out),
    `CONNECT_OUT_PORTS(_m_5_io_out)
  );

  // Stage 6: CNOT q2 -> q3 (default layout after perm)
  CNGate5QubitVector8bit m_6 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_5_io_out),
    `CONNECT_OUT_PORTS(_m_6_io_out)
  );

  // Stage 7: Un-permute after CNOT q2 -> q3
  CompatiblePerm_3 m_7 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_6_io_out),
    `CONNECT_OUT_PORTS(_m_7_io_out)
  );

  // Stage 8: Permute before CNOT q3 -> q4
  CompatiblePerm_4 m_8 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_7_io_out),
    `CONNECT_OUT_PORTS(_m_8_io_out)
  );

  // Stage 9: CNOT q3 -> q4 (default layout after perm)
  CNGate5QubitVector8bit m_9 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_8_io_out),
    `CONNECT_OUT_PORTS(_m_9_io_out)
  );

  // Stage 10: Un-permute after CNOT q3 -> q4 to original state
  CompatiblePerm_5 m_10 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_9_io_out),
    `CONNECT_OUT_PORTS(io_out)
  );

  `undef CONNECT_PORTS
  `undef CONNECT_OUT_PORTS

endmodule
