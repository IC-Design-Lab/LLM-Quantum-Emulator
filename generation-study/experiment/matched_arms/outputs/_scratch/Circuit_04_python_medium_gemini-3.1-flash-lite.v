module Circuit_04 (
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

    // Intermediate wires
    logic [15:0] m0_out_0_0, m0_out_0_1, m0_out_1_0, m0_out_1_1, m0_out_2_0, m0_out_2_1, m0_out_3_0, m0_out_3_1;
    logic m0_out_valid;

    logic [15:0] p1_out_0_0, p1_out_0_1, p1_out_1_0, p1_out_1_1, p1_out_2_0, p1_out_2_1, p1_out_3_0, p1_out_3_1;
    logic p1_out_valid;

    logic [15:0] m2_out_0_0, m2_out_0_1, m2_out_1_0, m2_out_1_1, m2_out_2_0, m2_out_2_1, m2_out_3_0, m2_out_3_1;
    logic m2_out_valid;

    logic [15:0] p3_out_0_0, p3_out_0_1, p3_out_1_0, p3_out_1_1, p3_out_2_0, p3_out_2_1, p3_out_3_0, p3_out_3_1;
    logic p3_out_valid;

    // 1. qc.h(0)
    HGate2QubitVector16bit m0 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
        .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
        .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_in_valid(io_in_valid),
        .io_out_QSV_0_0(m0_out_0_0), .io_out_QSV_0_1(m0_out_0_1),
        .io_out_QSV_1_0(m0_out_1_0), .io_out_QSV_1_1(m0_out_1_1),
        .io_out_QSV_2_0(m0_out_2_0), .io_out_QSV_2_1(m0_out_2_1),
        .io_out_QSV_3_0(m0_out_3_0), .io_out_QSV_3_1(m0_out_3_1),
        .io_out_valid(m0_out_valid)
    );

    // 2. qc.sxdg(1) requires permutation
    CompatiblePerm p1 (
        .clock(clock), .reset(reset),
        .io_in_QSV_0_0(m0_out_0_0), .io_in_QSV_0_1(m0_out_0_1),
        .io_in_QSV_1_0(m0_out_1_0), .io_in_QSV_1_1(m0_out_1_1),
        .io_in_QSV_2_0(m0_out_2_0), .io_in_QSV_2_1(m0_out_2_1),
        .io_in_QSV_3_0(m0_out_3_0), .io_in_QSV_3_1(m0_out_3_1),
        .io_in_valid(m0_out_valid),
        .io_out_QSV_0_0(p1_out_0_0), .io_out_QSV_0_1(p1_out_0_1),
        .io_out_QSV_1_0(p1_out_1_0), .io_out_QSV_1_1(p1_out_1_1),
        .io_out_QSV_2_0(p1_out_2_0), .io_out_QSV_2_1(p1_out_2_1),
        .io_out_QSV_3_0(p1_out_3_0), .io_out_QSV_3_1(p1_out_3_1),
        .io_out_valid(p1_out_valid)
    );

    SXDGate2QubitVector16bit m2 (
        .clock(clock), .reset(reset),
        .io_in_QSV_0_0(p1_out_0_0), .io_in_QSV_0_1(p1_out_0_1),
        .io_in_QSV_1_0(p1_out_1_0), .io_in_QSV_1_1(p1_out_1_1),
        .io_in_QSV_2_0(p1_out_2_0), .io_in_QSV_2_1(p1_out_2_1),
        .io_in_QSV_3_0(p1_out_3_0), .io_in_QSV_3_1(p1_out_3_1),
        .io_in_valid(p1_out_valid),
        .io_out_QSV_0_0(m2_out_0_0), .io_out_QSV_0_1(m2_out_0_1),
        .io_out_QSV_1_0(m2_out_1_0), .io_out_QSV_1_1(m2_out_1_1),
        .io_out_QSV_2_0(m2_out_2_0), .io_out_QSV_2_1(m2_out_2_1),
        .io_out_QSV_3_0(m2_out_3_0), .io_out_QSV_3_1(m2_out_3_1),
        .io_out_valid(m2_out_valid)
    );

    CompatiblePerm p3 (
        .clock(clock), .reset(reset),
        .io_in_QSV_0_0(m2_out_0_0), .io_in_QSV_0_1(m2_out_0_1),
        .io_in_QSV_1_0(m2_out_1_0), .io_in_QSV_1_1(m2_out_1_1),
        .io_in_QSV_2_0(m2_out_2_0), .io_in_QSV_2_1(m2_out_2_1),
        .io_in_QSV_3_0(m2_out_3_0), .io_in_QSV_3_1(m2_out_3_1),
        .io_in_valid(m2_out_valid),
        .io_out_QSV_0_0(p3_out_0_0), .io_out_QSV_0_1(p3_out_0_1),
        .io_out_QSV_1_0(p3_out_1_0), .io_out_QSV_1_1(p3_out_1_1),
        .io_out_QSV_2_0(p3_out_2_0), .io_out_QSV_2_1(p3_out_2_1),
        .io_out_QSV_3_0(p3_out_3_0), .io_out_QSV_3_1(p3_out_3_1),
        .io_out_valid(p3_out_valid)
    );

    // 3. qc.swap(0, 1)
    SWGate2QubitVector16bit m4 (
        .clock(clock), .reset(reset),
        .io_in_QSV_0_0(p3_out_0_0), .io_in_QSV_0_1(p3_out_0_1),
        .io_in_QSV_1_0(p3_out_1_0), .io_in_QSV_1_1(p3_out_1_1),
        .io_in_QSV_2_0(p3_out_2_0), .io_in_QSV_2_1(p3_out_2_1),
        .io_in_QSV_3_0(p3_out_3_0), .io_in_QSV_3_1(p3_out_3_1),
        .io_in_valid(p3_out_valid),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_valid(io_out_valid)
    );

endmodule
