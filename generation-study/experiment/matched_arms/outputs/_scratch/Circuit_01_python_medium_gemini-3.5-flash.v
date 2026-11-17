module Circuit_01 (
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

    // Intermediate wires for m0 (HGate2QubitVector16bit)
    wire [15:0] m0_out_QSV_0_0;
    wire [15:0] m0_out_QSV_0_1;
    wire [15:0] m0_out_QSV_1_0;
    wire [15:0] m0_out_QSV_1_1;
    wire [15:0] m0_out_QSV_2_0;
    wire [15:0] m0_out_QSV_2_1;
    wire [15:0] m0_out_QSV_3_0;
    wire [15:0] m0_out_QSV_3_1;
    wire        m0_out_valid;

    // Intermediate wires for m1 (CompatiblePerm)
    wire [15:0] m1_out_QSV_0_0;
    wire [15:0] m1_out_QSV_0_1;
    wire [15:0] m1_out_QSV_1_0;
    wire [15:0] m1_out_QSV_1_1;
    wire [15:0] m1_out_QSV_2_0;
    wire [15:0] m1_out_QSV_2_1;
    wire [15:0] m1_out_QSV_3_0;
    wire [15:0] m1_out_QSV_3_1;
    wire        m1_out_valid;

    // Intermediate wires for m2 (XGate2QubitVector16bit)
    wire [15:0] m2_out_QSV_0_0;
    wire [15:0] m2_out_QSV_0_1;
    wire [15:0] m2_out_QSV_1_0;
    wire [15:0] m2_out_QSV_1_1;
    wire [15:0] m2_out_QSV_2_0;
    wire [15:0] m2_out_QSV_2_1;
    wire [15:0] m2_out_QSV_3_0;
    wire [15:0] m2_out_QSV_3_1;
    wire        m2_out_valid;

    // Intermediate wires for m3 (CompatiblePerm)
    wire [15:0] m3_out_QSV_0_0;
    wire [15:0] m3_out_QSV_0_1;
    wire [15:0] m3_out_QSV_1_0;
    wire [15:0] m3_out_QSV_1_1;
    wire [15:0] m3_out_QSV_2_0;
    wire [15:0] m3_out_QSV_2_1;
    wire [15:0] m3_out_QSV_3_0;
    wire [15:0] m3_out_QSV_3_1;
    wire        m3_out_valid;

    // Step 0: H(0) - No permutation needed
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
        .io_out_QSV_0_0(m0_out_QSV_0_0),
        .io_out_QSV_0_1(m0_out_QSV_0_1),
        .io_out_QSV_1_0(m0_out_QSV_1_0),
        .io_out_QSV_1_1(m0_out_QSV_1_1),
        .io_out_QSV_2_0(m0_out_QSV_2_0),
        .io_out_QSV_2_1(m0_out_QSV_2_1),
        .io_out_QSV_3_0(m0_out_QSV_3_0),
        .io_out_QSV_3_1(m0_out_QSV_3_1),
        .io_out_valid(m0_out_valid)
    );

    // Step 1: X(1) - Requires CompatiblePerm before and after since it targets qubit 1
    CompatiblePerm m1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m0_out_QSV_0_0),
        .io_in_QSV_0_1(m0_out_QSV_0_1),
        .io_in_QSV_1_0(m0_out_QSV_1_0),
        .io_in_QSV_1_1(m0_out_QSV_1_1),
        .io_in_QSV_2_0(m0_out_QSV_2_0),
        .io_in_QSV_2_1(m0_out_QSV_2_1),
        .io_in_QSV_3_0(m0_out_QSV_3_0),
        .io_in_QSV_3_1(m0_out_QSV_3_1),
        .io_in_valid(m0_out_valid),
        .io_out_QSV_0_0(m1_out_QSV_0_0),
        .io_out_QSV_0_1(m1_out_QSV_0_1),
        .io_out_QSV_1_0(m1_out_QSV_1_0),
        .io_out_QSV_1_1(m1_out_QSV_1_1),
        .io_out_QSV_2_0(m1_out_QSV_2_0),
        .io_out_QSV_2_1(m1_out_QSV_2_1),
        .io_out_QSV_3_0(m1_out_QSV_3_0),
        .io_out_QSV_3_1(m1_out_QSV_3_1),
        .io_out_valid(m1_out_valid)
    );

    XGate2QubitVector16bit m2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m1_out_QSV_0_0),
        .io_in_QSV_0_1(m1_out_QSV_0_1),
        .io_in_QSV_1_0(m1_out_QSV_1_0),
        .io_in_QSV_1_1(m1_out_QSV_1_1),
        .io_in_QSV_2_0(m1_out_QSV_2_0),
        .io_in_QSV_2_1(m1_out_QSV_2_1),
        .io_in_QSV_3_0(m1_out_QSV_3_0),
        .io_in_QSV_3_1(m1_out_QSV_3_1),
        .io_in_valid(m1_out_valid),
        .io_out_QSV_0_0(m2_out_QSV_0_0),
        .io_out_QSV_0_1(m2_out_QSV_0_1),
        .io_out_QSV_1_0(m2_out_QSV_1_0),
        .io_out_QSV_1_1(m2_out_QSV_1_1),
        .io_out_QSV_2_0(m2_out_QSV_2_0),
        .io_out_QSV_2_1(m2_out_QSV_2_1),
        .io_out_QSV_3_0(m2_out_QSV_3_0),
        .io_out_QSV_3_1(m2_out_QSV_3_1),
        .io_out_valid(m2_out_valid)
    );

    CompatiblePerm m3 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m2_out_QSV_0_0),
        .io_in_QSV_0_1(m2_out_QSV_0_1),
        .io_in_QSV_1_0(m2_out_QSV_1_0),
        .io_in_QSV_1_1(m2_out_QSV_1_1),
        .io_in_QSV_2_0(m2_out_QSV_2_0),
        .io_in_QSV_2_1(m2_out_QSV_2_1),
        .io_in_QSV_3_0(m2_out_QSV_3_0),
        .io_in_QSV_3_1(m2_out_QSV_3_1),
        .io_in_valid(m2_out_valid),
        .io_out_QSV_0_0(m3_out_QSV_0_0),
        .io_out_QSV_0_1(m3_out_QSV_0_1),
        .io_out_QSV_1_0(m3_out_QSV_1_0),
        .io_out_QSV_1_1(m3_out_QSV_1_1),
        .io_out_QSV_2_0(m3_out_QSV_2_0),
        .io_out_QSV_2_1(m3_out_QSV_2_1),
        .io_out_QSV_3_0(m3_out_QSV_3_0),
        .io_out_QSV_3_1(m3_out_QSV_3_1),
        .io_out_valid(m3_out_valid)
    );

    // Step 2: SWAP(0, 1) - Operates across the full vector, no permutation needed
    SWGate2QubitVector16bit m4 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m3_out_QSV_0_0),
        .io_in_QSV_0_1(m3_out_QSV_0_1),
        .io_in_QSV_1_0(m3_out_QSV_1_0),
        .io_in_QSV_1_1(m3_out_QSV_1_1),
        .io_in_QSV_2_0(m3_out_QSV_2_0),
        .io_in_QSV_2_1(m3_out_QSV_2_1),
        .io_in_QSV_3_0(m3_out_QSV_3_0),
        .io_in_QSV_3_1(m3_out_QSV_3_1),
        .io_in_valid(m3_out_valid),
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
