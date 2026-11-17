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

    // Intermediate Wires
    wire [7:0] _m_0_io_out_QSV_0_0, _m_0_io_out_QSV_0_1;
    wire [7:0] _m_0_io_out_QSV_1_0, _m_0_io_out_QSV_1_1;
    wire [7:0] _m_0_io_out_QSV_2_0, _m_0_io_out_QSV_2_1;
    wire [7:0] _m_0_io_out_QSV_3_0, _m_0_io_out_QSV_3_1;
    wire [7:0] _m_0_io_out_QSV_4_0, _m_0_io_out_QSV_4_1;
    wire [7:0] _m_0_io_out_QSV_5_0, _m_0_io_out_QSV_5_1;
    wire [7:0] _m_0_io_out_QSV_6_0, _m_0_io_out_QSV_6_1;
    wire [7:0] _m_0_io_out_QSV_7_0, _m_0_io_out_QSV_7_1;
    wire       _m_0_io_out_valid;

    wire [7:0] _m_1_io_out_QSV_0_0, _m_1_io_out_QSV_0_1;
    wire [7:0] _m_1_io_out_QSV_1_0, _m_1_io_out_QSV_1_1;
    wire [7:0] _m_1_io_out_QSV_2_0, _m_1_io_out_QSV_2_1;
    wire [7:0] _m_1_io_out_QSV_3_0, _m_1_io_out_QSV_3_1;
    wire [7:0] _m_1_io_out_QSV_4_0, _m_1_io_out_QSV_4_1;
    wire [7:0] _m_1_io_out_QSV_5_0, _m_1_io_out_QSV_5_1;
    wire [7:0] _m_1_io_out_QSV_6_0, _m_1_io_out_QSV_6_1;
    wire [7:0] _m_1_io_out_QSV_7_0, _m_1_io_out_QSV_7_1;
    wire       _m_1_io_out_valid;

    wire [7:0] _m_2_io_out_QSV_0_0, _m_2_io_out_QSV_0_1;
    wire [7:0] _m_2_io_out_QSV_1_0, _m_2_io_out_QSV_1_1;
    wire [7:0] _m_2_io_out_QSV_2_0, _m_2_io_out_QSV_2_1;
    wire [7:0] _m_2_io_out_QSV_3_0, _m_2_io_out_QSV_3_1;
    wire [7:0] _m_2_io_out_QSV_4_0, _m_2_io_out_QSV_4_1;
    wire [7:0] _m_2_io_out_QSV_5_0, _m_2_io_out_QSV_5_1;
    wire [7:0] _m_2_io_out_QSV_6_0, _m_2_io_out_QSV_6_1;
    wire [7:0] _m_2_io_out_QSV_7_0, _m_2_io_out_QSV_7_1;
    wire       _m_2_io_out_valid;

    wire [7:0] _m_3_io_out_QSV_0_0, _m_3_io_out_QSV_0_1;
    wire [7:0] _m_3_io_out_QSV_1_0, _m_3_io_out_QSV_1_1;
    wire [7:0] _m_3_io_out_QSV_2_0, _m_3_io_out_QSV_2_1;
    wire [7:0] _m_3_io_out_QSV_3_0, _m_3_io_out_QSV_3_1;
    wire [7:0] _m_3_io_out_QSV_4_0, _m_3_io_out_QSV_4_1;
    wire [7:0] _m_3_io_out_QSV_5_0, _m_3_io_out_QSV_5_1;
    wire [7:0] _m_3_io_out_QSV_6_0, _m_3_io_out_QSV_6_1;
    wire [7:0] _m_3_io_out_QSV_7_0, _m_3_io_out_QSV_7_1;
    wire       _m_3_io_out_valid;

    wire [7:0] _m_4_io_out_QSV_0_0, _m_4_io_out_QSV_0_1;
    wire [7:0] _m_4_io_out_QSV_1_0, _m_4_io_out_QSV_1_1;
    wire [7:0] _m_4_io_out_QSV_2_0, _m_4_io_out_QSV_2_1;
    wire [7:0] _m_4_io_out_QSV_3_0, _m_4_io_out_QSV_3_1;
    wire [7:0] _m_4_io_out_QSV_4_0, _m_4_io_out_QSV_4_1;
    wire [7:0] _m_4_io_out_QSV_5_0, _m_4_io_out_QSV_5_1;
    wire [7:0] _m_4_io_out_QSV_6_0, _m_4_io_out_QSV_6_1;
    wire [7:0] _m_4_io_out_QSV_7_0, _m_4_io_out_QSV_7_1;
    wire       _m_4_io_out_valid;

    wire [7:0] _m_5_io_out_QSV_0_0, _m_5_io_out_QSV_0_1;
    wire [7:0] _m_5_io_out_QSV_1_0, _m_5_io_out_QSV_1_1;
    wire [7:0] _m_5_io_out_QSV_2_0, _m_5_io_out_QSV_2_1;
    wire [7:0] _m_5_io_out_QSV_3_0, _m_5_io_out_QSV_3_1;
    wire [7:0] _m_5_io_out_QSV_4_0, _m_5_io_out_QSV_4_1;
    wire [7:0] _m_5_io_out_QSV_5_0, _m_5_io_out_QSV_5_1;
    wire [7:0] _m_5_io_out_QSV_6_0, _m_5_io_out_QSV_6_1;
    wire [7:0] _m_5_io_out_QSV_7_0, _m_5_io_out_QSV_7_1;
    wire       _m_5_io_out_valid;

    wire [7:0] _m_6_io_out_QSV_0_0, _m_6_io_out_QSV_0_1;
    wire [7:0] _m_6_io_out_QSV_1_0, _m_6_io_out_QSV_1_1;
    wire [7:0] _m_6_io_out_QSV_2_0, _m_6_io_out_QSV_2_1;
    wire [7:0] _m_6_io_out_QSV_3_0, _m_6_io_out_QSV_3_1;
    wire [7:0] _m_6_io_out_QSV_4_0, _m_6_io_out_QSV_4_1;
    wire [7:0] _m_6_io_out_QSV_5_0, _m_6_io_out_QSV_5_1;
    wire [7:0] _m_6_io_out_QSV_6_0, _m_6_io_out_QSV_6_1;
    wire [7:0] _m_6_io_out_QSV_7_0, _m_6_io_out_QSV_7_1;
    wire       _m_6_io_out_valid;

    wire [7:0] _m_7_io_out_QSV_0_0, _m_7_io_out_QSV_0_1;
    wire [7:0] _m_7_io_out_QSV_1_0, _m_7_io_out_QSV_1_1;
    wire [7:0] _m_7_io_out_QSV_2_0, _m_7_io_out_QSV_2_1;
    wire [7:0] _m_7_io_out_QSV_3_0, _m_7_io_out_QSV_3_1;
    wire [7:0] _m_7_io_out_QSV_4_0, _m_7_io_out_QSV_4_1;
    wire [7:0] _m_7_io_out_QSV_5_0, _m_7_io_out_QSV_5_1;
    wire [7:0] _m_7_io_out_QSV_6_0, _m_7_io_out_QSV_6_1;
    wire [7:0] _m_7_io_out_QSV_7_0, _m_7_io_out_QSV_7_1;
    wire       _m_7_io_out_valid;

    wire [7:0] _m_8_io_out_QSV_0_0, _m_8_io_out_QSV_0_1;
    wire [7:0] _m_8_io_out_QSV_1_0, _m_8_io_out_QSV_1_1;
    wire [7:0] _m_8_io_out_QSV_2_0, _m_8_io_out_QSV_2_1;
    wire [7:0] _m_8_io_out_QSV_3_0, _m_8_io_out_QSV_3_1;
    wire [7:0] _m_8_io_out_QSV_4_0, _m_8_io_out_QSV_4_1;
    wire [7:0] _m_8_io_out_QSV_5_0, _m_8_io_out_QSV_5_1;
    wire [7:0] _m_8_io_out_QSV_6_0, _m_8_io_out_QSV_6_1;
    wire [7:0] _m_8_io_out_QSV_7_0, _m_8_io_out_QSV_7_1;
    wire       _m_8_io_out_valid;

    wire [7:0] _m_9_io_out_QSV_0_0, _m_9_io_out_QSV_0_1;
    wire [7:0] _m_9_io_out_QSV_1_0, _m_9_io_out_QSV_1_1;
    wire [7:0] _m_9_io_out_QSV_2_0, _m_9_io_out_QSV_2_1;
    wire [7:0] _m_9_io_out_QSV_3_0, _m_9_io_out_QSV_3_1;
    wire [7:0] _m_9_io_out_QSV_4_0, _m_9_io_out_QSV_4_1;
    wire [7:0] _m_9_io_out_QSV_5_0, _m_9_io_out_QSV_5_1;
    wire [7:0] _m_9_io_out_QSV_6_0, _m_9_io_out_QSV_6_1;
    wire [7:0] _m_9_io_out_QSV_7_0, _m_9_io_out_QSV_7_1;
    wire       _m_9_io_out_valid;

    // Stage 0: H on Q0
    HGate3QubitVector8bit m_0 (
        .clock           (clock),
        .reset           (reset),
        .io_in_QSV_0_0   (io_in_QSV_0_0),
        .io_in_QSV_0_1   (io_in_QSV_0_1),
        .io_in_QSV_1_0   (io_in_QSV_1_0),
        .io_in_QSV_1_1   (io_in_QSV_1_1),
        .io_in_QSV_2_0   (io_in_QSV_2_0),
        .io_in_QSV_2_1   (io_in_QSV_2_1),
        .io_in_QSV_3_0   (io_in_QSV_3_0),
        .io_in_QSV_3_1   (io_in_QSV_3_1),
        .io_in_QSV_4_0   (io_in_QSV_4_0),
        .io_in_QSV_4_1   (io_in_QSV_4_1),
        .io_in_QSV_5_0   (io_in_QSV_5_0),
        .io_in_QSV_5_1   (io_in_QSV_5_1),
        .io_in_QSV_6_0   (io_in_QSV_6_0),
        .io_in_QSV_6_1   (io_in_QSV_6_1),
        .io_in_QSV_7_0   (io_in_QSV_7_0),
        .io_in_QSV_7_1   (io_in_QSV_7_1),
        .io_in_valid     (io_in_valid),
        .io_out_QSV_0_0  (_m_0_io_out_QSV_0_0),
        .io_out_QSV_0_1  (_m_0_io_out_QSV_0_1),
        .io_out_QSV_1_0  (_m_0_io_out_QSV_1_0),
        .io_out_QSV_1_1  (_m_0_io_out_QSV_1_1),
        .io_out_QSV_2_0  (_m_0_io_out_QSV_2_0),
        .io_out_QSV_2_1  (_m_0_io_out_QSV_2_1),
        .io_out_QSV_3_0  (_m_0_io_out_QSV_3_0),
        .io_out_QSV_3_1  (_m_0_io_out_QSV_3_1),
        .io_out_QSV_4_0  (_m_0_io_out_QSV_4_0),
        .io_out_QSV_4_1  (_m_0_io_out_QSV_4_1),
        .io_out_QSV_5_0  (_m_0_io_out_QSV_5_0),
        .io_out_QSV_5_1  (_m_0_io_out_QSV_5_1),
        .io_out_QSV_6_0  (_m_0_io_out_QSV_6_0),
        .io_out_QSV_6_1  (_m_0_io_out_QSV_6_1),
        .io_out_QSV_7_0  (_m_0_io_out_QSV_7_0),
        .io_out_QSV_7_1  (_m_0_io_out_QSV_7_1),
        .io_out_valid    (_m_0_io_out_valid)
    );

    // Stage 1: CS on Q1,0 (pruned ports io_in_QSV_3_1 and io_in_QSV_7_1 omitted)
    CSGate3QubitVector8bit m_1 (
        .clock           (clock),
        .reset           (reset),
        .io_in_QSV_0_0   (_m_0_io_out_QSV_0_0),
        .io_in_QSV_0_1   (_m_0_io_out_QSV_0_1),
        .io_in_QSV_1_0   (_m_0_io_out_QSV_1_0),
        .io_in_QSV_1_1   (_m_0_io_out_QSV_1_1),
        .io_in_QSV_2_0   (_m_0_io_out_QSV_2_0),
        .io_in_QSV_2_1   (_m_0_io_out_QSV_2_1),
        .io_in_QSV_3_0   (_m_0_io_out_QSV_3_0),
        .io_in_QSV_4_0   (_m_0_io_out_QSV_4_0),
        .io_in_QSV_4_1   (_m_0_io_out_QSV_4_1),
        .io_in_QSV_5_0   (_m_0_io_out_QSV_5_0),
        .io_in_QSV_5_1   (_m_0_io_out_QSV_5_1),
        .io_in_QSV_6_0   (_m_0_io_out_QSV_6_0),
        .io_in_QSV_6_1   (_m_0_io_out_QSV_6_1),
        .io_in_QSV_7_0   (_m_0_io_out_QSV_7_0),
        .io_in_valid     (_m_0_io_out_valid),
        .io_out_QSV_0_0  (_m_1_io_out_QSV_0_0),
        .io_out_QSV_0_1  (_m_1_io_out_QSV_0_1),
        .io_out_QSV_1_0  (_m_1_io_out_QSV_1_0),
        .io_out_QSV_1_1  (_m_1_io_out_QSV_1_1),
        .io_out_QSV_2_0  (_m_1_io_out_QSV_2_0),
        .io_out_QSV_2_1  (_m_1_io_out_QSV_2_1),
        .io_out_QSV_3_0  (_m_1_io_out_QSV_3_0),
        .io_out_QSV_3_1  (_m_1_io_out_QSV_3_1),
        .io_out_QSV_4_0  (_m_1_io_out_QSV_4_0),
        .io_out_QSV_4_1  (_m_1_io_out_QSV_4_1),
        .io_out_QSV_5_0  (_m_1_io_out_QSV_5_0),
        .io_out_QSV_5_1  (_m_1_io_out_QSV_5_1),
        .io_out_QSV_6_0  (_m_1_io_out_QSV_6_0),
        .io_out_QSV_6_1  (_m_1_io_out_QSV_6_1),
        .io_out_QSV_7_0  (_m_1_io_out_QSV_7_0),
        .io_out_QSV_7_1  (_m_1_io_out_QSV_7_1),
        .io_out_valid    (_m_1_io_out_valid)
    );

    // Stage 2: CT on Q2,0
    CTGate3QubitVector8bit m_2 (
        .clock           (clock),
        .reset           (reset),
        .io_in_QSV_0_0   (_m_1_io_out_QSV_0_0),
        .io_in_QSV_0_1   (_m_1_io_out_QSV_0_1),
        .io_in_QSV_1_0   (_m_1_io_out_QSV_1_0),
        .io_in_QSV_1_1   (_m_1_io_out_QSV_1_1),
        .io_in_QSV_2_0   (_m_1_io_out_QSV_2_0),
        .io_in_QSV_2_1   (_m_1_io_out_QSV_2_1),
        .io_in_QSV_3_0   (_m_1_io_out_QSV_3_0),
        .io_in_QSV_3_1   (_m_1_io_out_QSV_3_1),
        .io_in_QSV_4_0   (_m_1_io_out_QSV_4_0),
        .io_in_QSV_4_1   (_m_1_io_out_QSV_4_1),
        .io_in_QSV_5_0   (_m_1_io_out_QSV_5_0),
        .io_in_QSV_5_1   (_m_1_io_out_QSV_5_1),
        .io_in_QSV_6_0   (_m_1_io_out_QSV_6_0),
        .io_in_QSV_6_1   (_m_1_io_out_QSV_6_1),
        .io_in_QSV_7_0   (_m_1_io_out_QSV_7_0),
        .io_in_QSV_7_1   (_m_1_io_out_QSV_7_1),
        .io_in_valid     (_m_1_io_out_valid),
        .io_out_QSV_0_0  (_m_2_io_out_QSV_0_0),
        .io_out_QSV_0_1  (_m_2_io_out_QSV_0_1),
        .io_out_QSV_1_0  (_m_2_io_out_QSV_1_0),
        .io_out_QSV_1_1  (_m_2_io_out_QSV_1_1),
        .io_out_QSV_2_0  (_m_2_io_out_QSV_2_0),
        .io_out_QSV_2_1  (_m_2_io_out_QSV_2_1),
        .io_out_QSV_3_0  (_m_2_io_out_QSV_3_0),
        .io_out_QSV_3_1  (_m_2_io_out_QSV_3_1),
        .io_out_QSV_4_0  (_m_2_io_out_QSV_4_0),
        .io_out_QSV_4_1  (_m_2_io_out_QSV_4_1),
        .io_out_QSV_5_0  (_m_2_io_out_QSV_5_0),
        .io_out_QSV_5_1  (_m_2_io_out_QSV_5_1),
        .io_out_QSV_6_0  (_m_2_io_out_QSV_6_0),
        .io_out_QSV_6_1  (_m_2_io_out_QSV_6_1),
        .io_out_QSV_7_0  (_m_2_io_out_QSV_7_0),
        .io_out_QSV_7_1  (_m_2_io_out_QSV_7_1),
        .io_out_valid    (_m_2_io_out_valid)
    );

    // Stage 3: CompatiblePerm (Pre-perm for H on Q1 / CS on Q2,1)
    CompatiblePerm m_3 (
        .clock           (clock),
        .reset           (reset),
        .io_in_QSV_0_0   (_m_2_io_out_QSV_0_0),
        .io_in_QSV_0_1   (_m_2_io_out_QSV_0_1),
        .io_in_QSV_1_0   (_m_2_io_out_QSV_1_0),
        .io_in_QSV_1_1   (_m_2_io_out_QSV_1_1),
        .io_in_QSV_2_0   (_m_2_io_out_QSV_2_0),
        .io_in_QSV_2_1   (_m_2_io_out_QSV_2_1),
        .io_in_QSV_3_0   (_m_2_io_out_QSV_3_0),
        .io_in_QSV_3_1   (_m_2_io_out_QSV_3_1),
        .io_in_QSV_4_0   (_m_2_io_out_QSV_4_0),
        .io_in_QSV_4_1   (_m_2_io_out_QSV_4_1),
        .io_in_QSV_5_0   (_m_2_io_out_QSV_5_0),
        .io_in_QSV_5_1   (_m_2_io_out_QSV_5_1),
        .io_in_QSV_6_0   (_m_2_io_out_QSV_6_0),
        .io_in_QSV_6_1   (_m_2_io_out_QSV_6_1),
        .io_in_QSV_7_0   (_m_2_io_out_QSV_7_0),
        .io_in_QSV_7_1   (_m_2_io_out_QSV_7_1),
        .io_in_valid     (_m_2_io_out_valid),
        .io_out_QSV_0_0  (_m_3_io_out_QSV_0_0),
        .io_out_QSV_0_1  (_m_3_io_out_QSV_0_1),
        .io_out_QSV_1_0  (_m_3_io_out_QSV_1_0),
        .io_out_QSV_1_1  (_m_3_io_out_QSV_1_1),
        .io_out_QSV_2_0  (_m_3_io_out_QSV_2_0),
        .io_out_QSV_2_1  (_m_3_io_out_QSV_2_1),
        .io_out_QSV_3_0  (_m_3_io_out_QSV_3_0),
        .io_out_QSV_3_1  (_m_3_io_out_QSV_3_1),
        .io_out_QSV_4_0  (_m_3_io_out_QSV_4_0),
        .io_out_QSV_4_1  (_m_3_io_out_QSV_4_1),
        .io_out_QSV_5_0  (_m_3_io_out_QSV_5_0),
        .io_out_QSV_5_1  (_m_3_io_out_QSV_5_1),
        .io_out_QSV_6_0  (_m_3_io_out_QSV_6_0),
        .io_out_QSV_6_1  (_m_3_io_out_QSV_6_1),
        .io_out_QSV_7_0  (_m_3_io_out_QSV_7_0),
        .io_out_QSV_7_1  (_m_3_io_out_QSV_7_1),
        .io_out_valid    (_m_3_io_out_valid)
    );

    // Stage 4: H on Q1
    HGate3QubitVector8bit m_4 (
        .clock           (clock),
        .reset           (reset),
        .io_in_QSV_0_0   (_m_3_io_out_QSV_0_0),
        .io_in_QSV_0_1   (_m_3_io_out_QSV_0_1),
        .io_in_QSV_1_0   (_m_3_io_out_QSV_1_0),
        .io_in_QSV_1_1   (_m_3_io_out_QSV_1_1),
        .io_in_QSV_2_0   (_m_3_io_out_QSV_2_0),
        .io_in_QSV_2_1   (_m_3_io_out_QSV_2_1),
        .io_in_QSV_3_0   (_m_3_io_out_QSV_3_0),
        .io_in_QSV_3_1   (_m_3_io_out_QSV_3_1),
        .io_in_QSV_4_0   (_m_3_io_out_QSV_4_0),
        .io_in_QSV_4_1   (_m_3_io_out_QSV_4_1),
        .io_in_QSV_5_0   (_m_3_io_out_QSV_5_0),
        .io_in_QSV_5_1   (_m_3_io_out_QSV_5_1),
        .io_in_QSV_6_0   (_m_3_io_out_QSV_6_0),
        .io_in_QSV_6_1   (_m_3_io_out_QSV_6_1),
        .io_in_QSV_7_0   (_m_3_io_out_QSV_7_0),
        .io_in_QSV_7_1   (_m_3_io_out_QSV_7_1),
        .io_in_valid     (_m_3_io_out_valid),
        .io_out_QSV_0_0  (_m_4_io_out_QSV_0_0),
        .io_out_QSV_0_1  (_m_4_io_out_QSV_0_1),
        .io_out_QSV_1_0  (_m_4_io_out_QSV_1_0),
        .io_out_QSV_1_1  (_m_4_io_out_QSV_1_1),
        .io_out_QSV_2_0  (_m_4_io_out_QSV_2_0),
        .io_out_QSV_2_1  (_m_4_io_out_QSV_2_1),
        .io_out_QSV_3_0  (_m_4_io_out_QSV_3_0),
        .io_out_QSV_3_1  (_m_4_io_out_QSV_3_1),
        .io_out_QSV_4_0  (_m_4_io_out_QSV_4_0),
        .io_out_QSV_4_1  (_m_4_io_out_QSV_4_1),
        .io_out_QSV_5_0  (_m_4_io_out_QSV_5_0),
        .io_out_QSV_5_1  (_m_4_io_out_QSV_5_1),
        .io_out_QSV_6_0  (_m_4_io_out_QSV_6_0),
        .io_out_QSV_6_1  (_m_4_io_out_QSV_6_1),
        .io_out_QSV_7_0  (_m_4_io_out_QSV_7_0),
        .io_out_QSV_7_1  (_m_4_io_out_QSV_7_1),
        .io_out_valid    (_m_4_io_out_valid)
    );

    // Stage 5: CS on Q2,1 (pruned ports io_in_QSV_3_1 and io_in_QSV_7_1 omitted)
    CSGate3QubitVector8bit m_5 (
        .clock           (clock),
        .reset           (reset),
        .io_in_QSV_0_0   (_m_4_io_out_QSV_0_0),
        .io_in_QSV_0_1   (_m_4_io_out_QSV_0_1),
        .io_in_QSV_1_0   (_m_4_io_out_QSV_1_0),
        .io_in_QSV_1_1   (_m_4_io_out_QSV_1_1),
        .io_in_QSV_2_0   (_m_4_io_out_QSV_2_0),
        .io_in_QSV_2_1   (_m_4_io_out_QSV_2_1),
        .io_in_QSV_3_0   (_m_4_io_out_QSV_3_0),
        .io_in_QSV_4_0   (_m_4_io_out_QSV_4_0),
        .io_in_QSV_4_1   (_m_4_io_out_QSV_4_1),
        .io_in_QSV_5_0   (_m_4_io_out_QSV_5_0),
        .io_in_QSV_5_1   (_m_4_io_out_QSV_5_1),
        .io_in_QSV_6_0   (_m_4_io_out_QSV_6_0),
        .io_in_QSV_6_1   (_m_4_io_out_QSV_6_1),
        .io_in_QSV_7_0   (_m_4_io_out_QSV_7_0),
        .io_in_valid     (_m_4_io_out_valid),
        .io_out_QSV_0_0  (_m_5_io_out_QSV_0_0),
        .io_out_QSV_0_1  (_m_5_io_out_QSV_0_1),
        .io_out_QSV_1_0  (_m_5_io_out_QSV_1_0),
        .io_out_QSV_1_1  (_m_5_io_out_QSV_1_1),
        .io_out_QSV_2_0  (_m_5_io_out_QSV_2_0),
        .io_out_QSV_2_1  (_m_5_io_out_QSV_2_1),
        .io_out_QSV_3_0  (_m_5_io_out_QSV_3_0),
        .io_out_QSV_3_1  (_m_5_io_out_QSV_3_1),
        .io_out_QSV_4_0  (_m_5_io_out_QSV_4_0),
        .io_out_QSV_4_1  (_m_5_io_out_QSV_4_1),
        .io_out_QSV_5_0  (_m_5_io_out_QSV_5_0),
        .io_out_QSV_5_1  (_m_5_io_out_QSV_5_1),
        .io_out_QSV_6_0  (_m_5_io_out_QSV_6_0),
        .io_out_QSV_6_1  (_m_5_io_out_QSV_6_1),
        .io_out_QSV_7_0  (_m_5_io_out_QSV_7_0),
        .io_out_QSV_7_1  (_m_5_io_out_QSV_7_1),
        .io_out_valid    (_m_5_io_out_valid)
    );

    // Stage 6: CompatiblePerm (Post-perm for H on Q1 / CS on Q2,1)
    CompatiblePerm m_6 (
        .clock           (clock),
        .reset           (reset),
        .io_in_QSV_0_0   (_m_5_io_out_QSV_0_0),
        .io_in_QSV_0_1   (_m_5_io_out_QSV_0_1),
        .io_in_QSV_1_0   (_m_5_io_out_QSV_1_0),
        .io_in_QSV_1_1   (_m_5_io_out_QSV_1_1),
        .io_in_QSV_2_0   (_m_5_io_out_QSV_2_0),
        .io_in_QSV_2_1   (_m_5_io_out_QSV_2_1),
        .io_in_QSV_3_0   (_m_5_io_out_QSV_3_0),
        .io_in_QSV_3_1   (_m_5_io_out_QSV_3_1),
        .io_in_QSV_4_0   (_m_5_io_out_QSV_4_0),
        .io_in_QSV_4_1   (_m_5_io_out_QSV_4_1),
        .io_in_QSV_5_0   (_m_5_io_out_QSV_5_0),
        .io_in_QSV_5_1   (_m_5_io_out_QSV_5_1),
        .io_in_QSV_6_0   (_m_5_io_out_QSV_6_0),
        .io_in_QSV_6_1   (_m_5_io_out_QSV_6_1),
        .io_in_QSV_7_0   (_m_5_io_out_QSV_7_0),
        .io_in_QSV_7_1   (_m_5_io_out_QSV_7_1),
        .io_in_valid     (_m_5_io_out_valid),
        .io_out_QSV_0_0  (_m_6_io_out_QSV_0_0),
        .io_out_QSV_0_1  (_m_6_io_out_QSV_0_1),
        .io_out_QSV_1_0  (_m_6_io_out_QSV_1_0),
        .io_out_QSV_1_1  (_m_6_io_out_QSV_1_1),
        .io_out_QSV_2_0  (_m_6_io_out_QSV_2_0),
        .io_out_QSV_2_1  (_m_6_io_out_QSV_2_1),
        .io_out_QSV_3_0  (_m_6_io_out_QSV_3_0),
        .io_out_QSV_3_1  (_m_6_io_out_QSV_3_1),
        .io_out_QSV_4_0  (_m_6_io_out_QSV_4_0),
        .io_out_QSV_4_1  (_m_6_io_out_QSV_4_1),
        .io_out_QSV_5_0  (_m_6_io_out_QSV_5_0),
        .io_out_QSV_5_1  (_m_6_io_out_QSV_5_1),
        .io_out_QSV_6_0  (_m_6_io_out_QSV_6_0),
        .io_out_QSV_6_1  (_m_6_io_out_QSV_6_1),
        .io_out_QSV_7_0  (_m_6_io_out_QSV_7_0),
        .io_out_QSV_7_1  (_m_6_io_out_QSV_7_1),
        .io_out_valid    (_m_6_io_out_valid)
    );

    // Stage 7: CompatiblePerm_1 (Pre-perm for H on Q2)
    CompatiblePerm_1 m_7 (
        .clock           (clock),
        .reset           (reset),
        .io_in_QSV_0_0   (_m_6_io_out_QSV_0_0),
        .io_in_QSV_0_1   (_m_6_io_out_QSV_0_1),
        .io_in_QSV_1_0   (_m_6_io_out_QSV_1_0),
        .io_in_QSV_1_1   (_m_6_io_out_QSV_1_1),
        .io_in_QSV_2_0   (_m_6_io_out_QSV_2_0),
        .io_in_QSV_2_1   (_m_6_io_out_QSV_2_1),
        .io_in_QSV_3_0   (_m_6_io_out_QSV_3_0),
        .io_in_QSV_3_1   (_m_6_io_out_QSV_3_1),
        .io_in_QSV_4_0   (_m_6_io_out_QSV_4_0),
        .io_in_QSV_4_1   (_m_6_io_out_QSV_4_1),
        .io_in_QSV_5_0   (_m_6_io_out_QSV_5_0),
        .io_in_QSV_5_1   (_m_6_io_out_QSV_5_1),
        .io_in_QSV_6_0   (_m_6_io_out_QSV_6_0),
        .io_in_QSV_6_1   (_m_6_io_out_QSV_6_1),
        .io_in_QSV_7_0   (_m_6_io_out_QSV_7_0),
        .io_in_QSV_7_1   (_m_6_io_out_QSV_7_1),
        .io_in_valid     (_m_6_io_out_valid),
        .io_out_QSV_0_0  (_m_7_io_out_QSV_0_0),
        .io_out_QSV_0_1  (_m_7_io_out_QSV_0_1),
        .io_out_QSV_1_0  (_m_7_io_out_QSV_1_0),
        .io_out_QSV_1_1  (_m_7_io_out_QSV_1_1),
        .io_out_QSV_2_0  (_m_7_io_out_QSV_2_0),
        .io_out_QSV_2_1  (_m_7_io_out_QSV_2_1),
        .io_out_QSV_3_0  (_m_7_io_out_QSV_3_0),
        .io_out_QSV_3_1  (_m_7_io_out_QSV_3_1),
        .io_out_QSV_4_0  (_m_7_io_out_QSV_4_0),
        .io_out_QSV_4_1  (_m_7_io_out_QSV_4_1),
        .io_out_QSV_5_0  (_m_7_io_out_QSV_5_0),
        .io_out_QSV_5_1  (_m_7_io_out_QSV_5_1),
        .io_out_QSV_6_0  (_m_7_io_out_QSV_6_0),
        .io_out_QSV_6_1  (_m_7_io_out_QSV_6_1),
        .io_out_QSV_7_0  (_m_7_io_out_QSV_7_0),
        .io_out_QSV_7_1  (_m_7_io_out_QSV_7_1),
        .io_out_valid    (_m_7_io_out_valid)
    );

    // Stage 8: H on Q2
    HGate3QubitVector8bit m_8 (
        .clock           (clock),
        .reset           (reset),
        .io_in_QSV_0_0   (_m_7_io_out_QSV_0_0),
        .io_in_QSV_0_1   (_m_7_io_out_QSV_0_1),
        .io_in_QSV_1_0   (_m_7_io_out_QSV_1_0),
        .io_in_QSV_1_1   (_m_7_io_out_QSV_1_1),
        .io_in_QSV_2_0   (_m_7_io_out_QSV_2_0),
        .io_in_QSV_2_1   (_m_7_io_out_QSV_2_1),
        .io_in_QSV_3_0   (_m_7_io_out_QSV_3_0),
        .io_in_QSV_3_1   (_m_7_io_out_QSV_3_1),
        .io_in_QSV_4_0   (_m_7_io_out_QSV_4_0),
        .io_in_QSV_4_1   (_m_7_io_out_QSV_4_1),
        .io_in_QSV_5_0   (_m_7_io_out_QSV_5_0),
        .io_in_QSV_5_1   (_m_7_io_out_QSV_5_1),
        .io_in_QSV_6_0   (_m_7_io_out_QSV_6_0),
        .io_in_QSV_6_1   (_m_7_io_out_QSV_6_1),
        .io_in_QSV_7_0   (_m_7_io_out_QSV_7_0),
        .io_in_QSV_7_1   (_m_7_io_out_QSV_7_1),
        .io_in_valid     (_m_7_io_out_valid),
        .io_out_QSV_0_0  (_m_8_io_out_QSV_0_0),
        .io_out_QSV_0_1  (_m_8_io_out_QSV_0_1),
        .io_out_QSV_1_0  (_m_8_io_out_QSV_1_0),
        .io_out_QSV_1_1  (_m_8_io_out_QSV_1_1),
        .io_out_QSV_2_0  (_m_8_io_out_QSV_2_0),
        .io_out_QSV_2_1  (_m_8_io_out_QSV_2_1),
        .io_out_QSV_3_0  (_m_8_io_out_QSV_3_0),
        .io_out_QSV_3_1  (_m_8_io_out_QSV_3_1),
        .io_out_QSV_4_0  (_m_8_io_out_QSV_4_0),
        .io_out_QSV_4_1  (_m_8_io_out_QSV_4_1),
        .io_out_QSV_5_0  (_m_8_io_out_QSV_5_0),
        .io_out_QSV_5_1  (_m_8_io_out_QSV_5_1),
        .io_out_QSV_6_0  (_m_8_io_out_QSV_6_0),
        .io_out_QSV_6_1  (_m_8_io_out_QSV_6_1),
        .io_out_QSV_7_0  (_m_8_io_out_QSV_7_0),
        .io_out_QSV_7_1  (_m_8_io_out_QSV_7_1),
        .io_out_valid    (_m_8_io_out_valid)
    );

    // Stage 9: CompatiblePerm_1 (Post-perm for H on Q2)
    CompatiblePerm_1 m_9 (
        .clock           (clock),
        .reset           (reset),
        .io_in_QSV_0_0   (_m_8_io_out_QSV_0_0),
        .io_in_QSV_0_1   (_m_8_io_out_QSV_0_1),
        .io_in_QSV_1_0   (_m_8_io_out_QSV_1_0),
        .io_in_QSV_1_1   (_m_8_io_out_QSV_1_1),
        .io_in_QSV_2_0   (_m_8_io_out_QSV_2_0),
        .io_in_QSV_2_1   (_m_8_io_out_QSV_2_1),
        .io_in_QSV_3_0   (_m_8_io_out_QSV_3_0),
        .io_in_QSV_3_1   (_m_8_io_out_QSV_3_1),
        .io_in_QSV_4_0   (_m_8_io_out_QSV_4_0),
        .io_in_QSV_4_1   (_m_8_io_out_QSV_4_1),
        .io_in_QSV_5_0   (_m_8_io_out_QSV_5_0),
        .io_in_QSV_5_1   (_m_8_io_out_QSV_5_1),
        .io_in_QSV_6_0   (_m_8_io_out_QSV_6_0),
        .io_in_QSV_6_1   (_m_8_io_out_QSV_6_1),
        .io_in_QSV_7_0   (_m_8_io_out_QSV_7_0),
        .io_in_QSV_7_1   (_m_8_io_out_QSV_7_1),
        .io_in_valid     (_m_8_io_out_valid),
        .io_out_QSV_0_0  (_m_9_io_out_QSV_0_0),
        .io_out_QSV_0_1  (_m_9_io_out_QSV_0_1),
        .io_out_QSV_1_0  (_m_9_io_out_QSV_1_0),
        .io_out_QSV_1_1  (_m_9_io_out_QSV_1_1),
        .io_out_QSV_2_0  (_m_9_io_out_QSV_2_0),
        .io_out_QSV_2_1  (_m_9_io_out_QSV_2_1),
        .io_out_QSV_3_0  (_m_9_io_out_QSV_3_0),
        .io_out_QSV_3_1  (_m_9_io_out_QSV_3_1),
        .io_out_QSV_4_0  (_m_9_io_out_QSV_4_0),
        .io_out_QSV_4_1  (_m_9_io_out_QSV_4_1),
        .io_out_QSV_5_0  (_m_9_io_out_QSV_5_0),
        .io_out_QSV_5_1  (_m_9_io_out_QSV_5_1),
        .io_out_QSV_6_0  (_m_9_io_out_QSV_6_0),
        .io_out_QSV_6_1  (_m_9_io_out_QSV_6_1),
        .io_out_QSV_7_0  (_m_9_io_out_QSV_7_0),
        .io_out_QSV_7_1  (_m_9_io_out_QSV_7_1),
        .io_out_valid    (_m_9_io_out_valid)
    );

    // Stage 10: SWAP on Q0,2 (Final Stage, drives top-level outputs)
    SWGate3QubitVector8bit m_10 (
        .clock           (clock),
        .reset           (reset),
        .io_in_QSV_0_0   (_m_9_io_out_QSV_0_0),
        .io_in_QSV_0_1   (_m_9_io_out_QSV_0_1),
        .io_in_QSV_1_0   (_m_9_io_out_QSV_1_0),
        .io_in_QSV_1_1   (_m_9_io_out_QSV_1_1),
        .io_in_QSV_2_0   (_m_9_io_out_QSV_2_0),
        .io_in_QSV_2_1   (_m_9_io_out_QSV_2_1),
        .io_in_QSV_3_0   (_m_9_io_out_QSV_3_0),
        .io_in_QSV_3_1   (_m_9_io_out_QSV_3_1),
        .io_in_QSV_4_0   (_m_9_io_out_QSV_4_0),
        .io_in_QSV_4_1   (_m_9_io_out_QSV_4_1),
        .io_in_QSV_5_0   (_m_9_io_out_QSV_5_0),
        .io_in_QSV_5_1   (_m_9_io_out_QSV_5_1),
        .io_in_QSV_6_0   (_m_9_io_out_QSV_6_0),
        .io_in_QSV_6_1   (_m_9_io_out_QSV_6_1),
        .io_in_QSV_7_0   (_m_9_io_out_QSV_7_0),
        .io_in_QSV_7_1   (_m_9_io_out_QSV_7_1),
        .io_in_valid     (_m_9_io_out_valid),
        .io_out_QSV_0_0  (io_out_QSV_0_0),
        .io_out_QSV_0_1  (io_out_QSV_0_1),
        .io_out_QSV_1_0  (io_out_QSV_1_0),
        .io_out_QSV_1_1  (io_out_QSV_1_1),
        .io_out_QSV_2_0  (io_out_QSV_2_0),
        .io_out_QSV_2_1  (io_out_QSV_2_1),
        .io_out_QSV_3_0  (io_out_QSV_3_0),
        .io_out_QSV_3_1  (io_out_QSV_3_1),
        .io_out_QSV_4_0  (io_out_QSV_4_0),
        .io_out_QSV_4_1  (io_out_QSV_4_1),
        .io_out_QSV_5_0  (io_out_QSV_5_0),
        .io_out_QSV_5_1  (io_out_QSV_5_1),
        .io_out_QSV_6_0  (io_out_QSV_6_0),
        .io_out_QSV_6_1  (io_out_QSV_6_1),
        .io_out_QSV_7_0  (io_out_QSV_7_0),
        .io_out_QSV_7_1  (io_out_QSV_7_1),
        .io_out_valid    (io_out_valid)
    );

endmodule
