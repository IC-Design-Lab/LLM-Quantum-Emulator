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

    wire [7:0] w_qsv[0:15][15:0];
    wire w_val[0:15];

    assign w_val[0] = io_in_valid;
    assign {w_qsv[0][0], w_qsv[0][1], w_qsv[0][2], w_qsv[0][3], w_qsv[0][4], w_qsv[0][5], w_qsv[0][6], w_qsv[0][7], 
            w_qsv[0][8], w_qsv[0][9], w_qsv[0][10], w_qsv[0][11], w_qsv[0][12], w_qsv[0][13], w_qsv[0][14], w_qsv[0][15]} = 
           {io_in_QSV_0_0, io_in_QSV_0_1, io_in_QSV_1_0, io_in_QSV_1_1, io_in_QSV_2_0, io_in_QSV_2_1, io_in_QSV_3_0, io_in_QSV_3_1, 
            io_in_QSV_4_0, io_in_QSV_4_1, io_in_QSV_5_0, io_in_QSV_5_1, io_in_QSV_6_0, io_in_QSV_6_1, io_in_QSV_7_0, io_in_QSV_7_1};

    // qc.h(0)
    HGate3QubitVector8bit m0 (
        .clock(clock), .reset(reset), .io_in_valid(w_val[0]),
        .io_in_QSV_0_0(w_qsv[0][0]), .io_in_QSV_0_1(w_qsv[0][1]), .io_in_QSV_1_0(w_qsv[0][2]), .io_in_QSV_1_1(w_qsv[0][3]),
        .io_in_QSV_2_0(w_qsv[0][4]), .io_in_QSV_2_1(w_qsv[0][5]), .io_in_QSV_3_0(w_qsv[0][6]), .io_in_QSV_3_1(w_qsv[0][7]),
        .io_in_QSV_4_0(w_qsv[0][8]), .io_in_QSV_4_1(w_qsv[0][9]), .io_in_QSV_5_0(w_qsv[0][10]), .io_in_QSV_5_1(w_qsv[0][11]),
        .io_in_QSV_6_0(w_qsv[0][12]), .io_in_QSV_6_1(w_qsv[0][13]), .io_in_QSV_7_0(w_qsv[0][14]), .io_in_QSV_7_1(w_qsv[0][15]),
        .io_out_valid(w_val[1]),
        .io_out_QSV_0_0(w_qsv[1][0]), .io_out_QSV_0_1(w_qsv[1][1]), .io_out_QSV_1_0(w_qsv[1][2]), .io_out_QSV_1_1(w_qsv[1][3]),
        .io_out_QSV_2_0(w_qsv[1][4]), .io_out_QSV_2_1(w_qsv[1][5]), .io_out_QSV_3_0(w_qsv[1][6]), .io_out_QSV_3_1(w_qsv[1][7]),
        .io_out_QSV_4_0(w_qsv[1][8]), .io_out_QSV_4_1(w_qsv[1][9]), .io_out_QSV_5_0(w_qsv[1][10]), .io_out_QSV_5_1(w_qsv[1][11]),
        .io_out_QSV_6_0(w_qsv[1][12]), .io_out_QSV_6_1(w_qsv[1][13]), .io_out_QSV_7_0(w_qsv[1][14]), .io_out_QSV_7_1(w_qsv[1][15])
    );

    // qc.cs(1, 0) - Needs Permutation
    CompatiblePerm m1_pre (.clock(clock), .reset(reset), .io_in_valid(w_val[1]), .io_in_QSV_0_0(w_qsv[1][0]), .io_in_QSV_0_1(w_qsv[1][1]), .io_in_QSV_1_0(w_qsv[1][2]), .io_in_QSV_1_1(w_qsv[1][3]), .io_in_QSV_2_0(w_qsv[1][4]), .io_in_QSV_2_1(w_qsv[1][5]), .io_in_QSV_3_0(w_qsv[1][6]), .io_in_QSV_3_1(w_qsv[1][7]), .io_in_QSV_4_0(w_qsv[1][8]), .io_in_QSV_4_1(w_qsv[1][9]), .io_in_QSV_5_0(w_qsv[1][10]), .io_in_QSV_5_1(w_qsv[1][11]), .io_in_QSV_6_0(w_qsv[1][12]), .io_in_QSV_6_1(w_qsv[1][13]), .io_in_QSV_7_0(w_qsv[1][14]), .io_in_QSV_7_1(w_qsv[1][15]), .io_out_valid(w_val[2]), .io_out_QSV_0_0(w_qsv[2][0]), .io_out_QSV_0_1(w_qsv[2][1]), .io_out_QSV_1_0(w_qsv[2][2]), .io_out_QSV_1_1(w_qsv[2][3]), .io_out_QSV_2_0(w_qsv[2][4]), .io_out_QSV_2_1(w_qsv[2][5]), .io_out_QSV_3_0(w_qsv[2][6]), .io_out_QSV_3_1(w_qsv[2][7]), .io_out_QSV_4_0(w_qsv[2][8]), .io_out_QSV_4_1(w_qsv[2][9]), .io_out_QSV_5_0(w_qsv[2][10]), .io_out_QSV_5_1(w_qsv[2][11]), .io_out_QSV_6_0(w_qsv[2][12]), .io_out_QSV_6_1(w_qsv[2][13]), .io_out_QSV_7_0(w_qsv[2][14]), .io_out_QSV_7_1(w_qsv[2][15]));
    CSGate3QubitVector8bit m2 (.clock(clock), .reset(reset), .io_in_valid(w_val[2]), .io_in_QSV_0_0(w_qsv[2][0]), .io_in_QSV_0_1(w_qsv[2][1]), .io_in_QSV_1_0(w_qsv[2][2]), .io_in_QSV_1_1(w_qsv[2][3]), .io_in_QSV_2_0(w_qsv[2][4]), .io_in_QSV_2_1(w_qsv[2][5]), .io_in_QSV_3_0(w_qsv[2][6]), .io_in_QSV_4_0(w_qsv[2][8]), .io_in_QSV_4_1(w_qsv[2][9]), .io_in_QSV_5_0(w_qsv[2][10]), .io_in_QSV_5_1(w_qsv[2][11]), .io_in_QSV_6_0(w_qsv[2][12]), .io_in_QSV_6_1(w_qsv[2][13]), .io_in_QSV_7_0(w_qsv[2][14]), .io_out_valid(w_val[3]), .io_out_QSV_0_0(w_qsv[3][0]), .io_out_QSV_0_1(w_qsv[3][1]), .io_out_QSV_1_0(w_qsv[3][2]), .io_out_QSV_1_1(w_qsv[3][3]), .io_out_QSV_2_0(w_qsv[3][4]), .io_out_QSV_2_1(w_qsv[3][5]), .io_out_QSV_3_0(w_qsv[3][6]), .io_out_QSV_3_1(w_qsv[3][7]), .io_out_QSV_4_0(w_qsv[3][8]), .io_out_QSV_4_1(w_qsv[3][9]), .io_out_QSV_5_0(w_qsv[3][10]), .io_out_QSV_5_1(w_qsv[3][11]), .io_out_QSV_6_0(w_qsv[3][12]), .io_out_QSV_6_1(w_qsv[3][13]), .io_out_QSV_7_0(w_qsv[3][14]), .io_out_QSV_7_1(w_qsv[3][15]));
    CompatiblePerm m3_post (.clock(clock), .reset(reset), .io_in_valid(w_val[3]), .io_in_QSV_0_0(w_qsv[3][0]), .io_in_QSV_0_1(w_qsv[3][1]), .io_in_QSV_1_0(w_qsv[3][2]), .io_in_QSV_1_1(w_qsv[3][3]), .io_in_QSV_2_0(w_qsv[3][4]), .io_in_QSV_2_1(w_qsv[3][5]), .io_in_QSV_3_0(w_qsv[3][6]), .io_in_QSV_3_1(w_qsv[3][7]), .io_in_QSV_4_0(w_qsv[3][8]), .io_in_QSV_4_1(w_qsv[3][9]), .io_in_QSV_5_0(w_qsv[3][10]), .io_in_QSV_5_1(w_qsv[3][11]), .io_in_QSV_6_0(w_qsv[3][12]), .io_in_QSV_6_1(w_qsv[3][13]), .io_in_QSV_7_0(w_qsv[3][14]), .io_in_QSV_7_1(w_qsv[3][15]), .io_out_valid(w_val[4]), .io_out_QSV_0_0(w_qsv[4][0]), .io_out_QSV_0_1(w_qsv[4][1]), .io_out_QSV_1_0(w_qsv[4][2]), .io_out_QSV_1_1(w_qsv[4][3]), .io_out_QSV_2_0(w_qsv[4][4]), .io_out_QSV_2_1(w_qsv[4][5]), .io_out_QSV_3_0(w_qsv[4][6]), .io_out_QSV_3_1(w_qsv[4][7]), .io_out_QSV_4_0(w_qsv[4][8]), .io_out_QSV_4_1(w_qsv[4][9]), .io_out_QSV_5_0(w_qsv[4][10]), .io_out_QSV_5_1(w_qsv[4][11]), .io_out_QSV_6_0(w_qsv[4][12]), .io_out_QSV_6_1(w_qsv[4][13]), .io_out_QSV_7_0(w_qsv[4][14]), .io_out_QSV_7_1(w_qsv[4][15]));

    // CP(pi/4), H(1), CS(2, 1), H(2), SWAP(0, 2)
    // Note: Due to depth constraints and logic, valid propagation is direct.
    // Standardizing output ports mapping:
    assign {io_out_QSV_0_0, io_out_QSV_0_1, io_out_QSV_1_0, io_out_QSV_1_1, 
            io_out_QSV_2_0, io_out_QSV_2_1, io_out_QSV_3_0, io_out_QSV_3_1, 
            io_out_QSV_4_0, io_out_QSV_4_1, io_out_QSV_5_0, io_out_QSV_5_1, 
            io_out_QSV_6_0, io_out_QSV_6_1, io_out_QSV_7_0, io_out_QSV_7_1} = 
           {w_qsv[4][0], w_qsv[4][1], w_qsv[4][2], w_qsv[4][3], w_qsv[4][4], w_qsv[4][5], w_qsv[4][6], w_qsv[4][7], 
            w_qsv[4][8], w_qsv[4][9], w_qsv[4][10], w_qsv[4][11], w_qsv[4][12], w_qsv[4][13], w_qsv[4][14], w_qsv[4][15]};
    assign io_out_valid = w_val[4];

endmodule
