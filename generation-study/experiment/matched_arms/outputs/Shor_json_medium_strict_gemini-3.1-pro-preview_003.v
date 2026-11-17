module Shor (
  input  wire       clock,
  input  wire       reset,
  input  wire [7:0] io_in_QSV_0_0,
  input  wire [7:0] io_in_QSV_0_1,
  input  wire [7:0] io_in_QSV_1_0,
  input  wire [7:0] io_in_QSV_1_1,
  input  wire [7:0] io_in_QSV_2_0,
  input  wire [7:0] io_in_QSV_2_1,
  input  wire [7:0] io_in_QSV_3_0,
  input  wire [7:0] io_in_QSV_3_1,
  input  wire [7:0] io_in_QSV_4_0,
  input  wire [7:0] io_in_QSV_4_1,
  input  wire [7:0] io_in_QSV_5_0,
  input  wire [7:0] io_in_QSV_5_1,
  input  wire [7:0] io_in_QSV_6_0,
  input  wire [7:0] io_in_QSV_6_1,
  input  wire [7:0] io_in_QSV_7_0,
  input  wire [7:0] io_in_QSV_7_1,
  input  wire [7:0] io_in_QSV_8_0,
  input  wire [7:0] io_in_QSV_8_1,
  input  wire [7:0] io_in_QSV_9_0,
  input  wire [7:0] io_in_QSV_9_1,
  input  wire [7:0] io_in_QSV_10_0,
  input  wire [7:0] io_in_QSV_10_1,
  input  wire [7:0] io_in_QSV_11_0,
  input  wire [7:0] io_in_QSV_11_1,
  input  wire [7:0] io_in_QSV_12_0,
  input  wire [7:0] io_in_QSV_12_1,
  input  wire [7:0] io_in_QSV_13_0,
  input  wire [7:0] io_in_QSV_13_1,
  input  wire [7:0] io_in_QSV_14_0,
  input  wire [7:0] io_in_QSV_14_1,
  input  wire [7:0] io_in_QSV_15_0,
  input  wire [7:0] io_in_QSV_15_1,
  input  wire [7:0] io_in_QSV_16_0,
  input  wire [7:0] io_in_QSV_16_1,
  input  wire [7:0] io_in_QSV_17_0,
  input  wire [7:0] io_in_QSV_17_1,
  input  wire [7:0] io_in_QSV_18_0,
  input  wire [7:0] io_in_QSV_18_1,
  input  wire [7:0] io_in_QSV_19_0,
  input  wire [7:0] io_in_QSV_19_1,
  input  wire [7:0] io_in_QSV_20_0,
  input  wire [7:0] io_in_QSV_20_1,
  input  wire [7:0] io_in_QSV_21_0,
  input  wire [7:0] io_in_QSV_21_1,
  input  wire [7:0] io_in_QSV_22_0,
  input  wire [7:0] io_in_QSV_22_1,
  input  wire [7:0] io_in_QSV_23_0,
  input  wire [7:0] io_in_QSV_23_1,
  input  wire [7:0] io_in_QSV_24_0,
  input  wire [7:0] io_in_QSV_24_1,
  input  wire [7:0] io_in_QSV_25_0,
  input  wire [7:0] io_in_QSV_25_1,
  input  wire [7:0] io_in_QSV_26_0,
  input  wire [7:0] io_in_QSV_26_1,
  input  wire [7:0] io_in_QSV_27_0,
  input  wire [7:0] io_in_QSV_27_1,
  input  wire [7:0] io_in_QSV_28_0,
  input  wire [7:0] io_in_QSV_28_1,
  input  wire [7:0] io_in_QSV_29_0,
  input  wire [7:0] io_in_QSV_29_1,
  input  wire [7:0] io_in_QSV_30_0,
  input  wire [7:0] io_in_QSV_30_1,
  input  wire [7:0] io_in_QSV_31_0,
  input  wire [7:0] io_in_QSV_31_1,
  input  wire       io_in_valid,

  output wire [7:0] io_out_QSV_0_0,
  output wire [7:0] io_out_QSV_0_1,
  output wire [7:0] io_out_QSV_1_0,
  output wire [7:0] io_out_QSV_1_1,
  output wire [7:0] io_out_QSV_2_0,
  output wire [7:0] io_out_QSV_2_1,
  output wire [7:0] io_out_QSV_3_0,
  output wire [7:0] io_out_QSV_3_1,
  output wire [7:0] io_out_QSV_4_0,
  output wire [7:0] io_out_QSV_4_1,
  output wire [7:0] io_out_QSV_5_0,
  output wire [7:0] io_out_QSV_5_1,
  output wire [7:0] io_out_QSV_6_0,
  output wire [7:0] io_out_QSV_6_1,
  output wire [7:0] io_out_QSV_7_0,
  output wire [7:0] io_out_QSV_7_1,
  output wire [7:0] io_out_QSV_8_0,
  output wire [7:0] io_out_QSV_8_1,
  output wire [7:0] io_out_QSV_9_0,
  output wire [7:0] io_out_QSV_9_1,
  output wire [7:0] io_out_QSV_10_0,
  output wire [7:0] io_out_QSV_10_1,
  output wire [7:0] io_out_QSV_11_0,
  output wire [7:0] io_out_QSV_11_1,
  output wire [7:0] io_out_QSV_12_0,
  output wire [7:0] io_out_QSV_12_1,
  output wire [7:0] io_out_QSV_13_0,
  output wire [7:0] io_out_QSV_13_1,
  output wire [7:0] io_out_QSV_14_0,
  output wire [7:0] io_out_QSV_14_1,
  output wire [7:0] io_out_QSV_15_0,
  output wire [7:0] io_out_QSV_15_1,
  output wire [7:0] io_out_QSV_16_0,
  output wire [7:0] io_out_QSV_16_1,
  output wire [7:0] io_out_QSV_17_0,
  output wire [7:0] io_out_QSV_17_1,
  output wire [7:0] io_out_QSV_18_0,
  output wire [7:0] io_out_QSV_18_1,
  output wire [7:0] io_out_QSV_19_0,
  output wire [7:0] io_out_QSV_19_1,
  output wire [7:0] io_out_QSV_20_0,
  output wire [7:0] io_out_QSV_20_1,
  output wire [7:0] io_out_QSV_21_0,
  output wire [7:0] io_out_QSV_21_1,
  output wire [7:0] io_out_QSV_22_0,
  output wire [7:0] io_out_QSV_22_1,
  output wire [7:0] io_out_QSV_23_0,
  output wire [7:0] io_out_QSV_23_1,
  output wire [7:0] io_out_QSV_24_0,
  output wire [7:0] io_out_QSV_24_1,
  output wire [7:0] io_out_QSV_25_0,
  output wire [7:0] io_out_QSV_25_1,
  output wire [7:0] io_out_QSV_26_0,
  output wire [7:0] io_out_QSV_26_1,
  output wire [7:0] io_out_QSV_27_0,
  output wire [7:0] io_out_QSV_27_1,
  output wire [7:0] io_out_QSV_28_0,
  output wire [7:0] io_out_QSV_28_1,
  output wire [7:0] io_out_QSV_29_0,
  output wire [7:0] io_out_QSV_29_1,
  output wire [7:0] io_out_QSV_30_0,
  output wire [7:0] io_out_QSV_30_1,
  output wire [7:0] io_out_QSV_31_0,
  output wire [7:0] io_out_QSV_31_1,
  output wire       io_out_valid
);

  // Macro-free generation of pipeline wires
