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

    // Intermediate stage wires
    `define DECLARE_STAGE_WIRES(stage_name) \
    wire [7:0] stage_name``_QSV_0_0, stage_name``_QSV_0_1, stage_name``_QSV_1_0, stage_name``_QSV_1_1, \
               stage_name``_QSV_2_0, stage_name``_QSV_2_1, stage_name``_QSV_3_0, stage_name``_QSV_3_1, \
               stage_name``_QSV_4_0, stage_name``_QSV_4_1, stage_name``_QSV_5_0, stage_name``_QSV_5_1, \
               stage_name``_QSV_6_0, stage_name``_QSV_6_1, stage_name``_QSV_7_0, stage_name``_QSV_7_1, \
               stage_name``_QSV_8_0, stage_name``_QSV_8_1, stage_name``_QSV_9_0, stage_name``_QSV_9_1, \
               stage_name``_QSV_10_0, stage_name``_QSV_10_1, stage_name``_QSV_11_0, stage_name``_QSV_11_1, \
               stage_name``_QSV_12_0, stage_name``_QSV_12_1, stage_name``_QSV_13_0, stage_name``_QSV_13_1, \
               stage_name``_QSV_14_0, stage_name``_QSV_14_1, stage_name``_QSV_15_0, stage_name``_QSV_15_1, \
               stage_name``_QSV_16_0, stage_name``_QSV_16_1, stage_name``_QSV_17_0, stage_name``_QSV_17_1, \
               stage_name``_QSV_18_0, stage_name``_QSV_18_1, stage_name``_QSV_19_0, stage_name``_QSV_19_1, \
               stage_name``_QSV_20_0, stage_name``_QSV_20_1, stage_name``_QSV_21_0, stage_name``_QSV_21_1, \
               stage_name``_QSV_22_0, stage_name``_QSV_22_1, stage_name``_QSV_23_0, stage_name``_QSV_23_1, \
               stage_name``_QSV_24_0, stage_name``_QSV_24_1, stage_name``_QSV_25_0, stage_name``_QSV_25_1, \
               stage_name``_QSV_26_0, stage_name``_QSV_26_1, stage_name``_QSV_27_0, stage_name``_QSV_27_1, \
               stage_name``_QSV_28_0, stage_name``_QSV_28_1, stage_name``_QSV_29_0, stage_name``_QSV_29_1, \
               stage_name``_QSV_30_0, stage_name``_QSV_30_1, stage_name``_QSV_31_0, stage_name``_QSV_31_1; \
    wire       stage_name``_valid;

    `DECLARE_STAGE_WIRES(_m_io_out)
    `DECLARE_STAGE_WIRES(_m_1_io_out)
    `DECLARE_STAGE_WIRES(_m_2_io_out)
    `DECLARE_STAGE_WIRES(_m_3_io_out)
    `DECLARE_STAGE_WIRES(_m_4_io_out)
    `DECLARE_STAGE_WIRES(_m_5_io_out)
    `DECLARE_STAGE_WIRES(_m_6_io_out)
    `DECLARE_STAGE_WIRES(_m_7_io_out)
    `DECLARE_STAGE_WIRES(_m_8_io_out)
    `DECLARE_STAGE_WIRES(_m_9_io_out)
    `DECLARE_STAGE_WIRES(_m_10_io_out)
    `DECLARE_STAGE_WIRES(_m_11_io_out)
    `DECLARE_STAGE_WIRES(_m_12_io_out)
    `DECLARE_STAGE_WIRES(_m_13_io_out)
    `DECLARE_STAGE_WIRES(_m_14_io_out)

    `undef DECLARE_STAGE_WIRES

    `define PORT_MAP_32(prefix_in, prefix_out) \
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

    // Stage 0: HGate5QubitVector8bit (instance m, 5 cycles)
    HGate5QubitVector8bit m (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(io_in, _m_io_out)
    );

    // Stage 1: CompatiblePerm (instance m_1, 1 cycle)
    CompatiblePerm m_1 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_io_out, _m_1_io_out)
    );

    // Stage 2: CNGate5QubitVector8bit (instance m_2, 1 cycle)
    CNGate5QubitVector8bit m_2 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_1_io_out, _m_2_io_out)
    );

    // Stage 3: CompatiblePerm_1 (instance m_3, 1 cycle)
    CompatiblePerm_1 m_3 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_2_io_out, _m_3_io_out)
    );

    // Stage 4: CompatiblePerm_2 (instance m_4, 1 cycle)
    CompatiblePerm_2 m_4 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_3_io_out, _m_4_io_out)
    );

    // Stage 5: CNGate5QubitVector8bit (instance m_5, 1 cycle)
    CNGate5QubitVector8bit m_5 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_4_io_out, _m_5_io_out)
    );

    // Stage 6: CompatiblePerm_3 (instance m_6, 1 cycle)
    CompatiblePerm_3 m_6 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_5_io_out, _m_6_io_out)
    );

    // Stage 7: CompatiblePerm_4 (instance m_7, 1 cycle)
    CompatiblePerm_4 m_7 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_6_io_out, _m_7_io_out)
    );

    // Stage 8: CNGate5QubitVector8bit (instance m_8, 1 cycle)
    CNGate5QubitVector8bit m_8 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_7_io_out, _m_8_io_out)
    );

    // Stage 9: CompatiblePerm_5 (instance m_9, 1 cycle)
    CompatiblePerm_5 m_9 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_8_io_out, _m_9_io_out)
    );

    // Stage 10: CompatiblePerm_6 (instance m_10, 1 cycle)
    CompatiblePerm_6 m_10 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_9_io_out, _m_10_io_out)
    );

    // Stage 11: CNGate5QubitVector8bit (instance m_11, 1 cycle)
    CNGate5QubitVector8bit m_11 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_10_io_out, _m_11_io_out)
    );

    // Stage 12: CompatiblePerm_1 (instance m_12, 1 cycle)
    CompatiblePerm_1 m_12 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_11_io_out, _m_12_io_out)
    );

    // Stage 13: CompatiblePerm_4 (instance m_13, 1 cycle)
    CompatiblePerm_4 m_13 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_12_io_out, _m_13_io_out)
    );

    // Stage 14: CompatiblePerm_9 (instance m_14, 1 cycle)
    CompatiblePerm_9 m_14 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_13_io_out, _m_14_io_out)
    );

    // Stage 15: CompatiblePerm_10 (instance m_15, 1 cycle)
    CompatiblePerm_10 m_15 (
        .clock(clock),
        .reset(reset),
        `PORT_MAP_32(_m_14_io_out, io_out)
    );

    `undef PORT_MAP_32

endmodule
