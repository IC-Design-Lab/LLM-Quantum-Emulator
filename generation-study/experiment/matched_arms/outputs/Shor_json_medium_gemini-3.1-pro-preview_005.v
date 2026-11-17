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

  `define DECLARE_STAGE_WIRES(STG) \
    wire [7:0] ``STG``_io_out_QSV_0_0, ``STG``_io_out_QSV_0_1, ``STG``_io_out_QSV_1_0, ``STG``_io_out_QSV_1_1; \
    wire [7:0] ``STG``_io_out_QSV_2_0, ``STG``_io_out_QSV_2_1, ``STG``_io_out_QSV_3_0, ``STG``_io_out_QSV_3_1; \
    wire [7:0] ``STG``_io_out_QSV_4_0, ``STG``_io_out_QSV_4_1, ``STG``_io_out_QSV_5_0, ``STG``_io_out_QSV_5_1; \
    wire [7:0] ``STG``_io_out_QSV_6_0, ``STG``_io_out_QSV_6_1, ``STG``_io_out_QSV_7_0, ``STG``_io_out_QSV_7_1; \
    wire [7:0] ``STG``_io_out_QSV_8_0, ``STG``_io_out_QSV_8_1, ``STG``_io_out_QSV_9_0, ``STG``_io_out_QSV_9_1; \
    wire [7:0] ``STG``_io_out_QSV_10_0, ``STG``_io_out_QSV_10_1, ``STG``_io_out_QSV_11_0, ``STG``_io_out_QSV_11_1; \
    wire [7:0] ``STG``_io_out_QSV_12_0, ``STG``_io_out_QSV_12_1, ``STG``_io_out_QSV_13_0, ``STG``_io_out_QSV_13_1; \
    wire [7:0] ``STG``_io_out_QSV_14_0, ``STG``_io_out_QSV_14_1, ``STG``_io_out_QSV_15_0, ``STG``_io_out_QSV_15_1; \
    wire [7:0] ``STG``_io_out_QSV_16_0, ``STG``_io_out_QSV_16_1, ``STG``_io_out_QSV_17_0, ``STG``_io_out_QSV_17_1; \
    wire [7:0] ``STG``_io_out_QSV_18_0, ``STG``_io_out_QSV_18_1, ``STG``_io_out_QSV_19_0, ``STG``_io_out_QSV_19_1; \
    wire [7:0] ``STG``_io_out_QSV_20_0, ``STG``_io_out_QSV_20_1, ``STG``_io_out_QSV_21_0, ``STG``_io_out_QSV_21_1; \
    wire [7:0] ``STG``_io_out_QSV_22_0, ``STG``_io_out_QSV_22_1, ``STG``_io_out_QSV_23_0, ``STG``_io_out_QSV_23_1; \
    wire [7:0] ``STG``_io_out_QSV_24_0, ``STG``_io_out_QSV_24_1, ``STG``_io_out_QSV_25_0, ``STG``_io_out_QSV_25_1; \
    wire [7:0] ``STG``_io_out_QSV_26_0, ``STG``_io_out_QSV_26_1, ``STG``_io_out_QSV_27_0, ``STG``_io_out_QSV_27_1; \
    wire [7:0] ``STG``_io_out_QSV_28_0, ``STG``_io_out_QSV_28_1, ``STG``_io_out_QSV_29_0, ``STG``_io_out_QSV_29_1; \
    wire [7:0] ``STG``_io_out_QSV_30_0, ``STG``_io_out_QSV_30_1, ``STG``_io_out_QSV_31_0, ``STG``_io_out_QSV_31_1; \
    wire ``STG``_io_out_valid;

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

  `define CONNECT_STAGE(MOD, INST, IN_STG, OUT_STG) \
    MOD INST ( \
      .clock(clock), .reset(reset), \
      .io_in_QSV_0_0(IN_STG``_0_0), .io_in_QSV_0_1(IN_STG``_0_1), .io_in_QSV_1_0(IN_STG``_1_0), .io_in_QSV_1_1(IN_STG``_1_1), \
      .io_in_QSV_2_0(IN_STG``_2_0), .io_in_QSV_2_1(IN_STG``_2_1), .io_in_QSV_3_0(IN_STG``_3_0), .io_in_QSV_3_1(IN_STG``_3_1), \
      .io_in_QSV_4_0(IN_STG``_4_0), .io_in_QSV_4_1(IN_STG``_4_1), .io_in_QSV_5_0(IN_STG``_5_0), .io_in_QSV_5_1(IN_STG``_5_1), \
      .io_in_QSV_6_0(IN_STG``_6_0), .io_in_QSV_6_1(IN_STG``_6_1), .io_in_QSV_7_0(IN_STG``_7_0), .io_in_QSV_7_1(IN_STG``_7_1), \
      .io_in_QSV_8_0(IN_STG``_8_0), .io_in_QSV_8_1(IN_STG``_8_1), .io_in_QSV_9_0(IN_STG``_9_0), .io_in_QSV_9_1(IN_STG``_9_1), \
      .io_in_QSV_10_0(IN_STG``_10_0), .io_in_QSV_10_1(IN_STG``_10_1), .io_in_QSV_11_0(IN_STG``_11_0), .io_in_QSV_11_1(IN_STG``_11_1), \
      .io_in_QSV_12_0(IN_STG``_12_0), .io_in_QSV_12_1(IN_STG``_12_1), .io_in_QSV_13_0(IN_STG``_13_0), .io_in_QSV_13_1(IN_STG``_13_1), \
      .io_in_QSV_14_0(IN_STG``_14_0), .io_in_QSV_14_1(IN_STG``_14_1), .io_in_QSV_15_0(IN_STG``_15_0), .io_in_QSV_15_1(IN_STG``_15_1), \
      .io_in_QSV_16_0(IN_STG``_16_0), .io_in_QSV_16_1(IN_STG``_16_1), .io_in_QSV_17_0(IN_STG``_17_0), .io_in_QSV_17_1(IN_STG``_17_1), \
      .io_in_QSV_18_0(IN_STG``_18_0), .io_in_QSV_18_1(IN_STG``_18_1), .io_in_QSV_19_0(IN_STG``_19_0), .io_in_QSV_19_1(IN_STG``_19_1), \
      .io_in_QSV_20_0(IN_STG``_20_0), .io_in_QSV_20_1(IN_STG``_20_1), .io_in_QSV_21_0(IN_STG``_21_0), .io_in_QSV_21_1(IN_STG``_21_1), \
      .io_in_QSV_22_0(IN_STG``_22_0), .io_in_QSV_22_1(IN_STG``_22_1), .io_in_QSV_23_0(IN_STG``_23_0), .io_in_QSV_23_1(IN_STG``_23_1), \
      .io_in_QSV_24_0(IN_STG``_24_0), .io_in_QSV_24_1(IN_STG``_24_1), .io_in_QSV_25_0(IN_STG``_25_0), .io_in_QSV_25_1(IN_STG``_25_1), \
      .io_in_QSV_26_0(IN_STG``_26_0), .io_in_QSV_26_1(IN_STG``_26_1), .io_in_QSV_27_0(IN_STG``_27_0), .io_in_QSV_27_1(IN_STG``_27_1), \
      .io_in_QSV_28_0(IN_STG``_28_0), .io_in_QSV_28_1(IN_STG``_28_1), .io_in_QSV_29_0(IN_STG``_29_0), .io_in_QSV_29_1(IN_STG``_29_1), \
      .io_in_QSV_30_0(IN_STG``_30_0), .io_in_QSV_30_1(IN_STG``_30_1), .io_in_QSV_31_0(IN_STG``_31_0), .io_in_QSV_31_1(IN_STG``_31_1), \
      .io_in_valid(IN_STG``_valid), \
      .io_out_QSV_0_0(OUT_STG``_0_0), .io_out_QSV_0_1(OUT_STG``_0_1), .io_out_QSV_1_0(OUT_STG``_1_0), .io_out_QSV_1_1(OUT_STG``_1_1), \
      .io_out_QSV_2_0(OUT_STG``_2_0), .io_out_QSV_2_1(OUT_STG``_2_1), .io_out_QSV_3_0(OUT_STG``_3_0), .io_out_QSV_3_1(OUT_STG``_3_1), \
      .io_out_QSV_4_0(OUT_STG``_4_0), .io_out_QSV_4_1(OUT_STG``_4_1), .io_out_QSV_5_0(OUT_STG``_5_0), .io_out_QSV_5_1(OUT_STG``_5_1), \
      .io_out_QSV_6_0(OUT_STG``_6_0), .io_out_QSV_6_1(OUT_STG``_6_1), .io_out_QSV_7_0(OUT_STG``_7_0), .io_out_QSV_7_1(OUT_STG``_7_1), \
      .io_out_QSV_8_0(OUT_STG``_8_0), .io_out_QSV_8_1(OUT_STG``_8_1), .io_out_QSV_9_0(OUT_STG``_9_0), .io_out_QSV_9_1(OUT_STG``_9_1), \
      .io_out_QSV_10_0(OUT_STG``_10_0), .io_out_QSV_10_1(OUT_STG``_10_1), .io_out_QSV_11_0(OUT_STG``_11_0), .io_out_QSV_11_1(OUT_STG``_11_1), \
      .io_out_QSV_12_0(OUT_STG``_12_0), .io_out_QSV_12_1(OUT_STG``_12_1), .io_out_QSV_13_0(OUT_STG``_13_0), .io_out_QSV_13_1(OUT_STG``_13_1), \
      .io_out_QSV_14_0(OUT_STG``_14_0), .io_out_QSV_14_1(OUT_STG``_14_1), .io_out_QSV_15_0(OUT_STG``_15_0), .io_out_QSV_15_1(OUT_STG``_15_1), \
      .io_out_QSV_16_0(OUT_STG``_16_0), .io_out_QSV_16_1(OUT_STG``_16_1), .io_out_QSV_17_0(OUT_STG``_17_0), .io_out_QSV_17_1(OUT_STG``_17_1), \
      .io_out_QSV_18_0(OUT_STG``_18_0), .io_out_QSV_18_1(OUT_STG``_18_1), .io_out_QSV_19_0(OUT_STG``_19_0), .io_out_QSV_19_1(OUT_STG``_19_1), \
      .io_out_QSV_20_0(OUT_STG``_20_0), .io_out_QSV_20_1(OUT_STG``_20_1), .io_out_QSV_21_0(OUT_STG``_21_0), .io_out_QSV_21_1(OUT_STG``_21_1), \
      .io_out_QSV_22_0(OUT_STG``_22_0), .io_out_QSV_22_1(OUT_STG``_22_1), .io_out_QSV_23_0(OUT_STG``_23_0), .io_out_QSV_23_1(OUT_STG``_23_1), \
      .io_out_QSV_24_0(OUT_STG``_24_0), .io_out_QSV_24_1(OUT_STG``_24_1), .io_out_QSV_25_0(OUT_STG``_25_0), .io_out_QSV_25_1(OUT_STG``_25_1), \
      .io_out_QSV_26_0(OUT_STG``_26_0), .io_out_QSV_26_1(OUT_STG``_26_1), .io_out_QSV_27_0(OUT_STG``_27_0), .io_out_QSV_27_1(OUT_STG``_27_1), \
      .io_out_QSV_28_0(OUT_STG``_28_0), .io_out_QSV_28_1(OUT_STG``_28_1), .io_out_QSV_29_0(OUT_STG``_29_0), .io_out_QSV_29_1(OUT_STG``_29_1), \
      .io_out_QSV_30_0(OUT_STG``_30_0), .io_out_QSV_30_1(OUT_STG``_30_1), .io_out_QSV_31_0(OUT_STG``_31_0), .io_out_QSV_31_1(OUT_STG``_31_1), \
      .io_out_valid(OUT_STG``_valid) \
    );

  // Step 0: H on qubit 0 (default routing pos)
  `CONNECT_STAGE(HGate5QubitVector8bit, m, io_in, _m_io_out)

  // Step 1: CX on qubits [0, 1]
  `CONNECT_STAGE(CompatiblePerm, m_1, _m_io_out, _m_1_io_out)
  `CONNECT_STAGE(CNGate5QubitVector8bit, m_2, _m_1_io_out, _m_2_io_out)
  `CONNECT_STAGE(CompatiblePerm_1, m_3, _m_2_io_out, _m_3_io_out)

  // Step 2: CX on qubits [1, 2]
  `CONNECT_STAGE(CompatiblePerm_2, m_4, _m_3_io_out, _m_4_io_out)
  `CONNECT_STAGE(CNGate5QubitVector8bit, m_5, _m_4_io_out, _m_5_io_out)
  `CONNECT_STAGE(CompatiblePerm_3, m_6, _m_5_io_out, _m_6_io_out)

  // Step 3: CX on qubits [2, 3]
  `CONNECT_STAGE(CompatiblePerm_4, m_7, _m_6_io_out, _m_7_io_out)
  `CONNECT_STAGE(CNGate5QubitVector8bit, m_8, _m_7_io_out, _m_8_io_out)
  `CONNECT_STAGE(CompatiblePerm_5, m_9, _m_8_io_out, _m_9_io_out)

  // Step 4: CX on qubits [3, 4] with additional restoring stages
  `CONNECT_STAGE(CompatiblePerm_6, m_10, _m_9_io_out, _m_10_io_out)
  `CONNECT_STAGE(CNGate5QubitVector8bit, m_11, _m_10_io_out, _m_11_io_out)
  `CONNECT_STAGE(CompatiblePerm_7, m_12, _m_11_io_out, _m_12_io_out)
  `CONNECT_STAGE(CompatiblePerm_8, m_13, _m_12_io_out, _m_13_io_out)
  `CONNECT_STAGE(CompatiblePerm_9, m_14, _m_13_io_out, _m_14_io_out)
  `CONNECT_STAGE(CompatiblePerm_10, m_15, _m_14_io_out, io_out)

endmodule
