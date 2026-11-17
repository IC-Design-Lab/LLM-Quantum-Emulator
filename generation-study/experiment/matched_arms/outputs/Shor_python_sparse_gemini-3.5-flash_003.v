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
    input  logic [7:0] io_out_QSV_20_1,
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

    function automatic logic signed [7:0] saturate(logic signed [19:0] val);
        if (val > 20'sd127) begin
            return 8'sd127;
        end else if (val < -20'sd128) begin
            return -8'sd128;
        end else begin
            return val[7:0];
        end
    endfunction

    // Stage 0: Input Registers
    logic signed [7:0] reg_s0_r[32];
    logic signed [7:0] reg_s0_i[32];
    logic reg_s0_val;

    always_ff @(posedge clock) begin
        if (reset) begin
            for (int k = 0; k < 32; k = k + 1) begin
                reg_s0_r[k] <= 8'sd0;
                reg_s0_i[k] <= 8'sd0;
            end
            reg_s0_val <= 1'b0;
        end else begin
            reg_s0_val <= io_in_valid;
            if (io_in_valid) begin
                reg_s0_r[0]  <= $signed(io_in_QSV_0_0);  reg_s0_i[0]  <= $signed(io_in_QSV_0_1);
                reg_s0_r[1]  <= $signed(io_in_QSV_1_0);  reg_s0_i[1]  <= $signed(io_in_QSV_1_1);
                reg_s0_r[2]  <= $signed(io_in_QSV_2_0);  reg_s0_i[2]  <= $signed(io_in_QSV_2_1);
                reg_s0_r[3]  <= $signed(io_in_QSV_3_0);  reg_s0_i[3]  <= $signed(io_in_QSV_3_1);
                reg_s0_r[4]  <= $signed(io_in_QSV_4_0);  reg_s0_i[4]  <= $signed(io_in_QSV_4_1);
                reg_s0_r[5]  <= $signed(io_in_QSV_5_0);  reg_s0_i[5]  <= $signed(io_in_QSV_5_1);
                reg_s0_r[6]  <= $signed(io_in_QSV_6_0);  reg_s0_i[6]  <= $signed(io_in_QSV_6_1);
                reg_s0_r[7]  <= $signed(io_in_QSV_7_0);  reg_s0_i[7]  <= $signed(io_in_QSV_7_1);
                reg_s0_r[8]  <= $signed(io_in_QSV_8_0);  reg_s0_i[8]  <= $signed(io_in_QSV_8_1);
                reg_s0_r[9]  <= $signed(io_in_QSV_9_0);  reg_s0_i[9]  <= $signed(io_in_QSV_9_1);
                reg_s0_r[10] <= $signed(io_in_QSV_10_0); reg_s0_i[10] <= $signed(io_in_QSV_10_1);
                reg_s0_r[11] <= $signed(io_in_QSV_11_0); reg_s0_i[11] <= $signed(io_in_QSV_11_1);
                reg_s0_r[12] <= $signed(io_in_QSV_12_0); reg_s0_i[12] <= $signed(io_in_QSV_12_1);
                reg_s0_r[13] <= $signed(io_in_QSV_13_0); reg_s0_i[13] <= $signed(io_in_QSV_13_1);
                reg_s0_r[14] <= $signed(io_in_QSV_14_0); reg_s0_i[14] <= $signed(io_in_QSV_14_1);
                reg_s0_r[15] <= $signed(io_in_QSV_15_0); reg_s0_i[15] <= $signed(io_in_QSV_15_1);
                reg_s0_r[16] <= $signed(io_in_QSV_16_0); reg_s0_i[16] <= $signed(io_in_QSV_16_1);
                reg_s0_r[17] <= $signed(io_in_QSV_17_0); reg_s0_i[17] <= $signed(io_in_QSV_17_1);
                reg_s0_r[18] <= $signed(io_in_QSV_18_0); reg_s0_i[18] <= $signed(io_in_QSV_18_1);
                reg_s0_r[19] <= $signed(io_in_QSV_19_0); reg_s0_i[19] <= $signed(io_in_QSV_19_1);
                reg_s0_r[20] <= $signed(io_in_QSV_20_0); reg_s0_i[20] <= $signed(io_in_QSV_20_1);
                reg_s0_r[21] <= $signed(io_in_QSV_21_0); reg_s0_i[21] <= $signed(io_in_QSV_21_1);
                reg_s0_r[22] <= $signed(io_in_QSV_22_0); reg_s0_i[22] <= $signed(io_in_QSV_22_1);
                reg_s0_r[23] <= $signed(io_in_QSV_23_0); reg_s0_i[23] <= $signed(io_in_QSV_23_1);
                reg_s0_r[24] <= $signed(io_in_QSV_24_0); reg_s0_i[24] <= $signed(io_in_QSV_24_1);
                reg_s0_r[25] <= $signed(io_in_QSV_25_0); reg_s0_i[25] <= $signed(io_in_QSV_25_1);
                reg_s0_r[26] <= $signed(io_in_QSV_26_0); reg_s0_i[26] <= $signed(io_in_QSV_26_1);
                reg_s0_r[27] <= $signed(io_in_QSV_27_0); reg_s0_i[27] <= $signed(io_in_QSV_27_1);
                reg_s0_r[28] <= $signed(io_in_QSV_28_0); reg_s0_i[28] <= $signed(io_in_QSV_28_1);
                reg_s0_r[29] <= $signed(io_in_QSV_29_0); reg_s0_i[29] <= $signed(io_in_QSV_29_1);
                reg_s0_r[30] <= $signed(io_in_QSV_30_0); reg_s0_i[30] <= $signed(io_in_QSV_30_1);
                reg_s0_r[31] <= $signed(io_in_QSV_31_0); reg_s0_i[31] <= $signed(io_in_QSV_31_1);
            end
        end
    end

    // Stage 1: H(0)
    logic signed [7:0] next_s1_r[32];
    logic signed [7:0] next_s1_i[32];

    generate
        for (genvar k = 0; k < 16; k = k + 1) begin : h0_gen
            localparam int idx0 = 2 * k;
            localparam int idx1 = 2 * k + 1;
            
            // Real part
            wire signed [9:0] sum_r = $signed(reg_s0_r[idx0]) + $signed(reg_s0_r[idx1]);
            wire signed [9:0] diff_r = $signed(reg_s0_r[idx0]) - $signed(reg_s0_r[idx1]);
            wire signed [19:0] prod_sum_r = sum_r * 10'sd181;
            wire signed [19:0] prod_diff_r = diff_r * 10'sd181;
            
            // Imag part
            wire signed [9:0] sum_i = $signed(reg_s0_i[idx0]) + $signed(reg_s0_i[idx1]);
            wire signed [9:0] diff_i = $signed(reg_s0_i[idx0]) - $signed(reg_s0_i[idx1]);
            wire signed [19:0] prod_sum_i = sum_i * 10'sd181;
            wire signed [19:0] prod_diff_i = diff_i * 10'sd181;
            
            assign next_s1_r[idx0] = saturate((prod_sum_r + 20'sd128) >>> 8);
            assign next_s1_r[idx1] = saturate((prod_diff_r + 20'sd128) >>> 8);
            assign next_s1_i[idx0] = saturate((prod_sum_i + 20'sd128) >>> 8);
            assign next_s1_i[idx1] = saturate((prod_diff_i + 20'sd128) >>> 8);
        end
    endgenerate

    logic signed [7:0] reg_s1_r[32];
    logic signed [7:0] reg_s1_i[32];
    logic reg_s1_val;

    always_ff @(posedge clock) begin
        if (reset) begin
            for (int k = 0; k < 32; k = k + 1) begin
                reg_s1_r[k] <= 8'sd0;
                reg_s1_i[k] <= 8'sd0;
            end
            reg_s1_val <= 1'b0;
        end else begin
            reg_s1_val <= reg_s0_val;
            if (reg_s0_val) begin
                reg_s1_r <= next_s1_r;
                reg_s1_i <= next_s1_i;
            end
        end
    end

    // Stage 2: CX(0, 1)
    logic signed [7:0] next_s2_r[32];
    logic signed [7:0] next_s2_i[32];

    generate
        for (genvar idx = 0; idx < 32; idx = idx + 1) begin : cx01_gen
            if ((idx & 1) == 1) begin
                localparam int idx_swap = idx ^ 2;
                assign next_s2_r[idx] = reg_s1_r[idx_swap];
                assign next_s2_i[idx] = reg_s1_i[idx_swap];
            end else begin
                assign next_s2_r[idx] = reg_s1_r[idx];
                assign next_s2_i[idx] = reg_s1_i[idx];
            end
        end
    endgenerate

    logic signed [7:0] reg_s2_r[32];
    logic signed [7:0] reg_s2_i[32];
    logic reg_s2_val;

    always_ff @(posedge clock) begin
        if (reset) begin
            for (int k = 0; k < 32; k = k + 1) begin
                reg_s2_r[k] <= 8'sd0;
                reg_s2_i[k] <= 8'sd0;
            end
            reg_s2_val <= 1'b0;
        end else begin
            reg_s2_val <= reg_s1_val;
            if (reg_s1_val) begin
                reg_s2_r <= next_s2_r;
                reg_s2_i <= next_s2_i;
            end
        end
    end

    // Stage 3: CX(1, 2)
    logic signed [7:0] next_s3_r[32];
    logic signed [7:0] next_s3_i[32];

    generate
        for (genvar idx = 0; idx < 32; idx = idx + 1) begin : cx12_gen
            if ((idx & 2) == 2) begin
                localparam int idx_swap = idx ^ 4;
                assign next_s3_r[idx] = reg_s2_r[idx_swap];
                assign next_s3_i[idx] = reg_s2_i[idx_swap];
            end else begin
                assign next_s3_r[idx] = reg_s2_r[idx];
                assign next_s3_i[idx] = reg_s2_i[idx];
            end
        end
    endgenerate

    logic signed [7:0] reg_s3_r[32];
    logic signed [7:0] reg_s3_i[32];
    logic reg_s3_val;

    always_ff @(posedge clock) begin
        if (reset) begin
            for (int k = 0; k < 32; k = k + 1) begin
                reg_s3_r[k] <= 8'sd0;
                reg_s3_i[k] <= 8'sd0;
            end
            reg_s3_val <= 1'b0;
        end else begin
            reg_s3_val <= reg_s2_val;
            if (reg_s2_val) begin
                reg_s3_r <= next_s3_r;
                reg_s3_i <= next_s3_i;
            end
        end
    end

    // Stage 4: CX(2, 3)
    logic signed [7:0] next_s4_r[32];
    logic signed [7:0] next_s4_i[32];

    generate
        for (genvar idx = 0; idx < 32; idx = idx + 1) begin : cx23_gen
            if ((idx & 4) == 4) begin
                localparam int idx_swap = idx ^ 8;
                assign next_s4_r[idx] = reg_s3_r[idx_swap];
                assign next_s4_i[idx] = reg_s3_i[idx_swap];
            end else begin
                assign next_s4_r[idx] = reg_s3_r[idx];
                assign next_s4_i[idx] = reg_s3_i[idx];
            end
        end
    endgenerate

    logic signed [7:0] reg_s4_r[32];
    logic signed [7:0] reg_s4_i[32];
    logic reg_s4_val;

    always_ff @(posedge clock) begin
        if (reset) begin
            for (int k = 0; k < 32; k = k + 1) begin
                reg_s4_r[k] <= 8'sd0;
                reg_s4_i[k] <= 8'sd0;
            end
            reg_s4_val <= 1'b0;
        end else begin
            reg_s4_val <= reg_s3_val;
            if (reg_s3_val) begin
                reg_s4_r <= next_s4_r;
                reg_s4_i <= next_s4_i;
            end
        end
    end

    // Stage 5: CX(3, 4)
    logic signed [7:0] next_s5_r[32];
    logic signed [7:0] next_s5_i[32];

    generate
        for (genvar idx = 0; idx < 32; idx = idx + 1) begin : cx34_gen
            if ((idx & 8) == 8) begin
                localparam int idx_swap = idx ^ 16;
                assign next_s5_r[idx] = reg_s4_r[idx_swap];
                assign next_s5_i[idx] = reg_s4_i[idx_swap];
            end else begin
                assign next_s5_r[idx] = reg_s4_r[idx];
                assign next_s5_i[idx] = reg_s4_i[idx];
            end
        end
    endgenerate

    logic signed [7:0] reg_s5_r[32];
    logic signed [7:0] reg_s5_i[32];
    logic reg_s5_val;

    always_ff @(posedge clock) begin
        if (reset) begin
            for (int k = 0; k < 32; k = k + 1) begin
                reg_s5_r[k] <= 8'sd0;
                reg_s5_i[k] <= 8'sd0;
            end
            reg_s5_val <= 1'b0;
        end else begin
            reg_s5_val <= reg_s4_val;
            if (reg_s4_val) begin
                reg_s5_r <= next_s5_r;
                reg_s5_i <= next_s5_i;
            end
        end
    end

    // Outputs
    assign io_out_QSV_0_0  = reg_s5_r[0];  assign io_out_QSV_0_1  = reg_s5_i[0];
    assign io_out_QSV_1_0  = reg_s5_r[1];  assign io_out_QSV_1_1  = reg_s5_i[1];
    assign io_out_QSV_2_0  = reg_s5_r[2];  assign io_out_QSV_2_1  = reg_s5_i[2];
    assign io_out_QSV_3_0  = reg_s5_r[3];  assign io_out_QSV_3_1  = reg_s5_i[3];
    assign io_out_QSV_4_0  = reg_s5_r[4];  assign io_out_QSV_4_1  = reg_s5_i[4];
    assign io_out_QSV_5_0  = reg_s5_r[5];  assign io_out_QSV_5_1  = reg_s5_i[5];
    assign io_out_QSV_6_0  = reg_s5_r[6];  assign io_out_QSV_6_1  = reg_s5_i[6];
    assign io_out_QSV_7_0  = reg_s5_r[7];  assign io_out_QSV_7_1  = reg_s5_i[7];
    assign io_out_QSV_8_0  = reg_s5_r[8];  assign io_out_QSV_8_1  = reg_s5_i[8];
    assign io_out_QSV_9_0  = reg_s5_r[9];  assign io_out_QSV_9_1  = reg_s5_i[9];
    assign io_out_QSV_10_0 = reg_s5_r[10]; assign io_out_QSV_10_1 = reg_s5_i[10];
    assign io_out_QSV_11_0 = reg_s5_r[11]; assign io_out_QSV_11_1 = reg_s5_i[11];
    assign io_out_QSV_12_0 = reg_s5_r[12]; assign io_out_QSV_12_1 = reg_s5_i[12];
    assign io_out_QSV_13_0 = reg_s5_r[13]; assign io_out_QSV_13_1 = reg_s5_i[13];
    assign io_out_QSV_14_0 = reg_s5_r[14]; assign io_out_QSV_14_1 = reg_s5_i[14];
    assign io_out_QSV_15_0 = reg_s5_r[15]; assign io_out_QSV_15_1 = reg_s5_i[15];
    assign io_out_QSV_16_0 = reg_s5_r[16]; assign io_out_QSV_16_1 = reg_s5_i[16];
    assign io_out_QSV_17_0 = reg_s5_r[17]; assign io_out_QSV_17_1 = reg_s5_i[17];
    assign io_out_QSV_18_0 = reg_s5_r[18]; assign io_out_QSV_18_1 = reg_s5_i[18];
    assign io_out_QSV_19_0 = reg_s5_r[19]; assign io_out_QSV_19_1 = reg_s5_i[19];
    assign io_out_QSV_20_0 = reg_s5_r[20]; assign io_out_QSV_20_1 = reg_s5_i[20];
    assign io_out_QSV_21_0 = reg_s5_r[21]; assign io_out_QSV_21_1 = reg_s5_i[21];
    assign io_out_QSV_22_0 = reg_s5_r[22]; assign io_out_QSV_22_1 = reg_s5_i[22];
    assign io_out_QSV_23_0 = reg_s5_r[23]; assign io_out_QSV_23_1 = reg_s5_i[23];
    assign io_out_QSV_24_0 = reg_s5_r[24]; assign io_out_QSV_24_1 = reg_s5_i[24];
    assign io_out_QSV_25_0 = reg_s5_r[25]; assign io_out_QSV_25_1 = reg_s5_i[25];
    assign io_out_QSV_26_0 = reg_s5_r[26]; assign io_out_QSV_26_1 = reg_s5_i[26];
    assign io_out_QSV_27_0 = reg_s5_r[27]; assign io_out_QSV_27_1 = reg_s5_i[27];
    assign io_out_QSV_28_0 = reg_s5_r[28]; assign io_out_QSV_28_1 = reg_s5_i[28];
    assign io_out_QSV_29_0 = reg_s5_r[29]; assign io_out_QSV_29_1 = reg_s5_i[29];
    assign io_out_QSV_30_0 = reg_s5_r[30]; assign io_out_QSV_30_1 = reg_s5_i[30];
    assign io_out_QSV_31_0 = reg_s5_r[31]; assign io_out_QSV_31_1 = reg_s5_i[31];
    assign io_out_valid    = reg_s5_val;

endmodule
