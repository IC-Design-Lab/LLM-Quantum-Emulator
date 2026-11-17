module Shor (
  input clock,
  input reset,
  input [7:0] io_in_QSV_0_0, io_in_QSV_0_1,
  input [7:0] io_in_QSV_1_0, io_in_QSV_1_1,
  input [7:0] io_in_QSV_2_0, io_in_QSV_2_1,
  input [7:0] io_in_QSV_3_0, io_in_QSV_3_1,
  input [7:0] io_in_QSV_4_0, io_in_QSV_4_1,
  input [7:0] io_in_QSV_5_0, io_in_QSV_5_1,
  input [7:0] io_in_QSV_6_0, io_in_QSV_6_1,
  input [7:0] io_in_QSV_7_0, io_in_QSV_7_1,
  input [7:0] io_in_QSV_8_0, io_in_QSV_8_1,
  input [7:0] io_in_QSV_9_0, io_in_QSV_9_1,
  input [7:0] io_in_QSV_10_0, io_in_QSV_10_1,
  input [7:0] io_in_QSV_11_0, io_in_QSV_11_1,
  input [7:0] io_in_QSV_12_0, io_in_QSV_12_1,
  input [7:0] io_in_QSV_13_0, io_in_QSV_13_1,
  input [7:0] io_in_QSV_14_0, io_in_QSV_14_1,
  input [7:0] io_in_QSV_15_0, io_in_QSV_15_1,
  input [7:0] io_in_QSV_16_0, io_in_QSV_16_1,
  input [7:0] io_in_QSV_17_0, io_in_QSV_17_1,
  input [7:0] io_in_QSV_18_0, io_in_QSV_18_1,
  input [7:0] io_in_QSV_19_0, io_in_QSV_19_1,
  input [7:0] io_in_QSV_20_0, io_in_QSV_20_1,
  input [7:0] io_in_QSV_21_0, io_in_QSV_21_1,
  input [7:0] io_in_QSV_22_0, io_in_QSV_22_1,
  input [7:0] io_in_QSV_23_0, io_in_QSV_23_1,
  input [7:0] io_in_QSV_24_0, io_in_QSV_24_1,
  input [7:0] io_in_QSV_25_0, io_in_QSV_25_1,
  input [7:0] io_in_QSV_26_0, io_in_QSV_26_1,
  input [7:0] io_in_QSV_27_0, io_in_QSV_27_1,
  input [7:0] io_in_QSV_28_0, io_in_QSV_28_1,
  input [7:0] io_in_QSV_29_0, io_in_QSV_29_1,
  input [7:0] io_in_QSV_30_0, io_in_QSV_30_1,
  input [7:0] io_in_QSV_31_0, io_in_QSV_31_1,
  input io_in_valid,
  output [7:0] io_out_QSV_0_0, io_out_QSV_0_1,
  output [7:0] io_out_QSV_1_0, io_out_QSV_1_1,
  output [7:0] io_out_QSV_2_0, io_out_QSV_2_1,
  output [7:0] io_out_QSV_3_0, io_out_QSV_3_1,
  output [7:0] io_out_QSV_4_0, io_out_QSV_4_1,
  output [7:0] io_out_QSV_5_0, io_out_QSV_5_1,
  output [7:0] io_out_QSV_6_0, io_out_QSV_6_1,
  output [7:0] io_out_QSV_7_0, io_out_QSV_7_1,
  output [7:0] io_out_QSV_8_0, io_out_QSV_8_1,
  output [7:0] io_out_QSV_9_0, io_out_QSV_9_1,
  output [7:0] io_out_QSV_10_0, io_out_QSV_10_1,
  output [7:0] io_out_QSV_11_0, io_out_QSV_11_1,
  output [7:0] io_out_QSV_12_0, io_out_QSV_12_1,
  output [7:0] io_out_QSV_13_0, io_out_QSV_13_1,
  output [7:0] io_out_QSV_14_0, io_out_QSV_14_1,
  output [7:0] io_out_QSV_15_0, io_out_QSV_15_1,
  output [7:0] io_out_QSV_16_0, io_out_QSV_16_1,
  output [7:0] io_out_QSV_17_0, io_out_QSV_17_1,
  output [7:0] io_out_QSV_18_0, io_out_QSV_18_1,
  output [7:0] io_out_QSV_19_0, io_out_QSV_19_1,
  output [7:0] io_out_QSV_20_0, io_out_QSV_20_1,
  output [7:0] io_out_QSV_21_0, io_out_QSV_21_1,
  output [7:0] io_out_QSV_22_0, io_out_QSV_22_1,
  output [7:0] io_out_QSV_23_0, io_out_QSV_23_1,
  output [7:0] io_out_QSV_24_0, io_out_QSV_24_1,
  output [7:0] io_out_QSV_25_0, io_out_QSV_25_1,
  output [7:0] io_out_QSV_26_0, io_out_QSV_26_1,
  output [7:0] io_out_QSV_27_0, io_out_QSV_27_1,
  output [7:0] io_out_QSV_28_0, io_out_QSV_28_1,
  output [7:0] io_out_QSV_29_0, io_out_QSV_29_1,
  output [7:0] io_out_QSV_30_0, io_out_QSV_30_1,
  output [7:0] io_out_QSV_31_0, io_out_QSV_31_1,
  output io_out_valid
);

  `define DEF_STAGE_WIRES(prefix) \
    logic [7:0] prefix``_QSV_0_0, prefix``_QSV_0_1, prefix``_QSV_1_0, prefix``_QSV_1_1, \
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
    logic prefix``_valid;

  `DEF_STAGE_WIRES(_m_io_out)
  `DEF_STAGE_WIRES(_m_1_io_out)
  `DEF_STAGE_WIRES(_m_2_io_out)
  `DEF_STAGE_WIRES(_m_3_io_out)
  `DEF_STAGE_WIRES(_m_4_io_out)
  `DEF_STAGE_WIRES(_m_5_io_out)
  `DEF_STAGE_WIRES(_m_6_io_out)
  `DEF_STAGE_WIRES(_m_7_io_out)
  `DEF_STAGE_WIRES(_m_8_io_out)
  `DEF_STAGE_WIRES(_m_9_io_out)
  `DEF_STAGE_WIRES(_m_10_io_out)
  `DEF_STAGE_WIRES(_m_11_io_out)
  `DEF_STAGE_WIRES(_m_12_io_out)
  `DEF_STAGE_WIRES(_m_13_io_out)
  `DEF_STAGE_WIRES(_m_14_io_out)

  `define CONNECT_PORTS(prefix_in, prefix_out) \
    .io_in_QSV_0_0(prefix_in``_QSV_0_0), .io_in_QSV_0_1(prefix_in``_QSV_0_1), \
    .io_in_QSV_1_0(prefix_in``_QSV_1_0), .io_in_QSV_1_1(prefix_in``_QSV_1_1), \
    .io_in_QSV_2_0(prefix_in``_QSV_2_0), .io_in_QSV_2_1(prefix_in``_QSV_2_1), \
    .io_in_QSV_3_0(prefix_in``_QSV_3_0), .io_in_QSV_3_1(prefix_in``_QSV_3_1), \
    .io_in_QSV_4_0(prefix_in``_QSV_4_0), .io_in_QSV_4_1(prefix_in``_QSV_4_1), \
    .io_in_QSV_5_0(prefix_in``_QSV_5_0), .io_in_QSV_5_1(prefix_in``_QSV_5_1), \
    .io_in_QSV_6_0(prefix_in``_QSV_6_0), .io_in_QSV_6_1(prefix_in``_QSV_6_1), \
    .io_in_QSV_7_0(prefix_in``_QSV_7_0), .io_in_QSV_7_1(prefix_in``_QSV_7_1), \
    .io_in_QSV_8_0(prefix_in``_QSV_8_0), .io_in_QSV_8_1(prefix_in``_QSV_8_1), \
    .io_in_QSV_9_0(prefix_in``_QSV_9_0), .io_in_QSV_9_1(prefix_in``_QSV_9_1), \
    .io_in_QSV_10_0(prefix_in``_QSV_10_0), .io_in_QSV_10_1(prefix_in``_QSV_10_1), \
    .io_in_QSV_11_0(prefix_in``_QSV_11_0), .io_in_QSV_11_1(prefix_in``_QSV_11_1), \
    .io_in_QSV_12_0(prefix_in``_QSV_12_0), .io_in_QSV_12_1(prefix_in``_QSV_12_1), \
    .io_in_QSV_13_0(prefix_in``_QSV_13_0), .io_in_QSV_13_1(prefix_in``_QSV_13_1), \
    .io_in_QSV_14_0(prefix_in``_QSV_14_0), .io_in_QSV_14_1(prefix_in``_QSV_14_1), \
    .io_in_QSV_15_0(prefix_in``_QSV_15_0), .io_in_QSV_15_1(prefix_in``_QSV_15_1), \
    .io_in_QSV_16_0(prefix_in``_QSV_16_0), .io_in_QSV_16_1(prefix_in``_QSV_16_1), \
    .io_in_QSV_17_0(prefix_in``_QSV_17_0), .io_in_QSV_17_1(prefix_in``_QSV_17_1), \
    .io_in_QSV_18_0(prefix_in``_QSV_18_0), .io_in_QSV_18_1(prefix_in``_QSV_18_1), \
    .io_in_QSV_19_0(prefix_in``_QSV_19_0), .io_in_QSV_19_1(prefix_in``_QSV_19_1), \
    .io_in_QSV_20_0(prefix_in``_QSV_20_0), .io_in_QSV_20_1(prefix_in``_QSV_20_1), \
    .io_in_QSV_21_0(prefix_in``_QSV_21_0), .io_in_QSV_21_1(prefix_in``_QSV_21_1), \
    .io_in_QSV_22_0(prefix_in``_QSV_22_0), .io_in_QSV_22_1(prefix_in``_QSV_22_1), \
    .io_in_QSV_23_0(prefix_in``_QSV_23_0), .io_in_QSV_23_1(prefix_in``_QSV_23_1), \
    .io_in_QSV_24_0(prefix_in``_QSV_24_0), .io_in_QSV_24_1(prefix_in``_QSV_24_1), \
    .io_in_QSV_25_0(prefix_in``_QSV_25_0), .io_in_QSV_25_1(prefix_in``_QSV_25_1), \
    .io_in_QSV_26_0(prefix_in``_QSV_26_0), .io_in_QSV_26_1(prefix_in``_QSV_26_1), \
    .io_in_QSV_27_0(prefix_in``_QSV_27_0), .io_in_QSV_27_1(prefix_in``_QSV_27_1), \
    .io_in_QSV_28_0(prefix_in``_QSV_28_0), .io_in_QSV_28_1(prefix_in``_QSV_28_1), \
    .io_in_QSV_29_0(prefix_in``_QSV_29_0), .io_in_QSV_29_1(prefix_in``_QSV_29_1), \
    .io_in_QSV_30_0(prefix_in``_QSV_30_0), .io_in_QSV_30_1(prefix_in``_QSV_30_1), \
    .io_in_QSV_31_0(prefix_in``_QSV_31_0), .io_in_QSV_31_1(prefix_in``_QSV_31_1), \
    .io_in_valid(prefix_in``_valid), \
    .io_out_QSV_0_0(prefix_out``_QSV_0_0), .io_out_QSV_0_1(prefix_out``_QSV_0_1), \
    .io_out_QSV_1_0(prefix_out``_QSV_1_0), .io_out_QSV_1_1(prefix_out``_QSV_1_1), \
    .io_out_QSV_2_0(prefix_out``_QSV_2_0), .io_out_QSV_2_1(prefix_out``_QSV_2_1), \
    .io_out_QSV_3_0(prefix_out``_QSV_3_0), .io_out_QSV_3_1(prefix_out``_QSV_3_1), \
    .io_out_QSV_4_0(prefix_out``_QSV_4_0), .io_out_QSV_4_1(prefix_out``_QSV_4_1), \
    .io_out_QSV_5_0(prefix_out``_QSV_5_0), .io_out_QSV_5_1(prefix_out``_QSV_5_1), \
    .io_out_QSV_6_0(prefix_out``_QSV_6_0), .io_out_QSV_6_1(prefix_out``_QSV_6_1), \
    .io_out_QSV_7_0(prefix_out``_QSV_7_0), .io_out_QSV_7_1(prefix_out``_QSV_7_1), \
    .io_out_QSV_8_0(prefix_out``_QSV_8_0), .io_out_QSV_8_1(prefix_out``_QSV_8_1), \
    .io_out_QSV_9_0(prefix_out``_QSV_9_0), .io_out_QSV_9_1(prefix_out``_QSV_9_1), \
    .io_out_QSV_10_0(prefix_out``_QSV_10_0), .io_out_QSV_10_1(prefix_out``_QSV_10_1), \
    .io_out_QSV_11_0(prefix_out``_QSV_11_0), .io_out_QSV_11_1(prefix_out``_QSV_11_1), \
    .io_out_QSV_12_0(prefix_out``_QSV_12_0), .io_out_QSV_12_1(prefix_out``_QSV_12_1), \
    .io_out_QSV_13_0(prefix_out``_QSV_13_0), .io_out_QSV_13_1(prefix_out``_QSV_13_1), \
    .io_out_QSV_14_0(prefix_out``_QSV_14_0), .io_out_QSV_14_1(prefix_out``_QSV_14_1), \
    .io_out_QSV_15_0(prefix_out``_QSV_15_0), .io_out_QSV_15_1(prefix_out``_QSV_15_1), \
    .io_out_QSV_16_0(prefix_out``_QSV_16_0), .io_out_QSV_16_1(prefix_out``_QSV_16_1), \
    .io_out_QSV_17_0(prefix_out``_QSV_17_0), .io_out_QSV_17_1(prefix_out``_QSV_17_1), \
    .io_out_QSV_18_0(prefix_out``_QSV_18_0), .io_out_QSV_18_1(prefix_out``_QSV_18_1), \
    .io_out_QSV_19_0(prefix_out``_QSV_19_0), .io_out_QSV_19_1(prefix_out``_QSV_19_1), \
    .io_out_QSV_20_0(prefix_out``_QSV_20_0), .io_out_QSV_20_1(prefix_out``_QSV_20_1), \
    .io_out_QSV_21_0(prefix_out``_QSV_21_0), .io_out_QSV_21_1(prefix_out``_QSV_21_1), \
    .io_out_QSV_22_0(prefix_out``_QSV_22_0), .io_out_QSV_22_1(prefix_out``_QSV_22_1), \
    .io_out_QSV_23_0(prefix_out``_QSV_23_0), .io_out_QSV_23_1(prefix_out``_QSV_23_1), \
    .io_out_QSV_24_0(prefix_out``_QSV_24_0), .io_out_QSV_24_1(prefix_out``_QSV_24_1), \
    .io_out_QSV_25_0(prefix_out``_QSV_25_0), .io_out_QSV_25_1(prefix_out``_QSV_25_1), \
    .io_out_QSV_26_0(prefix_out``_QSV_26_0), .io_out_QSV_26_1(prefix_out``_QSV_26_1), \
    .io_out_QSV_27_0(prefix_out``_QSV_27_0), .io_out_QSV_27_1(prefix_out``_QSV_27_1), \
    .io_out_QSV_28_0(prefix_out``_QSV_28_0), .io_out_QSV_28_1(prefix_out``_QSV_28_1), \
    .io_out_QSV_29_0(prefix_out``_QSV_29_0), .io_out_QSV_29_1(prefix_out``_QSV_29_1), \
    .io_out_QSV_30_0(prefix_out``_QSV_30_0), .io_out_QSV_30_1(prefix_out``_QSV_30_1), \
    .io_out_QSV_31_0(prefix_out``_QSV_31_0), .io_out_QSV_31_1(prefix_out``_QSV_31_1), \
    .io_out_valid(prefix_out``_valid)

  HGate5QubitVector8bit m (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(io_in, _m_io_out)
  );

  CompatiblePerm m_1 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_io_out, _m_1_io_out)
  );

  CNGate5QubitVector8bit m_2 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_1_io_out, _m_2_io_out)
  );

  CompatiblePerm_1 m_3 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_2_io_out, _m_3_io_out)
  );

  CompatiblePerm_2 m_4 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_3_io_out, _m_4_io_out)
  );

  CNGate5QubitVector8bit m_5 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_4_io_out, _m_5_io_out)
  );

  CompatiblePerm_3 m_6 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_5_io_out, _m_6_io_out)
  );

  CompatiblePerm_4 m_7 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_6_io_out, _m_7_io_out)
  );

  CNGate5QubitVector8bit m_8 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_7_io_out, _m_8_io_out)
  );

  CompatiblePerm_5 m_9 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_8_io_out, _m_9_io_out)
  );

  CompatiblePerm_6 m_10 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_9_io_out, _m_10_io_out)
  );

  CNGate5QubitVector8bit m_11 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_10_io_out, _m_11_io_out)
  );

  CompatiblePerm_7 m_12 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_11_io_out, _m_12_io_out)
  );

  CompatiblePerm_8 m_13 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_12_io_out, _m_13_io_out)
  );

  CompatiblePerm_9 m_14 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_13_io_out, _m_14_io_out)
  );

  CompatiblePerm_10 m_15 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(_m_14_io_out, io_out)
  );

endmodule
