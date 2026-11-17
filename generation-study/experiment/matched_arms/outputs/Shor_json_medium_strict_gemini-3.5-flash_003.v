module Shor (
  input  logic        clock,
  input  logic        reset,
  input  logic [7:0]  io_in_QSV_0_0,
  input  logic [7:0]  io_in_QSV_0_1,
  input  logic [7:0]  io_in_QSV_1_0,
  input  logic [7:0]  io_in_QSV_1_1,
  input  logic [7:0]  io_in_QSV_2_0,
  input  logic [7:0]  io_in_QSV_2_1,
  input  logic [7:0]  io_in_QSV_3_0,
  input  logic [7:0]  io_in_QSV_3_1,
  input  logic [7:0]  io_in_QSV_4_0,
  input  logic [7:0]  io_in_QSV_4_1,
  input  logic [7:0]  io_in_QSV_5_0,
  input  logic [7:0]  io_in_QSV_5_1,
  input  logic [7:0]  io_in_QSV_6_0,
  input  logic [7:0]  io_in_QSV_6_1,
  input  logic [7:0]  io_in_QSV_7_0,
  input  logic [7:0]  io_in_QSV_7_1,
  input  logic [7:0]  io_in_QSV_8_0,
  input  logic [7:0]  io_in_QSV_8_1,
  input  logic [7:0]  io_in_QSV_9_0,
  input  logic [7:0]  io_in_QSV_9_1,
  input  logic [7:0]  io_in_QSV_10_0,
  input  logic [7:0]  io_in_QSV_10_1,
  input  logic [7:0]  io_in_QSV_11_0,
  input  logic [7:0]  io_in_QSV_11_1,
  input  logic [7:0]  io_in_QSV_12_0,
  input  logic [7:0]  io_in_QSV_12_1,
  input  logic [7:0]  io_in_QSV_13_0,
  input  logic [7:0]  io_in_QSV_13_1,
  input  logic [7:0]  io_in_QSV_14_0,
  input  logic [7:0]  io_in_QSV_14_1,
  input  logic [7:0]  io_in_QSV_15_0,
  input  logic [7:0]  io_in_QSV_15_1,
  input  logic [7:0]  io_in_QSV_16_0,
  input  logic [7:0]  io_in_QSV_16_1,
  input  logic [7:0]  io_in_QSV_17_0,
  input  logic [7:0]  io_in_QSV_17_1,
  input  logic [7:0]  io_in_QSV_18_0,
  input  logic [7:0]  io_in_QSV_18_1,
  input  logic [7:0]  io_in_QSV_19_0,
  input  logic [7:0]  io_in_QSV_19_1,
  input  logic [7:0]  io_in_QSV_20_0,
  input  logic [7:0]  io_in_QSV_20_1,
  input  logic [7:0]  io_in_QSV_21_0,
  input  logic [7:0]  io_in_QSV_21_1,
  input  logic [7:0]  io_in_QSV_22_0,
  input  logic [7:0]  io_in_QSV_22_1,
  input  logic [7:0]  io_in_QSV_23_0,
  input  logic [7:0]  io_in_QSV_23_1,
  input  logic [7:0]  io_in_QSV_24_0,
  input  logic [7:0]  io_in_QSV_24_1,
  input  logic [7:0]  io_in_QSV_25_0,
  input  logic [7:0]  io_in_QSV_25_1,
  input  logic [7:0]  io_in_QSV_26_0,
  input  logic [7:0]  io_in_QSV_26_1,
  input  logic [7:0]  io_in_QSV_27_0,
  input  logic [7:0]  io_in_QSV_27_1,
  input  logic [7:0]  io_in_QSV_28_0,
  input  logic [7:0]  io_in_QSV_28_1,
  input  logic [7:0]  io_in_QSV_29_0,
  input  logic [7:0]  io_in_QSV_29_1,
  input  logic [7:0]  io_in_QSV_30_0,
  input  logic [7:0]  io_in_QSV_30_1,
  input  logic [7:0]  io_in_QSV_31_0,
  input  logic [7:0]  io_in_QSV_31_1,
  input  logic        io_in_valid,
  output logic [7:0]  io_out_QSV_0_0,
  output logic [7:0]  io_out_QSV_0_1,
  output logic [7:0]  io_out_QSV_1_0,
  output logic [7:0]  io_out_QSV_1_1,
  output logic [7:0]  io_out_QSV_2_0,
  output logic [7:0]  io_out_QSV_2_1,
  output logic [7:0]  io_out_QSV_3_0,
  output logic [7:0]  io_out_QSV_3_1,
  output logic [7:0]  io_out_QSV_4_0,
  output logic [7:0]  io_out_QSV_4_1,
  output logic [7:0]  io_out_QSV_5_0,
  output logic [7:0]  io_out_QSV_5_1,
  output logic [7:0]  io_out_QSV_6_0,
  output logic [7:0]  io_out_QSV_6_1,
  output logic [7:0]  io_out_QSV_7_0,
  output logic [7:0]  io_out_QSV_7_1,
  output logic [7:0]  io_out_QSV_8_0,
  output logic [7:0]  io_out_QSV_8_1,
  output logic [7:0]  io_out_QSV_9_0,
  output logic [7:0]  io_out_QSV_9_1,
  output logic [7:0]  io_out_QSV_10_0,
  output logic [7:0]  io_out_QSV_10_1,
  output logic [7:0]  io_out_QSV_11_0,
  output logic [7:0]  io_out_QSV_11_1,
  output logic [7:0]  io_out_QSV_12_0,
  output logic [7:0]  io_out_QSV_12_1,
  output logic [7:0]  io_out_QSV_13_0,
  output logic [7:0]  io_out_QSV_13_1,
  output logic [7:0]  io_out_QSV_14_0,
  output logic [7:0]  io_out_QSV_14_1,
  output logic [7:0]  io_out_QSV_15_0,
  output logic [7:0]  io_out_QSV_15_1,
  output logic [7:0]  io_out_QSV_16_0,
  output logic [7:0]  io_out_QSV_16_1,
  output logic [7:0]  io_out_QSV_17_0,
  output logic [7:0]  io_out_QSV_17_1,
  output logic [7:0]  io_out_QSV_18_0,
  output logic [7:0]  io_out_QSV_18_1,
  output logic [7:0]  io_out_QSV_19_0,
  output logic [7:0]  io_out_QSV_19_1,
  output logic [7:0]  io_out_QSV_20_0,
  output logic [7:0]  io_out_QSV_20_1,
  output logic [7:0]  io_out_QSV_21_0,
  output logic [7:0]  io_out_QSV_21_1,
  output logic [7:0]  io_out_QSV_22_0,
  output logic [7:0]  io_out_QSV_22_1,
  output logic [7:0]  io_out_QSV_23_0,
  output logic [7:0]  io_out_QSV_23_1,
  output logic [7:0]  io_out_QSV_24_0,
  output logic [7:0]  io_out_QSV_24_1,
  output logic [7:0]  io_out_QSV_25_0,
  output logic [7:0]  io_out_QSV_25_1,
  output logic [7:0]  io_out_QSV_26_0,
  output logic [7:0]  io_out_QSV_26_1,
  output logic [7:0]  io_out_QSV_27_0,
  output logic [7:0]  io_out_QSV_27_1,
  output logic [7:0]  io_out_QSV_28_0,
  output logic [7:0]  io_out_QSV_28_1,
  output logic [7:0]  io_out_QSV_29_0,
  output logic [7:0]  io_out_QSV_29_1,
  output logic [7:0]  io_out_QSV_30_0,
  output logic [7:0]  io_out_QSV_30_1,
  output logic [7:0]  io_out_QSV_31_0,
  output logic [7:0]  io_out_QSV_31_1,
  output logic        io_out_valid
);

  `define DECLARE_STAGE_WIRES(PREFIX) \
    wire [7:0] PREFIX``_0_0, PREFIX``_0_1, PREFIX``_1_0, PREFIX``_1_1, PREFIX``_2_0, PREFIX``_2_1, PREFIX``_3_0, PREFIX``_3_1, \
               PREFIX``_4_0, PREFIX``_4_1, PREFIX``_5_0, PREFIX``_5_1, PREFIX``_6_0, PREFIX``_6_1, PREFIX``_7_0, PREFIX``_7_1, \
               PREFIX``_8_0, PREFIX``_8_1, PREFIX``_9_0, PREFIX``_9_1, PREFIX``_10_0, PREFIX``_10_1, PREFIX``_11_0, PREFIX``_11_1, \
               PREFIX``_12_0, PREFIX``_12_1, PREFIX``_13_0, PREFIX``_13_1, PREFIX``_14_0, PREFIX``_14_1, PREFIX``_15_0, PREFIX``_15_1, \
               PREFIX``_16_0, PREFIX``_16_1, PREFIX``_17_0, PREFIX``_17_1, PREFIX``_18_0, PREFIX``_18_1, PREFIX``_19_0, PREFIX``_19_1, \
               PREFIX``_20_0, PREFIX``_20_1, PREFIX``_21_0, PREFIX``_21_1, PREFIX``_22_0, PREFIX``_22_1, PREFIX``_23_0, PREFIX``_23_1, \
               PREFIX``_24_0, PREFIX``_24_1, PREFIX``_25_0, PREFIX``_25_1, PREFIX``_26_0, PREFIX``_26_1, PREFIX``_27_0, PREFIX``_27_1, \
               PREFIX``_28_0, PREFIX``_28_1, PREFIX``_29_0, PREFIX``_29_1, PREFIX``_30_0, PREFIX``_30_1, PREFIX``_31_0, PREFIX``_31_1; \
    wire PREFIX``_valid;

  `DECLARE_STAGE_WIRES(_m_io_out_QSV)
  `DECLARE_STAGE_WIRES(_m_1_io_out_QSV)
  `DECLARE_STAGE_WIRES(_m_2_io_out_QSV)
  `DECLARE_STAGE_WIRES(_m_3_io_out_QSV)
  `DECLARE_STAGE_WIRES(_m_4_io_out_QSV)
  `DECLARE_STAGE_WIRES(_m_5_io_out_QSV)
  `DECLARE_STAGE_WIRES(_m_6_io_out_QSV)
  `DECLARE_STAGE_WIRES(_m_7_io_out_QSV)
  `DECLARE_STAGE_WIRES(_m_8_io_out_QSV)
  `DECLARE_STAGE_WIRES(_m_9_io_out_QSV)

  `define CONNECT_STAGE(INST, MODULE, IN_PREFIX, OUT_PREFIX) \
    MODULE INST ( \
      .clock(clock), \
      .reset(reset), \
      .io_in_QSV_0_0(IN_PREFIX``_0_0), .io_in_QSV_0_1(IN_PREFIX``_0_1), .io_in_QSV_1_0(IN_PREFIX``_1_0), .io_in_QSV_1_1(IN_PREFIX``_1_1), \
      .io_in_QSV_2_0(IN_PREFIX``_2_0), .io_in_QSV_2_1(IN_PREFIX``_2_1), .io_in_QSV_3_0(IN_PREFIX``_3_0), .io_in_QSV_3_1(IN_PREFIX``_3_1), \
      .io_in_QSV_4_0(IN_PREFIX``_4_0), .io_in_QSV_4_1(IN_PREFIX``_4_1), .io_in_QSV_5_0(IN_PREFIX``_5_0), .io_in_QSV_5_1(IN_PREFIX``_5_1), \
      .io_in_QSV_6_0(IN_PREFIX``_6_0), .io_in_QSV_6_1(IN_PREFIX``_6_1), .io_in_QSV_7_0(IN_PREFIX``_7_0), .io_in_QSV_7_1(IN_PREFIX``_7_1), \
      .io_in_QSV_8_0(IN_PREFIX``_8_0), .io_in_QSV_8_1(IN_PREFIX``_8_1), .io_in_QSV_9_0(IN_PREFIX``_9_0), .io_in_QSV_9_1(IN_PREFIX``_9_1), \
      .io_in_QSV_10_0(IN_PREFIX``_10_0), .io_in_QSV_10_1(IN_PREFIX``_10_1), .io_in_QSV_11_0(IN_PREFIX``_11_0), .io_in_QSV_11_1(IN_PREFIX``_11_1), \
      .io_in_QSV_12_0(IN_PREFIX``_12_0), .io_in_QSV_12_1(IN_PREFIX``_12_1), .io_in_QSV_13_0(IN_PREFIX``_13_0), .io_in_QSV_13_1(IN_PREFIX``_13_1), \
      .io_in_QSV_14_0(IN_PREFIX``_14_0), .io_in_QSV_14_1(IN_PREFIX``_14_1), .io_in_QSV_15_0(IN_PREFIX``_15_0), .io_in_QSV_15_1(IN_PREFIX``_15_1), \
      .io_in_QSV_16_0(IN_PREFIX``_16_0), .io_in_QSV_16_1(IN_PREFIX``_16_1), .io_in_QSV_17_0(IN_PREFIX``_17_0), .io_in_QSV_17_1(IN_PREFIX``_17_1), \
      .io_in_QSV_18_0(IN_PREFIX``_18_0), .io_in_QSV_18_1(IN_PREFIX``_18_1), .io_in_QSV_19_0(IN_PREFIX``_19_0), .io_in_QSV_19_1(IN_PREFIX``_19_1), \
      .io_in_QSV_20_0(IN_PREFIX``_20_0), .io_in_QSV_20_1(IN_PREFIX``_20_1), .io_in_QSV_21_0(IN_PREFIX``_21_0), .io_in_QSV_21_1(IN_PREFIX``_21_1), \
      .io_in_QSV_22_0(IN_PREFIX``_22_0), .io_in_QSV_22_1(IN_PREFIX``_22_1), .io_in_QSV_23_0(IN_PREFIX``_23_0), .io_in_QSV_23_1(IN_PREFIX``_23_1), \
      .io_in_QSV_24_0(IN_PREFIX``_24_0), .io_in_QSV_24_1(IN_PREFIX``_24_1), .io_in_QSV_25_0(IN_PREFIX``_25_0), .io_in_QSV_25_1(IN_PREFIX``_25_1), \
      .io_in_QSV_26_0(IN_PREFIX``_26_0), .io_in_QSV_26_1(IN_PREFIX``_26_1), .io_in_QSV_27_0(IN_PREFIX``_27_0), .io_in_QSV_27_1(IN_PREFIX``_27_1), \
      .io_in_QSV_28_0(IN_PREFIX``_28_0), .io_in_QSV_28_1(IN_PREFIX``_28_1), .io_in_QSV_29_0(IN_PREFIX``_29_0), .io_in_QSV_29_1(IN_PREFIX``_29_1), \
      .io_in_QSV_30_0(IN_PREFIX``_30_0), .io_in_QSV_30_1(IN_PREFIX``_30_1), .io_in_QSV_31_0(IN_PREFIX``_31_0), .io_in_QSV_31_1(IN_PREFIX``_31_1), \
      .io_in_valid(IN_PREFIX``_valid), \
      .io_out_QSV_0_0(OUT_PREFIX``_0_0), .io_out_QSV_0_1(OUT_PREFIX``_0_1), .io_out_QSV_1_0(OUT_PREFIX``_1_0), .io_out_QSV_1_1(OUT_PREFIX``_1_1), \
      .io_out_QSV_2_0(OUT_PREFIX``_2_0), .io_out_QSV_2_1(OUT_PREFIX``_2_1), .io_out_QSV_3_0(OUT_PREFIX``_3_0), .io_out_QSV_3_1(OUT_PREFIX``_3_1), \
      .io_out_QSV_4_0(OUT_PREFIX``_4_0), .io_out_QSV_4_1(OUT_PREFIX``_4_1), .io_out_QSV_5_0(OUT_PREFIX``_5_0), .io_out_QSV_5_1(OUT_PREFIX``_5_1), \
      .io_out_QSV_6_0(OUT_PREFIX``_6_0), .io_out_QSV_6_1(OUT_PREFIX``_6_1), .io_out_QSV_7_0(OUT_PREFIX``_7_0), .io_out_QSV_7_1(OUT_PREFIX``_7_1), \
      .io_out_QSV_8_0(OUT_PREFIX``_8_0), .io_out_QSV_8_1(OUT_PREFIX``_8_1), .io_out_QSV_9_0(OUT_PREFIX``_9_0), .io_out_QSV_9_1(OUT_PREFIX``_9_1), \
      .io_out_QSV_10_0(OUT_PREFIX``_10_0), .io_out_QSV_10_1(OUT_PREFIX``_10_1), .io_out_QSV_11_0(OUT_PREFIX``_11_0), .io_out_QSV_11_1(OUT_PREFIX``_11_1), \
      .io_out_QSV_12_0(OUT_PREFIX``_12_0), .io_out_QSV_12_1(OUT_PREFIX``_12_1), .io_out_QSV_13_0(OUT_PREFIX``_13_0), .io_out_QSV_13_1(OUT_PREFIX``_13_1), \
      .io_out_QSV_14_0(OUT_PREFIX``_14_0), .io_out_QSV_14_1(OUT_PREFIX``_14_1), .io_out_QSV_15_0(OUT_PREFIX``_15_0), .io_out_QSV_15_1(OUT_PREFIX``_15_1), \
      .io_out_QSV_16_0(OUT_PREFIX``_16_0), .io_out_QSV_16_1(OUT_PREFIX``_16_1), .io_out_QSV_17_0(OUT_PREFIX``_17_0), .io_out_QSV_17_1(OUT_PREFIX``_17_1), \
      .io_out_QSV_18_0(OUT_PREFIX``_18_0), .io_out_QSV_18_1(OUT_PREFIX``_18_1), .io_out_QSV_19_0(OUT_PREFIX``_19_0), .io_out_QSV_19_1(OUT_PREFIX``_19_1), \
      .io_out_QSV_20_0(OUT_PREFIX``_20_0), .io_out_QSV_20_1(OUT_PREFIX``_20_1), .io_out_QSV_21_0(OUT_PREFIX``_21_0), .io_out_QSV_21_1(OUT_PREFIX``_21_1), \
      .io_out_QSV_22_0(OUT_PREFIX``_22_0), .io_out_QSV_22_1(OUT_PREFIX``_22_1), .io_out_QSV_23_0(OUT_PREFIX``_23_0), .io_out_QSV_23_1(OUT_PREFIX``_23_1), \
      .io_out_QSV_24_0(OUT_PREFIX``_24_0), .io_out_QSV_24_1(OUT_PREFIX``_24_1), .io_out_QSV_25_0(OUT_PREFIX``_25_0), .io_out_QSV_25_1(OUT_PREFIX``_25_1), \
      .io_out_QSV_26_0(OUT_PREFIX``_26_0), .io_out_QSV_26_1(OUT_PREFIX``_26_1), .io_out_QSV_27_0(OUT_PREFIX``_27_0), .io_out_QSV_27_1(OUT_PREFIX``_27_1), \
      .io_out_QSV_28_0(OUT_PREFIX``_28_0), .io_out_QSV_28_1(OUT_PREFIX``_28_1), .io_out_QSV_29_0(OUT_PREFIX``_29_0), .io_out_QSV_29_1(OUT_PREFIX``_29_1), \
      .io_out_QSV_30_0(OUT_PREFIX``_30_0), .io_out_QSV_30_1(OUT_PREFIX``_30_1), .io_out_QSV_31_0(OUT_PREFIX``_31_0), .io_out_QSV_31_1(OUT_PREFIX``_31_1), \
      .io_out_valid(OUT_PREFIX``_valid) \
    );

  `CONNECT_STAGE(m, HGate5QubitVector8bit, io_in_QSV, _m_io_out_QSV)
  `CONNECT_STAGE(m_1, CNGate5QubitVector8bit, _m_io_out_QSV, _m_1_io_out_QSV)
  `CONNECT_STAGE(m_2, CompatiblePerm, _m_1_io_out_QSV, _m_2_io_out_QSV)
  `CONNECT_STAGE(m_3, CNGate5QubitVector8bit, _m_2_io_out_QSV, _m_3_io_out_QSV)
  `CONNECT_STAGE(m_4, CompatiblePerm_1, _m_3_io_out_QSV, _m_4_io_out_QSV)
  `CONNECT_STAGE(m_5, CompatiblePerm_2, _m_4_io_out_QSV, _m_5_io_out_QSV)
  `CONNECT_STAGE(m_6, CNGate5QubitVector8bit, _m_5_io_out_QSV, _m_6_io_out_QSV)
  `CONNECT_STAGE(m_7, CompatiblePerm_3, _m_6_io_out_QSV, _m_7_io_out_QSV)
  `CONNECT_STAGE(m_8, CompatiblePerm_4, _m_7_io_out_QSV, _m_8_io_out_QSV)
  `CONNECT_STAGE(m_9, CNGate5QubitVector8bit, _m_8_io_out_QSV, _m_9_io_out_QSV)
  `CONNECT_STAGE(m_10, CompatiblePerm_5, _m_9_io_out_QSV, io_out_QSV)

endmodule
