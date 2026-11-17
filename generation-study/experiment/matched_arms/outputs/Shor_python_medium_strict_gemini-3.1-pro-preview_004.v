module Shor (
  input  wire clock,
  input  wire reset,
  input  wire [7:0] io_in_QSV_0_0, io_in_QSV_0_1, io_in_QSV_1_0, io_in_QSV_1_1,
  input  wire [7:0] io_in_QSV_2_0, io_in_QSV_2_1, io_in_QSV_3_0, io_in_QSV_3_1,
  input  wire [7:0] io_in_QSV_4_0, io_in_QSV_4_1, io_in_QSV_5_0, io_in_QSV_5_1,
  input  wire [7:0] io_in_QSV_6_0, io_in_QSV_6_1, io_in_QSV_7_0, io_in_QSV_7_1,
  input  wire [7:0] io_in_QSV_8_0, io_in_QSV_8_1, io_in_QSV_9_0, io_in_QSV_9_1,
  input  wire [7:0] io_in_QSV_10_0, io_in_QSV_10_1, io_in_QSV_11_0, io_in_QSV_11_1,
  input  wire [7:0] io_in_QSV_12_0, io_in_QSV_12_1, io_in_QSV_13_0, io_in_QSV_13_1,
  input  wire [7:0] io_in_QSV_14_0, io_in_QSV_14_1, io_in_QSV_15_0, io_in_QSV_15_1,
  input  wire [7:0] io_in_QSV_16_0, io_in_QSV_16_1, io_in_QSV_17_0, io_in_QSV_17_1,
  input  wire [7:0] io_in_QSV_18_0, io_in_QSV_18_1, io_in_QSV_19_0, io_in_QSV_19_1,
  input  wire [7:0] io_in_QSV_20_0, io_in_QSV_20_1, io_in_QSV_21_0, io_in_QSV_21_1,
  input  wire [7:0] io_in_QSV_22_0, io_in_QSV_22_1, io_in_QSV_23_0, io_in_QSV_23_1,
  input  wire [7:0] io_in_QSV_24_0, io_in_QSV_24_1, io_in_QSV_25_0, io_in_QSV_25_1,
  input  wire [7:0] io_in_QSV_26_0, io_in_QSV_26_1, io_in_QSV_27_0, io_in_QSV_27_1,
  input  wire [7:0] io_in_QSV_28_0, io_in_QSV_28_1, io_in_QSV_29_0, io_in_QSV_29_1,
  input  wire [7:0] io_in_QSV_30_0, io_in_QSV_30_1, io_in_QSV_31_0, io_in_QSV_31_1,
  input  wire io_in_valid,
  
  output wire [7:0] io_out_QSV_0_0, io_out_QSV_0_1, io_out_QSV_1_0, io_out_QSV_1_1,
  output wire [7:0] io_out_QSV_2_0, io_out_QSV_2_1, io_out_QSV_3_0, io_out_QSV_3_1,
  output wire [7:0] io_out_QSV_4_0, io_out_QSV_4_1, io_out_QSV_5_0, io_out_QSV_5_1,
  output wire [7:0] io_out_QSV_6_0, io_out_QSV_6_1, io_out_QSV_7_0, io_out_QSV_7_1,
  output wire [7:0] io_out_QSV_8_0, io_out_QSV_8_1, io_out_QSV_9_0, io_out_QSV_9_1,
  output wire [7:0] io_out_QSV_10_0, io_out_QSV_10_1, io_out_QSV_11_0, io_out_QSV_11_1,
  output wire [7:0] io_out_QSV_12_0, io_out_QSV_12_1, io_out_QSV_13_0, io_out_QSV_13_1,
  output wire [7:0] io_out_QSV_14_0, io_out_QSV_14_1, io_out_QSV_15_0, io_out_QSV_15_1,
  output wire [7:0] io_out_QSV_16_0, io_out_QSV_16_1, io_out_QSV_17_0, io_out_QSV_17_1,
  output wire [7:0] io_out_QSV_18_0, io_out_QSV_18_1, io_out_QSV_19_0, io_out_QSV_19_1,
  output wire [7:0] io_out_QSV_20_0, io_out_QSV_20_1, io_out_QSV_21_0, io_out_QSV_21_1,
  output wire [7:0] io_out_QSV_22_0, io_out_QSV_22_1, io_out_QSV_23_0, io_out_QSV_23_1,
  output wire [7:0] io_out_QSV_24_0, io_out_QSV_24_1, io_out_QSV_25_0, io_out_QSV_25_1,
  output wire [7:0] io_out_QSV_26_0, io_out_QSV_26_1, io_out_QSV_27_0, io_out_QSV_27_1,
  output wire [7:0] io_out_QSV_28_0, io_out_QSV_28_1, io_out_QSV_29_0, io_out_QSV_29_1,
  output wire [7:0] io_out_QSV_30_0, io_out_QSV_30_1, io_out_QSV_31_0, io_out_QSV_31_1,
  output wire io_out_valid
);

  `define DECLARE_STAGE_WIRES(PREFIX) \
    wire [7:0] PREFIX``_io_out_QSV_0_0, PREFIX``_io_out_QSV_0_1, PREFIX``_io_out_QSV_1_0, PREFIX``_io_out_QSV_1_1; \
    wire [7:0] PREFIX``_io_out_QSV_2_0, PREFIX``_io_out_QSV_2_1, PREFIX``_io_out_QSV_3_0, PREFIX``_io_out_QSV_3_1; \
    wire [7:0] PREFIX``_io_out_QSV_4_0, PREFIX``_io_out_QSV_4_1, PREFIX``_io_out_QSV_5_0, PREFIX``_io_out_QSV_5_1; \
    wire [7:0] PREFIX``_io_out_QSV_6_0, PREFIX``_io_out_QSV_6_1, PREFIX``_io_out_QSV_7_0, PREFIX``_io_out_QSV_7_1; \
    wire [7:0] PREFIX``_io_out_QSV_8_0, PREFIX``_io_out_QSV_8_1, PREFIX``_io_out_QSV_9_0, PREFIX``_io_out_QSV_9_1; \
    wire [7:0] PREFIX``_io_out_QSV_10_0, PREFIX``_io_out_QSV_10_1, PREFIX``_io_out_QSV_11_0, PREFIX``_io_out_QSV_11_1; \
    wire [7:0] PREFIX``_io_out_QSV_12_0, PREFIX``_io_out_QSV_12_1, PREFIX``_io_out_QSV_13_0, PREFIX``_io_out_QSV_13_1; \
    wire [7:0] PREFIX``_io_out_QSV_14_0, PREFIX``_io_out_QSV_14_1, PREFIX``_io_out_QSV_15_0, PREFIX``_io_out_QSV_15_1; \
    wire [7:0] PREFIX``_io_out_QSV_16_0, PREFIX``_io_out_QSV_16_1, PREFIX``_io_out_QSV_17_0, PREFIX``_io_out_QSV_17_1; \
    wire [7:0] PREFIX``_io_out_QSV_18_0, PREFIX``_io_out_QSV_18_1, PREFIX``_io_out_QSV_19_0, PREFIX``_io_out_QSV_19_1; \
    wire [7:0] PREFIX``_io_out_QSV_20_0, PREFIX``_io_out_QSV_20_1, PREFIX``_io_out_QSV_21_0, PREFIX``_io_out_QSV_21_1; \
    wire [7:0] PREFIX``_io_out_QSV_22_0, PREFIX``_io_out_QSV_22_1, PREFIX``_io_out_QSV_23_0, PREFIX``_io_out_QSV_23_1; \
    wire [7:0] PREFIX``_io_out_QSV_24_0, PREFIX``_io_out_QSV_24_1, PREFIX``_io_out_QSV_25_0, PREFIX``_io_out_QSV_25_1; \
    wire [7:0] PREFIX``_io_out_QSV_26_0, PREFIX``_io_out_QSV_26_1, PREFIX``_io_out_QSV_27_0, PREFIX``_io_out_QSV_27_1; \
    wire [7:0] PREFIX``_io_out_QSV_28_0, PREFIX``_io_out_QSV_28_1, PREFIX``_io_out_QSV_29_0, PREFIX``_io_out_QSV_29_1; \
    wire [7:0] PREFIX``_io_out_QSV_30_0, PREFIX``_io_out_QSV_30_1, PREFIX``_io_out_QSV_31_0, PREFIX``_io_out_QSV_31_1; \
    wire PREFIX``_io_out_valid;

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

  `define CONNECT_STAGE_PORTS(IN_PREFIX, OUT_PREFIX) \
    .io_in_QSV_0_0(IN_PREFIX``io_in_QSV_0_0), .io_in_QSV_0_1(IN_PREFIX``io_in_QSV_0_1), .io_in_QSV_1_0(IN_PREFIX``io_in_QSV_1_0), .io_in_QSV_1_1(IN_PREFIX``io_in_QSV_1_1), \
    .io_in_QSV_2_0(IN_PREFIX``io_in_QSV_2_0), .io_in_QSV_2_1(IN_PREFIX``io_in_QSV_2_1), .io_in_QSV_3_0(IN_PREFIX``io_in_QSV_3_0), .io_in_QSV_3_1(IN_PREFIX``io_in_QSV_3_1), \
    .io_in_QSV_4_0(IN_PREFIX``io_in_QSV_4_0), .io_in_QSV_4_1(IN_PREFIX``io_in_QSV_4_1), .io_in_QSV_5_0(IN_PREFIX``io_in_QSV_5_0), .io_in_QSV_5_1(IN_PREFIX``io_in_QSV_5_1), \
    .io_in_QSV_6_0(IN_PREFIX``io_in_QSV_6_0), .io_in_QSV_6_1(IN_PREFIX``io_in_QSV_6_1), .io_in_QSV_7_0(IN_PREFIX``io_in_QSV_7_0), .io_in_QSV_7_1(IN_PREFIX``io_in_QSV_7_1), \
    .io_in_QSV_8_0(IN_PREFIX``io_in_QSV_8_0), .io_in_QSV_8_1(IN_PREFIX``io_in_QSV_8_1), .io_in_QSV_9_0(IN_PREFIX``io_in_QSV_9_0), .io_in_QSV_9_1(IN_PREFIX``io_in_QSV_9_1), \
    .io_in_QSV_10_0(IN_PREFIX``io_in_QSV_10_0), .io_in_QSV_10_1(IN_PREFIX``io_in_QSV_10_1), .io_in_QSV_11_0(IN_PREFIX``io_in_QSV_11_0), .io_in_QSV_11_1(IN_PREFIX``io_in_QSV_11_1), \
    .io_in_QSV_12_0(IN_PREFIX``io_in_QSV_12_0), .io_in_QSV_12_1(IN_PREFIX``io_in_QSV_12_1), .io_in_QSV_13_0(IN_PREFIX``io_in_QSV_13_0), .io_in_QSV_13_1(IN_PREFIX``io_in_QSV_13_1), \
    .io_in_QSV_14_0(IN_PREFIX``io_in_QSV_14_0), .io_in_QSV_14_1(IN_PREFIX``io_in_QSV_14_1), .io_in_QSV_15_0(IN_PREFIX``io_in_QSV_15_0), .io_in_QSV_15_1(IN_PREFIX``io_in_QSV_15_1), \
    .io_in_QSV_16_0(IN_PREFIX``io_in_QSV_16_0), .io_in_QSV_16_1(IN_PREFIX``io_in_QSV_16_1), .io_in_QSV_17_0(IN_PREFIX``io_in_QSV_17_0), .io_in_QSV_17_1(IN_PREFIX``io_in_QSV_17_1), \
    .io_in_QSV_18_0(IN_PREFIX``io_in_QSV_18_0), .io_in_QSV_18_1(IN_PREFIX``io_in_QSV_18_1), .io_in_QSV_19_0(IN_PREFIX``io_in_QSV_19_0), .io_in_QSV_19_1(IN_PREFIX``io_in_QSV_19_1), \
    .io_in_QSV_20_0(IN_PREFIX``io_in_QSV_20_0), .io_in_QSV_20_1(IN_PREFIX``io_in_QSV_20_1), .io_in_QSV_21_0(IN_PREFIX``io_in_QSV_21_0), .io_in_QSV_21_1(IN_PREFIX``io_in_QSV_21_1), \
    .io_in_QSV_22_0(IN_PREFIX``io_in_QSV_22_0), .io_in_QSV_22_1(IN_PREFIX``io_in_QSV_22_1), .io_in_QSV_23_0(IN_PREFIX``io_in_QSV_23_0), .io_in_QSV_23_1(IN_PREFIX``io_in_QSV_23_1), \
    .io_in_QSV_24_0(IN_PREFIX``io_in_QSV_24_0), .io_in_QSV_24_1(IN_PREFIX``io_in_QSV_24_1), .io_in_QSV_25_0(IN_PREFIX``io_in_QSV_25_0), .io_in_QSV_25_1(IN_PREFIX``io_in_QSV_25_1), \
    .io_in_QSV_26_0(IN_PREFIX``io_in_QSV_26_0), .io_in_QSV_26_1(IN_PREFIX``io_in_QSV_26_1), .io_in_QSV_27_0(IN_PREFIX``io_in_QSV_27_0), .io_in_QSV_27_1(IN_PREFIX``io_in_QSV_27_1), \
    .io_in_QSV_28_0(IN_PREFIX``io_in_QSV_28_0), .io_in_QSV_28_1(IN_PREFIX``io_in_QSV_28_1), .io_in_QSV_29_0(IN_PREFIX``io_in_QSV_29_0), .io_in_QSV_29_1(IN_PREFIX``io_in_QSV_29_1), \
    .io_in_QSV_30_0(IN_PREFIX``io_in_QSV_30_0), .io_in_QSV_30_1(IN_PREFIX``io_in_QSV_30_1), .io_in_QSV_31_0(IN_PREFIX``io_in_QSV_31_0), .io_in_QSV_31_1(IN_PREFIX``io_in_QSV_31_1), \
    .io_in_valid(IN_PREFIX``io_in_valid), \
    .io_out_QSV_0_0(OUT_PREFIX``io_out_QSV_0_0), .io_out_QSV_0_1(OUT_PREFIX``io_out_QSV_0_1), .io_out_QSV_1_0(OUT_PREFIX``io_out_QSV_1_0), .io_out_QSV_1_1(OUT_PREFIX``io_out_QSV_1_1), \
    .io_out_QSV_2_0(OUT_PREFIX``io_out_QSV_2_0), .io_out_QSV_2_1(OUT_PREFIX``io_out_QSV_2_1), .io_out_QSV_3_0(OUT_PREFIX``io_out_QSV_3_0), .io_out_QSV_3_1(OUT_PREFIX``io_out_QSV_3_1), \
    .io_out_QSV_4_0(OUT_PREFIX``io_out_QSV_4_0), .io_out_QSV_4_1(OUT_PREFIX``io_out_QSV_4_1), .io_out_QSV_5_0(OUT_PREFIX``io_out_QSV_5_0), .io_out_QSV_5_1(OUT_PREFIX``io_out_QSV_5_1), \
    .io_out_QSV_6_0(OUT_PREFIX``io_out_QSV_6_0), .io_out_QSV_6_1(OUT_PREFIX``io_out_QSV_6_1), .io_out_QSV_7_0(OUT_PREFIX``io_out_QSV_7_0), .io_out_QSV_7_1(OUT_PREFIX``io_out_QSV_7_1), \
    .io_out_QSV_8_0(OUT_PREFIX``io_out_QSV_8_0), .io_out_QSV_8_1(OUT_PREFIX``io_out_QSV_8_1), .io_out_QSV_9_0(OUT_PREFIX``io_out_QSV_9_0), .io_out_QSV_9_1(OUT_PREFIX``io_out_QSV_9_1), \
    .io_out_QSV_10_0(OUT_PREFIX``io_out_QSV_10_0), .io_out_QSV_10_1(OUT_PREFIX``io_out_QSV_10_1), .io_out_QSV_11_0(OUT_PREFIX``io_out_QSV_11_0), .io_out_QSV_11_1(OUT_PREFIX``io_out_QSV_11_1), \
    .io_out_QSV_12_0(OUT_PREFIX``io_out_QSV_12_0), .io_out_QSV_12_1(OUT_PREFIX``io_out_QSV_12_1), .io_out_QSV_13_0(OUT_PREFIX``io_out_QSV_13_0), .io_out_QSV_13_1(OUT_PREFIX``io_out_QSV_13_1), \
    .io_out_QSV_14_0(OUT_PREFIX``io_out_QSV_14_0), .io_out_QSV_14_1(OUT_PREFIX``io_out_QSV_14_1), .io_out_QSV_15_0(OUT_PREFIX``io_out_QSV_15_0), .io_out_QSV_15_1(OUT_PREFIX``io_out_QSV_15_1), \
    .io_out_QSV_16_0(OUT_PREFIX``io_out_QSV_16_0), .io_out_QSV_16_1(OUT_PREFIX``io_out_QSV_16_1), .io_out_QSV_17_0(OUT_PREFIX``io_out_QSV_17_0), .io_out_QSV_17_1(OUT_PREFIX``io_out_QSV_17_1), \
    .io_out_QSV_18_0(OUT_PREFIX``io_out_QSV_18_0), .io_out_QSV_18_1(OUT_PREFIX``io_out_QSV_18_1), .io_out_QSV_19_0(OUT_PREFIX``io_out_QSV_19_0), .io_out_QSV_19_1(OUT_PREFIX``io_out_QSV_19_1), \
    .io_out_QSV_20_0(OUT_PREFIX``io_out_QSV_20_0), .io_out_QSV_20_1(OUT_PREFIX``io_out_QSV_20_1), .io_out_QSV_21_0(OUT_PREFIX``io_out_QSV_21_0), .io_out_QSV_21_1(OUT_PREFIX``io_out_QSV_21_1), \
    .io_out_QSV_22_0(OUT_PREFIX``io_out_QSV_22_0), .io_out_QSV_22_1(OUT_PREFIX``io_out_QSV_22_1), .io_out_QSV_23_0(OUT_PREFIX``io_out_QSV_23_0), .io_out_QSV_23_1(OUT_PREFIX``io_out_QSV_23_1), \
    .io_out_QSV_24_0(OUT_PREFIX``io_out_QSV_24_0), .io_out_QSV_24_1(OUT_PREFIX``io_out_QSV_24_1), .io_out_QSV_25_0(OUT_PREFIX``io_out_QSV_25_0), .io_out_QSV_25_1(OUT_PREFIX``io_out_QSV_25_1), \
    .io_out_QSV_26_0(OUT_PREFIX``io_out_QSV_26_0), .io_out_QSV_26_1(OUT_PREFIX``io_out_QSV_26_1), .io_out_QSV_27_0(OUT_PREFIX``io_out_QSV_27_0), .io_out_QSV_27_1(OUT_PREFIX``io_out_QSV_27_1), \
    .io_out_QSV_28_0(OUT_PREFIX``io_out_QSV_28_0), .io_out_QSV_28_1(OUT_PREFIX``io_out_QSV_28_1), .io_out_QSV_29_0(OUT_PREFIX``io_out_QSV_29_0), .io_out_QSV_29_1(OUT_PREFIX``io_out_QSV_29_1), \
    .io_out_QSV_30_0(OUT_PREFIX``io_out_QSV_30_0), .io_out_QSV_30_1(OUT_PREFIX``io_out_QSV_30_1), .io_out_QSV_31_0(OUT_PREFIX``io_out_QSV_31_0), .io_out_QSV_31_1(OUT_PREFIX``io_out_QSV_31_1), \
    .io_out_valid(OUT_PREFIX``io_out_valid)

  HGate5QubitVector8bit m (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_PORTS( , _m_)
  );

  CNGate5QubitVector8bit m_1 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_PORTS(_m_, _m_1_)
  );

  CompatiblePerm m_2 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_PORTS(_m_1_, _m_2_)
  );

  CNGate5QubitVector8bit m_3 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_PORTS(_m_2_, _m_3_)
  );

  CompatiblePerm_1 m_4 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_PORTS(_m_3_, _m_4_)
  );

  CompatiblePerm_2 m_5 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_PORTS(_m_4_, _m_5_)
  );

  CNGate5QubitVector8bit m_6 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_PORTS(_m_5_, _m_6_)
  );

  CompatiblePerm_3 m_7 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_PORTS(_m_6_, _m_7_)
  );

  CompatiblePerm_4 m_8 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_PORTS(_m_7_, _m_8_)
  );

  CNGate5QubitVector8bit m_9 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_PORTS(_m_8_, _m_9_)
  );

  CompatiblePerm_5 m_10 (
    .clock(clock), .reset(reset),
    `CONNECT_STAGE_PORTS(_m_9_, )
  );

endmodule