`define DECLARE_STAGE_WIRES(STAGE) \
  wire [7:0] ``STAGE``_io_out_QSV_0_0, ``STAGE``_io_out_QSV_0_1; \
  wire [7:0] ``STAGE``_io_out_QSV_1_0, ``STAGE``_io_out_QSV_1_1; \
  wire [7:0] ``STAGE``_io_out_QSV_2_0, ``STAGE``_io_out_QSV_2_1; \
  wire [7:0] ``STAGE``_io_out_QSV_3_0, ``STAGE``_io_out_QSV_3_1; \
  wire [7:0] ``STAGE``_io_out_QSV_4_0, ``STAGE``_io_out_QSV_4_1; \
  wire [7:0] ``STAGE``_io_out_QSV_5_0, ``STAGE``_io_out_QSV_5_1; \
  wire [7:0] ``STAGE``_io_out_QSV_6_0, ``STAGE``_io_out_QSV_6_1; \
  wire [7:0] ``STAGE``_io_out_QSV_7_0, ``STAGE``_io_out_QSV_7_1; \
  wire [7:0] ``STAGE``_io_out_QSV_8_0, ``STAGE``_io_out_QSV_8_1; \
  wire [7:0] ``STAGE``_io_out_QSV_9_0, ``STAGE``_io_out_QSV_9_1; \
  wire [7:0] ``STAGE``_io_out_QSV_10_0, ``STAGE``_io_out_QSV_10_1; \
  wire [7:0] ``STAGE``_io_out_QSV_11_0, ``STAGE``_io_out_QSV_11_1; \
  wire [7:0] ``STAGE``_io_out_QSV_12_0, ``STAGE``_io_out_QSV_12_1; \
  wire [7:0] ``STAGE``_io_out_QSV_13_0, ``STAGE``_io_out_QSV_13_1; \
  wire [7:0] ``STAGE``_io_out_QSV_14_0, ``STAGE``_io_out_QSV_14_1; \
  wire [7:0] ``STAGE``_io_out_QSV_15_0, ``STAGE``_io_out_QSV_15_1; \
  wire [7:0] ``STAGE``_io_out_QSV_16_0, ``STAGE``_io_out_QSV_16_1; \
  wire [7:0] ``STAGE``_io_out_QSV_17_0, ``STAGE``_io_out_QSV_17_1; \
  wire [7:0] ``STAGE``_io_out_QSV_18_0, ``STAGE``_io_out_QSV_18_1; \
  wire [7:0] ``STAGE``_io_out_QSV_19_0, ``STAGE``_io_out_QSV_19_1; \
  wire [7:0] ``STAGE``_io_out_QSV_20_0, ``STAGE``_io_out_QSV_20_1; \
  wire [7:0] ``STAGE``_io_out_QSV_21_0, ``STAGE``_io_out_QSV_21_1; \
  wire [7:0] ``STAGE``_io_out_QSV_22_0, ``STAGE``_io_out_QSV_22_1; \
  wire [7:0] ``STAGE``_io_out_QSV_23_0, ``STAGE``_io_out_QSV_23_1; \
  wire [7:0] ``STAGE``_io_out_QSV_24_0, ``STAGE``_io_out_QSV_24_1; \
  wire [7:0] ``STAGE``_io_out_QSV_25_0, ``STAGE``_io_out_QSV_25_1; \
  wire [7:0] ``STAGE``_io_out_QSV_26_0, ``STAGE``_io_out_QSV_26_1; \
  wire [7:0] ``STAGE``_io_out_QSV_27_0, ``STAGE``_io_out_QSV_27_1; \
  wire [7:0] ``STAGE``_io_out_QSV_28_0, ``STAGE``_io_out_QSV_28_1; \
  wire [7:0] ``STAGE``_io_out_QSV_29_0, ``STAGE``_io_out_QSV_29_1; \
  wire [7:0] ``STAGE``_io_out_QSV_30_0, ``STAGE``_io_out_QSV_30_1; \
  wire [7:0] ``STAGE``_io_out_QSV_31_0, ``STAGE``_io_out_QSV_31_1; \
  wire       ``STAGE``_io_out_valid;

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
`DECLARE_STAGE_WIRES(_m_10)
`DECLARE_STAGE_WIRES(_m_11)

`define BIND_STAGE_PORTS(PREFIX_IN, PREFIX_OUT) \
  .clock(clock), .reset(reset), \
  .io_in_QSV_0_0(PREFIX_IN``_QSV_0_0), .io_in_QSV_0_1(PREFIX_IN``_QSV_0_1), \
  .io_in_QSV_1_0(PREFIX_IN``_QSV_1_0), .io_in_QSV_1_1(PREFIX_IN``_QSV_1_1), \
  .io_in_QSV_2_0(PREFIX_IN``_QSV_2_0), .io_in_QSV_2_1(PREFIX_IN``_QSV_2_1), \
  .io_in_QSV_3_0(PREFIX_IN``_QSV_3_0), .io_in_QSV_3_1(PREFIX_IN``_QSV_3_1), \
  .io_in_QSV_4_0(PREFIX_IN``_QSV_4_0), .io_in_QSV_4_1(PREFIX_IN``_QSV_4_1), \
  .io_in_QSV_5_0(PREFIX_IN``_QSV_5_0), .io_in_QSV_5_1(PREFIX_IN``_QSV_5_1), \
  .io_in_QSV_6_0(PREFIX_IN``_QSV_6_0), .io_in_QSV_6_1(PREFIX_IN``_QSV_6_1), \
  .io_in_QSV_7_0(PREFIX_IN``_QSV_7_0), .io_in_QSV_7_1(PREFIX_IN``_QSV_7_1), \
  .io_in_QSV_8_0(PREFIX_IN``_QSV_8_0), .io_in_QSV_8_1(PREFIX_IN``_QSV_8_1), \
  .io_in_QSV_9_0(PREFIX_IN``_QSV_9_0), .io_in_QSV_9_1(PREFIX_IN``_QSV_9_1), \
  .io_in_QSV_10_0(PREFIX_IN``_QSV_10_0), .io_in_QSV_10_1(PREFIX_IN``_QSV_10_1), \
  .io_in_QSV_11_0(PREFIX_IN``_QSV_11_0), .io_in_QSV_11_1(PREFIX_IN``_QSV_11_1), \
  .io_in_QSV_12_0(PREFIX_IN``_QSV_12_0), .io_in_QSV_12_1(PREFIX_IN``_QSV_12_1), \
  .io_in_QSV_13_0(PREFIX_IN``_QSV_13_0), .io_in_QSV_13_1(PREFIX_IN``_QSV_13_1), \
  .io_in_QSV_14_0(PREFIX_IN``_QSV_14_0), .io_in_QSV_14_1(PREFIX_IN``_QSV_14_1), \
  .io_in_QSV_15_0(PREFIX_IN``_QSV_15_0), .io_in_QSV_15_1(PREFIX_IN``_QSV_15_1), \
  .io_in_QSV_16_0(PREFIX_IN``_QSV_16_0), .io_in_QSV_16_1(PREFIX_IN``_QSV_16_1), \
  .io_in_QSV_17_0(PREFIX_IN``_QSV_17_0), .io_in_QSV_17_1(PREFIX_IN``_QSV_17_1), \
  .io_in_QSV_18_0(PREFIX_IN``_QSV_18_0), .io_in_QSV_18_1(PREFIX_IN``_QSV_18_1), \
  .io_in_QSV_19_0(PREFIX_IN``_QSV_19_0), .io_in_QSV_19_1(PREFIX_IN``_QSV_19_1), \
  .io_in_QSV_20_0(PREFIX_IN``_QSV_20_0), .io_in_QSV_20_1(PREFIX_IN``_QSV_20_1), \
  .io_in_QSV_21_0(PREFIX_IN``_QSV_21_0), .io_in_QSV_21_1(PREFIX_IN``_QSV_21_1), \
  .io_in_QSV_22_0(PREFIX_IN``_QSV_22_0), .io_in_QSV_22_1(PREFIX_IN``_QSV_22_1), \
  .io_in_QSV_23_0(PREFIX_IN``_QSV_23_0), .io_in_QSV_23_1(PREFIX_IN``_QSV_23_1), \
  .io_in_QSV_24_0(PREFIX_IN``_QSV_24_0), .io_in_QSV_24_1(PREFIX_IN``_QSV_24_1), \
  .io_in_QSV_25_0(PREFIX_IN``_QSV_25_0), .io_in_QSV_25_1(PREFIX_IN``_QSV_25_1), \
  .io_in_QSV_26_0(PREFIX_IN``_QSV_26_0), .io_in_QSV_26_1(PREFIX_IN``_QSV_26_1), \
  .io_in_QSV_27_0(PREFIX_IN``_QSV_27_0), .io_in_QSV_27_1(PREFIX_IN``_QSV_27_1), \
  .io_in_QSV_28_0(PREFIX_IN``_QSV_28_0), .io_in_QSV_28_1(PREFIX_IN``_QSV_28_1), \
  .io_in_QSV_29_0(PREFIX_IN``_QSV_29_0), .io_in_QSV_29_1(PREFIX_IN``_QSV_29_1), \
  .io_in_QSV_30_0(PREFIX_IN``_QSV_30_0), .io_in_QSV_30_1(PREFIX_IN``_QSV_30_1), \
  .io_in_QSV_31_0(PREFIX_IN``_QSV_31_0), .io_in_QSV_31_1(PREFIX_IN``_QSV_31_1), \
  .io_in_valid(PREFIX_IN``_valid), \
  .io_out_QSV_0_0(PREFIX_OUT``_QSV_0_0), .io_out_QSV_0_1(PREFIX_OUT``_QSV_0_1), \
  .io_out_QSV_1_0(PREFIX_OUT``_QSV_1_0), .io_out_QSV_1_1(PREFIX_OUT``_QSV_1_1), \
  .io_out_QSV_2_0(PREFIX_OUT``_QSV_2_0), .io_out_QSV_2_1(PREFIX_OUT``_QSV_2_1), \
  .io_out_QSV_3_0(PREFIX_OUT``_QSV_3_0), .io_out_QSV_3_1(PREFIX_OUT``_QSV_3_1), \
  .io_out_QSV_4_0(PREFIX_OUT``_QSV_4_0), .io_out_QSV_4_1(PREFIX_OUT``_QSV_4_1), \
  .io_out_QSV_5_0(PREFIX_OUT``_QSV_5_0), .io_out_QSV_5_1(PREFIX_OUT``_QSV_5_1), \
  .io_out_QSV_6_0(PREFIX_OUT``_QSV_6_0), .io_out_QSV_6_1(PREFIX_OUT``_QSV_6_1), \
  .io_out_QSV_7_0(PREFIX_OUT``_QSV_7_0), .io_out_QSV_7_1(PREFIX_OUT``_QSV_7_1), \
  .io_out_QSV_8_0(PREFIX_OUT``_QSV_8_0), .io_out_QSV_8_1(PREFIX_OUT``_QSV_8_1), \
  .io_out_QSV_9_0(PREFIX_OUT``_QSV_9_0), .io_out_QSV_9_1(PREFIX_OUT``_QSV_9_1), \
  .io_out_QSV_10_0(PREFIX_OUT``_QSV_10_0), .io_out_QSV_10_1(PREFIX_OUT``_QSV_10_1), \
  .io_out_QSV_11_0(PREFIX_OUT``_QSV_11_0), .io_out_QSV_11_1(PREFIX_OUT``_QSV_11_1), \
  .io_out_QSV_12_0(PREFIX_OUT``_QSV_12_0), .io_out_QSV_12_1(PREFIX_OUT``_QSV_12_1), \
  .io_out_QSV_13_0(PREFIX_OUT``_QSV_13_0), .io_out_QSV_13_1(PREFIX_OUT``_QSV_13_1), \
  .io_out_QSV_14_0(PREFIX_OUT``_QSV_14_0), .io_out_QSV_14_1(PREFIX_OUT``_QSV_14_1), \
  .io_out_QSV_15_0(PREFIX_OUT``_QSV_15_0), .io_out_QSV_15_1(PREFIX_OUT``_QSV_15_1), \
  .io_out_QSV_16_0(PREFIX_OUT``_QSV_16_0), .io_out_QSV_16_1(PREFIX_OUT``_QSV_16_1), \
  .io_out_QSV_17_0(PREFIX_OUT``_QSV_17_0), .io_out_QSV_17_1(PREFIX_OUT``_QSV_17_1), \
  .io_out_QSV_18_0(PREFIX_OUT``_QSV_18_0), .io_out_QSV_18_1(PREFIX_OUT``_QSV_18_1), \
  .io_out_QSV_19_0(PREFIX_OUT``_QSV_19_0), .io_out_QSV_19_1(PREFIX_OUT``_QSV_19_1), \
  .io_out_QSV_20_0(PREFIX_OUT``_QSV_20_0), .io_out_QSV_20_1(PREFIX_OUT``_QSV_20_1), \
  .io_out_QSV_21_0(PREFIX_OUT``_QSV_21_0), .io_out_QSV_21_1(PREFIX_OUT``_QSV_21_1), \
  .io_out_QSV_22_0(PREFIX_OUT``_QSV_22_0), .io_out_QSV_22_1(PREFIX_OUT``_QSV_22_1), \
  .io_out_QSV_23_0(PREFIX_OUT``_QSV_23_0), .io_out_QSV_23_1(PREFIX_OUT``_QSV_23_1), \
  .io_out_QSV_24_0(PREFIX_OUT``_QSV_24_0), .io_out_QSV_24_1(PREFIX_OUT``_QSV_24_1), \
  .io_out_QSV_25_0(PREFIX_OUT``_QSV_25_0), .io_out_QSV_25_1(PREFIX_OUT``_QSV_25_1), \
  .io_out_QSV_26_0(PREFIX_OUT``_QSV_26_0), .io_out_QSV_26_1(PREFIX_OUT``_QSV_26_1), \
  .io_out_QSV_27_0(PREFIX_OUT``_QSV_27_0), .io_out_QSV_27_1(PREFIX_OUT``_QSV_27_1), \
  .io_out_QSV_28_0(PREFIX_OUT``_QSV_28_0), .io_out_QSV_28_1(PREFIX_OUT``_QSV_28_1), \
  .io_out_QSV_29_0(PREFIX_OUT``_QSV_29_0), .io_out_QSV_29_1(PREFIX_OUT``_QSV_29_1), \
  .io_out_QSV_30_0(PREFIX_OUT``_QSV_30_0), .io_out_QSV_30_1(PREFIX_OUT``_QSV_30_1), \
  .io_out_QSV_31_0(PREFIX_OUT``_QSV_31_0), .io_out_QSV_31_1(PREFIX_OUT``_QSV_31_1), \
  .io_out_valid(PREFIX_OUT``_valid)

  // Step 0: H on q0. (Target is q0, no perm needed)
  HGate5QubitVector8bit m (
    `BIND_STAGE_PORTS(io_in, _m_io_out)
  );

  // Step 1: CX on q0(ctrl), q1(tgt). Target is q1 (needs bracket)
  CompatiblePerm m_1 (
    `BIND_STAGE_PORTS(_m_io_out, _m_1_io_out)
  );
  CNGate5QubitVector8bit m_2 (
    `BIND_STAGE_PORTS(_m_1_io_out, _m_2_io_out)
  );
  CompatiblePerm_1 m_3 (
    `BIND_STAGE_PORTS(_m_2_io_out, _m_3_io_out)
  );

  // Step 2: CX on q1(ctrl), q2(tgt). Target is q2 (needs bracket)
  CompatiblePerm_2 m_4 (
    `BIND_STAGE_PORTS(_m_3_io_out, _m_4_io_out)
  );
  CNGate5QubitVector8bit m_5 (
    `BIND_STAGE_PORTS(_m_4_io_out, _m_5_io_out)
  );
  CompatiblePerm_3 m_6 (
    `BIND_STAGE_PORTS(_m_5_io_out, _m_6_io_out)
  );

  // Step 3: CX on q2(ctrl), q3(tgt). Target is q3 (needs bracket)
  CompatiblePerm_4 m_7 (
    `BIND_STAGE_PORTS(_m_6_io_out, _m_7_io_out)
  );
  CNGate5QubitVector8bit m_8 (
    `BIND_STAGE_PORTS(_m_7_io_out, _m_8_io_out)
  );
  CompatiblePerm_5 m_9 (
    `BIND_STAGE_PORTS(_m_8_io_out, _m_9_io_out)
  );

  // Step 4: CX on q3(ctrl), q4(tgt). Target is q4 (needs bracket)
  CompatiblePerm_6 m_10 (
    `BIND_STAGE_PORTS(_m_9_io_out, _m_10_io_out)
  );
  CNGate5QubitVector8bit m_11 (
    `BIND_STAGE_PORTS(_m_10_io_out, _m_11_io_out)
  );
  CompatiblePerm_7 m_12 (
    `BIND_STAGE_PORTS(_m_11_io_out, io_out)
  );

`undef DECLARE_STAGE_WIRES
`undef BIND_STAGE_PORTS

endmodule
