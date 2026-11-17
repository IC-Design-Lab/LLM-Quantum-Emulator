module Circuit_04 (
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

    // Intermediate wires for Stage 0 (H)
    wire [15:0] m0_io_out_QSV_0_0;
    wire [15:0] m0_io_out_QSV_0_1;
    wire [15:0] m0_io_out_QSV_1_0;
    wire [15:0] m0_io_out_QSV_1_1;
    wire [15:0] m0_io_out_QSV_2_0;
    wire [15:0] m0_io_out_QSV_2_1;
    wire [15:0] m0_io_out_QSV_3_0;
    wire [15:0] m0_io_out_QSV_3_1;
    wire        m0_io_out_valid;

    // Intermediate wires for Stage 1 Pre-Permutation
    wire [15:0] m1_io_out_QSV_0_0;
    wire [15:0] m1_io_out_QSV_0_1;
    wire [15:0] m1_io_out_QSV_1_0;
    wire [15:0] m1_io_out_QSV_1_1;
    wire [15:0] m1_io_out_QSV_2_0;
    wire [15:0] m1_io_out_QSV_2_1;
    wire [15:0] m1_io_out_QSV_3_0;
    wire [15:0] m1_io_out_QSV_3_1;
    wire        m1_io_out_valid;

    // Intermediate wires for Stage 1 (SXdg)
    wire [15:0] m2_io_out_QSV_0_0;
    wire [15:0] m2_io_out_QSV_0_1;
    wire [15:0] m2_io_out_QSV_1_0;
    wire [15:0] m2_io_out_QSV_1_1;
    wire [15:0] m2_io_out_QSV_2_0;
    wire [15:0] m2_io_out_QSV_2_1;
    wire [15:0] m2_io_out_QSV_3_0;
    wire [15:0] m2_io_out_QSV_3_1;
    wire        m2_io_out_valid;

    // Intermediate wires for Stage 1 Post-Permutation
    wire [15:0] m3_io_out_QSV_0_0;
    wire [15:0] m3_io_out_QSV_0_1;
    wire [15:0] m3_io_out_QSV_1_0;
    wire [15:0] m3_io_out_QSV_1_1;
    wire [15:0] m3_io_out_QSV_2_0;
    wire [15:0] m3_io_out_QSV_2_1;
    wire [15:0] m3_io_out_QSV_3_0;
    wire [15:0] m3_io_out_QSV_3_1;
    wire        m3_io_out_valid;

    // Stage 0: H on qubit 0 (No permutation needed)
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
        .io_out_QSV_0_0(m0_io_out_QSV_0_0),
        .io_out_QSV_0_1(m0_io_out_QSV_0_1),
        .io_out_QSV_1_0(m0_io_out_QSV_1_0),
        .io_out_QSV_1_1(m0_io_out_QSV_1_1),
        .io_out_QSV_2_0(m0_io_out_QSV_2_0),
        .io_out_QSV_2_1(m0_io_out_QSV_2_1),
        .io_out_QSV_3_0(m0_io_out_QSV_3_0),
        .io_out_QSV_3_1(m0_io_out_QSV_3_1),
        .io_out_valid(m0_io_out_valid)
    );

    // Stage 1: SXdg on qubit 1 (Requires permutation before and after)
    CompatiblePerm m1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m0_io_out_QSV_0_0),
        .io_in_QSV_0_1(m0_io_out_QSV_0_1),
        .io_in_QSV_1_0(m0_io_out_QSV_1_0),
        .io_in_QSV_1_1(m0_io_out_QSV_1_1),
        .io_in_QSV_2_0(m0_io_out_QSV_2_0),
        .io_in_QSV_2_1(m0_io_out_QSV_2_1),
        .io_in_QSV_3_0(m0_io_out_QSV_3_0),
        .io_in_QSV_3_1(m0_io_out_QSV_3_1),
        .io_in_valid(m0_io_out_valid),
        .io_out_QSV_0_0(m1_io_out_QSV_0_0),
        .io_out_QSV_0_1(m1_io_out_QSV_0_1),
        .io_out_QSV_1_0(m1_io_out_QSV_1_0),
        .io_out_QSV_1_1(m1_io_out_QSV_1_1),
        .io_out_QSV_2_0(m1_io_out_QSV_2_0),
        .io_out_QSV_2_1(m1_io_out_QSV_2_1),
        .io_out_QSV_3_0(m1_io_out_QSV_3_0),
        .io_out_QSV_3_1(m1_io_out_QSV_3_1),
        .io_out_valid(m1_io_out_valid)
    );

    SXDGate2QubitVector16bit m2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m1_io_out_QSV_0_0),
        .io_in_QSV_0_1(m1_io_out_QSV_0_1),
        .io_in_QSV_1_0(m1_io_out_QSV_1_0),
        .io_in_QSV_1_1(m1_io_out_QSV_1_1),
        .io_in_QSV_2_0(m1_io_out_QSV_2_0),
        .io_in_QSV_2_1(m1_io_out_QSV_2_1),
        .io_in_QSV_3_0(m1_io_out_QSV_3_0),
        .io_in_QSV_3_1(m1_io_out_QSV_3_1),
        .io_in_valid(m1_io_out_valid),
        .io_out_QSV_0_0(m2_io_out_QSV_0_0),
        .io_out_QSV_0_1(m2_io_out_QSV_0_1),
        .io_out_QSV_1_0(m2_io_out_QSV_1_0),
        .io_out_QSV_1_1(m2_io_out_QSV_1_1),
        .io_out_QSV_2_0(m2_io_out_QSV_2_0),
        .io_out_QSV_2_1(m2_io_out_QSV_2_1),
        .io_out_QSV_3_0(m2_io_out_QSV_3_0),
        .io_out_QSV_3_1(m2_io_out_QSV_3_1),
        .io_out_valid(m2_io_out_valid)
    );

    CompatiblePerm m3 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m2_io_out_QSV_0_0),
        .io_in_QSV_0_1(m2_io_out_QSV_0_1),
        .io_in_QSV_1_0(m2_io_out_QSV_1_0),
        .io_in_QSV_1_1(m2_io_out_QSV_1_1),
        .io_in_QSV_2_0(m2_io_out_QSV_2_0),
        .io_in_QSV_2_1(m2_io_out_QSV_2_1),
        .io_in_QSV_3_0(m2_io_out_QSV_3_0),
        .io_in_QSV_3_1(m2_io_out_QSV_3_1),
        .io_in_valid(m2_io_out_valid),
        .io_out_QSV_0_0(m3_io_out_QSV_0_0),
        .io_out_QSV_0_1(m3_io_out_QSV_0_1),
        .io_out_QSV_1_0(m3_io_out_QSV_1_0),
        .io_out_QSV_1_1(m3_io_out_QSV_1_1),
        .io_out_QSV_2_0(m3_io_out_QSV_2_0),
        .io_out_QSV_2_1(m3_io_out_QSV_2_1),
        .io_out_QSV_3_0(m3_io_out_QSV_3_0),
        .io_out_QSV_3_1(m3_io_out_QSV_3_1),
        .io_out_valid(m3_io_out_valid)
    );

    // Stage 2: SWAP (No permutation needed)
    SWGate2QubitVector16bit m4 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m3_io_out_QSV_0_0),
        .io_in_QSV_0_1(m3_io_out_QSV_0_1),
        .io_in_QSV_1_0(m3_io_out_QSV_1_0),
        .io_in_QSV_1_1(m3_io_out_QSV_1_1),
        .io_in_QSV_2_0(m3_io_out_QSV_2_0),
        .io_in_QSV_2_1(m3_io_out_QSV_2_1),
        .io_in_QSV_3_0(m3_io_out_QSV_3_0),
        .io_in_QSV_3_1(m3_io_out_QSV_3_1),
        .io_in_valid(m3_io_out_valid),
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
