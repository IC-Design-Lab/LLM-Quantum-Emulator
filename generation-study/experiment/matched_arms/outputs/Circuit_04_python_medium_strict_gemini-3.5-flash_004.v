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

    // Intermediate signals for Stage 1 (HGate2QubitVector16bit)
    logic [15:0] _m1_io_out_QSV_0_0;
    logic [15:0] _m1_io_out_QSV_0_1;
    logic [15:0] _m1_io_out_QSV_1_0;
    logic [15:0] _m1_io_out_QSV_1_1;
    logic [15:0] _m1_io_out_QSV_2_0;
    logic [15:0] _m1_io_out_QSV_2_1;
    logic [15:0] _m1_io_out_QSV_3_0;
    logic [15:0] _m1_io_out_QSV_3_1;
    logic        _m1_io_out_valid;

    // Intermediate signals for Stage 2 (CompatiblePerm - pre SXdg)
    logic [15:0] _m2_io_out_QSV_0_0;
    logic [15:0] _m2_io_out_QSV_0_1;
    logic [15:0] _m2_io_out_QSV_1_0;
    logic [15:0] _m2_io_out_QSV_1_1;
    logic [15:0] _m2_io_out_QSV_2_0;
    logic [15:0] _m2_io_out_QSV_2_1;
    logic [15:0] _m2_io_out_QSV_3_0;
    logic [15:0] _m2_io_out_QSV_3_1;
    logic        _m2_io_out_valid;

    // Intermediate signals for Stage 3 (SXDGate2QubitVector16bit)
    logic [15:0] _m3_io_out_QSV_0_0;
    logic [15:0] _m3_io_out_QSV_0_1;
    logic [15:0] _m3_io_out_QSV_1_0;
    logic [15:0] _m3_io_out_QSV_1_1;
    logic [15:0] _m3_io_out_QSV_2_0;
    logic [15:0] _m3_io_out_QSV_2_1;
    logic [15:0] _m3_io_out_QSV_3_0;
    logic [15:0] _m3_io_out_QSV_3_1;
    logic        _m3_io_out_valid;

    // Intermediate signals for Stage 4 (CompatiblePerm - post SXdg)
    logic [15:0] _m4_io_out_QSV_0_0;
    logic [15:0] _m4_io_out_QSV_0_1;
    logic [15:0] _m4_io_out_QSV_1_0;
    logic [15:0] _m4_io_out_QSV_1_1;
    logic [15:0] _m4_io_out_QSV_2_0;
    logic [15:0] _m4_io_out_QSV_2_1;
    logic [15:0] _m4_io_out_QSV_3_0;
    logic [15:0] _m4_io_out_QSV_3_1;
    logic        _m4_io_out_valid;

    // Stage 1: Hadamard Gate on Qubit 0
    HGate2QubitVector16bit m1 (
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

    // Stage 2: Permutation before SXdg Gate on Qubit 1
    CompatiblePerm m2 (
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

    // Stage 3: SXdg Gate on Qubit 1
    SXDGate2QubitVector16bit m3 (
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

    // Stage 4: Permutation after SXdg Gate on Qubit 1
    CompatiblePerm m4 (
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
        .io_out_QSV_0_0(_m4_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m4_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m4_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m4_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m4_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m4_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m4_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m4_io_out_QSV_3_1),
        .io_out_valid(_m4_io_out_valid)
    );

    // Stage 5: SWAP Gate
    SWGate2QubitVector16bit m5 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m4_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m4_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m4_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m4_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m4_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m4_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m4_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m4_io_out_QSV_3_1),
        .io_in_valid(_m4_io_out_valid),
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
