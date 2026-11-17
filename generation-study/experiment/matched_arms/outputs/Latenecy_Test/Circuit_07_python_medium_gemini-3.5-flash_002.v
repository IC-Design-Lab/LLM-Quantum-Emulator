module Circuit_07 (
    input  logic         clock,
    input  logic         reset,
    input  logic [15:0]  io_in_QSV_0_0,
    input  logic [15:0]  io_in_QSV_0_1,
    input  logic [15:0]  io_in_QSV_1_0,
    input  logic [15:0]  io_in_QSV_1_1,
    input  logic [15:0]  io_in_QSV_2_0,
    input  logic [15:0]  io_in_QSV_2_1,
    input  logic [15:0]  io_in_QSV_3_0,
    input  logic [15:0]  io_in_QSV_3_1,
    input  logic         io_in_valid,
    output logic [15:0]  io_out_QSV_0_0,
    output logic [15:0]  io_out_QSV_0_1,
    output logic [15:0]  io_out_QSV_1_0,
    output logic [15:0]  io_out_QSV_1_1,
    output logic [15:0]  io_out_QSV_2_0,
    output logic [15:0]  io_out_QSV_2_1,
    output logic [15:0]  io_out_QSV_3_0,
    output logic [15:0]  io_out_QSV_3_1,
    output logic         io_out_valid
);

    // Intermediate Wires
    wire [15:0] w0_QSV_0_0, w0_QSV_0_1, w0_QSV_1_0, w0_QSV_1_1;
    wire [15:0] w0_QSV_2_0, w0_QSV_2_1, w0_QSV_3_0, w0_QSV_3_1;
    wire        w0_valid;

    wire [15:0] w1_QSV_0_0, w1_QSV_0_1, w1_QSV_1_0, w1_QSV_1_1;
    wire [15:0] w1_QSV_2_0, w1_QSV_2_1, w1_QSV_3_0, w1_QSV_3_1;
    wire        w1_valid;

    wire [15:0] w2_QSV_0_0, w2_QSV_0_1, w2_QSV_1_0, w2_QSV_1_1;
    wire [15:0] w2_QSV_2_0, w2_QSV_2_1, w2_QSV_3_0, w2_QSV_3_1;
    wire        w2_valid;

    wire [15:0] w3_QSV_0_0, w3_QSV_0_1, w3_QSV_1_0, w3_QSV_1_1;
    wire [15:0] w3_QSV_2_0, w3_QSV_2_1, w3_QSV_3_0, w3_QSV_3_1;
    wire        w3_valid;

    // Stage 0: Hadamard on Qubit 0
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

    // Stage 1: Permutation before CX
    CompatiblePerm m1 (
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

    // Stage 2: Controlled-Not Gate
    CNGate2QubitVector16bit m2 (
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
        .io_out_QSV_0_0(w2_QSV_0_0),
        .io_out_QSV_0_1(w2_QSV_0_1),
        .io_out_QSV_1_0(w2_QSV_1_0),
        .io_out_QSV_1_1(w2_QSV_1_1),
        .io_out_QSV_2_0(w2_QSV_2_0),
        .io_out_QSV_2_1(w2_QSV_2_1),
        .io_out_QSV_3_0(w2_QSV_3_0),
        .io_out_QSV_3_1(w2_QSV_3_1),
        .io_out_valid(w2_valid)
    );

    // Stage 3: Permutation after CX
    CompatiblePerm m3 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w2_QSV_0_0),
        .io_in_QSV_0_1(w2_QSV_0_1),
        .io_in_QSV_1_0(w2_QSV_1_0),
        .io_in_QSV_1_1(w2_QSV_1_1),
        .io_in_QSV_2_0(w2_QSV_2_0),
        .io_in_QSV_2_1(w2_QSV_2_1),
        .io_in_QSV_3_0(w2_QSV_3_0),
        .io_in_QSV_3_1(w2_QSV_3_1),
        .io_in_valid(w2_valid),
        .io_out_QSV_0_0(w3_QSV_0_0),
        .io_out_QSV_0_1(w3_QSV_0_1),
        .io_out_QSV_1_0(w3_QSV_1_0),
        .io_out_QSV_1_1(w3_QSV_1_1),
        .io_out_QSV_2_0(w3_QSV_2_0),
        .io_out_QSV_2_1(w3_QSV_2_1),
        .io_out_QSV_3_0(w3_QSV_3_0),
        .io_out_QSV_3_1(w3_QSV_3_1),
        .io_out_valid(w3_valid)
    );

    // Stage 4: Hadamard on Qubit 0
    HGate2QubitVector16bit m4 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w3_QSV_0_0),
        .io_in_QSV_0_1(w3_QSV_0_1),
        .io_in_QSV_1_0(w3_QSV_1_0),
        .io_in_QSV_1_1(w3_QSV_1_1),
        .io_in_QSV_2_0(w3_QSV_2_0),
        .io_in_QSV_2_1(w3_QSV_2_1),
        .io_in_QSV_3_0(w3_QSV_3_0),
        .io_in_QSV_3_1(w3_QSV_3_1),
        .io_in_valid(w3_valid),
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
