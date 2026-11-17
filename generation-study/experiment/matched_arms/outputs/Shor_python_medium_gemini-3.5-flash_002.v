module Shor (
  input        clock,
  input        reset,
  input  [7:0] io_in_QSV_0_0,
  input  [7:0] io_in_QSV_0_1,
  input  [7:0] io_in_QSV_1_0,
  input  [7:0] io_in_QSV_1_1,
  input  [7:0] io_in_QSV_2_0,
  input  [7:0] io_in_QSV_2_1,
  input  [7:0] io_in_QSV_3_0,
  input  [7:0] io_in_QSV_3_1,
  input  [7:0] io_in_QSV_4_0,
  input  [7:0] io_in_QSV_4_1,
  input  [7:0] io_in_QSV_5_0,
  input  [7:0] io_in_QSV_5_1,
  input  [7:0] io_in_QSV_6_0,
  input  [7:0] io_in_QSV_6_1,
  input  [7:0] io_in_QSV_7_0,
  input  [7:0] io_in_QSV_7_1,
  input  [7:0] io_in_QSV_8_0,
  input  [7:0] io_in_QSV_8_1,
  input  [7:0] io_in_QSV_9_0,
  input  [7:0] io_in_QSV_9_1,
  input  [7:0] io_in_QSV_10_0,
  input  [7:0] io_in_QSV_10_1,
  input  [7:0] io_in_QSV_11_0,
  input  [7:0] io_in_QSV_11_1,
  input  [7:0] io_in_QSV_12_0,
  input  [7:0] io_in_QSV_12_1,
  input  [7:0] io_in_QSV_13_0,
  input  [7:0] io_in_QSV_13_1,
  input  [7:0] io_in_QSV_14_0,
  input  [7:0] io_in_QSV_14_1,
  input  [7:0] io_in_QSV_15_0,
  input  [7:0] io_in_QSV_15_1,
  input  [7:0] io_in_QSV_16_0,
  input  [7:0] io_in_QSV_16_1,
  input  [7:0] io_in_QSV_17_0,
  input  [7:0] io_in_QSV_17_1,
  input  [7:0] io_in_QSV_18_0,
  input  [7:0] io_in_QSV_18_1,
  input  [7:0] io_in_QSV_19_0,
  input  [7:0] io_in_QSV_19_1,
  input  [7:0] io_in_QSV_20_0,
  input  [7:0] io_in_QSV_20_1,
  input  [7:0] io_in_QSV_21_0,
  input  [7:0] io_in_QSV_21_1,
  input  [7:0] io_in_QSV_22_0,
  input  [7:0] io_in_QSV_22_1,
  input  [7:0] io_in_QSV_23_0,
  input  [7:0] io_in_QSV_23_1,
  input  [7:0] io_in_QSV_24_0,
  input  [7:0] io_in_QSV_24_1,
  input  [7:0] io_in_QSV_25_0,
  input  [7:0] io_in_QSV_25_1,
  input  [7:0] io_in_QSV_26_0,
  input  [7:0] io_in_QSV_26_1,
  input  [7:0] io_in_QSV_27_0,
  input  [7:0] io_in_QSV_27_1,
  input  [7:0] io_in_QSV_28_0,
  input  [7:0] io_in_QSV_28_1,
  input  [7:0] io_in_QSV_29_0,
  input  [7:0] io_in_QSV_29_1,
  input  [7:0] io_in_QSV_30_0,
  input  [7:0] io_in_QSV_30_1,
  input  [7:0] io_in_QSV_31_0,
  input  [7:0] io_in_QSV_31_1,
  input        io_in_valid,
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
  output       io_out_valid
);

  // Macro helper definitions to avoid huge repeating code blocks where possible,
  // but standard SystemVerilog structure is cleaner. We will declare intermediate wires.

  `define DEF_STAGE_WIRES(prefix) \
    wire [7:0] prefix``QSV_0_0; wire [7:0] prefix``QSV_0_1; \
    wire [7:0] prefix``QSV_1_0; wire [7:0] prefix``QSV_1_1; \
    wire [7:0] prefix``QSV_2_0; wire [7:0] prefix``QSV_2_1; \
    wire [7:0] prefix``QSV_3_0; wire [7:0] prefix``QSV_3_1; \
    wire [7:0] prefix``QSV_4_0; wire [7:0] prefix``QSV_4_1; \
    wire [7:0] prefix``QSV_5_0; wire [7:0] prefix``QSV_5_1; \
    wire [7:0] prefix``QSV_6_0; wire [7:0] prefix``QSV_6_1; \
    wire [7:0] prefix``QSV_7_0; wire [7:0] prefix``QSV_7_1; \
    wire [7:0] prefix``QSV_8_0; wire [7:0] prefix``QSV_8_1; \
    wire [7:0] prefix``QSV_9_0; wire [7:0] prefix``QSV_9_1; \
    wire [7:0] prefix``QSV_10_0; wire [7:0] prefix``QSV_10_1; \
    wire [7:0] prefix``QSV_11_0; wire [7:0] prefix``QSV_11_1; \
    wire [7:0] prefix``QSV_12_0; wire [7:0] prefix``QSV_12_1; \
    wire [7:0] prefix``QSV_13_0; wire [7:0] prefix``QSV_13_1; \
    wire [7:0] prefix``QSV_14_0; wire [7:0] prefix``QSV_14_1; \
    wire [7:0] prefix``QSV_15_0; wire [7:0] prefix``QSV_15_1; \
    wire [7:0] prefix``QSV_16_0; wire [7:0] prefix``QSV_16_1; \
    wire [7:0] prefix``QSV_17_0; wire [7:0] prefix``QSV_17_1; \
    wire [7:0] prefix``QSV_18_0; wire [7:0] prefix``QSV_18_1; \
    wire [7:0] prefix``QSV_19_0; wire [7:0] prefix``QSV_19_1; \
    wire [7:0] prefix``QSV_20_0; wire [7:0] prefix``QSV_20_1; \
    wire [7:0] prefix``QSV_21_0; wire [7:0] prefix``QSV_21_1; \
    wire [7:0] prefix``QSV_22_0; wire [7:0] prefix``QSV_22_1; \
    wire [7:0] prefix``QSV_23_0; wire [7:0] prefix``QSV_23_1; \
    wire [7:0] prefix``QSV_24_0; wire [7:0] prefix``QSV_24_1; \
    wire [7:0] prefix``QSV_25_0; wire [7:0] prefix``QSV_25_1; \
    wire [7:0] prefix``QSV_26_0; wire [7:0] prefix``QSV_26_1; \
    wire [7:0] prefix``QSV_27_0; wire [7:0] prefix``QSV_27_1; \
    wire [7:0] prefix``QSV_28_0; wire [7:0] prefix``QSV_28_1; \
    wire [7:0] prefix``QSV_29_0; wire [7:0] prefix``QSV_29_1; \
    wire [7:0] prefix``QSV_30_0; wire [7:0] prefix``QSV_30_1; \
    wire [7:0] prefix``QSV_31_0; wire [7:0] prefix``QSV_31_1; \
    wire prefix``valid;

  `DEF_STAGE_WIRES(_m_io_out_)
  `DEF_STAGE_WIRES(_m_1_io_out_)
  `DEF_STAGE_WIRES(_m_2_io_out_)
  `DEF_STAGE_WIRES(_m_3_io_out_)
  `DEF_STAGE_WIRES(_m_4_io_out_)
  `DEF_STAGE_WIRES(_m_5_io_out_)
  `DEF_STAGE_WIRES(_m_6_io_out_)
  `DEF_STAGE_WIRES(_m_7_io_out_)
  `DEF_STAGE_WIRES(_m_8_io_out_)
  `DEF_STAGE_WIRES(_m_9_io_out_)
  `DEF_STAGE_WIRES(_m_10_io_out_)
  `DEF_STAGE_WIRES(_m_11_io_out_)
  `DEF_STAGE_WIRES(_m_12_io_out_)
  `DEF_STAGE_WIRES(_m_13_io_out_)
  `DEF_STAGE_WIRES(_m_14_io_out_)

  `define CONNECT_STAGE(inst_name, in_pref, out_pref) \
    .io_in_QSV_0_0(in_pref``QSV_0_0), .io_in_QSV_0_1(in_pref``QSV_0_1), \
    .io_in_QSV_1_0(in_pref``QSV_1_0), .io_in_QSV_1_1(in_pref``QSV_1_1), \
    .io_in_QSV_2_0(in_pref``QSV_2_0), .io_in_QSV_2_1(in_pref``QSV_2_1), \
    .io_in_QSV_3_0(in_pref``QSV_3_0), .io_in_QSV_3_1(in_pref``QSV_3_1), \
    .io_in_QSV_4_0(in_pref``QSV_4_0), .io_in_QSV_4_1(in_pref``QSV_4_1), \
    .io_in_QSV_5_0(in_pref``QSV_5_0), .io_in_QSV_5_1(in_pref``QSV_5_1), \
    .io_in_QSV_6_0(in_pref``QSV_6_0), .io_in_QSV_6_1(in_pref``QSV_6_1), \
    .io_in_QSV_7_0(in_pref``QSV_7_0), .io_in_QSV_7_1(in_pref``QSV_7_1), \
    .io_in_QSV_8_0(in_pref``QSV_8_0), .io_in_QSV_8_1(in_pref``QSV_8_1), \
    .io_in_QSV_9_0(in_pref``QSV_9_0), .io_in_QSV_9_1(in_pref``QSV_9_1), \
    .io_in_QSV_10_0(in_pref``QSV_10_0), .io_in_QSV_10_1(in_pref``QSV_10_1), \
    .io_in_QSV_11_0(in_pref``QSV_11_0), .io_in_QSV_11_1(in_pref``QSV_11_1), \
    .io_in_QSV_12_0(in_pref``QSV_12_0), .io_in_QSV_12_1(in_pref``QSV_12_1), \
    .io_in_QSV_13_0(in_pref``QSV_13_0), .io_in_QSV_13_1(in_pref``QSV_13_1), \
    .io_in_QSV_14_0(in_pref``QSV_14_0), .io_in_QSV_14_1(in_pref``QSV_14_1), \
    .io_in_QSV_15_0(in_pref``QSV_15_0), .io_in_QSV_15_1(in_pref``QSV_15_1), \
    .io_in_QSV_16_0(in_pref``QSV_16_0), .io_in_QSV_16_1(in_pref``QSV_16_1), \
    .io_in_QSV_17_0(in_pref``QSV_17_0), .io_in_QSV_17_1(in_pref``QSV_17_1), \
    .io_in_QSV_18_0(in_pref``QSV_18_0), .io_in_QSV_18_1(in_pref``QSV_18_1), \
    .io_in_QSV_19_0(in_pref``QSV_19_0), .io_in_QSV_19_1(in_pref``QSV_19_1), \
    .io_in_QSV_20_0(in_pref``QSV_20_0), .io_in_QSV_20_1(in_pref``QSV_20_1), \
    .io_in_QSV_21_0(in_pref``QSV_21_0), .io_in_QSV_21_1(in_pref``QSV_21_1), \
    .io_in_QSV_22_0(in_pref``QSV_22_0), .io_in_QSV_22_1(in_pref``QSV_22_1), \
    .io_in_QSV_23_0(in_pref``QSV_23_0), .io_in_QSV_23_1(in_pref``QSV_23_1), \
    .io_in_QSV_24_0(in_pref``QSV_24_0), .io_in_QSV_24_1(in_pref``QSV_24_1), \
    .io_in_QSV_25_0(in_pref``QSV_25_0), .io_in_QSV_25_1(in_pref``QSV_25_1), \
    .io_in_QSV_26_0(in_pref``QSV_26_0), .io_in_QSV_26_1(in_pref``QSV_26_1), \
    .io_in_QSV_27_0(in_pref``QSV_27_0), .io_in_QSV_27_1(in_pref``QSV_27_1), \
    .io_in_QSV_28_0(in_pref``QSV_28_0), .io_in_QSV_28_1(in_pref``QSV_28_1), \
    .io_in_QSV_29_0(in_pref``QSV_29_0), .io_in_QSV_29_1(in_pref``QSV_29_1), \
    .io_in_QSV_30_0(in_pref``QSV_30_0), .io_in_QSV_30_1(in_pref``QSV_30_1), \
    .io_in_QSV_31_0(in_pref``QSV_31_0), .io_in_QSV_31_1(in_pref``QSV_31_1), \
    .io_in_valid(in_pref``valid), \
    .io_out_QSV_0_0(out_pref``QSV_0_0), .io_out_QSV_0_1(out_pref``QSV_0_1), \
    .io_out_QSV_1_0(out_pref``QSV_1_0), .io_out_QSV_1_1(out_pref``QSV_1_1), \
    .io_out_QSV_2_0(out_pref``QSV_2_0), .io_out_QSV_2_1(out_pref``QSV_2_1), \
    .io_out_QSV_3_0(out_pref``QSV_3_0), .io_out_QSV_3_1(out_pref``QSV_3_1), \
    .io_out_QSV_4_0(out_pref``QSV_4_0), .io_out_QSV_4_1(out_pref``QSV_4_1), \
    .io_out_QSV_5_0(out_pref``QSV_5_0), .io_out_QSV_5_1(out_pref``QSV_5_1), \
    .io_out_QSV_6_0(out_pref``QSV_6_0), .io_out_QSV_6_1(out_pref``QSV_6_1), \
    .io_out_QSV_7_0(out_pref``QSV_7_0), .io_out_QSV_7_1(out_pref``QSV_7_1), \
    .io_out_QSV_8_0(out_pref``QSV_8_0), .io_out_QSV_8_1(out_pref``QSV_8_1), \
    .io_out_QSV_9_0(out_pref``QSV_9_0), .io_out_QSV_9_1(out_pref``QSV_9_1), \
    .io_out_QSV_10_0(out_pref``QSV_10_0), .io_out_QSV_10_1(out_pref``QSV_10_1), \
    .io_out_QSV_11_0(out_pref``QSV_11_0), .io_out_QSV_11_1(out_pref``QSV_11_1), \
    .io_out_QSV_12_0(out_pref``QSV_12_0), .io_out_QSV_12_1(out_pref``QSV_12_1), \
    .io_out_QSV_13_0(out_pref``QSV_13_0), .io_out_QSV_13_1(out_pref``QSV_13_1), \
    .io_out_QSV_14_0(out_pref``QSV_14_0), .io_out_QSV_14_1(out_pref``QSV_14_1), \
    .io_out_QSV_15_0(out_pref``QSV_15_0), .io_out_QSV_15_1(out_pref``QSV_15_1), \
    .io_out_QSV_16_0(out_pref``QSV_16_0), .io_out_QSV_16_1(out_pref``QSV_16_1), \
    .io_out_QSV_17_0(out_pref``QSV_17_0), .io_out_QSV_17_1(out_pref``QSV_17_1), \
    .io_out_QSV_18_0(out_pref``QSV_18_0), .io_out_QSV_18_1(out_pref``QSV_18_1), \
    .io_out_QSV_19_0(out_pref``QSV_19_0), .io_out_QSV_19_1(out_pref``QSV_19_1), \
    .io_out_QSV_20_0(out_pref``QSV_20_0), .io_out_QSV_20_1(out_pref``QSV_20_1), \
    .io_out_QSV_21_0(out_pref``QSV_21_0), .io_out_QSV_21_1(out_pref``QSV_21_1), \
    .io_out_QSV_22_0(out_pref``QSV_22_0), .io_out_QSV_22_1(out_pref``QSV_22_1), \
    .io_out_QSV_23_0(out_pref``QSV_23_0), .io_out_QSV_23_1(out_pref``QSV_23_1), \
    .io_out_QSV_24_0(out_pref``QSV_24_0), .io_out_QSV_24_1(out_pref``QSV_24_1), \
    .io_out_QSV_25_0(out_pref``QSV_25_0), .io_out_QSV_25_1(out_pref``QSV_25_1), \
    .io_out_QSV_26_0(out_pref``QSV_26_0), .io_out_QSV_26_1(out_pref``QSV_26_1), \
    .io_out_QSV_27_0(out_pref``QSV_27_0), .io_out_QSV_27_1(out_pref``QSV_27_1), \
    .io_out_QSV_28_0(out_pref``QSV_28_0), .io_out_QSV_28_1(out_pref``QSV_28_1), \
    .io_out_QSV_29_0(out_pref``QSV_29_0), .io_out_QSV_29_1(out_pref``QSV_29_1), \
    .io_out_QSV_30_0(out_pref``QSV_30_0), .io_out_QSV_30_1(out_pref``QSV_30_1), \
    .io_out_QSV_31_0(out_pref``QSV_31_0), .io_out_QSV_31_1(out_pref``QSV_31_1), \
    .io_out_valid(out_pref``valid)

  // Stage 0: H on qubit 0 (m)
  HGate5QubitVector8bit m (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m, io_in_, _m_io_out_)
  );

  // Stage 1: CompatiblePerm (m_1)
  CompatiblePerm m_1 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_1, _m_io_out_, _m_1_io_out_)
  );

  // Stage 2: CX on 0,1 (m_2)
  CNGate5QubitVector8bit m_2 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_2, _m_1_io_out_, _m_2_io_out_)
  );

  // Stage 3: CompatiblePerm_1 (m_3)
  CompatiblePerm_1 m_3 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_3, _m_2_io_out_, _m_3_io_out_)
  );

  // Stage 4: CompatiblePerm_2 (m_4)
  CompatiblePerm_2 m_4 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_4, _m_3_io_out_, _m_4_io_out_)
  );

  // Stage 5: CX on 1,2 (m_5)
  CNGate5QubitVector8bit m_5 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_5, _m_4_io_out_, _m_5_io_out_)
  );

  // Stage 6: CompatiblePerm_3 (m_6)
  CompatiblePerm_3 m_6 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_6, _m_5_io_out_, _m_6_io_out_)
  );

  // Stage 7: CompatiblePerm_4 (m_7)
  CompatiblePerm_4 m_7 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_7, _m_6_io_out_, _m_7_io_out_)
  );

  // Stage 8: CX on 2,3 (m_8)
  CNGate5QubitVector8bit m_8 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_8, _m_7_io_out_, _m_8_io_out_)
  );

  // Stage 9: CompatiblePerm_5 (m_9)
  CompatiblePerm_5 m_9 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_9, _m_8_io_out_, _m_9_io_out_)
  );

  // Stage 10: CompatiblePerm_6 (m_10)
  CompatiblePerm_6 m_10 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_10, _m_9_io_out_, _m_10_io_out_)
  );

  // Stage 11: CX on 3,4 (m_11)
  CNGate5QubitVector8bit m_11 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_11, _m_10_io_out_, _m_11_io_out_)
  );

  // Stage 12: CompatiblePerm_7 (m_12)
  CompatiblePerm_7 m_12 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_12, _m_11_io_out_, _m_12_io_out_)
  );

  // Stage 13: CompatiblePerm_8 (m_13)
  CompatiblePerm_8 m_13 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_13, _m_12_io_out_, _m_13_io_out_)
  );

  // Stage 14: CompatiblePerm_9 (m_14)
  CompatiblePerm_9 m_14 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_14, _m_13_io_out_, _m_14_io_out_)
  );

  // Stage 15: CompatiblePerm_10 (m_15) - final stage outputs directly to top-level
  CompatiblePerm_10 m_15 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE(m_15, _m_14_io_out_, io_out_)
  );

  `undef DEF_STAGE_WIRES
  `undef CONNECT_STAGE
endmodule
