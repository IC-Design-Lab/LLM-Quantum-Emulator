module H_gate (
    input  signed [7:0] in0_re,
    input  signed [7:0] in0_im,
    input  signed [7:0] in1_re,
    input  signed [7:0] in1_im,
    output signed [7:0] out0_re,
    output signed [7:0] out0_im,
    output signed [7:0] out1_re,
    output signed [7:0] out1_im
);
    wire signed [8:0] sum_re  = in0_re + in1_re;
    wire signed [8:0] sum_im  = in0_im + in1_im;
    wire signed [8:0] diff_re = in0_re - in1_re;
    wire signed [8:0] diff_im = in0_im - in1_im;

    assign out0_re = (sum_re  * $signed(10'd181)) >>> 8;
    assign out0_im = (sum_im  * $signed(10'd181)) >>> 8;
    assign out1_re = (diff_re * $signed(10'd181)) >>> 8;
    assign out1_im = (diff_im * $signed(10'd181)) >>> 8;
endmodule

module Shor (
    input  wire clock,
    input  wire reset,
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
    input  wire [7:0] io_in_QSV_8_0,
    input  wire [7:0] io_in_QSV_8_1,
    input  wire [7:0] io_in_QSV_9_0,
    input  wire [7:0] io_in_QSV_9_1,
    input  wire [7:0] io_in_QSV_10_0,
    input  wire [7:0] io_in_QSV_10_1,
    input  wire [7:0] io_in_QSV_11_0,
    input  wire [7:0] io_in_QSV_11_1,
    input  wire [7:0] io_in_QSV_12_0,
    input  wire [7:0] io_in_QSV_12_1,
    input  wire [7:0] io_in_QSV_13_0,
    input  wire [7:0] io_in_QSV_13_1,
    input  wire [7:0] io_in_QSV_14_0,
    input  wire [7:0] io_in_QSV_14_1,
    input  wire [7:0] io_in_QSV_15_0,
    input  wire [7:0] io_in_QSV_15_1,
    input  wire [7:0] io_in_QSV_16_0,
    input  wire [7:0] io_in_QSV_16_1,
    input  wire [7:0] io_in_QSV_17_0,
    input  wire [7:0] io_in_QSV_17_1,
    input  wire [7:0] io_in_QSV_18_0,
    input  wire [7:0] io_in_QSV_18_1,
    input  wire [7:0] io_in_QSV_19_0,
    input  wire [7:0] io_in_QSV_19_1,
    input  wire [7:0] io_in_QSV_20_0,
    input  wire [7:0] io_in_QSV_20_1,
    input  wire [7:0] io_in_QSV_21_0,
    input  wire [7:0] io_in_QSV_21_1,
    input  wire [7:0] io_in_QSV_22_0,
    input  wire [7:0] io_in_QSV_22_1,
    input  wire [7:0] io_in_QSV_23_0,
    input  wire [7:0] io_in_QSV_23_1,
    input  wire [7:0] io_in_QSV_24_0,
    input  wire [7:0] io_in_QSV_24_1,
    input  wire [7:0] io_in_QSV_25_0,
    input  wire [7:0] io_in_QSV_25_1,
    input  wire [7:0] io_in_QSV_26_0,
    input  wire [7:0] io_in_QSV_26_1,
    input  wire [7:0] io_in_QSV_27_0,
    input  wire [7:0] io_in_QSV_27_1,
    input  wire [7:0] io_in_QSV_28_0,
    input  wire [7:0] io_in_QSV_28_1,
    input  wire [7:0] io_in_QSV_29_0,
    input  wire [7:0] io_in_QSV_29_1,
    input  wire [7:0] io_in_QSV_30_0,
    input  wire [7:0] io_in_QSV_30_1,
    input  wire [7:0] io_in_QSV_31_0,
    input  wire [7:0] io_in_QSV_31_1,
    input  wire io_in_valid,
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
    output wire [7:0] io_out_QSV_8_0,
    output wire [7:0] io_out_QSV_8_1,
    output wire [7:0] io_out_QSV_9_0,
    output wire [7:0] io_out_QSV_9_1,
    output wire [7:0] io_out_QSV_10_0,
    output wire [7:0] io_out_QSV_10_1,
    output wire [7:0] io_out_QSV_11_0,
    output wire [7:0] io_out_QSV_11_1,
    output wire [7:0] io_out_QSV_12_0,
    output wire [7:0] io_out_QSV_12_1,
    output wire [7:0] io_out_QSV_13_0,
    output wire [7:0] io_out_QSV_13_1,
    output wire [7:0] io_out_QSV_14_0,
    output wire [7:0] io_out_QSV_14_1,
    output wire [7:0] io_out_QSV_15_0,
    output wire [7:0] io_out_QSV_15_1,
    output wire [7:0] io_out_QSV_16_0,
    output wire [7:0] io_out_QSV_16_1,
    output wire [7:0] io_out_QSV_17_0,
    output wire [7:0] io_out_QSV_17_1,
    output wire [7:0] io_out_QSV_18_0,
    output wire [7:0] io_out_QSV_18_1,
    output wire [7:0] io_out_QSV_19_0,
    output wire [7:0] io_out_QSV_19_1,
    output wire [7:0] io_out_QSV_20_0,
    output wire [7:0] io_out_QSV_20_1,
    output wire [7:0] io_out_QSV_21_0,
    output wire [7:0] io_out_QSV_21_1,
    output wire [7:0] io_out_QSV_22_0,
    output wire [7:0] io_out_QSV_22_1,
    output wire [7:0] io_out_QSV_23_0,
    output wire [7:0] io_out_QSV_23_1,
    output wire [7:0] io_out_QSV_24_0,
    output wire [7:0] io_out_QSV_24_1,
    output wire [7:0] io_out_QSV_25_0,
    output wire [7:0] io_out_QSV_25_1,
    output wire [7:0] io_out_QSV_26_0,
    output wire [7:0] io_out_QSV_26_1,
    output wire [7:0] io_out_QSV_27_0,
    output wire [7:0] io_out_QSV_27_1,
    output wire [7:0] io_out_QSV_28_0,
    output wire [7:0] io_out_QSV_28_1,
    output wire [7:0] io_out_QSV_29_0,
    output wire [7:0] io_out_QSV_29_1,
    output wire [7:0] io_out_QSV_30_0,
    output wire [7:0] io_out_QSV_30_1,
    output wire [7:0] io_out_QSV_31_0,
    output wire [7:0] io_out_QSV_31_1,
    output wire io_out_valid
);

    wire signed [7:0] in_re [0:31];
    wire signed [7:0] in_im [0:31];

    assign in_re[0]  = io_in_QSV_0_0;  assign in_im[0]  = io_in_QSV_0_1;
    assign in_re[1]  = io_in_QSV_1_0;  assign in_im[1]  = io_in_QSV_1_1;
    assign in_re[2]  = io_in_QSV_2_0;  assign in_im[2]  = io_in_QSV_2_1;
    assign in_re[3]  = io_in_QSV_3_0;  assign in_im[3]  = io_in_QSV_3_1;
    assign in_re[4]  = io_in_QSV_4_0;  assign in_im[4]  = io_in_QSV_4_1;
    assign in_re[5]  = io_in_QSV_5_0;  assign in_im[5]  = io_in_QSV_5_1;
    assign in_re[6]  = io_in_QSV_6_0;  assign in_im[6]  = io_in_QSV_6_1;
    assign in_re[7]  = io_in_QSV_7_0;  assign in_im[7]  = io_in_QSV_7_1;
    assign in_re[8]  = io_in_QSV_8_0;  assign in_im[8]  = io_in_QSV_8_1;
    assign in_re[9]  = io_in_QSV_9_0;  assign in_im[9]  = io_in_QSV_9_1;
    assign in_re[10] = io_in_QSV_10_0; assign in_im[10] = io_in_QSV_10_1;
    assign in_re[11] = io_in_QSV_11_0; assign in_im[11] = io_in_QSV_11_1;
    assign in_re[12] = io_in_QSV_12_0; assign in_im[12] = io_in_QSV_12_1;
    assign in_re[13] = io_in_QSV_13_0; assign in_im[13] = io_in_QSV_13_1;
    assign in_re[14] = io_in_QSV_14_0; assign in_im[14] = io_in_QSV_14_1;
    assign in_re[15] = io_in_QSV_15_0; assign in_im[15] = io_in_QSV_15_1;
    assign in_re[16] = io_in_QSV_16_0; assign in_im[16] = io_in_QSV_16_1;
    assign in_re[17] = io_in_QSV_17_0; assign in_im[17] = io_in_QSV_17_1;
    assign in_re[18] = io_in_QSV_18_0; assign in_im[18] = io_in_QSV_18_1;
    assign in_re[19] = io_in_QSV_19_0; assign in_im[19] = io_in_QSV_19_1;
    assign in_re[20] = io_in_QSV_20_0; assign in_im[20] = io_in_QSV_20_1;
    assign in_re[21] = io_in_QSV_21_0; assign in_im[21] = io_in_QSV_21_1;
    assign in_re[22] = io_in_QSV_22_0; assign in_im[22] = io_in_QSV_22_1;
    assign in_re[23] = io_in_QSV_23_0; assign in_im[23] = io_in_QSV_23_1;
    assign in_re[24] = io_in_QSV_24_0; assign in_im[24] = io_in_QSV_24_1;
    assign in_re[25] = io_in_QSV_25_0; assign in_im[25] = io_in_QSV_25_1;
    assign in_re[26] = io_in_QSV_26_0; assign in_im[26] = io_in_QSV_26_1;
    assign in_re[27] = io_in_QSV_27_0; assign in_im[27] = io_in_QSV_27_1;
    assign in_re[28] = io_in_QSV_28_0; assign in_im[28] = io_in_QSV_28_1;
    assign in_re[29] = io_in_QSV_29_0; assign in_im[29] = io_in_QSV_29_1;
    assign in_re[30] = io_in_QSV_30_0; assign in_im[30] = io_in_QSV_30_1;
    assign in_re[31] = io_in_QSV_31_0; assign in_im[31] = io_in_QSV_31_1;

    wire signed [7:0] st0_re [0:31];
    wire signed [7:0] st0_im [0:31];
    wire signed [7:0] st1_re [0:31];
    wire signed [7:0] st1_im [0:31];
    wire signed [7:0] st2_re [0:31];
    wire signed [7:0] st2_im [0:31];
    wire signed [7:0] st3_re [0:31];
    wire signed [7:0] st3_im [0:31];
    wire signed [7:0] st4_re [0:31];
    wire signed [7:0] st4_im [0:31];

    genvar i;
    generate
        // Step 0: H on qubit 0
        for (i = 0; i < 16; i = i + 1) begin : gen_step0
            H_gate h_inst (
                .in0_re(in_re[2*i]),
                .in0_im(in_im[2*i]),
                .in1_re(in_re[2*i+1]),
                .in1_im(in_im[2*i+1]),
                .out0_re(st0_re[2*i]),
                .out0_im(st0_im[2*i]),
                .out1_re(st0_re[2*i+1]),
                .out1_im(st0_im[2*i+1])
            );
        end

        // Step 1: CX control=q0, target=q1
        for (i = 0; i < 32; i = i + 1) begin : gen_step1
            wire [4:0] src1 = (i[0] == 1'b1) ? {i[4:2], ~i[1], i[0]} : i[4:0];
            assign st1_re[i] = st0_re[src1];
            assign st1_im[i] = st0_im[src1];
        end

        // Step 2: CX control=q1, target=q2
        for (i = 0; i < 32; i = i + 1) begin : gen_step2
            wire [4:0] src2 = (i[1] == 1'b1) ? {i[4:3], ~i[2], i[1:0]} : i[4:0];
            assign st2_re[i] = st1_re[src2];
            assign st2_im[i] = st1_im[src2];
        end

        // Step 3: CX control=q2, target=q3
        for (i = 0; i < 32; i = i + 1) begin : gen_step3
            wire [4:0] src3 = (i[2] == 1'b1) ? {i[4], ~i[3], i[2:0]} : i[4:0];
            assign st3_re[i] = st2_re[src3];
            assign st3_im[i] = st2_im[src3];
        end

        // Step 4: CX control=q3, target=q4
        for (i = 0; i < 32; i = i + 1) begin : gen_step4
            wire [4:0] src4 = (i[3] == 1'b1) ? {~i[4], i[3:0]} : i[4:0];
            assign st4_re[i] = st3_re[src4];
            assign st4_im[i] = st3_im[src4];
        end
    endgenerate

    reg signed [7:0] out_re_reg [0:31];
    reg signed [7:0] out_im_reg [0:31];
    reg out_valid_reg;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            out_valid_reg <= 1'b0;
            for (int k = 0; k < 32; k = k + 1) begin
                out_re_reg[k] <= 8'd0;
                out_im_reg[k] <= 8'd0;
            end
        end else begin
            out_valid_reg <= io_in_valid;
            for (int k = 0; k < 32; k = k + 1) begin
                out_re_reg[k] <= st4_re[k];
                out_im_reg[k] <= st4_im[k];
            end
        end
    end

    assign io_out_QSV_0_0  = out_re_reg[0];  assign io_out_QSV_0_1  = out_im_reg[0];
    assign io_out_QSV_1_0  = out_re_reg[1];  assign io_out_QSV_1_1  = out_im_reg[1];
    assign io_out_QSV_2_0  = out_re_reg[2];  assign io_out_QSV_2_1  = out_im_reg[2];
    assign io_out_QSV_3_0  = out_re_reg[3];  assign io_out_QSV_3_1  = out_im_reg[3];
    assign io_out_QSV_4_0  = out_re_reg[4];  assign io_out_QSV_4_1  = out_im_reg[4];
    assign io_out_QSV_5_0  = out_re_reg[5];  assign io_out_QSV_5_1  = out_im_reg[5];
    assign io_out_QSV_6_0  = out_re_reg[6];  assign io_out_QSV_6_1  = out_im_reg[6];
    assign io_out_QSV_7_0  = out_re_reg[7];  assign io_out_QSV_7_1  = out_im_reg[7];
    assign io_out_QSV_8_0  = out_re_reg[8];  assign io_out_QSV_8_1  = out_im_reg[8];
    assign io_out_QSV_9_0  = out_re_reg[9];  assign io_out_QSV_9_1  = out_im_reg[9];
    assign io_out_QSV_10_0 = out_re_reg[10]; assign io_out_QSV_10_1 = out_im_reg[10];
    assign io_out_QSV_11_0 = out_re_reg[11]; assign io_out_QSV_11_1 = out_im_reg[11];
    assign io_out_QSV_12_0 = out_re_reg[12]; assign io_out_QSV_12_1 = out_im_reg[12];
    assign io_out_QSV_13_0 = out_re_reg[13]; assign io_out_QSV_13_1 = out_im_reg[13];
    assign io_out_QSV_14_0 = out_re_reg[14]; assign io_out_QSV_14_1 = out_im_reg[14];
    assign io_out_QSV_15_0 = out_re_reg[15]; assign io_out_QSV_15_1 = out_im_reg[15];
    assign io_out_QSV_16_0 = out_re_reg[16]; assign io_out_QSV_16_1 = out_im_reg[16];
    assign io_out_QSV_17_0 = out_re_reg[17]; assign io_out_QSV_17_1 = out_im_reg[17];
    assign io_out_QSV_18_0 = out_re_reg[18]; assign io_out_QSV_18_1 = out_im_reg[18];
    assign io_out_QSV_19_0 = out_re_reg[19]; assign io_out_QSV_19_1 = out_im_reg[19];
    assign io_out_QSV_20_0 = out_re_reg[20]; assign io_out_QSV_20_1 = out_im_reg[20];
    assign io_out_QSV_21_0 = out_re_reg[21]; assign io_out_QSV_21_1 = out_im_reg[21];
    assign io_out_QSV_22_0 = out_re_reg[22]; assign io_out_QSV_22_1 = out_im_reg[22];
    assign io_out_QSV_23_0 = out_re_reg[23]; assign io_out_QSV_23_1 = out_im_reg[23];
    assign io_out_QSV_24_0 = out_re_reg[24]; assign io_out_QSV_24_1 = out_im_reg[24];
    assign io_out_QSV_25_0 = out_re_reg[25]; assign io_out_QSV_25_1 = out_im_reg[25];
    assign io_out_QSV_26_0 = out_re_reg[26]; assign io_out_QSV_26_1 = out_im_reg[26];
    assign io_out_QSV_27_0 = out_re_reg[27]; assign io_out_QSV_27_1 = out_im_reg[27];
    assign io_out_QSV_28_0 = out_re_reg[28]; assign io_out_QSV_28_1 = out_im_reg[28];
    assign io_out_QSV_29_0 = out_re_reg[29]; assign io_out_QSV_29_1 = out_im_reg[29];
    assign io_out_QSV_30_0 = out_re_reg[30]; assign io_out_QSV_30_1 = out_im_reg[30];
    assign io_out_QSV_31_0 = out_re_reg[31]; assign io_out_QSV_31_1 = out_im_reg[31];
    assign io_out_valid    = out_valid_reg;

endmodule
