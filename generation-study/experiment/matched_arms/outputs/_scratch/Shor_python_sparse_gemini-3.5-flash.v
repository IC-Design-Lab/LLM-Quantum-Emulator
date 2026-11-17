module Shor (
    input  logic        clock,
    input  logic        reset,
    input  logic [7:0]  io_in_QSV_0_0,
    input  logic [7:0]  io_in_QSV_0_1,
    input  logic [7:0]  io_in_QSV_1_0,
    input  logic [7:0]  io_in_QSV_1_1,
    input  logic [7:0]  io_in_QSV_2_0,
    input  logic [7:0]  io_in_QSV_2_1,
    input  logic [7:0]  io_in_QSV_3_0,
    input  logic [7:0]  io_in_QSV_3_1,
    input  logic [7:0]  io_in_QSV_4_0,
    input  logic [7:0]  io_in_QSV_4_1,
    input  logic [7:0]  io_in_QSV_5_0,
    input  logic [7:0]  io_in_QSV_5_1,
    input  logic [7:0]  io_in_QSV_6_0,
    input  logic [7:0]  io_in_QSV_6_1,
    input  logic [7:0]  io_in_QSV_7_0,
    input  logic [7:0]  io_in_QSV_7_1,
    input  logic [7:0]  io_in_QSV_8_0,
    input  logic [7:0]  io_in_QSV_8_1,
    input  logic [7:0]  io_in_QSV_9_0,
    input  logic [7:0]  io_in_QSV_9_1,
    input  logic [7:0]  io_in_QSV_10_0,
    input  logic [7:0]  io_in_QSV_10_1,
    input  logic [7:0]  io_in_QSV_11_0,
    input  logic [7:0]  io_in_QSV_11_1,
    input  logic [7:0]  io_in_QSV_12_0,
    input  logic [7:0]  io_in_QSV_12_1,
    input  logic [7:0]  io_in_QSV_13_0,
    input  logic [7:0]  io_in_QSV_13_1,
    input  logic [7:0]  io_in_QSV_14_0,
    input  logic [7:0]  io_in_QSV_14_1,
    input  logic [7:0]  io_in_QSV_15_0,
    input  logic [7:0]  io_in_QSV_15_1,
    input  logic [7:0]  io_in_QSV_16_0,
    input  logic [7:0]  io_in_QSV_16_1,
    input  logic [7:0]  io_in_QSV_17_0,
    input  logic [7:0]  io_in_QSV_17_1,
    input  logic [7:0]  io_in_QSV_18_0,
    input  logic [7:0]  io_in_QSV_18_1,
    input  logic [7:0]  io_in_QSV_19_0,
    input  logic [7:0]  io_in_QSV_19_1,
    input  logic [7:0]  io_in_QSV_20_0,
    input  logic [7:0]  io_in_QSV_20_1,
    input  logic [7:0]  io_in_QSV_21_0,
    input  logic [7:0]  io_in_QSV_21_1,
    input  logic [7:0]  io_in_QSV_22_0,
    input  logic [7:0]  io_in_QSV_22_1,
    input  logic [7:0]  io_in_QSV_23_0,
    input  logic [7:0]  io_in_QSV_23_1,
    input  logic [7:0]  io_in_QSV_24_0,
    input  logic [7:0]  io_in_QSV_24_1,
    input  logic [7:0]  io_in_QSV_25_0,
    input  logic [7:0]  io_in_QSV_25_1,
    input  logic [7:0]  io_in_QSV_26_0,
    input  logic [7:0]  io_in_QSV_26_1,
    input  logic [7:0]  io_in_QSV_27_0,
    input  logic [7:0]  io_in_QSV_27_1,
    input  logic [7:0]  io_in_QSV_28_0,
    input  logic [7:0]  io_in_QSV_28_1,
    input  logic [7:0]  io_in_QSV_29_0,
    input  logic [7:0]  io_in_QSV_29_1,
    input  logic [7:0]  io_in_QSV_30_0,
    input  logic [7:0]  io_in_QSV_30_1,
    input  logic [7:0]  io_in_QSV_31_0,
    input  logic [7:0]  io_in_QSV_31_1,
    input  logic        io_in_valid,
    output logic [7:0]  io_out_QSV_0_0,
    output logic [7:0]  io_out_QSV_0_1,
    output logic [7:0]  io_out_QSV_1_0,
    output logic [7:0]  io_out_QSV_1_1,
    output logic [7:0]  io_out_QSV_2_0,
    output logic [7:0]  io_out_QSV_2_1,
    output logic [7:0]  io_out_QSV_3_0,
    output logic [7:0]  io_out_QSV_3_1,
    output logic [7:0]  io_out_QSV_4_0,
    output logic [7:0]  io_out_QSV_4_1,
    output logic [7:0]  io_out_QSV_5_0,
    output logic [7:0]  io_out_QSV_5_1,
    output logic [7:0]  io_out_QSV_6_0,
    output logic [7:0]  io_out_QSV_6_1,
    output logic [7:0]  io_out_QSV_7_0,
    output logic [7:0]  io_out_QSV_7_1,
    output logic [7:0]  io_out_QSV_8_0,
    output logic [7:0]  io_out_QSV_8_1,
    output logic [7:0]  io_out_QSV_9_0,
    output logic [7:0]  io_out_QSV_9_1,
    output logic [7:0]  io_out_QSV_10_0,
    output logic [7:0]  io_out_QSV_10_1,
    output logic [7:0]  io_out_QSV_11_0,
    output logic [7:0]  io_out_QSV_11_1,
    output logic [7:0]  io_out_QSV_12_0,
    output logic [7:0]  io_out_QSV_12_1,
    output logic [7:0]  io_out_QSV_13_0,
    output logic [7:0]  io_out_QSV_13_1,
    output logic [7:0]  io_out_QSV_14_0,
    output logic [7:0]  io_out_QSV_14_1,
    output logic [7:0]  io_out_QSV_15_0,
    output logic [7:0]  io_out_QSV_15_1,
    output logic [7:0]  io_out_QSV_16_0,
    output logic [7:0]  io_out_QSV_16_1,
    output logic [7:0]  io_out_QSV_17_0,
    output logic [7:0]  io_out_QSV_17_1,
    output logic [7:0]  io_out_QSV_18_0,
    output logic [7:0]  io_out_QSV_18_1,
    output logic [7:0]  io_out_QSV_19_0,
    output logic [7:0]  io_out_QSV_19_1,
    output logic [7:0]  io_out_QSV_20_0,
    output logic [7:0]  io_out_QSV_20_1,
    output logic [7:0]  io_out_QSV_21_0,
    output logic [7:0]  io_out_QSV_21_1,
    output logic [7:0]  io_out_QSV_22_0,
    output logic [7:0]  io_out_QSV_22_1,
    output logic [7:0]  io_out_QSV_23_0,
    output logic [7:0]  io_out_QSV_23_1,
    output logic [7:0]  io_out_QSV_24_0,
    output logic [7:0]  io_out_QSV_24_1,
    output logic [7:0]  io_out_QSV_25_0,
    output logic [7:0]  io_out_QSV_25_1,
    output logic [7:0]  io_out_QSV_26_0,
    output logic [7:0]  io_out_QSV_26_1,
    output logic [7:0]  io_out_QSV_27_0,
    output logic [7:0]  io_out_QSV_27_1,
    output logic [7:0]  io_out_QSV_28_0,
    output logic [7:0]  io_out_QSV_28_1,
    output logic [7:0]  io_out_QSV_29_0,
    output logic [7:0]  io_out_QSV_29_1,
    output logic [7:0]  io_out_QSV_30_0,
    output logic [7:0]  io_out_QSV_30_1,
    output logic [7:0]  io_out_QSV_31_0,
    output logic [7:0]  io_out_QSV_31_1,
    output logic        io_out_valid
);

    // Pipelines stages definition
    logic signed [7:0] stage0_r[32];
    logic signed [7:0] stage0_i[32];
    logic              stage0_valid;

    logic signed [7:0] stage1_r[32];
    logic signed [7:0] stage1_i[32];
    logic              stage1_valid;

    logic signed [7:0] stage2_r[32];
    logic signed [7:0] stage2_i[32];
    logic              stage2_valid;

    logic signed [7:0] stage3_r[32];
    logic signed [7:0] stage3_i[32];
    logic              stage3_valid;

    logic signed [7:0] stage4_r[32];
    logic signed [7:0] stage4_i[32];
    logic              stage4_valid;

    logic signed [7:0] stage5_r[32];
    logic signed [7:0] stage5_i[32];
    logic              stage5_valid;

    // Helper clamp function for 8-bit fixed point Q1.7
    function automatic logic [7:0] clamp(logic signed [9:0] val);
        if (val > 10'sd127)  return 8'sd127;
        if (val < -10'sd128) return -8'sd128;
        return val[7:0];
    endfunction

    // Stage 0: Registering inputs
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage0_valid <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                stage0_r[i] <= 8'sd0;
                stage0_i[i] <= 8'sd0;
            end
        end else begin
            stage0_valid <= io_in_valid;
            stage0_r[0]  <= io_in_QSV_0_0;  stage0_i[0]  <= io_in_QSV_0_1;
            stage0_r[1]  <= io_in_QSV_1_0;  stage0_i[1]  <= io_in_QSV_1_1;
            stage0_r[2]  <= io_in_QSV_2_0;  stage0_i[2]  <= io_in_QSV_2_1;
            stage0_r[3]  <= io_in_QSV_3_0;  stage0_i[3]  <= io_in_QSV_3_1;
            stage0_r[4]  <= io_in_QSV_4_0;  stage0_i[4]  <= io_in_QSV_4_1;
            stage0_r[5]  <= io_in_QSV_5_0;  stage0_i[5]  <= io_in_QSV_5_1;
            stage0_r[6]  <= io_in_QSV_6_0;  stage0_i[6]  <= io_in_QSV_6_1;
            stage0_r[7]  <= io_in_QSV_7_0;  stage0_i[7]  <= io_in_QSV_7_1;
            stage0_r[8]  <= io_in_QSV_8_0;  stage0_i[8]  <= io_in_QSV_8_1;
            stage0_r[9]  <= io_in_QSV_9_0;  stage0_i[9]  <= io_in_QSV_9_1;
            stage0_r[10] <= io_in_QSV_10_0; stage0_i[10] <= io_in_QSV_10_1;
            stage0_r[11] <= io_in_QSV_11_0; stage0_i[11] <= io_in_QSV_11_1;
            stage0_r[12] <= io_in_QSV_12_0; stage0_i[12] <= io_in_QSV_12_1;
            stage0_r[13] <= io_in_QSV_13_0; stage0_i[13] <= io_in_QSV_13_1;
            stage0_r[14] <= io_in_QSV_14_0; stage0_i[14] <= io_in_QSV_14_1;
            stage0_r[15] <= io_in_QSV_15_0; stage0_i[15] <= io_in_QSV_15_1;
            stage0_r[16] <= io_in_QSV_16_0; stage0_i[16] <= io_in_QSV_16_1;
            stage0_r[17] <= io_in_QSV_17_0; stage0_i[17] <= io_in_QSV_17_1;
            stage0_r[18] <= io_in_QSV_18_0; stage0_i[18] <= io_in_QSV_18_1;
            stage0_r[19] <= io_in_QSV_19_0; stage0_i[19] <= io_in_QSV_19_1;
            stage0_r[20] <= io_in_QSV_20_0; stage0_i[20] <= io_in_QSV_20_1;
            stage0_r[21] <= io_in_QSV_21_0; stage0_i[21] <= io_in_QSV_21_1;
            stage0_r[22] <= io_in_QSV_22_0; stage0_i[22] <= io_in_QSV_22_1;
            stage0_r[23] <= io_in_QSV_23_0; stage0_i[23] <= io_in_QSV_23_1;
            stage0_r[24] <= io_in_QSV_24_0; stage0_i[24] <= io_in_QSV_24_1;
            stage0_r[25] <= io_in_QSV_25_0; stage0_i[25] <= io_in_QSV_25_1;
            stage0_r[26] <= io_in_QSV_26_0; stage0_i[26] <= io_in_QSV_26_1;
            stage0_r[27] <= io_in_QSV_27_0; stage0_i[27] <= io_in_QSV_27_1;
            stage0_r[28] <= io_in_QSV_28_0; stage0_i[28] <= io_in_QSV_28_1;
            stage0_r[29] <= io_in_QSV_29_0; stage0_i[29] <= io_in_QSV_29_1;
            stage0_r[30] <= io_in_QSV_30_0; stage0_i[30] <= io_in_QSV_30_1;
            stage0_r[31] <= io_in_QSV_31_0; stage0_i[31] <= io_in_QSV_31_1;
        end
    end

    // Stage 1: H(0) - Hadamard on bit 0
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage1_valid <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                stage1_r[i] <= 8'sd0;
                stage1_i[i] <= 8'sd0;
            end
        end else begin
            stage1_valid <= stage0_valid;
            for (int k = 0; k < 16; k++) begin : hadamard_0
                logic signed [8:0] sum_r;
                logic signed [8:0] diff_r;
                logic signed [8:0] sum_i;
                logic signed [8:0] diff_i;
                logic signed [17:0] prod_sum_r;
                logic signed [17:0] prod_diff_r;
                logic signed [17:0] prod_sum_i;
                logic signed [17:0] prod_diff_i;

                sum_r  = $signed(stage0_r[2*k]) + $signed(stage0_r[2*k+1]);
                diff_r = $signed(stage0_r[2*k]) - $signed(stage0_r[2*k+1]);
                sum_i  = $signed(stage0_i[2*k]) + $signed(stage0_i[2*k+1]);
                diff_i = $signed(stage0_i[2*k]) - $signed(stage0_i[2*k+1]);

                prod_sum_r  = sum_r * 18'sd181;
                prod_diff_r = diff_r * 18'sd181;
                prod_sum_i  = sum_i * 18'sd181;
                prod_diff_i = diff_i * 18'sd181;

                stage1_r[2*k]   <= clamp((prod_sum_r + 18'sd128) >>> 8);
                stage1_r[2*k+1] <= clamp((prod_diff_r + 18'sd128) >>> 8);
                stage1_i[2*k]   <= clamp((prod_sum_i + 18'sd128) >>> 8);
                stage1_i[2*k+1] <= clamp((prod_diff_i + 18'sd128) >>> 8);
            end
        end
    end

    // Stage 2: CX(0, 1) - Control bit 0, Target bit 1
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage2_valid <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                stage2_r[i] <= 8'sd0;
                stage2_i[i] <= 8'sd0;
            end
        end else begin
            stage2_valid <= stage1_valid;
            for (int i = 0; i < 32; i++) begin
                automatic logic [4:0] idx = i[4:0];
                if (idx[0] == 1'b1) begin
                    stage2_r[i] <= stage1_r[idx ^ 5'd2];
                    stage2_i[i] <= stage1_i[idx ^ 5'd2];
                end else begin
                    stage2_r[i] <= stage1_r[i];
                    stage2_i[i] <= stage1_i[i];
                end
            end
        end
    end

    // Stage 3: CX(1, 2) - Control bit 1, Target bit 2
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage3_valid <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                stage3_r[i] <= 8'sd0;
                stage3_i[i] <= 8'sd0;
            end
        end else begin
            stage3_valid <= stage2_valid;
            for (int i = 0; i < 32; i++) begin
                automatic logic [4:0] idx = i[4:0];
                if (idx[1] == 1'b1) begin
                    stage3_r[i] <= stage2_r[idx ^ 5'd4];
                    stage3_i[i] <= stage2_i[idx ^ 5'd4];
                end else begin
                    stage3_r[i] <= stage2_r[i];
                    stage3_i[i] <= stage2_i[i];
                end
            end
        end
    end

    // Stage 4: CX(2, 3) - Control bit 2, Target bit 3
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage4_valid <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                stage4_r[i] <= 8'sd0;
                stage4_i[i] <= 8'sd0;
            end
        end else begin
            stage4_valid <= stage3_valid;
            for (int i = 0; i < 32; i++) begin
                automatic logic [4:0] idx = i[4:0];
                if (idx[2] == 1'b1) begin
                    stage4_r[i] <= stage3_r[idx ^ 5'd8];
                    stage4_i[i] <= stage3_i[idx ^ 5'd8];
                end else begin
                    stage4_r[i] <= stage3_r[i];
                    stage4_i[i] <= stage3_i[i];
                end
            end
        end
    end

    // Stage 5: CX(3, 4) - Control bit 3, Target bit 4
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage5_valid <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                stage5_r[i] <= 8'sd0;
                stage5_i[i] <= 8'sd0;
            end
        end else begin
            stage5_valid <= stage4_valid;
            for (int i = 0; i < 32; i++) begin
                automatic logic [4:0] idx = i[4:0];
                if (idx[3] == 1'b1) begin
                    stage5_r[i] <= stage4_r[idx ^ 5'd16];
                    stage5_i[i] <= stage4_i[idx ^ 5'd16];
                end else begin
                    stage5_r[i] <= stage4_r[i];
                    stage5_i[i] <= stage4_i[i];
                end
            end
        end
    end

    // Assigning Outputs from Stage 5
    assign io_out_valid = stage5_valid;
    assign io_out_QSV_0_0  = stage5_r[0];  assign io_out_QSV_0_1  = stage5_i[0];
    assign io_out_QSV_1_0  = stage5_r[1];  assign io_out_QSV_1_1  = stage5_i[1];
    assign io_out_QSV_2_0  = stage5_r[2];  assign io_out_QSV_2_1  = stage5_i[2];
    assign io_out_QSV_3_0  = stage5_r[3];  assign io_out_QSV_3_1  = stage5_i[3];
    assign io_out_QSV_4_0  = stage5_r[4];  assign io_out_QSV_4_1  = stage5_i[4];
    assign io_out_QSV_5_0  = stage5_r[5];  assign io_out_QSV_5_1  = stage5_i[5];
    assign io_out_QSV_6_0  = stage5_r[6];  assign io_out_QSV_6_1  = stage5_i[6];
    assign io_out_QSV_7_0  = stage5_r[7];  assign io_out_QSV_7_1  = stage5_i[7];
    assign io_out_QSV_8_0  = stage5_r[8];  assign io_out_QSV_8_1  = stage5_i[8];
    assign io_out_QSV_9_0  = stage5_r[9];  assign io_out_QSV_9_1  = stage5_i[9];
    assign io_out_QSV_10_0 = stage5_r[10]; assign io_out_QSV_10_1 = stage5_i[10];
    assign io_out_QSV_11_0 = stage5_r[11]; assign io_out_QSV_11_1 = stage5_i[11];
    assign io_out_QSV_12_0 = stage5_r[12]; assign io_out_QSV_12_1 = stage5_i[12];
    assign io_out_QSV_13_0 = stage5_r[13]; assign io_out_QSV_13_1 = stage5_i[13];
    assign io_out_QSV_14_0 = stage5_r[14]; assign io_out_QSV_14_1 = stage5_i[14];
    assign io_out_QSV_15_0 = stage5_r[15]; assign io_out_QSV_15_1 = stage5_i[15];
    assign io_out_QSV_16_0 = stage5_r[16]; assign io_out_QSV_16_1 = stage5_i[16];
    assign io_out_QSV_17_0 = stage5_r[17]; assign io_out_QSV_17_1 = stage5_i[17];
    assign io_out_QSV_18_0 = stage5_r[18]; assign io_out_QSV_18_1 = stage5_i[18];
    assign io_out_QSV_19_0 = stage5_r[19]; assign io_out_QSV_19_1 = stage5_i[19];
    assign io_out_QSV_20_0 = stage5_r[20]; assign io_out_QSV_20_1 = stage5_i[20];
    assign io_out_QSV_21_0 = stage5_r[21]; assign io_out_QSV_21_1 = stage5_i[21];
    assign io_out_QSV_22_0 = stage5_r[22]; assign io_out_QSV_22_1 = stage5_i[22];
    assign io_out_QSV_23_0 = stage5_r[23]; assign io_out_QSV_23_1 = stage5_i[23];
    assign io_out_QSV_24_0 = stage5_r[24]; assign io_out_QSV_24_1 = stage5_i[24];
    assign io_out_QSV_25_0 = stage5_r[25]; assign io_out_QSV_25_1 = stage5_i[25];
    assign io_out_QSV_26_0 = stage5_r[26]; assign io_out_QSV_26_1 = stage5_i[26];
    assign io_out_QSV_27_0 = stage5_r[27]; assign io_out_QSV_27_1 = stage5_i[27];
    assign io_out_QSV_28_0 = stage5_r[28]; assign io_out_QSV_28_1 = stage5_i[28];
    assign io_out_QSV_29_0 = stage5_r[29]; assign io_out_QSV_29_1 = stage5_i[29];
    assign io_out_QSV_30_0 = stage5_r[30]; assign io_out_QSV_30_1 = stage5_i[30];
    assign io_out_QSV_31_0 = stage5_r[31]; assign io_out_QSV_31_1 = stage5_i[31];

endmodule
