module Circuit_08(
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

    // Wires for stage 0 (H on Qubit 0)
    wire [15:0] w0_QSV_0_0, w0_QSV_0_1, w0_QSV_1_0, w0_QSV_1_1, w0_QSV_2_0, w0_QSV_2_1, w0_QSV_3_0, w0_QSV_3_1;
    wire w0_valid;

    HGate2QubitVector16bit m0 (
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
        .io_out_QSV_0_0(w0_QSV_0_0),
        .io_out_QSV_0_1(w0_QSV_0_1),
        .io_out_QSV_1_0(w0_QSV_1_0),
        .io_out_QSV_1_1(w0_QSV_1_1),
        .io_out_QSV_2_0(w0_QSV_2_0),
        .io_out_QSV_2_1(w0_QSV_2_1),
        .io_out_QSV_3_0(w0_QSV_3_0),
        .io_out_QSV_3_1(w0_QSV_3_1),
        .io_out_valid(w0_valid)
    );

    // Wires for stage 1 (CX on 0,1)
    wire [15:0] w1_QSV_0_0, w1_QSV_0_1, w1_QSV_1_0, w1_QSV_1_1, w1_QSV_2_0, w1_QSV_2_1, w1_QSV_3_0, w1_QSV_3_1;
    wire w1_valid;

    CNGate2QubitVector16bit m1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w0_QSV_0_0),
        .io_in_QSV_0_1(w0_QSV_0_1),
        .io_in_QSV_1_0(w0_QSV_1_0),
        .io_in_QSV_1_1(w0_QSV_1_1),
        .io_in_QSV_2_0(w0_QSV_2_0),
        .io_in_QSV_2_1(w0_QSV_2_1),
        .io_in_QSV_3_0(w0_QSV_3_0),
        .io_in_QSV_3_1(w0_QSV_3_1),
        .io_in_valid(w0_valid),
        .io_out_QSV_0_0(w1_QSV_0_0),
        .io_out_QSV_0_1(w1_QSV_0_1),
        .io_out_QSV_1_0(w1_QSV_1_0),
        .io_out_QSV_1_1(w1_QSV_1_1),
        .io_out_QSV_2_0(w1_QSV_2_0),
        .io_out_QSV_2_1(w1_QSV_2_1),
        .io_out_QSV_3_0(w1_QSV_3_0),
        .io_out_QSV_3_1(w1_QSV_3_1),
        .io_out_valid(w1_valid)
    );

    // Stage 2 (SX on Qubit 0)
    SXGate2QubitVector16bit m2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w1_QSV_0_0),
        .io_in_QSV_0_1(w1_QSV_0_1),
        .io_in_QSV_1_0(w1_QSV_1_0),
        .io_in_QSV_1_1(w1_QSV_1_1),
        .io_in_QSV_2_0(w1_QSV_2_0),
        .io_in_QSV_2_1(w1_QSV_2_1),
        .io_in_QSV_3_0(w1_QSV_3_0),
        .io_in_QSV_3_1(w1_QSV_3_1),
        .io_in_valid(w1_valid),
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
