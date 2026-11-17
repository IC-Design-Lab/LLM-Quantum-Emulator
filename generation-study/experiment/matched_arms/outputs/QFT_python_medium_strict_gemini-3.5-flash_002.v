module QFT (
    input  logic clock,
    input  logic reset,
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
    input  logic io_in_valid,
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
    output logic io_out_valid
);

    // Intermediate signals
    logic [7:0] _m_io_out_QSV_0_0, _m_io_out_QSV_0_1;
    logic [7:0] _m_io_out_QSV_1_0, _m_io_out_QSV_1_1;
    logic [7:0] _m_io_out_QSV_2_0, _m_io_out_QSV_2_1;
    logic [7:0] _m_io_out_QSV_3_0, _m_io_out_QSV_3_1;
    logic [7:0] _m_io_out_QSV_4_0, _m_io_out_QSV_4_1;
    logic [7:0] _m_io_out_QSV_5_0, _m_io_out_QSV_5_1;
    logic [7:0] _m_io_out_QSV_6_0, _m_io_out_QSV_6_1;
    logic [7:0] _m_io_out_QSV_7_0, _m_io_out_QSV_7_1;
    logic _m_io_out_valid;

    logic [7:0] _m_1_io_out_QSV_0_0, _m_1_io_out_QSV_0_1;
    logic [7:0] _m_1_io_out_QSV_1_0, _m_1_io_out_QSV_1_1;
    logic [7:0] _m_1_io_out_QSV_2_0, _m_1_io_out_QSV_2_1;
    logic [7:0] _m_1_io_out_QSV_3_0, _m_1_io_out_QSV_3_1;
    logic [7:0] _m_1_io_out_QSV_4_0, _m_1_io_out_QSV_4_1;
    logic [7:0] _m_1_io_out_QSV_5_0, _m_1_io_out_QSV_5_1;
    logic [7:0] _m_1_io_out_QSV_6_0, _m_1_io_out_QSV_6_1;
    logic [7:0] _m_1_io_out_QSV_7_0, _m_1_io_out_QSV_7_1;
    logic _m_1_io_out_valid;

    logic [7:0] _m_2_io_out_QSV_0_0, _m_2_io_out_QSV_0_1;
    logic [7:0] _m_2_io_out_QSV_1_0, _m_2_io_out_QSV_1_1;
    logic [7:0] _m_2_io_out_QSV_2_0, _m_2_io_out_QSV_2_1;
    logic [7:0] _m_2_io_out_QSV_3_0, _m_2_io_out_QSV_3_1;
    logic [7:0] _m_2_io_out_QSV_4_0, _m_2_io_out_QSV_4_1;
    logic [7:0] _m_2_io_out_QSV_5_0, _m_2_io_out_QSV_5_1;
    logic [7:0] _m_2_io_out_QSV_6_0, _m_2_io_out_QSV_6_1;
    logic [7:0] _m_2_io_out_QSV_7_0, _m_2_io_out_QSV_7_1;
    logic _m_2_io_out_valid;

    logic [7:0] _m_3_io_out_QSV_0_0, _m_3_io_out_QSV_0_1;
    logic [7:0] _m_3_io_out_QSV_1_0, _m_3_io_out_QSV_1_1;
    logic [7:0] _m_3_io_out_QSV_2_0, _m_3_io_out_QSV_2_1;
    logic [7:0] _m_3_io_out_QSV_3_0, _m_3_io_out_QSV_3_1;
    logic [7:0] _m_3_io_out_QSV_4_0, _m_3_io_out_QSV_4_1;
    logic [7:0] _m_3_io_out_QSV_5_0, _m_3_io_out_QSV_5_1;
    logic [7:0] _m_3_io_out_QSV_6_0, _m_3_io_out_QSV_6_1;
    logic [7:0] _m_3_io_out_QSV_7_0, _m_3_io_out_QSV_7_1;
    logic _m_3_io_out_valid;

    logic [7:0] _m_4_io_out_QSV_0_0, _m_4_io_out_QSV_0_1;
    logic [7:0] _m_4_io_out_QSV_1_0, _m_4_io_out_QSV_1_1;
    logic [7:0] _m_4_io_out_QSV_2_0, _m_4_io_out_QSV_2_1;
    logic [7:0] _m_4_io_out_QSV_3_0, _m_4_io_out_QSV_3_1;
    logic [7:0] _m_4_io_out_QSV_4_0, _m_4_io_out_QSV_4_1;
    logic [7:0] _m_4_io_out_QSV_5_0, _m_4_io_out_QSV_5_1;
    logic [7:0] _m_4_io_out_QSV_6_0, _m_4_io_out_QSV_6_1;
    logic [7:0] _m_4_io_out_QSV_7_0, _m_4_io_out_QSV_7_1;
    logic _m_4_io_out_valid;

    logic [7:0] _m_5_io_out_QSV_0_0, _m_5_io_out_QSV_0_1;
    logic [7:0] _m_5_io_out_QSV_1_0, _m_5_io_out_QSV_1_1;
    logic [7:0] _m_5_io_out_QSV_2_0, _m_5_io_out_QSV_2_1;
    logic [7:0] _m_5_io_out_QSV_3_0, _m_5_io_out_QSV_3_1;
    logic [7:0] _m_5_io_out_QSV_4_0, _m_5_io_out_QSV_4_1;
    logic [7:0] _m_5_io_out_QSV_5_0, _m_5_io_out_QSV_5_1;
    logic [7:0] _m_5_io_out_QSV_6_0, _m_5_io_out_QSV_6_1;
    logic [7:0] _m_5_io_out_QSV_7_0, _m_5_io_out_QSV_7_1;
    logic _m_5_io_out_valid;

    logic [7:0] _m_6_io_out_QSV_0_0, _m_6_io_out_QSV_0_1;
    logic [7:0] _m_6_io_out_QSV_1_0, _m_6_io_out_QSV_1_1;
    logic [7:0] _m_6_io_out_QSV_2_0, _m_6_io_out_QSV_2_1;
    logic [7:0] _m_6_io_out_QSV_3_0, _m_6_io_out_QSV_3_1;
    logic [7:0] _m_6_io_out_QSV_4_0, _m_6_io_out_QSV_4_1;
    logic [7:0] _m_6_io_out_QSV_5_0, _m_6_io_out_QSV_5_1;
    logic [7:0] _m_6_io_out_QSV_6_0, _m_6_io_out_QSV_6_1;
    logic [7:0] _m_6_io_out_QSV_7_0, _m_6_io_out_QSV_7_1;
    logic _m_6_io_out_valid;

    logic [7:0] _m_7_io_out_QSV_0_0, _m_7_io_out_QSV_0_1;
    logic [7:0] _m_7_io_out_QSV_1_0, _m_7_io_out_QSV_1_1;
    logic [7:0] _m_7_io_out_QSV_2_0, _m_7_io_out_QSV_2_1;
    logic [7:0] _m_7_io_out_QSV_3_0, _m_7_io_out_QSV_3_1;
    logic [7:0] _m_7_io_out_QSV_4_0, _m_7_io_out_QSV_4_1;
    logic [7:0] _m_7_io_out_QSV_5_0, _m_7_io_out_QSV_5_1;
    logic [7:0] _m_7_io_out_QSV_6_0, _m_7_io_out_QSV_6_1;
    logic [7:0] _m_7_io_out_QSV_7_0, _m_7_io_out_QSV_7_1;
    logic _m_7_io_out_valid;

    logic [7:0] _m_8_io_out_QSV_0_0, _m_8_io_out_QSV_0_1;
    logic [7:0] _m_8_io_out_QSV_1_0, _m_8_io_out_QSV_1_1;
    logic [7:0] _m_8_io_out_QSV_2_0, _m_8_io_out_QSV_2_1;
    logic [7:0] _m_8_io_out_QSV_3_0, _m_8_io_out_QSV_3_1;
    logic [7:0] _m_8_io_out_QSV_4_0, _m_8_io_out_QSV_4_1;
    logic [7:0] _m_8_io_out_QSV_5_0, _m_8_io_out_QSV_5_1;
    logic [7:0] _m_8_io_out_QSV_6_0, _m_8_io_out_QSV_6_1;
    logic [7:0] _m_8_io_out_QSV_7_0, _m_8_io_out_QSV_7_1;
    logic _m_8_io_out_valid;

    logic [7:0] _m_9_io_out_QSV_0_0, _m_9_io_out_QSV_0_1;
    logic [7:0] _m_9_io_out_QSV_1_0, _m_9_io_out_QSV_1_1;
    logic [7:0] _m_9_io_out_QSV_2_0, _m_9_io_out_QSV_2_1;
    logic [7:0] _m_9_io_out_QSV_3_0, _m_9_io_out_QSV_3_1;
    logic [7:0] _m_9_io_out_QSV_4_0, _m_9_io_out_QSV_4_1;
    logic [7:0] _m_9_io_out_QSV_5_0, _m_9_io_out_QSV_5_1;
    logic [7:0] _m_9_io_out_QSV_6_0, _m_9_io_out_QSV_6_1;
    logic [7:0] _m_9_io_out_QSV_7_0, _m_9_io_out_QSV_7_1;
    logic _m_9_io_out_valid;

    // Gate Pipeline

    // Instance m: H on Qubit 0
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

    // Instance m_1: CS on control 1, target 0
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
        // io_in_QSV_3_1 pruned
        .io_in_QSV_4_0(_m_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_io_out_QSV_7_0),
        // io_in_QSV_7_1 pruned
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

    // Instance m_2: CT on control 2, target 0
    CTGate3QubitVector8bit m_2 (
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

    // Instance m_3: CompatiblePerm (Permute Qubit 1 to default)
    CompatiblePerm m_3 (
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

    // Instance m_4: H on Qubit 1 (permuted to 0)
    HGate3QubitVector8bit m_4 (
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

    // Instance m_5: CS on control 2, target 1 (permuted to 0)
    CSGate3QubitVector8bit m_5 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_4_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_4_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_4_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_4_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_4_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_4_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_4_io_out_QSV_3_0),
        // io_in_QSV_3_1 pruned
        .io_in_QSV_4_0(_m_4_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_4_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_4_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_4_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_4_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_4_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_4_io_out_QSV_7_0),
        // io_in_QSV_7_1 pruned
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

    // Instance m_6: CompatiblePerm (Un-permute Qubit 1)
    CompatiblePerm m_6 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_5_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_5_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_5_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_5_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_5_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_5_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_5_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_5_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_5_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_5_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_5_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_5_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_5_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_5_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_5_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_5_io_out_QSV_7_1),
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

    // Instance m_7: CompatiblePerm_1 (Permute Qubit 2 to default)
    CompatiblePerm_1 m_7 (
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

    // Instance m_8: H on Qubit 2 (permuted to 0)
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

    // Instance m_9: CompatiblePerm_1 (Un-permute Qubit 2)
    CompatiblePerm_1 m_9 (
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

    // Instance m_10: SWAP qubits 0 & 2
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
