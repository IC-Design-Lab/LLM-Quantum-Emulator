module Circuit_08 (
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

    wire [15:0] m0_out_QSV_0_0, m0_out_QSV_0_1, m0_out_QSV_1_0, m0_out_QSV_1_1, m0_out_QSV_2_0, m0_out_QSV_2_1, m0_out_QSV_3_0, m0_out_QSV_3_1;
    wire m0_out_valid;

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

    wire [15:0] p1_out_QSV_0_0, p1_out_QSV_0_1, p1_out_QSV_1_0, p1_out_QSV_1_1, p1_out_QSV_2_0, p1_out_QSV_2_1, p1_out_QSV_3_0, p1_out_QSV_3_1;
    wire p1_out_valid;

    CompatiblePerm p1 (
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
        .io_out_QSV_0_0(p1_out_QSV_0_0),
        .io_out_QSV_0_1(p1_out_QSV_0_1),
        .io_out_QSV_1_0(p1_out_QSV_1_0),
        .io_out_QSV_1_1(p1_out_QSV_1_1),
        .io_out_QSV_2_0(p1_out_QSV_2_0),
        .io_out_QSV_2_1(p1_out_QSV_2_1),
        .io_out_QSV_3_0(p1_out_QSV_3_0),
        .io_out_QSV_3_1(p1_out_QSV_3_1),
        .io_out_valid(p1_out_valid)
    );

    wire [15:0] m2_out_QSV_0_0, m2_out_QSV_0_1, m2_out_QSV_1_0, m2_out_QSV_1_1, m2_out_QSV_2_0, m2_out_QSV_2_1, m2_out_QSV_3_0, m2_out_QSV_3_1;
    wire m2_out_valid;

    CNGate2QubitVector16bit m2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(p1_out_QSV_0_0),
        .io_in_QSV_0_1(p1_out_QSV_0_1),
        .io_in_QSV_1_0(p1_out_QSV_1_0),
        .io_in_QSV_1_1(p1_out_QSV_1_1),
        .io_in_QSV_2_0(p1_out_QSV_2_0),
        .io_in_QSV_2_1(p1_out_QSV_2_1),
        .io_in_QSV_3_0(p1_out_QSV_3_0),
        .io_in_QSV_3_1(p1_out_QSV_3_1),
        .io_in_valid(p1_out_valid),
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

    wire [15:0] p3_out_QSV_0_0, p3_out_QSV_0_1, p3_out_QSV_1_0, p3_out_QSV_1_1, p3_out_QSV_2_0, p3_out_QSV_2_1, p3_out_QSV_3_0, p3_out_QSV_3_1;
    wire p3_out_valid;

    CompatiblePerm p3 (
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
        .io_out_QSV_0_0(p3_out_QSV_0_0),
        .io_out_QSV_0_1(p3_out_QSV_0_1),
        .io_out_QSV_1_0(p3_out_QSV_1_0),
        .io_out_QSV_1_1(p3_out_QSV_1_1),
        .io_out_QSV_2_0(p3_out_QSV_2_0),
        .io_out_QSV_2_1(p3_out_QSV_2_1),
        .io_out_QSV_3_0(p3_out_QSV_3_0),
        .io_out_QSV_3_1(p3_out_QSV_3_1),
        .io_out_valid(p3_out_valid)
    );

    SXGate2QubitVector16bit m4 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(p3_out_QSV_0_0),
        .io_in_QSV_0_1(p3_out_QSV_0_1),
        .io_in_QSV_1_0(p3_out_QSV_1_0),
        .io_in_QSV_1_1(p3_out_QSV_1_1),
        .io_in_QSV_2_0(p3_out_QSV_2_0),
        .io_in_QSV_2_1(p3_out_QSV_2_1),
        .io_in_QSV_3_0(p3_out_QSV_3_0),
        .io_in_QSV_3_1(p3_out_QSV_3_1),
        .io_in_valid(p3_out_valid),
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
