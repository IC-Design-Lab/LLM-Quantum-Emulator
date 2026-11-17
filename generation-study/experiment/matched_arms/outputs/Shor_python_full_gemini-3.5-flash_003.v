`define DECLARE_STAGE(prefix) \
  logic prefix``_io_out_valid; \
  logic [7:0] prefix``_io_out_QSV_0_0, prefix``_io_out_QSV_0_1, prefix``_io_out_QSV_1_0, prefix``_io_out_QSV_1_1, \
              prefix``_io_out_QSV_2_0, prefix``_io_out_QSV_2_1, prefix``_io_out_QSV_3_0, prefix``_io_out_QSV_3_1, \
              prefix``_io_out_QSV_4_0, prefix``_io_out_QSV_4_1, prefix``_io_out_QSV_5_0, prefix``_io_out_QSV_5_1, \
              prefix``_io_out_QSV_6_0, prefix``_io_out_QSV_6_1, prefix``_io_out_QSV_7_0, prefix``_io_out_QSV_7_1, \
              prefix``_io_out_QSV_8_0, prefix``_io_out_QSV_8_1, prefix``_io_out_QSV_9_0, prefix``_io_out_QSV_9_1, \
              prefix``_io_out_QSV_10_0, prefix``_io_out_QSV_10_1, prefix``_io_out_QSV_11_0, prefix``_io_out_QSV_11_1, \
              prefix``_io_out_QSV_12_0, prefix``_io_out_QSV_12_1, prefix``_io_out_QSV_13_0, prefix``_io_out_QSV_13_1, \
              prefix``_io_out_QSV_14_0, prefix``_io_out_QSV_14_1, prefix``_io_out_QSV_15_0, prefix``_io_out_QSV_15_1, \
              prefix``_io_out_QSV_16_0, prefix``_io_out_QSV_16_1, prefix``_io_out_QSV_17_0, prefix``_io_out_QSV_17_1, \
              prefix``_io_out_QSV_18_0, prefix``_io_out_QSV_18_1, prefix``_io_out_QSV_19_0, prefix``_io_out_QSV_19_1, \
              prefix``_io_out_QSV_20_0, prefix``_io_out_QSV_20_1, prefix``_io_out_QSV_21_0, prefix``_io_out_QSV_21_1, \
              prefix``_io_out_QSV_22_0, prefix``_io_out_QSV_22_1, prefix``_io_out_QSV_23_0, prefix``_io_out_QSV_23_1, \
              prefix``_io_out_QSV_24_0, prefix``_io_out_QSV_24_1, prefix``_io_out_QSV_25_0, prefix``_io_out_QSV_25_1, \
              prefix``_io_out_QSV_26_0, prefix``_io_out_QSV_26_1, prefix``_io_out_QSV_27_0, prefix``_io_out_QSV_27_1, \
              prefix``_io_out_QSV_28_0, prefix``_io_out_QSV_28_1, prefix``_io_out_QSV_29_0, prefix``_io_out_QSV_29_1, \
              prefix``_io_out_QSV_30_0, prefix``_io_out_QSV_30_1, prefix``_io_out_QSV_31_0, prefix``_io_out_QSV_31_1;

`define INSTANTIATE_GATE(gate_module, inst_name, in_pfx, in_val, out_pfx, out_val) \
  gate_module inst_name ( \
    .clock(clock), .reset(reset), .io_in_valid(in_val), .io_out_valid(out_val), \
    .io_in_QSV_0_0(in_pfx``_0_0), .io_in_QSV_0_1(in_pfx``_0_1), .io_in_QSV_1_0(in_pfx``_1_0), .io_in_QSV_1_1(in_pfx``_1_1), \
    .io_in_QSV_2_0(in_pfx``_2_0), .io_in_QSV_2_1(in_pfx``_2_1), .io_in_QSV_3_0(in_pfx``_3_0), .io_in_QSV_3_1(in_pfx``_3_1), \
    .io_in_QSV_4_0(in_pfx``_4_0), .io_in_QSV_4_1(in_pfx``_4_1), .io_in_QSV_5_0(in_pfx``_5_0), .io_in_QSV_5_1(in_pfx``_5_1), \
    .io_in_QSV_6_0(in_pfx``_6_0), .io_in_QSV_6_1(in_pfx``_6_1), .io_in_QSV_7_0(in_pfx``_7_0), .io_in_QSV_7_1(in_pfx``_7_1), \
    .io_in_QSV_8_0(in_pfx``_8_0), .io_in_QSV_8_1(in_pfx``_8_1), .io_in_QSV_9_0(in_pfx``_9_0), .io_in_QSV_9_1(in_pfx``_9_1), \
    .io_in_QSV_10_0(in_pfx``_10_0), .io_in_QSV_10_1(in_pfx``_10_1), .io_in_QSV_11_0(in_pfx``_11_0), .io_in_QSV_11_1(in_pfx``_11_1), \
    .io_in_QSV_12_0(in_pfx``_12_0), .io_in_QSV_12_1(in_pfx``_12_1), .io_in_QSV_13_0(in_pfx``_13_0), .io_in_QSV_13_1(in_pfx``_13_1), \
    .io_in_QSV_14_0(in_pfx``_14_0), .io_in_QSV_14_1(in_pfx``_14_1), .io_in_QSV_15_0(in_pfx``_15_0), .io_in_QSV_15_1(in_pfx``_15_1), \
    .io_in_QSV_16_0(in_pfx``_16_0), .io_in_QSV_16_1(in_pfx``_16_1), .io_in_QSV_17_0(in_pfx``_17_0), .io_in_QSV_17_1(in_pfx``_17_1), \
    .io_in_QSV_18_0(in_pfx``_18_0), .io_in_QSV_18_1(in_pfx``_18_1), .io_in_QSV_19_0(in_pfx``_19_0), .io_in_QSV_19_1(in_pfx``_19_1), \
    .io_in_QSV_20_0(in_pfx``_20_0), .io_in_QSV_20_1(in_pfx``_20_1), .io_in_QSV_21_0(in_pfx``_21_0), .io_in_QSV_21_1(in_pfx``_21_1), \
    .io_in_QSV_22_0(in_pfx``_22_0), .io_in_QSV_22_1(in_pfx``_22_1), .io_in_QSV_23_0(in_pfx``_23_0), .io_in_QSV_23_1(in_pfx``_23_1), \
    .io_in_QSV_24_0(in_pfx``_24_0), .io_in_QSV_24_1(in_pfx``_24_1), .io_in_QSV_25_0(in_pfx``_25_0), .io_in_QSV_25_1(in_pfx``_25_1), \
    .io_in_QSV_26_0(in_pfx``_26_0), .io_in_QSV_26_1(in_pfx``_26_1), .io_in_QSV_27_0(in_pfx``_27_0), .io_in_QSV_27_1(in_pfx``_27_1), \
    .io_in_QSV_28_0(in_pfx``_28_0), .io_in_QSV_28_1(in_pfx``_28_1), .io_in_QSV_29_0(in_pfx``_29_0), .io_in_QSV_29_1(in_pfx``_29_1), \
    .io_in_QSV_30_0(in_pfx``_30_0), .io_in_QSV_30_1(in_pfx``_30_1), .io_in_QSV_31_0(in_pfx``_31_0), .io_in_QSV_31_1(in_pfx``_31_1), \
    .io_out_QSV_0_0(out_pfx``_0_0), .io_out_QSV_0_1(out_pfx``_0_1), .io_out_QSV_1_0(out_pfx``_1_0), .io_out_QSV_1_1(out_pfx``_1_1), \
    .io_out_QSV_2_0(out_pfx``_2_0), .io_out_QSV_2_1(out_pfx``_2_1), .io_out_QSV_3_0(out_pfx``_3_0), .io_out_QSV_3_1(out_pfx``_3_1), \
    .io_out_QSV_4_0(out_pfx``_4_0), .io_out_QSV_4_1(out_pfx``_4_1), .io_out_QSV_5_0(out_pfx``_5_0), .io_out_QSV_5_1(out_pfx``_5_1), \
    .io_out_QSV_6_0(out_pfx``_6_0), .io_out_QSV_6_1(out_pfx``_6_1), .io_out_QSV_7_0(out_pfx``_7_0), .io_out_QSV_7_1(out_pfx``_7_1), \
    .io_out_QSV_8_0(out_pfx``_8_0), .io_out_QSV_8_1(out_pfx``_8_1), .io_out_QSV_9_0(out_pfx``_9_0), .io_out_QSV_9_1(out_pfx``_9_1), \
    .io_out_QSV_10_0(out_pfx``_10_0), .io_out_QSV_10_1(out_pfx``_10_1), .io_out_QSV_11_0(out_pfx``_11_0), .io_out_QSV_11_1(out_pfx``_11_1), \
    .io_out_QSV_12_0(out_pfx``_12_0), .io_out_QSV_12_1(out_pfx``_12_1), .io_out_QSV_13_0(out_pfx``_13_0), .io_out_QSV_13_1(out_pfx``_13_1), \
    .io_out_QSV_14_0(out_pfx``_14_0), .io_out_QSV_14_1(out_pfx``_14_1), .io_out_QSV_15_0(out_pfx``_15_0), .io_out_QSV_15_1(out_pfx``_15_1), \
    .io_out_QSV_16_0(out_pfx``_16_0), .io_out_QSV_16_1(out_pfx``_16_1), .io_out_QSV_17_0(out_pfx``_17_0), .io_out_QSV_17_1(out_pfx``_17_1), \
    .io_out_QSV_18_0(out_pfx``_18_0), .io_out_QSV_18_1(out_pfx``_18_1), .io_out_QSV_19_0(out_pfx``_19_0), .io_out_QSV_19_1(out_pfx``_19_1), \
    .io_out_QSV_20_0(out_pfx``_20_0), .io_out_QSV_20_1(out_pfx``_20_1), .io_out_QSV_21_0(out_pfx``_21_0), .io_out_QSV_21_1(out_pfx``_21_1), \
    .io_out_QSV_22_0(out_pfx``_22_0), .io_out_QSV_22_1(out_pfx``_22_1), .io_out_QSV_23_0(out_pfx``_23_0), .io_out_QSV_23_1(out_pfx``_23_1), \
    .io_out_QSV_24_0(out_pfx``_24_0), .io_out_QSV_24_1(out_pfx``_24_1), .io_out_QSV_25_0(out_pfx``_25_0), .io_out_QSV_25_1(out_pfx``_25_1), \
    .io_out_QSV_26_0(out_pfx``_26_0), .io_out_QSV_26_1(out_pfx``_26_1), .io_out_QSV_27_0(out_pfx``_27_0), .io_out_QSV_27_1(out_pfx``_27_1), \
    .io_out_QSV_28_0(out_pfx``_28_0), .io_out_QSV_28_1(out_pfx``_28_1), .io_out_QSV_29_0(out_pfx``_29_0), .io_out_QSV_29_1(out_pfx``_29_1), \
    .io_out_QSV_30_0(out_pfx``_30_0), .io_out_QSV_30_1(out_pfx``_30_1), .io_out_QSV_31_0(out_pfx``_31_0), .io_out_QSV_31_1(out_pfx``_31_1) \
  );

