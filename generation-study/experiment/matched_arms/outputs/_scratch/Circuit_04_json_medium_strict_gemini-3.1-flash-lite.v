module Circuit_04 (
    input  clock,
    input  reset,
    input  [15:0] io_in_QSV_0_0,
    input  [15:0] io_in_QSV_0_1,
    input  [15:0] io_in_QSV_1_0,
    input  [15:0] io_in_QSV_1_1,
    input  [15:0] io_in_QSV_2_0,
    input  [15:0] io_in_QSV_2_1,
    input  [15:0] io_in_QSV_3_0,
    input  [15:0] io_in_QSV_3_1,
    input  io_in_valid,
    output [15:0] io_out_QSV_0_0,
    output [15:0] io_out_QSV_0_1,
    output [15:0] io_out_QSV_1_0,
    output [15:0] io_out_QSV_1_1,
    output [15:0] io_out_QSV_2_0,
    output [15:0] io_out_QSV_2_1,
    output [15:0] io_out_QSV_3_0,
    output [15:0] io_out_QSV_3_1,
    output io_out_valid
);

    // Intermediate wires for pipeline
    wire [15:0] m0_out_0_0, m0_out_0_1, m0_out_1_0, m0_out_1_1, m0_out_2_0, m0_out_2_1, m0_out_3_0, m0_out_3_1;
    wire m0_out_valid;

    wire [15:0] p1_out_0_0, p1_out_0_1, p1_out_1_0, p1_out_1_1, p1_out_2_0, p1_out_2_1, p1_out_3_0, p1_out_3_1;
    wire p1_out_valid;

    wire [15:0] m1_out_0_0, m1_out_0_1, m1_out_1_0, m1_out_1_1, m1_out_2_0, m1_out_2_1, m1_out_3_0, m1_out_3_1;
    wire m1_out_valid;

    wire [15:0] p2_out_0_0, p2_out_0_1, p2_out_1_0, p2_out_1_1, p2_out_2_0, p2_out_2_1, p2_out_3_0, p2_out_3_1;
    wire p2_out_valid;

    // Step 0: H on qubit 0 (No perm)
    HGate2QubitVector16bit m0 (
        .clock(clock), .reset(reset), .io_in_valid(io_in_valid),
        .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
        .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
        .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_out_QSV_0_0(m0_out_0_0), .io_out_QSV_0_1(m0_out_0_1),
        .io_out_QSV_1_0(m0_out_1_0), .io_out_QSV_1_1(m0_out_1_1),
        .io_out_QSV_2_0(m0_out_2_0), .io_out_QSV_2_1(m0_out_2_1),
        .io_out_QSV_3_0(m0_out_3_0), .io_out_QSV_3_1(m0_out_3_1),
        .io_out_valid(m0_out_valid)
    );

    // Step 1: SXdg on qubit 1 (Requires perm)
    CompatiblePerm p1 (
        .clock(clock), .reset(reset), .io_in_valid(m0_out_valid),
        .io_in_QSV_0_0(m0_out_0_0), .io_in_QSV_0_1(m0_out_0_1),
        .io_in_QSV_1_0(m0_out_1_0), .io_in_QSV_1_1(m0_out_1_1),
        .io_in_QSV_2_0(m0_out_2_0), .io_in_QSV_2_1(m0_out_2_1),
        .io_in_QSV_3_0(m0_out_3_0), .io_in_QSV_3_1(m0_out_3_1),
        .io_out_QSV_0_0(p1_out_0_0), .io_out_QSV_0_1(p1_out_0_1),
        .io_out_QSV_1_0(p1_out_1_0), .io_out_QSV_1_1(p1_out_1_1),
        .io_out_QSV_2_0(p1_out_2_0), .io_out_QSV_2_1(p1_out_2_1),
        .io_out_QSV_3_0(p1_out_3_0), .io_out_QSV_3_1(p1_out_3_1),
        .io_out_valid(p1_out_valid)
    );

    SXDGate2QubitVector16bit m1 (
        .clock(clock), .reset(reset), .io_in_valid(p1_out_valid),
        .io_in_QSV_0_0(p1_out_0_0), .io_in_QSV_0_1(p1_out_0_1),
        .io_in_QSV_1_0(p1_out_1_0), .io_in_QSV_1_1(p1_out_1_1),
        .io_in_QSV_2_0(p1_out_2_0), .io_in_QSV_2_1(p1_out_2_1),
        .io_in_QSV_3_0(p1_out_3_0), .io_in_QSV_3_1(p1_out_3_1),
        .io_out_QSV_0_0(m1_out_0_0), .io_out_QSV_0_1(m1_out_0_1),
        .io_out_QSV_1_0(m1_out_1_0), .io_out_QSV_1_1(m1_out_1_1),
        .io_out_QSV_2_0(m1_out_2_0), .io_out_QSV_2_1(m1_out_2_1),
        .io_out_QSV_3_0(m1_out_3_0), .io_out_QSV_3_1(m1_out_3_1),
        .io_out_valid(m1_out_valid)
    );

    CompatiblePerm p2 (
        .clock(clock), .reset(reset), .io_in_valid(m1_out_valid),
        .io_in_QSV_0_0(m1_out_0_0), .io_in_QSV_0_1(m1_out_0_1),
        .io_in_QSV_1_0(m1_out_1_0), .io_in_QSV_1_1(m1_out_1_1),
        .io_in_QSV_2_0(m1_out_2_0), .io_in_QSV_2_1(m1_out_2_1),
        .io_in_QSV_3_0(m1_out_3_0), .io_in_QSV_3_1(m1_out_3_1),
        .io_out_QSV_0_0(p2_out_0_0), .io_out_QSV_0_1(p2_out_0_1),
        .io_out_QSV_1_0(p2_out_1_0), .io_out_QSV_1_1(p2_out_1_1),
        .io_out_QSV_2_0(p2_out_2_0), .io_out_QSV_2_1(p2_out_2_1),
        .io_out_QSV_3_0(p2_out_3_0), .io_out_QSV_3_1(p2_out_3_1),
        .io_out_valid(p2_out_valid)
    );

    // Step 2: Swap (No perm needed for Swap)
    SWGate2QubitVector16bit m2 (
        .clock(clock), .reset(reset), .io_in_valid(p2_out_valid),
        .io_in_QSV_0_0(p2_out_0_0), .io_in_QSV_0_1(p2_out_0_1),
        .io_in_QSV_1_0(p2_out_1_0), .io_in_QSV_1_1(p2_out_1_1),
        .io_in_QSV_2_0(p2_out_2_0), .io_in_QSV_2_1(p2_out_2_1),
        .io_in_QSV_3_0(p2_out_3_0), .io_in_QSV_3_1(p2_out_3_1),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_valid(io_out_valid)
    );

endmodule
