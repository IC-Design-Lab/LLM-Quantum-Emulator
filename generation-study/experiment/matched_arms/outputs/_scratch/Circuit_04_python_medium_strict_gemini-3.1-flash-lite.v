module Circuit_04 (
    input logic clock,
    input logic reset,
    input logic [15:0] io_in_QSV_0_0,
    input logic [15:0] io_in_QSV_0_1,
    input logic [15:0] io_in_QSV_1_0,
    input logic [15:0] io_in_QSV_1_1,
    input logic [15:0] io_in_QSV_2_0,
    input logic [15:0] io_in_QSV_2_1,
    input logic [15:0] io_in_QSV_3_0,
    input logic [15:0] io_in_QSV_3_1,
    input logic io_in_valid,
    output logic [15:0] io_out_QSV_0_0,
    output logic [15:0] io_out_QSV_0_1,
    output logic [15:0] io_out_QSV_1_0,
    output logic [15:0] io_out_QSV_1_1,
    output logic [15:0] io_out_QSV_2_0,
    output logic [15:0] io_out_QSV_2_1,
    output logic [15:0] io_out_QSV_3_0,
    output logic [15:0] io_out_QSV_3_1,
    output logic io_out_valid
);

    // Wires for stage 1 (H on Q0 - no perm)
    logic [15:0] w1_0_0, w1_0_1, w1_1_0, w1_1_1, w1_2_0, w1_2_1, w1_3_0, w1_3_1;
    logic w1_valid;

    HGate2QubitVector16bit m (
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
        .io_in_valid(io_in_valid),
        .io_out_QSV_0_0(w1_0_0),
        .io_out_QSV_0_1(w1_0_1),
        .io_out_QSV_1_0(w1_1_0),
        .io_out_QSV_1_1(w1_1_1),
        .io_out_QSV_2_0(w1_2_0),
        .io_out_QSV_2_1(w1_2_1),
        .io_out_QSV_3_0(w1_3_0),
        .io_out_QSV_3_1(w1_3_1),
        .io_out_valid(w1_valid)
    );

    // Wires for stage 2 (SXdg on Q1 - needs perm)
    logic [15:0] p1_0_0, p1_0_1, p1_1_0, p1_1_1, p1_2_0, p1_2_1, p1_3_0, p1_3_1;
    logic p1_valid;
    
    CompatiblePerm perm1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w1_0_0),
        .io_in_QSV_0_1(w1_0_1),
        .io_in_QSV_1_0(w1_1_0),
        .io_in_QSV_1_1(w1_1_1),
        .io_in_QSV_2_0(w1_2_0),
        .io_in_QSV_2_1(w1_2_1),
        .io_in_QSV_3_0(w1_3_0),
        .io_in_QSV_3_1(w1_3_1),
        .io_in_valid(w1_valid),
        .io_out_QSV_0_0(p1_0_0),
        .io_out_QSV_0_1(p1_0_1),
        .io_out_QSV_1_0(p1_1_0),
        .io_out_QSV_1_1(p1_1_1),
        .io_out_QSV_2_0(p1_2_0),
        .io_out_QSV_2_1(p1_2_1),
        .io_out_QSV_3_0(p1_3_0),
        .io_out_QSV_3_1(p1_3_1),
        .io_out_valid(p1_valid)
    );

    logic [15:0] w2_0_0, w2_0_1, w2_1_0, w2_1_1, w2_2_0, w2_2_1, w2_3_0, w2_3_1;
    logic w2_valid;

    SXDGate2QubitVector16bit m_1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(p1_0_0),
        .io_in_QSV_0_1(p1_0_1),
        .io_in_QSV_1_0(p1_1_0),
        .io_in_QSV_1_1(p1_1_1),
        .io_in_QSV_2_0(p1_2_0),
        .io_in_QSV_2_1(p1_2_1),
        .io_in_QSV_3_0(p1_3_0),
        .io_in_QSV_3_1(p1_3_1),
        .io_in_valid(p1_valid),
        .io_out_QSV_0_0(w2_0_0),
        .io_out_QSV_0_1(w2_0_1),
        .io_out_QSV_1_0(w2_1_0),
        .io_out_QSV_1_1(w2_1_1),
        .io_out_QSV_2_0(w2_2_0),
        .io_out_QSV_2_1(w2_2_1),
        .io_out_QSV_3_0(w2_3_0),
        .io_out_QSV_3_1(w2_3_1),
        .io_out_valid(w2_valid)
    );

    logic [15:0] p2_0_0, p2_0_1, p2_1_0, p2_1_1, p2_2_0, p2_2_1, p2_3_0, p2_3_1;
    logic p2_valid;

    CompatiblePerm perm2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w2_0_0),
        .io_in_QSV_0_1(w2_0_1),
        .io_in_QSV_1_0(w2_1_0),
        .io_in_QSV_1_1(w2_1_1),
        .io_in_QSV_2_0(w2_2_0),
        .io_in_QSV_2_1(w2_2_1),
        .io_in_QSV_3_0(w2_3_0),
        .io_in_QSV_3_1(w2_3_1),
        .io_in_valid(w2_valid),
        .io_out_QSV_0_0(p2_0_0),
        .io_out_QSV_0_1(p2_0_1),
        .io_out_QSV_1_0(p2_1_0),
        .io_out_QSV_1_1(p2_1_1),
        .io_out_QSV_2_0(p2_2_0),
        .io_out_QSV_2_1(p2_2_1),
        .io_out_QSV_3_0(p2_3_0),
        .io_out_QSV_3_1(p2_3_1),
        .io_out_valid(p2_valid)
    );

    // Stage 3 (SWAP - no perm needed)
    SWGate2QubitVector16bit m_2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(p2_0_0),
        .io_in_QSV_0_1(p2_0_1),
        .io_in_QSV_1_0(p2_1_0),
        .io_in_QSV_1_1(p2_1_1),
        .io_in_QSV_2_0(p2_2_0),
        .io_in_QSV_2_1(p2_2_1),
        .io_in_QSV_3_0(p2_3_0),
        .io_in_QSV_3_1(p2_3_1),
        .io_in_valid(p2_valid),
        .io_out_QSV_0_0(io_out_QSV_0_0),
        .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0),
        .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0),
        .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0),
        .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_valid(io_out_valid)
    );

endmodule
