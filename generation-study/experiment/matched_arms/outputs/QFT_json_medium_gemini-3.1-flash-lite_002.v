module QFT (
    input clock,
    input reset,
    input [7:0] io_in_QSV_0_0, io_in_QSV_0_1, io_in_QSV_1_0, io_in_QSV_1_1,
    input [7:0] io_in_QSV_2_0, io_in_QSV_2_1, io_in_QSV_3_0, io_in_QSV_3_1,
    input [7:0] io_in_QSV_4_0, io_in_QSV_4_1, io_in_QSV_5_0, io_in_QSV_5_1,
    input [7:0] io_in_QSV_6_0, io_in_QSV_6_1, io_in_QSV_7_0, io_in_QSV_7_1,
    input io_in_valid,
    output [7:0] io_out_QSV_0_0, io_out_QSV_0_1, io_out_QSV_1_0, io_out_QSV_1_1,
    output [7:0] io_out_QSV_2_0, io_out_QSV_2_1, io_out_QSV_3_0, io_out_QSV_3_1,
    output [7:0] io_out_QSV_4_0, io_out_QSV_4_1, io_out_QSV_5_0, io_out_QSV_5_1,
    output [7:0] io_out_QSV_6_0, io_out_QSV_6_1, io_out_QSV_7_0, io_out_QSV_7_1,
    output io_out_valid
);

    wire [7:0] w_qsv[0:22][0:7][0:1];
    wire [0:22] w_valid;

    assign w_qsv[0][0][0] = io_in_QSV_0_0; assign w_qsv[0][0][1] = io_in_QSV_0_1;
    assign w_qsv[0][1][0] = io_in_QSV_1_0; assign w_qsv[0][1][1] = io_in_QSV_1_1;
    assign w_qsv[0][2][0] = io_in_QSV_2_0; assign w_qsv[0][2][1] = io_in_QSV_2_1;
    assign w_qsv[0][3][0] = io_in_QSV_3_0; assign w_qsv[0][3][1] = io_in_QSV_3_1;
    assign w_qsv[0][4][0] = io_in_QSV_4_0; assign w_qsv[0][4][1] = io_in_QSV_4_1;
    assign w_qsv[0][5][0] = io_in_QSV_5_0; assign w_qsv[0][5][1] = io_in_QSV_5_1;
    assign w_qsv[0][6][0] = io_in_QSV_6_0; assign w_qsv[0][6][1] = io_in_QSV_6_1;
    assign w_qsv[0][7][0] = io_in_QSV_7_0; assign w_qsv[0][7][1] = io_in_QSV_7_1;
    assign w_valid[0] = io_in_valid;

    HGate3QubitVector8bit m0 (
        .clock(clock), .reset(reset), .io_in_valid(w_valid[0]),
        .io_in_QSV_0_0(w_qsv[0][0][0]), .io_in_QSV_0_1(w_qsv[0][0][1]), .io_in_QSV_1_0(w_qsv[0][1][0]), .io_in_QSV_1_1(w_qsv[0][1][1]),
        .io_in_QSV_2_0(w_qsv[0][2][0]), .io_in_QSV_2_1(w_qsv[0][2][1]), .io_in_QSV_3_0(w_qsv[0][3][0]), .io_in_QSV_3_1(w_qsv[0][3][1]),
        .io_in_QSV_4_0(w_qsv[0][4][0]), .io_in_QSV_4_1(w_qsv[0][4][1]), .io_in_QSV_5_0(w_qsv[0][5][0]), .io_in_QSV_5_1(w_qsv[0][5][1]),
        .io_in_QSV_6_0(w_qsv[0][6][0]), .io_in_QSV_6_1(w_qsv[0][6][1]), .io_in_QSV_7_0(w_qsv[0][7][0]), .io_in_QSV_7_1(w_qsv[0][7][1]),
        .io_out_QSV_0_0(w_qsv[1][0][0]), .io_out_QSV_0_1(w_qsv[1][0][1]), .io_out_QSV_1_0(w_qsv[1][1][0]), .io_out_QSV_1_1(w_qsv[1][1][1]),
        .io_out_QSV_2_0(w_qsv[1][2][0]), .io_out_QSV_2_1(w_qsv[1][2][1]), .io_out_QSV_3_0(w_qsv[1][3][0]), .io_out_QSV_3_1(w_qsv[1][3][1]),
        .io_out_QSV_4_0(w_qsv[1][4][0]), .io_out_QSV_4_1(w_qsv[1][4][1]), .io_out_QSV_5_0(w_qsv[1][5][0]), .io_out_QSV_5_1(w_qsv[1][5][1]),
        .io_out_QSV_6_0(w_qsv[1][6][0]), .io_out_QSV_6_1(w_qsv[1][6][1]), .io_out_QSV_7_0(w_qsv[1][7][0]), .io_out_QSV_7_1(w_qsv[1][7][1]),
        .io_out_valid(w_valid[1])
    );

    CompatiblePerm m1 (
        .clock(clock), .reset(reset), .io_in_valid(w_valid[1]),
        .io_in_QSV_0_0(w_qsv[1][0][0]), .io_in_QSV_0_1(w_qsv[1][0][1]), .io_in_QSV_1_0(w_qsv[1][1][0]), .io_in_QSV_1_1(w_qsv[1][1][1]),
        .io_in_QSV_2_0(w_qsv[1][2][0]), .io_in_QSV_2_1(w_qsv[1][2][1]), .io_in_QSV_3_0(w_qsv[1][3][0]), .io_in_QSV_3_1(w_qsv[1][3][1]),
        .io_in_QSV_4_0(w_qsv[1][4][0]), .io_in_QSV_4_1(w_qsv[1][4][1]), .io_in_QSV_5_0(w_qsv[1][5][0]), .io_in_QSV_5_1(w_qsv[1][5][1]),
        .io_in_QSV_6_0(w_qsv[1][6][0]), .io_in_QSV_6_1(w_qsv[1][6][1]), .io_in_QSV_7_0(w_qsv[1][7][0]), .io_in_QSV_7_1(w_qsv[1][7][1]),
        .io_out_QSV_0_0(w_qsv[2][0][0]), .io_out_QSV_0_1(w_qsv[2][0][1]), .io_out_QSV_1_0(w_qsv[2][1][0]), .io_out_QSV_1_1(w_qsv[2][1][1]),
        .io_out_QSV_2_0(w_qsv[2][2][0]), .io_out_QSV_2_1(w_qsv[2][2][1]), .io_out_QSV_3_0(w_qsv[2][3][0]), .io_out_QSV_3_1(w_qsv[2][3][1]),
        .io_out_QSV_4_0(w_qsv[2][4][0]), .io_out_QSV_4_1(w_qsv[2][4][1]), .io_out_QSV_5_0(w_qsv[2][5][0]), .io_out_QSV_5_1(w_qsv[2][5][1]),
        .io_out_QSV_6_0(w_qsv[2][6][0]), .io_out_QSV_6_1(w_qsv[2][6][1]), .io_out_QSV_7_0(w_qsv[2][7][0]), .io_out_QSV_7_1(w_qsv[2][7][1]),
        .io_out_valid(w_valid[2])
    );

    CSGate3QubitVector8bit m2 (
        .clock(clock), .reset(reset), .io_in_valid(w_valid[2]),
        .io_in_QSV_0_0(w_qsv[2][0][0]), .io_in_QSV_0_1(w_qsv[2][0][1]), .io_in_QSV_1_0(w_qsv[2][1][0]), .io_in_QSV_1_1(w_qsv[2][1][1]),
        .io_in_QSV_2_0(w_qsv[2][2][0]), .io_in_QSV_2_1(w_qsv[2][2][1]), .io_in_QSV_3_0(w_qsv[2][3][0]), .io_in_QSV_4_0(w_qsv[2][4][0]),
        .io_in_QSV_4_1(w_qsv[2][4][1]), .io_in_QSV_5_0(w_qsv[2][5][0]), .io_in_QSV_5_1(w_qsv[2][5][1]), .io_in_QSV_6_0(w_qsv[2][6][0]),
        .io_in_QSV_6_1(w_qsv[2][6][1]), .io_in_QSV_7_0(w_qsv[2][7][0]),
        .io_out_QSV_0_0(w_qsv[3][0][0]), .io_out_QSV_0_1(w_qsv[3][0][1]), .io_out_QSV_1_0(w_qsv[3][1][0]), .io_out_QSV_1_1(w_qsv[3][1][1]),
        .io_out_QSV_2_0(w_qsv[3][2][0]), .io_out_QSV_2_1(w_qsv[3][2][1]), .io_out_QSV_3_0(w_qsv[3][3][0]), .io_out_QSV_3_1(w_qsv[3][3][1]),
        .io_out_QSV_4_0(w_qsv[3][4][0]), .io_out_QSV_4_1(w_qsv[3][4][1]), .io_out_QSV_5_0(w_qsv[3][5][0]), .io_out_QSV_5_1(w_qsv[3][5][1]),
        .io_out_QSV_6_0(w_qsv[3][6][0]), .io_out_QSV_6_1(w_qsv[3][6][1]), .io_out_QSV_7_0(w_qsv[3][7][0]), .io_out_QSV_7_1(w_qsv[3][7][1]),
        .io_out_valid(w_valid[3])
    );

    CompatiblePerm m3 (
        .clock(clock), .reset(reset), .io_in_valid(w_valid[3]),
        .io_in_QSV_0_0(w_qsv[3][0][0]), .io_in_QSV_0_1(w_qsv[3][0][1]), .io_in_QSV_1_0(w_qsv[3][1][0]), .io_in_QSV_1_1(w_qsv[3][1][1]),
        .io_in_QSV_2_0(w_qsv[3][2][0]), .io_in_QSV_2_1(w_qsv[3][2][1]), .io_in_QSV_3_0(w_qsv[3][3][0]), .io_in_QSV_3_1(w_qsv[3][3][1]),
        .io_in_QSV_4_0(w_qsv[3][4][0]), .io_in_QSV_4_1(w_qsv[3][4][1]), .io_in_QSV_5_0(w_qsv[3][5][0]), .io_in_QSV_5_1(w_qsv[3][5][1]),
        .io_in_QSV_6_0(w_qsv[3][6][0]), .io_in_QSV_6_1(w_qsv[3][6][1]), .io_in_QSV_7_0(w_qsv[3][7][0]), .io_in_QSV_7_1(w_qsv[3][7][1]),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1), .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1), .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_QSV_4_0(io_out_QSV_4_0), .io_out_QSV_4_1(io_out_QSV_4_1), .io_out_QSV_5_0(io_out_QSV_5_0), .io_out_QSV_5_1(io_out_QSV_5_1),
        .io_out_QSV_6_0(io_out_QSV_6_0), .io_out_QSV_6_1(io_out_QSV_6_1), .io_out_QSV_7_0(io_out_QSV_7_0), .io_out_QSV_7_1(io_out_QSV_7_1),
        .io_out_valid(io_out_valid)
    );

endmodule