module Shor (
  input  logic        clock,
  input  logic        reset,
  input  logic [7:0]  io_in_QSV_0_0,   input  logic [7:0]  io_in_QSV_0_1,
  input  logic [7:0]  io_in_QSV_1_0,   input  logic [7:0]  io_in_QSV_1_1,
  input  logic [7:0]  io_in_QSV_2_0,   input  logic [7:0]  io_in_QSV_2_1,
  input  logic [7:0]  io_in_QSV_3_0,   input  logic [7:0]  io_in_QSV_3_1,
  input  logic [7:0]  io_in_QSV_4_0,   input  logic [7:0]  io_in_QSV_4_1,
  input  logic [7:0]  io_in_QSV_5_0,   input  logic [7:0]  io_in_QSV_5_1,
  input  logic [7:0]  io_in_QSV_6_0,   input  logic [7:0]  io_in_QSV_6_1,
  input  logic [7:0]  io_in_QSV_7_0,   input  logic [7:0]  io_in_QSV_7_1,
  input  logic [7:0]  io_in_QSV_8_0,   input  logic [7:0]  io_in_QSV_8_1,
  input  logic [7:0]  io_in_QSV_9_0,   input  logic [7:0]  io_in_QSV_9_1,
  input  logic [7:0]  io_in_QSV_10_0,  input  logic [7:0]  io_in_QSV_10_1,
  input  logic [7:0]  io_in_QSV_11_0,  input  logic [7:0]  io_in_QSV_11_1,
  input  logic [7:0]  io_in_QSV_12_0,  input  logic [7:0]  io_in_QSV_12_1,
  input  logic [7:0]  io_in_QSV_13_0,  input  logic [7:0]  io_in_QSV_13_1,
  input  logic [7:0]  io_in_QSV_14_0,  input  logic [7:0]  io_in_QSV_14_1,
  input  logic [7:0]  io_in_QSV_15_0,  input  logic [7:0]  io_in_QSV_15_1,
  input  logic [7:0]  io_in_QSV_16_0,  input  logic [7:0]  io_in_QSV_16_1,
  input  logic [7:0]  io_in_QSV_17_0,  input  logic [7:0]  io_in_QSV_17_1,
  input  logic [7:0]  io_in_QSV_18_0,  input  logic [7:0]  io_in_QSV_18_1,
  input  logic [7:0]  io_in_QSV_19_0,  input  logic [7:0]  io_in_QSV_19_1,
  input  logic [7:0]  io_in_QSV_20_0,  input  logic [7:0]  io_in_QSV_20_1,
  input  logic [7:0]  io_in_QSV_21_0,  input  logic [7:0]  io_in_QSV_21_1,
  input  logic [7:0]  io_in_QSV_22_0,  input  logic [7:0]  io_in_QSV_22_1,
  input  logic [7:0]  io_in_QSV_23_0,  input  logic [7:0]  io_in_QSV_23_1,
  input  logic [7:0]  io_in_QSV_24_0,  input  logic [7:0]  io_in_QSV_24_1,
  input  logic [7:0]  io_in_QSV_25_0,  input  logic [7:0]  io_in_QSV_25_1,
  input  logic [7:0]  io_in_QSV_26_0,  input  logic [7:0]  io_in_QSV_26_1,
  input  logic [7:0]  io_in_QSV_27_0,  input  logic [7:0]  io_in_QSV_27_1,
  input  logic [7:0]  io_in_QSV_28_0,  input  logic [7:0]  io_in_QSV_28_1,
  input  logic [7:0]  io_in_QSV_29_0,  input  logic [7:0]  io_in_QSV_29_1,
  input  logic [7:0]  io_in_QSV_30_0,  input  logic [7:0]  io_in_QSV_30_1,
  input  logic [7:0]  io_in_QSV_31_0,  input  logic [7:0]  io_in_QSV_31_1,
  input  logic        io_in_valid,
  output logic [7:0]  io_out_QSV_0_0,  output logic [7:0]  io_out_QSV_0_1,
  output logic [7:0]  io_out_QSV_1_0,  output logic [7:0]  io_out_QSV_1_1,
  output logic [7:0]  io_out_QSV_2_0,  output logic [7:0]  io_out_QSV_2_1,
  output logic [7:0]  io_out_QSV_3_0,  output logic [7:0]  io_out_QSV_3_1,
  output logic [7:0]  io_out_QSV_4_0,  output logic [7:0]  io_out_QSV_4_1,
  output logic [7:0]  io_out_QSV_5_0,  output logic [7:0]  io_out_QSV_5_1,
  output logic [7:0]  io_out_QSV_6_0,  output logic [7:0]  io_out_QSV_6_1,
  output logic [7:0]  io_out_QSV_7_0,  output logic [7:0]  io_out_QSV_7_1,
  output logic [7:0]  io_out_QSV_8_0,  output logic [7:0]  io_out_QSV_8_1,
  output logic [7:0]  io_out_QSV_9_0,  output logic [7:0]  io_out_QSV_9_1,
  output logic [7:0]  io_out_QSV_10_0, output logic [7:0]  io_out_QSV_10_1,
  output logic [7:0]  io_out_QSV_11_0, output logic [7:0]  io_out_QSV_11_1,
  output logic [7:0]  io_out_QSV_12_0, output logic [7:0]  io_out_QSV_12_1,
  output logic [7:0]  io_out_QSV_13_0, output logic [7:0]  io_out_QSV_13_1,
  output logic [7:0]  io_out_QSV_14_0, output logic [7:0]  io_out_QSV_14_1,
  output logic [7:0]  io_out_QSV_15_0, output logic [7:0]  io_out_QSV_15_1,
  output logic [7:0]  io_out_QSV_16_0, output logic [7:0]  io_out_QSV_16_1,
  output logic [7:0]  io_out_QSV_17_0, output logic [7:0]  io_out_QSV_17_1,
  output logic [7:0]  io_out_QSV_18_0, output logic [7:0]  io_out_QSV_18_1,
  output logic [7:0]  io_out_QSV_19_0, output logic [7:0]  io_out_QSV_19_1,
  output logic [7:0]  io_out_QSV_20_0, output logic [7:0]  io_out_QSV_20_1,
  output logic [7:0]  io_out_QSV_21_0, output logic [7:0]  io_out_QSV_21_1,
  output logic [7:0]  io_out_QSV_22_0, output logic [7:0]  io_out_QSV_22_1,
  output logic [7:0]  io_out_QSV_23_0, output logic [7:0]  io_out_QSV_23_1,
  output logic [7:0]  io_out_QSV_24_0, output logic [7:0]  io_out_QSV_24_1,
  output logic [7:0]  io_out_QSV_25_0, output logic [7:0]  io_out_QSV_25_1,
  output logic [7:0]  io_out_QSV_26_0, output logic [7:0]  io_out_QSV_26_1,
  output logic [7:0]  io_out_QSV_27_0, output logic [7:0]  io_out_QSV_27_1,
  output logic [7:0]  io_out_QSV_28_0, output logic [7:0]  io_out_QSV_28_1,
  output logic [7:0]  io_out_QSV_29_0, output logic [7:0]  io_out_QSV_29_1,
  output logic [7:0]  io_out_QSV_30_0, output logic [7:0]  io_out_QSV_30_1,
  output logic [7:0]  io_out_QSV_31_0, output logic [7:0]  io_out_QSV_31_1,
  output logic        io_out_valid
);

  `DECLARE_STAGE(_m)
  `DECLARE_STAGE(_m_1)
  `DECLARE_STAGE(_m_2)
  `DECLARE_STAGE(_m_3)
  `DECLARE_STAGE(_m_4)
  `DECLARE_STAGE(_m_5)
  `DECLARE_STAGE(_m_6)
  `DECLARE_STAGE(_m_7)
  `DECLARE_STAGE(_m_8)
  `DECLARE_STAGE(_m_9)
  `DECLARE_STAGE(_m_10)
  `DECLARE_STAGE(_m_11)
  `DECLARE_STAGE(_m_12)
  `DECLARE_STAGE(_m_13)
  `DECLARE_STAGE(_m_14)

  `INSTANTIATE_GATE(HGate5QubitVector8bit, m, io_in_QSV, io_in_valid, _m_io_out_QSV, _m_io_out_valid)
  `INSTANTIATE_GATE(CompatiblePerm, m_1, _m_io_out_QSV, _m_io_out_valid, _m_1_io_out_QSV, _m_1_io_out_valid)
  `INSTANTIATE_GATE(CNGate5QubitVector8bit, m_2, _m_1_io_out_QSV, _m_1_io_out_valid, _m_2_io_out_QSV, _m_2_io_out_valid)
  `INSTANTIATE_GATE(CompatiblePerm_1, m_3, _m_2_io_out_QSV, _m_2_io_out_valid, _m_3_io_out_QSV, _m_3_io_out_valid)
  `INSTANTIATE_GATE(CompatiblePerm_2, m_4, _m_3_io_out_QSV, _m_3_io_out_valid, _m_4_io_out_QSV, _m_4_io_out_valid)
  `INSTANTIATE_GATE(CNGate5QubitVector8bit, m_5, _m_4_io_out_QSV, _m_4_io_out_valid, _m_5_io_out_QSV, _m_5_io_out_valid)
  `INSTANTIATE_GATE(CompatiblePerm_3, m_6, _m_5_io_out_QSV, _m_5_io_out_valid, _m_6_io_out_QSV, _m_6_io_out_valid)
  `INSTANTIATE_GATE(CompatiblePerm_4, m_7, _m_6_io_out_QSV, _m_6_io_out_valid, _m_7_io_out_QSV, _m_7_io_out_valid)
  `INSTANTIATE_GATE(CNGate5QubitVector8bit, m_8, _m_7_io_out_QSV, _m_7_io_out_valid, _m_8_io_out_QSV, _m_8_io_out_valid)
  `INSTANTIATE_GATE(CompatiblePerm_5, m_9, _m_8_io_out_QSV, _m_8_io_out_valid, _m_9_io_out_QSV, _m_9_io_out_valid)
  `INSTANTIATE_GATE(CompatiblePerm_6, m_10, _m_9_io_out_QSV, _m_9_io_out_valid, _m_10_io_out_QSV, _m_10_io_out_valid)
  `INSTANTIATE_GATE(CNGate5QubitVector8bit, m_11, _m_10_io_out_QSV, _m_10_io_out_valid, _m_11_io_out_QSV, _m_11_io_out_valid)
  `INSTANTIATE_GATE(CompatiblePerm_1, m_12, _m_11_io_out_QSV, _m_11_io_out_valid, _m_12_io_out_QSV, _m_12_io_out_valid)
  `INSTANTIATE_GATE(CompatiblePerm_4, m_13, _m_12_io_out_QSV, _m_12_io_out_valid, _m_13_io_out_QSV, _m_13_io_out_valid)
  `INSTANTIATE_GATE(CompatiblePerm_9, m_14, _m_13_io_out_QSV, _m_13_io_out_valid, _m_14_io_out_QSV, _m_14_io_out_valid)
  `INSTANTIATE_GATE(CompatiblePerm_10, m_15, _m_14_io_out_QSV, _m_14_io_out_valid, io_out_QSV, io_out_valid)

endmodule
