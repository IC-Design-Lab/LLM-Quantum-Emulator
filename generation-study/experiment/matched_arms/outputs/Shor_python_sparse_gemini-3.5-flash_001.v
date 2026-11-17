module Shor (
    input  logic clock,
    input  logic reset,
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
    input  logic io_in_valid,

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
    output logic io_out_valid
);

    // Helper function for Hadamard gate on normalized amplitudes
    function automatic void hadamard(
        input  logic signed [7:0] ar, input  logic signed [7:0] ai,
        input  logic signed [7:0] br, input  logic signed [7:0] bi,
        output logic signed [7:0] out_ar, output logic signed [7:0] out_ai,
        output logic signed [7:0] out_br, output logic signed [7:0] out_bi
    );
        logic signed [8:0] sum_r, diff_r, sum_i, diff_i;
        logic signed [17:0] prod_sum_r, prod_diff_r, prod_sum_i, prod_diff_i;
        logic signed [17:0] round_sum_r, round_diff_r, round_sum_i, round_diff_i;
        logic signed [10:0] shift_sum_r, shift_diff_r, shift_sum_i, shift_diff_i;

        sum_r = ar + br;
        diff_r = ar - br;
        sum_i = ai + bi;
        diff_i = ai - bi;

        // 91/128 is approximately 1/sqrt(2) = 0.7071
        prod_sum_r  = sum_r * 9'sd91;
        prod_diff_r = diff_r * 9'sd91;
        prod_sum_i  = sum_i * 9'sd91;
        prod_diff_i = diff_i * 9'sd91;

        round_sum_r  = prod_sum_r + 18'sd64;
        round_diff_r = prod_diff_r + 18'sd64;
        round_sum_i  = prod_sum_i + 18'sd64;
        round_diff_i = prod_diff_i + 18'sd64;

        shift_sum_r  = round_sum_r >>> 7;
        shift_diff_r = round_diff_r >>> 7;
        shift_sum_i  = round_sum_i >>> 7;
        shift_diff_i = round_diff_i >>> 7;

        // Saturation logic for signed 8-bit output
        if (shift_sum_r > 127) out_ar = 127;
        else if (shift_sum_r < -128) out_ar = -128;
        else out_ar = shift_sum_r[7:0];

        if (shift_diff_r > 127) out_br = 127;
        else if (shift_diff_r < -128) out_br = -128;
        else out_br = shift_diff_r[7:0];

        if (shift_sum_i > 127) out_ai = 127;
        else if (shift_sum_i < -128) out_ai = -128;
        else out_ai = shift_sum_i[7:0];

        if (shift_diff_i > 127) out_bi = 127;
        else if (shift_diff_i < -128) out_bi = -128;
        else out_bi = shift_diff_i[7:0];
    endfunction

    // Input assignments to arrays
    logic signed [7:0] io_in_QSV_r [32];
    logic signed [7:0] io_in_QSV_i [32];

    assign io_in_QSV_r[0] = io_in_QSV_0_0; assign io_in_QSV_i[0] = io_in_QSV_0_1;
    assign io_in_QSV_r[1] = io_in_QSV_1_0; assign io_in_QSV_i[1] = io_in_QSV_1_1;
    assign io_in_QSV_r[2] = io_in_QSV_2_0; assign io_in_QSV_i[2] = io_in_QSV_2_1;
    assign io_in_QSV_r[3] = io_in_QSV_3_0; assign io_in_QSV_i[3] = io_in_QSV_3_1;
    assign io_in_QSV_r[4] = io_in_QSV_4_0; assign io_in_QSV_i[4] = io_in_QSV_4_1;
    assign io_in_QSV_r[5] = io_in_QSV_5_0; assign io_in_QSV_i[5] = io_in_QSV_5_1;
    assign io_in_QSV_r[6] = io_in_QSV_6_0; assign io_in_QSV_i[6] = io_in_QSV_6_1;
    assign io_in_QSV_r[7] = io_in_QSV_7_0; assign io_in_QSV_i[7] = io_in_QSV_7_1;
    assign io_in_QSV_r[8] = io_in_QSV_8_0; assign io_in_QSV_i[8] = io_in_QSV_8_1;
    assign io_in_QSV_r[9] = io_in_QSV_9_0; assign io_in_QSV_i[9] = io_in_QSV_9_1;
    assign io_in_QSV_r[10] = io_in_QSV_10_0; assign io_in_QSV_i[10] = io_in_QSV_10_1;
    assign io_in_QSV_r[11] = io_in_QSV_11_0; assign io_in_QSV_i[11] = io_in_QSV_11_1;
    assign io_in_QSV_r[12] = io_in_QSV_12_0; assign io_in_QSV_i[12] = io_in_QSV_12_1;
    assign io_in_QSV_r[13] = io_in_QSV_13_0; assign io_in_QSV_i[13] = io_in_QSV_13_1;
    assign io_in_QSV_r[14] = io_in_QSV_14_0; assign io_in_QSV_i[14] = io_in_QSV_14_1;
    assign io_in_QSV_r[15] = io_in_QSV_15_0; assign io_in_QSV_i[15] = io_in_QSV_15_1;
    assign io_in_QSV_r[16] = io_in_QSV_16_0; assign io_in_QSV_i[16] = io_in_QSV_16_1;
    assign io_in_QSV_r[17] = io_in_QSV_17_0; assign io_in_QSV_i[17] = io_in_QSV_17_1;
    assign io_in_QSV_r[18] = io_in_QSV_18_0; assign io_in_QSV_i[18] = io_in_QSV_18_1;
    assign io_in_QSV_r[19] = io_in_QSV_19_0; assign io_in_QSV_i[19] = io_in_QSV_19_1;
    assign io_in_QSV_r[20] = io_in_QSV_20_0; assign io_in_QSV_i[20] = io_in_QSV_20_1;
    assign io_in_QSV_r[21] = io_in_QSV_21_0; assign io_in_QSV_i[21] = io_in_QSV_21_1;
    assign io_in_QSV_r[22] = io_in_QSV_22_0; assign io_in_QSV_i[22] = io_in_QSV_22_1;
    assign io_in_QSV_r[23] = io_in_QSV_23_0; assign io_in_QSV_i[23] = io_in_QSV_23_1;
    assign io_in_QSV_r[24] = io_in_QSV_24_0; assign io_in_QSV_i[24] = io_in_QSV_24_1;
    assign io_in_QSV_r[25] = io_in_QSV_25_0; assign io_in_QSV_i[25] = io_in_QSV_25_1;
    assign io_in_QSV_r[26] = io_in_QSV_26_0; assign io_in_QSV_i[26] = io_in_QSV_26_1;
    assign io_in_QSV_r[27] = io_in_QSV_27_0; assign io_in_QSV_i[27] = io_in_QSV_27_1;
    assign io_in_QSV_r[28] = io_in_QSV_28_0; assign io_in_QSV_i[28] = io_in_QSV_28_1;
    assign io_in_QSV_r[29] = io_in_QSV_29_0; assign io_in_QSV_i[29] = io_in_QSV_29_1;
    assign io_in_QSV_r[30] = io_in_QSV_30_0; assign io_in_QSV_i[30] = io_in_QSV_30_1;
    assign io_in_QSV_r[31] = io_in_QSV_31_0; assign io_in_QSV_i[31] = io_in_QSV_31_1;

    // Pipeline Stage 1: H(0)
    logic signed [7:0] qsv_s1_r [32];
    logic signed [7:0] qsv_s1_i [32];
    logic qsv_s1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 32; i++) begin
                qsv_s1_r[i] <= 8'sd0;
                qsv_s1_i[i] <= 8'sd0;
            end
            qsv_s1_valid <= 1'b0;
        end else begin
            qsv_s1_valid <= io_in_valid;
            if (io_in_valid) begin
                for (int k = 0; k < 16; k++) begin
                    hadamard(
                        io_in_QSV_r[2*k], io_in_QSV_i[2*k],
                        io_in_QSV_r[2*k+1], io_in_QSV_i[2*k+1],
                        qsv_s1_r[2*k], qsv_s1_i[2*k],
                        qsv_s1_r[2*k+1], qsv_s1_i[2*k+1]
                    );
                end
            end
        end
    end

    // Pipeline Stage 2: CX(0, 1) (Control: 0, Target: 1)
    logic signed [7:0] qsv_s2_r [32];
    logic signed [7:0] qsv_s2_i [32];
    logic qsv_s2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 32; i++) begin
                qsv_s2_r[i] <= 8'sd0;
                qsv_s2_i[i] <= 8'sd0;
            end
            qsv_s2_valid <= 1'b0;
        end else begin
            qsv_s2_valid <= qsv_s1_valid;
            if (qsv_s1_valid) begin
                for (int i = 0; i < 32; i++) begin
                    int src;
                    if ((i & 1) == 1) begin
                        src = i ^ 2;
                    end else begin
                        src = i;
                    end
                    qsv_s2_r[i] <= qsv_s1_r[src];
                    qsv_s2_i[i] <= qsv_s1_i[src];
                end
            end
        end
    end

    // Pipeline Stage 3: CX(1, 2) (Control: 1, Target: 2)
    logic signed [7:0] qsv_s3_r [32];
    logic signed [7:0] qsv_s3_i [32];
    logic qsv_s3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 32; i++) begin
                qsv_s3_r[i] <= 8'sd0;
                qsv_s3_i[i] <= 8'sd0;
            end
            qsv_s3_valid <= 1'b0;
        end else begin
            qsv_s3_valid <= qsv_s2_valid;
            if (qsv_s2_valid) begin
                for (int i = 0; i < 32; i++) begin
                    int src;
                    if ((i & 2) == 2) begin
                        src = i ^ 4;
                    end else begin
                        src = i;
                    end
                    qsv_s3_r[i] <= qsv_s2_r[src];
                    qsv_s3_i[i] <= qsv_s2_i[src];
                end
            end
        end
    end

    // Pipeline Stage 4: CX(2, 3) (Control: 2, Target: 3)
    logic signed [7:0] qsv_s4_r [32];
    logic signed [7:0] qsv_s4_i [32];
    logic qsv_s4_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 32; i++) begin
                qsv_s4_r[i] <= 8'sd0;
                qsv_s4_i[i] <= 8'sd0;
            end
            qsv_s4_valid <= 1'b0;
        end else begin
            qsv_s4_valid <= qsv_s3_valid;
            if (qsv_s3_valid) begin
                for (int i = 0; i < 32; i++) begin
                    int src;
                    if ((i & 4) == 4) begin
                        src = i ^ 8;
                    end else begin
                        src = i;
                    end
                    qsv_s4_r[i] <= qsv_s3_r[src];
                    qsv_s4_i[i] <= qsv_s3_i[src];
                end
            end
        end
    end

    // Pipeline Stage 5: CX(3, 4) (Control: 3, Target: 4)
    logic signed [7:0] qsv_s5_r [32];
    logic signed [7:0] qsv_s5_i [32];
    logic qsv_s5_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 32; i++) begin
                qsv_s5_r[i] <= 8'sd0;
                qsv_s5_i[i] <= 8'sd0;
            end
            qsv_s5_valid <= 1'b0;
        end else begin
            qsv_s5_valid <= qsv_s4_valid;
            if (qsv_s4_valid) begin
                for (int i = 0; i < 32; i++) begin
                    int src;
                    if ((i & 8) == 8) begin
                        src = i ^ 16;
                    end else begin
                        src = i;
                    end
                    qsv_s5_r[i] <= qsv_s4_r[src];
                    qsv_s5_i[i] <= qsv_s4_i[src];
                end
            end
        end
    end

    // Output assignments from Pipeline Stage 5
    assign io_out_QSV_0_0 = qsv_s5_r[0]; assign io_out_QSV_0_1 = qsv_s5_i[0];
    assign io_out_QSV_1_0 = qsv_s5_r[1]; assign io_out_QSV_1_1 = qsv_s5_i[1];
    assign io_out_QSV_2_0 = qsv_s5_r[2]; assign io_out_QSV_2_1 = qsv_s5_i[2];
    assign io_out_QSV_3_0 = qsv_s5_r[3]; assign io_out_QSV_3_1 = qsv_s5_i[3];
    assign io_out_QSV_4_0 = qsv_s5_r[4]; assign io_out_QSV_4_1 = qsv_s5_i[4];
    assign io_out_QSV_5_0 = qsv_s5_r[5]; assign io_out_QSV_5_1 = qsv_s5_i[5];
    assign io_out_QSV_6_0 = qsv_s5_r[6]; assign io_out_QSV_6_1 = qsv_s5_i[6];
    assign io_out_QSV_7_0 = qsv_s5_r[7]; assign io_out_QSV_7_1 = qsv_s5_i[7];
    assign io_out_QSV_8_0 = qsv_s5_r[8]; assign io_out_QSV_8_1 = qsv_s5_i[8];
    assign io_out_QSV_9_0 = qsv_s5_r[9]; assign io_out_QSV_9_1 = qsv_s5_i[9];
    assign io_out_QSV_10_0 = qsv_s5_r[10]; assign io_out_QSV_10_1 = qsv_s5_i[10];
    assign io_out_QSV_11_0 = qsv_s5_r[11]; assign io_out_QSV_11_1 = qsv_s5_i[11];
    assign io_out_QSV_12_0 = qsv_s5_r[12]; assign io_out_QSV_12_1 = qsv_s5_i[12];
    assign io_out_QSV_13_0 = qsv_s5_r[13]; assign io_out_QSV_13_1 = qsv_s5_i[13];
    assign io_out_QSV_14_0 = qsv_s5_r[14]; assign io_out_QSV_14_1 = qsv_s5_i[14];
    assign io_out_QSV_15_0 = qsv_s5_r[15]; assign io_out_QSV_15_1 = qsv_s5_i[15];
    assign io_out_QSV_16_0 = qsv_s5_r[16]; assign io_out_QSV_16_1 = qsv_s5_i[16];
    assign io_out_QSV_17_0 = qsv_s5_r[17]; assign io_out_QSV_17_1 = qsv_s5_i[17];
    assign io_out_QSV_18_0 = qsv_s5_r[18]; assign io_out_QSV_18_1 = qsv_s5_i[18];
    assign io_out_QSV_19_0 = qsv_s5_r[19]; assign io_out_QSV_19_1 = qsv_s5_i[19];
    assign io_out_QSV_20_0 = qsv_s5_r[20]; assign io_out_QSV_20_1 = qsv_s5_i[20];
    assign io_out_QSV_21_0 = qsv_s5_r[21]; assign io_out_QSV_21_1 = qsv_s5_i[21];
    assign io_out_QSV_22_0 = qsv_s5_r[22]; assign io_out_QSV_22_1 = qsv_s5_i[22];
    assign io_out_QSV_23_0 = qsv_s5_r[23]; assign io_out_QSV_23_1 = qsv_s5_i[23];
    assign io_out_QSV_24_0 = qsv_s5_r[24]; assign io_out_QSV_24_1 = qsv_s5_i[24];
    assign io_out_QSV_25_0 = qsv_s5_r[25]; assign io_out_QSV_25_1 = qsv_s5_i[25];
    assign io_out_QSV_26_0 = qsv_s5_r[26]; assign io_out_QSV_26_1 = qsv_s5_i[26];
    assign io_out_QSV_27_0 = qsv_s5_r[27]; assign io_out_QSV_27_1 = qsv_s5_i[27];
    assign io_out_QSV_28_0 = qsv_s5_r[28]; assign io_out_QSV_28_1 = qsv_s5_i[28];
    assign io_out_QSV_29_0 = qsv_s5_r[29]; assign io_out_QSV_29_1 = qsv_s5_i[29];
    assign io_out_QSV_30_0 = qsv_s5_r[30]; assign io_out_QSV_30_1 = qsv_s5_i[30];
    assign io_out_QSV_31_0 = qsv_s5_r[31]; assign io_out_QSV_31_1 = qsv_s5_i[31];

    assign io_out_valid = qsv_s5_valid;

endmodule
