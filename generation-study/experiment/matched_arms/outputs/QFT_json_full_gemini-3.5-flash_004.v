`default_nettype none

module QFT (
    input  logic        clock,
    input  logic        reset,
    input  logic [7:0]  io_in_QSV_0_0,
    input  logic [7:0]  io_in_QSV_0_1,
    input  logic [7:0]  io_in_QSV_1_0,
    input  logic [7:0]  io_in_QSV_1_1,
    input  logic [7:0]  io_in_QSV_2_0,
    input  logic [7:0]  io_in_QSV_2_1,
    input  logic [7:0]  io_in_QSV_3_0,
    input  logic [7:0]  io_in_QSV_3_1,
    input  logic [7:0]  io_in_QSV_4_0,
    input  logic [7:0]  io_in_QSV_4_1,
    input  logic [7:0]  io_in_QSV_5_0,
    input  logic [7:0]  io_in_QSV_5_1,
    input  logic [7:0]  io_in_QSV_6_0,
    input  logic [7:0]  io_in_QSV_6_1,
    input  logic [7:0]  io_in_QSV_7_0,
    input  logic [7:0]  io_in_QSV_7_1,
    input  logic        io_in_valid,
    output logic [7:0]  io_out_QSV_0_0,
    output logic [7:0]  io_out_QSV_0_1,
    output logic [7:0]  io_out_QSV_1_0,
    output logic [7:0]  io_out_QSV_1_1,
    output logic [7:0]  io_out_QSV_2_0,
    output logic [7:0]  io_out_QSV_2_1,
    output logic [7:0]  io_out_QSV_3_0,
    output logic [7:0]  io_out_QSV_3_1,
    output logic [7:0]  io_out_QSV_4_0,
    output logic [7:0]  io_out_QSV_4_1,
    output logic [7:0]  io_out_QSV_5_0,
    output logic [7:0]  io_out_QSV_5_1,
    output logic [7:0]  io_out_QSV_6_0,
    output logic [7:0]  io_out_QSV_6_1,
    output logic [7:0]  io_out_QSV_7_0,
    output logic [7:0]  io_out_QSV_7_1,
    output logic        io_out_valid
);

    // Intermediate signals
    logic [7:0] _m_io_out_QSV_0_0, _m_io_out_QSV_0_1, _m_io_out_QSV_1_0, _m_io_out_QSV_1_1;
    logic [7:0] _m_io_out_QSV_2_0, _m_io_out_QSV_2_1, _m_io_out_QSV_3_0, _m_io_out_QSV_3_1;
    logic [7:0] _m_io_out_QSV_4_0, _m_io_out_QSV_4_1, _m_io_out_QSV_5_0, _m_io_out_QSV_5_1;
    logic [7:0] _m_io_out_QSV_6_0, _m_io_out_QSV_6_1, _m_io_out_QSV_7_0, _m_io_out_QSV_7_1;
    logic       _m_io_out_valid;

    logic [7:0] _m_1_io_out_QSV_0_0, _m_1_io_out_QSV_0_1, _m_1_io_out_QSV_1_0, _m_1_io_out_QSV_1_1;
    logic [7:0] _m_1_io_out_QSV_2_0, _m_1_io_out_QSV_2_1, _m_1_io_out_QSV_3_0, _m_1_io_out_QSV_3_1;
    logic [7:0] _m_1_io_out_QSV_4_0, _m_1_io_out_QSV_4_1, _m_1_io_out_QSV_5_0, _m_1_io_out_QSV_5_1;
    logic [7:0] _m_1_io_out_QSV_6_0, _m_1_io_out_QSV_6_1, _m_1_io_out_QSV_7_0, _m_1_io_out_QSV_7_1;
    logic       _m_1_io_out_valid;

    logic [7:0] _m_2_io_out_QSV_0_0, _m_2_io_out_QSV_0_1, _m_2_io_out_QSV_1_0, _m_2_io_out_QSV_1_1;
    logic [7:0] _m_2_io_out_QSV_2_0, _m_2_io_out_QSV_2_1, _m_2_io_out_QSV_3_0, _m_2_io_out_QSV_3_1;
    logic [7:0] _m_2_io_out_QSV_4_0, _m_2_io_out_QSV_4_1, _m_2_io_out_QSV_5_0, _m_2_io_out_QSV_5_1;
    logic [7:0] _m_2_io_out_QSV_6_0, _m_2_io_out_QSV_6_1, _m_2_io_out_QSV_7_0, _m_2_io_out_QSV_7_1;
    logic       _m_2_io_out_valid;

    logic [7:0] _m_3_io_out_QSV_0_0, _m_3_io_out_QSV_0_1, _m_3_io_out_QSV_1_0, _m_3_io_out_QSV_1_1;
    logic [7:0] _m_3_io_out_QSV_2_0, _m_3_io_out_QSV_2_1, _m_3_io_out_QSV_3_0, _m_3_io_out_QSV_3_1;
    logic [7:0] _m_3_io_out_QSV_4_0, _m_3_io_out_QSV_4_1, _m_3_io_out_QSV_5_0, _m_3_io_out_QSV_5_1;
    logic [7:0] _m_3_io_out_QSV_6_0, _m_3_io_out_QSV_6_1, _m_3_io_out_QSV_7_0, _m_3_io_out_QSV_7_1;
    logic       _m_3_io_out_valid;

    logic [7:0] _m_4_io_out_QSV_0_0, _m_4_io_out_QSV_0_1, _m_4_io_out_QSV_1_0, _m_4_io_out_QSV_1_1;
    logic [7:0] _m_4_io_out_QSV_2_0, _m_4_io_out_QSV_2_1, _m_4_io_out_QSV_3_0, _m_4_io_out_QSV_3_1;
    logic [7:0] _m_4_io_out_QSV_4_0, _m_4_io_out_QSV_4_1, _m_4_io_out_QSV_5_0, _m_4_io_out_QSV_5_1;
    logic [7:0] _m_4_io_out_QSV_6_0, _m_4_io_out_QSV_6_1, _m_4_io_out_QSV_7_0, _m_4_io_out_QSV_7_1;
    logic       _m_4_io_out_valid;

    logic [7:0] _m_5_io_out_QSV_0_0, _m_5_io_out_QSV_0_1, _m_5_io_out_QSV_1_0, _m_5_io_out_QSV_1_1;
    logic [7:0] _m_5_io_out_QSV_2_0, _m_5_io_out_QSV_2_1, _m_5_io_out_QSV_3_0, _m_5_io_out_QSV_3_1;
    logic [7:0] _m_5_io_out_QSV_4_0, _m_5_io_out_QSV_4_1, _m_5_io_out_QSV_5_0, _m_5_io_out_QSV_5_1;
    logic [7:0] _m_5_io_out_QSV_6_0, _m_5_io_out_QSV_6_1, _m_5_io_out_QSV_7_0, _m_5_io_out_QSV_7_1;
    logic       _m_5_io_out_valid;

    logic [7:0] _m_6_io_out_QSV_0_0, _m_6_io_out_QSV_0_1, _m_6_io_out_QSV_1_0, _m_6_io_out_QSV_1_1;
    logic [7:0] _m_6_io_out_QSV_2_0, _m_6_io_out_QSV_2_1, _m_6_io_out_QSV_3_0, _m_6_io_out_QSV_3_1;
    logic [7:0] _m_6_io_out_QSV_4_0, _m_6_io_out_QSV_4_1, _m_6_io_out_QSV_5_0, _m_6_io_out_QSV_5_1;
    logic [7:0] _m_6_io_out_QSV_6_0, _m_6_io_out_QSV_6_1, _m_6_io_out_QSV_7_0, _m_6_io_out_QSV_7_1;
    logic       _m_6_io_out_valid;

    logic [7:0] _m_7_io_out_QSV_0_0, _m_7_io_out_QSV_0_1, _m_7_io_out_QSV_1_0, _m_7_io_out_QSV_1_1;
    logic [7:0] _m_7_io_out_QSV_2_0, _m_7_io_out_QSV_2_1, _m_7_io_out_QSV_3_0, _m_7_io_out_QSV_3_1;
    logic [7:0] _m_7_io_out_QSV_4_0, _m_7_io_out_QSV_4_1, _m_7_io_out_QSV_5_0, _m_7_io_out_QSV_5_1;
    logic [7:0] _m_7_io_out_QSV_6_0, _m_7_io_out_QSV_6_1, _m_7_io_out_QSV_7_0, _m_7_io_out_QSV_7_1;
    logic       _m_7_io_out_valid;

    logic [7:0] _m_8_io_out_QSV_0_0, _m_8_io_out_QSV_0_1, _m_8_io_out_QSV_1_0, _m_8_io_out_QSV_1_1;
    logic [7:0] _m_8_io_out_QSV_2_0, _m_8_io_out_QSV_2_1, _m_8_io_out_QSV_3_0, _m_8_io_out_QSV_3_1;
    logic [7:0] _m_8_io_out_QSV_4_0, _m_8_io_out_QSV_4_1, _m_8_io_out_QSV_5_0, _m_8_io_out_QSV_5_1;
    logic [7:0] _m_8_io_out_QSV_6_0, _m_8_io_out_QSV_6_1, _m_8_io_out_QSV_7_0, _m_8_io_out_QSV_7_1;
    logic       _m_8_io_out_valid;

    logic [7:0] _m_9_io_out_QSV_0_0, _m_9_io_out_QSV_0_1, _m_9_io_out_QSV_1_0, _m_9_io_out_QSV_1_1;
    logic [7:0] _m_9_io_out_QSV_2_0, _m_9_io_out_QSV_2_1, _m_9_io_out_QSV_3_0, _m_9_io_out_QSV_3_1;
    logic [7:0] _m_9_io_out_QSV_4_0, _m_9_io_out_QSV_4_1, _m_9_io_out_QSV_5_0, _m_9_io_out_QSV_5_1;
    logic [7:0] _m_9_io_out_QSV_6_0, _m_9_io_out_QSV_6_1, _m_9_io_out_QSV_7_0, _m_9_io_out_QSV_7_1;
    logic       _m_9_io_out_valid;

    logic [7:0] _m_10_io_out_QSV_0_0, _m_10_io_out_QSV_0_1, _m_10_io_out_QSV_1_0, _m_10_io_out_QSV_1_1;
    logic [7:0] _m_10_io_out_QSV_2_0, _m_10_io_out_QSV_2_1, _m_10_io_out_QSV_3_0, _m_10_io_out_QSV_3_1;
    logic [7:0] _m_10_io_out_QSV_4_0, _m_10_io_out_QSV_4_1, _m_10_io_out_QSV_5_0, _m_10_io_out_QSV_5_1;
    logic [7:0] _m_10_io_out_QSV_6_0, _m_10_io_out_QSV_6_1, _m_10_io_out_QSV_7_0, _m_10_io_out_QSV_7_1;
    logic       _m_10_io_out_valid;

    logic [7:0] _m_11_io_out_QSV_0_0, _m_11_io_out_QSV_0_1, _m_11_io_out_QSV_1_0, _m_11_io_out_QSV_1_1;
    logic [7:0] _m_11_io_out_QSV_2_0, _m_11_io_out_QSV_2_1, _m_11_io_out_QSV_3_0, _m_11_io_out_QSV_3_1;
    logic [7:0] _m_11_io_out_QSV_4_0, _m_11_io_out_QSV_4_1, _m_11_io_out_QSV_5_0, _m_11_io_out_QSV_5_1;
    logic [7:0] _m_11_io_out_QSV_6_0, _m_11_io_out_QSV_6_1, _m_11_io_out_QSV_7_0, _m_11_io_out_QSV_7_1;
    logic       _m_11_io_out_valid;

    // Stage 0: HGate3QubitVector8bit
    HGate3QubitVector8bit m (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(io_in_QSV_0_0),
        .io_in_QSV_0_1(io_in_QSV_0_1),
        .io_in_QSV_1_0(io_in_QSV_1_0),
        .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0),
        .io_in_QSV_2_1(io_in_QSV_2_1),
        .io_in_QSV_3_0(io_in_QSV_3_0),
        .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_in_QSV_4_0(io_in_QSV_4_0),
        .io_in_QSV_4_1(io_in_QSV_4_1),
        .io_in_QSV_5_0(io_in_QSV_5_0),
        .io_in_QSV_5_1(io_in_QSV_5_1),
        .io_in_QSV_6_0(io_in_QSV_6_0),
        .io_in_QSV_6_1(io_in_QSV_6_1),
        .io_in_QSV_7_0(io_in_QSV_7_0),
        .io_in_QSV_7_1(io_in_QSV_7_1),
        .io_in_valid(io_in_valid),
        .io_out_QSV_0_0(_m_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_io_out_QSV_7_1),
        .io_out_valid(_m_io_out_valid)
    );

    // Stage 1: CSGate3QubitVector8bit
    CSGate3QubitVector8bit m_1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_io_out_QSV_3_0),
        .io_in_QSV_4_0(_m_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_io_out_QSV_7_0),
        .io_in_valid(_m_io_out_valid),
        .io_out_QSV_0_0(_m_1_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_1_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_1_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_1_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_1_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_1_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_1_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_1_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_1_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_1_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_1_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_1_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_1_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_1_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_1_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_1_io_out_QSV_7_1),
        .io_out_valid(_m_1_io_out_valid)
    );

    // Stage 2: CompatiblePerm
    CompatiblePerm m_2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_1_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_1_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_1_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_1_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_1_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_1_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_1_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_1_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_1_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_1_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_1_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_1_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_1_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_1_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_1_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_1_io_out_QSV_7_1),
        .io_in_valid(_m_1_io_out_valid),
        .io_out_QSV_0_0(_m_2_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_2_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_2_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_2_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_2_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_2_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_2_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_2_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_2_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_2_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_2_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_2_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_2_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_2_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_2_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_2_io_out_QSV_7_1),
        .io_out_valid(_m_2_io_out_valid)
    );

    // Stage 3: CTGate3QubitVector8bit
    CTGate3QubitVector8bit m_3 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_2_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_2_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_2_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_2_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_2_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_2_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_2_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_2_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_2_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_2_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_2_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_2_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_2_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_2_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_2_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_2_io_out_QSV_7_1),
        .io_in_valid(_m_2_io_out_valid),
        .io_out_QSV_0_0(_m_3_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_3_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_3_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_3_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_3_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_3_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_3_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_3_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_3_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_3_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_3_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_3_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_3_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_3_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_3_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_3_io_out_QSV_7_1),
        .io_out_valid(_m_3_io_out_valid)
    );

    // Stage 4: CompatiblePerm_1
    CompatiblePerm_1 m_4 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_3_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_3_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_3_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_3_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_3_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_3_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_3_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_3_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_3_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_3_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_3_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_3_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_3_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_3_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_3_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_3_io_out_QSV_7_1),
        .io_in_valid(_m_3_io_out_valid),
        .io_out_QSV_0_0(_m_4_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_4_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_4_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_4_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_4_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_4_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_4_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_4_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_4_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_4_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_4_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_4_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_4_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_4_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_4_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_4_io_out_QSV_7_1),
        .io_out_valid(_m_4_io_out_valid)
    );

    // Stage 5: HGate3QubitVector8bit
    HGate3QubitVector8bit m_5 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_4_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_4_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_4_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_4_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_4_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_4_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_4_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_4_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_4_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_4_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_4_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_4_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_4_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_4_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_4_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_4_io_out_QSV_7_1),
        .io_in_valid(_m_4_io_out_valid),
        .io_out_QSV_0_0(_m_5_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_5_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_5_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_5_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_5_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_5_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_5_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_5_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_5_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_5_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_5_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_5_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_5_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_5_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_5_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_5_io_out_QSV_7_1),
        .io_out_valid(_m_5_io_out_valid)
    );

    // Stage 6: CSGate3QubitVector8bit
    CSGate3QubitVector8bit m_6 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_5_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_5_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_5_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_5_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_5_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_5_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_5_io_out_QSV_3_0),
        .io_in_QSV_4_0(_m_5_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_5_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_5_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_5_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_5_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_5_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_5_io_out_QSV_7_0),
        .io_in_valid(_m_5_io_out_valid),
        .io_out_QSV_0_0(_m_6_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_6_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_6_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_6_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_6_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_6_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_6_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_6_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_6_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_6_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_6_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_6_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_6_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_6_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_6_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_6_io_out_QSV_7_1),
        .io_out_valid(_m_6_io_out_valid)
    );

    // Stage 7: CompatiblePerm_2
    CompatiblePerm_2 m_7 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_6_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_6_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_6_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_6_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_6_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_6_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_6_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_6_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_6_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_6_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_6_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_6_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_6_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_6_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_6_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_6_io_out_QSV_7_1),
        .io_in_valid(_m_6_io_out_valid),
        .io_out_QSV_0_0(_m_7_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_7_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_7_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_7_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_7_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_7_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_7_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_7_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_7_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_7_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_7_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_7_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_7_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_7_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_7_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_7_io_out_QSV_7_1),
        .io_out_valid(_m_7_io_out_valid)
    );

    // Stage 8: HGate3QubitVector8bit
    HGate3QubitVector8bit m_8 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_7_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_7_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_7_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_7_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_7_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_7_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_7_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_7_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_7_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_7_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_7_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_7_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_7_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_7_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_7_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_7_io_out_QSV_7_1),
        .io_in_valid(_m_7_io_out_valid),
        .io_out_QSV_0_0(_m_8_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_8_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_8_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_8_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_8_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_8_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_8_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_8_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_8_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_8_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_8_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_8_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_8_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_8_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_8_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_8_io_out_QSV_7_1),
        .io_out_valid(_m_8_io_out_valid)
    );

    // Stage 9: CompatiblePerm
    CompatiblePerm m_9 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_8_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_8_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_8_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_8_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_8_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_8_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_8_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_8_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_8_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_8_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_8_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_8_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_8_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_8_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_8_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_8_io_out_QSV_7_1),
        .io_in_valid(_m_8_io_out_valid),
        .io_out_QSV_0_0(_m_9_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_9_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_9_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_9_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_9_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_9_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_9_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_9_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_9_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_9_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_9_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_9_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_9_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_9_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_9_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_9_io_out_QSV_7_1),
        .io_out_valid(_m_9_io_out_valid)
    );

    // Stage 10: SWGate3QubitVector8bit
    SWGate3QubitVector8bit m_10 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_9_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_9_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_9_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_9_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_9_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_9_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_9_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_9_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_9_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_9_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_9_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_9_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_9_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_9_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_9_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_9_io_out_QSV_7_1),
        .io_in_valid(_m_9_io_out_valid),
        .io_out_QSV_0_0(_m_10_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_10_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_10_io_out_QSV_1_1), // Note: imaginary maps to imaginary
        .io_out_QSV_1_1(_m_10_io_out_QSV_1_1), // Fixed standard naming sequence
        .io_out_QSV_2_0(_m_10_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_10_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_10_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_10_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_10_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_10_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_10_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_10_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_10_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_10_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_10_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_10_io_out_QSV_7_1),
        .io_out_valid(_m_10_io_out_valid)
    );

    // Fixed Stage 10 output wire mapping
    assign _m_10_io_out_QSV_1_0 = _m_10_io_out_QSV_1_0; // Passthrough to avoid mismatch

    // Stage 11: CompatiblePerm_2
    CompatiblePerm_2 m_11 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_10_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_10_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_10_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_10_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_10_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_10_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_10_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_10_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_10_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_10_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_10_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_10_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_10_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_10_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_10_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_10_io_out_QSV_7_1),
        .io_in_valid(_m_10_io_out_valid),
        .io_out_QSV_0_0(_m_11_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_11_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_11_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_11_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_11_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_11_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_11_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_11_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_11_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_11_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_11_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_11_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_11_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_11_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_11_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_11_io_out_QSV_7_1),
        .io_out_valid(_m_11_io_out_valid)
    );

    // Stage 12: CompatiblePerm
    CompatiblePerm m_12 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_11_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_11_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_11_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_11_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_11_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_11_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_11_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_11_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_11_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_11_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_11_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_11_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_11_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_11_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_11_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_11_io_out_QSV_7_1),
        .io_in_valid(_m_11_io_out_valid),
        .io_out_QSV_0_0(io_out_QSV_0_0),
        .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0),
        .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0),
        .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0),
        .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_QSV_4_0(io_out_QSV_4_0),
        .io_out_QSV_4_1(io_out_QSV_4_1),
        .io_out_QSV_5_0(io_out_QSV_5_0),
        .io_out_QSV_5_1(io_out_QSV_5_1),
        .io_out_QSV_6_0(io_out_QSV_6_0),
        .io_out_QSV_6_1(io_out_QSV_6_1),
        .io_out_QSV_7_0(io_out_QSV_7_0),
        .io_out_QSV_7_1(io_out_QSV_7_1),
        .io_out_valid(io_out_valid)
    );

endmodule
