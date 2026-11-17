module Circuit_04 (
    input wire clock,
    input wire reset,
    input wire [15:0] io_in_QSV_0_0,
    input wire [15:0] io_in_QSV_0_1,
    input wire [15:0] io_in_QSV_1_0,
    input wire [15:0] io_in_QSV_1_1,
    input wire [15:0] io_in_QSV_2_0,
    input wire [15:0] io_in_QSV_2_1,
    input wire [15:0] io_in_QSV_3_0,
    input wire [15:0] io_in_QSV_3_1,
    input wire io_in_valid,
    output wire [15:0] io_out_QSV_0_0,
    output wire [15:0] io_out_QSV_0_1,
    output wire [15:0] io_out_QSV_1_0,
    output wire [15:0] io_out_QSV_1_1,
    output wire [15:0] io_out_QSV_2_0,
    output wire [15:0] io_out_QSV_2_1,
    output wire [15:0] io_out_QSV_3_0,
    output wire [15:0] io_out_QSV_3_1,
    output wire io_out_valid
);

    wire [15:0] w0_QSV_0_0, w0_QSV_0_1, w0_QSV_1_0, w0_QSV_1_1, w0_QSV_2_0, w0_QSV_2_1, w0_QSV_3_0, w0_QSV_3_1, w0_valid;
    wire [15:0] w1_QSV_0_0, w1_QSV_0_1, w1_QSV_1_0, w1_QSV_1_1, w1_QSV_2_0, w1_QSV_2_1, w1_QSV_3_0, w1_QSV_3_1, w1_valid;
    wire [15:0] w2_QSV_0_0, w2_QSV_0_1, w2_QSV_1_0, w2_QSV_1_1, w2_QSV_2_0, w2_QSV_2_1, w2_QSV_3_0, w2_QSV_3_1, w2_valid;
    wire [15:0] w3_QSV_0_0, w3_QSV_0_1, w3_QSV_1_0, w3_QSV_1_1, w3_QSV_2_0, w3_QSV_2_1, w3_QSV_3_0, w3_QSV_3_1, w3_valid;
    wire [15:0] w4_QSV_0_0, w4_QSV_0_1, w4_QSV_1_0, w4_QSV_1_1, w4_QSV_2_0, w4_QSV_2_1, w4_QSV_3_0, w4_QSV_3_1, w4_valid;

    // Step 0: H on 0
    HGate2QubitVector16bit m_0 (
        .clock(clock), .reset(reset), .io_in_valid(io_in_valid),
        .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
        .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
        .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_out_QSV_0_0(w0_QSV_0_0), .io_out_QSV_0_1(w0_QSV_0_1),
        .io_out_QSV_1_0(w0_QSV_1_0), .io_out_QSV_1_1(w0_QSV_1_1),
        .io_out_QSV_2_0(w0_QSV_2_0), .io_out_QSV_2_1(w0_QSV_2_1),
        .io_out_QSV_3_0(w0_QSV_3_0), .io_out_QSV_3_1(w0_QSV_3_1),
        .io_out_valid(w0_valid)
    );

    // Step 1: SXdg on 1 (Requires Perm)
    CompatiblePerm m_1 (
        .clock(clock), .reset(reset), .io_in_valid(w0_valid),
        .io_in_QSV_0_0(w0_QSV_0_0), .io_in_QSV_0_1(w0_QSV_0_1),
        .io_in_QSV_1_0(w0_QSV_1_0), .io_in_QSV_1_1(w0_QSV_1_1),
        .io_in_QSV_2_0(w0_QSV_2_0), .io_in_QSV_2_1(w0_QSV_2_1),
        .io_in_QSV_3_0(w0_QSV_3_0), .io_in_QSV_3_1(w0_QSV_3_1),
        .io_out_QSV_0_0(w1_QSV_0_0), .io_out_QSV_0_1(w1_QSV_0_1),
        .io_out_QSV_1_0(w1_QSV_1_0), .io_out_QSV_1_1(w1_QSV_1_1),
        .io_out_QSV_2_0(w1_QSV_2_0), .io_out_QSV_2_1(w1_QSV_2_1),
        .io_out_QSV_3_0(w1_QSV_3_0), .io_out_QSV_3_1(w1_QSV_3_1),
        .io_out_valid(w1_valid)
    );

    SXDGate2QubitVector16bit m_2 (
        .clock(clock), .reset(reset), .io_in_valid(w1_valid),
        .io_in_QSV_0_0(w1_QSV_0_0), .io_in_QSV_0_1(w1_QSV_0_1),
        .io_in_QSV_1_0(w1_QSV_1_0), .io_in_QSV_1_1(w1_QSV_1_1),
        .io_in_QSV_2_0(w1_QSV_2_0), .io_in_QSV_2_1(w1_QSV_2_1),
        .io_in_QSV_3_0(w1_QSV_3_0), .io_in_QSV_3_1(w1_QSV_3_1),
        .io_out_QSV_0_0(w2_QSV_0_0), .io_out_QSV_0_1(w2_QSV_0_1),
        .io_out_QSV_1_0(w2_QSV_1_0), .io_out_QSV_1_1(w2_QSV_1_1),
        .io_out_QSV_2_0(w2_QSV_2_0), .io_out_QSV_2_1(w2_QSV_2_1),
        .io_out_QSV_3_0(w2_QSV_3_0), .io_out_QSV_3_1(w2_QSV_3_1),
        .io_out_valid(w2_valid)
    );

    CompatiblePerm m_3 (
        .clock(clock), .reset(reset), .io_in_valid(w2_valid),
        .io_in_QSV_0_0(w2_QSV_0_0), .io_in_QSV_0_1(w2_QSV_0_1),
        .io_in_QSV_1_0(w2_QSV_1_0), .io_in_QSV_1_1(w2_QSV_1_1),
        .io_in_QSV_2_0(w2_QSV_2_0), .io_in_QSV_2_1(w2_QSV_2_1),
        .io_in_QSV_3_0(w2_QSV_3_0), .io_in_QSV_3_1(w2_QSV_3_1),
        .io_out_QSV_0_0(w3_QSV_0_0), .io_out_QSV_0_1(w3_QSV_0_1),
        .io_out_QSV_1_0(w3_QSV_1_0), .io_out_QSV_1_1(w3_QSV_1_1),
        .io_out_QSV_2_0(w3_QSV_2_0), .io_out_QSV_2_1(w3_QSV_2_1),
        .io_out_QSV_3_0(w3_QSV_3_0), .io_out_QSV_3_1(w3_QSV_3_1),
        .io_out_valid(w3_valid)
    );

    // Step 2: Swap
    SWGate2QubitVector16bit m_4 (
        .clock(clock), .reset(reset), .io_in_valid(w3_valid),
        .io_in_QSV_0_0(w3_QSV_0_0), .io_in_QSV_0_1(w3_QSV_0_1),
        .io_in_QSV_1_0(w3_QSV_1_0), .io_in_QSV_1_1(w3_QSV_1_1),
        .io_in_QSV_2_0(w3_QSV_2_0), .io_in_QSV_2_1(w3_QSV_2_1),
        .io_in_QSV_3_0(w3_QSV_3_0), .io_in_QSV_3_1(w3_QSV_3_1),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_valid(io_out_valid)
    );

endmodule
