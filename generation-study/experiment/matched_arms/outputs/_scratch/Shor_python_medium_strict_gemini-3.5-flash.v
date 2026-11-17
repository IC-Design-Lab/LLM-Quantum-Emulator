module Shor (
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
  input  logic       clock,
  input  logic       reset,
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

  // Intermediate wires declaration
  `define DECLARE_STAGE_WIRES(prefix) \
    logic [7:0] prefix``_io_out_QSV_0_0, prefix``_io_out_QSV_0_1; \
    logic [7:0] prefix``_io_out_QSV_1_0, prefix``_io_out_QSV_1_1; \
    logic [7:0] prefix``_io_out_QSV_2_0, prefix``_io_out_QSV_2_1; \
    logic [7:0] prefix``_io_out_QSV_3_0, prefix``_io_out_QSV_3_1; \
    logic [7:0] prefix``_io_out_QSV_4_0, prefix``_io_out_QSV_4_1; \
    logic [7:0] prefix``_io_out_QSV_5_0, prefix``_io_out_QSV_5_1; \
    logic [7:0] prefix``_io_out_QSV_6_0, prefix``_io_out_QSV_6_1; \
    logic [7:0] prefix``_io_out_QSV_7_0, prefix``_io_out_QSV_7_1; \
    logic [7:0] prefix``_io_out_QSV_8_0, prefix``_io_out_QSV_8_1; \
    logic [7:0] prefix``_io_out_QSV_9_0, prefix``_io_out_QSV_9_1; \
    logic [7:0] prefix``_io_out_QSV_10_0, prefix``_io_out_QSV_10_1; \
    logic [7:0] prefix``_io_out_QSV_11_0, prefix``_io_out_QSV_11_1; \
    logic [7:0] prefix``_io_out_QSV_12_0, prefix``_io_out_QSV_12_1; \
    logic [7:0] prefix``_io_out_QSV_13_0, prefix``_io_out_QSV_13_1; \
    logic [7:0] prefix``_io_out_QSV_14_0, prefix``_io_out_QSV_14_1; \
    logic [7:0] prefix``_io_out_QSV_15_0, prefix``_io_out_QSV_15_1; \
    logic [7:0] prefix``_io_out_QSV_16_0, prefix``_io_out_QSV_16_1; \
    logic [7:0] prefix``_io_out_QSV_17_0, prefix``_io_out_QSV_17_1; \
    logic [7:0] prefix``_io_out_QSV_18_0, prefix``_io_out_QSV_18_1; \
    logic [7:0] prefix``_io_out_QSV_19_0, prefix``_io_out_QSV_19_1; \
    logic [7:0] prefix``_io_out_QSV_20_0, prefix``_io_out_QSV_20_1; \
    logic [7:0] prefix``_io_out_QSV_21_0, prefix``_io_out_QSV_21_1; \
    logic [7:0] prefix``_io_out_QSV_22_0, prefix``_io_out_QSV_22_1; \
    logic [7:0] prefix``_io_out_QSV_23_0, prefix``_io_out_QSV_23_1; \
    logic [7:0] prefix``_io_out_QSV_24_0, prefix``_io_out_QSV_24_1; \
    logic [7:0] prefix``_io_out_QSV_25_0, prefix``_io_out_QSV_25_1; \
    logic [7:0] prefix``_io_out_QSV_26_0, prefix``_io_out_QSV_26_1; \
    logic [7:0] prefix``_io_out_QSV_27_0, prefix``_io_out_QSV_27_1; \
    logic [7:0] prefix``_io_out_QSV_28_0, prefix``_io_out_QSV_28_1; \
    logic [7:0] prefix``_io_out_QSV_29_0, prefix``_io_out_QSV_29_1; \
    logic [7:0] prefix``_io_out_QSV_30_0, prefix``_io_out_QSV_30_1; \
    logic [7:0] prefix``_io_out_QSV_31_0, prefix``_io_out_QSV_31_1; \
    logic       prefix``_io_out_valid;

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

  `define CONNECT_PORTS(inst, prefix_in, prefix_out) \
    .io_in_QSV_0_0(prefix_in``_0_0), .io_in_QSV_0_1(prefix_in``_0_1), \
    .io_in_QSV_1_0(prefix_in``_1_0), .io_in_QSV_1_1(prefix_in``_1_1), \
    .io_in_QSV_2_0(prefix_in``_2_0), .io_in_QSV_2_1(prefix_in``_2_1), \
    .io_in_QSV_3_0(prefix_in``_3_0), .io_in_QSV_3_1(prefix_in``_3_1), \
    .io_in_QSV_4_0(prefix_in``_4_0), .io_in_QSV_4_1(prefix_in``_4_1), \
    .io_in_QSV_5_0(prefix_in``_5_0), .io_in_QSV_5_1(prefix_in``_5_1), \
    .io_in_QSV_6_0(prefix_in``_6_0), .io_in_QSV_6_1(prefix_in``_6_1), \
    .io_in_QSV_7_0(prefix_in``_7_0), .io_in_QSV_7_1(prefix_in``_7_1), \
    .io_in_QSV_8_0(prefix_in``_8_0), .io_in_QSV_8_1(prefix_in``_8_1), \
    .io_in_QSV_9_0(prefix_in``_9_0), .io_in_QSV_9_1(prefix_in``_9_1), \
    .io_in_QSV_10_0(prefix_in``_10_0), .io_in_QSV_10_1(prefix_in``_10_1), \
    .io_in_QSV_11_0(prefix_in``_11_0), .io_in_QSV_11_1(prefix_in``_11_1), \
    .io_in_QSV_12_0(prefix_in``_12_0), .io_in_QSV_12_1(prefix_in``_12_1), \
    .io_in_QSV_13_0(prefix_in``_13_0), .io_in_QSV_13_1(prefix_in``_13_1), \
    .io_in_QSV_14_0(prefix_in``_14_0), .io_in_QSV_14_1(prefix_in``_14_1), \
    .io_in_QSV_15_0(prefix_in``_15_0), .io_in_QSV_15_1(prefix_in``_15_1), \
    .io_in_QSV_16_0(prefix_in``_16_0), .io_in_QSV_16_1(prefix_in``_16_1), \
    .io_in_QSV_17_0(prefix_in``_17_0), .io_in_QSV_17_1(prefix_in``_17_1), \
    .io_in_QSV_18_0(prefix_in``_18_0), .io_in_QSV_18_1(prefix_in``_18_1), \
    .io_in_QSV_19_0(prefix_in``_19_0), .io_in_QSV_19_1(prefix_in``_19_1), \
    .io_in_QSV_20_0(prefix_in``_20_0), .io_in_QSV_20_1(prefix_in``_20_1), \
    .io_in_QSV_21_0(prefix_in``_21_0), .io_in_QSV_21_1(prefix_in``_21_1), \
    .io_in_QSV_22_0(prefix_in``_22_0), .io_in_QSV_22_1(prefix_in``_22_1), \
    .io_in_QSV_23_0(prefix_in``_23_0), .io_in_QSV_23_1(prefix_in``_23_1), \
    .io_in_QSV_24_0(prefix_in``_24_0), .io_in_QSV_24_1(prefix_in``_24_1), \
    .io_in_QSV_25_0(prefix_in``_25_0), .io_in_QSV_25_1(prefix_in``_25_1), \
    .io_in_QSV_26_0(prefix_in``_26_0), .io_in_QSV_26_1(prefix_in``_26_1), \
    .io_in_QSV_27_0(prefix_in``_27_0), .io_in_QSV_27_1(prefix_in``_27_1), \
    .io_in_QSV_28_0(prefix_in``_28_0), .io_in_QSV_28_1(prefix_in``_28_1), \
    .io_in_QSV_29_0(prefix_in``_29_0), .io_in_QSV_29_1(prefix_in``_29_1), \
    .io_in_QSV_30_0(prefix_in``_30_0), .io_in_QSV_30_1(prefix_in``_30_1), \
    .io_in_QSV_31_0(prefix_in``_31_0), .io_in_QSV_31_1(prefix_in``_31_1), \
    .io_in_valid(prefix_in``_valid), \
    .io_out_QSV_0_0(prefix_out``_0_0), .io_out_QSV_0_1(prefix_out``_0_1), \
    .io_out_QSV_1_0(prefix_out``_1_0), .io_out_QSV_1_1(prefix_out``_1_1), \
    .io_out_QSV_2_0(prefix_out``_2_0), .io_out_QSV_2_1(prefix_out``_2_1), \
    .io_out_QSV_3_0(prefix_out``_3_0), .io_out_QSV_3_1(prefix_out``_3_1), \
    .io_out_QSV_4_0(prefix_out``_4_0), .io_out_QSV_4_1(prefix_out``_4_1), \
    .io_out_QSV_5_0(prefix_out``_5_0), .io_out_QSV_5_1(prefix_out``_5_1), \
    .io_out_QSV_6_0(prefix_out``_6_0), .io_out_QSV_6_1(prefix_out``_6_1), \
    .io_out_QSV_7_0(prefix_out``_7_0), .io_out_QSV_7_1(prefix_out``_7_1), \
    .io_out_QSV_8_0(prefix_out``_8_0), .io_out_QSV_8_1(prefix_out``_8_1), \
    .io_out_QSV_9_0(prefix_out``_9_0), .io_out_QSV_9_1(prefix_out``_9_1), \
    .io_out_QSV_10_0(prefix_out``_10_0), .io_out_QSV_10_1(prefix_out``_10_1), \
    .io_out_QSV_11_0(prefix_out``_11_0), .io_out_QSV_11_1(prefix_out``_11_1), \
    .io_out_QSV_12_0(prefix_out``_12_0), .io_out_QSV_12_1(prefix_out``_12_1), \
    .io_out_QSV_13_0(prefix_out``_13_0), .io_out_QSV_13_1(prefix_out``_13_1), \
    .io_out_QSV_14_0(prefix_out``_14_0), .io_out_QSV_14_1(prefix_out``_14_1), \
    .io_out_QSV_15_0(prefix_out``_15_0), .io_out_QSV_15_1(prefix_out``_15_1), \
    .io_out_QSV_16_0(prefix_out``_16_0), .io_out_QSV_16_1(prefix_out``_16_1), \
    .io_out_QSV_17_0(prefix_out``_17_0), .io_out_QSV_17_1(prefix_out``_17_1), \
    .io_out_QSV_18_0(prefix_out``_18_0), .io_out_QSV_18_1(prefix_out``_18_1), \
    .io_out_QSV_19_0(prefix_out``_19_0), .io_out_QSV_19_1(prefix_out``_19_1), \
    .io_out_QSV_20_0(prefix_out``_20_0), .io_out_QSV_20_1(prefix_out``_20_1), \
    .io_out_QSV_21_0(prefix_out``_21_0), .io_out_QSV_21_1(prefix_out``_21_1), \
    .io_out_QSV_22_0(prefix_out``_22_0), .io_out_QSV_22_1(prefix_out``_22_1), \
    .io_out_QSV_23_0(prefix_out``_23_0), .io_out_QSV_23_1(prefix_out``_23_1), \
    .io_out_QSV_24_0(prefix_out``_24_0), .io_out_QSV_24_1(prefix_out``_24_1), \
    .io_out_QSV_25_0(prefix_out``_25_0), .io_out_QSV_25_1(prefix_out``_25_1), \
    .io_out_QSV_26_0(prefix_out``_26_0), .io_out_QSV_26_1(prefix_out``_26_1), \
    .io_out_QSV_27_0(prefix_out``_27_0), .io_out_QSV_27_1(prefix_out``_27_1), \
    .io_out_QSV_28_0(prefix_out``_28_0), .io_out_QSV_28_1(prefix_out``_28_1), \
    .io_out_QSV_29_0(prefix_out``_29_0), .io_out_QSV_29_1(prefix_out``_29_1), \
    .io_out_QSV_30_0(prefix_out``_30_0), .io_out_QSV_30_1(prefix_out``_30_1), \
    .io_out_QSV_31_0(prefix_out``_31_0), .io_out_QSV_31_1(prefix_out``_31_1), \
    .io_out_valid(prefix_out``_valid)

  HGate5QubitVector8bit m (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(m, io_in_QSV, _m)
  );

  CNGate5QubitVector8bit m_1 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(m_1, _m_io_out_QSV, _m_1)
  );

  CompatiblePerm m_2 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(m_2, _m_1_io_out_QSV, _m_2)
  );

  CNGate5QubitVector8bit m_3 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(m_3, _m_2_io_out_QSV, _m_3)
  );

  CompatiblePerm_1 m_4 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(m_4, _m_3_io_out_QSV, _m_4)
  );

  CompatiblePerm_2 m_5 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(m_5, _m_4_io_out_QSV, _m_5)
  );

  CNGate5QubitVector8bit m_6 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(m_6, _m_5_io_out_QSV, _m_6)
  );

  CompatiblePerm_3 m_7 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(m_7, _m_6_io_out_QSV, _m_7)
  );

  CompatiblePerm_4 m_8 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(m_8, _m_7_io_out_QSV, _m_8)
  );

  CNGate5QubitVector8bit m_9 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(m_9, _m_8_io_out_QSV, _m_9)
  );

  CompatiblePerm_5 m_10 (
    .clock(clock),
    .reset(reset),
    `CONNECT_PORTS(m_10, _m_9_io_out_QSV, io_out_QSV)
  );

endmodule
