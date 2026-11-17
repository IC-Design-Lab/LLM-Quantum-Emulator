module Shor (
    input  logic       clock,
    input  logic       reset,
    input  logic [7:0] io_in_QSV_0_0,
    input  logic [7:0] io_in_QSV_0_1,
    input  logic [7:0] io_in_QSV_1_0,
    input  logic [7:0] io_in_QSV_1_1,
    input  logic [7:0] io_in_QSV_2_0,
    input  logic [7:0] io_in_QSV_2_1,
    input  logic [7:0] io_in_QSV_3_0,
    input  logic [7:0] io_in_QSV_3_1,
    input  logic [7:0] io_in_QSV_4_0,
    input  logic [7:0] io_in_QSV_4_1,
    input  logic [7:0] io_in_QSV_5_0,
    input  logic [7:0] io_in_QSV_5_1,
    input  logic [7:0] io_in_QSV_6_0,
    input  logic [7:0] io_in_QSV_6_1,
    input  logic [7:0] io_in_QSV_7_0,
    input  logic [7:0] io_in_QSV_7_1,
    input  logic [7:0] io_in_QSV_8_0,
    input  logic [7:0] io_in_QSV_8_1,
    input  logic [7:0] io_in_QSV_9_0,
    input  logic [7:0] io_in_QSV_9_1,
    input  logic [7:0] io_in_QSV_10_0,
    input  logic [7:0] io_in_QSV_10_1,
    input  logic [7:0] io_in_QSV_11_0,
    input  logic [7:0] io_in_QSV_11_1,
    input  logic [7:0] io_in_QSV_12_0,
    input  logic [7:0] io_in_QSV_12_1,
    input  logic [7:0] io_in_QSV_13_0,
    input  logic [7:0] io_in_QSV_13_1,
    input  logic [7:0] io_in_QSV_14_0,
    input  logic [7:0] io_in_QSV_14_1,
    input  logic [7:0] io_in_QSV_15_0,
    input  logic [7:0] io_in_QSV_15_1,
    input  logic [7:0] io_in_QSV_16_0,
    input  logic [7:0] io_in_QSV_16_1,
    input  logic [7:0] io_in_QSV_17_0,
    input  logic [7:0] io_in_QSV_17_1,
    input  logic [7:0] io_in_QSV_18_0,
    input  logic [7:0] io_in_QSV_18_1,
    input  logic [7:0] io_in_QSV_19_0,
    input  logic [7:0] io_in_QSV_19_1,
    input  logic [7:0] io_in_QSV_20_0,
    input  logic [7:0] io_in_QSV_20_1,
    input  logic [7:0] io_in_QSV_21_0,
    input  logic [7:0] io_in_QSV_21_1,
    input  logic [7:0] io_in_QSV_22_0,
    input  logic [7:0] io_in_QSV_22_1,
    input  logic [7:0] io_in_QSV_23_0,
    input  logic [7:0] io_in_QSV_23_1,
    input  logic [7:0] io_in_QSV_24_0,
    input  logic [7:0] io_in_QSV_24_1,
    input  logic [7:0] io_in_QSV_25_0,
    input  logic [7:0] io_in_QSV_25_1,
    input  logic [7:0] io_in_QSV_26_0,
    input  logic [7:0] io_in_QSV_26_1,
    input  logic [7:0] io_in_QSV_27_0,
    input  logic [7:0] io_in_QSV_27_1,
    input  logic [7:0] io_in_QSV_28_0,
    input  logic [7:0] io_in_QSV_28_1,
    input  logic [7:0] io_in_QSV_29_0,
    input  logic [7:0] io_in_QSV_29_1,
    input  logic [7:0] io_in_QSV_30_0,
    input  logic [7:0] io_in_QSV_30_1,
    input  logic [7:0] io_in_QSV_31_0,
    input  logic [7:0] io_in_QSV_31_1,
    input  logic       io_in_valid,

    output logic [7:0] io_out_QSV_0_0,
    output logic [7:0] io_out_QSV_0_1,
    output logic [7:0] io_out_QSV_1_0,
    output logic [7:0] io_out_QSV_1_1,
    output logic [7:0] io_out_QSV_2_0,
    output logic [7:0] io_out_QSV_2_1,
    output logic [7:0] io_out_QSV_3_0,
    output logic [7:0] io_out_QSV_3_1,
    output logic [7:0] io_out_QSV_4_0,
    output logic [7:0] io_out_QSV_4_1,
    output logic [7:0] io_out_QSV_5_0,
    output logic [7:0] io_out_QSV_5_1,
    output logic [7:0] io_out_QSV_6_0,
    output logic [7:0] io_out_QSV_6_1,
    output logic [7:0] io_out_QSV_7_0,
    output logic [7:0] io_out_QSV_7_1,
    output logic [7:0] io_out_QSV_8_0,
    output logic [7:0] io_out_QSV_8_1,
    output logic [7:0] io_out_QSV_9_0,
    output logic [7:0] io_out_QSV_9_1,
    output logic [7:0] io_out_QSV_10_0,
    output logic [7:0] io_out_QSV_10_1,
    output logic [7:0] io_out_QSV_11_0,
    output logic [7:0] io_out_QSV_11_1,
    output logic [7:0] io_out_QSV_12_0,
    output logic [7:0] io_out_QSV_12_1,
    output logic [7:0] io_out_QSV_13_0,
    output logic [7:0] io_out_QSV_13_1,
    output logic [7:0] io_out_QSV_14_0,
    output logic [7:0] io_out_QSV_14_1,
    output logic [7:0] io_out_QSV_15_0,
    output logic [7:0] io_out_QSV_15_1,
    output logic [7:0] io_out_QSV_16_0,
    output logic [7:0] io_out_QSV_16_1,
    output logic [7:0] io_out_QSV_17_0,
    output logic [7:0] io_out_QSV_17_1,
    output logic [7:0] io_out_QSV_18_0,
    output logic [7:0] io_out_QSV_18_1,
    output logic [7:0] io_out_QSV_19_0,
    output logic [7:0] io_out_QSV_19_1,
    output logic [7:0] io_out_QSV_20_0,
    output logic [7:0] io_out_QSV_20_1,
    output logic [7:0] io_out_QSV_21_0,
    output logic [7:0] io_out_QSV_21_1,
    output logic [7:0] io_out_QSV_22_0,
    output logic [7:0] io_out_QSV_22_1,
    output logic [7:0] io_out_QSV_23_0,
    output logic [7:0] io_out_QSV_23_1,
    output logic [7:0] io_out_QSV_24_0,
    output logic [7:0] io_out_QSV_24_1,
    output logic [7:0] io_out_QSV_25_0,
    output logic [7:0] io_out_QSV_25_1,
    output logic [7:0] io_out_QSV_26_0,
    output logic [7:0] io_out_QSV_26_1,
    output logic [7:0] io_out_QSV_27_0,
    output logic [7:0] io_out_QSV_27_1,
    output logic [7:0] io_out_QSV_28_0,
    output logic [7:0] io_out_QSV_28_1,
    output logic [7:0] io_out_QSV_29_0,
    output logic [7:0] io_out_QSV_29_1,
    output logic [7:0] io_out_QSV_30_0,
    output logic [7:0] io_out_QSV_30_1,
    output logic [7:0] io_out_QSV_31_0,
    output logic [7:0] io_out_QSV_31_1,
    output logic       io_out_valid
);

    // Fixed-point scale factor for 1/sqrt(2) is ~0.7071. 
    // In Q1.7 with signed arithmetic, (sum * 181) >>> 8 performs the operation.
    function automatic logic [7:0] scale_and_clip(logic signed [9:0] sum);
        logic signed [17:0] product;
        logic signed [9:0] shifted;
        product = sum * 10'sd181;
        shifted = product >>> 8;
        if (shifted > 10'sd127) begin
            return 8'sd127;
        end else if (shifted < -10'sd128) begin
            return -8'sd128;
        end else begin
            return shifted[7:0];
        end
    endfunction

    // Stage 0: Input Registers
    logic signed [7:0] r0_V [31:0][1:0];
    logic r0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_valid <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                r0_V[i][0] <= 8'sd0;
                r0_V[i][1] <= 8'sd0;
            end
        end else begin
            r0_valid    <= io_in_valid;
            r0_V[0][0]  <= $signed(io_in_QSV_0_0);  r0_V[0][1]  <= $signed(io_in_QSV_0_1);
            r0_V[1][0]  <= $signed(io_in_QSV_1_0);  r0_V[1][1]  <= $signed(io_in_QSV_1_1);
            r0_V[2][0]  <= $signed(io_in_QSV_2_0);  r0_V[2][1]  <= $signed(io_in_QSV_2_1);
            r0_V[3][0]  <= $signed(io_in_QSV_3_0);  r0_V[3][1]  <= $signed(io_in_QSV_3_1);
            r0_V[4][0]  <= $signed(io_in_QSV_4_0);  r0_V[4][1]  <= $signed(io_in_QSV_4_1);
            r0_V[5][0]  <= $signed(io_in_QSV_5_0);  r0_V[5][1]  <= $signed(io_in_QSV_5_1);
            r0_V[6][0]  <= $signed(io_in_QSV_6_0);  r0_V[6][1]  <= $signed(io_in_QSV_6_1);
            r0_V[7][0]  <= $signed(io_in_QSV_7_0);  r0_V[7][1]  <= $signed(io_in_QSV_7_1);
            r0_V[8][0]  <= $signed(io_in_QSV_8_0);  r0_V[8][1]  <= $signed(io_in_QSV_8_1);
            r0_V[9][0]  <= $signed(io_in_QSV_9_0);  r0_V[9][1]  <= $signed(io_in_QSV_9_1);
            r0_V[10][0] <= $signed(io_in_QSV_10_0); r0_V[10][1] <= $signed(io_in_QSV_10_1);
            r0_V[11][0] <= $signed(io_in_QSV_11_0); r0_V[11][1] <= $signed(io_in_QSV_11_1);
            r0_V[12][0] <= $signed(io_in_QSV_12_0); r0_V[12][1] <= $signed(io_in_QSV_12_1);
            r0_V[13][0] <= $signed(io_in_QSV_13_0); r0_V[13][1] <= $signed(io_in_QSV_13_1);
            r0_V[14][0] <= $signed(io_in_QSV_14_0); r0_V[14][1] <= $signed(io_in_QSV_14_1);
            r0_V[15][0] <= $signed(io_in_QSV_15_0); r0_V[15][1] <= $signed(io_in_QSV_15_1);
            r0_V[16][0] <= $signed(io_in_QSV_16_0); r0_V[16][1] <= $signed(io_in_QSV_16_1);
            r0_V[17][0] <= $signed(io_in_QSV_17_0); r0_V[17][1] <= $signed(io_in_QSV_17_1);
            r0_V[18][0] <= $signed(io_in_QSV_18_0); r0_V[18][1] <= $signed(io_in_QSV_18_1);
            r0_V[19][0] <= $signed(io_in_QSV_19_0); r0_V[19][1] <= $signed(io_in_QSV_19_1);
            r0_V[20][0] <= $signed(io_in_QSV_20_0); r0_V[20][1] <= $signed(io_in_QSV_20_1);
            r0_V[21][0] <= $signed(io_in_QSV_21_0); r0_V[21][1] <= $signed(io_in_QSV_21_1);
            r0_V[22][0] <= $signed(io_in_QSV_22_0); r0_V[22][1] <= $signed(io_in_QSV_22_1);
            r0_V[23][0] <= $signed(io_in_QSV_23_0); r0_V[23][1] <= $signed(io_in_QSV_23_1);
            r0_V[24][0] <= $signed(io_in_QSV_24_0); r0_V[24][1] <= $signed(io_in_QSV_24_1);
            r0_V[25][0] <= $signed(io_in_QSV_25_0); r0_V[25][1] <= $signed(io_in_QSV_25_1);
            r0_V[26][0] <= $signed(io_in_QSV_26_0); r0_V[26][1] <= $signed(io_in_QSV_26_1);
            r0_V[27][0] <= $signed(io_in_QSV_27_0); r0_V[27][1] <= $signed(io_in_QSV_27_1);
            r0_V[28][0] <= $signed(io_in_QSV_28_0); r0_V[28][1] <= $signed(io_in_QSV_28_1);
            r0_V[29][0] <= $signed(io_in_QSV_29_0); r0_V[29][1] <= $signed(io_in_QSV_29_1);
            r0_V[30][0] <= $signed(io_in_QSV_30_0); r0_V[30][1] <= $signed(io_in_QSV_30_1);
            r0_V[31][0] <= $signed(io_in_QSV_31_0); r0_V[31][1] <= $signed(io_in_QSV_31_1);
        end
    end

    // Stage 1: Hadamard on Qubit 0 (LSB)
    logic signed [7:0] r1_V [31:0][1:0];
    logic r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_valid <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                r1_V[i][0] <= 8'sd0;
                r1_V[i][1] <= 8'sd0;
            end
        end else begin
            r1_valid <= r0_valid;
            for (int k = 0; k < 16; k++) begin
                r1_V[2*k][0]   <= scale_and_clip(r0_V[2*k][0] + r0_V[2*k+1][0]);
                r1_V[2*k][1]   <= scale_and_clip(r0_V[2*k][1] + r0_V[2*k+1][1]);
                r1_V[2*k+1][0] <= scale_and_clip(r0_V[2*k][0] - r0_V[2*k+1][0]);
                r1_V[2*k+1][1] <= scale_and_clip(r0_V[2*k][1] - r0_V[2*k+1][1]);
            end
        end
    end

    // Stage 2: Combinational CX gates in sequence
    // CX(0, 1): Q0 control, Q1 target
    logic signed [7:0] V_cx0 [31:0][1:0];
    always_comb begin
        for (int i = 0; i < 32; i++) begin
            if (i[0] == 1'b1) begin
                V_cx0[i] = r1_V[i ^ 5'b00010];
            end else begin
                V_cx0[i] = r1_V[i];
            end
        end
    end

    // CX(1, 2): Q1 control, Q2 target
    logic signed [7:0] V_cx1 [31:0][1:0];
    always_comb begin
        for (int i = 0; i < 32; i++) begin
            if (i[1] == 1'b1) begin
                V_cx1[i] = V_cx0[i ^ 5'b00100];
            end else begin
                V_cx1[i] = V_cx0[i];
            end
        end
    end

    // CX(2, 3): Q2 control, Q3 target
    logic signed [7:0] V_cx2 [31:0][1:0];
    always_comb begin
        for (int i = 0; i < 32; i++) begin
            if (i[2] == 1'b1) begin
                V_cx2[i] = V_cx1[i ^ 5'b01000];
            end else begin
                V_cx2[i] = V_cx1[i];
            end
        end
    end

    // CX(3, 4): Q3 control, Q4 target
    logic signed [7:0] V_cx3 [31:0][1:0];
    always_comb begin
        for (int i = 0; i < 32; i++) begin
            if (i[3] == 1'b1) begin
                V_cx3[i] = V_cx2[i ^ 5'b10000];
            end else begin
                V_cx3[i] = V_cx2[i];
            end
        end
    end

    // Stage 3: Output Registers
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_valid    <= 1'b0;
            io_out_QSV_0_0  <= 8'h00; io_out_QSV_0_1  <= 8'h00;
            io_out_QSV_1_0  <= 8'h00; io_out_QSV_1_1  <= 8'h00;
            io_out_QSV_2_0  <= 8'h00; io_out_QSV_2_1  <= 8'h00;
            io_out_QSV_3_0  <= 8'h00; io_out_QSV_3_1  <= 8'h00;
            io_out_QSV_4_0  <= 8'h00; io_out_QSV_4_1  <= 8'h00;
            io_out_QSV_5_0  <= 8'h00; io_out_QSV_5_1  <= 8'h00;
            io_out_QSV_6_0  <= 8'h00; io_out_QSV_6_1  <= 8'h00;
            io_out_QSV_7_0  <= 8'h00; io_out_QSV_7_1  <= 8'h00;
            io_out_QSV_8_0  <= 8'h00; io_out_QSV_8_1  <= 8'h00;
            io_out_QSV_9_0  <= 8'h00; io_out_QSV_9_1  <= 8'h00;
            io_out_QSV_10_0 <= 8'h00; io_out_QSV_10_1 <= 8'h00;
            io_out_QSV_11_0 <= 8'h00; io_out_QSV_11_1 <= 8'h00;
            io_out_QSV_12_0 <= 8'h00; io_out_QSV_12_1 <= 8'h00;
            io_out_QSV_13_0 <= 8'h00; io_out_QSV_13_1 <= 8'h00;
            io_out_QSV_14_0 <= 8'h00; io_out_QSV_14_1 <= 8'h00;
            io_out_QSV_15_0 <= 8'h00; io_out_QSV_15_1 <= 8'h00;
            io_out_QSV_16_0 <= 8'h00; io_out_QSV_16_1 <= 8'h00;
            io_out_QSV_17_0 <= 8'h00; io_out_QSV_17_1 <= 8'h00;
            io_out_QSV_18_0 <= 8'h00; io_out_QSV_18_1 <= 8'h00;
            io_out_QSV_19_0 <= 8'h00; io_out_QSV_19_1 <= 8'h00;
            io_out_QSV_20_0 <= 8'h00; io_out_QSV_20_1 <= 8'h00;
            io_out_QSV_21_0 <= 8'h00; io_out_QSV_21_1 <= 8'h00;
            io_out_QSV_22_0 <= 8'h00; io_out_QSV_22_1 <= 8'h00;
            io_out_QSV_23_0 <= 8'h00; io_out_QSV_23_1 <= 8'h00;
            io_out_QSV_24_0 <= 8'h00; io_out_QSV_24_1 <= 8'h00;
            io_out_QSV_25_0 <= 8'h00; io_out_QSV_25_1 <= 8'h00;
            io_out_QSV_26_0 <= 8'h00; io_out_QSV_26_1 <= 8'h00;
            io_out_QSV_27_0 <= 8'h00; io_out_QSV_27_1 <= 8'h00;
            io_out_QSV_28_0 <= 8'h00; io_out_QSV_28_1 <= 8'h00;
            io_out_QSV_29_0 <= 8'h00; io_out_QSV_29_1 <= 8'h00;
            io_out_QSV_30_0 <= 8'h00; io_out_QSV_30_1 <= 8'h00;
            io_out_QSV_31_0 <= 8'h00; io_out_QSV_31_1 <= 8'h00;
        end else begin
            io_out_valid    <= r1_valid;
            io_out_QSV_0_0  <= V_cx3[0][0];  io_out_QSV_0_1  <= V_cx3[0][1];
            io_out_QSV_1_0  <= V_cx3[1][0];  io_out_QSV_1_1  <= V_cx3[1][1];
            io_out_QSV_2_0  <= V_cx3[2][0];  io_out_QSV_2_1  <= V_cx3[2][1];
            io_out_QSV_3_0  <= V_cx3[3][0];  io_out_QSV_3_1  <= V_cx3[3][1];
            io_out_QSV_4_0  <= V_cx3[4][0];  io_out_QSV_4_1  <= V_cx3[4][1];
            io_out_QSV_5_0  <= V_cx3[5][0];  io_out_QSV_5_1  <= V_cx3[5][1];
            io_out_QSV_6_0  <= V_cx3[6][0];  io_out_QSV_6_1  <= V_cx3[6][1];
            io_out_QSV_7_0  <= V_cx3[7][0];  io_out_QSV_7_1  <= V_cx3[7][1];
            io_out_QSV_8_0  <= V_cx3[8][0];  io_out_QSV_8_1  <= V_cx3[8][1];
            io_out_QSV_9_0  <= V_cx3[9][0];  io_out_QSV_9_1  <= V_cx3[9][1];
            io_out_QSV_10_0 <= V_cx3[10][0]; io_out_QSV_10_1 <= V_cx3[10][1];
            io_out_QSV_11_0 <= V_cx3[11][0]; io_out_QSV_11_1 <= V_cx3[11][1];
            io_out_QSV_12_0 <= V_cx3[12][0]; io_out_QSV_12_1 <= V_cx3[12][1];
            io_out_QSV_13_0 <= V_cx3[13][0]; io_out_QSV_13_1 <= V_cx3[13][1];
            io_out_QSV_14_0 <= V_cx3[14][0]; io_out_QSV_14_1 <= V_cx3[14][1];
            io_out_QSV_15_0 <= V_cx3[15][0]; io_out_QSV_15_1 <= V_cx3[15][1];
            io_out_QSV_16_0 <= V_cx3[16][0]; io_out_QSV_16_1 <= V_cx3[16][1];
            io_out_QSV_17_0 <= V_cx3[17][0]; io_out_QSV_17_1 <= V_cx3[17][1];
            io_out_QSV_18_0 <= V_cx3[18][0]; io_out_QSV_18_1 <= V_cx3[18][1];
            io_out_QSV_19_0 <= V_cx3[19][0]; io_out_QSV_19_1 <= V_cx3[19][1];
            io_out_QSV_20_0 <= V_cx3[20][0]; io_out_QSV_20_1 <= V_cx3[20][1];
            io_out_QSV_21_0 <= V_cx3[21][0]; io_out_QSV_21_1 <= V_cx3[21][1];
            io_out_QSV_22_0 <= V_cx3[22][0]; io_out_QSV_22_1 <= V_cx3[22][1];
            io_out_QSV_23_0 <= V_cx3[23][0]; io_out_QSV_23_1 <= V_cx3[23][1];
            io_out_QSV_24_0 <= V_cx3[24][0]; io_out_QSV_24_1 <= V_cx3[24][1];
            io_out_QSV_25_0 <= V_cx3[25][0]; io_out_QSV_25_1 <= V_cx3[25][1];
            io_out_QSV_26_0 <= V_cx3[26][0]; io_out_QSV_26_1 <= V_cx3[26][1];
            io_out_QSV_27_0 <= V_cx3[27][0]; io_out_QSV_27_1 <= V_cx3[27][1];
            io_out_QSV_28_0 <= V_cx3[28][0]; io_out_QSV_28_1 <= V_cx3[28][1];
            io_out_QSV_29_0 <= V_cx3[29][0]; io_out_QSV_29_1 <= V_cx3[29][1];
            io_out_QSV_30_0 <= V_cx3[30][0]; io_out_QSV_30_1 <= V_cx3[30][1];
            io_out_QSV_31_0 <= V_cx3[31][0]; io_out_QSV_31_1 <= V_cx3[31][1];
        end
    end

endmodule
