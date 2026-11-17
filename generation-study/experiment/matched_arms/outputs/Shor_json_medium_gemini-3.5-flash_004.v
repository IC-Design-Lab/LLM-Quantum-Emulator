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

  `define DEF_WIRES(prefix) \
  logic [7:0] prefix``QSV_0_0, prefix``QSV_0_1, prefix``QSV_1_0, prefix``QSV_1_1, \
              prefix``QSV_2_0, prefix``QSV_2_1, prefix``QSV_3_0, prefix``QSV_3_1, \
              prefix``QSV_4_0, prefix``QSV_4_1, prefix``QSV_5_0, prefix``QSV_5_1, \
              prefix``QSV_6_0, prefix``QSV_6_1, prefix``QSV_7_0, prefix``QSV_7_1, \
              prefix``QSV_8_0, prefix``QSV_8_1, prefix``QSV_9_0, prefix``QSV_9_1, \
              prefix``QSV_10_0, prefix``QSV_10_1, prefix``QSV_11_0, prefix``QSV_11_1, \
              prefix``QSV_12_0, prefix``QSV_12_1, prefix``QSV_13_0, prefix``QSV_13_1, \
              prefix``QSV_14_0, prefix``QSV_14_1, prefix``QSV_15_0, prefix``QSV_15_1, \
              prefix``QSV_16_0, prefix``QSV_16_1, prefix``QSV_17_0, prefix``QSV_17_1, \
              prefix``QSV_18_0, prefix``QSV_18_1, prefix``QSV_19_0, prefix``QSV_19_1, \
              prefix``QSV_20_0, prefix``QSV_20_1, prefix``QSV_21_0, prefix``QSV_21_1, \
              prefix``QSV_22_0, prefix``QSV_22_1, prefix``QSV_23_0, prefix``QSV_23_1, \
              prefix``QSV_24_0, prefix``QSV_24_1, prefix``QSV_25_0, prefix``QSV_25_1, \
              prefix``QSV_26_0, prefix``QSV_26_1, prefix``QSV_27_0, prefix``QSV_27_1, \
              prefix``QSV_28_0, prefix``QSV_28_1, prefix``QSV_29_0, prefix``QSV_29_1, \
              prefix``QSV_30_0, prefix``QSV_30_1, prefix``QSV_31_0, prefix``QSV_31_1; \
  logic       prefix``valid;

  `DEF_WIRES(_m_io_out_)
  `DEF_WIRES(_m_1_io_out_)
  `DEF_WIRES(_m_2_io_out_)
  `DEF_WIRES(_m_3_io_out_)
  `DEF_WIRES(_m_4_io_out_)
  `DEF_WIRES(_m_5_io_out_)
  `DEF_WIRES(_m_6_io_out_)
  `DEF_WIRES(_m_7_io_out_)
  `DEF_WIRES(_m_8_io_out_)
  `DEF_WIRES(_m_9_io_out_)
  `DEF_WIRES(_m_10_io_out_)
  `DEF_WIRES(_m_11_io_out_)
  `DEF_WIRES(_m_12_io_out_)
  `DEF_WIRES(_m_13_io_out_)
  `DEF_WIRES(_m_14_io_out_)

  `undef DEF_WIRES

  `define MAP_INPUTS(prefix) \
    .io_in_QSV_0_0(prefix``QSV_0_0), .io_in_QSV_0_1(prefix``QSV_0_1), \
    .io_in_QSV_1_0(prefix``QSV_1_0), .io_in_QSV_1_1(prefix``QSV_1_1), \
    .io_in_QSV_2_0(prefix``QSV_2_0), .io_in_QSV_2_1(prefix``QSV_2_1), \
    .io_in_QSV_3_0(prefix``QSV_3_0), .io_in_QSV_3_1(prefix``QSV_3_1), \
    .io_in_QSV_4_0(prefix``QSV_4_0), .io_in_QSV_4_1(prefix``QSV_4_1), \
    .io_in_QSV_5_0(prefix``QSV_5_0), .io_in_QSV_5_1(prefix``QSV_5_1), \
    .io_in_QSV_6_0(prefix``QSV_6_0), .io_in_QSV_6_1(prefix``QSV_6_1), \
    .io_in_QSV_7_0(prefix``QSV_7_0), .io_in_QSV_7_1(prefix``QSV_7_1), \
    .io_in_QSV_8_0(prefix``QSV_8_0), .io_in_QSV_8_1(prefix``QSV_8_1), \
    .io_in_QSV_9_0(prefix``QSV_9_0), .io_in_QSV_9_1(prefix``QSV_9_1), \
    .io_in_QSV_10_0(prefix``QSV_10_0), .io_in_QSV_10_1(prefix``QSV_10_1), \
    .io_in_QSV_11_0(prefix``QSV_11_0), .io_in_QSV_11_1(prefix``QSV_11_1), \
    .io_in_QSV_12_0(prefix``QSV_12_0), .io_in_QSV_12_1(prefix``QSV_12_1), \
    .io_in_QSV_13_0(prefix``QSV_13_0), .io_in_QSV_13_1(prefix``QSV_13_1), \
    .io_in_QSV_14_0(prefix``QSV_14_0), .io_in_QSV_14_1(prefix``QSV_14_1), \
    .io_in_QSV_15_0(prefix``QSV_15_0), .io_in_QSV_15_1(prefix``QSV_15_1), \
    .io_in_QSV_16_0(prefix``QSV_16_0), .io_in_QSV_16_1(prefix``QSV_16_1), \
    .io_in_QSV_17_0(prefix``QSV_17_0), .io_in_QSV_17_1(prefix``QSV_17_1), \
    .io_in_QSV_18_0(prefix``QSV_18_0), .io_in_QSV_18_1(prefix``QSV_18_1), \
    .io_in_QSV_19_0(prefix``QSV_19_0), .io_in_QSV_19_1(prefix``QSV_19_1), \
    .io_in_QSV_20_0(prefix``QSV_20_0), .io_in_QSV_20_1(prefix``QSV_20_1), \
    .io_in_QSV_21_0(prefix``QSV_21_0), .io_in_QSV_21_1(prefix``QSV_21_1), \
    .io_in_QSV_22_0(prefix``QSV_22_0), .io_in_QSV_22_1(prefix``QSV_22_1), \
    .io_in_QSV_23_0(prefix``QSV_23_0), .io_in_QSV_23_1(prefix``QSV_23_1), \
    .io_in_QSV_24_0(prefix``QSV_24_0), .io_in_QSV_24_1(prefix``QSV_24_1), \
    .io_in_QSV_25_0(prefix``QSV_25_0), .io_in_QSV_25_1(prefix``QSV_25_1), \
    .io_in_QSV_26_0(prefix``QSV_26_0), .io_in_QSV_26_1(prefix``QSV_26_1), \
    .io_in_QSV_27_0(prefix``QSV_27_0), .io_in_QSV_27_1(prefix``QSV_27_1), \
    .io_in_QSV_28_0(prefix``QSV_28_0), .io_in_QSV_28_1(prefix``QSV_28_1), \
    .io_in_QSV_29_0(prefix``QSV_29_0), .io_in_QSV_29_1(prefix``QSV_29_1), \
    .io_in_QSV_30_0(prefix``QSV_30_0), .io_in_QSV_30_1(prefix``QSV_30_1), \
    .io_in_QSV_31_0(prefix``QSV_31_0), .io_in_QSV_31_1(prefix``QSV_31_1), \
    .io_in_valid(prefix``valid)

  `define MAP_OUTPUTS(prefix) \
    .io_out_QSV_0_0(prefix``QSV_0_0), .io_out_QSV_0_1(prefix``QSV_0_1), \
    .io_out_QSV_1_0(prefix``QSV_1_0), .io_out_QSV_1_1(prefix``QSV_1_1), \
    .io_out_QSV_2_0(prefix``QSV_2_0), .io_out_QSV_2_1(prefix``QSV_2_1), \
    .io_out_QSV_3_0(prefix``QSV_3_0), .io_out_QSV_3_1(prefix``QSV_3_1), \
    .io_out_QSV_4_0(prefix``QSV_4_0), .io_out_QSV_4_1(prefix``QSV_4_1), \
    .io_out_QSV_5_0(prefix``QSV_5_0), .io_out_QSV_5_1(prefix``QSV_5_1), \
    .io_out_QSV_6_0(prefix``QSV_6_0), .io_out_QSV_6_1(prefix``QSV_6_1), \
    .io_out_QSV_7_0(prefix``QSV_7_0), .io_out_QSV_7_1(prefix``QSV_7_1), \
    .io_out_QSV_8_0(prefix``QSV_8_0), .io_out_QSV_8_1(prefix``QSV_8_1), \
    .io_out_QSV_9_0(prefix``QSV_9_0), .io_out_QSV_9_1(prefix``QSV_9_1), \
    .io_out_QSV_10_0(prefix``QSV_10_0), .io_out_QSV_10_1(prefix``QSV_10_1), \
    .io_out_QSV_11_0(prefix``QSV_11_0), .io_out_QSV_11_1(prefix``QSV_11_1), \
    .io_out_QSV_12_0(prefix``QSV_12_0), .io_out_QSV_12_1(prefix``QSV_12_1), \
    .io_out_QSV_13_0(prefix``QSV_13_0), .io_out_QSV_13_1(prefix``QSV_13_1), \
    .io_out_QSV_14_0(prefix``QSV_14_0), .io_out_QSV_14_1(prefix``QSV_14_1), \
    .io_out_QSV_15_0(prefix``QSV_15_0), .io_out_QSV_15_1(prefix``QSV_15_1), \
    .io_out_QSV_16_0(prefix``QSV_16_0), .io_out_QSV_16_1(prefix``QSV_16_1), \
    .io_out_QSV_17_0(prefix``QSV_17_0), .io_out_QSV_17_1(prefix``QSV_17_1), \
    .io_out_QSV_18_0(prefix``QSV_18_0), .io_out_QSV_18_1(prefix``QSV_18_1), \
    .io_out_QSV_19_0(prefix``QSV_19_0), .io_out_QSV_19_1(prefix``QSV_19_1), \
    .io_out_QSV_20_0(prefix``QSV_20_0), .io_out_QSV_20_1(prefix``QSV_20_1), \
    .io_out_QSV_21_0(prefix``QSV_21_0), .io_out_QSV_21_1(prefix``QSV_21_1), \
    .io_out_QSV_22_0(prefix``QSV_22_0), .io_out_QSV_22_1(prefix``QSV_22_1), \
    .io_out_QSV_23_0(prefix``QSV_23_0), .io_out_QSV_23_1(prefix``QSV_23_1), \
    .io_out_QSV_24_0(prefix``QSV_24_0), .io_out_QSV_24_1(prefix``QSV_24_1), \
    .io_out_QSV_25_0(prefix``QSV_25_0), .io_out_QSV_25_1(prefix``QSV_25_1), \
    .io_out_QSV_26_0(prefix``QSV_26_0), .io_out_QSV_26_1(prefix``QSV_26_1), \
    .io_out_QSV_27_0(prefix``QSV_27_0), .io_out_QSV_27_1(prefix``QSV_27_1), \
    .io_out_QSV_28_0(prefix``QSV_28_0), .io_out_QSV_28_1(prefix``QSV_28_1), \
    .io_out_QSV_29_0(prefix``QSV_29_0), .io_out_QSV_29_1(prefix``QSV_29_1), \
    .io_out_QSV_30_0(prefix``QSV_30_0), .io_out_QSV_30_1(prefix``QSV_30_1), \
    .io_out_QSV_31_0(prefix``QSV_31_0), .io_out_QSV_31_1(prefix``QSV_31_1), \
    .io_out_valid(prefix``valid)

  HGate5QubitVector8bit m (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(io_in_),
    `MAP_OUTPUTS(_m_io_out_)
  );

  CompatiblePerm m_1 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_io_out_),
    `MAP_OUTPUTS(_m_1_io_out_)
  );

  CNGate5QubitVector8bit m_2 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_1_io_out_),
    `MAP_OUTPUTS(_m_2_io_out_)
  );

  CompatiblePerm_1 m_3 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_2_io_out_),
    `MAP_OUTPUTS(_m_3_io_out_)
  );

  CompatiblePerm_2 m_4 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_3_io_out_),
    `MAP_OUTPUTS(_m_4_io_out_)
  );

  CNGate5QubitVector8bit m_5 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_4_io_out_),
    `MAP_OUTPUTS(_m_5_io_out_)
  );

  CompatiblePerm_3 m_6 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_5_io_out_),
    `MAP_OUTPUTS(_m_6_io_out_)
  );

  CompatiblePerm_4 m_7 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_6_io_out_),
    `MAP_OUTPUTS(_m_7_io_out_)
  );

  CNGate5QubitVector8bit m_8 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_7_io_out_),
    `MAP_OUTPUTS(_m_8_io_out_)
  );

  CompatiblePerm_5 m_9 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_8_io_out_),
    `MAP_OUTPUTS(_m_9_io_out_)
  );

  CompatiblePerm_6 m_10 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_9_io_out_),
    `MAP_OUTPUTS(_m_10_io_out_)
  );

  CNGate5QubitVector8bit m_11 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_10_io_out_),
    `MAP_OUTPUTS(_m_11_io_out_)
  );

  CompatiblePerm_7 m_12 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_11_io_out_),
    `MAP_OUTPUTS(_m_12_io_out_)
  );

  CompatiblePerm_8 m_13 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_12_io_out_),
    `MAP_OUTPUTS(_m_13_io_out_)
  );

  CompatiblePerm_9 m_14 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_13_io_out_),
    `MAP_OUTPUTS(_m_14_io_out_)
  );

  CompatiblePerm_10 m_15 (
    .clock(clock),
    .reset(reset),
    `MAP_INPUTS(_m_14_io_out_),
    `MAP_OUTPUTS(io_out_)
  );

  `undef MAP_INPUTS
  `undef MAP_OUTPUTS

endmodule
