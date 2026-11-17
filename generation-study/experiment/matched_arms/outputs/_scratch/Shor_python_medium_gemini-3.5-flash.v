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

  // Intermediate wires declaration
  // We have 15 intermediate pipeline stages: _m, _m_1, _m_2, ..., _m_14.
  // Each stage has 64 amplitude wires (32 components * 2) and 1 valid wire.

  `define DECLARE_STAGE_WIRES(prefix) \
    wire [7:0] prefix``_io_out_QSV_0_0, prefix``_io_out_QSV_0_1, prefix``_io_out_QSV_1_0, prefix``_io_out_QSV_1_1; \
    wire [7:0] prefix``_io_out_QSV_2_0, prefix``_io_out_QSV_2_1, prefix``_io_out_QSV_3_0, prefix``_io_out_QSV_3_1; \
    wire [7:0] prefix``_io_out_QSV_4_0, prefix``_io_out_QSV_4_1, prefix``_io_out_QSV_5_0, prefix``_io_out_QSV_5_1; \
    wire [7:0] prefix``_io_out_QSV_6_0, prefix``_io_out_QSV_6_1, prefix``_io_out_QSV_7_0, prefix``_io_out_QSV_7_1; \
    wire [7:0] prefix``_io_out_QSV_8_0, prefix``_io_out_QSV_8_1, prefix``_io_out_QSV_9_0, prefix``_io_out_QSV_9_1; \
    wire [7:0] prefix``_io_out_QSV_10_0, prefix``_io_out_QSV_10_1, prefix``_io_out_QSV_11_0, prefix``_io_out_QSV_11_1; \
    wire [7:0] prefix``_io_out_QSV_12_0, prefix``_io_out_QSV_12_1, prefix``_io_out_QSV_13_0, prefix``_io_out_QSV_13_1; \
    wire [7:0] prefix``_io_out_QSV_14_0, prefix``_io_out_QSV_14_1, prefix``_io_out_QSV_15_0, prefix``_io_out_QSV_15_1; \
    wire [7:0] prefix``_io_out_QSV_16_0, prefix``_io_out_QSV_16_1, prefix``_io_out_QSV_17_0, prefix``_io_out_QSV_17_1; \
    wire [7:0] prefix``_io_out_QSV_18_0, prefix``_io_out_QSV_18_1, prefix``_io_out_QSV_19_0, prefix``_io_out_QSV_19_1; \
    wire [7:0] prefix``_io_out_QSV_20_0, prefix``_io_out_QSV_20_1, prefix``_io_out_QSV_21_0, prefix``_io_out_QSV_21_1; \
    wire [7:0] prefix``_io_out_QSV_22_0, prefix``_io_out_QSV_22_1, prefix``_io_out_QSV_23_0, prefix``_io_out_QSV_23_1; \
    wire [7:0] prefix``_io_out_QSV_24_0, prefix``_io_out_QSV_24_1, prefix``_io_out_QSV_25_0, prefix``_io_out_QSV_25_1; \
    wire [7:0] prefix``_io_out_QSV_26_0, prefix``_io_out_QSV_26_1, prefix``_io_out_QSV_27_0, prefix``_io_out_QSV_27_1; \
    wire [7:0] prefix``_io_out_QSV_28_0, prefix``_io_out_QSV_28_1, prefix``_io_out_QSV_29_0, prefix``_io_out_QSV_29_1; \
    wire [7:0] prefix``_io_out_QSV_30_0, prefix``_io_out_QSV_30_1, prefix``_io_out_QSV_31_0, prefix``_io_out_QSV_31_1; \
    wire       prefix``_io_out_valid;

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

  `undef DECLARE_STAGE_WIRES

  // Macro to simplify instantiating QSV connections
  `define CONNECT_QSV_PORTS(prefix_in, prefix_out) \
    .io_in_QSV_0_0(prefix_in``QSV_0_0), .io_in_QSV_0_1(prefix_in``QSV_0_1), \
    .io_in_QSV_1_0(prefix_in``QSV_1_0), .io_in_QSV_1_1(prefix_in``QSV_1_1), \
    .io_in_QSV_2_0(prefix_in``QSV_2_0), .io_in_QSV_2_1(prefix_in``QSV_2_1), \
    .io_in_QSV_3_0(prefix_in``QSV_3_0), .io_in_QSV_3_1(prefix_in``QSV_3_1), \
    .io_in_QSV_4_0(prefix_in``QSV_4_0), .io_in_QSV_4_1(prefix_in``QSV_4_1), \
    .io_in_QSV_5_0(prefix_in``QSV_5_0), .io_in_QSV_5_1(prefix_in``QSV_5_1), \
    .io_in_QSV_6_0(prefix_in``QSV_6_0), .io_in_QSV_6_1(prefix_in``QSV_6_1), \
    .io_in_QSV_7_0(prefix_in``QSV_7_0), .io_in_QSV_7_1(prefix_in``QSV_7_1), \
    .io_in_QSV_8_0(prefix_in``QSV_8_0), .io_in_QSV_8_1(prefix_in``QSV_8_1), \
    .io_in_QSV_9_0(prefix_in``QSV_9_0), .io_in_QSV_9_1(prefix_in``QSV_9_1), \
    .io_in_QSV_10_0(prefix_in``QSV_10_0), .io_in_QSV_10_1(prefix_in``QSV_10_1), \
    .io_in_QSV_11_0(prefix_in``QSV_11_0), .io_in_QSV_11_1(prefix_in``QSV_11_1), \
    .io_in_QSV_12_0(prefix_in``QSV_12_0), .io_in_QSV_12_1(prefix_in``QSV_12_1), \
    .io_in_QSV_13_0(prefix_in``QSV_13_0), .io_in_QSV_13_1(prefix_in``QSV_13_1), \
    .io_in_QSV_14_0(prefix_in``QSV_14_0), .io_in_QSV_14_1(prefix_in``QSV_14_1), \
    .io_in_QSV_15_0(prefix_in``QSV_15_0), .io_in_QSV_15_1(prefix_in``QSV_15_1), \
    .io_in_QSV_16_0(prefix_in``QSV_16_0), .io_in_QSV_16_1(prefix_in``QSV_16_1), \
    .io_in_QSV_17_0(prefix_in``QSV_17_0), .io_in_QSV_17_1(prefix_in``QSV_17_1), \
    .io_in_QSV_18_0(prefix_in``QSV_18_0), .io_in_QSV_18_1(prefix_in``QSV_18_1), \
    .io_in_QSV_19_0(prefix_in``QSV_19_0), .io_in_QSV_19_1(prefix_in``QSV_19_1), \
    .io_in_QSV_20_0(prefix_in``QSV_20_0), .io_in_QSV_20_1(prefix_in``QSV_20_1), \
    .io_in_QSV_21_0(prefix_in``QSV_21_0), .io_in_QSV_21_1(prefix_in``QSV_21_1), \
    .io_in_QSV_22_0(prefix_in``QSV_22_0), .io_in_QSV_22_1(prefix_in``QSV_22_1), \
    .io_in_QSV_23_0(prefix_in``QSV_23_0), .io_in_QSV_23_1(prefix_in``QSV_23_1), \
    .io_in_QSV_24_0(prefix_in``QSV_24_0), .io_in_QSV_24_1(prefix_in``QSV_24_1), \
    .io_in_QSV_25_0(prefix_in``QSV_25_0), .io_in_QSV_25_1(prefix_in``QSV_25_1), \
    .io_in_QSV_26_0(prefix_in``QSV_26_0), .io_in_QSV_26_1(prefix_in``QSV_26_1), \
    .io_in_QSV_27_0(prefix_in``QSV_27_0), .io_in_QSV_27_1(prefix_in``QSV_27_1), \
    .io_in_QSV_28_0(prefix_in``QSV_28_0), .io_in_QSV_28_1(prefix_in``QSV_28_1), \
    .io_in_QSV_29_0(prefix_in``QSV_29_0), .io_in_QSV_29_1(prefix_in``QSV_29_1), \
    .io_in_QSV_30_0(prefix_in``QSV_30_0), .io_in_QSV_30_1(prefix_in``QSV_30_1), \
    .io_in_QSV_31_0(prefix_in``QSV_31_0), .io_in_QSV_31_1(prefix_in``QSV_31_1), \
    .io_in_valid(prefix_in``valid), \
    .io_out_QSV_0_0(prefix_out``QSV_0_0), .io_out_QSV_0_1(prefix_out``QSV_0_1), \
    .io_out_QSV_1_0(prefix_out``QSV_1_0), .io_out_QSV_1_1(prefix_out``QSV_1_1), \
    .io_out_QSV_2_0(prefix_out``QSV_2_0), .io_out_QSV_2_1(prefix_out``QSV_2_1), \
    .io_out_QSV_3_0(prefix_out``QSV_3_0), .io_out_QSV_3_1(prefix_out``QSV_3_1), \
    .io_out_QSV_4_0(prefix_out``QSV_4_0), .io_out_QSV_4_1(prefix_out``QSV_4_1), \
    .io_out_QSV_5_0(prefix_out``QSV_5_0), .io_out_QSV_5_1(prefix_out``QSV_5_1), \
    .io_out_QSV_6_0(prefix_out``QSV_6_0), .io_out_QSV_6_1(prefix_out``QSV_6_1), \
    .io_out_QSV_7_0(prefix_out``QSV_7_0), .io_out_QSV_7_1(prefix_out``QSV_7_1), \
    .io_out_QSV_8_0(prefix_out``QSV_8_0), .io_out_QSV_8_1(prefix_out``QSV_8_1), \
    .io_out_QSV_9_0(prefix_out``QSV_9_0), .io_out_QSV_9_1(prefix_out``QSV_9_1), \
    .io_out_QSV_10_0(prefix_out``QSV_10_0), .io_out_QSV_10_1(prefix_out``QSV_10_1), \
    .io_out_QSV_11_0(prefix_out``QSV_11_0), .io_out_QSV_11_1(prefix_out``QSV_11_1), \
    .io_out_QSV_12_0(prefix_out``QSV_12_0), .io_out_QSV_12_1(prefix_out``QSV_12_1), \
    .io_out_QSV_13_0(prefix_out``QSV_13_0), .io_out_QSV_13_1(prefix_out``QSV_13_1), \
    .io_out_QSV_14_0(prefix_out``QSV_14_0), .io_out_QSV_14_1(prefix_out``QSV_14_1), \
    .io_out_QSV_15_0(prefix_out``QSV_15_0), .io_out_QSV_15_1(prefix_out``QSV_15_1), \
    .io_out_QSV_16_0(prefix_out``QSV_16_0), .io_out_QSV_16_1(prefix_out``QSV_16_1), \
    .io_out_QSV_17_0(prefix_out``QSV_17_0), .io_out_QSV_17_1(prefix_out``QSV_17_1), \
    .io_out_QSV_18_0(prefix_out``QSV_18_0), .io_out_QSV_18_1(prefix_out``QSV_18_1), \
    .io_out_QSV_19_0(prefix_out``QSV_19_0), .io_out_QSV_19_1(prefix_out``QSV_19_1), \
    .io_out_QSV_20_0(prefix_out``QSV_20_0), .io_out_QSV_20_1(prefix_out``QSV_20_1), \
    .io_out_QSV_21_0(prefix_out``QSV_21_0), .io_out_QSV_21_1(prefix_out``QSV_21_1), \
    .io_out_QSV_22_0(prefix_out``QSV_22_0), .io_out_QSV_22_1(prefix_out``QSV_22_1), \
    .io_out_QSV_23_0(prefix_out``QSV_23_0), .io_out_QSV_23_1(prefix_out``QSV_23_1), \
    .io_out_QSV_24_0(prefix_out``QSV_24_0), .io_out_QSV_24_1(prefix_out``QSV_24_1), \
    .io_out_QSV_25_0(prefix_out``QSV_25_0), .io_out_QSV_25_1(prefix_out``QSV_25_1), \
    .io_out_QSV_26_0(prefix_out``QSV_26_0), .io_out_QSV_26_1(prefix_out``QSV_26_1), \
    .io_out_QSV_27_0(prefix_out``QSV_27_0), .io_out_QSV_27_1(prefix_out``QSV_27_1), \
    .io_out_QSV_28_0(prefix_out``QSV_28_0), .io_out_QSV_28_1(prefix_out``QSV_28_1), \
    .io_out_QSV_29_0(prefix_out``QSV_29_0), .io_out_QSV_29_1(prefix_out``QSV_29_1), \
    .io_out_QSV_30_0(prefix_out``QSV_30_0), .io_out_QSV_30_1(prefix_out``QSV_30_1), \
    .io_out_QSV_31_0(prefix_out``QSV_31_0), .io_out_QSV_31_1(prefix_out``QSV_31_1), \
    .io_out_valid(prefix_out``valid)

  // Step 0: Hadamard gate H(0) (no perm required)
  HGate5QubitVector8bit m (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(io_in_, _m_io_out_)
  );

  // Step 1: CX(0,1)
  // Permutation before CX
  CompatiblePerm m_1 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_io_out_, _m_1_io_out_)
  );

  // CNGate
  CNGate5QubitVector8bit m_2 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_1_io_out_, _m_2_io_out_)
  );

  // Permutation after CX
  CompatiblePerm_1 m_3 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_2_io_out_, _m_3_io_out_)
  );

  // Step 2: CX(1,2)
  // Permutation before CX
  CompatiblePerm_2 m_4 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_3_io_out_, _m_4_io_out_)
  );

  // CNGate
  CNGate5QubitVector8bit m_5 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_4_io_out_, _m_5_io_out_)
  );

  // Permutation after CX
  CompatiblePerm_3 m_6 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_5_io_out_, _m_6_io_out_)
  );

  // Step 3: CX(2,3)
  // Permutation before CX
  CompatiblePerm_4 m_7 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_6_io_out_, _m_7_io_out_)
  );

  // CNGate
  CNGate5QubitVector8bit m_8 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_7_io_out_, _m_8_io_out_)
  );

  // Permutation after CX
  CompatiblePerm_5 m_9 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_8_io_out_, _m_9_io_out_)
  );

  // Step 4: CX(3,4)
  // Permutation before CX
  CompatiblePerm_6 m_10 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_9_io_out_, _m_10_io_out_)
  );

  // CNGate
  CNGate5QubitVector8bit m_11 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_10_io_out_, _m_11_io_out_)
  );

  // Permutation after CX
  CompatiblePerm_7 m_12 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_11_io_out_, _m_12_io_out_)
  );

  // Restore final amplitude ordering
  CompatiblePerm_8 m_13 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_12_io_out_, _m_13_io_out_)
  );

  CompatiblePerm_9 m_14 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_13_io_out_, _m_14_io_out_)
  );

  CompatiblePerm_10 m_15 (
    .clock(clock),
    .reset(reset),
    `CONNECT_QSV_PORTS(_m_14_io_out_, io_out_)
  );

  `undef CONNECT_QSV_PORTS

endmodule
