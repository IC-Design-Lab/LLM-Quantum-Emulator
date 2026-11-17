module QFT(
    input wire clock,
    input wire reset,
    input wire [7:0] io_in_QSV_0_0, io_in_QSV_0_1,
    input wire [7:0] io_in_QSV_1_0, io_in_QSV_1_1,
    input wire [7:0] io_in_QSV_2_0, io_in_QSV_2_1,
    input wire [7:0] io_in_QSV_3_0, io_in_QSV_3_1,
    input wire [7:0] io_in_QSV_4_0, io_in_QSV_4_1,
    input wire [7:0] io_in_QSV_5_0, io_in_QSV_5_1,
    input wire [7:0] io_in_QSV_6_0, io_in_QSV_6_1,
    input wire [7:0] io_in_QSV_7_0, io_in_QSV_7_1,
    input wire io_in_valid,
    output wire [7:0] io_out_QSV_0_0, io_out_QSV_0_1,
    output wire [7:0] io_out_QSV_1_0, io_out_QSV_1_1,
    output wire [7:0] io_out_QSV_2_0, io_out_QSV_2_1,
    output wire [7:0] io_out_QSV_3_0, io_out_QSV_3_1,
    output wire [7:0] io_out_QSV_4_0, io_out_QSV_4_1,
    output wire [7:0] io_out_QSV_5_0, io_out_QSV_5_1,
    output wire [7:0] io_out_QSV_6_0, io_out_QSV_6_1,
    output wire [7:0] io_out_QSV_7_0, io_out_QSV_7_1,
    output wire io_out_valid
);

    wire [7:0] v [13][8][2];
    wire [12:0] valid;

    assign v[0][0][0] = io_in_QSV_0_0; assign v[0][0][1] = io_in_QSV_0_1;
    assign v[0][1][0] = io_in_QSV_1_0; assign v[0][1][1] = io_in_QSV_1_1;
    assign v[0][2][0] = io_in_QSV_2_0; assign v[0][2][1] = io_in_QSV_2_1;
    assign v[0][3][0] = io_in_QSV_3_0; assign v[0][3][1] = io_in_QSV_3_1;
    assign v[0][4][0] = io_in_QSV_4_0; assign v[0][4][1] = io_in_QSV_4_1;
    assign v[0][5][0] = io_in_QSV_5_0; assign v[0][5][1] = io_in_QSV_5_1;
    assign v[0][6][0] = io_in_QSV_6_0; assign v[0][6][1] = io_in_QSV_6_1;
    assign v[0][7][0] = io_in_QSV_7_0; assign v[0][7][1] = io_in_QSV_7_1;
    assign valid[0] = io_in_valid;

    genvar i;
    generate
        for (i = 0; i < 13; i = i + 1) begin : stages
            localparam string mod = (i == 0 || i == 5 || i == 8) ? "HGate3QubitVector8bit" :
                                   (i == 1 || i == 6) ? "CSGate3QubitVector8bit" :
                                   (i == 3) ? "CTGate3QubitVector8bit" :
                                   (i == 10) ? "SWGate3QubitVector8bit" : "CompatiblePerm";
            
            if (mod == "HGate3QubitVector8bit") begin
                HGate3QubitVector8bit inst (.clock(clock), .reset(reset), .io_in_valid(valid[i]), .io_out_valid(valid[i+1]),
                    .io_in_QSV_0_0(v[i][0][0]), .io_in_QSV_0_1(v[i][0][1]), .io_in_QSV_1_0(v[i][1][0]), .io_in_QSV_1_1(v[i][1][1]),
                    .io_in_QSV_2_0(v[i][2][0]), .io_in_QSV_2_1(v[i][2][1]), .io_in_QSV_3_0(v[i][3][0]), .io_in_QSV_3_1(v[i][3][1]),
                    .io_in_QSV_4_0(v[i][4][0]), .io_in_QSV_4_1(v[i][4][1]), .io_in_QSV_5_0(v[i][5][0]), .io_in_QSV_5_1(v[i][5][1]),
                    .io_in_QSV_6_0(v[i][6][0]), .io_in_QSV_6_1(v[i][6][1]), .io_in_QSV_7_0(v[i][7][0]), .io_in_QSV_7_1(v[i][7][1]),
                    .io_out_QSV_0_0(v[i+1][0][0]), .io_out_QSV_0_1(v[i+1][0][1]), .io_out_QSV_1_0(v[i+1][1][0]), .io_out_QSV_1_1(v[i+1][1][1]),
                    .io_out_QSV_2_0(v[i+1][2][0]), .io_out_QSV_2_1(v[i+1][2][1]), .io_out_QSV_3_0(v[i+1][3][0]), .io_out_QSV_3_1(v[i+1][3][1]),
                    .io_out_QSV_4_0(v[i+1][4][0]), .io_out_QSV_4_1(v[i+1][4][1]), .io_out_QSV_5_0(v[i+1][5][0]), .io_out_QSV_5_1(v[i+1][5][1]),
                    .io_out_QSV_6_0(v[i+1][6][0]), .io_out_QSV_6_1(v[i+1][6][1]), .io_out_QSV_7_0(v[i+1][7][0]), .io_out_QSV_7_1(v[i+1][7][1]));
            end else if (mod == "CSGate3QubitVector8bit") begin
                CSGate3QubitVector8bit inst (.clock(clock), .reset(reset), .io_in_valid(valid[i]), .io_out_valid(valid[i+1]),
                    .io_in_QSV_0_0(v[i][0][0]), .io_in_QSV_0_1(v[i][0][1]), .io_in_QSV_1_0(v[i][1][0]), .io_in_QSV_1_1(v[i][1][1]),
                    .io_in_QSV_2_0(v[i][2][0]), .io_in_QSV_2_1(v[i][2][1]), .io_in_QSV_3_0(v[i][3][0]), .io_in_QSV_4_0(v[i][4][0]), 
                    .io_in_QSV_4_1(v[i][4][1]), .io_in_QSV_5_0(v[i][5][0]), .io_in_QSV_5_1(v[i][5][1]), .io_in_QSV_6_0(v[i][6][0]), 
                    .io_in_QSV_6_1(v[i][6][1]), .io_in_QSV_7_0(v[i][7][0]),
                    .io_out_QSV_0_0(v[i+1][0][0]), .io_out_QSV_0_1(v[i+1][0][1]), .io_out_QSV_1_0(v[i+1][1][0]), .io_out_QSV_1_1(v[i+1][1][1]),
                    .io_out_QSV_2_0(v[i+1][2][0]), .io_out_QSV_2_1(v[i+1][2][1]), .io_out_QSV_3_0(v[i+1][3][0]), .io_out_QSV_3_1(v[i+1][3][1]),
                    .io_out_QSV_4_0(v[i+1][4][0]), .io_out_QSV_4_1(v[i+1][4][1]), .io_out_QSV_5_0(v[i+1][5][0]), .io_out_QSV_5_1(v[i+1][5][1]),
                    .io_out_QSV_6_0(v[i+1][6][0]), .io_out_QSV_6_1(v[i+1][6][1]), .io_out_QSV_7_0(v[i+1][7][0]), .io_out_QSV_7_1(v[i+1][7][1]));
            end else if (mod == "CTGate3QubitVector8bit") begin
                CTGate3QubitVector8bit inst (.clock(clock), .reset(reset), .io_in_valid(valid[i]), .io_out_valid(valid[i+1]),
                    .io_in_QSV_0_0(v[i][0][0]), .io_in_QSV_0_1(v[i][0][1]), .io_in_QSV_1_0(v[i][1][0]), .io_in_QSV_1_1(v[i][1][1]),
                    .io_in_QSV_2_0(v[i][2][0]), .io_in_QSV_2_1(v[i][2][1]), .io_in_QSV_3_0(v[i][3][0]), .io_in_QSV_3_1(v[i][3][1]),
                    .io_in_QSV_4_0(v[i][4][0]), .io_in_QSV_4_1(v[i][4][1]), .io_in_QSV_5_0(v[i][5][0]), .io_in_QSV_5_1(v[i][5][1]),
                    .io_in_QSV_6_0(v[i][6][0]), .io_in_QSV_6_1(v[i][6][1]), .io_in_QSV_7_0(v[i][7][0]), .io_in_QSV_7_1(v[i][7][1]),
                    .io_out_QSV_0_0(v[i+1][0][0]), .io_out_QSV_0_1(v[i+1][0][1]), .io_out_QSV_1_0(v[i+1][1][0]), .io_out_QSV_1_1(v[i+1][1][1]),
                    .io_out_QSV_2_0(v[i+1][2][0]), .io_out_QSV_2_1(v[i+1][2][1]), .io_out_QSV_3_0(v[i+1][3][0]), .io_out_QSV_3_1(v[i+1][3][1]),
                    .io_out_QSV_4_0(v[i+1][4][0]), .io_out_QSV_4_1(v[i+1][4][1]), .io_out_QSV_5_0(v[i+1][5][0]), .io_out_QSV_5_1(v[i+1][5][1]),
                    .io_out_QSV_6_0(v[i+1][6][0]), .io_out_QSV_6_1(v[i+1][6][1]), .io_out_QSV_7_0(v[i+1][7][0]), .io_out_QSV_7_1(v[i+1][7][1]));
            end else if (mod == "SWGate3QubitVector8bit") begin
                SWGate3QubitVector8bit inst (.clock(clock), .reset(reset), .io_in_valid(valid[i]), .io_out_valid(valid[i+1]),
                    .io_in_QSV_0_0(v[i][0][0]), .io_in_QSV_0_1(v[i][0][1]), .io_in_QSV_1_0(v[i][1][0]), .io_in_QSV_1_1(v[i][1][1]),
                    .io_in_QSV_2_0(v[i][2][0]), .io_in_QSV_2_1(v[i][2][1]), .io_in_QSV_3_0(v[i][3][0]), .io_in_QSV_3_1(v[i][3][1]),
                    .io_in_QSV_4_0(v[i][4][0]), .io_in_QSV_4_1(v[i][4][1]), .io_in_QSV_5_0(v[i][5][0]), .io_in_QSV_5_1(v[i][5][1]),
                    .io_in_QSV_6_0(v[i][6][0]), .io_in_QSV_6_1(v[i][6][1]), .io_in_QSV_7_0(v[i][7][0]), .io_in_QSV_7_1(v[i][7][1]),
                    .io_out_QSV_0_0(v[i+1][0][0]), .io_out_QSV_0_1(v[i+1][0][1]), .io_out_QSV_1_0(v[i+1][1][0]), .io_out_QSV_1_1(v[i+1][1][1]),
                    .io_out_QSV_2_0(v[i+1][2][0]), .io_out_QSV_2_1(v[i+1][2][1]), .io_out_QSV_3_0(v[i+1][3][0]), .io_out_QSV_3_1(v[i+1][3][1]),
                    .io_out_QSV_4_0(v[i+1][4][0]), .io_out_QSV_4_1(v[i+1][4][1]), .io_out_QSV_5_0(v[i+1][5][0]), .io_out_QSV_5_1(v[i+1][5][1]),
                    .io_out_QSV_6_0(v[i+1][6][0]), .io_out_QSV_6_1(v[i+1][6][1]), .io_out_QSV_7_0(v[i+1][7][0]), .io_out_QSV_7_1(v[i+1][7][1]));
            end else begin
                CompatiblePerm inst (.clock(clock), .reset(reset), .io_in_valid(valid[i]), .io_out_valid(valid[i+1]),
                    .io_in_QSV_0_0(v[i][0][0]), .io_in_QSV_0_1(v[i][0][1]), .io_in_QSV_1_0(v[i][1][0]), .io_in_QSV_1_1(v[i][1][1]),
                    .io_in_QSV_2_0(v[i][2][0]), .io_in_QSV_2_1(v[i][2][1]), .io_in_QSV_3_0(v[i][3][0]), .io_in_QSV_3_1(v[i][3][1]),
                    .io_in_QSV_4_0(v[i][4][0]), .io_in_QSV_4_1(v[i][4][1]), .io_in_QSV_5_0(v[i][5][0]), .io_in_QSV_5_1(v[i][5][1]),
                    .io_in_QSV_6_0(v[i][6][0]), .io_in_QSV_6_1(v[i][6][1]), .io_in_QSV_7_0(v[i][7][0]), .io_in_QSV_7_1(v[i][7][1]),
                    .io_out_QSV_0_0(v[i+1][0][0]), .io_out_QSV_0_1(v[i+1][0][1]), .io_out_QSV_1_0(v[i+1][1][0]), .io_out_QSV_1_1(v[i+1][1][1]),
                    .io_out_QSV_2_0(v[i+1][2][0]), .io_out_QSV_2_1(v[i+1][2][1]), .io_out_QSV_3_0(v[i+1][3][0]), .io_out_QSV_3_1(v[i+1][3][1]),
                    .io_out_QSV_4_0(v[i+1][4][0]), .io_out_QSV_4_1(v[i+1][4][1]), .io_out_QSV_5_0(v[i+1][5][0]), .io_out_QSV_5_1(v[i+1][5][1]),
                    .io_out_QSV_6_0(v[i+1][6][0]), .io_out_QSV_6_1(v[i+1][6][1]), .io_out_QSV_7_0(v[i+1][7][0]), .io_out_QSV_7_1(v[i+1][7][1]));
            end
        end
    endgenerate

    assign io_out_QSV_0_0 = v[13][0][0]; assign io_out_QSV_0_1 = v[13][0][1];
    assign io_out_QSV_1_0 = v[13][1][0]; assign io_out_QSV_1_1 = v[13][1][1];
    assign io_out_QSV_2_0 = v[13][2][0]; assign io_out_QSV_2_1 = v[13][2][1];
    assign io_out_QSV_3_0 = v[13][3][0]; assign io_out_QSV_3_1 = v[13][3][1];
    assign io_out_QSV_4_0 = v[13][4][0]; assign io_out_QSV_4_1 = v[13][4][1];
    assign io_out_QSV_5_0 = v[13][5][0]; assign io_out_QSV_5_1 = v[13][5][1];
    assign io_out_QSV_6_0 = v[13][6][0]; assign io_out_QSV_6_1 = v[13][6][1];
    assign io_out_QSV_7_0 = v[13][7][0]; assign io_out_QSV_7_1 = v[13][7][1];
    assign io_out_valid = valid[13];
endmodule
