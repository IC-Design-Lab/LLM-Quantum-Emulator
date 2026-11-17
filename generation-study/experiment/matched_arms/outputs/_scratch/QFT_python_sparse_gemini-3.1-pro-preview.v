module QFT (
    input  wire       clock,
    input  wire       reset,
    input  wire [7:0] io_in_QSV_0_0,
    input  wire [7:0] io_in_QSV_0_1,
    input  wire [7:0] io_in_QSV_1_0,
    input  wire [7:0] io_in_QSV_1_1,
    input  wire [7:0] io_in_QSV_2_0,
    input  wire [7:0] io_in_QSV_2_1,
    input  wire [7:0] io_in_QSV_3_0,
    input  wire [7:0] io_in_QSV_3_1,
    input  wire [7:0] io_in_QSV_4_0,
    input  wire [7:0] io_in_QSV_4_1,
    input  wire [7:0] io_in_QSV_5_0,
    input  wire [7:0] io_in_QSV_5_1,
    input  wire [7:0] io_in_QSV_6_0,
    input  wire [7:0] io_in_QSV_6_1,
    input  wire [7:0] io_in_QSV_7_0,
    input  wire [7:0] io_in_QSV_7_1,
    input  wire       io_in_valid,
    output wire [7:0] io_out_QSV_0_0,
    output wire [7:0] io_out_QSV_0_1,
    output wire [7:0] io_out_QSV_1_0,
    output wire [7:0] io_out_QSV_1_1,
    output wire [7:0] io_out_QSV_2_0,
    output wire [7:0] io_out_QSV_2_1,
    output wire [7:0] io_out_QSV_3_0,
    output wire [7:0] io_out_QSV_3_1,
    output wire [7:0] io_out_QSV_4_0,
    output wire [7:0] io_out_QSV_4_1,
    output wire [7:0] io_out_QSV_5_0,
    output wire [7:0] io_out_QSV_5_1,
    output wire [7:0] io_out_QSV_6_0,
    output wire [7:0] io_out_QSV_6_1,
    output wire [7:0] io_out_QSV_7_0,
    output wire [7:0] io_out_QSV_7_1,
    output wire       io_out_valid
);

    wire [7:0] qsv_1_0_0, qsv_1_0_1, qsv_1_1_0, qsv_1_1_1, qsv_1_2_0, qsv_1_2_1, qsv_1_3_0, qsv_1_3_1;
    wire [7:0] qsv_1_4_0, qsv_1_4_1, qsv_1_5_0, qsv_1_5_1, qsv_1_6_0, qsv_1_6_1, qsv_1_7_0, qsv_1_7_1;
    wire valid_1;

    wire [7:0] qsv_2_0_0, qsv_2_0_1, qsv_2_1_0, qsv_2_1_1, qsv_2_2_0, qsv_2_2_1, qsv_2_3_0, qsv_2_3_1;
    wire [7:0] qsv_2_4_0, qsv_2_4_1, qsv_2_5_0, qsv_2_5_1, qsv_2_6_0, qsv_2_6_1, qsv_2_7_0, qsv_2_7_1;
    wire valid_2;

    wire [7:0] qsv_3_0_0, qsv_3_0_1, qsv_3_1_0, qsv_3_1_1, qsv_3_2_0, qsv_3_2_1, qsv_3_3_0, qsv_3_3_1;
    wire [7:0] qsv_3_4_0, qsv_3_4_1, qsv_3_5_0, qsv_3_5_1, qsv_3_6_0, qsv_3_6_1, qsv_3_7_0, qsv_3_7_1;
    wire valid_3;

    wire [7:0] qsv_4_0_0, qsv_4_0_1, qsv_4_1_0, qsv_4_1_1, qsv_4_2_0, qsv_4_2_1, qsv_4_3_0, qsv_4_3_1;
    wire [7:0] qsv_4_4_0, qsv_4_4_1, qsv_4_5_0, qsv_4_5_1, qsv_4_6_0, qsv_4_6_1, qsv_4_7_0, qsv_4_7_1;
    wire valid_4;

    wire [7:0] qsv_5_0_0, qsv_5_0_1, qsv_5_1_0, qsv_5_1_1, qsv_5_2_0, qsv_5_2_1, qsv_5_3_0, qsv_5_3_1;
    wire [7:0] qsv_5_4_0, qsv_5_4_1, qsv_5_5_0, qsv_5_5_1, qsv_5_6_0, qsv_5_6_1, qsv_5_7_0, qsv_5_7_1;
    wire valid_5;

    wire [7:0] qsv_6_0_0, qsv_6_0_1, qsv_6_1_0, qsv_6_1_1, qsv_6_2_0, qsv_6_2_1, qsv_6_3_0, qsv_6_3_1;
    wire [7:0] qsv_6_4_0, qsv_6_4_1, qsv_6_5_0, qsv_6_5_1, qsv_6_6_0, qsv_6_6_1, qsv_6_7_0, qsv_6_7_1;
    wire valid_6;

    // Stage 1: qc.h(0)
    H_gate #(
        .QUBIT(0)
    ) h_gate_0 (
        .clock(clock), .reset(reset),
        .io_in_valid(io_in_valid),
        .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
        .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
        .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_in_QSV_4_0(io_in_QSV_4_0), .io_in_QSV_4_1(io_in_QSV_4_1),
        .io_in_QSV_5_0(io_in_QSV_5_0), .io_in_QSV_5_1(io_in_QSV_5_1),
        .io_in_QSV_6_0(io_in_QSV_6_0), .io_in_QSV_6_1(io_in_QSV_6_1),
        .io_in_QSV_7_0(io_in_QSV_7_0), .io_in_QSV_7_1(io_in_QSV_7_1),
        .io_out_valid(valid_1),
        .io_out_QSV_0_0(qsv_1_0_0), .io_out_QSV_0_1(qsv_1_0_1),
        .io_out_QSV_1_0(qsv_1_1_0), .io_out_QSV_1_1(qsv_1_1_1),
        .io_out_QSV_2_0(qsv_1_2_0), .io_out_QSV_2_1(qsv_1_2_1),
        .io_out_QSV_3_0(qsv_1_3_0), .io_out_QSV_3_1(qsv_1_3_1),
        .io_out_QSV_4_0(qsv_1_4_0), .io_out_QSV_4_1(qsv_1_4_1),
        .io_out_QSV_5_0(qsv_1_5_0), .io_out_QSV_5_1(qsv_1_5_1),
        .io_out_QSV_6_0(qsv_1_6_0), .io_out_QSV_6_1(qsv_1_6_1),
        .io_out_QSV_7_0(qsv_1_7_0), .io_out_QSV_7_1(qsv_1_7_1)
    );

    // Stage 2: qc.cs(1, 0)
    CS_gate #(
        .CONTROL(1), .TARGET(0)
    ) cs_gate_0 (
        .clock(clock), .reset(reset),
        .io_in_valid(valid_1),
        .io_in_QSV_0_0(qsv_1_0_0), .io_in_QSV_0_1(qsv_1_0_1),
        .io_in_QSV_1_0(qsv_1_1_0), .io_in_QSV_1_1(qsv_1_1_1),
        .io_in_QSV_2_0(qsv_1_2_0), .io_in_QSV_2_1(qsv_1_2_1),
        .io_in_QSV_3_0(qsv_1_3_0), .io_in_QSV_3_1(qsv_1_3_1),
        .io_in_QSV_4_0(qsv_1_4_0), .io_in_QSV_4_1(qsv_1_4_1),
        .io_in_QSV_5_0(qsv_1_5_0), .io_in_QSV_5_1(qsv_1_5_1),
        .io_in_QSV_6_0(qsv_1_6_0), .io_in_QSV_6_1(qsv_1_6_1),
        .io_in_QSV_7_0(qsv_1_7_0), .io_in_QSV_7_1(qsv_1_7_1),
        .io_out_valid(valid_2),
        .io_out_QSV_0_0(qsv_2_0_0), .io_out_QSV_0_1(qsv_2_0_1),
        .io_out_QSV_1_0(qsv_2_1_0), .io_out_QSV_1_1(qsv_2_1_1),
        .io_out_QSV_2_0(qsv_2_2_0), .io_out_QSV_2_1(qsv_2_2_1),
        .io_out_QSV_3_0(qsv_2_3_0), .io_out_QSV_3_1(qsv_2_3_1),
        .io_out_QSV_4_0(qsv_2_4_0), .io_out_QSV_4_1(qsv_2_4_1),
        .io_out_QSV_5_0(qsv_2_5_0), .io_out_QSV_5_1(qsv_2_5_1),
        .io_out_QSV_6_0(qsv_2_6_0), .io_out_QSV_6_1(qsv_2_6_1),
        .io_out_QSV_7_0(qsv_2_7_0), .io_out_QSV_7_1(qsv_2_7_1)
    );

    // Stage 3: qc.cp(math.pi / 4, 2, 0)
    CP_gate #(
        .CONTROL(2), .TARGET(0), .THETA("pi/4")
    ) cp_gate_0 (
        .clock(clock), .reset(reset),
        .io_in_valid(valid_2),
        .io_in_QSV_0_0(qsv_2_0_0), .io_in_QSV_0_1(qsv_2_0_1),
        .io_in_QSV_1_0(qsv_2_1_0), .io_in_QSV_1_1(qsv_2_1_1),
        .io_in_QSV_2_0(qsv_2_2_0), .io_in_QSV_2_1(qsv_2_2_1),
        .io_in_QSV_3_0(qsv_2_3_0), .io_in_QSV_3_1(qsv_2_3_1),
        .io_in_QSV_4_0(qsv_2_4_0), .io_in_QSV_4_1(qsv_2_4_1),
        .io_in_QSV_5_0(qsv_2_5_0), .io_in_QSV_5_1(qsv_2_5_1),
        .io_in_QSV_6_0(qsv_2_6_0), .io_in_QSV_6_1(qsv_2_6_1),
        .io_in_QSV_7_0(qsv_2_7_0), .io_in_QSV_7_1(qsv_2_7_1),
        .io_out_valid(valid_3),
        .io_out_QSV_0_0(qsv_3_0_0), .io_out_QSV_0_1(qsv_3_0_1),
        .io_out_QSV_1_0(qsv_3_1_0), .io_out_QSV_1_1(qsv_3_1_1),
        .io_out_QSV_2_0(qsv_3_2_0), .io_out_QSV_2_1(qsv_3_2_1),
        .io_out_QSV_3_0(qsv_3_3_0), .io_out_QSV_3_1(qsv_3_3_1),
        .io_out_QSV_4_0(qsv_3_4_0), .io_out_QSV_4_1(qsv_3_4_1),
        .io_out_QSV_5_0(qsv_3_5_0), .io_out_QSV_5_1(qsv_3_5_1),
        .io_out_QSV_6_0(qsv_3_6_0), .io_out_QSV_6_1(qsv_3_6_1),
        .io_out_QSV_7_0(qsv_3_7_0), .io_out_QSV_7_1(qsv_3_7_1)
    );

    // Stage 4: qc.h(1)
    H_gate #(
        .QUBIT(1)
    ) h_gate_1 (
        .clock(clock), .reset(reset),
        .io_in_valid(valid_3),
        .io_in_QSV_0_0(qsv_3_0_0), .io_in_QSV_0_1(qsv_3_0_1),
        .io_in_QSV_1_0(qsv_3_1_0), .io_in_QSV_1_1(qsv_3_1_1),
        .io_in_QSV_2_0(qsv_3_2_0), .io_in_QSV_2_1(qsv_3_2_1),
        .io_in_QSV_3_0(qsv_3_3_0), .io_in_QSV_3_1(qsv_3_3_1),
        .io_in_QSV_4_0(qsv_3_4_0), .io_in_QSV_4_1(qsv_3_4_1),
        .io_in_QSV_5_0(qsv_3_5_0), .io_in_QSV_5_1(qsv_3_5_1),
        .io_in_QSV_6_0(qsv_3_6_0), .io_in_QSV_6_1(qsv_3_6_1),
        .io_in_QSV_7_0(qsv_3_7_0), .io_in_QSV_7_1(qsv_3_7_1),
        .io_out_valid(valid_4),
        .io_out_QSV_0_0(qsv_4_0_0), .io_out_QSV_0_1(qsv_4_0_1),
        .io_out_QSV_1_0(qsv_4_1_0), .io_out_QSV_1_1(qsv_4_1_1),
        .io_out_QSV_2_0(qsv_4_2_0), .io_out_QSV_2_1(qsv_4_2_1),
        .io_out_QSV_3_0(qsv_4_3_0), .io_out_QSV_3_1(qsv_4_3_1),
        .io_out_QSV_4_0(qsv_4_4_0), .io_out_QSV_4_1(qsv_4_4_1),
        .io_out_QSV_5_0(qsv_4_5_0), .io_out_QSV_5_1(qsv_4_5_1),
        .io_out_QSV_6_0(qsv_4_6_0), .io_out_QSV_6_1(qsv_4_6_1),
        .io_out_QSV_7_0(qsv_4_7_0), .io_out_QSV_7_1(qsv_4_7_1)
    );

    // Stage 5: qc.cs(2, 1)
    CS_gate #(
        .CONTROL(2), .TARGET(1)
    ) cs_gate_1 (
        .clock(clock), .reset(reset),
        .io_in_valid(valid_4),
        .io_in_QSV_0_0(qsv_4_0_0), .io_in_QSV_0_1(qsv_4_0_1),
        .io_in_QSV_1_0(qsv_4_1_0), .io_in_QSV_1_1(qsv_4_1_1),
        .io_in_QSV_2_0(qsv_4_2_0), .io_in_QSV_2_1(qsv_4_2_1),
        .io_in_QSV_3_0(qsv_4_3_0), .io_in_QSV_3_1(qsv_4_3_1),
        .io_in_QSV_4_0(qsv_4_4_0), .io_in_QSV_4_1(qsv_4_4_1),
        .io_in_QSV_5_0(qsv_4_5_0), .io_in_QSV_5_1(qsv_4_5_1),
        .io_in_QSV_6_0(qsv_4_6_0), .io_in_QSV_6_1(qsv_4_6_1),
        .io_in_QSV_7_0(qsv_4_7_0), .io_in_QSV_7_1(qsv_4_7_1),
        .io_out_valid(valid_5),
        .io_out_QSV_0_0(qsv_5_0_0), .io_out_QSV_0_1(qsv_5_0_1),
        .io_out_QSV_1_0(qsv_5_1_0), .io_out_QSV_1_1(qsv_5_1_1),
        .io_out_QSV_2_0(qsv_5_2_0), .io_out_QSV_2_1(qsv_5_2_1),
        .io_out_QSV_3_0(qsv_5_3_0), .io_out_QSV_3_1(qsv_5_3_1),
        .io_out_QSV_4_0(qsv_5_4_0), .io_out_QSV_4_1(qsv_5_4_1),
        .io_out_QSV_5_0(qsv_5_5_0), .io_out_QSV_5_1(qsv_5_5_1),
        .io_out_QSV_6_0(qsv_5_6_0), .io_out_QSV_6_1(qsv_5_6_1),
        .io_out_QSV_7_0(qsv_5_7_0), .io_out_QSV_7_1(qsv_5_7_1)
    );

    // Stage 6: qc.h(2)
    H_gate #(
        .QUBIT(2)
    ) h_gate_2 (
        .clock(clock), .reset(reset),
        .io_in_valid(valid_5),
        .io_in_QSV_0_0(qsv_5_0_0), .io_in_QSV_0_1(qsv_5_0_1),
        .io_in_QSV_1_0(qsv_5_1_0), .io_in_QSV_1_1(qsv_5_1_1),
        .io_in_QSV_2_0(qsv_5_2_0), .io_in_QSV_2_1(qsv_5_2_1),
        .io_in_QSV_3_0(qsv_5_3_0), .io_in_QSV_3_1(qsv_5_3_1),
        .io_in_QSV_4_0(qsv_5_4_0), .io_in_QSV_4_1(qsv_5_4_1),
        .io_in_QSV_5_0(qsv_5_5_0), .io_in_QSV_5_1(qsv_5_5_1),
        .io_in_QSV_6_0(qsv_5_6_0), .io_in_QSV_6_1(qsv_5_6_1),
        .io_in_QSV_7_0(qsv_5_7_0), .io_in_QSV_7_1(qsv_5_7_1),
        .io_out_valid(valid_6),
        .io_out_QSV_0_0(qsv_6_0_0), .io_out_QSV_0_1(qsv_6_0_1),
        .io_out_QSV_1_0(qsv_6_1_0), .io_out_QSV_1_1(qsv_6_1_1),
        .io_out_QSV_2_0(qsv_6_2_0), .io_out_QSV_2_1(qsv_6_2_1),
        .io_out_QSV_3_0(qsv_6_3_0), .io_out_QSV_3_1(qsv_6_3_1),
        .io_out_QSV_4_0(qsv_6_4_0), .io_out_QSV_4_1(qsv_6_4_1),
        .io_out_QSV_5_0(qsv_6_5_0), .io_out_QSV_5_1(qsv_6_5_1),
        .io_out_QSV_6_0(qsv_6_6_0), .io_out_QSV_6_1(qsv_6_6_1),
        .io_out_QSV_7_0(qsv_6_7_0), .io_out_QSV_7_1(qsv_6_7_1)
    );

    // Stage 7: qc.swap(0, 2)
    // Physical state routing maps logical indices for states via binary (q2 q1 q0):
    // 000 (0) <-> 000 (0)
    // 001 (1) <-> 100 (4)
    // 010 (2) <-> 010 (2)
    // 011 (3) <-> 110 (6)
    // 100 (4) <-> 001 (1)
    // 101 (5) <-> 101 (5)
    // 110 (6) <-> 011 (3)
    // 111 (7) <-> 111 (7)
    assign io_out_QSV_0_0 = qsv_6_0_0;
    assign io_out_QSV_0_1 = qsv_6_0_1;

    assign io_out_QSV_1_0 = qsv_6_4_0;
    assign io_out_QSV_1_1 = qsv_6_4_1;

    assign io_out_QSV_2_0 = qsv_6_2_0;
    assign io_out_QSV_2_1 = qsv_6_2_1;

    assign io_out_QSV_3_0 = qsv_6_6_0;
    assign io_out_QSV_3_1 = qsv_6_6_1;

    assign io_out_QSV_4_0 = qsv_6_1_0;
    assign io_out_QSV_4_1 = qsv_6_1_1;

    assign io_out_QSV_5_0 = qsv_6_5_0;
    assign io_out_QSV_5_1 = qsv_6_5_1;

    assign io_out_QSV_6_0 = qsv_6_3_0;
    assign io_out_QSV_6_1 = qsv_6_3_1;

    assign io_out_QSV_7_0 = qsv_6_7_0;
    assign io_out_QSV_7_1 = qsv_6_7_1;

    assign io_out_valid   = valid_6;

endmodule
