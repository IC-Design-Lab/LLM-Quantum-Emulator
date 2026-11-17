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

    /* Stage 0 Intermediate Wires */
    wire [7:0] _m_io_out_QSV_0_0;
    wire [7:0] _m_io_out_QSV_0_1;
    wire [7:0] _m_io_out_QSV_1_0;
    wire [7:0] _m_io_out_QSV_1_1;
    wire [7:0] _m_io_out_QSV_2_0;
    wire [7:0] _m_io_out_QSV_2_1;
    wire [7:0] _m_io_out_QSV_3_0;
    wire [7:0] _m_io_out_QSV_3_1;
    wire [7:0] _m_io_out_QSV_4_0;
    wire [7:0] _m_io_out_QSV_4_1;
    wire [7:0] _m_io_out_QSV_5_0;
    wire [7:0] _m_io_out_QSV_5_1;
    wire [7:0] _m_io_out_QSV_6_0;
    wire [7:0] _m_io_out_QSV_6_1;
    wire [7:0] _m_io_out_QSV_7_0;
    wire [7:0] _m_io_out_QSV_7_1;
    wire [7:0] _m_io_out_QSV_8_0;
    wire [7:0] _m_io_out_QSV_8_1;
    wire [7:0] _m_io_out_QSV_9_0;
    wire [7:0] _m_io_out_QSV_9_1;
    wire [7:0] _m_io_out_QSV_10_0;
    wire [7:0] _m_io_out_QSV_10_1;
    wire [7:0] _m_io_out_QSV_11_0;
    wire [7:0] _m_io_out_QSV_11_1;
    wire [7:0] _m_io_out_QSV_12_0;
    wire [7:0] _m_io_out_QSV_12_1;
    wire [7:0] _m_io_out_QSV_13_0;
    wire [7:0] _m_io_out_QSV_13_1;
    wire [7:0] _m_io_out_QSV_14_0;
    wire [7:0] _m_io_out_QSV_14_1;
    wire [7:0] _m_io_out_QSV_15_0;
    wire [7:0] _m_io_out_QSV_15_1;
    wire [7:0] _m_io_out_QSV_16_0;
    wire [7:0] _m_io_out_QSV_16_1;
    wire [7:0] _m_io_out_QSV_17_0;
    wire [7:0] _m_io_out_QSV_17_1;
    wire [7:0] _m_io_out_QSV_18_0;
    wire [7:0] _m_io_out_QSV_18_1;
    wire [7:0] _m_io_out_QSV_19_0;
    wire [7:0] _m_io_out_QSV_19_1;
    wire [7:0] _m_io_out_QSV_20_0;
    wire [7:0] _m_io_out_QSV_20_1;
    wire [7:0] _m_io_out_QSV_21_0;
    wire [7:0] _m_io_out_QSV_21_1;
    wire [7:0] _m_io_out_QSV_22_0;
    wire [7:0] _m_io_out_QSV_22_1;
    wire [7:0] _m_io_out_QSV_23_0;
    wire [7:0] _m_io_out_QSV_23_1;
    wire [7:0] _m_io_out_QSV_24_0;
    wire [7:0] _m_io_out_QSV_24_1;
    wire [7:0] _m_io_out_QSV_25_0;
    wire [7:0] _m_io_out_QSV_25_1;
    wire [7:0] _m_io_out_QSV_26_0;
    wire [7:0] _m_io_out_QSV_26_1;
    wire [7:0] _m_io_out_QSV_27_0;
    wire [7:0] _m_io_out_QSV_27_1;
    wire [7:0] _m_io_out_QSV_28_0;
    wire [7:0] _m_io_out_QSV_28_1;
    wire [7:0] _m_io_out_QSV_29_0;
    wire [7:0] _m_io_out_QSV_29_1;
    wire [7:0] _m_io_out_QSV_30_0;
    wire [7:0] _m_io_out_QSV_30_1;
    wire [7:0] _m_io_out_QSV_31_0;
    wire [7:0] _m_io_out_QSV_31_1;
    wire       _m_io_out_valid;

    /* Generate Stage Wires */
    `define STAGE_WIRES(N) \
    wire [7:0] _m_``N``_io_out_QSV_0_0; \
    wire [7:0] _m_``N``_io_out_QSV_0_1; \
    wire [7:0] _m_``N``_io_out_QSV_1_0; \
    wire [7:0] _m_``N``_io_out_QSV_1_1; \
    wire [7:0] _m_``N``_io_out_QSV_2_0; \
    wire [7:0] _m_``N``_io_out_QSV_2_1; \
    wire [7:0] _m_``N``_io_out_QSV_3_0; \
    wire [7:0] _m_``N``_io_out_QSV_3_1; \
    wire [7:0] _m_``N``_io_out_QSV_4_0; \
    wire [7:0] _m_``N``_io_out_QSV_4_1; \
    wire [7:0] _m_``N``_io_out_QSV_5_0; \
    wire [7:0] _m_``N``_io_out_QSV_5_1; \
    wire [7:0] _m_``N``_io_out_QSV_6_0; \
    wire [7:0] _m_``N``_io_out_QSV_6_1; \
    wire [7:0] _m_``N``_io_out_QSV_7_0; \
    wire [7:0] _m_``N``_io_out_QSV_7_1; \
    wire [7:0] _m_``N``_io_out_QSV_8_0; \
    wire [7:0] _m_``N``_io_out_QSV_8_1; \
    wire [7:0] _m_``N``_io_out_QSV_9_0; \
    wire [7:0] _m_``N``_io_out_QSV_9_1; \
    wire [7:0] _m_``N``_io_out_QSV_10_0; \
    wire [7:0] _m_``N``_io_out_QSV_10_1; \
    wire [7:0] _m_``N``_io_out_QSV_11_0; \
    wire [7:0] _m_``N``_io_out_QSV_11_1; \
    wire [7:0] _m_``N``_io_out_QSV_12_0; \
    wire [7:0] _m_``N``_io_out_QSV_12_1; \
    wire [7:0] _m_``N``_io_out_QSV_13_0; \
    wire [7:0] _m_``N``_io_out_QSV_13_1; \
    wire [7:0] _m_``N``_io_out_QSV_14_0; \
    wire [7:0] _m_``N``_io_out_QSV_14_1; \
    wire [7:0] _m_``N``_io_out_QSV_15_0; \
    wire [7:0] _m_``N``_io_out_QSV_15_1; \
    wire [7:0] _m_``N``_io_out_QSV_16_0; \
    wire [7:0] _m_``N``_io_out_QSV_16_1; \
    wire [7:0] _m_``N``_io_out_QSV_17_0; \
    wire [7:0] _m_``N``_io_out_QSV_17_1; \
    wire [7:0] _m_``N``_io_out_QSV_18_0; \
    wire [7:0] _m_``N``_io_out_QSV_18_1; \
    wire [7:0] _m_``N``_io_out_QSV_19_0; \
    wire [7:0] _m_``N``_io_out_QSV_19_1; \
    wire [7:0] _m_``N``_io_out_QSV_20_0; \
    wire [7:0] _m_``N``_io_out_QSV_20_1; \
    wire [7:0] _m_``N``_io_out_QSV_21_0; \
    wire [7:0] _m_``N``_io_out_QSV_21_1; \
    wire [7:0] _m_``N``_io_out_QSV_22_0; \
    wire [7:0] _m_``N``_io_out_QSV_22_1; \
    wire [7:0] _m_``N``_io_out_QSV_23_0; \
    wire [7:0] _m_``N``_io_out_QSV_23_1; \
    wire [7:0] _m_``N``_io_out_QSV_24_0; \
    wire [7:0] _m_``N``_io_out_QSV_24_1; \
    wire [7:0] _m_``N``_io_out_QSV_25_0; \
    wire [7:0] _m_``N``_io_out_QSV_25_1; \
    wire [7:0] _m_``N``_io_out_QSV_26_0; \
    wire [7:0] _m_``N``_io_out_QSV_26_1; \
    wire [7:0] _m_``N``_io_out_QSV_27_0; \
    wire [7:0] _m_``N``_io_out_QSV_27_1; \
    wire [7:0] _m_``N``_io_out_QSV_28_0; \
    wire [7:0] _m_``N``_io_out_QSV_28_1; \
    wire [7:0] _m_``N``_io_out_QSV_29_0; \
    wire [7:0] _m_``N``_io_out_QSV_29_1; \
    wire [7:0] _m_``N``_io_out_QSV_30_0; \
    wire [7:0] _m_``N``_io_out_QSV_30_1; \
    wire [7:0] _m_``N``_io_out_QSV_31_0; \
    wire [7:0] _m_``N``_io_out_QSV_31_1; \
    wire       _m_``N``_io_out_valid;

    `STAGE_WIRES(1)
    `STAGE_WIRES(2)
    `STAGE_WIRES(3)
    `STAGE_WIRES(4)
    `STAGE_WIRES(5)
    `STAGE_WIRES(6)
    `STAGE_WIRES(7)
    `STAGE_WIRES(8)
    `STAGE_WIRES(9)
    `STAGE_WIRES(10)
    `STAGE_WIRES(11)
    `STAGE_WIRES(12)
    `STAGE_WIRES(13)
    `STAGE_WIRES(14)

    /* Stage 0: HGate5QubitVector8bit (targets qubit 0, no permutation) */
    HGate5QubitVector8bit m (
        .clock(clock), .reset(reset),
        .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
        .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
        .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_in_QSV_4_0(io_in_QSV_4_0), .io_in_QSV_4_1(io_in_QSV_4_1),
        .io_in_QSV_5_0(io_in_QSV_5_0), .io_in_QSV_5_1(io_in_QSV_5_1),
        .io_in_QSV_6_0(io_in_QSV_6_0), .io_in_QSV_6_1(io_in_QSV_6_1),
        .io_in_QSV_7_0(io_in_QSV_7_0), .io_in_QSV_7_1(io_in_QSV_7_1),
        .io_in_QSV_8_0(io_in_QSV_8_0), .io_in_QSV_8_1(io_in_QSV_8_1),
        .io_in_QSV_9_0(io_in_QSV_9_0), .io_in_QSV_9_1(io_in_QSV_9_1),
        .io_in_QSV_10_0(io_in_QSV_10_0), .io_in_QSV_10_1(io_in_QSV_10_1),
        .io_in_QSV_11_0(io_in_QSV_11_0), .io_in_QSV_11_1(io_in_QSV_11_1),
        .io_in_QSV_12_0(io_in_QSV_12_0), .io_in_QSV_12_1(io_in_QSV_12_1),
        .io_in_QSV_13_0(io_in_QSV_13_0), .io_in_QSV_13_1(io_in_QSV_13_1),
        .io_in_QSV_14_0(io_in_QSV_14_0), .io_in_QSV_14_1(io_in_QSV_14_1),
        .io_in_QSV_15_0(io_in_QSV_15_0), .io_in_QSV_15_1(io_in_QSV_15_1),
        .io_in_QSV_16_0(io_in_QSV_16_0), .io_in_QSV_16_1(io_in_QSV_16_1),
        .io_in_QSV_17_0(io_in_QSV_17_0), .io_in_QSV_17_1(io_in_QSV_17_1),
        .io_in_QSV_18_0(io_in_QSV_18_0), .io_in_QSV_18_1(io_in_QSV_18_1),
        .io_in_QSV_19_0(io_in_QSV_19_0), .io_in_QSV_19_1(io_in_QSV_19_1),
        .io_in_QSV_20_0(io_in_QSV_20_0), .io_in_QSV_20_1(io_in_QSV_20_1),
        .io_in_QSV_21_0(io_in_QSV_21_0), .io_in_QSV_21_1(io_in_QSV_21_1),
        .io_in_QSV_22_0(io_in_QSV_22_0), .io_in_QSV_22_1(io_in_QSV_22_1),
        .io_in_QSV_23_0(io_in_QSV_23_0), .io_in_QSV_23_1(io_in_QSV_23_1),
        .io_in_QSV_24_0(io_in_QSV_24_0), .io_in_QSV_24_1(io_in_QSV_24_1),
        .io_in_QSV_25_0(io_in_QSV_25_0), .io_in_QSV_25_1(io_in_QSV_25_1),
        .io_in_QSV_26_0(io_in_QSV_26_0), .io_in_QSV_26_1(io_in_QSV_26_1),
        .io_in_QSV_27_0(io_in_QSV_27_0), .io_in_QSV_27_1(io_in_QSV_27_1),
        .io_in_QSV_28_0(io_in_QSV_28_0), .io_in_QSV_28_1(io_in_QSV_28_1),
        .io_in_QSV_29_0(io_in_QSV_29_0), .io_in_QSV_29_1(io_in_QSV_29_1),
        .io_in_QSV_30_0(io_in_QSV_30_0), .io_in_QSV_30_1(io_in_QSV_30_1),
        .io_in_QSV_31_0(io_in_QSV_31_0), .io_in_QSV_31_1(io_in_QSV_31_1),
        .io_in_valid(io_in_valid),
        .io_out_QSV_0_0(_m_io_out_QSV_0_0), .io_out_QSV_0_1(_m_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_io_out_QSV_1_0), .io_out_QSV_1_1(_m_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_io_out_QSV_2_0), .io_out_QSV_2_1(_m_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_io_out_QSV_3_0), .io_out_QSV_3_1(_m_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_io_out_QSV_4_0), .io_out_QSV_4_1(_m_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_io_out_QSV_5_0), .io_out_QSV_5_1(_m_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_io_out_QSV_6_0), .io_out_QSV_6_1(_m_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_io_out_QSV_7_0), .io_out_QSV_7_1(_m_io_out_QSV_7_1),
        .io_out_QSV_8_0(_m_io_out_QSV_8_0), .io_out_QSV_8_1(_m_io_out_QSV_8_1),
        .io_out_QSV_9_0(_m_io_out_QSV_9_0), .io_out_QSV_9_1(_m_io_out_QSV_9_1),
        .io_out_QSV_10_0(_m_io_out_QSV_10_0), .io_out_QSV_10_1(_m_io_out_QSV_10_1),
        .io_out_QSV_11_0(_m_io_out_QSV_11_0), .io_out_QSV_11_1(_m_io_out_QSV_11_1),
        .io_out_QSV_12_0(_m_io_out_QSV_12_0), .io_out_QSV_12_1(_m_io_out_QSV_12_1),
        .io_out_QSV_13_0(_m_io_out_QSV_13_0), .io_out_QSV_13_1(_m_io_out_QSV_13_1),
        .io_out_QSV_14_0(_m_io_out_QSV_14_0), .io_out_QSV_14_1(_m_io_out_QSV_14_1),
        .io_out_QSV_15_0(_m_io_out_QSV_15_0), .io_out_QSV_15_1(_m_io_out_QSV_15_1),
        .io_out_QSV_16_0(_m_io_out_QSV_16_0), .io_out_QSV_16_1(_m_io_out_QSV_16_1),
        .io_out_QSV_17_0(_m_io_out_QSV_17_0), .io_out_QSV_17_1(_m_io_out_QSV_17_1),
        .io_out_QSV_18_0(_m_io_out_QSV_18_0), .io_out_QSV_18_1(_m_io_out_QSV_18_1),
        .io_out_QSV_19_0(_m_io_out_QSV_19_0), .io_out_QSV_19_1(_m_io_out_QSV_19_1),
        .io_out_QSV_20_0(_m_io_out_QSV_20_0), .io_out_QSV_20_1(_m_io_out_QSV_20_1),
        .io_out_QSV_21_0(_m_io_out_QSV_21_0), .io_out_QSV_21_1(_m_io_out_QSV_21_1),
        .io_out_QSV_22_0(_m_io_out_QSV_22_0), .io_out_QSV_22_1(_m_io_out_QSV_22_1),
        .io_out_QSV_23_0(_m_io_out_QSV_23_0), .io_out_QSV_23_1(_m_io_out_QSV_23_1),
        .io_out_QSV_24_0(_m_io_out_QSV_24_0), .io_out_QSV_24_1(_m_io_out_QSV_24_1),
        .io_out_QSV_25_0(_m_io_out_QSV_25_0), .io_out_QSV_25_1(_m_io_out_QSV_25_1),
        .io_out_QSV_26_0(_m_io_out_QSV_26_0), .io_out_QSV_26_1(_m_io_out_QSV_26_1),
        .io_out_QSV_27_0(_m_io_out_QSV_27_0), .io_out_QSV_27_1(_m_io_out_QSV_27_1),
        .io_out_QSV_28_0(_m_io_out_QSV_28_0), .io_out_QSV_28_1(_m_io_out_QSV_28_1),
        .io_out_QSV_29_0(_m_io_out_QSV_29_0), .io_out_QSV_29_1(_m_io_out_QSV_29_1),
        .io_out_QSV_30_0(_m_io_out_QSV_30_0), .io_out_QSV_30_1(_m_io_out_QSV_30_1),
        .io_out_QSV_31_0(_m_io_out_QSV_31_0), .io_out_QSV_31_1(_m_io_out_QSV_31_1),
        .io_out_valid(_m_io_out_valid)
    );

    /* Generate Stage Macro for Instantiations */
    `define STAGE_INST(GATE_TYPE, INST_NAME, IN_PRE, OUT_PRE) \
    GATE_TYPE INST_NAME ( \
        .clock(clock), .reset(reset), \
        .io_in_QSV_0_0(_m_``IN_PRE``_io_out_QSV_0_0), .io_in_QSV_0_1(_m_``IN_PRE``_io_out_QSV_0_1), \
        .io_in_QSV_1_0(_m_``IN_PRE``_io_out_QSV_1_0), .io_in_QSV_1_1(_m_``IN_PRE``_io_out_QSV_1_1), \
        .io_in_QSV_2_0(_m_``IN_PRE``_io_out_QSV_2_0), .io_in_QSV_2_1(_m_``IN_PRE``_io_out_QSV_2_1), \
        .io_in_QSV_3_0(_m_``IN_PRE``_io_out_QSV_3_0), .io_in_QSV_3_1(_m_``IN_PRE``_io_out_QSV_3_1), \
        .io_in_QSV_4_0(_m_``IN_PRE``_io_out_QSV_4_0), .io_in_QSV_4_1(_m_``IN_PRE``_io_out_QSV_4_1), \
        .io_in_QSV_5_0(_m_``IN_PRE``_io_out_QSV_5_0), .io_in_QSV_5_1(_m_``IN_PRE``_io_out_QSV_5_1), \
        .io_in_QSV_6_0(_m_``IN_PRE``_io_out_QSV_6_0), .io_in_QSV_6_1(_m_``IN_PRE``_io_out_QSV_6_1), \
        .io_in_QSV_7_0(_m_``IN_PRE``_io_out_QSV_7_0), .io_in_QSV_7_1(_m_``IN_PRE``_io_out_QSV_7_1), \
        .io_in_QSV_8_0(_m_``IN_PRE``_io_out_QSV_8_0), .io_in_QSV_8_1(_m_``IN_PRE``_io_out_QSV_8_1), \
        .io_in_QSV_9_0(_m_``IN_PRE``_io_out_QSV_9_0), .io_in_QSV_9_1(_m_``IN_PRE``_io_out_QSV_9_1), \
        .io_in_QSV_10_0(_m_``IN_PRE``_io_out_QSV_10_0), .io_in_QSV_10_1(_m_``IN_PRE``_io_out_QSV_10_1), \
        .io_in_QSV_11_0(_m_``IN_PRE``_io_out_QSV_11_0), .io_in_QSV_11_1(_m_``IN_PRE``_io_out_QSV_11_1), \
        .io_in_QSV_12_0(_m_``IN_PRE``_io_out_QSV_12_0), .io_in_QSV_12_1(_m_``IN_PRE``_io_out_QSV_12_1), \
        .io_in_QSV_13_0(_m_``IN_PRE``_io_out_QSV_13_0), .io_in_QSV_13_1(_m_``IN_PRE``_io_out_QSV_13_1), \
        .io_in_QSV_14_0(_m_``IN_PRE``_io_out_QSV_14_0), .io_in_QSV_14_1(_m_``IN_PRE``_io_out_QSV_14_1), \
        .io_in_QSV_15_0(_m_``IN_PRE``_io_out_QSV_15_0), .io_in_QSV_15_1(_m_``IN_PRE``_io_out_QSV_15_1), \
        .io_in_QSV_16_0(_m_``IN_PRE``_io_out_QSV_16_0), .io_in_QSV_16_1(_m_``IN_PRE``_io_out_QSV_16_1), \
        .io_in_QSV_17_0(_m_``IN_PRE``_io_out_QSV_17_0), .io_in_QSV_17_1(_m_``IN_PRE``_io_out_QSV_17_1), \
        .io_in_QSV_18_0(_m_``IN_PRE``_io_out_QSV_18_0), .io_in_QSV_18_1(_m_``IN_PRE``_io_out_QSV_18_1), \
        .io_in_QSV_19_0(_m_``IN_PRE``_io_out_QSV_19_0), .io_in_QSV_19_1(_m_``IN_PRE``_io_out_QSV_19_1), \
        .io_in_QSV_20_0(_m_``IN_PRE``_io_out_QSV_20_0), .io_in_QSV_20_1(_m_``IN_PRE``_io_out_QSV_20_1), \
        .io_in_QSV_21_0(_m_``IN_PRE``_io_out_QSV_21_0), .io_in_QSV_21_1(_m_``IN_PRE``_io_out_QSV_21_1), \
        .io_in_QSV_22_0(_m_``IN_PRE``_io_out_QSV_22_0), .io_in_QSV_22_1(_m_``IN_PRE``_io_out_QSV_22_1), \
        .io_in_QSV_23_0(_m_``IN_PRE``_io_out_QSV_23_0), .io_in_QSV_23_1(_m_``IN_PRE``_io_out_QSV_23_1), \
        .io_in_QSV_24_0(_m_``IN_PRE``_io_out_QSV_24_0), .io_in_QSV_24_1(_m_``IN_PRE``_io_out_QSV_24_1), \
        .io_in_QSV_25_0(_m_``IN_PRE``_io_out_QSV_25_0), .io_in_QSV_25_1(_m_``IN_PRE``_io_out_QSV_25_1), \
        .io_in_QSV_26_0(_m_``IN_PRE``_io_out_QSV_26_0), .io_in_QSV_26_1(_m_``IN_PRE``_io_out_QSV_26_1), \
        .io_in_QSV_27_0(_m_``IN_PRE``_io_out_QSV_27_0), .io_in_QSV_27_1(_m_``IN_PRE``_io_out_QSV_27_1), \
        .io_in_QSV_28_0(_m_``IN_PRE``_io_out_QSV_28_0), .io_in_QSV_28_1(_m_``IN_PRE``_io_out_QSV_28_1), \
        .io_in_QSV_29_0(_m_``IN_PRE``_io_out_QSV_29_0), .io_in_QSV_29_1(_m_``IN_PRE``_io_out_QSV_29_1), \
        .io_in_QSV_30_0(_m_``IN_PRE``_io_out_QSV_30_0), .io_in_QSV_30_1(_m_``IN_PRE``_io_out_QSV_30_1), \
        .io_in_QSV_31_0(_m_``IN_PRE``_io_out_QSV_31_0), .io_in_QSV_31_1(_m_``IN_PRE``_io_out_QSV_31_1), \
        .io_in_valid(_m_``IN_PRE``_io_out_valid), \
        .io_out_QSV_0_0(_m_``OUT_PRE``_io_out_QSV_0_0), .io_out_QSV_0_1(_m_``OUT_PRE``_io_out_QSV_0_1), \
        .io_out_QSV_1_0(_m_``OUT_PRE``_io_out_QSV_1_0), .io_out_QSV_1_1(_m_``OUT_PRE``_io_out_QSV_1_1), \
        .io_out_QSV_2_0(_m_``OUT_PRE``_io_out_QSV_2_0), .io_out_QSV_2_1(_m_``OUT_PRE``_io_out_QSV_2_1), \
        .io_out_QSV_3_0(_m_``OUT_PRE``_io_out_QSV_3_0), .io_out_QSV_3_1(_m_``OUT_PRE``_io_out_QSV_3_1), \
        .io_out_QSV_4_0(_m_``OUT_PRE``_io_out_QSV_4_0), .io_out_QSV_4_1(_m_``OUT_PRE``_io_out_QSV_4_1), \
        .io_out_QSV_5_0(_m_``OUT_PRE``_io_out_QSV_5_0), .io_out_QSV_5_1(_m_``OUT_PRE``_io_out_QSV_5_1), \
        .io_out_QSV_6_0(_m_``OUT_PRE``_io_out_QSV_6_0), .io_out_QSV_6_1(_m_``OUT_PRE``_io_out_QSV_6_1), \
        .io_out_QSV_7_0(_m_``OUT_PRE``_io_out_QSV_7_0), .io_out_QSV_7_1(_m_``OUT_PRE``_io_out_QSV_7_1), \
        .io_out_QSV_8_0(_m_``OUT_PRE``_io_out_QSV_8_0), .io_out_QSV_8_1(_m_``OUT_PRE``_io_out_QSV_8_1), \
        .io_out_QSV_9_0(_m_``OUT_PRE``_io_out_QSV_9_0), .io_out_QSV_9_1(_m_``OUT_PRE``_io_out_QSV_9_1), \
        .io_out_QSV_10_0(_m_``OUT_PRE``_io_out_QSV_10_0), .io_out_QSV_10_1(_m_``OUT_PRE``_io_out_QSV_10_1), \
        .io_out_QSV_11_0(_m_``OUT_PRE``_io_out_QSV_11_0), .io_out_QSV_11_1(_m_``OUT_PRE``_io_out_QSV_11_1), \
        .io_out_QSV_12_0(_m_``OUT_PRE``_io_out_QSV_12_0), .io_out_QSV_12_1(_m_``OUT_PRE``_io_out_QSV_12_1), \
        .io_out_QSV_13_0(_m_``OUT_PRE``_io_out_QSV_13_0), .io_out_QSV_13_1(_m_``OUT_PRE``_io_out_QSV_13_1), \
        .io_out_QSV_14_0(_m_``OUT_PRE``_io_out_QSV_14_0), .io_out_QSV_14_1(_m_``OUT_PRE``_io_out_QSV_14_1), \
        .io_out_QSV_15_0(_m_``OUT_PRE``_io_out_QSV_15_0), .io_out_QSV_15_1(_m_``OUT_PRE``_io_out_QSV_15_1), \
        .io_out_QSV_16_0(_m_``OUT_PRE``_io_out_QSV_16_0), .io_out_QSV_16_1(_m_``OUT_PRE``_io_out_QSV_16_1), \
        .io_out_QSV_17_0(_m_``OUT_PRE``_io_out_QSV_17_0), .io_out_QSV_17_1(_m_``OUT_PRE``_io_out_QSV_17_1), \
        .io_out_QSV_18_0(_m_``OUT_PRE``_io_out_QSV_18_0), .io_out_QSV_18_1(_m_``OUT_PRE``_io_out_QSV_18_1), \
        .io_out_QSV_19_0(_m_``OUT_PRE``_io_out_QSV_19_0), .io_out_QSV_19_1(_m_``OUT_PRE``_io_out_QSV_19_1), \
        .io_out_QSV_20_0(_m_``OUT_PRE``_io_out_QSV_20_0), .io_out_QSV_20_1(_m_``OUT_PRE``_io_out_QSV_20_1), \
        .io_out_QSV_21_0(_m_``OUT_PRE``_io_out_QSV_21_0), .io_out_QSV_21_1(_m_``OUT_PRE``_io_out_QSV_21_1), \
        .io_out_QSV_22_0(_m_``OUT_PRE``_io_out_QSV_22_0), .io_out_QSV_22_1(_m_``OUT_PRE``_io_out_QSV_22_1), \
        .io_out_QSV_23_0(_m_``OUT_PRE``_io_out_QSV_23_0), .io_out_QSV_23_1(_m_``OUT_PRE``_io_out_QSV_23_1), \
        .io_out_QSV_24_0(_m_``OUT_PRE``_io_out_QSV_24_0), .io_out_QSV_24_1(_m_``OUT_PRE``_io_out_QSV_24_1), \
        .io_out_QSV_25_0(_m_``OUT_PRE``_io_out_QSV_25_0), .io_out_QSV_25_1(_m_``OUT_PRE``_io_out_QSV_25_1), \
        .io_out_QSV_26_0(_m_``OUT_PRE``_io_out_QSV_26_0), .io_out_QSV_26_1(_m_``OUT_PRE``_io_out_QSV_26_1), \
        .io_out_QSV_27_0(_m_``OUT_PRE``_io_out_QSV_27_0), .io_out_QSV_27_1(_m_``OUT_PRE``_io_out_QSV_27_1), \
        .io_out_QSV_28_0(_m_``OUT_PRE``_io_out_QSV_28_0), .io_out_QSV_28_1(_m_``OUT_PRE``_io_out_QSV_28_1), \
        .io_out_QSV_29_0(_m_``OUT_PRE``_io_out_QSV_29_0), .io_out_QSV_29_1(_m_``OUT_PRE``_io_out_QSV_29_1), \
        .io_out_QSV_30_0(_m_``OUT_PRE``_io_out_QSV_30_0), .io_out_QSV_30_1(_m_``OUT_PRE``_io_out_QSV_30_1), \
        .io_out_QSV_31_0(_m_``OUT_PRE``_io_out_QSV_31_0), .io_out_QSV_31_1(_m_``OUT_PRE``_io_out_QSV_31_1), \
        .io_out_valid(_m_``OUT_PRE``_io_out_valid) \
    );

    /* Instantiations */
    `STAGE_INST(CompatiblePerm, m_1, , 1)
    `STAGE_INST(CNGate5QubitVector8bit, m_2, 1, 2)
    `STAGE_INST(CompatiblePerm_1, m_3, 2, 3)
    `STAGE_INST(CompatiblePerm_2, m_4, 3, 4)
    `STAGE_INST(CNGate5QubitVector8bit, m_5, 4, 5)
    `STAGE_INST(CompatiblePerm_3, m_6, 5, 6)
    `STAGE_INST(CompatiblePerm_4, m_7, 6, 7)
    `STAGE_INST(CNGate5QubitVector8bit, m_8, 7, 8)
    `STAGE_INST(CompatiblePerm_5, m_9, 8, 9)
    `STAGE_INST(CompatiblePerm_6, m_10, 9, 10)
    `STAGE_INST(CNGate5QubitVector8bit, m_11, 10, 11)
    `STAGE_INST(CompatiblePerm_7, m_12, 11, 12)
    `STAGE_INST(CompatiblePerm_8, m_13, 12, 13)
    `STAGE_INST(CompatiblePerm_9, m_14, 13, 14)

    /* Final Stage: CompatiblePerm_10 (restores final amplitude ordering to outputs) */
    CompatiblePerm_10 m_15 (
        .clock(clock), .reset(reset),
        .io_in_QSV_0_0(_m_14_io_out_QSV_0_0), .io_in_QSV_0_1(_m_14_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_14_io_out_QSV_1_0), .io_in_QSV_1_1(_m_14_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_14_io_out_QSV_2_0), .io_in_QSV_2_1(_m_14_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_14_io_out_QSV_3_0), .io_in_QSV_3_1(_m_14_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_14_io_out_QSV_4_0), .io_in_QSV_4_1(_m_14_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_14_io_out_QSV_5_0), .io_in_QSV_5_1(_m_14_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_14_io_out_QSV_6_0), .io_in_QSV_6_1(_m_14_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_14_io_out_QSV_7_0), .io_in_QSV_7_1(_m_14_io_out_QSV_7_1),
        .io_in_QSV_8_0(_m_14_io_out_QSV_8_0), .io_in_QSV_8_1(_m_14_io_out_QSV_8_1),
        .io_in_QSV_9_0(_m_14_io_out_QSV_9_0), .io_in_QSV_9_1(_m_14_io_out_QSV_9_1),
        .io_in_QSV_10_0(_m_14_io_out_QSV_10_0), .io_in_QSV_10_1(_m_14_io_out_QSV_10_1),
        .io_in_QSV_11_0(_m_14_io_out_QSV_11_0), .io_in_QSV_11_1(_m_14_io_out_QSV_11_1),
        .io_in_QSV_12_0(_m_14_io_out_QSV_12_0), .io_in_QSV_12_1(_m_14_io_out_QSV_12_1),
        .io_in_QSV_13_0(_m_14_io_out_QSV_13_0), .io_in_QSV_13_1(_m_14_io_out_QSV_13_1),
        .io_in_QSV_14_0(_m_14_io_out_QSV_14_0), .io_in_QSV_14_1(_m_14_io_out_QSV_14_1),
        .io_in_QSV_15_0(_m_14_io_out_QSV_15_0), .io_in_QSV_15_1(_m_14_io_out_QSV_15_1),
        .io_in_QSV_16_0(_m_14_io_out_QSV_16_0), .io_in_QSV_16_1(_m_14_io_out_QSV_16_1),
        .io_in_QSV_17_0(_m_14_io_out_QSV_17_0), .io_in_QSV_17_1(_m_14_io_out_QSV_17_1),
        .io_in_QSV_18_0(_m_14_io_out_QSV_18_0), .io_in_QSV_18_1(_m_14_io_out_QSV_18_1),
        .io_in_QSV_19_0(_m_14_io_out_QSV_19_0), .io_in_QSV_19_1(_m_14_io_out_QSV_19_1),
        .io_in_QSV_20_0(_m_14_io_out_QSV_20_0), .io_in_QSV_20_1(_m_14_io_out_QSV_20_1),
        .io_in_QSV_21_0(_m_14_io_out_QSV_21_0), .io_in_QSV_21_1(_m_14_io_out_QSV_21_1),
        .io_in_QSV_22_0(_m_14_io_out_QSV_22_0), .io_in_QSV_22_1(_m_14_io_out_QSV_22_1),
        .io_in_QSV_23_0(_m_14_io_out_QSV_23_0), .io_in_QSV_23_1(_m_14_io_out_QSV_23_1),
        .io_in_QSV_24_0(_m_14_io_out_QSV_24_0), .io_in_QSV_24_1(_m_14_io_out_QSV_24_1),
        .io_in_QSV_25_0(_m_14_io_out_QSV_25_0), .io_in_QSV_25_1(_m_14_io_out_QSV_25_1),
        .io_in_QSV_26_0(_m_14_io_out_QSV_26_0), .io_in_QSV_26_1(_m_14_io_out_QSV_26_1),
        .io_in_QSV_27_0(_m_14_io_out_QSV_27_0), .io_in_QSV_27_1(_m_14_io_out_QSV_27_1),
        .io_in_QSV_28_0(_m_14_io_out_QSV_28_0), .io_in_QSV_28_1(_m_14_io_out_QSV_28_1),
        .io_in_QSV_29_0(_m_14_io_out_QSV_29_0), .io_in_QSV_29_1(_m_14_io_out_QSV_29_1),
        .io_in_QSV_30_0(_m_14_io_out_QSV_30_0), .io_in_QSV_30_1(_m_14_io_out_QSV_30_1),
        .io_in_QSV_31_0(_m_14_io_out_QSV_31_0), .io_in_QSV_31_1(_m_14_io_out_QSV_31_1),
        .io_in_valid(_m_14_io_out_valid),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_QSV_4_0(io_out_QSV_4_0), .io_out_QSV_4_1(io_out_QSV_4_1),
        .io_out_QSV_5_0(io_out_QSV_5_0), .io_out_QSV_5_1(io_out_QSV_5_1),
        .io_out_QSV_6_0(io_out_QSV_6_0), .io_out_QSV_6_1(io_out_QSV_6_1),
        .io_out_QSV_7_0(io_out_QSV_7_0), .io_out_QSV_7_1(io_out_QSV_7_1),
        .io_out_QSV_8_0(io_out_QSV_8_0), .io_out_QSV_8_1(io_out_QSV_8_1),
        .io_out_QSV_9_0(io_out_QSV_9_0), .io_out_QSV_9_1(io_out_QSV_9_1),
        .io_out_QSV_10_0(io_out_QSV_10_0), .io_out_QSV_10_1(io_out_QSV_10_1),
        .io_out_QSV_11_0(io_out_QSV_11_0), .io_out_QSV_11_1(io_out_QSV_11_1),
        .io_out_QSV_12_0(io_out_QSV_12_0), .io_out_QSV_12_1(io_out_QSV_12_1),
        .io_out_QSV_13_0(io_out_QSV_13_0), .io_out_QSV_13_1(io_out_QSV_13_1),
        .io_out_QSV_14_0(io_out_QSV_14_0), .io_out_QSV_14_1(io_out_QSV_14_1),
        .io_out_QSV_15_0(io_out_QSV_15_0), .io_out_QSV_15_1(io_out_QSV_15_1),
        .io_out_QSV_16_0(io_out_QSV_16_0), .io_out_QSV_16_1(io_out_QSV_16_1),
        .io_out_QSV_17_0(io_out_QSV_17_0), .io_out_QSV_17_1(io_out_QSV_17_1),
        .io_out_QSV_18_0(io_out_QSV_18_0), .io_out_QSV_18_1(io_out_QSV_18_1),
        .io_out_QSV_19_0(io_out_QSV_19_0), .io_out_QSV_19_1(io_out_QSV_19_1),
        .io_out_QSV_20_0(io_out_QSV_20_0), .io_out_QSV_20_1(io_out_QSV_20_1),
        .io_out_QSV_21_0(io_out_QSV_21_0), .io_out_QSV_21_1(io_out_QSV_21_1),
        .io_out_QSV_22_0(io_out_QSV_22_0), .io_out_QSV_22_1(io_out_QSV_22_1),
        .io_out_QSV_23_0(io_out_QSV_23_0), .io_out_QSV_23_1(io_out_QSV_23_1),
        .io_out_QSV_24_0(io_out_QSV_24_0), .io_out_QSV_24_1(io_out_QSV_24_1),
        .io_out_QSV_25_0(io_out_QSV_25_0), .io_out_QSV_25_1(io_out_QSV_25_1),
        .io_out_QSV_26_0(io_out_QSV_26_0), .io_out_QSV_26_1(io_out_QSV_26_1),
        .io_out_QSV_27_0(io_out_QSV_27_0), .io_out_QSV_27_1(io_out_QSV_27_1),
        .io_out_QSV_28_0(io_out_QSV_28_0), .io_out_QSV_28_1(io_out_QSV_28_1),
        .io_out_QSV_29_0(io_out_QSV_29_0), .io_out_QSV_29_1(io_out_QSV_29_1),
        .io_out_QSV_30_0(io_out_QSV_30_0), .io_out_QSV_30_1(io_out_QSV_30_1),
        .io_out_QSV_31_0(io_out_QSV_31_0), .io_out_QSV_31_1(io_out_QSV_31_1),
        .io_out_valid(io_out_valid)
    );

    /* Clean Macro Namespace */
    `undef STAGE_WIRES
    `undef STAGE_INST

endmodule
