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

    // Intermediate wires for Stage 0 (H Gate)
    wire [15:0] _m0_io_out_QSV_0_0;
    wire [15:0] _m0_io_out_QSV_0_1;
    wire [15:0] _m0_io_out_QSV_1_0;
    wire [15:0] _m0_io_out_QSV_1_1;
    wire [15:0] _m0_io_out_QSV_2_0;
    wire [15:0] _m0_io_out_QSV_2_1;
    wire [15:0] _m0_io_out_QSV_3_0;
    wire [15:0] _m0_io_out_QSV_3_1;
    wire        _m0_io_out_valid;

    // Intermediate wires for Stage 1 (Permutation Before SXdg)
    wire [15:0] _m1_io_out_QSV_0_0;
    wire [15:0] _m1_io_out_QSV_0_1;
    wire [15:0] _m1_io_out_QSV_1_0;
    wire [15:0] _m1_io_out_QSV_1_1;
    wire [15:0] _m1_io_out_QSV_2_0;
    wire [15:0] _m1_io_out_QSV_2_1;
    wire [15:0] _m1_io_out_QSV_3_0;
    wire [15:0] _m1_io_out_QSV_3_1;
    wire        _m1_io_out_valid;

    // Intermediate wires for Stage 2 (SXdg Gate)
    wire [15:0] _m2_io_out_QSV_0_0;
    wire [15:0] _m2_io_out_QSV_0_1;
    wire [15:0] _m2_io_out_QSV_1_0;
    wire [15:0] _m2_io_out_QSV_1_1;
    wire [15:0] _m2_io_out_QSV_2_0;
    wire [15:0] _m2_io_out_QSV_2_1;
    wire [15:0] _m2_io_out_QSV_3_0;
    wire [15:0] _m2_io_out_QSV_3_1;
    wire        _m2_io_out_valid;

    // Intermediate wires for Stage 3 (Permutation After SXdg)
    wire [15:0] _m3_io_out_QSV_0_0;
    wire [15:0] _m3_io_out_QSV_0_1;
    wire [15:0] _m3_io_out_QSV_1_0;
    wire [15:0] _m3_io_out_QSV_1_1;
    wire [15:0] _m3_io_out_QSV_2_0;
    wire [15:0] _m3_io_out_QSV_2_1;
    wire [15:0] _m3_io_out_QSV_3_0;
    wire [15:0] _m3_io_out_QSV_3_1;
    wire        _m3_io_out_valid;

    // Step 0: H gate on Qubit 0 (No permutation needed)
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
        .io_out_QSV_0_0(_m0_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m0_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m0_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m0_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m0_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m0_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m0_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m0_io_out_QSV_3_1),
        .io_out_valid(_m0_io_out_valid)
    );

    // Step 1: SXdg gate on Qubit 1 (Permutation required before)
    CompatiblePerm m1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m0_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m0_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m0_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m0_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m0_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m0_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m0_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m0_io_out_QSV_3_1),
        .io_in_valid(_m0_io_out_valid),
        .io_out_QSV_0_0(_m1_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m1_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m1_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m1_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m1_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m1_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m1_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m1_io_out_QSV_3_1),
        .io_out_valid(_m1_io_out_valid)
    );

    // Step 1: SXdg gate
    SXDGate2QubitVector16bit m2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m1_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m1_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m1_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m1_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m1_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m1_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m1_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m1_io_out_QSV_3_1),
        .io_in_valid(_m1_io_out_valid),
        .io_out_QSV_0_0(_m2_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m2_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m2_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m2_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m2_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m2_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m2_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m2_io_out_QSV_3_1),
        .io_out_valid(_m2_io_out_valid)
    );

    // Step 1: Permutation after SXdg
    CompatiblePerm m3 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m2_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m2_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m2_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m2_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m2_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m2_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m2_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m2_io_out_QSV_3_1),
        .io_in_valid(_m2_io_out_valid),
        .io_out_QSV_0_0(_m3_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m3_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m3_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m3_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m3_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m3_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m3_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m3_io_out_QSV_3_1),
        .io_out_valid(_m3_io_out_valid)
    );

    // Step 2: SWAP gate (No permutation needed)
    SWGate2QubitVector16bit m4 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m3_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m3_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m3_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m3_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m3_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m3_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m3_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m3_io_out_QSV_3_1),
        .io_in_valid(_m3_io_out_valid),
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
