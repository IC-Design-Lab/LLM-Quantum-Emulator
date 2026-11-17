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

    wire [7:0] w_qsv[0:7][0:1][0:7];
    wire w_v[0:7];

    assign w_qsv[0][0][0] = io_in_QSV_0_0; assign w_qsv[0][1][0] = io_in_QSV_0_1;
    assign w_qsv[0][0][1] = io_in_QSV_1_0; assign w_qsv[0][1][1] = io_in_QSV_1_1;
    assign w_qsv[0][0][2] = io_in_QSV_2_0; assign w_qsv[0][1][2] = io_in_QSV_2_1;
    assign w_qsv[0][0][3] = io_in_QSV_3_0; assign w_qsv[0][1][3] = io_in_QSV_3_1;
    assign w_qsv[0][0][4] = io_in_QSV_4_0; assign w_qsv[0][1][4] = io_in_QSV_4_1;
    assign w_qsv[0][0][5] = io_in_QSV_5_0; assign w_qsv[0][1][5] = io_in_QSV_5_1;
    assign w_qsv[0][0][6] = io_in_QSV_6_0; assign w_qsv[0][1][6] = io_in_QSV_6_1;
    assign w_qsv[0][0][7] = io_in_QSV_7_0; assign w_qsv[0][1][7] = io_in_QSV_7_1;
    assign w_v[0] = io_in_valid;

    HGate3QubitVector8bit m0 (
        .clock(clock), .reset(reset), .io_in_valid(w_v[0]),
        .io_in_QSV_0_0(w_qsv[0][0][0]), .io_in_QSV_0_1(w_qsv[0][1][0]),
        .io_in_QSV_1_0(w_qsv[0][0][1]), .io_in_QSV_1_1(w_qsv[0][1][1]),
        .io_in_QSV_2_0(w_qsv[0][0][2]), .io_in_QSV_2_1(w_qsv[0][1][2]),
        .io_in_QSV_3_0(w_qsv[0][0][3]), .io_in_QSV_3_1(w_qsv[0][1][3]),
        .io_in_QSV_4_0(w_qsv[0][0][4]), .io_in_QSV_4_1(w_qsv[0][1][4]),
        .io_in_QSV_5_0(w_qsv[0][0][5]), .io_in_QSV_5_1(w_qsv[0][1][5]),
        .io_in_QSV_6_0(w_qsv[0][0][6]), .io_in_QSV_6_1(w_qsv[0][1][6]),
        .io_in_QSV_7_0(w_qsv[0][0][7]), .io_in_QSV_7_1(w_qsv[0][1][7]),
        .io_out_QSV_0_0(w_qsv[1][0][0]), .io_out_QSV_0_1(w_qsv[1][1][0]),
        .io_out_QSV_1_0(w_qsv[1][0][1]), .io_out_QSV_1_1(w_qsv[1][1][1]),
        .io_out_QSV_2_0(w_qsv[1][0][2]), .io_out_QSV_2_1(w_qsv[1][1][2]),
        .io_out_QSV_3_0(w_qsv[1][0][3]), .io_out_QSV_3_1(w_qsv[1][1][3]),
        .io_out_QSV_4_0(w_qsv[1][0][4]), .io_out_QSV_4_1(w_qsv[1][1][4]),
        .io_out_QSV_5_0(w_qsv[1][0][5]), .io_out_QSV_5_1(w_qsv[1][1][5]),
        .io_out_QSV_6_0(w_qsv[1][0][6]), .io_out_QSV_6_1(w_qsv[1][1][6]),
        .io_out_QSV_7_0(w_qsv[1][0][7]), .io_out_QSV_7_1(w_qsv[1][1][7]),
        .io_out_valid(w_v[1])
    );

    CompatiblePerm m1 (
        .clock(clock), .reset(reset), .io_in_valid(w_v[1]),
        .io_in_QSV_0_0(w_qsv[1][0][0]), .io_in_QSV_0_1(w_qsv[1][1][0]),
        .io_in_QSV_1_0(w_qsv[1][0][1]), .io_in_QSV_1_1(w_qsv[1][1][1]),
        .io_in_QSV_2_0(w_qsv[1][0][2]), .io_in_QSV_2_1(w_qsv[1][1][2]),
        .io_in_QSV_3_0(w_qsv[1][0][3]), .io_in_QSV_3_1(w_qsv[1][1][3]),
        .io_in_QSV_4_0(w_qsv[1][0][4]), .io_in_QSV_4_1(w_qsv[1][1][4]),
        .io_in_QSV_5_0(w_qsv[1][0][5]), .io_in_QSV_5_1(w_qsv[1][1][5]),
        .io_in_QSV_6_0(w_qsv[1][0][6]), .io_in_QSV_6_1(w_qsv[1][1][6]),
        .io_in_QSV_7_0(w_qsv[1][0][7]), .io_in_QSV_7_1(w_qsv[1][1][7]),
        .io_out_QSV_0_0(w_qsv[2][0][0]), .io_out_QSV_0_1(w_qsv[2][1][0]),
        .io_out_QSV_1_0(w_qsv[2][0][1]), .io_out_QSV_1_1(w_qsv[2][1][1]),
        .io_out_QSV_2_0(w_qsv[2][0][2]), .io_out_QSV_2_1(w_qsv[2][1][2]),
        .io_out_QSV_3_0(w_qsv[2][0][3]), .io_out_QSV_3_1(w_qsv[2][1][3]),
        .io_out_QSV_4_0(w_qsv[2][0][4]), .io_out_QSV_4_1(w_qsv[2][1][4]),
        .io_out_QSV_5_0(w_qsv[2][0][5]), .io_out_QSV_5_1(w_qsv[2][1][5]),
        .io_out_QSV_6_0(w_qsv[2][0][6]), .io_out_QSV_6_1(w_qsv[2][1][6]),
        .io_out_QSV_7_0(w_qsv[2][0][7]), .io_out_QSV_7_1(w_qsv[2][1][7]),
        .io_out_valid(w_v[2])
    );

    CSGate3QubitVector8bit m2 (
        .clock(clock), .reset(reset), .io_in_valid(w_v[2]),
        .io_in_QSV_0_0(w_qsv[2][0][0]), .io_in_QSV_0_1(w_qsv[2][1][0]),
        .io_in_QSV_1_0(w_qsv[2][0][1]), .io_in_QSV_1_1(w_qsv[2][1][1]),
        .io_in_QSV_2_0(w_qsv[2][0][2]), .io_in_QSV_2_1(w_qsv[2][1][2]),
        .io_in_QSV_3_0(w_qsv[2][0][3]),
        .io_in_QSV_4_0(w_qsv[2][0][4]), .io_in_QSV_4_1(w_qsv[2][1][4]),
        .io_in_QSV_5_0(w_qsv[2][0][5]), .io_in_QSV_5_1(w_qsv[2][1][5]),
        .io_in_QSV_6_0(w_qsv[2][0][6]), .io_in_QSV_6_1(w_qsv[2][1][6]),
        .io_in_QSV_7_0(w_qsv[2][0][7]),
        .io_out_QSV_0_0(w_qsv[3][0][0]), .io_out_QSV_0_1(w_qsv[3][1][0]),
        .io_out_QSV_1_0(w_qsv[3][0][1]), .io_out_QSV_1_1(w_qsv[3][1][1]),
        .io_out_QSV_2_0(w_qsv[3][0][2]), .io_out_QSV_2_1(w_qsv[3][1][2]),
        .io_out_QSV_3_0(w_qsv[3][0][3]), .io_out_QSV_3_1(w_qsv[3][1][3]),
        .io_out_QSV_4_0(w_qsv[3][0][4]), .io_out_QSV_4_1(w_qsv[3][1][4]),
        .io_out_QSV_5_0(w_qsv[3][0][5]), .io_out_QSV_5_1(w_qsv[3][1][5]),
        .io_out_QSV_6_0(w_qsv[3][0][6]), .io_out_QSV_6_1(w_qsv[3][1][6]),
        .io_out_QSV_7_0(w_qsv[3][0][7]), .io_out_QSV_7_1(w_qsv[3][1][7]),
        .io_out_valid(w_v[3])
    );

    CompatiblePerm m3 (
        .clock(clock), .reset(reset), .io_in_valid(w_v[3]),
        .io_in_QSV_0_0(w_qsv[3][0][0]), .io_in_QSV_0_1(w_qsv[3][1][0]),
        .io_in_QSV_1_0(w_qsv[3][0][1]), .io_in_QSV_1_1(w_qsv[3][1][1]),
        .io_in_QSV_2_0(w_qsv[3][0][2]), .io_in_QSV_2_1(w_qsv[3][1][2]),
        .io_in_QSV_3_0(w_qsv[3][0][3]), .io_in_QSV_3_1(w_qsv[3][1][3]),
        .io_in_QSV_4_0(w_qsv[3][0][4]), .io_in_QSV_4_1(w_qsv[3][1][4]),
        .io_in_QSV_5_0(w_qsv[3][0][5]), .io_in_QSV_5_1(w_qsv[3][1][5]),
        .io_in_QSV_6_0(w_qsv[3][0][6]), .io_in_QSV_6_1(w_qsv[3][1][6]),
        .io_in_QSV_7_0(w_qsv[3][0][7]), .io_in_QSV_7_1(w_qsv[3][1][7]),
        .io_out_QSV_0_0(w_qsv[4][0][0]), .io_out_QSV_0_1(w_qsv[4][1][0]),
        .io_out_QSV_1_0(w_qsv[4][0][1]), .io_out_QSV_1_1(w_qsv[4][1][1]),
        .io_out_QSV_2_0(w_qsv[4][0][2]), .io_out_QSV_2_1(w_qsv[4][1][2]),
        .io_out_QSV_3_0(w_qsv[4][0][3]), .io_out_QSV_3_1(w_qsv[4][1][3]),
        .io_out_QSV_4_0(w_qsv[4][0][4]), .io_out_QSV_4_1(w_qsv[4][1][4]),
        .io_out_QSV_5_0(w_qsv[4][0][5]), .io_out_QSV_5_1(w_qsv[4][1][5]),
        .io_out_QSV_6_0(w_qsv[4][0][6]), .io_out_QSV_6_1(w_qsv[4][1][6]),
        .io_out_QSV_7_0(w_qsv[4][0][7]), .io_out_QSV_7_1(w_qsv[4][1][7]),
        .io_out_valid(w_v[4])
    );

    HGate3QubitVector8bit m4 (
        .clock(clock), .reset(reset), .io_in_valid(w_v[4]),
        .io_in_QSV_0_0(w_qsv[4][0][0]), .io_in_QSV_0_1(w_qsv[4][1][0]),
        .io_in_QSV_1_0(w_qsv[4][0][1]), .io_in_QSV_1_1(w_qsv[4][1][1]),
        .io_in_QSV_2_0(w_qsv[4][0][2]), .io_in_QSV_2_1(w_qsv[4][1][2]),
        .io_in_QSV_3_0(w_qsv[4][0][3]), .io_in_QSV_3_1(w_qsv[4][1][3]),
        .io_in_QSV_4_0(w_qsv[4][0][4]), .io_in_QSV_4_1(w_qsv[4][1][4]),
        .io_in_QSV_5_0(w_qsv[4][0][5]), .io_in_QSV_5_1(w_qsv[4][1][5]),
        .io_in_QSV_6_0(w_qsv[4][0][6]), .io_in_QSV_6_1(w_qsv[4][1][6]),
        .io_in_QSV_7_0(w_qsv[4][0][7]), .io_in_QSV_7_1(w_qsv[4][1][7]),
        .io_out_QSV_0_0(w_qsv[5][0][0]), .io_out_QSV_0_1(w_qsv[5][1][0]),
        .io_out_QSV_1_0(w_qsv[5][0][1]), .io_out_QSV_1_1(w_qsv[5][1][1]),
        .io_out_QSV_2_0(w_qsv[5][0][2]), .io_out_QSV_2_1(w_qsv[5][1][2]),
        .io_out_QSV_3_0(w_qsv[5][0][3]), .io_out_QSV_3_1(w_qsv[5][1][3]),
        .io_out_QSV_4_0(w_qsv[5][0][4]), .io_out_QSV_4_1(w_qsv[5][1][4]),
        .io_out_QSV_5_0(w_qsv[5][0][5]), .io_out_QSV_5_1(w_qsv[5][1][5]),
        .io_out_QSV_6_0(w_qsv[5][0][6]), .io_out_QSV_6_1(w_qsv[5][1][6]),
        .io_out_QSV_7_0(w_qsv[5][0][7]), .io_out_QSV_7_1(w_qsv[5][1][7]),
        .io_out_valid(w_v[5])
    );

    SWGate3QubitVector8bit m5 (
        .clock(clock), .reset(reset), .io_in_valid(w_v[5]),
        .io_in_QSV_0_0(w_qsv[5][0][0]), .io_in_QSV_0_1(w_qsv[5][1][0]),
        .io_in_QSV_1_0(w_qsv[5][0][1]), .io_in_QSV_1_1(w_qsv[5][1][1]),
        .io_in_QSV_2_0(w_qsv[5][0][2]), .io_in_QSV_2_1(w_qsv[5][1][2]),
        .io_in_QSV_3_0(w_qsv[5][0][3]), .io_in_QSV_3_1(w_qsv[5][1][3]),
        .io_in_QSV_4_0(w_qsv[5][0][4]), .io_in_QSV_4_1(w_qsv[5][1][4]),
        .io_in_QSV_5_0(w_qsv[5][0][5]), .io_in_QSV_5_1(w_qsv[5][1][5]),
        .io_in_QSV_6_0(w_qsv[5][0][6]), .io_in_QSV_6_1(w_qsv[5][1][6]),
        .io_in_QSV_7_0(w_qsv[5][0][7]), .io_in_QSV_7_1(w_qsv[5][1][7]),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_QSV_4_0(io_out_QSV_4_0), .io_out_QSV_4_1(io_out_QSV_4_1),
        .io_out_QSV_5_0(io_out_QSV_5_0), .io_out_QSV_5_1(io_out_QSV_5_1),
        .io_out_QSV_6_0(io_out_QSV_6_0), .io_out_QSV_6_1(io_out_QSV_6_1),
        .io_out_QSV_7_0(io_out_QSV_7_0), .io_out_QSV_7_1(io_out_QSV_7_1),
        .io_out_valid(io_out_valid)
    );

endmodule
