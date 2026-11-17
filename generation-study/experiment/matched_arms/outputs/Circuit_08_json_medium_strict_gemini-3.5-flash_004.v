module Circuit_08 (
    input  logic        clock,
    input  logic        reset,
    input  logic [15:0] io_in_QSV_0_0,
    input  logic [15:0] io_in_QSV_0_1,
    input  logic [15:0] io_in_QSV_1_0,
    input  logic [15:0] io_in_QSV_1_1,
    input  logic [15:0] io_in_QSV_2_0,
    input  logic [15:0] io_in_QSV_2_1,
    input  logic [15:0] io_in_QSV_3_0,
    input  logic [15:0] io_in_QSV_3_1,
    input  logic        io_in_valid,
    output logic [15:0] io_out_QSV_0_0,
    output logic [15:0] io_out_QSV_0_1,
    output logic [15:0] io_out_QSV_1_0,
    output logic [15:0] io_out_QSV_1_1,
    output logic [15:0] io_out_QSV_2_0,
    output logic [15:0] io_out_QSV_2_1,
    output logic [15:0] io_out_QSV_3_0,
    output logic [15:0] io_out_QSV_3_1,
    output logic        io_out_valid
);

    // Stage 1: H Gate on Qubit 0
    wire [15:0] w1_QSV_0_0;
    wire [15:0] w1_QSV_0_1;
    wire [15:0] w1_QSV_1_0;
    wire [15:0] w1_QSV_1_1;
    wire [15:0] w1_QSV_2_0;
    wire [15:0] w1_QSV_2_1;
    wire [15:0] w1_QSV_3_0;
    wire [15:0] w1_QSV_3_1;
    wire        w1_valid;

    HGate2QubitVector16bit h_gate (
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

    // Stage 2: Permutation before CX
    wire [15:0] w2_QSV_0_0;
    wire [15:0] w2_QSV_0_1;
    wire [15:0] w2_QSV_1_0;
    wire [15:0] w2_QSV_1_1;
    wire [15:0] w2_QSV_2_0;
    wire [15:0] w2_QSV_2_1;
    wire [15:0] w2_QSV_3_0;
    wire [15:0] w2_QSV_3_1;
    wire        w2_valid;

    CompatiblePerm perm_before_cx (
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

    // Stage 3: CX Gate (Control Qubit 0, Target Qubit 1 via permutation)
    wire [15:0] w3_QSV_0_0;
    wire [15:0] w3_QSV_0_1;
    wire [15:0] w3_QSV_1_0;
    wire [15:0] w3_QSV_1_1;
    wire [15:0] w3_QSV_2_0;
    wire [15:0] w3_QSV_2_1;
    wire [15:0] w3_QSV_3_0;
    wire [15:0] w3_QSV_3_1;
    wire        w3_valid;

    CNGate2QubitVector16bit cx_gate (
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

    // Stage 4: Permutation after CX
    wire [15:0] w4_QSV_0_0;
    wire [15:0] w4_QSV_0_1;
    wire [15:0] w4_QSV_1_0;
    wire [15:0] w4_QSV_1_1;
    wire [15:0] w4_QSV_2_0;
    wire [15:0] w4_QSV_2_1;
    wire [15:0] w4_QSV_3_0;
    wire [15:0] w4_QSV_3_1;
    wire        w4_valid;

    CompatiblePerm perm_after_cx (
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
        .io_out_QSV_0_0(w4_QSV_0_0),
        .io_out_QSV_0_1(w4_QSV_0_1),
        .io_out_QSV_1_0(w4_QSV_1_0),
        .io_out_QSV_1_1(w4_QSV_1_1),
        .io_out_QSV_2_0(w4_QSV_2_0),
        .io_out_QSV_2_1(w4_QSV_2_1),
        .io_out_QSV_3_0(w4_QSV_3_0),
        .io_out_QSV_3_1(w4_QSV_3_1),
        .io_out_valid(w4_valid)
    );

    // Stage 5: SX Gate on Qubit 0
    SXGate2QubitVector16bit sx_gate (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w4_QSV_0_0),
        .io_in_QSV_0_1(w4_QSV_0_1),
        .io_in_QSV_1_0(w4_QSV_1_0),
        .io_in_QSV_1_1(w4_QSV_1_1),
        .io_in_QSV_2_0(w4_QSV_2_0),
        .io_in_QSV_2_1(w4_QSV_2_1),
        .io_in_QSV_3_0(w4_QSV_3_0),
        .io_in_QSV_3_1(w4_QSV_3_1),
        .io_in_valid(w4_valid),
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
