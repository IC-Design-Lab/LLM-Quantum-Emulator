module Circuit_06 (
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

    // Wires for Stage 1: HGate2QubitVector16bit
    logic [15:0] w1_QSV_0_0;
    logic [15:0] w1_QSV_0_1;
    logic [15:0] w1_QSV_1_0;
    logic [15:0] w1_QSV_1_1;
    logic [15:0] w1_QSV_2_0;
    logic [15:0] w1_QSV_2_1;
    logic [15:0] w1_QSV_3_0;
    logic [15:0] w1_QSV_3_1;
    logic        w1_valid;

    // Wires for Stage 2: CompatiblePerm (before CNOT)
    logic [15:0] w2_QSV_0_0;
    logic [15:0] w2_QSV_0_1;
    logic [15:0] w2_QSV_1_0;
    logic [15:0] w2_QSV_1_1;
    logic [15:0] w2_QSV_2_0;
    logic [15:0] w2_QSV_2_1;
    logic [15:0] w2_QSV_3_0;
    logic [15:0] w2_QSV_3_1;
    logic        w2_valid;

    // Wires for Stage 3: CNGate2QubitVector16bit (CNOT)
    logic [15:0] w3_QSV_0_0;
    logic [15:0] w3_QSV_0_1;
    logic [15:0] w3_QSV_1_0;
    logic [15:0] w3_QSV_1_1;
    logic [15:0] w3_QSV_2_0;
    logic [15:0] w3_QSV_2_1;
    logic [15:0] w3_QSV_3_0;
    logic [15:0] w3_QSV_3_1;
    logic        w3_valid;

    // Stage 1: Hadamard Gate on Qubit 0
    HGate2QubitVector16bit h_gate_inst (
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

    // Stage 2: Permutation before CNOT (target is Qubit 1)
    CompatiblePerm perm_before (
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

    // Stage 3: Controlled Not Gate
    CNGate2QubitVector16bit cx_gate_inst (
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

    // Stage 4: Permutation after CNOT (target was Qubit 1)
    CompatiblePerm perm_after (
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
