module Shor (
  input  wire       clock,
  input  wire       reset,
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
  input  wire       io_in_valid,
  
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
  output wire       io_out_valid
);

  // Auto-generated interconnection wires
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
    wire       PREFIX``_io_out_valid;

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
  `DECLARE_STAGE_WIRES(_m_12)
  `DECLARE_STAGE_WIRES(_m_13)
  `DECLARE_STAGE_WIRES(_m_14)

  `define CONNECT_PORTS(IN_PRE, OUT_PRE) \
    .clock(clock), .reset(reset), \
    .io_in_QSV_0_0(IN_PRE``_0_0), .io_in_QSV_0_1(IN_PRE``_0_1), .io_in_QSV_1_0(IN_PRE``_1_0), .io_in_QSV_1_1(IN_PRE``_1_1), \
    .io_in_QSV_2_0(IN_PRE``_2_0), .io_in_QSV_2_1(IN_PRE``_2_1), .io_in_QSV_3_0(IN_PRE``_3_0), .io_in_QSV_3_1(IN_PRE``_3_1), \
    .io_in_QSV_4_0(IN_PRE``_4_0), .io_in_QSV_4_1(IN_PRE``_4_1), .io_in_QSV_5_0(IN_PRE``_5_0), .io_in_QSV_5_1(IN_PRE``_5_1), \
    .io_in_QSV_6_0(IN_PRE``_6_0), .io_in_QSV_6_1(IN_PRE``_6_1), .io_in_QSV_7_0(IN_PRE``_7_0), .io_in_QSV_7_1(IN_PRE``_7_1), \
    .io_in_QSV_8_0(IN_PRE``_8_0), .io_in_QSV_8_1(IN_PRE``_8_1), .io_in_QSV_9_0(IN_PRE``_9_0), .io_in_QSV_9_1(IN_PRE``_9_1), \
    .io_in_QSV_10_0(IN_PRE``_10_0), .io_in_QSV_10_1(IN_PRE``_10_1), .io_in_QSV_11_0(IN_PRE``_11_0), .io_in_QSV_11_1(IN_PRE``_11_1), \
    .io_in_QSV_12_0(IN_PRE``_12_0), .io_in_QSV_12_1(IN_PRE``_12_1), .io_in_QSV_13_0(IN_PRE``_13_0), .io_in_QSV_13_1(IN_PRE``_13_1), \
    .io_in_QSV_14_0(IN_PRE``_14_0), .io_in_QSV_14_1(IN_PRE``_14_1), .io_in_QSV_15_0(IN_PRE``_15_0), .io_in_QSV_15_1(IN_PRE``_15_1), \
    .io_in_QSV_16_0(IN_PRE``_16_0), .io_in_QSV_16_1(IN_PRE``_16_1), .io_in_QSV_17_0(IN_PRE``_17_0), .io_in_QSV_17_1(IN_PRE``_17_1), \
    .io_in_QSV_18_0(IN_PRE``_18_0), .io_in_QSV_18_1(IN_PRE``_18_1), .io_in_QSV_19_0(IN_PRE``_19_0), .io_in_QSV_19_1(IN_PRE``_19_1), \
    .io_in_QSV_20_0(IN_PRE``_20_0), .io_in_QSV_20_1(IN_PRE``_20_1), .io_in_QSV_21_0(IN_PRE``_21_0), .io_in_QSV_21_1(IN_PRE``_21_1), \
    .io_in_QSV_22_0(IN_PRE``_22_0), .io_in_QSV_22_1(IN_PRE``_22_1), .io_in_QSV_23_0(IN_PRE``_23_0), .io_in_QSV_23_1(IN_PRE``_23_1), \
    .io_in_QSV_24_0(IN_PRE``_24_0), .io_in_QSV_24_1(IN_PRE``_24_1), .io_in_QSV_25_0(IN_PRE``_25_0), .io_in_QSV_25_1(IN_PRE``_25_1), \
    .io_in_QSV_26_0(IN_PRE``_26_0), .io_in_QSV_26_1(IN_PRE``_26_1), .io_in_QSV_27_0(IN_PRE``_27_0), .io_in_QSV_27_1(IN_PRE``_27_1), \
    .io_in_QSV_28_0(IN_PRE``_28_0), .io_in_QSV_28_1(IN_PRE``_28_1), .io_in_QSV_29_0(IN_PRE``_29_0), .io_in_QSV_29_1(IN_PRE``_29_1), \
    .io_in_QSV_30_0(IN_PRE``_30_0), .io_in_QSV_30_1(IN_PRE``_30_1), .io_in_QSV_31_0(IN_PRE``_31_0), .io_in_QSV_31_1(IN_PRE``_31_1), \
    .io_in_valid(IN_PRE``_valid), \
    .io_out_QSV_0_0(OUT_PRE``_0_0), .io_out_QSV_0_1(OUT_PRE``_0_1), .io_out_QSV_1_0(OUT_PRE``_1_0), .io_out_QSV_1_1(OUT_PRE``_1_1), \
    .io_out_QSV_2_0(OUT_PRE``_2_0), .io_out_QSV_2_1(OUT_PRE``_2_1), .io_out_QSV_3_0(OUT_PRE``_3_0), .io_out_QSV_3_1(OUT_PRE``_3_1), \
    .io_out_QSV_4_0(OUT_PRE``_4_0), .io_out_QSV_4_1(OUT_PRE``_4_1), .io_out_QSV_5_0(OUT_PRE``_5_0), .io_out_QSV_5_1(OUT_PRE``_5_1), \
    .io_out_QSV_6_0(OUT_PRE``_6_0), .io_out_QSV_6_1(OUT_PRE``_6_1), .io_out_QSV_7_0(OUT_PRE``_7_0), .io_out_QSV_7_1(OUT_PRE``_7_1), \
    .io_out_QSV_8_0(OUT_PRE``_8_0), .io_out_QSV_8_1(OUT_PRE``_8_1), .io_out_QSV_9_0(OUT_PRE``_9_0), .io_out_QSV_9_1(OUT_PRE``_9_1), \
    .io_out_QSV_10_0(OUT_PRE``_10_0), .io_out_QSV_10_1(OUT_PRE``_10_1), .io_out_QSV_11_0(OUT_PRE``_11_0), .io_out_QSV_11_1(OUT_PRE``_11_1), \
    .io_out_QSV_12_0(OUT_PRE``_12_0), .io_out_QSV_12_1(OUT_PRE``_12_1), .io_out_QSV_13_0(OUT_PRE``_13_0), .io_out_QSV_13_1(OUT_PRE``_13_1), \
    .io_out_QSV_14_0(OUT_PRE``_14_0), .io_out_QSV_14_1(OUT_PRE``_14_1), .io_out_QSV_15_0(OUT_PRE``_15_0), .io_out_QSV_15_1(OUT_PRE``_15_1), \
    .io_out_QSV_16_0(OUT_PRE``_16_0), .io_out_QSV_16_1(OUT_PRE``_16_1), .io_out_QSV_17_0(OUT_PRE``_17_0), .io_out_QSV_17_1(OUT_PRE``_17_1), \
    .io_out_QSV_18_0(OUT_PRE``_18_0), .io_out_QSV_18_1(OUT_PRE``_18_1), .io_out_QSV_19_0(OUT_PRE``_19_0), .io_out_QSV_19_1(OUT_PRE``_19_1), \
    .io_out_QSV_20_0(OUT_PRE``_20_0), .io_out_QSV_20_1(OUT_PRE``_20_1), .io_out_QSV_21_0(OUT_PRE``_21_0), .io_out_QSV_21_1(OUT_PRE``_21_1), \
    .io_out_QSV_22_0(OUT_PRE``_22_0), .io_out_QSV_22_1(OUT_PRE``_22_1), .io_out_QSV_23_0(OUT_PRE``_23_0), .io_out_QSV_23_1(OUT_PRE``_23_1), \
    .io_out_QSV_24_0(OUT_PRE``_24_0), .io_out_QSV_24_1(OUT_PRE``_24_1), .io_out_QSV_25_0(OUT_PRE``_25_0), .io_out_QSV_25_1(OUT_PRE``_25_1), \
    .io_out_QSV_26_0(OUT_PRE``_26_0), .io_out_QSV_26_1(OUT_PRE``_26_1), .io_out_QSV_27_0(OUT_PRE``_27_0), .io_out_QSV_27_1(OUT_PRE``_27_1), \
    .io_out_QSV_28_0(OUT_PRE``_28_0), .io_out_QSV_28_1(OUT_PRE``_28_1), .io_out_QSV_29_0(OUT_PRE``_29_0), .io_out_QSV_29_1(OUT_PRE``_29_1), \
    .io_out_QSV_30_0(OUT_PRE``_30_0), .io_out_QSV_30_1(OUT_PRE``_30_1), .io_out_QSV_31_0(OUT_PRE``_31_0), .io_out_QSV_31_1(OUT_PRE``_31_1), \
    .io_out_valid(OUT_PRE``_valid)

  // Step 0: H on q0 (default routing position, no perm needed)
  HGate5QubitVector8bit m (
    `CONNECT_PORTS(io_in_QSV, _m_io_out_QSV)
  );

  // Step 1: CX on q0, q1
  CompatiblePerm m_1 (
    `CONNECT_PORTS(_m_io_out_QSV, _m_1_io_out_QSV)
  );

  CNGate5QubitVector8bit m_2 (
    `CONNECT_PORTS(_m_1_io_out_QSV, _m_2_io_out_QSV)
  );

  CompatiblePerm_1 m_3 (
    `CONNECT_PORTS(_m_2_io_out_QSV, _m_3_io_out_QSV)
  );

  // Step 2: CX on q1, q2
  CompatiblePerm_2 m_4 (
    `CONNECT_PORTS(_m_3_io_out_QSV, _m_4_io_out_QSV)
  );

  CNGate5QubitVector8bit m_5 (
    `CONNECT_PORTS(_m_4_io_out_QSV, _m_5_io_out_QSV)
  );

  CompatiblePerm_3 m_6 (
    `CONNECT_PORTS(_m_5_io_out_QSV, _m_6_io_out_QSV)
  );

  // Step 3: CX on q2, q3
  CompatiblePerm_4 m_7 (
    `CONNECT_PORTS(_m_6_io_out_QSV, _m_7_io_out_QSV)
  );

  CNGate5QubitVector8bit m_8 (
    `CONNECT_PORTS(_m_7_io_out_QSV, _m_8_io_out_QSV)
  );

  CompatiblePerm_5 m_9 (
    `CONNECT_PORTS(_m_8_io_out_QSV, _m_9_io_out_QSV)
  );

  // Step 4: CX on q3, q4 (plus subsequent perms to restore ordering)
  CompatiblePerm_6 m_10 (
    `CONNECT_PORTS(_m_9_io_out_QSV, _m_10_io_out_QSV)
  );

  CNGate5QubitVector8bit m_11 (
    `CONNECT_PORTS(_m_10_io_out_QSV, _m_11_io_out_QSV)
  );

  CompatiblePerm_7 m_12 (
    `CONNECT_PORTS(_m_11_io_out_QSV, _m_12_io_out_QSV)
  );

  CompatiblePerm_8 m_13 (
    `CONNECT_PORTS(_m_12_io_out_QSV, _m_13_io_out_QSV)
  );

  CompatiblePerm_9 m_14 (
    `CONNECT_PORTS(_m_13_io_out_QSV, _m_14_io_out_QSV)
  );

  CompatiblePerm_10 m_15 (
    `CONNECT_PORTS(_m_14_io_out_QSV, io_out_QSV)
  );

  `undef DECLARE_STAGE_WIRES
  `undef CONNECT_PORTS

endmodule
