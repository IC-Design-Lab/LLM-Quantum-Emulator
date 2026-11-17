module Circuit_07 (
    input  logic clock,
    input  logic reset,
    input  logic [15:0] io_in_QSV_0_0,
    input  logic [15:0] io_in_QSV_0_1,
    input  logic [15:0] io_in_QSV_1_0,
    input  logic [15:0] io_in_QSV_1_1,
    input  logic [15:0] io_in_QSV_2_0,
    input  logic [15:0] io_in_QSV_2_1,
    input  logic [15:0] io_in_QSV_3_0,
    input  logic [15:0] io_in_QSV_3_1,
    input  logic io_in_valid,
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

    logic [15:0] w0_0_0, w0_0_1, w0_1_0, w0_1_1, w0_2_0, w0_2_1, w0_3_0, w0_3_1;
    logic v0;

    logic [15:0] w1_0_0, w1_0_1, w1_1_0, w1_1_1, w1_2_0, w1_2_1, w1_3_0, w1_3_1;
    logic v1;

    logic [15:0] w2_0_0, w2_0_1, w2_1_0, w2_1_1, w2_2_0, w2_2_1, w2_3_0, w2_3_1;
    logic v2;

    logic [15:0] w3_0_0, w3_0_1, w3_1_0, w3_1_1, w3_2_0, w3_2_1, w3_3_0, w3_3_1;
    logic v3;

    logic [15:0] w4_0_0, w4_0_1, w4_1_0, w4_1_1, w4_2_0, w4_2_1, w4_3_0, w4_3_1;
    logic v4;

    HGate2QubitVector16bit m0 (
        .clock(clock), .reset(reset), .io_in_valid(io_in_valid),
        .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
        .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
        .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_out_QSV_0_0(w0_0_0), .io_out_QSV_0_1(w0_0_1),
        .io_out_QSV_1_0(w0_1_0), .io_out_QSV_1_1(w0_1_1),
        .io_out_QSV_2_0(w0_2_0), .io_out_QSV_2_1(w0_2_1),
        .io_out_QSV_3_0(w0_3_0), .io_out_QSV_3_1(w0_3_1),
        .io_out_valid(v0)
    );

    CompatiblePerm m1 (
        .clock(clock), .reset(reset), .io_in_valid(v0),
        .io_in_QSV_0_0(w0_0_0), .io_in_QSV_0_1(w0_0_1),
        .io_in_QSV_1_0(w0_1_0), .io_in_QSV_1_1(w0_1_1),
        .io_in_QSV_2_0(w0_2_0), .io_in_QSV_2_1(w0_2_1),
        .io_in_QSV_3_0(w0_3_0), .io_in_QSV_3_1(w0_3_1),
        .io_out_QSV_0_0(w1_0_0), .io_out_QSV_0_1(w1_0_1),
        .io_out_QSV_1_0(w1_1_0), .io_out_QSV_1_1(w1_1_1),
        .io_out_QSV_2_0(w1_2_0), .io_out_QSV_2_1(w1_2_1),
        .io_out_QSV_3_0(w1_3_0), .io_out_QSV_3_1(w1_3_1),
        .io_out_valid(v1)
    );

    CNGate2QubitVector16bit m2 (
        .clock(clock), .reset(reset), .io_in_valid(v1),
        .io_in_QSV_0_0(w1_0_0), .io_in_QSV_0_1(w1_0_1),
        .io_in_QSV_1_0(w1_1_0), .io_in_QSV_1_1(w1_1_1),
        .io_in_QSV_2_0(w1_2_0), .io_in_QSV_2_1(w1_2_1),
        .io_in_QSV_3_0(w1_3_0), .io_in_QSV_3_1(w1_3_1),
        .io_out_QSV_0_0(w2_0_0), .io_out_QSV_0_1(w2_0_1),
        .io_out_QSV_1_0(w2_1_0), .io_out_QSV_1_1(w2_1_1),
        .io_out_QSV_2_0(w2_2_0), .io_out_QSV_2_1(w2_2_1),
        .io_out_QSV_3_0(w2_3_0), .io_out_QSV_3_1(w2_3_1),
        .io_out_valid(v2)
    );

    CompatiblePerm m3 (
        .clock(clock), .reset(reset), .io_in_valid(v2),
        .io_in_QSV_0_0(w2_0_0), .io_in_QSV_0_1(w2_0_1),
        .io_in_QSV_1_0(w2_1_0), .io_in_QSV_1_1(w2_1_1),
        .io_in_QSV_2_0(w2_2_0), .io_in_QSV_2_1(w2_2_1),
        .io_in_QSV_3_0(w2_3_0), .io_in_QSV_3_1(w2_3_1),
        .io_out_QSV_0_0(w3_0_0), .io_out_QSV_0_1(w3_0_1),
        .io_out_QSV_1_0(w3_1_0), .io_out_QSV_1_1(w3_1_1),
        .io_out_QSV_2_0(w3_2_0), .io_out_QSV_2_1(w3_2_1),
        .io_out_QSV_3_0(w3_3_0), .io_out_QSV_3_1(w3_3_1),
        .io_out_valid(v3)
    );

    HGate2QubitVector16bit m4 (
        .clock(clock), .reset(reset), .io_in_valid(v3),
        .io_in_QSV_0_0(w3_0_0), .io_in_QSV_0_1(w3_0_1),
        .io_in_QSV_1_0(w3_1_0), .io_in_QSV_1_1(w3_1_1),
        .io_in_QSV_2_0(w3_2_0), .io_in_QSV_2_1(w3_2_1),
        .io_in_QSV_3_0(w3_3_0), .io_in_QSV_3_1(w3_3_1),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_valid(io_out_valid)
    );

endmodule
