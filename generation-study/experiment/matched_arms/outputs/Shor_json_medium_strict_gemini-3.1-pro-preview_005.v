`define DECLARE_QSV_WIRES(prefix) \
  wire [7:0] prefix``_0_0, prefix``_0_1, prefix``_1_0, prefix``_1_1, \
             prefix``_2_0, prefix``_2_1, prefix``_3_0, prefix``_3_1, \
             prefix``_4_0, prefix``_4_1, prefix``_5_0, prefix``_5_1, \
             prefix``_6_0, prefix``_6_1, prefix``_7_0, prefix``_7_1, \
             prefix``_8_0, prefix``_8_1, prefix``_9_0, prefix``_9_1, \
             prefix``_10_0, prefix``_10_1, prefix``_11_0, prefix``_11_1, \
             prefix``_12_0, prefix``_12_1, prefix``_13_0, prefix``_13_1, \
             prefix``_14_0, prefix``_14_1, prefix``_15_0, prefix``_15_1, \
             prefix``_16_0, prefix``_16_1, prefix``_17_0, prefix``_17_1, \
             prefix``_18_0, prefix``_18_1, prefix``_19_0, prefix``_19_1, \
             prefix``_20_0, prefix``_20_1, prefix``_21_0, prefix``_21_1, \
             prefix``_22_0, prefix``_22_1, prefix``_23_0, prefix``_23_1, \
             prefix``_24_0, prefix``_24_1, prefix``_25_0, prefix``_25_1, \
             prefix``_26_0, prefix``_26_1, prefix``_27_0, prefix``_27_1, \
             prefix``_28_0, prefix``_28_1, prefix``_29_0, prefix``_29_1, \
             prefix``_30_0, prefix``_30_1, prefix``_31_0, prefix``_31_1;

`define MAP_QSV_IN(src) \
  .io_in_QSV_0_0(src``_0_0), .io_in_QSV_0_1(src``_0_1), \
  .io_in_QSV_1_0(src``_1_0), .io_in_QSV_1_1(src``_1_1), \
  .io_in_QSV_2_0(src``_2_0), .io_in_QSV_2_1(src``_2_1), \
  .io_in_QSV_3_0(src``_3_0), .io_in_QSV_3_1(src``_3_1), \
  .io_in_QSV_4_0(src``_4_0), .io_in_QSV_4_1(src``_4_1), \
  .io_in_QSV_5_0(src``_5_0), .io_in_QSV_5_1(src``_5_1), \
  .io_in_QSV_6_0(src``_6_0), .io_in_QSV_6_1(src``_6_1), \
  .io_in_QSV_7_0(src``_7_0), .io_in_QSV_7_1(src``_7_1), \
  .io_in_QSV_8_0(src``_8_0), .io_in_QSV_8_1(src``_8_1), \
  .io_in_QSV_9_0(src``_9_0), .io_in_QSV_9_1(src``_9_1), \
  .io_in_QSV_10_0(src``_10_0), .io_in_QSV_10_1(src``_10_1), \
  .io_in_QSV_11_0(src``_11_0), .io_in_QSV_11_1(src``_11_1), \
  .io_in_QSV_12_0(src``_12_0), .io_in_QSV_12_1(src``_12_1), \
  .io_in_QSV_13_0(src``_13_0), .io_in_QSV_13_1(src``_13_1), \
  .io_in_QSV_14_0(src``_14_0), .io_in_QSV_14_1(src``_14_1), \
  .io_in_QSV_15_0(src``_15_0), .io_in_QSV_15_1(src``_15_1), \
  .io_in_QSV_16_0(src``_16_0), .io_in_QSV_16_1(src``_16_1), \
  .io_in_QSV_17_0(src``_17_0), .io_in_QSV_17_1(src``_17_1), \
  .io_in_QSV_18_0(src``_18_0), .io_in_QSV_18_1(src``_18_1), \
  .io_in_QSV_19_0(src``_19_0), .io_in_QSV_19_1(src``_19_1), \
  .io_in_QSV_20_0(src``_20_0), .io_in_QSV_20_1(src``_20_1), \
  .io_in_QSV_21_0(src``_21_0), .io_in_QSV_21_1(src``_21_1), \
  .io_in_QSV_22_0(src``_22_0), .io_in_QSV_22_1(src``_22_1), \
  .io_in_QSV_23_0(src``_23_0), .io_in_QSV_23_1(src``_23_1), \
  .io_in_QSV_24_0(src``_24_0), .io_in_QSV_24_1(src``_24_1), \
  .io_in_QSV_25_0(src``_25_0), .io_in_QSV_25_1(src``_25_1), \
  .io_in_QSV_26_0(src``_26_0), .io_in_QSV_26_1(src``_26_1), \
  .io_in_QSV_27_0(src``_27_0), .io_in_QSV_27_1(src``_27_1), \
  .io_in_QSV_28_0(src``_28_0), .io_in_QSV_28_1(src``_28_1), \
  .io_in_QSV_29_0(src``_29_0), .io_in_QSV_29_1(src``_29_1), \
  .io_in_QSV_30_0(src``_30_0), .io_in_QSV_30_1(src``_30_1), \
  .io_in_QSV_31_0(src``_31_0), .io_in_QSV_31_1(src``_31_1)

