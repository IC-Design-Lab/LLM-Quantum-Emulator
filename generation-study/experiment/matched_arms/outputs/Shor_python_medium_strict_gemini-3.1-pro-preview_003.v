module Shor (
  input  logic       clock,
  input  logic       reset,
  input  logic [7:0] io_in_QSV_0_0,
  input  logic [7:0] io_in_QSV_0_1,
  input  logic [7:0] io_in_QSV_1_0,
  input  logic [7:0] io_in_QSV_1_1,
  input  logic [7:0] io_in_QSV_2_0,
  input  logic [7:0] io_in_QSV_2_1,
  input  logic [7:0] io_in_QSV_3_0,
  input  logic [7:0] io_in_QSV_3_1,
  input  logic [7:0] io_in_QSV_4_0,
  input  logic [7:0] io_in_QSV_4_1,
  input  logic [7:0] io_in_QSV_5_0,
  input  logic [7:0] io_in_QSV_5_1,
  input  logic [7:0] io_in_QSV_6_0,
  input  logic [7:0] io_in_QSV_6_1,
  input  logic [7:0] io_in_QSV_7_0,
  input  logic [7:0] io_in_QSV_7_1,
  input  logic [7:0] io_in_QSV_8_0,
  input  logic [7:0] io_in_QSV_8_1,
  input  logic [7:0] io_in_QSV_9_0,
  input  logic [7:0] io_in_QSV_9_1,
  input  logic [7:0] io_in_QSV_10_0,
  input  logic [7:0] io_in_QSV_10_1,
  input  logic [7:0] io_in_QSV_11_0,
  input  logic [7:0] io_in_QSV_11_1,
  input  logic [7:0] io_in_QSV_12_0,
  input  logic [7:0] io_in_QSV_12_1,
  input  logic [7:0] io_in_QSV_13_0,
  input  logic [7:0] io_in_QSV_13_1,
  input  logic [7:0] io_in_QSV_14_0,
  input  logic [7:0] io_in_QSV_14_1,
  input  logic [7:0] io_in_QSV_15_0,
  input  logic [7:0] io_in_QSV_15_1,
  input  logic [7:0] io_in_QSV_16_0,
  input  logic [7:0] io_in_QSV_16_1,
  input  logic [7:0] io_in_QSV_17_0,
  input  logic [7:0] io_in_QSV_17_1,
  input  logic [7:0] io_in_QSV_18_0,
  input  logic [7:0] io_in_QSV_18_1,
  input  logic [7:0] io_in_QSV_19_0,
  input  logic [7:0] io_in_QSV_19_1,
  input  logic [7:0] io_in_QSV_20_0,
  input  logic [7:0] io_in_QSV_20_1,
  input  logic [7:0] io_in_QSV_21_0,
  input  logic [7:0] io_in_QSV_21_1,
  input  logic [7:0] io_in_QSV_22_0,
  input  logic [7:0] io_in_QSV_22_1,
  input  logic [7:0] io_in_QSV_23_0,
  input  logic [7:0] io_in_QSV_23_1,
  input  logic [7:0] io_in_QSV_24_0,
  input  logic [7:0] io_in_QSV_24_1,
  input  logic [7:0] io_in_QSV_25_0,
  input  logic [7:0] io_in_QSV_25_1,
  input  logic [7:0] io_in_QSV_26_0,
  input  logic [7:0] io_in_QSV_26_1,
  input  logic [7:0] io_in_QSV_27_0,
  input  logic [7:0] io_in_QSV_27_1,
  input  logic [7:0] io_in_QSV_28_0,
  input  logic [7:0] io_in_QSV_28_1,
  input  logic [7:0] io_in_QSV_29_0,
  input  logic [7:0] io_in_QSV_29_1,
  input  logic [7:0] io_in_QSV_30_0,
  input  logic [7:0] io_in_QSV_30_1,
  input  logic [7:0] io_in_QSV_31_0,
  input  logic [7:0] io_in_QSV_31_1,
  input  logic       io_in_valid,
  
  output logic [7:0] io_out_QSV_0_0,
  output logic [7:0] io_out_QSV_0_1,
  output logic [7:0] io_out_QSV_1_0,
  output logic [7:0] io_out_QSV_1_1,
  output logic [7:0] io_out_QSV_2_0,
  output logic [7:0] io_out_QSV_2_1,
  output logic [7:0] io_out_QSV_3_0,
  output logic [7:0] io_out_QSV_3_1,
  output logic [7:0] io_out_QSV_4_0,
  output logic [7:0] io_out_QSV_4_1,
  output logic [7:0] io_out_QSV_5_0,
  output logic [7:0] io_out_QSV_5_1,
  output logic [7:0] io_out_QSV_6_0,
  output logic [7:0] io_out_QSV_6_1,
  output logic [7:0] io_out_QSV_7_0,
  output logic [7:0] io_out_QSV_7_1,
  output logic [7:0] io_out_QSV_8_0,
  output logic [7:0] io_out_QSV_8_1,
  output logic [7:0] io_out_QSV_9_0,
  output logic [7:0] io_out_QSV_9_1,
  output logic [7:0] io_out_QSV_10_0,
  output logic [7:0] io_out_QSV_10_1,
  output logic [7:0] io_out_QSV_11_0,
  output logic [7:0] io_out_QSV_11_1,
  output logic [7:0] io_out_QSV_12_0,
  output logic [7:0] io_out_QSV_12_1,
  output logic [7:0] io_out_QSV_13_0,
  output logic [7:0] io_out_QSV_13_1,
  output logic [7:0] io_out_QSV_14_0,
  output logic [7:0] io_out_QSV_14_1,
  output logic [7:0] io_out_QSV_15_0,
  output logic [7:0] io_out_QSV_15_1,
  output logic [7:0] io_out_QSV_16_0,
  output logic [7:0] io_out_QSV_16_1,
  output logic [7:0] io_out_QSV_17_0,
  output logic [7:0] io_out_QSV_17_1,
  output logic [7:0] io_out_QSV_18_0,
  output logic [7:0] io_out_QSV_18_1,
  output logic [7:0] io_out_QSV_19_0,
  output logic [7:0] io_out_QSV_19_1,
  output logic [7:0] io_out_QSV_20_0,
  output logic [7:0] io_out_QSV_20_1,
  output logic [7:0] io_out_QSV_21_0,
  output logic [7:0] io_out_QSV_21_1,
  output logic [7:0] io_out_QSV_22_0,
  output logic [7:0] io_out_QSV_22_1,
  output logic [7:0] io_out_QSV_23_0,
  output logic [7:0] io_out_QSV_23_1,
  output logic [7:0] io_out_QSV_24_0,
  output logic [7:0] io_out_QSV_24_1,
  output logic [7:0] io_out_QSV_25_0,
  output logic [7:0] io_out_QSV_25_1,
  output logic [7:0] io_out_QSV_26_0,
  output logic [7:0] io_out_QSV_26_1,
  output logic [7:0] io_out_QSV_27_0,
  output logic [7:0] io_out_QSV_27_1,
  output logic [7:0] io_out_QSV_28_0,
  output logic [7:0] io_out_QSV_28_1,
  output logic [7:0] io_out_QSV_29_0,
  output logic [7:0] io_out_QSV_29_1,
  output logic [7:0] io_out_QSV_30_0,
  output logic [7:0] io_out_QSV_30_1,
  output logic [7:0] io_out_QSV_31_0,
  output logic [7:0] io_out_QSV_31_1,
  output logic       io_out_valid
);

  // m macros to define the repeating pattern of 64 vector wires
  `define QSV_WIRES(prefix) \
    logic [7:0] prefix``_io_out_QSV_0_0; logic [7:0] prefix``_io_out_QSV_0_1; \
    logic [7:0] prefix``_io_out_QSV_1_0; logic [7:0] prefix``_io_out_QSV_1_1; \
    logic [7:0] prefix``_io_out_QSV_2_0; logic [7:0] prefix``_io_out_QSV_2_1; \
    logic [7:0] prefix``_io_out_QSV_3_0; logic [7:0] prefix``_io_out_QSV_3_1; \
    logic [7:0] prefix``_io_out_QSV_4_0; logic [7:0] prefix``_io_out_QSV_4_1; \
    logic [7:0] prefix``_io_out_QSV_5_0; logic [7:0] prefix``_io_out_QSV_5_1; \
    logic [7:0] prefix``_io_out_QSV_6_0; logic [7:0] prefix``_io_out_QSV_6_1; \
    logic [7:0] prefix``_io_out_QSV_7_0; logic [7:0] prefix``_io_out_QSV_7_1; \
    logic [7:0] prefix``_io_out_QSV_8_0; logic [7:0] prefix``_io_out_QSV_8_1; \
    logic [7:0] prefix``_io_out_QSV_9_0; logic [7:0] prefix``_io_out_QSV_9_1; \
    logic [7:0] prefix``_io_out_QSV_10_0; logic [7:0] prefix``_io_out_QSV_10_1; \
    logic [7:0] prefix``_io_out_QSV_11_0; logic [7:0] prefix``_io_out_QSV_11_1; \
    logic [7:0] prefix``_io_out_QSV_12_0; logic [7:0] prefix``_io_out_QSV_12_1; \
    logic [7:0] prefix``_io_out_QSV_13_0; logic [7:0] prefix``_io_out_QSV_13_1; \
    logic [7:0] prefix``_io_out_QSV_14_0; logic [7:0] prefix``_io_out_QSV_14_1; \
    logic [7:0] prefix``_io_out_QSV_15_0; logic [7:0] prefix``_io_out_QSV_15_1; \
    logic [7:0] prefix``_io_out_QSV_16_0; logic [7:0] prefix``_io_out_QSV_16_1; \
    logic [7:0] prefix``_io_out_QSV_17_0; logic [7:0] prefix``_io_out_QSV_17_1; \
    logic [7:0] prefix``_io_out_QSV_18_0; logic [7:0] prefix``_io_out_QSV_18_1; \
    logic [7:0] prefix``_io_out_QSV_19_0; logic [7:0] prefix``_io_out_QSV_19_1; \
    logic [7:0] prefix``_io_out_QSV_20_0; logic [7:0] prefix``_io_out_QSV_20_1; \
    logic [7:0] prefix``_io_out_QSV_21_0; logic [7:0] prefix``_io_out_QSV_21_1; \
    logic [7:0] prefix``_io_out_QSV_22_0; logic [7:0] prefix``_io_out_QSV_22_1; \
    logic [7:0] prefix``_io_out_QSV_23_0; logic [7:0] prefix``_io_out_QSV_23_1; \
    logic [7:0] prefix``_io_out_QSV_24_0; logic [7:0] prefix``_io_out_QSV_24_1; \
    logic [7:0] prefix``_io_out_QSV_25_0; logic [7:0] prefix``_io_out_QSV_25_1; \
    logic [7:0] prefix``_io_out_QSV_26_0; logic [7:0] prefix``_io_out_QSV_26_1; \
    logic [7:0] prefix``_io_out_QSV_27_0; logic [7:0] prefix``_io_out_QSV_27_1; \
    logic [7:0] prefix``_io_out_QSV_28_0; logic [7:0] prefix``_io_out_QSV_28_1; \
    logic [7:0] prefix``_io_out_QSV_29_0; logic [7:0] prefix``_io_out_QSV_29_1; \
    logic [7:0] prefix``_io_out_QSV_30_0; logic [7:0] prefix``_io_out_QSV_30_1; \
    logic [7:0] prefix``_io_out_QSV_31_0; logic [7:0] prefix``_io_out_QSV_31_1; \
    logic prefix``_io_out_valid;

  `QSV_WIRES(_m)
  `QSV_WIRES(_m_1)
  `QSV_WIRES(_m_2)
  `QSV_WIRES(_m_3)
  `QSV_WIRES(_m_4)
  `QSV_WIRES(_m_5)
  `QSV_WIRES(_m_6)
  `QSV_WIRES(_m_7)
  `QSV_WIRES(_m_8)
  `QSV_WIRES(_m_9)

  `define CONNECT_QSV_IN_OUT(inst_name, in_prefix, out_prefix) \
    .clock(clock), .reset(reset), .io_in_valid(in_prefix``_valid), \
    .io_in_QSV_0_0(in_prefix``_QSV_0_0), .io_in_QSV_0_1(in_prefix``_QSV_0_1), \
    .io_in_QSV_1_0(in_prefix``_QSV_1_0), .io_in_QSV_1_1(in_prefix``_QSV_1_1), \
    .io_in_QSV_2_0(in_prefix``_QSV_2_0), .io_in_QSV_2_1(in_prefix``_QSV_2_1), \
    .io_in_QSV_3_0(in_prefix``_QSV_3_0), .io_in_QSV_3_1(in_prefix``_QSV_3_1), \
    .io_in_QSV_4_0(in_prefix``_QSV_4_0), .io_in_QSV_4_1(in_prefix``_QSV_4_1), \
    .io_in_QSV_5_0(in_prefix``_QSV_5_0), .io_in_QSV_5_1(in_prefix``_QSV_5_1), \
    .io_in_QSV_6_0(in_prefix``_QSV_6_0), .io_in_QSV_6_1(in_prefix``_QSV_6_1), \
    .io_in_QSV_7_0(in_prefix``_QSV_7_0), .io_in_QSV_7_1(in_prefix``_QSV_7_1), \
    .io_in_QSV_8_0(in_prefix``_QSV_8_0), .io_in_QSV_8_1(in_prefix``_QSV_8_1), \
    .io_in_QSV_9_0(in_prefix``_QSV_9_0), .io_in_QSV_9_1(in_prefix``_QSV_9_1), \
    .io_in_QSV_10_0(in_prefix``_QSV_10_0), .io_in_QSV_10_1(in_prefix``_QSV_10_1), \
    .io_in_QSV_11_0(in_prefix``_QSV_11_0), .io_in_QSV_11_1(in_prefix``_QSV_11_1), \
    .io_in_QSV_12_0(in_prefix``_QSV_12_0), .io_in_QSV_12_1(in_prefix``_QSV_12_1), \
    .io_in_QSV_13_0(in_prefix``_QSV_13_0), .io_in_QSV_13_1(in_prefix``_QSV_13_1), \
    .io_in_QSV_14_0(in_prefix``_QSV_14_0), .io_in_QSV_14_1(in_prefix``_QSV_14_1), \
    .io_in_QSV_15_0(in_prefix``_QSV_15_0), .io_in_QSV_15_1(in_prefix``_QSV_15_1), \
    .io_in_QSV_16_0(in_prefix``_QSV_16_0), .io_in_QSV_16_1(in_prefix``_QSV_16_1), \
    .io_in_QSV_17_0(in_prefix``_QSV_17_0), .io_in_QSV_17_1(in_prefix``_QSV_17_1), \
    .io_in_QSV_18_0(in_prefix``_QSV_18_0), .io_in_QSV_18_1(in_prefix``_QSV_18_1), \
    .io_in_QSV_19_0(in_prefix``_QSV_19_0), .io_in_QSV_19_1(in_prefix``_QSV_19_1), \
    .io_in_QSV_20_0(in_prefix``_QSV_20_0), .io_in_QSV_20_1(in_prefix``_QSV_20_1), \
    .io_in_QSV_21_0(in_prefix``_QSV_21_0), .io_in_QSV_21_1(in_prefix``_QSV_21_1), \
    .io_in_QSV_22_0(in_prefix``_QSV_22_0), .io_in_QSV_22_1(in_prefix``_QSV_22_1), \
    .io_in_QSV_23_0(in_prefix``_QSV_23_0), .io_in_QSV_23_1(in_prefix``_QSV_23_1), \
    .io_in_QSV_24_0(in_prefix``_QSV_24_0), .io_in_QSV_24_1(in_prefix``_QSV_24_1), \
    .io_in_QSV_25_0(in_prefix``_QSV_25_0), .io_in_QSV_25_1(in_prefix``_QSV_25_1), \
    .io_in_QSV_26_0(in_prefix``_QSV_26_0), .io_in_QSV_26_1(in_prefix``_QSV_26_1), \
    .io_in_QSV_27_0(in_prefix``_QSV_27_0), .io_in_QSV_27_1(in_prefix``_QSV_27_1), \
    .io_in_QSV_28_0(in_prefix``_QSV_28_0), .io_in_QSV_28_1(in_prefix``_QSV_28_1), \
    .io_in_QSV_29_0(in_prefix``_QSV_29_0), .io_in_QSV_29_1(in_prefix``_QSV_29_1), \
    .io_in_QSV_30_0(in_prefix``_QSV_30_0), .io_in_QSV_30_1(in_prefix``_QSV_30_1), \
    .io_in_QSV_31_0(in_prefix``_QSV_31_0), .io_in_QSV_31_1(in_prefix``_QSV_31_1), \
    .io_out_valid(out_prefix``_valid), \
    .io_out_QSV_0_0(out_prefix``_QSV_0_0), .io_out_QSV_0_1(out_prefix``_QSV_0_1), \
    .io_out_QSV_1_0(out_prefix``_QSV_1_0), .io_out_QSV_1_1(out_prefix``_QSV_1_1), \
    .io_out_QSV_2_0(out_prefix``_QSV_2_0), .io_out_QSV_2_1(out_prefix``_QSV_2_1), \
    .io_out_QSV_3_0(out_prefix``_QSV_3_0), .io_out_QSV_3_1(out_prefix``_QSV_3_1), \
    .io_out_QSV_4_0(out_prefix``_QSV_4_0), .io_out_QSV_4_1(out_prefix``_QSV_4_1), \
    .io_out_QSV_5_0(out_prefix``_QSV_5_0), .io_out_QSV_5_1(out_prefix``_QSV_5_1), \
    .io_out_QSV_6_0(out_prefix``_QSV_6_0), .io_out_QSV_6_1(out_prefix``_QSV_6_1), \
    .io_out_QSV_7_0(out_prefix``_QSV_7_0), .io_out_QSV_7_1(out_prefix``_QSV_7_1), \
    .io_out_QSV_8_0(out_prefix``_QSV_8_0), .io_out_QSV_8_1(out_prefix``_QSV_8_1), \
    .io_out_QSV_9_0(out_prefix``_QSV_9_0), .io_out_QSV_9_1(out_prefix``_QSV_9_1), \
    .io_out_QSV_10_0(out_prefix``_QSV_10_0), .io_out_QSV_10_1(out_prefix``_QSV_10_1), \
    .io_out_QSV_11_0(out_prefix``_QSV_11_0), .io_out_QSV_11_1(out_prefix``_QSV_11_1), \
    .io_out_QSV_12_0(out_prefix``_QSV_12_0), .io_out_QSV_12_1(out_prefix``_QSV_12_1), \
    .io_out_QSV_13_0(out_prefix``_QSV_13_0), .io_out_QSV_13_1(out_prefix``_QSV_13_1), \
    .io_out_QSV_14_0(out_prefix``_QSV_14_0), .io_out_QSV_14_1(out_prefix``_QSV_14_1), \
    .io_out_QSV_15_0(out_prefix``_QSV_15_0), .io_out_QSV_15_1(out_prefix``_QSV_15_1), \
    .io_out_QSV_16_0(out_prefix``_QSV_16_0), .io_out_QSV_16_1(out_prefix``_QSV_16_1), \
    .io_out_QSV_17_0(out_prefix``_QSV_17_0), .io_out_QSV_17_1(out_prefix``_QSV_17_1), \
    .io_out_QSV_18_0(out_prefix``_QSV_18_0), .io_out_QSV_18_1(out_prefix``_QSV_18_1), \
    .io_out_QSV_19_0(out_prefix``_QSV_19_0), .io_out_QSV_19_1(out_prefix``_QSV_19_1), \
    .io_out_QSV_20_0(out_prefix``_QSV_20_0), .io_out_QSV_20_1(out_prefix``_QSV_20_1), \
    .io_out_QSV_21_0(out_prefix``_QSV_21_0), .io_out_QSV_21_1(out_prefix``_QSV_21_1), \
    .io_out_QSV_22_0(out_prefix``_QSV_22_0), .io_out_QSV_22_1(out_prefix``_QSV_22_1), \
    .io_out_QSV_23_0(out_prefix``_QSV_23_0), .io_out_QSV_23_1(out_prefix``_QSV_23_1), \
    .io_out_QSV_24_0(out_prefix``_QSV_24_0), .io_out_QSV_24_1(out_prefix``_QSV_24_1), \
    .io_out_QSV_25_0(out_prefix``_QSV_25_0), .io_out_QSV_25_1(out_prefix``_QSV_25_1), \
    .io_out_QSV_26_0(out_prefix``_QSV_26_0), .io_out_QSV_26_1(out_prefix``_QSV_26_1), \
    .io_out_QSV_27_0(out_prefix``_QSV_27_0), .io_out_QSV_27_1(out_prefix``_QSV_27_1), \
    .io_out_QSV_28_0(out_prefix``_QSV_28_0), .io_out_QSV_28_1(out_prefix``_QSV_28_1), \
    .io_out_QSV_29_0(out_prefix``_QSV_29_0), .io_out_QSV_29_1(out_prefix``_QSV_29_1), \
    .io_out_QSV_30_0(out_prefix``_QSV_30_0), .io_out_QSV_30_1(out_prefix``_QSV_30_1), \
    .io_out_QSV_31_0(out_prefix``_QSV_31_0), .io_out_QSV_31_1(out_prefix``_QSV_31_1)

  // qc.h(0) (No perm needed)
  HGate5QubitVector8bit m (
    `CONNECT_QSV_IN_OUT(m, io_in, _m_io_out)
  );

  // qc.cx(0, 1) (No perm needed)
  CNGate5QubitVector8bit m_1 (
    `CONNECT_QSV_IN_OUT(m_1, _m_io_out, _m_1_io_out)
  );

  // qc.cx(1, 2)
  CompatiblePerm m_2 (
    `CONNECT_QSV_IN_OUT(m_2, _m_1_io_out, _m_2_io_out)
  );
  CNGate5QubitVector8bit m_3 (
    `CONNECT_QSV_IN_OUT(m_3, _m_2_io_out, _m_3_io_out)
  );
  CompatiblePerm_1 m_4 (
    `CONNECT_QSV_IN_OUT(m_4, _m_3_io_out, _m_4_io_out)
  );

  // qc.cx(2, 3)
  CompatiblePerm_2 m_5 (
    `CONNECT_QSV_IN_OUT(m_5, _m_4_io_out, _m_5_io_out)
  );
  CNGate5QubitVector8bit m_6 (
    `CONNECT_QSV_IN_OUT(m_6, _m_5_io_out, _m_6_io_out)
  );
  CompatiblePerm_3 m_7 (
    `CONNECT_QSV_IN_OUT(m_7, _m_6_io_out, _m_7_io_out)
  );

  // qc.cx(3, 4)
  CompatiblePerm_4 m_8 (
    `CONNECT_QSV_IN_OUT(m_8, _m_7_io_out, _m_8_io_out)
  );
  CNGate5QubitVector8bit m_9 (
    `CONNECT_QSV_IN_OUT(m_9, _m_8_io_out, _m_9_io_out)
  );
  CompatiblePerm_5 m_10 (
    `CONNECT_QSV_IN_OUT(m_10, _m_9_io_out, io_out)
  );

  `undef QSV_WIRES
  `undef CONNECT_QSV_IN_OUT

endmodule
