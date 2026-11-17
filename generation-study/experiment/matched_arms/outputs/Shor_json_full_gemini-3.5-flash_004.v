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

  // Intermediate signals declarations
  `define DECLARE_STAGE_WIRES(PREFIX) \
  wire [7:0] PREFIX``io_out_QSV_0_0, PREFIX``io_out_QSV_0_1, PREFIX``io_out_QSV_1_0, PREFIX``io_out_QSV_1_1, \
             PREFIX``io_out_QSV_2_0, PREFIX``io_out_QSV_2_1, PREFIX``io_out_QSV_3_0, PREFIX``io_out_QSV_3_1, \
             PREFIX``io_out_QSV_4_0, PREFIX``io_out_QSV_4_1, PREFIX``io_out_QSV_5_0, PREFIX``io_out_QSV_5_1, \
             PREFIX``io_out_QSV_6_0, PREFIX``io_out_QSV_6_1, PREFIX``io_out_QSV_7_0, PREFIX``io_out_QSV_7_1, \
             PREFIX``io_out_QSV_8_0, PREFIX``io_out_QSV_8_1, PREFIX``io_out_QSV_9_0, PREFIX``io_out_QSV_9_1, \
             PREFIX``io_out_QSV_10_0, PREFIX``io_out_QSV_10_1, PREFIX``io_out_QSV_11_0, PREFIX``io_out_QSV_11_1, \
             PREFIX``io_out_QSV_12_0, PREFIX``io_out_QSV_12_1, PREFIX``io_out_QSV_13_0, PREFIX``io_out_QSV_13_1, \
             PREFIX``io_out_QSV_14_0, PREFIX``io_out_QSV_14_1, PREFIX``io_out_QSV_15_0, PREFIX``io_out_QSV_15_1, \
             PREFIX``io_out_QSV_16_0, PREFIX``io_out_QSV_16_1, PREFIX``io_out_QSV_17_0, PREFIX``io_out_QSV_17_1, \
             PREFIX``io_out_QSV_18_0, PREFIX``io_out_QSV_18_1, PREFIX``io_out_QSV_19_0, PREFIX``io_out_QSV_19_1, \
             PREFIX``io_out_QSV_20_0, PREFIX``io_out_QSV_20_1, PREFIX``io_out_QSV_21_0, PREFIX``io_out_QSV_21_1, \
             PREFIX``io_out_QSV_22_0, PREFIX``io_out_QSV_22_1, PREFIX``io_out_QSV_23_0, PREFIX``io_out_QSV_23_1, \
             PREFIX``io_out_QSV_24_0, PREFIX``io_out_QSV_24_1, PREFIX``io_out_QSV_25_0, PREFIX``io_out_QSV_25_1, \
             PREFIX``io_out_QSV_26_0, PREFIX``io_out_QSV_26_1, PREFIX``io_out_QSV_27_0, PREFIX``io_out_QSV_27_1, \
             PREFIX``io_out_QSV_28_0, PREFIX``io_out_QSV_28_1, PREFIX``io_out_QSV_29_0, PREFIX``io_out_QSV_29_1, \
             PREFIX``io_out_QSV_30_0, PREFIX``io_out_QSV_30_1, PREFIX``io_out_QSV_31_0, PREFIX``io_out_QSV_31_1; \
  wire PREFIX``io_out_valid;

  `DECLARE_STAGE_WIRES(_m_)
  `DECLARE_STAGE_WIRES(_m_1_)
  `DECLARE_STAGE_WIRES(_m_2_)
  `DECLARE_STAGE_WIRES(_m_3_)
  `DECLARE_STAGE_WIRES(_m_4_)
  `DECLARE_STAGE_WIRES(_m_5_)
  `DECLARE_STAGE_WIRES(_m_6_)
  `DECLARE_STAGE_WIRES(_m_7_)
  `DECLARE_STAGE_WIRES(_m_8_)
  `DECLARE_STAGE_WIRES(_m_9_)
  `DECLARE_STAGE_WIRES(_m_10_)
  `DECLARE_STAGE_WIRES(_m_11_)
  `DECLARE_STAGE_WIRES(_m_12_)
  `DECLARE_STAGE_WIRES(_m_13_)
  `DECLARE_STAGE_WIRES(_m_14_)

  `undef DECLARE_STAGE_WIRES

  `define MAP_PORTS(PIN, POUT) \
    .io_in_QSV_0_0(PIN``0_0), .io_in_QSV_0_1(PIN``0_1), .io_in_QSV_1_0(PIN``1_0), .io_in_QSV_1_1(PIN``1_1), \
    .io_in_QSV_2_0(PIN``2_0), .io_in_QSV_2_1(PIN``2_1), .io_in_QSV_3_0(PIN``3_0), .io_in_QSV_3_1(PIN``3_1), \
    .io_in_QSV_4_0(PIN``4_0), .io_in_QSV_4_1(PIN``4_1), .io_in_QSV_5_0(PIN``5_0), .io_in_QSV_5_1(PIN``5_1), \
    .io_in_QSV_6_0(PIN``6_0), .io_in_QSV_6_1(PIN``6_1), .io_in_QSV_7_0(PIN``7_0), .io_in_QSV_7_1(PIN``7_1), \
    .io_in_QSV_8_0(PIN``8_0), .io_in_QSV_8_1(PIN``8_1), .io_in_QSV_9_0(PIN``9_0), .io_in_QSV_9_1(PIN``9_1), \
    .io_in_QSV_10_0(PIN``10_0), .io_in_QSV_10_1(PIN``10_1), .io_in_QSV_11_0(PIN``11_0), .io_in_QSV_11_1(PIN``11_1), \
    .io_in_QSV_12_0(PIN``12_0), .io_in_QSV_12_1(PIN``12_1), .io_in_QSV_13_0(PIN``13_0), .io_in_QSV_13_1(PIN``13_1), \
    .io_in_QSV_14_0(PIN``14_0), .io_in_QSV_14_1(PIN``14_1), .io_in_QSV_15_0(PIN``15_0), .io_in_QSV_15_1(PIN``15_1), \
    .io_in_QSV_16_0(PIN``16_0), .io_in_QSV_16_1(PIN``16_1), .io_in_QSV_17_0(PIN``17_0), .io_in_QSV_17_1(PIN``17_1), \
    .io_in_QSV_18_0(PIN``18_0), .io_in_QSV_18_1(PIN``18_1), .io_in_QSV_19_0(PIN``19_0), .io_in_QSV_19_1(PIN``19_1), \
    .io_in_QSV_20_0(PIN``20_0), .io_in_QSV_20_1(PIN``20_1), .io_in_QSV_21_0(PIN``21_0), .io_in_QSV_21_1(PIN``21_1), \
    .io_in_QSV_22_0(PIN``22_0), .io_in_QSV_22_1(PIN``22_1), .io_in_QSV_23_0(PIN``23_0), .io_in_QSV_23_1(PIN``23_1), \
    .io_in_QSV_24_0(PIN``24_0), .io_in_QSV_24_1(PIN``24_1), .io_in_QSV_25_0(PIN``25_0), .io_in_QSV_25_1(PIN``25_1), \
    .io_in_QSV_26_0(PIN``26_0), .io_in_QSV_26_1(PIN``26_1), .io_in_QSV_27_0(PIN``27_0), .io_in_QSV_27_1(PIN``27_1), \
    .io_in_QSV_28_0(PIN``28_0), .io_in_QSV_28_1(PIN``28_1), .io_in_QSV_29_0(PIN``29_0), .io_in_QSV_29_1(PIN``29_1), \
    .io_in_QSV_30_0(PIN``30_0), .io_in_QSV_30_1(PIN``30_1), .io_in_QSV_31_0(PIN``31_0), .io_in_QSV_31_1(PIN``31_1), \
    .io_in_valid(PIN``valid), \
    .io_out_QSV_0_0(POUT``0_0), .io_out_QSV_0_1(POUT``0_1), .io_out_QSV_1_0(POUT``1_0), .io_out_QSV_1_1(POUT``1_1), \
    .io_out_QSV_2_0(POUT``2_0), .io_out_QSV_2_1(POUT``2_1), .io_out_QSV_3_0(POUT``3_0), .io_out_QSV_3_1(POUT``3_1), \
    .io_out_QSV_4_0(POUT``4_0), .io_out_QSV_4_1(POUT``4_1), .io_out_QSV_5_0(POUT``5_0), .io_out_QSV_5_1(POUT``5_1), \
    .io_out_QSV_6_0(POUT``6_0), .io_out_QSV_6_1(POUT``6_1), .io_out_QSV_7_0(POUT``7_0), .io_out_QSV_7_1(POUT``7_1), \
    .io_out_QSV_8_0(POUT``8_0), .io_out_QSV_8_1(POUT``8_1), .io_out_QSV_9_0(POUT``9_0), .io_out_QSV_9_1(POUT``9_1), \
    .io_out_QSV_10_0(POUT``10_0), .io_out_QSV_10_1(POUT``10_1), .io_out_QSV_11_0(POUT``11_0), .io_out_QSV_11_1(POUT``11_1), \
    .io_out_QSV_12_0(POUT``12_0), .io_out_QSV_12_1(POUT``12_1), .io_out_QSV_13_0(POUT``13_0), .io_out_QSV_13_1(POUT``13_1), \
    .io_out_QSV_14_0(POUT``14_0), .io_out_QSV_14_1(POUT``14_1), .io_out_QSV_15_0(POUT``15_0), .io_out_QSV_15_1(POUT``15_1), \
    .io_out_QSV_16_0(POUT``16_0), .io_out_QSV_16_1(POUT``16_1), .io_out_QSV_17_0(POUT``17_0), .io_out_QSV_17_1(POUT``17_1), \
    .io_out_QSV_18_0(POUT``18_0), .io_out_QSV_18_1(POUT``18_1), .io_out_QSV_19_0(POUT``19_0), .io_out_QSV_19_1(POUT``19_1), \
    .io_out_QSV_20_0(POUT``20_0), .io_out_QSV_20_1(POUT``20_1), .io_out_QSV_21_0(POUT``21_0), .io_out_QSV_21_1(POUT``21_1), \
    .io_out_QSV_22_0(POUT``22_0), .io_out_QSV_22_1(POUT``22_1), .io_out_QSV_23_0(POUT``23_0), .io_out_QSV_23_1(POUT``23_1), \
    .io_out_QSV_24_0(POUT``24_0), .io_out_QSV_24_1(POUT``24_1), .io_out_QSV_25_0(POUT``25_0), .io_out_QSV_25_1(POUT``25_1), \
    .io_out_QSV_26_0(POUT``26_0), .io_out_QSV_26_1(POUT``26_1), .io_out_QSV_27_0(POUT``27_0), .io_out_QSV_27_1(POUT``27_1), \
    .io_out_QSV_28_0(POUT``28_0), .io_out_QSV_28_1(POUT``28_1), .io_out_QSV_29_0(POUT``29_0), .io_out_QSV_29_1(POUT``29_1), \
    .io_out_QSV_30_0(POUT``30_0), .io_out_QSV_30_1(POUT``30_1), .io_out_QSV_31_0(POUT``31_0), .io_out_QSV_31_1(POUT``31_1), \
    .io_out_valid(POUT``valid)

  HGate5QubitVector8bit m (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(io_in_QSV_, _m_io_out_QSV_)
  );

  CompatiblePerm m_1 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_io_out_QSV_, _m_1_io_out_QSV_)
  );

  CNGate5QubitVector8bit m_2 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_1_io_out_QSV_, _m_2_io_out_QSV_)
  );

  CompatiblePerm_1 m_3 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_2_io_out_QSV_, _m_3_io_out_QSV_)
  );

  CompatiblePerm_2 m_4 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_3_io_out_QSV_, _m_4_io_out_QSV_)
  );

  CNGate5QubitVector8bit m_5 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_4_io_out_QSV_, _m_5_io_out_QSV_)
  );

  CompatiblePerm_3 m_6 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_5_io_out_QSV_, _m_6_io_out_QSV_)
  );

  CompatiblePerm_4 m_7 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_6_io_out_QSV_, _m_7_io_out_QSV_)
  );

  CNGate5QubitVector8bit m_8 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_7_io_out_QSV_, _m_8_io_out_QSV_)
  );

  CompatiblePerm_5 m_9 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_8_io_out_QSV_, _m_9_io_out_QSV_)
  );

  CompatiblePerm_6 m_10 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_9_io_out_QSV_, _m_10_io_out_QSV_)
  );

  CNGate5QubitVector8bit m_11 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_10_io_out_QSV_, _m_11_io_out_QSV_)
  );

  CompatiblePerm_1 m_12 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_11_io_out_QSV_, _m_12_io_out_QSV_)
  );

  CompatiblePerm_4 m_13 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_12_io_out_QSV_, _m_13_io_out_QSV_)
  );

  CompatiblePerm_9 m_14 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_13_io_out_QSV_, _m_14_io_out_QSV_)
  );

  CompatiblePerm_10 m_15 (
    .clock(clock),
    .reset(reset),
    `MAP_PORTS(_m_14_io_out_QSV_, io_out_QSV_)
  );

  `undef MAP_PORTS

endmodule