`define MAP_QSV_OUT(dst) \
  .io_out_QSV_0_0(dst``_0_0), .io_out_QSV_0_1(dst``_0_1), \
  .io_out_QSV_1_0(dst``_1_0), .io_out_QSV_1_1(dst``_1_1), \
  .io_out_QSV_2_0(dst``_2_0), .io_out_QSV_2_1(dst``_2_1), \
  .io_out_QSV_3_0(dst``_3_0), .io_out_QSV_3_1(dst``_3_1), \
  .io_out_QSV_4_0(dst``_4_0), .io_out_QSV_4_1(dst``_4_1), \
  .io_out_QSV_5_0(dst``_5_0), .io_out_QSV_5_1(dst``_5_1), \
  .io_out_QSV_6_0(dst``_6_0), .io_out_QSV_6_1(dst``_6_1), \
  .io_out_QSV_7_0(dst``_7_0), .io_out_QSV_7_1(dst``_7_1), \
  .io_out_QSV_8_0(dst``_8_0), .io_out_QSV_8_1(dst``_8_1), \
  .io_out_QSV_9_0(dst``_9_0), .io_out_QSV_9_1(dst``_9_1), \
  .io_out_QSV_10_0(dst``_10_0), .io_out_QSV_10_1(dst``_10_1), \
  .io_out_QSV_11_0(dst``_11_0), .io_out_QSV_11_1(dst``_11_1), \
  .io_out_QSV_12_0(dst``_12_0), .io_out_QSV_12_1(dst``_12_1), \
  .io_out_QSV_13_0(dst``_13_0), .io_out_QSV_13_1(dst``_13_1), \
  .io_out_QSV_14_0(dst``_14_0), .io_out_QSV_14_1(dst``_14_1), \
  .io_out_QSV_15_0(dst``_15_0), .io_out_QSV_15_1(dst``_15_1), \
  .io_out_QSV_16_0(dst``_16_0), .io_out_QSV_16_1(dst``_16_1), \
  .io_out_QSV_17_0(dst``_17_0), .io_out_QSV_17_1(dst``_17_1), \
  .io_out_QSV_18_0(dst``_18_0), .io_out_QSV_18_1(dst``_18_1), \
  .io_out_QSV_19_0(dst``_19_0), .io_out_QSV_19_1(dst``_19_1), \
  .io_out_QSV_20_0(dst``_20_0), .io_out_QSV_20_1(dst``_20_1), \
  .io_out_QSV_21_0(dst``_21_0), .io_out_QSV_21_1(dst``_21_1), \
  .io_out_QSV_22_0(dst``_22_0), .io_out_QSV_22_1(dst``_22_1), \
  .io_out_QSV_23_0(dst``_23_0), .io_out_QSV_23_1(dst``_23_1), \
  .io_out_QSV_24_0(dst``_24_0), .io_out_QSV_24_1(dst``_24_1), \
  .io_out_QSV_25_0(dst``_25_0), .io_out_QSV_25_1(dst``_25_1), \
  .io_out_QSV_26_0(dst``_26_0), .io_out_QSV_26_1(dst``_26_1), \
  .io_out_QSV_27_0(dst``_27_0), .io_out_QSV_27_1(dst``_27_1), \
  .io_out_QSV_28_0(dst``_28_0), .io_out_QSV_28_1(dst``_28_1), \
  .io_out_QSV_29_0(dst``_29_0), .io_out_QSV_29_1(dst``_29_1), \
  .io_out_QSV_30_0(dst``_30_0), .io_out_QSV_30_1(dst``_30_1), \
  .io_out_QSV_31_0(dst``_31_0), .io_out_QSV_31_1(dst``_31_1)


module Shor (
  input clock,
  input reset,
  input [7:0] io_in_QSV_0_0, input [7:0] io_in_QSV_0_1,
  input [7:0] io_in_QSV_1_0, input [7:0] io_in_QSV_1_1,
  input [7:0] io_in_QSV_2_0, input [7:0] io_in_QSV_2_1,
  input [7:0] io_in_QSV_3_0, input [7:0] io_in_QSV_3_1,
  input [7:0] io_in_QSV_4_0, input [7:0] io_in_QSV_4_1,
  input [7:0] io_in_QSV_5_0, input [7:0] io_in_QSV_5_1,
  input [7:0] io_in_QSV_6_0, input [7:0] io_in_QSV_6_1,
  input [7:0] io_in_QSV_7_0, input [7:0] io_in_QSV_7_1,
  input [7:0] io_in_QSV_8_0, input [7:0] io_in_QSV_8_1,
  input [7:0] io_in_QSV_9_0, input [7:0] io_in_QSV_9_1,
  input [7:0] io_in_QSV_10_0, input [7:0] io_in_QSV_10_1,
  input [7:0] io_in_QSV_11_0, input [7:0] io_in_QSV_11_1,
  input [7:0] io_in_QSV_12_0, input [7:0] io_in_QSV_12_1,
  input [7:0] io_in_QSV_13_0, input [7:0] io_in_QSV_13_1,
  input [7:0] io_in_QSV_14_0, input [7:0] io_in_QSV_14_1,
  input [7:0] io_in_QSV_15_0, input [7:0] io_in_QSV_15_1,
  input [7:0] io_in_QSV_16_0, input [7:0] io_in_QSV_16_1,
  input [7:0] io_in_QSV_17_0, input [7:0] io_in_QSV_17_1,
  input [7:0] io_in_QSV_18_0, input [7:0] io_in_QSV_18_1,
  input [7:0] io_in_QSV_19_0, input [7:0] io_in_QSV_19_1,
  input [7:0] io_in_QSV_20_0, input [7:0] io_in_QSV_20_1,
  input [7:0] io_in_QSV_21_0, input [7:0] io_in_QSV_21_1,
  input [7:0] io_in_QSV_22_0, input [7:0] io_in_QSV_22_1,
  input [7:0] io_in_QSV_23_0, input [7:0] io_in_QSV_23_1,
  input [7:0] io_in_QSV_24_0, input [7:0] io_in_QSV_24_1,
  input [7:0] io_in_QSV_25_0, input [7:0] io_in_QSV_25_1,
  input [7:0] io_in_QSV_26_0, input [7:0] io_in_QSV_26_1,
  input [7:0] io_in_QSV_27_0, input [7:0] io_in_QSV_27_1,
  input [7:0] io_in_QSV_28_0, input [7:0] io_in_QSV_28_1,
  input [7:0] io_in_QSV_29_0, input [7:0] io_in_QSV_29_1,
  input [7:0] io_in_QSV_30_0, input [7:0] io_in_QSV_30_1,
  input [7:0] io_in_QSV_31_0, input [7:0] io_in_QSV_31_1,
  input io_in_valid,
  
  output [7:0] io_out_QSV_0_0, output [7:0] io_out_QSV_0_1,
  output [7:0] io_out_QSV_1_0, output [7:0] io_out_QSV_1_1,
  output [7:0] io_out_QSV_2_0, output [7:0] io_out_QSV_2_1,
  output [7:0] io_out_QSV_3_0, output [7:0] io_out_QSV_3_1,
  output [7:0] io_out_QSV_4_0, output [7:0] io_out_QSV_4_1,
  output [7:0] io_out_QSV_5_0, output [7:0] io_out_QSV_5_1,
  output [7:0] io_out_QSV_6_0, output [7:0] io_out_QSV_6_1,
  output [7:0] io_out_QSV_7_0, output [7:0] io_out_QSV_7_1,
  output [7:0] io_out_QSV_8_0, output [7:0] io_out_QSV_8_1,
  output [7:0] io_out_QSV_9_0, output [7:0] io_out_QSV_9_1,
  output [7:0] io_out_QSV_10_0, output [7:0] io_out_QSV_10_1,
  output [7:0] io_out_QSV_11_0, output [7:0] io_out_QSV_11_1,
  output [7:0] io_out_QSV_12_0, output [7:0] io_out_QSV_12_1,
  output [7:0] io_out_QSV_13_0, output [7:0] io_out_QSV_13_1,
  output [7:0] io_out_QSV_14_0, output [7:0] io_out_QSV_14_1,
  output [7:0] io_out_QSV_15_0, output [7:0] io_out_QSV_15_1,
  output [7:0] io_out_QSV_16_0, output [7:0] io_out_QSV_16_1,
  output [7:0] io_out_QSV_17_0, output [7:0] io_out_QSV_17_1,
  output [7:0] io_out_QSV_18_0, output [7:0] io_out_QSV_18_1,
  output [7:0] io_out_QSV_19_0, output [7:0] io_out_QSV_19_1,
  output [7:0] io_out_QSV_20_0, output [7:0] io_out_QSV_20_1,
  output [7:0] io_out_QSV_21_0, output [7:0] io_out_QSV_21_1,
  output [7:0] io_out_QSV_22_0, output [7:0] io_out_QSV_22_1,
  output [7:0] io_out_QSV_23_0, output [7:0] io_out_QSV_23_1,
  output [7:0] io_out_QSV_24_0, output [7:0] io_out_QSV_24_1,
  output [7:0] io_out_QSV_25_0, output [7:0] io_out_QSV_25_1,
  output [7:0] io_out_QSV_26_0, output [7:0] io_out_QSV_26_1,
  output [7:0] io_out_QSV_27_0, output [7:0] io_out_QSV_27_1,
  output [7:0] io_out_QSV_28_0, output [7:0] io_out_QSV_28_1,
  output [7:0] io_out_QSV_29_0, output [7:0] io_out_QSV_29_1,
  output [7:0] io_out_QSV_30_0, output [7:0] io_out_QSV_30_1,
  output [7:0] io_out_QSV_31_0, output [7:0] io_out_QSV_31_1,
  output io_out_valid
);

  `DECLARE_QSV_WIRES(_m_io_out_QSV)
  wire _m_io_out_valid;
  
  `DECLARE_QSV_WIRES(_m_1_io_out_QSV)
  wire _m_1_io_out_valid;

  `DECLARE_QSV_WIRES(_m_2_io_out_QSV)
  wire _m_2_io_out_valid;

  `DECLARE_QSV_WIRES(_m_3_io_out_QSV)
  wire _m_3_io_out_valid;

  `DECLARE_QSV_WIRES(_m_4_io_out_QSV)
  wire _m_4_io_out_valid;

  `DECLARE_QSV_WIRES(_m_5_io_out_QSV)
  wire _m_5_io_out_valid;

  `DECLARE_QSV_WIRES(_m_6_io_out_QSV)
  wire _m_6_io_out_valid;

  `DECLARE_QSV_WIRES(_m_7_io_out_QSV)
  wire _m_7_io_out_valid;

  `DECLARE_QSV_WIRES(_m_8_io_out_QSV)
  wire _m_8_io_out_valid;

  `DECLARE_QSV_WIRES(_m_9_io_out_QSV)
  wire _m_9_io_out_valid;

  `DECLARE_QSV_WIRES(_m_10_io_out_QSV)
  wire _m_10_io_out_valid;

  `DECLARE_QSV_WIRES(_m_11_io_out_QSV)
  wire _m_11_io_out_valid;

  HGate5QubitVector8bit m (
    .clock(clock), .reset(reset),
    `MAP_QSV_IN(io_in_QSV),
    .io_in_valid(io_in_valid),
    `MAP_QSV_OUT(_m_io_out_QSV),
    .io_out_valid(_m_io_out_valid)
  );

  CompatiblePerm m_1 (
    .clock(clock), .reset(reset),
    `MAP_QSV_IN(_m_io_out_QSV),
    .io_in_valid(_m_io_out_valid),
    `MAP_QSV_OUT(_m_1_io_out_QSV),
    .io_out_valid(_m_1_io_out_valid)
  );

  CNGate5QubitVector8bit m_2 (
    .clock(clock), .reset(reset),
    `MAP_QSV_IN(_m_1_io_out_QSV),
    .io_in_valid(_m_1_io_out_valid),
    `MAP_QSV_OUT(_m_2_io_out_QSV),
    .io_out_valid(_m_2_io_out_valid)
  );

  CompatiblePerm_1 m_3 (
    .clock(clock), .reset(reset),
    `MAP_QSV_IN(_m_2_io_out_QSV),
    .io_in_valid(_m_2_io_out_valid),
    `MAP_QSV_OUT(_m_3_io_out_QSV),
    .io_out_valid(_m_3_io_out_valid)
  );

  CompatiblePerm_2 m_4 (
    .clock(clock), .reset(reset),
    `MAP_QSV_IN(_m_3_io_out_QSV),
    .io_in_valid(_m_3_io_out_valid),
    `MAP_QSV_OUT(_m_4_io_out_QSV),
    .io_out_valid(_m_4_io_out_valid)
  );

  CNGate5QubitVector8bit m_5 (
    .clock(clock), .reset(reset),
    `MAP_QSV_IN(_m_4_io_out_QSV),
    .io_in_valid(_m_4_io_out_valid),
    `MAP_QSV_OUT(_m_5_io_out_QSV),
    .io_out_valid(_m_5_io_out_valid)
  );

  CompatiblePerm_3 m_6 (
    .clock(clock), .reset(reset),
    `MAP_QSV_IN(_m_5_io_out_QSV),
    .io_in_valid(_m_5_io_out_valid),
    `MAP_QSV_OUT(_m_6_io_out_QSV),
    .io_out_valid(_m_6_io_out_valid)
  );

  CompatiblePerm_4 m_7 (
    .clock(clock), .reset(reset),
    `MAP_QSV_IN(_m_6_io_out_QSV),
    .io_in_valid(_m_6_io_out_valid),
    `MAP_QSV_OUT(_m_7_io_out_QSV),
    .io_out_valid(_m_7_io_out_valid)
  );

  CNGate5QubitVector8bit m_8 (
    .clock(clock), .reset(reset),
    `MAP_QSV_IN(_m_7_io_out_QSV),
    .io_in_valid(_m_7_io_out_valid),
    `MAP_QSV_OUT(_m_8_io_out_QSV),
    .io_out_valid(_m_8_io_out_valid)
  );

  CompatiblePerm_5 m_9 (
    .clock(clock), .reset(reset),
    `MAP_QSV_IN(_m_8_io_out_QSV),
    .io_in_valid(_m_8_io_out_valid),
    `MAP_QSV_OUT(_m_9_io_out_QSV),
    .io_out_valid(_m_9_io_out_valid)
  );

  CompatiblePerm_6 m_10 (
    .clock(clock), .reset(reset),
    `MAP_QSV_IN(_m_9_io_out_QSV),
    .io_in_valid(_m_9_io_out_valid),
    `MAP_QSV_OUT(_m_10_io_out_QSV),
    .io_out_valid(_m_10_io_out_valid)
  );

  CNGate5QubitVector8bit m_11 (
    .clock(clock), .reset(reset),
    `MAP_QSV_IN(_m_10_io_out_QSV),
    .io_in_valid(_m_10_io_out_valid),
    `MAP_QSV_OUT(_m_11_io_out_QSV),
    .io_out_valid(_m_11_io_out_valid)
  );

  CompatiblePerm_7 m_12 (
    .clock(clock), .reset(reset),
    `MAP_QSV_IN(_m_11_io_out_QSV),
    .io_in_valid(_m_11_io_out_valid),
    `MAP_QSV_OUT(io_out_QSV),
    .io_out_valid(io_out_valid)
  );

endmodule
