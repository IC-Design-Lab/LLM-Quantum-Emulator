module Shor (
  input  wire        clock,
  input  wire        reset,

  input  wire [7:0]  io_in_QSV_0_0,
  input  wire [7:0]  io_in_QSV_0_1,
  input  wire [7:0]  io_in_QSV_1_0,
  input  wire [7:0]  io_in_QSV_1_1,
  input  wire [7:0]  io_in_QSV_2_0,
  input  wire [7:0]  io_in_QSV_2_1,
  input  wire [7:0]  io_in_QSV_3_0,
  input  wire [7:0]  io_in_QSV_3_1,
  input  wire [7:0]  io_in_QSV_4_0,
  input  wire [7:0]  io_in_QSV_4_1,
  input  wire [7:0]  io_in_QSV_5_0,
  input  wire [7:0]  io_in_QSV_5_1,
  input  wire [7:0]  io_in_QSV_6_0,
  input  wire [7:0]  io_in_QSV_6_1,
  input  wire [7:0]  io_in_QSV_7_0,
  input  wire [7:0]  io_in_QSV_7_1,
  input  wire [7:0]  io_in_QSV_8_0,
  input  wire [7:0]  io_in_QSV_8_1,
  input  wire [7:0]  io_in_QSV_9_0,
  input  wire [7:0]  io_in_QSV_9_1,
  input  wire [7:0]  io_in_QSV_10_0,
  input  wire [7:0]  io_in_QSV_10_1,
  input  wire [7:0]  io_in_QSV_11_0,
  input  wire [7:0]  io_in_QSV_11_1,
  input  wire [7:0]  io_in_QSV_12_0,
  input  wire [7:0]  io_in_QSV_12_1,
  input  wire [7:0]  io_in_QSV_13_0,
  input  wire [7:0]  io_in_QSV_13_1,
  input  wire [7:0]  io_in_QSV_14_0,
  input  wire [7:0]  io_in_QSV_14_1,
  input  wire [7:0]  io_in_QSV_15_0,
  input  wire [7:0]  io_in_QSV_15_1,
  input  wire [7:0]  io_in_QSV_16_0,
  input  wire [7:0]  io_in_QSV_16_1,
  input  wire [7:0]  io_in_QSV_17_0,
  input  wire [7:0]  io_in_QSV_17_1,
  input  wire [7:0]  io_in_QSV_18_0,
  input  wire [7:0]  io_in_QSV_18_1,
  input  wire [7:0]  io_in_QSV_19_0,
  input  wire [7:0]  io_in_QSV_19_1,
  input  wire [7:0]  io_in_QSV_20_0,
  input  wire [7:0]  io_in_QSV_20_1,
  input  wire [7:0]  io_in_QSV_21_0,
  input  wire [7:0]  io_in_QSV_21_1,
  input  wire [7:0]  io_in_QSV_22_0,
  input  wire [7:0]  io_in_QSV_22_1,
  input  wire [7:0]  io_in_QSV_23_0,
  input  wire [7:0]  io_in_QSV_23_1,
  input  wire [7:0]  io_in_QSV_24_0,
  input  wire [7:0]  io_in_QSV_24_1,
  input  wire [7:0]  io_in_QSV_25_0,
  input  wire [7:0]  io_in_QSV_25_1,
  input  wire [7:0]  io_in_QSV_26_0,
  input  wire [7:0]  io_in_QSV_26_1,
  input  wire [7:0]  io_in_QSV_27_0,
  input  wire [7:0]  io_in_QSV_27_1,
  input  wire [7:0]  io_in_QSV_28_0,
  input  wire [7:0]  io_in_QSV_28_1,
  input  wire [7:0]  io_in_QSV_29_0,
  input  wire [7:0]  io_in_QSV_29_1,
  input  wire [7:0]  io_in_QSV_30_0,
  input  wire [7:0]  io_in_QSV_30_1,
  input  wire [7:0]  io_in_QSV_31_0,
  input  wire [7:0]  io_in_QSV_31_1,
  input  wire        io_in_valid,

  output wire [7:0]  io_out_QSV_0_0,
  output wire [7:0]  io_out_QSV_0_1,
  output wire [7:0]  io_out_QSV_1_0,
  output wire [7:0]  io_out_QSV_1_1,
  output wire [7:0]  io_out_QSV_2_0,
  output wire [7:0]  io_out_QSV_2_1,
  output wire [7:0]  io_out_QSV_3_0,
  output wire [7:0]  io_out_QSV_3_1,
  output wire [7:0]  io_out_QSV_4_0,
  output wire [7:0]  io_out_QSV_4_1,
  output wire [7:0]  io_out_QSV_5_0,
  output wire [7:0]  io_out_QSV_5_1,
  output wire [7:0]  io_out_QSV_6_0,
  output wire [7:0]  io_out_QSV_6_1,
  output wire [7:0]  io_out_QSV_7_0,
  output wire [7:0]  io_out_QSV_7_1,
  output wire [7:0]  io_out_QSV_8_0,
  output wire [7:0]  io_out_QSV_8_1,
  output wire [7:0]  io_out_QSV_9_0,
  output wire [7:0]  io_out_QSV_9_1,
  output wire [7:0]  io_out_QSV_10_0,
  output wire [7:0]  io_out_QSV_10_1,
  output wire [7:0]  io_out_QSV_11_0,
  output wire [7:0]  io_out_QSV_11_1,
  output wire [7:0]  io_out_QSV_12_0,
  output wire [7:0]  io_out_QSV_12_1,
  output wire [7:0]  io_out_QSV_13_0,
  output wire [7:0]  io_out_QSV_13_1,
  output wire [7:0]  io_out_QSV_14_0,
  output wire [7:0]  io_out_QSV_14_1,
  output wire [7:0]  io_out_QSV_15_0,
  output wire [7:0]  io_out_QSV_15_1,
  output wire [7:0]  io_out_QSV_16_0,
  output wire [7:0]  io_out_QSV_16_1,
  output wire [7:0]  io_out_QSV_17_0,
  output wire [7:0]  io_out_QSV_17_1,
  output wire [7:0]  io_out_QSV_18_0,
  output wire [7:0]  io_out_QSV_18_1,
  output wire [7:0]  io_out_QSV_19_0,
  output wire [7:0]  io_out_QSV_19_1,
  output wire [7:0]  io_out_QSV_20_0,
  output wire [7:0]  io_out_QSV_20_1,
  output wire [7:0]  io_out_QSV_21_0,
  output wire [7:0]  io_out_QSV_21_1,
  output wire [7:0]  io_out_QSV_22_0,
  output wire [7:0]  io_out_QSV_22_1,
  output wire [7:0]  io_out_QSV_23_0,
  output wire [7:0]  io_out_QSV_23_1,
  output wire [7:0]  io_out_QSV_24_0,
  output wire [7:0]  io_out_QSV_24_1,
  output wire [7:0]  io_out_QSV_25_0,
  output wire [7:0]  io_out_QSV_25_1,
  output wire [7:0]  io_out_QSV_26_0,
  output wire [7:0]  io_out_QSV_26_1,
  output wire [7:0]  io_out_QSV_27_0,
  output wire [7:0]  io_out_QSV_27_1,
  output wire [7:0]  io_out_QSV_28_0,
  output wire [7:0]  io_out_QSV_28_1,
  output wire [7:0]  io_out_QSV_29_0,
  output wire [7:0]  io_out_QSV_29_1,
  output wire [7:0]  io_out_QSV_30_0,
  output wire [7:0]  io_out_QSV_30_1,
  output wire [7:0]  io_out_QSV_31_0,
  output wire [7:0]  io_out_QSV_31_1,
  output wire        io_out_valid
);

  `define DECLARE_STAGE_WIRES(PREFIX) \
  wire        PREFIX``_valid; \
  wire [7:0]  PREFIX``_QSV_0_0, PREFIX``_QSV_0_1, PREFIX``_QSV_1_0, PREFIX``_QSV_1_1, PREFIX``_QSV_2_0, PREFIX``_QSV_2_1, PREFIX``_QSV_3_0, PREFIX``_QSV_3_1; \
  wire [7:0]  PREFIX``_QSV_4_0, PREFIX``_QSV_4_1, PREFIX``_QSV_5_0, PREFIX``_QSV_5_1, PREFIX``_QSV_6_0, PREFIX``_QSV_6_1, PREFIX``_QSV_7_0, PREFIX``_QSV_7_1; \
  wire [7:0]  PREFIX``_QSV_8_0, PREFIX``_QSV_8_1, PREFIX``_QSV_9_0, PREFIX``_QSV_9_1, PREFIX``_QSV_10_0, PREFIX``_QSV_10_1, PREFIX``_QSV_11_0, PREFIX``_QSV_11_1; \
  wire [7:0]  PREFIX``_QSV_12_0, PREFIX``_QSV_12_1, PREFIX``_QSV_13_0, PREFIX``_QSV_13_1, PREFIX``_QSV_14_0, PREFIX``_QSV_14_1, PREFIX``_QSV_15_0, PREFIX``_QSV_15_1; \
  wire [7:0]  PREFIX``_QSV_16_0, PREFIX``_QSV_16_1, PREFIX``_QSV_17_0, PREFIX``_QSV_17_1, PREFIX``_QSV_18_0, PREFIX``_QSV_18_1, PREFIX``_QSV_19_0, PREFIX``_QSV_19_1; \
  wire [7:0]  PREFIX``_QSV_20_0, PREFIX``_QSV_20_1, PREFIX``_QSV_21_0, PREFIX``_QSV_21_1, PREFIX``_QSV_22_0, PREFIX``_QSV_22_1, PREFIX``_QSV_23_0, PREFIX``_QSV_23_1; \
  wire [7:0]  PREFIX``_QSV_24_0, PREFIX``_QSV_24_1, PREFIX``_QSV_25_0, PREFIX``_QSV_25_1, PREFIX``_QSV_26_0, PREFIX``_QSV_26_1, PREFIX``_QSV_27_0, PREFIX``_QSV_27_1; \
  wire [7:0]  PREFIX``_QSV_28_0, PREFIX``_QSV_28_1, PREFIX``_QSV_29_0, PREFIX``_QSV_29_1, PREFIX``_QSV_30_0, PREFIX``_QSV_30_1, PREFIX``_QSV_31_0, PREFIX``_QSV_31_1

  `DECLARE_STAGE_WIRES(_m_io_out);
  `DECLARE_STAGE_WIRES(_m_1_io_out);
  `DECLARE_STAGE_WIRES(_m_2_io_out);
  `DECLARE_STAGE_WIRES(_m_3_io_out);
  `DECLARE_STAGE_WIRES(_m_4_io_out);
  `DECLARE_STAGE_WIRES(_m_5_io_out);
  `DECLARE_STAGE_WIRES(_m_6_io_out);
  `DECLARE_STAGE_WIRES(_m_7_io_out);
  `DECLARE_STAGE_WIRES(_m_8_io_out);
  `DECLARE_STAGE_WIRES(_m_9_io_out);
  `DECLARE_STAGE_WIRES(_m_10_io_out);
  `DECLARE_STAGE_WIRES(_m_11_io_out);
  `DECLARE_STAGE_WIRES(_m_12_io_out);
  `DECLARE_STAGE_WIRES(_m_13_io_out);
  `DECLARE_STAGE_WIRES(_m_14_io_out);

  `define INST_STAGE_PORTS(IN_PFX, OUT_PFX) \
    .clock(clock), .reset(reset), .io_in_valid(IN_PFX``_valid), .io_out_valid(OUT_PFX``_valid), \
    .io_in_QSV_0_0(IN_PFX``_QSV_0_0), .io_in_QSV_0_1(IN_PFX``_QSV_0_1), .io_in_QSV_1_0(IN_PFX``_QSV_1_0), .io_in_QSV_1_1(IN_PFX``_QSV_1_1), .io_in_QSV_2_0(IN_PFX``_QSV_2_0), .io_in_QSV_2_1(IN_PFX``_QSV_2_1), .io_in_QSV_3_0(IN_PFX``_QSV_3_0), .io_in_QSV_3_1(IN_PFX``_QSV_3_1), \
    .io_in_QSV_4_0(IN_PFX``_QSV_4_0), .io_in_QSV_4_1(IN_PFX``_QSV_4_1), .io_in_QSV_5_0(IN_PFX``_QSV_5_0), .io_in_QSV_5_1(IN_PFX``_QSV_5_1), .io_in_QSV_6_0(IN_PFX``_QSV_6_0), .io_in_QSV_6_1(IN_PFX``_QSV_6_1), .io_in_QSV_7_0(IN_PFX``_QSV_7_0), .io_in_QSV_7_1(IN_PFX``_QSV_7_1), \
    .io_in_QSV_8_0(IN_PFX``_QSV_8_0), .io_in_QSV_8_1(IN_PFX``_QSV_8_1), .io_in_QSV_9_0(IN_PFX``_QSV_9_0), .io_in_QSV_9_1(IN_PFX``_QSV_9_1), .io_in_QSV_10_0(IN_PFX``_QSV_10_0), .io_in_QSV_10_1(IN_PFX``_QSV_10_1), .io_in_QSV_11_0(IN_PFX``_QSV_11_0), .io_in_QSV_11_1(IN_PFX``_QSV_11_1), \
    .io_in_QSV_12_0(IN_PFX``_QSV_12_0), .io_in_QSV_12_1(IN_PFX``_QSV_12_1), .io_in_QSV_13_0(IN_PFX``_QSV_13_0), .io_in_QSV_13_1(IN_PFX``_QSV_13_1), .io_in_QSV_14_0(IN_PFX``_QSV_14_0), .io_in_QSV_14_1(IN_PFX``_QSV_14_1), .io_in_QSV_15_0(IN_PFX``_QSV_15_0), .io_in_QSV_15_1(IN_PFX``_QSV_15_1), \
    .io_in_QSV_16_0(IN_PFX``_QSV_16_0), .io_in_QSV_16_1(IN_PFX``_QSV_16_1), .io_in_QSV_17_0(IN_PFX``_QSV_17_0), .io_in_QSV_17_1(IN_PFX``_QSV_17_1), .io_in_QSV_18_0(IN_PFX``_QSV_18_0), .io_in_QSV_18_1(IN_PFX``_QSV_18_1), .io_in_QSV_19_0(IN_PFX``_QSV_19_0), .io_in_QSV_19_1(IN_PFX``_QSV_19_1), \
    .io_in_QSV_20_0(IN_PFX``_QSV_20_0), .io_in_QSV_20_1(IN_PFX``_QSV_20_1), .io_in_QSV_21_0(IN_PFX``_QSV_21_0), .io_in_QSV_21_1(IN_PFX``_QSV_21_1), .io_in_QSV_22_0(IN_PFX``_QSV_22_0), .io_in_QSV_22_1(IN_PFX``_QSV_22_1), .io_in_QSV_23_0(IN_PFX``_QSV_23_0), .io_in_QSV_23_1(IN_PFX``_QSV_23_1), \
    .io_in_QSV_24_0(IN_PFX``_QSV_24_0), .io_in_QSV_24_1(IN_PFX``_QSV_24_1), .io_in_QSV_25_0(IN_PFX``_QSV_25_0), .io_in_QSV_25_1(IN_PFX``_QSV_25_1), .io_in_QSV_26_0(IN_PFX``_QSV_26_0), .io_in_QSV_26_1(IN_PFX``_QSV_26_1), .io_in_QSV_27_0(IN_PFX``_QSV_27_0), .io_in_QSV_27_1(IN_PFX``_QSV_27_1), \
    .io_in_QSV_28_0(IN_PFX``_QSV_28_0), .io_in_QSV_28_1(IN_PFX``_QSV_28_1), .io_in_QSV_29_0(IN_PFX``_QSV_29_0), .io_in_QSV_29_1(IN_PFX``_QSV_29_1), .io_in_QSV_30_0(IN_PFX``_QSV_30_0), .io_in_QSV_30_1(IN_PFX``_QSV_30_1), .io_in_QSV_31_0(IN_PFX``_QSV_31_0), .io_in_QSV_31_1(IN_PFX``_QSV_31_1), \
    .io_out_QSV_0_0(OUT_PFX``_QSV_0_0), .io_out_QSV_0_1(OUT_PFX``_QSV_0_1), .io_out_QSV_1_0(OUT_PFX``_QSV_1_0), .io_out_QSV_1_1(OUT_PFX``_QSV_1_1), .io_out_QSV_2_0(OUT_PFX``_QSV_2_0), .io_out_QSV_2_1(OUT_PFX``_QSV_2_1), .io_out_QSV_3_0(OUT_PFX``_QSV_3_0), .io_out_QSV_3_1(OUT_PFX``_QSV_3_1), \
    .io_out_QSV_4_0(OUT_PFX``_QSV_4_0), .io_out_QSV_4_1(OUT_PFX``_QSV_4_1), .io_out_QSV_5_0(OUT_PFX``_QSV_5_0), .io_out_QSV_5_1(OUT_PFX``_QSV_5_1), .io_out_QSV_6_0(OUT_PFX``_QSV_6_0), .io_out_QSV_6_1(OUT_PFX``_QSV_6_1), .io_out_QSV_7_0(OUT_PFX``_QSV_7_0), .io_out_QSV_7_1(OUT_PFX``_QSV_7_1), \
    .io_out_QSV_8_0(OUT_PFX``_QSV_8_0), .io_out_QSV_8_1(OUT_PFX``_QSV_8_1), .io_out_QSV_9_0(OUT_PFX``_QSV_9_0), .io_out_QSV_9_1(OUT_PFX``_QSV_9_1), .io_out_QSV_10_0(OUT_PFX``_QSV_10_0), .io_out_QSV_10_1(OUT_PFX``_QSV_10_1), .io_out_QSV_11_0(OUT_PFX``_QSV_11_0), .io_out_QSV_11_1(OUT_PFX``_QSV_11_1), \
    .io_out_QSV_12_0(OUT_PFX``_QSV_12_0), .io_out_QSV_12_1(OUT_PFX``_QSV_12_1), .io_out_QSV_13_0(OUT_PFX``_QSV_13_0), .io_out_QSV_13_1(OUT_PFX``_QSV_13_1), .io_out_QSV_14_0(OUT_PFX``_QSV_14_0), .io_out_QSV_14_1(OUT_PFX``_QSV_14_1), .io_out_QSV_15_0(OUT_PFX``_QSV_15_0), .io_out_QSV_15_1(OUT_PFX``_QSV_15_1), \
    .io_out_QSV_16_0(OUT_PFX``_QSV_16_0), .io_out_QSV_16_1(OUT_PFX``_QSV_16_1), .io_out_QSV_17_0(OUT_PFX``_QSV_17_0), .io_out_QSV_17_1(OUT_PFX``_QSV_17_1), .io_out_QSV_18_0(OUT_PFX``_QSV_18_0), .io_out_QSV_18_1(OUT_PFX``_QSV_18_1), .io_out_QSV_19_0(OUT_PFX``_QSV_19_0), .io_out_QSV_19_1(OUT_PFX``_QSV_19_1), \
    .io_out_QSV_20_0(OUT_PFX``_QSV_20_0), .io_out_QSV_20_1(OUT_PFX``_QSV_20_1), .io_out_QSV_21_0(OUT_PFX``_QSV_21_0), .io_out_QSV_21_1(OUT_PFX``_QSV_21_1), .io_out_QSV_22_0(OUT_PFX``_QSV_22_0), .io_out_QSV_22_1(OUT_PFX``_QSV_22_1), .io_out_QSV_23_0(OUT_PFX``_QSV_23_0), .io_out_QSV_23_1(OUT_PFX``_QSV_23_1), \
    .io_out_QSV_24_0(OUT_PFX``_QSV_24_0), .io_out_QSV_24_1(OUT_PFX``_QSV_24_1), .io_out_QSV_25_0(OUT_PFX``_QSV_25_0), .io_out_QSV_25_1(OUT_PFX``_QSV_25_1), .io_out_QSV_26_0(OUT_PFX``_QSV_26_0), .io_out_QSV_26_1(OUT_PFX``_QSV_26_1), .io_out_QSV_27_0(OUT_PFX``_QSV_27_0), .io_out_QSV_27_1(OUT_PFX``_QSV_27_1), \
    .io_out_QSV_28_0(OUT_PFX``_QSV_28_0), .io_out_QSV_28_1(OUT_PFX``_QSV_28_1), .io_out_QSV_29_0(OUT_PFX``_QSV_29_0), .io_out_QSV_29_1(OUT_PFX``_QSV_29_1), .io_out_QSV_30_0(OUT_PFX``_QSV_30_0), .io_out_QSV_30_1(OUT_PFX``_QSV_30_1), .io_out_QSV_31_0(OUT_PFX``_QSV_31_0), .io_out_QSV_31_1(OUT_PFX``_QSV_31_1)

  HGate5QubitVector8bit m (
    `INST_STAGE_PORTS(io_in, _m_io_out)
  );

  CompatiblePerm m_1 (
    `INST_STAGE_PORTS(_m_io_out, _m_1_io_out)
  );

  CNGate5QubitVector8bit m_2 (
    `INST_STAGE_PORTS(_m_1_io_out, _m_2_io_out)
  );

  CompatiblePerm_1 m_3 (
    `INST_STAGE_PORTS(_m_2_io_out, _m_3_io_out)
  );

  CompatiblePerm_2 m_4 (
    `INST_STAGE_PORTS(_m_3_io_out, _m_4_io_out)
  );

  CNGate5QubitVector8bit m_5 (
    `INST_STAGE_PORTS(_m_4_io_out, _m_5_io_out)
  );

  CompatiblePerm_3 m_6 (
    `INST_STAGE_PORTS(_m_5_io_out, _m_6_io_out)
  );

  CompatiblePerm_4 m_7 (
    `INST_STAGE_PORTS(_m_6_io_out, _m_7_io_out)
  );

  CNGate5QubitVector8bit m_8 (
    `INST_STAGE_PORTS(_m_7_io_out, _m_8_io_out)
  );

  CompatiblePerm_5 m_9 (
    `INST_STAGE_PORTS(_m_8_io_out, _m_9_io_out)
  );

  CompatiblePerm_6 m_10 (
    `INST_STAGE_PORTS(_m_9_io_out, _m_10_io_out)
  );

  CNGate5QubitVector8bit m_11 (
    `INST_STAGE_PORTS(_m_10_io_out, _m_11_io_out)
  );

  CompatiblePerm_1 m_12 (
    `INST_STAGE_PORTS(_m_11_io_out, _m_12_io_out)
  );

  CompatiblePerm_4 m_13 (
    `INST_STAGE_PORTS(_m_12_io_out, _m_13_io_out)
  );

  CompatiblePerm_9 m_14 (
    `INST_STAGE_PORTS(_m_13_io_out, _m_14_io_out)
  );

  CompatiblePerm_10 m_15 (
    `INST_STAGE_PORTS(_m_14_io_out, io_out)
  );

  `undef DECLARE_STAGE_WIRES
  `undef INST_STAGE_PORTS

endmodule
