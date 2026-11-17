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

    // Stage 0 Wires (H on 0)
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
    wire _m_io_out_valid;

    HGate3QubitVector8bit m (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (io_in_QSV_0_0),
        .io_in_QSV_0_1 (io_in_QSV_0_1),
        .io_in_QSV_1_0 (io_in_QSV_1_0),
        .io_in_QSV_1_1 (io_in_QSV_1_1),
        .io_in_QSV_2_0 (io_in_QSV_2_0),
        .io_in_QSV_2_1 (io_in_QSV_2_1),
        .io_in_QSV_3_0 (io_in_QSV_3_0),
        .io_in_QSV_3_1 (io_in_QSV_3_1),
        .io_in_QSV_4_0 (io_in_QSV_4_0),
        .io_in_QSV_4_1 (io_in_QSV_4_1),
        .io_in_QSV_5_0 (io_in_QSV_5_0),
        .io_in_QSV_5_1 (io_in_QSV_5_1),
        .io_in_QSV_6_0 (io_in_QSV_6_0),
        .io_in_QSV_6_1 (io_in_QSV_6_1),
        .io_in_QSV_7_0 (io_in_QSV_7_0),
        .io_in_QSV_7_1 (io_in_QSV_7_1),
        .io_in_valid   (io_in_valid),
        .io_out_QSV_0_0 (_m_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_io_out_QSV_7_1),
        .io_out_valid   (_m_io_out_valid)
    );

    // Stage 1 Wires (CS on 1, 0 - perm in)
    wire [7:0] _m_1_io_out_QSV_0_0;
    wire [7:0] _m_1_io_out_QSV_0_1;
    wire [7:0] _m_1_io_out_QSV_1_0;
    wire [7:0] _m_1_io_out_QSV_1_1;
    wire [7:0] _m_1_io_out_QSV_2_0;
    wire [7:0] _m_1_io_out_QSV_2_1;
    wire [7:0] _m_1_io_out_QSV_3_0;
    wire [7:0] _m_1_io_out_QSV_3_1;
    wire [7:0] _m_1_io_out_QSV_4_0;
    wire [7:0] _m_1_io_out_QSV_4_1;
    wire [7:0] _m_1_io_out_QSV_5_0;
    wire [7:0] _m_1_io_out_QSV_5_1;
    wire [7:0] _m_1_io_out_QSV_6_0;
    wire [7:0] _m_1_io_out_QSV_6_1;
    wire [7:0] _m_1_io_out_QSV_7_0;
    wire [7:0] _m_1_io_out_QSV_7_1;
    wire _m_1_io_out_valid;

    CompatiblePerm m_1 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_io_out_QSV_7_1),
        .io_in_valid   (_m_io_out_valid),
        .io_out_QSV_0_0 (_m_1_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_1_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_1_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_1_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_1_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_1_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_1_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_1_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_1_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_1_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_1_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_1_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_1_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_1_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_1_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_1_io_out_QSV_7_1),
        .io_out_valid   (_m_1_io_out_valid)
    );

    // Stage 2 Wires (CS on 1, 0 - gate)
    wire [7:0] _m_2_io_out_QSV_0_0;
    wire [7:0] _m_2_io_out_QSV_0_1;
    wire [7:0] _m_2_io_out_QSV_1_0;
    wire [7:0] _m_2_io_out_QSV_1_1;
    wire [7:0] _m_2_io_out_QSV_2_0;
    wire [7:0] _m_2_io_out_QSV_2_1;
    wire [7:0] _m_2_io_out_QSV_3_0;
    wire [7:0] _m_2_io_out_QSV_3_1;
    wire [7:0] _m_2_io_out_QSV_4_0;
    wire [7:0] _m_2_io_out_QSV_4_1;
    wire [7:0] _m_2_io_out_QSV_5_0;
    wire [7:0] _m_2_io_out_QSV_5_1;
    wire [7:0] _m_2_io_out_QSV_6_0;
    wire [7:0] _m_2_io_out_QSV_6_1;
    wire [7:0] _m_2_io_out_QSV_7_0;
    wire [7:0] _m_2_io_out_QSV_7_1;
    wire _m_2_io_out_valid;

    CSGate3QubitVector8bit m_2 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_1_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_1_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_1_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_1_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_1_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_1_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_1_io_out_QSV_3_0),
        .io_in_QSV_4_0 (_m_1_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_1_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_1_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_1_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_1_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_1_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_1_io_out_QSV_7_0),
        .io_in_valid   (_m_1_io_out_valid),
        .io_out_QSV_0_0 (_m_2_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_2_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_2_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_2_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_2_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_2_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_2_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_2_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_2_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_2_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_2_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_2_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_2_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_2_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_2_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_2_io_out_QSV_7_1),
        .io_out_valid   (_m_2_io_out_valid)
    );

    // Stage 3 Wires (CS on 1, 0 - perm out)
    wire [7:0] _m_3_io_out_QSV_0_0;
    wire [7:0] _m_3_io_out_QSV_0_1;
    wire [7:0] _m_3_io_out_QSV_1_0;
    wire [7:0] _m_3_io_out_QSV_1_1;
    wire [7:0] _m_3_io_out_QSV_2_0;
    wire [7:0] _m_3_io_out_QSV_2_1;
    wire [7:0] _m_3_io_out_QSV_3_0;
    wire [7:0] _m_3_io_out_QSV_3_1;
    wire [7:0] _m_3_io_out_QSV_4_0;
    wire [7:0] _m_3_io_out_QSV_4_1;
    wire [7:0] _m_3_io_out_QSV_5_0;
    wire [7:0] _m_3_io_out_QSV_5_1;
    wire [7:0] _m_3_io_out_QSV_6_0;
    wire [7:0] _m_3_io_out_QSV_6_1;
    wire [7:0] _m_3_io_out_QSV_7_0;
    wire [7:0] _m_3_io_out_QSV_7_1;
    wire _m_3_io_out_valid;

    CompatiblePerm m_3 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_2_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_2_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_2_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_2_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_2_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_2_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_2_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_2_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_2_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_2_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_2_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_2_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_2_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_2_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_2_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_2_io_out_QSV_7_1),
        .io_in_valid   (_m_2_io_out_valid),
        .io_out_QSV_0_0 (_m_3_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_3_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_3_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_3_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_3_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_3_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_3_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_3_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_3_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_3_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_3_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_3_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_3_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_3_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_3_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_3_io_out_QSV_7_1),
        .io_out_valid   (_m_3_io_out_valid)
    );

    // Stage 4 Wires (CP on 2, 0 - perm in)
    wire [7:0] _m_4_io_out_QSV_0_0;
    wire [7:0] _m_4_io_out_QSV_0_1;
    wire [7:0] _m_4_io_out_QSV_1_0;
    wire [7:0] _m_4_io_out_QSV_1_1;
    wire [7:0] _m_4_io_out_QSV_2_0;
    wire [7:0] _m_4_io_out_QSV_2_1;
    wire [7:0] _m_4_io_out_QSV_3_0;
    wire [7:0] _m_4_io_out_QSV_3_1;
    wire [7:0] _m_4_io_out_QSV_4_0;
    wire [7:0] _m_4_io_out_QSV_4_1;
    wire [7:0] _m_4_io_out_QSV_5_0;
    wire [7:0] _m_4_io_out_QSV_5_1;
    wire [7:0] _m_4_io_out_QSV_6_0;
    wire [7:0] _m_4_io_out_QSV_6_1;
    wire [7:0] _m_4_io_out_QSV_7_0;
    wire [7:0] _m_4_io_out_QSV_7_1;
    wire _m_4_io_out_valid;

    CompatiblePerm m_4 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_3_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_3_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_3_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_3_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_3_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_3_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_3_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_3_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_3_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_3_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_3_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_3_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_3_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_3_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_3_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_3_io_out_QSV_7_1),
        .io_in_valid   (_m_3_io_out_valid),
        .io_out_QSV_0_0 (_m_4_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_4_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_4_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_4_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_4_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_4_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_4_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_4_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_4_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_4_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_4_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_4_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_4_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_4_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_4_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_4_io_out_QSV_7_1),
        .io_out_valid   (_m_4_io_out_valid)
    );

    // Stage 5 Wires (CP on 2, 0 - gate)
    wire [7:0] _m_5_io_out_QSV_0_0;
    wire [7:0] _m_5_io_out_QSV_0_1;
    wire [7:0] _m_5_io_out_QSV_1_0;
    wire [7:0] _m_5_io_out_QSV_1_1;
    wire [7:0] _m_5_io_out_QSV_2_0;
    wire [7:0] _m_5_io_out_QSV_2_1;
    wire [7:0] _m_5_io_out_QSV_3_0;
    wire [7:0] _m_5_io_out_QSV_3_1;
    wire [7:0] _m_5_io_out_QSV_4_0;
    wire [7:0] _m_5_io_out_QSV_4_1;
    wire [7:0] _m_5_io_out_QSV_5_0;
    wire [7:0] _m_5_io_out_QSV_5_1;
    wire [7:0] _m_5_io_out_QSV_6_0;
    wire [7:0] _m_5_io_out_QSV_6_1;
    wire [7:0] _m_5_io_out_QSV_7_0;
    wire [7:0] _m_5_io_out_QSV_7_1;
    wire _m_5_io_out_valid;

    CTGate3QubitVector8bit m_5 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_4_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_4_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_4_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_4_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_4_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_4_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_4_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_4_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_4_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_4_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_4_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_4_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_4_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_4_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_4_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_4_io_out_QSV_7_1),
        .io_in_valid   (_m_4_io_out_valid),
        .io_out_QSV_0_0 (_m_5_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_5_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_5_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_5_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_5_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_5_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_5_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_5_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_5_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_5_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_5_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_5_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_5_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_5_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_5_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_5_io_out_QSV_7_1),
        .io_out_valid   (_m_5_io_out_valid)
    );

    // Stage 6 Wires (CP on 2, 0 - perm out)
    wire [7:0] _m_6_io_out_QSV_0_0;
    wire [7:0] _m_6_io_out_QSV_0_1;
    wire [7:0] _m_6_io_out_QSV_1_0;
    wire [7:0] _m_6_io_out_QSV_1_1;
    wire [7:0] _m_6_io_out_QSV_2_0;
    wire [7:0] _m_6_io_out_QSV_2_1;
    wire [7:0] _m_6_io_out_QSV_3_0;
    wire [7:0] _m_6_io_out_QSV_3_1;
    wire [7:0] _m_6_io_out_QSV_4_0;
    wire [7:0] _m_6_io_out_QSV_4_1;
    wire [7:0] _m_6_io_out_QSV_5_0;
    wire [7:0] _m_6_io_out_QSV_5_1;
    wire [7:0] _m_6_io_out_QSV_6_0;
    wire [7:0] _m_6_io_out_QSV_6_1;
    wire [7:0] _m_6_io_out_QSV_7_0;
    wire [7:0] _m_6_io_out_QSV_7_1;
    wire _m_6_io_out_valid;

    CompatiblePerm m_6 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_5_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_5_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_5_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_5_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_5_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_5_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_5_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_5_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_5_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_5_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_5_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_5_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_5_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_5_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_5_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_5_io_out_QSV_7_1),
        .io_in_valid   (_m_5_io_out_valid),
        .io_out_QSV_0_0 (_m_6_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_6_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_6_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_6_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_6_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_6_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_6_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_6_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_6_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_6_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_6_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_6_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_6_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_6_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_6_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_6_io_out_QSV_7_1),
        .io_out_valid   (_m_6_io_out_valid)
    );

    // Stage 7 Wires (H on 1 - perm in)
    wire [7:0] _m_7_io_out_QSV_0_0;
    wire [7:0] _m_7_io_out_QSV_0_1;
    wire [7:0] _m_7_io_out_QSV_1_0;
    wire [7:0] _m_7_io_out_QSV_1_1;
    wire [7:0] _m_7_io_out_QSV_2_0;
    wire [7:0] _m_7_io_out_QSV_2_1;
    wire [7:0] _m_7_io_out_QSV_3_0;
    wire [7:0] _m_7_io_out_QSV_3_1;
    wire [7:0] _m_7_io_out_QSV_4_0;
    wire [7:0] _m_7_io_out_QSV_4_1;
    wire [7:0] _m_7_io_out_QSV_5_0;
    wire [7:0] _m_7_io_out_QSV_5_1;
    wire [7:0] _m_7_io_out_QSV_6_0;
    wire [7:0] _m_7_io_out_QSV_6_1;
    wire [7:0] _m_7_io_out_QSV_7_0;
    wire [7:0] _m_7_io_out_QSV_7_1;
    wire _m_7_io_out_valid;

    CompatiblePerm_2 m_7 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_6_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_6_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_6_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_6_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_6_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_6_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_6_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_6_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_6_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_6_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_6_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_6_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_6_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_6_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_6_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_6_io_out_QSV_7_1),
        .io_in_valid   (_m_6_io_out_valid),
        .io_out_QSV_0_0 (_m_7_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_7_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_7_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_7_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_7_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_7_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_7_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_7_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_7_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_7_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_7_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_7_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_7_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_7_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_7_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_7_io_out_QSV_7_1),
        .io_out_valid   (_m_7_io_out_valid)
    );

    // Stage 8 Wires (H on 1 - gate)
    wire [7:0] _m_8_io_out_QSV_0_0;
    wire [7:0] _m_8_io_out_QSV_0_1;
    wire [7:0] _m_8_io_out_QSV_1_0;
    wire [7:0] _m_8_io_out_QSV_1_1;
    wire [7:0] _m_8_io_out_QSV_2_0;
    wire [7:0] _m_8_io_out_QSV_2_1;
    wire [7:0] _m_8_io_out_QSV_3_0;
    wire [7:0] _m_8_io_out_QSV_3_1;
    wire [7:0] _m_8_io_out_QSV_4_0;
    wire [7:0] _m_8_io_out_QSV_4_1;
    wire [7:0] _m_8_io_out_QSV_5_0;
    wire [7:0] _m_8_io_out_QSV_5_1;
    wire [7:0] _m_8_io_out_QSV_6_0;
    wire [7:0] _m_8_io_out_QSV_6_1;
    wire [7:0] _m_8_io_out_QSV_7_0;
    wire [7:0] _m_8_io_out_QSV_7_1;
    wire _m_8_io_out_valid;

    HGate3QubitVector8bit m_8 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_7_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_7_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_7_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_7_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_7_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_7_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_7_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_7_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_7_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_7_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_7_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_7_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_7_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_7_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_7_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_7_io_out_QSV_7_1),
        .io_in_valid   (_m_7_io_out_valid),
        .io_out_QSV_0_0 (_m_8_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_8_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_8_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_8_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_8_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_8_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_8_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_8_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_8_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_8_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_8_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_8_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_8_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_8_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_8_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_8_io_out_QSV_7_1),
        .io_out_valid   (_m_8_io_out_valid)
    );

    // Stage 9 Wires (H on 1 - perm out)
    wire [7:0] _m_9_io_out_QSV_0_0;
    wire [7:0] _m_9_io_out_QSV_0_1;
    wire [7:0] _m_9_io_out_QSV_1_0;
    wire [7:0] _m_9_io_out_QSV_1_1;
    wire [7:0] _m_9_io_out_QSV_2_0;
    wire [7:0] _m_9_io_out_QSV_2_1;
    wire [7:0] _m_9_io_out_QSV_3_0;
    wire [7:0] _m_9_io_out_QSV_3_1;
    wire [7:0] _m_9_io_out_QSV_4_0;
    wire [7:0] _m_9_io_out_QSV_4_1;
    wire [7:0] _m_9_io_out_QSV_5_0;
    wire [7:0] _m_9_io_out_QSV_5_1;
    wire [7:0] _m_9_io_out_QSV_6_0;
    wire [7:0] _m_9_io_out_QSV_6_1;
    wire [7:0] _m_9_io_out_QSV_7_0;
    wire [7:0] _m_9_io_out_QSV_7_1;
    wire _m_9_io_out_valid;

    CompatiblePerm_2 m_9 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_8_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_8_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_8_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_8_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_8_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_8_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_8_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_8_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_8_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_8_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_8_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_8_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_8_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_8_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_8_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_8_io_out_QSV_7_1),
        .io_in_valid   (_m_8_io_out_valid),
        .io_out_QSV_0_0 (_m_9_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_9_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_9_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_9_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_9_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_9_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_9_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_9_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_9_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_9_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_9_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_9_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_9_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_9_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_9_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_9_io_out_QSV_7_1),
        .io_out_valid   (_m_9_io_out_valid)
    );

    // Stage 10 Wires (CS on 2, 1 - perm in)
    wire [7:0] _m_10_io_out_QSV_0_0;
    wire [7:0] _m_10_io_out_QSV_0_1;
    wire [7:0] _m_10_io_out_QSV_1_0;
    wire [7:0] _m_10_io_out_QSV_1_1;
    wire [7:0] _m_10_io_out_QSV_2_0;
    wire [7:0] _m_10_io_out_QSV_2_1;
    wire [7:0] _m_10_io_out_QSV_3_0;
    wire [7:0] _m_10_io_out_QSV_3_1;
    wire [7:0] _m_10_io_out_QSV_4_0;
    wire [7:0] _m_10_io_out_QSV_4_1;
    wire [7:0] _m_10_io_out_QSV_5_0;
    wire [7:0] _m_10_io_out_QSV_5_1;
    wire [7:0] _m_10_io_out_QSV_6_0;
    wire [7:0] _m_10_io_out_QSV_6_1;
    wire [7:0] _m_10_io_out_QSV_7_0;
    wire [7:0] _m_10_io_out_QSV_7_1;
    wire _m_10_io_out_valid;

    CompatiblePerm_2 m_10 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_9_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_9_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_9_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_9_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_9_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_9_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_9_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_9_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_9_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_9_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_9_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_9_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_9_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_9_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_9_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_9_io_out_QSV_7_1),
        .io_in_valid   (_m_9_io_out_valid),
        .io_out_QSV_0_0 (_m_10_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_10_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_10_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_10_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_10_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_10_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_10_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_10_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_10_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_10_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_10_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_10_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_10_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_10_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_10_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_10_io_out_QSV_7_1),
        .io_out_valid   (_m_10_io_out_valid)
    );

    // Stage 11 Wires (CS on 2, 1 - gate)
    wire [7:0] _m_11_io_out_QSV_0_0;
    wire [7:0] _m_11_io_out_QSV_0_1;
    wire [7:0] _m_11_io_out_QSV_1_0;
    wire [7:0] _m_11_io_out_QSV_1_1;
    wire [7:0] _m_11_io_out_QSV_2_0;
    wire [7:0] _m_11_io_out_QSV_2_1;
    wire [7:0] _m_11_io_out_QSV_3_0;
    wire [7:0] _m_11_io_out_QSV_3_1;
    wire [7:0] _m_11_io_out_QSV_4_0;
    wire [7:0] _m_11_io_out_QSV_4_1;
    wire [7:0] _m_11_io_out_QSV_5_0;
    wire [7:0] _m_11_io_out_QSV_5_1;
    wire [7:0] _m_11_io_out_QSV_6_0;
    wire [7:0] _m_11_io_out_QSV_6_1;
    wire [7:0] _m_11_io_out_QSV_7_0;
    wire [7:0] _m_11_io_out_QSV_7_1;
    wire _m_11_io_out_valid;

    CSGate3QubitVector8bit m_11 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_10_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_10_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_10_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_10_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_10_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_10_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_10_io_out_QSV_3_0),
        .io_in_QSV_4_0 (_m_10_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_10_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_10_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_10_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_10_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_10_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_10_io_out_QSV_7_0),
        .io_in_valid   (_m_10_io_out_valid),
        .io_out_QSV_0_0 (_m_11_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_11_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_11_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_11_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_11_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_11_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_11_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_11_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_11_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_11_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_11_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_11_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_11_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_11_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_11_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_11_io_out_QSV_7_1),
        .io_out_valid   (_m_11_io_out_valid)
    );

    // Stage 12 Wires (CS on 2, 1 - perm out)
    wire [7:0] _m_12_io_out_QSV_0_0;
    wire [7:0] _m_12_io_out_QSV_0_1;
    wire [7:0] _m_12_io_out_QSV_1_0;
    wire [7:0] _m_12_io_out_QSV_1_1;
    wire [7:0] _m_12_io_out_QSV_2_0;
    wire [7:0] _m_12_io_out_QSV_2_1;
    wire [7:0] _m_12_io_out_QSV_3_0;
    wire [7:0] _m_12_io_out_QSV_3_1;
    wire [7:0] _m_12_io_out_QSV_4_0;
    wire [7:0] _m_12_io_out_QSV_4_1;
    wire [7:0] _m_12_io_out_QSV_5_0;
    wire [7:0] _m_12_io_out_QSV_5_1;
    wire [7:0] _m_12_io_out_QSV_6_0;
    wire [7:0] _m_12_io_out_QSV_6_1;
    wire [7:0] _m_12_io_out_QSV_7_0;
    wire [7:0] _m_12_io_out_QSV_7_1;
    wire _m_12_io_out_valid;

    CompatiblePerm_2 m_12 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_11_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_11_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_11_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_11_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_11_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_11_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_11_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_11_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_11_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_11_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_11_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_11_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_11_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_11_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_11_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_11_io_out_QSV_7_1),
        .io_in_valid   (_m_11_io_out_valid),
        .io_out_QSV_0_0 (_m_12_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_12_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_12_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_12_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_12_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_12_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_12_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_12_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_12_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_12_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_12_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_12_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_12_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_12_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_12_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_12_io_out_QSV_7_1),
        .io_out_valid   (_m_12_io_out_valid)
    );

    // Stage 13 Wires (H on 2 - perm in)
    wire [7:0] _m_13_io_out_QSV_0_0;
    wire [7:0] _m_13_io_out_QSV_0_1;
    wire [7:0] _m_13_io_out_QSV_1_0;
    wire [7:0] _m_13_io_out_QSV_1_1;
    wire [7:0] _m_13_io_out_QSV_2_0;
    wire [7:0] _m_13_io_out_QSV_2_1;
    wire [7:0] _m_13_io_out_QSV_3_0;
    wire [7:0] _m_13_io_out_QSV_3_1;
    wire [7:0] _m_13_io_out_QSV_4_0;
    wire [7:0] _m_13_io_out_QSV_4_1;
    wire [7:0] _m_13_io_out_QSV_5_0;
    wire [7:0] _m_13_io_out_QSV_5_1;
    wire [7:0] _m_13_io_out_QSV_6_0;
    wire [7:0] _m_13_io_out_QSV_6_1;
    wire [7:0] _m_13_io_out_QSV_7_0;
    wire [7:0] _m_13_io_out_QSV_7_1;
    wire _m_13_io_out_valid;

    CompatiblePerm_1 m_13 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_12_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_12_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_12_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_12_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_12_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_12_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_12_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_12_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_12_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_12_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_12_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_12_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_12_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_12_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_12_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_12_io_out_QSV_7_1),
        .io_in_valid   (_m_12_io_out_valid),
        .io_out_QSV_0_0 (_m_13_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_13_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_13_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_13_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_13_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_13_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_13_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_13_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_13_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_13_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_13_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_13_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_13_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_13_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_13_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_13_io_out_QSV_7_1),
        .io_out_valid   (_m_13_io_out_valid)
    );

    // Stage 14 Wires (H on 2 - gate)
    wire [7:0] _m_14_io_out_QSV_0_0;
    wire [7:0] _m_14_io_out_QSV_0_1;
    wire [7:0] _m_14_io_out_QSV_1_0;
    wire [7:0] _m_14_io_out_QSV_1_1;
    wire [7:0] _m_14_io_out_QSV_2_0;
    wire [7:0] _m_14_io_out_QSV_2_1;
    wire [7:0] _m_14_io_out_QSV_3_0;
    wire [7:0] _m_14_io_out_QSV_3_1;
    wire [7:0] _m_14_io_out_QSV_4_0;
    wire [7:0] _m_14_io_out_QSV_4_1;
    wire [7:0] _m_14_io_out_QSV_5_0;
    wire [7:0] _m_14_io_out_QSV_5_1;
    wire [7:0] _m_14_io_out_QSV_6_0;
    wire [7:0] _m_14_io_out_QSV_6_1;
    wire [7:0] _m_14_io_out_QSV_7_0;
    wire [7:0] _m_14_io_out_QSV_7_1;
    wire _m_14_io_out_valid;

    HGate3QubitVector8bit m_14 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_13_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_13_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_13_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_13_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_13_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_13_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_13_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_13_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_13_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_13_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_13_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_13_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_13_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_13_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_13_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_13_io_out_QSV_7_1),
        .io_in_valid   (_m_13_io_out_valid),
        .io_out_QSV_0_0 (_m_14_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_14_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_14_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_14_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_14_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_14_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_14_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_14_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_14_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_14_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_14_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_14_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_14_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_14_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_14_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_14_io_out_QSV_7_1),
        .io_out_valid   (_m_14_io_out_valid)
    );

    // Stage 15 Wires (H on 2 - perm out)
    wire [7:0] _m_15_io_out_QSV_0_0;
    wire [7:0] _m_15_io_out_QSV_0_1;
    wire [7:0] _m_15_io_out_QSV_1_0;
    wire [7:0] _m_15_io_out_QSV_1_1;
    wire [7:0] _m_15_io_out_QSV_2_0;
    wire [7:0] _m_15_io_out_QSV_2_1;
    wire [7:0] _m_15_io_out_QSV_3_0;
    wire [7:0] _m_15_io_out_QSV_3_1;
    wire [7:0] _m_15_io_out_QSV_4_0;
    wire [7:0] _m_15_io_out_QSV_4_1;
    wire [7:0] _m_15_io_out_QSV_5_0;
    wire [7:0] _m_15_io_out_QSV_5_1;
    wire [7:0] _m_15_io_out_QSV_6_0;
    wire [7:0] _m_15_io_out_QSV_6_1;
    wire [7:0] _m_15_io_out_QSV_7_0;
    wire [7:0] _m_15_io_out_QSV_7_1;
    wire _m_15_io_out_valid;

    CompatiblePerm_1 m_15 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_14_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_14_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_14_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_14_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_14_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_14_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_14_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_14_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_14_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_14_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_14_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_14_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_14_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_14_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_14_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_14_io_out_QSV_7_1),
        .io_in_valid   (_m_14_io_out_valid),
        .io_out_QSV_0_0 (_m_15_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_15_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_15_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_15_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_15_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_15_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_15_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_15_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_15_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_15_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_15_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_15_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_15_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_15_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_15_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_15_io_out_QSV_7_1),
        .io_out_valid   (_m_15_io_out_valid)
    );

    // Stage 16 Wires (SWAP on 0, 2 - perm in)
    wire [7:0] _m_16_io_out_QSV_0_0;
    wire [7:0] _m_16_io_out_QSV_0_1;
    wire [7:0] _m_16_io_out_QSV_1_0;
    wire [7:0] _m_16_io_out_QSV_1_1;
    wire [7:0] _m_16_io_out_QSV_2_0;
    wire [7:0] _m_16_io_out_QSV_2_1;
    wire [7:0] _m_16_io_out_QSV_3_0;
    wire [7:0] _m_16_io_out_QSV_3_1;
    wire [7:0] _m_16_io_out_QSV_4_0;
    wire [7:0] _m_16_io_out_QSV_4_1;
    wire [7:0] _m_16_io_out_QSV_5_0;
    wire [7:0] _m_16_io_out_QSV_5_1;
    wire [7:0] _m_16_io_out_QSV_6_0;
    wire [7:0] _m_16_io_out_QSV_6_1;
    wire [7:0] _m_16_io_out_QSV_7_0;
    wire [7:0] _m_16_io_out_QSV_7_1;
    wire _m_16_io_out_valid;

    CompatiblePerm m_16 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_15_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_15_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_15_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_15_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_15_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_15_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_15_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_15_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_15_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_15_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_15_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_15_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_15_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_15_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_15_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_15_io_out_QSV_7_1),
        .io_in_valid   (_m_15_io_out_valid),
        .io_out_QSV_0_0 (_m_16_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_16_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_16_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_16_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_16_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_16_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_16_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_16_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_16_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_16_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_16_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_16_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_16_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_16_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_16_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_16_io_out_QSV_7_1),
        .io_out_valid   (_m_16_io_out_valid)
    );

    // Stage 17 Wires (SWAP on 0, 2 - gate)
    wire [7:0] _m_17_io_out_QSV_0_0;
    wire [7:0] _m_17_io_out_QSV_0_1;
    wire [7:0] _m_17_io_out_QSV_1_0;
    wire [7:0] _m_17_io_out_QSV_1_1;
    wire [7:0] _m_17_io_out_QSV_2_0;
    wire [7:0] _m_17_io_out_QSV_2_1;
    wire [7:0] _m_17_io_out_QSV_3_0;
    wire [7:0] _m_17_io_out_QSV_3_1;
    wire [7:0] _m_17_io_out_QSV_4_0;
    wire [7:0] _m_17_io_out_QSV_4_1;
    wire [7:0] _m_17_io_out_QSV_5_0;
    wire [7:0] _m_17_io_out_QSV_5_1;
    wire [7:0] _m_17_io_out_QSV_6_0;
    wire [7:0] _m_17_io_out_QSV_6_1;
    wire [7:0] _m_17_io_out_QSV_7_0;
    wire [7:0] _m_17_io_out_QSV_7_1;
    wire _m_17_io_out_valid;

    SWGate3QubitVector8bit m_17 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_16_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_16_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_16_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_16_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_16_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_16_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_16_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_16_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_16_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_16_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_16_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_16_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_16_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_16_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_16_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_16_io_out_QSV_7_1),
        .io_in_valid   (_m_16_io_out_valid),
        .io_out_QSV_0_0 (_m_17_io_out_QSV_0_0),
        .io_out_QSV_0_1 (_m_17_io_out_QSV_0_1),
        .io_out_QSV_1_0 (_m_17_io_out_QSV_1_0),
        .io_out_QSV_1_1 (_m_17_io_out_QSV_1_1),
        .io_out_QSV_2_0 (_m_17_io_out_QSV_2_0),
        .io_out_QSV_2_1 (_m_17_io_out_QSV_2_1),
        .io_out_QSV_3_0 (_m_17_io_out_QSV_3_0),
        .io_out_QSV_3_1 (_m_17_io_out_QSV_3_1),
        .io_out_QSV_4_0 (_m_17_io_out_QSV_4_0),
        .io_out_QSV_4_1 (_m_17_io_out_QSV_4_1),
        .io_out_QSV_5_0 (_m_17_io_out_QSV_5_0),
        .io_out_QSV_5_1 (_m_17_io_out_QSV_5_1),
        .io_out_QSV_6_0 (_m_17_io_out_QSV_6_0),
        .io_out_QSV_6_1 (_m_17_io_out_QSV_6_1),
        .io_out_QSV_7_0 (_m_17_io_out_QSV_7_0),
        .io_out_QSV_7_1 (_m_17_io_out_QSV_7_1),
        .io_out_valid   (_m_17_io_out_valid)
    );

    // Stage 18 (SWAP on 0, 2 - perm out)
    CompatiblePerm m_18 (
        .clock (clock),
        .reset (reset),
        .io_in_QSV_0_0 (_m_17_io_out_QSV_0_0),
        .io_in_QSV_0_1 (_m_17_io_out_QSV_0_1),
        .io_in_QSV_1_0 (_m_17_io_out_QSV_1_0),
        .io_in_QSV_1_1 (_m_17_io_out_QSV_1_1),
        .io_in_QSV_2_0 (_m_17_io_out_QSV_2_0),
        .io_in_QSV_2_1 (_m_17_io_out_QSV_2_1),
        .io_in_QSV_3_0 (_m_17_io_out_QSV_3_0),
        .io_in_QSV_3_1 (_m_17_io_out_QSV_3_1),
        .io_in_QSV_4_0 (_m_17_io_out_QSV_4_0),
        .io_in_QSV_4_1 (_m_17_io_out_QSV_4_1),
        .io_in_QSV_5_0 (_m_17_io_out_QSV_5_0),
        .io_in_QSV_5_1 (_m_17_io_out_QSV_5_1),
        .io_in_QSV_6_0 (_m_17_io_out_QSV_6_0),
        .io_in_QSV_6_1 (_m_17_io_out_QSV_6_1),
        .io_in_QSV_7_0 (_m_17_io_out_QSV_7_0),
        .io_in_QSV_7_1 (_m_17_io_out_QSV_7_1),
        .io_in_valid   (_m_17_io_out_valid),
        .io_out_QSV_0_0 (io_out_QSV_0_0),
        .io_out_QSV_0_1 (io_out_QSV_0_1),
        .io_out_QSV_1_0 (io_out_QSV_1_0),
        .io_out_QSV_1_1 (io_out_QSV_1_1),
        .io_out_QSV_2_0 (io_out_QSV_2_0),
        .io_out_QSV_2_1 (io_out_QSV_2_1),
        .io_out_QSV_3_0 (io_out_QSV_3_0),
        .io_out_QSV_3_1 (io_out_QSV_3_1),
        .io_out_QSV_4_0 (io_out_QSV_4_0),
        .io_out_QSV_4_1 (io_out_QSV_4_1),
        .io_out_QSV_5_0 (io_out_QSV_5_0),
        .io_out_QSV_5_1 (io_out_QSV_5_1),
        .io_out_QSV_6_0 (io_out_QSV_6_0),
        .io_out_QSV_6_1 (io_out_QSV_6_1),
        .io_out_QSV_7_0 (io_out_QSV_7_0),
        .io_out_QSV_7_1 (io_out_QSV_7_1),
        .io_out_valid   (io_out_valid)
    );

endmodule
