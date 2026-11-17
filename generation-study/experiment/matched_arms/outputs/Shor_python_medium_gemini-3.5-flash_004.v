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

  // Intermediate wire definitions for all pipeline stages
  `define DECLARE_STAGE_WIRES(stage) \
    wire [7:0] _``stage``_io_out_QSV_0_0, _``stage``_io_out_QSV_0_1, _``stage``_io_out_QSV_1_0, _``stage``_io_out_QSV_1_1; \
    wire [7:0] _``stage``_io_out_QSV_2_0, _``stage``_io_out_QSV_2_1, _``stage``_io_out_QSV_3_0, _``stage``_io_out_QSV_3_1; \
    wire [7:0] _``stage``_io_out_QSV_4_0, _``stage``_io_out_QSV_4_1, _``stage``_io_out_QSV_5_0, _``stage``_io_out_QSV_5_1; \
    wire [7:0] _``stage``_io_out_QSV_6_0, _``stage``_io_out_QSV_6_1, _``stage``_io_out_QSV_7_0, _``stage``_io_out_QSV_7_1; \
    wire [7:0] _``stage``_io_out_QSV_8_0, _``stage``_io_out_QSV_8_1, _``stage``_io_out_QSV_9_0, _``stage``_io_out_QSV_9_1; \
    wire [7:0] _``stage``_io_out_QSV_10_0, _``stage``_io_out_QSV_10_1, _``stage``_io_out_QSV_11_0, _``stage``_io_out_QSV_11_1; \
    wire [7:0] _``stage``_io_out_QSV_12_0, _``stage``_io_out_QSV_12_1, _``stage``_io_out_QSV_13_0, _``stage``_io_out_QSV_13_1; \
    wire [7:0] _``stage``_io_out_QSV_14_0, _``stage``_io_out_QSV_14_1, _``stage``_io_out_QSV_15_0, _``stage``_io_out_QSV_15_1; \
    wire [7:0] _``stage``_io_out_QSV_16_0, _``stage``_io_out_QSV_16_1, _``stage``_io_out_QSV_17_0, _``stage``_io_out_QSV_17_1; \
    wire [7:0] _``stage``_io_out_QSV_18_0, _``stage``_io_out_QSV_18_1, _``stage``_io_out_QSV_19_0, _``stage``_io_out_QSV_19_1; \
    wire [7:0] _``stage``_io_out_QSV_20_0, _``stage``_io_out_QSV_20_1, _``stage``_io_out_QSV_21_0, _``stage``_io_out_QSV_21_1; \
    wire [7:0] _``stage``_io_out_QSV_22_0, _``stage``_io_out_QSV_22_1, _``stage``_io_out_QSV_23_0, _``stage``_io_out_QSV_23_1; \
    wire [7:0] _``stage``_io_out_QSV_24_0, _``stage``_io_out_QSV_24_1, _``stage``_io_out_QSV_25_0, _``stage``_io_out_QSV_25_1; \
    wire [7:0] _``stage``_io_out_QSV_26_0, _``stage``_io_out_QSV_26_1, _``stage``_io_out_QSV_27_0, _``stage``_io_out_QSV_27_1; \
    wire [7:0] _``stage``_io_out_QSV_28_0, _``stage``_io_out_QSV_28_1, _``stage``_io_out_QSV_29_0, _``stage``_io_out_QSV_29_1; \
    wire [7:0] _``stage``_io_out_QSV_30_0, _``stage``_io_out_QSV_30_1, _``stage``_io_out_QSV_31_0, _``stage``_io_out_QSV_31_1; \
    wire _``stage``_io_out_valid;

  `DECLARE_STAGE_WIRES(m0)
  `DECLARE_STAGE_WIRES(m1)
  `DECLARE_STAGE_WIRES(m2)
  `DECLARE_STAGE_WIRES(m3)
  `DECLARE_STAGE_WIRES(m4)
  `DECLARE_STAGE_WIRES(m5)
  `DECLARE_STAGE_WIRES(m6)
  `DECLARE_STAGE_WIRES(m7)
  `DECLARE_STAGE_WIRES(m8)
  `DECLARE_STAGE_WIRES(m9)
  `DECLARE_STAGE_WIRES(m10)
  `DECLARE_STAGE_WIRES(m11)
  `DECLARE_STAGE_WIRES(m12)
  `DECLARE_STAGE_WIRES(m13)
  `DECLARE_STAGE_WIRES(m14)

  `undef DECLARE_STAGE_WIRES

  `define CONNECT_STAGE_PORTS(prefix, input_source, output_dest) \
    .io_in_QSV_0_0(input_source``_QSV_0_0), .io_in_QSV_0_1(input_source``_QSV_0_1), \
    .io_in_QSV_1_0(input_source``_QSV_1_0), .io_in_QSV_1_1(input_source``_QSV_1_1), \
    .io_in_QSV_2_0(input_source``_QSV_2_0), .io_in_QSV_2_1(input_source``_QSV_2_1), \
    .io_in_QSV_3_0(input_source``_QSV_3_0), .io_in_QSV_3_1(input_source``_QSV_3_1), \
    .io_in_QSV_4_0(input_source``_QSV_4_0), .io_in_QSV_4_1(input_source``_QSV_4_1), \
    .io_in_QSV_5_0(input_source``_QSV_5_0), .io_in_QSV_5_1(input_source``_QSV_5_1), \
    .io_in_QSV_6_0(input_source``_QSV_6_0), .io_in_QSV_6_1(input_source``_QSV_6_1), \
    .io_in_QSV_7_0(input_source``_QSV_7_0), .io_in_QSV_7_1(input_source``_QSV_7_1), \
    .io_in_QSV_8_0(input_source``_QSV_8_0), .io_in_QSV_8_1(input_source``_QSV_8_1), \
    .io_in_QSV_9_0(input_source``_QSV_9_0), .io_in_QSV_9_1(input_source``_QSV_9_1), \
    .io_in_QSV_10_0(input_source``_QSV_10_0), .io_in_QSV_10_1(input_source``_QSV_10_1), \
    .io_in_QSV_11_0(input_source``_QSV_11_0), .io_in_QSV_11_1(input_source``_QSV_11_1), \
    .io_in_QSV_12_0(input_source``_QSV_12_0), .io_in_QSV_12_1(input_source``_QSV_12_1), \
    .io_in_QSV_13_0(input_source``_QSV_13_0), .io_in_QSV_13_1(input_source``_QSV_13_1), \
    .io_in_QSV_14_0(input_source``_QSV_14_0), .io_in_QSV_14_1(input_source``_QSV_14_1), \
    .io_in_QSV_15_0(input_source``_QSV_15_0), .io_in_QSV_15_1(input_source``_QSV_15_1), \
    .io_in_QSV_16_0(input_source``_QSV_16_0), .io_in_QSV_16_1(input_source``_QSV_16_1), \
    .io_in_QSV_17_0(input_source``_QSV_17_0), .io_in_QSV_17_1(input_source``_QSV_17_1), \
    .io_in_QSV_18_0(input_source``_QSV_18_0), .io_in_QSV_18_1(input_source``_QSV_18_1), \
    .io_in_QSV_19_0(input_source``_QSV_19_0), .io_in_QSV_19_1(input_source``_QSV_19_1), \
    .io_in_QSV_20_0(input_source``_QSV_20_0), .io_in_QSV_20_1(input_source``_QSV_20_1), \
    .io_in_QSV_21_0(input_source``_QSV_21_0), .io_in_QSV_21_1(input_source``_QSV_21_1), \
    .io_in_QSV_22_0(input_source``_QSV_22_0), .io_in_QSV_22_1(input_source``_QSV_22_1), \
    .io_in_QSV_23_0(input_source``_QSV_23_0), .io_in_QSV_23_1(input_source``_QSV_23_1), \
    .io_in_QSV_24_0(input_source``_QSV_24_0), .io_in_QSV_24_1(input_source``_QSV_24_1), \
    .io_in_QSV_25_0(input_source``_QSV_25_0), .io_in_QSV_25_1(input_source``_QSV_25_1), \
    .io_in_QSV_26_0(input_source``_QSV_26_0), .io_in_QSV_26_1(input_source``_QSV_26_1), \
    .io_in_QSV_27_0(input_source``_QSV_27_0), .io_in_QSV_27_1(input_source``_QSV_27_1), \
    .io_in_QSV_28_0(input_source``_QSV_28_0), .io_in_QSV_28_1(input_source``_QSV_28_1), \
    .io_in_QSV_29_0(input_source``_QSV_29_0), .io_in_QSV_29_1(input_source``_QSV_29_1), \
    .io_in_QSV_30_0(input_source``_QSV_30_0), .io_in_QSV_30_1(input_source``_QSV_30_1), \
    .io_in_QSV_31_0(input_source``_QSV_31_0), .io_in_QSV_31_1(input_source``_QSV_31_1), \
    .io_in_valid(input_source``_valid), \
    .io_out_QSV_0_0(output_dest``_QSV_0_0), .io_out_QSV_0_1(output_dest``_QSV_0_1), \
    .io_out_QSV_1_0(output_dest``_QSV_1_0), .io_out_QSV_1_1(output_dest``_QSV_1_1), \
    .io_out_QSV_2_0(output_dest``_QSV_2_0), .io_out_QSV_2_1(output_dest``_QSV_2_1), \
    .io_out_QSV_3_0(output_dest``_QSV_3_0), .io_out_QSV_3_1(output_dest``_QSV_3_1), \
    .io_out_QSV_4_0(output_dest``_QSV_4_0), .io_out_QSV_4_1(output_dest``_QSV_4_1), \
    .io_out_QSV_5_0(output_dest``_QSV_5_0), .io_out_QSV_5_1(output_dest``_QSV_5_1), \
    .io_out_QSV_6_0(output_dest``_QSV_6_0), .io_out_QSV_6_1(output_dest``_QSV_6_1), \
    .io_out_QSV_7_0(output_dest``_QSV_7_0), .io_out_QSV_7_1(output_dest``_QSV_7_1), \
    .io_out_QSV_8_0(output_dest``_QSV_8_0), .io_out_QSV_8_1(output_dest``_QSV_8_1), \
    .io_out_QSV_9_0(output_dest``_QSV_9_0), .io_out_QSV_9_1(output_dest``_QSV_9_1), \
    .io_out_QSV_10_0(output_dest``_QSV_10_0), .io_out_QSV_10_1(output_dest``_QSV_10_1), \
    .io_out_QSV_11_0(output_dest``_QSV_11_0), .io_out_QSV_11_1(output_dest``_QSV_11_1), \
    .io_out_QSV_12_0(output_dest``_QSV_12_0), .io_out_QSV_12_1(output_dest``_QSV_12_1), \
    .io_out_QSV_13_0(output_dest``_QSV_13_0), .io_out_QSV_13_1(output_dest``_QSV_13_1), \
    .io_out_QSV_14_0(output_dest``_QSV_14_0), .io_out_QSV_14_1(output_dest``_QSV_14_1), \
    .io_out_QSV_15_0(output_dest``_QSV_15_0), .io_out_QSV_15_1(output_dest``_QSV_15_1), \
    .io_out_QSV_16_0(output_dest``_QSV_16_0), .io_out_QSV_16_1(output_dest``_QSV_16_1), \
    .io_out_QSV_17_0(output_dest``_QSV_17_0), .io_out_QSV_17_1(output_dest``_QSV_17_1), \
    .io_out_QSV_18_0(output_dest``_QSV_18_0), .io_out_QSV_18_1(output_dest``_QSV_18_1), \
    .io_out_QSV_19_0(output_dest``_QSV_19_0), .io_out_QSV_19_1(output_dest``_QSV_19_1), \
    .io_out_QSV_20_0(output_dest``_QSV_20_0), .io_out_QSV_20_1(output_dest``_QSV_20_1), \
    .io_out_QSV_21_0(output_dest``_QSV_21_0), .io_out_QSV_21_1(output_dest``_QSV_21_1), \
    .io_out_QSV_22_0(output_dest``_QSV_22_0), .io_out_QSV_22_1(output_dest``_QSV_22_1), \
    .io_out_QSV_23_0(output_dest``_QSV_23_0), .io_out_QSV_23_1(output_dest``_QSV_23_1), \
    .io_out_QSV_24_0(output_dest``_QSV_24_0), .io_out_QSV_24_1(output_dest``_QSV_24_1), \
    .io_out_QSV_25_0(output_dest``_QSV_25_0), .io_out_QSV_25_1(output_dest``_QSV_25_1), \
    .io_out_QSV_26_0(output_dest``_QSV_26_0), .io_out_QSV_26_1(output_dest``_QSV_26_1), \
    .io_out_QSV_27_0(output_dest``_QSV_27_0), .io_out_QSV_27_1(output_dest``_QSV_27_1), \
    .io_out_QSV_28_0(output_dest``_QSV_28_0), .io_out_QSV_28_1(output_dest``_QSV_28_1), \
    .io_out_QSV_29_0(output_dest``_QSV_29_0), .io_out_QSV_29_1(output_dest``_QSV_29_1), \
    .io_out_QSV_30_0(output_dest``_QSV_30_0), .io_out_QSV_30_1(output_dest``_QSV_30_1), \
    .io_out_QSV_31_0(output_dest``_QSV_31_0), .io_out_QSV_31_1(output_dest``_QSV_31_1), \
    .io_out_valid(output_dest``_valid)

  // Stage 0: Hadamard gate on qubit 0 (no permutation)
  HGate5QubitVector8bit m0 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m0, io_in, _m0)
  );

  // Stage 1: CompatiblePerm (pre-CX 0,1)
  CompatiblePerm m1 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m1, _m0, _m1)
  );

  // Stage 2: CNOT on qubits 0,1
  CNGate5QubitVector8bit m2 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m2, _m1, _m2)
  );

  // Stage 3: CompatiblePerm_1 (post-CX 0,1)
  CompatiblePerm_1 m3 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m3, _m2, _m3)
  );

  // Stage 4: CompatiblePerm_2 (pre-CX 1,2)
  CompatiblePerm_2 m4 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m4, _m3, _m4)
  );

  // Stage 5: CNOT on qubits 1,2
  CNGate5QubitVector8bit m5 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m5, _m4, _m5)
  );

  // Stage 6: CompatiblePerm_3 (post-CX 1,2)
  CompatiblePerm_3 m6 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m6, _m5, _m6)
  );

  // Stage 7: CompatiblePerm_4 (pre-CX 2,3)
  CompatiblePerm_4 m7 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m7, _m6, _m7)
  );

  // Stage 8: CNOT on qubits 2,3
  CNGate5QubitVector8bit m8 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m8, _m7, _m8)
  );

  // Stage 9: CompatiblePerm_5 (post-CX 2,3)
  CompatiblePerm_5 m9 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m9, _m8, _m9)
  );

  // Stage 10: CompatiblePerm_6 (pre-CX 3,4)
  CompatiblePerm_6 m10 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m10, _m9, _m10)
  );

  // Stage 11: CNOT on qubits 3,4
  CNGate5QubitVector8bit m11 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m11, _m10, _m11)
  );

  // Stage 12: CompatiblePerm_7 (post-CX 3,4)
  CompatiblePerm_7 m12 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m12, _m11, _m12)
  );

  // Stage 13: CompatiblePerm_8 (Restore stage 1)
  CompatiblePerm_8 m13 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m13, _m12, _m13)
  );

  // Stage 14: CompatiblePerm_9 (Restore stage 2)
  CompatiblePerm_9 m14 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m14, _m13, _m14)
  );

  // Stage 15: CompatiblePerm_10 (Final restore stage)
  CompatiblePerm_10 m15 (
    .clock(clock),
    .reset(reset),
    `CONNECT_STAGE_PORTS(m15, _m14, io_out)
  );

  `undef CONNECT_STAGE_PORTS

endmodule
