module Shor (
  input  clock,
  input  reset,
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
  input  io_in_valid,
  
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

  `define DECLARE_STAGE_WIRES(NAME) \
    wire [7:0] ``NAME``_io_out_QSV_0_0, ``NAME``_io_out_QSV_0_1, ``NAME``_io_out_QSV_1_0, ``NAME``_io_out_QSV_1_1, \
               ``NAME``_io_out_QSV_2_0, ``NAME``_io_out_QSV_2_1, ``NAME``_io_out_QSV_3_0, ``NAME``_io_out_QSV_3_1, \
               ``NAME``_io_out_QSV_4_0, ``NAME``_io_out_QSV_4_1, ``NAME``_io_out_QSV_5_0, ``NAME``_io_out_QSV_5_1, \
               ``NAME``_io_out_QSV_6_0, ``NAME``_io_out_QSV_6_1, ``NAME``_io_out_QSV_7_0, ``NAME``_io_out_QSV_7_1, \
               ``NAME``_io_out_QSV_8_0, ``NAME``_io_out_QSV_8_1, ``NAME``_io_out_QSV_9_0, ``NAME``_io_out_QSV_9_1, \
               ``NAME``_io_out_QSV_10_0, ``NAME``_io_out_QSV_10_1, ``NAME``_io_out_QSV_11_0, ``NAME``_io_out_QSV_11_1, \
               ``NAME``_io_out_QSV_12_0, ``NAME``_io_out_QSV_12_1, ``NAME``_io_out_QSV_13_0, ``NAME``_io_out_QSV_13_1, \
               ``NAME``_io_out_QSV_14_0, ``NAME``_io_out_QSV_14_1, ``NAME``_io_out_QSV_15_0, ``NAME``_io_out_QSV_15_1, \
               ``NAME``_io_out_QSV_16_0, ``NAME``_io_out_QSV_16_1, ``NAME``_io_out_QSV_17_0, ``NAME``_io_out_QSV_17_1, \
               ``NAME``_io_out_QSV_18_0, ``NAME``_io_out_QSV_18_1, ``NAME``_io_out_QSV_19_0, ``NAME``_io_out_QSV_19_1, \
               ``NAME``_io_out_QSV_20_0, ``NAME``_io_out_QSV_20_1, ``NAME``_io_out_QSV_21_0, ``NAME``_io_out_QSV_21_1, \
               ``NAME``_io_out_QSV_22_0, ``NAME``_io_out_QSV_22_1, ``NAME``_io_out_QSV_23_0, ``NAME``_io_out_QSV_23_1, \
               ``NAME``_io_out_QSV_24_0, ``NAME``_io_out_QSV_24_1, ``NAME``_io_out_QSV_25_0, ``NAME``_io_out_QSV_25_1, \
               ``NAME``_io_out_QSV_26_0, ``NAME``_io_out_QSV_26_1, ``NAME``_io_out_QSV_27_0, ``NAME``_io_out_QSV_27_1, \
               ``NAME``_io_out_QSV_28_0, ``NAME``_io_out_QSV_28_1, ``NAME``_io_out_QSV_29_0, ``NAME``_io_out_QSV_29_1, \
               ``NAME``_io_out_QSV_30_0, ``NAME``_io_out_QSV_30_1, ``NAME``_io_out_QSV_31_0, ``NAME``_io_out_QSV_31_1; \
    wire ``NAME``_io_out_valid;

  `define CONNECT_STAGE_PORTS(PREFIX_IN, PREFIX_OUT) \
    .io_in_QSV_0_0(``PREFIX_IN``_0_0), .io_in_QSV_0_1(``PREFIX_IN``_0_1), .io_in_QSV_1_0(``PREFIX_IN``_1_0), .io_in_QSV_1_1(``PREFIX_IN``_1_1), \
    .io_in_QSV_2_0(``PREFIX_IN``_2_0), .io_in_QSV_2_1(``PREFIX_IN``_2_1), .io_in_QSV_3_0(``PREFIX_IN``_3_0), .io_in_QSV_3_1(``PREFIX_IN``_3_1), \
    .io_in_QSV_4_0(``PREFIX_IN``_4_0), .io_in_QSV_4_1(``PREFIX_IN``_4_1), .io_in_QSV_5_0(``PREFIX_IN``_5_0), .io_in_QSV_5_1(``PREFIX_IN``_5_1), \
    .io_in_QSV_6_0(``PREFIX_IN``_6_0), .io_in_QSV_6_1(``PREFIX_IN``_6_1), .io_in_QSV_7_0(``PREFIX_IN``_7_0), .io_in_QSV_7_1(``PREFIX_IN``_7_1), \
    .io_in_QSV_8_0(``PREFIX_IN``_8_0), .io_in_QSV_8_1(``PREFIX_IN``_8_1), .io_in_QSV_9_0(``PREFIX_IN``_9_0), .io_in_QSV_9_1(``PREFIX_IN``_9_1), \
    .io_in_QSV_10_0(``PREFIX_IN``_10_0), .io_in_QSV_10_1(``PREFIX_IN``_10_1), .io_in_QSV_11_0(``PREFIX_IN``_11_0), .io_in_QSV_11_1(``PREFIX_IN``_11_1), \
    .io_in_QSV_12_0(``PREFIX_IN``_12_0), .io_in_QSV_12_1(``PREFIX_IN``_12_1), .io_in_QSV_13_0(``PREFIX_IN``_13_0), .io_in_QSV_13_1(``PREFIX_IN``_13_1), \
    .io_in_QSV_14_0(``PREFIX_IN``_14_0), .io_in_QSV_14_1(``PREFIX_IN``_14_1), .io_in_QSV_15_0(``PREFIX_IN``_15_0), .io_in_QSV_15_1(``PREFIX_IN``_15_1), \
    .io_in_QSV_16_0(``PREFIX_IN``_16_0), .io_in_QSV_16_1(``PREFIX_IN``_16_1), .io_in_QSV_17_0(``PREFIX_IN``_17_0), .io_in_QSV_17_1(``PREFIX_IN``_17_1), \
    .io_in_QSV_18_0(``PREFIX_IN``_18_0), .io_in_QSV_18_1(``PREFIX_IN``_18_1), .io_in_QSV_19_0(``PREFIX_IN``_19_0), .io_in_QSV_19_1(``PREFIX_IN``_19_1), \
    .io_in_QSV_20_0(``PREFIX_IN``_20_0), .io_in_QSV_20_1(``PREFIX_IN``_20_1), .io_in_QSV_21_0(``PREFIX_IN``_21_0), .io_in_QSV_21_1(``PREFIX_IN``_21_1), \
    .io_in_QSV_22_0(``PREFIX_IN``_22_0), .io_in_QSV_22_1(``PREFIX_IN``_22_1), .io_in_QSV_23_0(``PREFIX_IN``_23_0), .io_in_QSV_23_1(``PREFIX_IN``_23_1), \
    .io_in_QSV_24_0(``PREFIX_IN``_24_0), .io_in_QSV_24_1(``PREFIX_IN``_24_1), .io_in_QSV_25_0(``PREFIX_IN``_25_0), .io_in_QSV_25_1(``PREFIX_IN``_25_1), \
    .io_in_QSV_26_0(``PREFIX_IN``_26_0), .io_in_QSV_26_1(``PREFIX_IN``_26_1), .io_in_QSV_27_0(``PREFIX_IN``_27_0), .io_in_QSV_27_1(``PREFIX_IN``_27_1), \
    .io_in_QSV_28_0(``PREFIX_IN``_28_0), .io_in_QSV_28_1(``PREFIX_IN``_28_1), .io_in_QSV_29_0(``PREFIX_IN``_29_0), .io_in_QSV_29_1(``PREFIX_IN``_29_1), \
    .io_in_QSV_30_0(``PREFIX_IN``_30_0), .io_in_QSV_30_1(``PREFIX_IN``_30_1), .io_in_QSV_31_0(``PREFIX_IN``_31_0), .io_in_QSV_31_1(``PREFIX_IN``_31_1), \
    .io_out_QSV_0_0(``PREFIX_OUT``_0_0), .io_out_QSV_0_1(``PREFIX_OUT``_0_1), .io_out_QSV_1_0(``PREFIX_OUT``_1_0), .io_out_QSV_1_1(``PREFIX_OUT``_1_1), \
    .io_out_QSV_2_0(``PREFIX_OUT``_2_0), .io_out_QSV_2_1(``PREFIX_OUT``_2_1), .io_out_QSV_3_0(``PREFIX_OUT``_3_0), .io_out_QSV_3_1(``PREFIX_OUT``_3_1), \
    .io_out_QSV_4_0(``PREFIX_OUT``_4_0), .io_out_QSV_4_1(``PREFIX_OUT``_4_1), .io_out_QSV_5_0(``PREFIX_OUT``_5_0), .io_out_QSV_5_1(``PREFIX_OUT``_5_1), \
    .io_out_QSV_6_0(``PREFIX_OUT``_6_0), .io_out_QSV_6_1(``PREFIX_OUT``_6_1), .io_out_QSV_7_0(``PREFIX_OUT``_7_0), .io_out_QSV_7_1(``PREFIX_OUT``_7_1), \
    .io_out_QSV_8_0(``PREFIX_OUT``_8_0), .io_out_QSV_8_1(``PREFIX_OUT``_8_1), .io_out_QSV_9_0(``PREFIX_OUT``_9_0), .io_out_QSV_9_1(``PREFIX_OUT``_9_1), \
    .io_out_QSV_10_0(``PREFIX_OUT``_10_0), .io_out_QSV_10_1(``PREFIX_OUT``_10_1), .io_out_QSV_11_0(``PREFIX_OUT``_11_0), .io_out_QSV_11_1(``PREFIX_OUT``_11_1), \
    .io_out_QSV_12_0(``PREFIX_OUT``_12_0), .io_out_QSV_12_1(``PREFIX_OUT``_12_1), .io_out_QSV_13_0(``PREFIX_OUT``_13_0), .io_out_QSV_13_1(``PREFIX_OUT``_13_1), \
    .io_out_QSV_14_0(``PREFIX_OUT``_14_0), .io_out_QSV_14_1(``PREFIX_OUT``_14_1), .io_out_QSV_15_0(``PREFIX_OUT``_15_0), .io_out_QSV_15_1(``PREFIX_OUT``_15_1), \
    .io_out_QSV_16_0(``PREFIX_OUT``_16_0), .io_out_QSV_16_1(``PREFIX_OUT``_16_1), .io_out_QSV_17_0(``PREFIX_OUT``_17_0), .io_out_QSV_17_1(``PREFIX_OUT``_17_1), \
    .io_out_QSV_18_0(``PREFIX_OUT``_18_0), .io_out_QSV_18_1(``PREFIX_OUT``_18_1), .io_out_QSV_19_0(``PREFIX_OUT``_19_0), .io_out_QSV_19_1(``PREFIX_OUT``_19_1), \
    .io_out_QSV_20_0(``PREFIX_OUT``_20_0), .io_out_QSV_20_1(``PREFIX_OUT``_20_1), .io_out_QSV_21_0(``PREFIX_OUT``_21_0), .io_out_QSV_21_1(``PREFIX_OUT``_21_1), \
    .io_out_QSV_22_0(``PREFIX_OUT``_22_0), .io_out_QSV_22_1(``PREFIX_OUT``_22_1), .io_out_QSV_23_0(``PREFIX_OUT``_23_0), .io_out_QSV_23_1(``PREFIX_OUT``_23_1), \
    .io_out_QSV_24_0(``PREFIX_OUT``_24_0), .io_out_QSV_24_1(``PREFIX_OUT``_24_1), .io_out_QSV_25_0(``PREFIX_OUT``_25_0), .io_out_QSV_25_1(``PREFIX_OUT``_25_1), \
    .io_out_QSV_26_0(``PREFIX_OUT``_26_0), .io_out_QSV_26_1(``PREFIX_OUT``_26_1), .io_out_QSV_27_0(``PREFIX_OUT``_27_0), .io_out_QSV_27_1(``PREFIX_OUT``_27_1), \
    .io_out_QSV_28_0(``PREFIX_OUT``_28_0), .io_out_QSV_28_1(``PREFIX_OUT``_28_1), .io_out_QSV_29_0(``PREFIX_OUT``_29_0), .io_out_QSV_29_1(``PREFIX_OUT``_29_1), \
    .io_out_QSV_30_0(``PREFIX_OUT``_30_0), .io_out_QSV_30_1(``PREFIX_OUT``_30_1), .io_out_QSV_31_0(``PREFIX_OUT``_31_0), .io_out_QSV_31_1(``PREFIX_OUT``_31_1)

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

  HGate5QubitVector8bit m (
    .clock(clock), .reset(reset),
    .io_in_valid(io_in_valid), .io_out_valid(_m_io_out_valid),
    `CONNECT_STAGE_PORTS(io_in_QSV, _m_io_out_QSV)
  );

  CNGate5QubitVector8bit m_1 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_io_out_valid), .io_out_valid(_m_1_io_out_valid),
    `CONNECT_STAGE_PORTS(_m_io_out_QSV, _m_1_io_out_QSV)
  );

  CompatiblePerm m_2 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_1_io_out_valid), .io_out_valid(_m_2_io_out_valid),
    `CONNECT_STAGE_PORTS(_m_1_io_out_QSV, _m_2_io_out_QSV)
  );

  CNGate5QubitVector8bit m_3 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_2_io_out_valid), .io_out_valid(_m_3_io_out_valid),
    `CONNECT_STAGE_PORTS(_m_2_io_out_QSV, _m_3_io_out_QSV)
  );

  CompatiblePerm_1 m_4 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_3_io_out_valid), .io_out_valid(_m_4_io_out_valid),
    `CONNECT_STAGE_PORTS(_m_3_io_out_QSV, _m_4_io_out_QSV)
  );

  CompatiblePerm_2 m_5 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_4_io_out_valid), .io_out_valid(_m_5_io_out_valid),
    `CONNECT_STAGE_PORTS(_m_4_io_out_QSV, _m_5_io_out_QSV)
  );

  CNGate5QubitVector8bit m_6 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_5_io_out_valid), .io_out_valid(_m_6_io_out_valid),
    `CONNECT_STAGE_PORTS(_m_5_io_out_QSV, _m_6_io_out_QSV)
  );

  CompatiblePerm_3 m_7 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_6_io_out_valid), .io_out_valid(_m_7_io_out_valid),
    `CONNECT_STAGE_PORTS(_m_6_io_out_QSV, _m_7_io_out_QSV)
  );

  CompatiblePerm_4 m_8 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_7_io_out_valid), .io_out_valid(_m_8_io_out_valid),
    `CONNECT_STAGE_PORTS(_m_7_io_out_QSV, _m_8_io_out_QSV)
  );

  CNGate5QubitVector8bit m_9 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_8_io_out_valid), .io_out_valid(_m_9_io_out_valid),
    `CONNECT_STAGE_PORTS(_m_8_io_out_QSV, _m_9_io_out_QSV)
  );

  CompatiblePerm_5 m_10 (
    .clock(clock), .reset(reset),
    .io_in_valid(_m_9_io_out_valid), .io_out_valid(io_out_valid),
    `CONNECT_STAGE_PORTS(_m_9_io_out_QSV, io_out_QSV)
  );

  `undef DECLARE_STAGE_WIRES
  `undef CONNECT_STAGE_PORTS

endmodule
