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

    // Internal state vector registers for pipelined stages
    logic signed [7:0] r0_real[32];
    logic signed [7:0] r0_imag[32];
    logic r0_valid;

    logic signed [7:0] r1_real[32];
    logic signed [7:0] r1_imag[32];
    logic r1_valid;

    logic signed [7:0] r2_real[32];
    logic signed [7:0] r2_imag[32];
    logic r2_valid;

    logic signed [7:0] r3_real[32];
    logic signed [7:0] r3_imag[32];
    logic r3_valid;

    logic signed [7:0] r4_real[32];
    logic signed [7:0] r4_imag[32];
    logic r4_valid;

    logic signed [7:0] r5_real[32];
    logic signed [7:0] r5_imag[32];
    logic r5_valid;

    // Stage 0: Register inputs
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r0_real[i] <= 8'sd0;
                r0_imag[i] <= 8'sd0;
            end
        end else begin
            r0_valid <= io_in_valid;
            if (io_in_valid) begin
                r0_real[0]  <= $signed(io_in_QSV_0_0);
                r0_imag[0]  <= $signed(io_in_QSV_0_1);
                r0_real[1]  <= $signed(io_in_QSV_1_0);
                r0_imag[1]  <= $signed(io_in_QSV_1_1);
                r0_real[2]  <= $signed(io_in_QSV_2_0);
                r0_imag[2]  <= $signed(io_in_QSV_2_1);
                r0_real[3]  <= $signed(io_in_QSV_3_0);
                r0_imag[3]  <= $signed(io_in_QSV_3_1);
                r0_real[4]  <= $signed(io_in_QSV_4_0);
                r0_imag[4]  <= $signed(io_in_QSV_4_1);
                r0_real[5]  <= $signed(io_in_QSV_5_0);
                r0_imag[5]  <= $signed(io_in_QSV_5_1);
                r0_real[6]  <= $signed(io_in_QSV_6_0);
                r0_imag[6]  <= $signed(io_in_QSV_6_1);
                r0_real[7]  <= $signed(io_in_QSV_7_0);
                r0_imag[7]  <= $signed(io_in_QSV_7_1);
                r0_real[8]  <= $signed(io_in_QSV_8_0);
                r0_imag[8]  <= $signed(io_in_QSV_8_1);
                r0_real[9]  <= $signed(io_in_QSV_9_0);
                r0_imag[9]  <= $signed(io_in_QSV_9_1);
                r0_real[10] <= $signed(io_in_QSV_10_0);
                r0_imag[10] <= $signed(io_in_QSV_10_1);
                r0_real[11] <= $signed(io_in_QSV_11_0);
                r0_imag[11] <= $signed(io_in_QSV_11_1);
                r0_real[12] <= $signed(io_in_QSV_12_0);
                r0_imag[12] <= $signed(io_in_QSV_12_1);
                r0_real[13] <= $signed(io_in_QSV_13_0);
                r0_imag[13] <= $signed(io_in_QSV_13_1);
                r0_real[14] <= $signed(io_in_QSV_14_0);
                r0_imag[14] <= $signed(io_in_QSV_14_1);
                r0_real[15] <= $signed(io_in_QSV_15_0);
                r0_imag[15] <= $signed(io_in_QSV_15_1);
                r0_real[16] <= $signed(io_in_QSV_16_0);
                r0_imag[16] <= $signed(io_in_QSV_16_1);
                r0_real[17] <= $signed(io_in_QSV_17_0);
                r0_imag[17] <= $signed(io_in_QSV_17_1);
                r0_real[18] <= $signed(io_in_QSV_18_0);
                r0_imag[18] <= $signed(io_in_QSV_18_1);
                r0_real[19] <= $signed(io_in_QSV_19_0);
                r0_imag[19] <= $signed(io_in_QSV_19_1);
                r0_real[20] <= $signed(io_in_QSV_20_0);
                r0_imag[20] <= $signed(io_in_QSV_20_1);
                r0_real[21] <= $signed(io_in_QSV_21_0);
                r0_imag[21] <= $signed(io_in_QSV_21_1);
                r0_real[22] <= $signed(io_in_QSV_22_0);
                r0_imag[22] <= $signed(io_in_QSV_22_1);
                r0_real[23] <= $signed(io_in_QSV_23_0);
                r0_imag[23] <= $signed(io_in_QSV_23_1);
                r0_real[24] <= $signed(io_in_QSV_24_0);
                r0_imag[24] <= $signed(io_in_QSV_24_1);
                r0_real[25] <= $signed(io_in_QSV_25_0);
                r0_imag[25] <= $signed(io_in_QSV_25_1);
                r0_real[26] <= $signed(io_in_QSV_26_0);
                r0_imag[26] <= $signed(io_in_QSV_26_1);
                r0_real[27] <= $signed(io_in_QSV_27_0);
                r0_imag[27] <= $signed(io_in_QSV_27_1);
                r0_real[28] <= $signed(io_in_QSV_28_0);
                r0_imag[28] <= $signed(io_in_QSV_28_1);
                r0_real[29] <= $signed(io_in_QSV_29_0);
                r0_imag[29] <= $signed(io_in_QSV_29_1);
                r0_real[30] <= $signed(io_in_QSV_30_0);
                r0_imag[30] <= $signed(io_in_QSV_30_1);
                r0_real[31] <= $signed(io_in_QSV_31_0);
                r0_imag[31] <= $signed(io_in_QSV_31_1);
            end
        end
    end

    // Stage 1: Hadamard on Qubit 0
    logic signed [7:0] h_in_real[32];
    logic signed [7:0] h_in_imag[32];
    logic signed [7:0] h_out_real[32];
    logic signed [7:0] h_out_imag[32];

    assign h_in_real = r0_real;
    assign h_in_imag = r0_imag;

    always_comb begin
        for (int k = 0; k < 16; k = k + 1) begin
            automatic int idx0 = 2 * k;
            automatic int idx1 = 2 * k + 1;
            
            automatic logic signed [8:0] sum_r = h_in_real[idx0] + h_in_real[idx1];
            automatic logic signed [8:0] diff_r = h_in_real[idx0] - h_in_real[idx1];
            automatic logic signed [18:0] prod_sum_r = sum_r * 19'sd181;
            automatic logic signed [18:0] prod_diff_r = diff_r * 19'sd181;
            automatic logic signed [10:0] shifted_sum_r = prod_sum_r >>> 8;
            automatic logic signed [10:0] shifted_diff_r = prod_diff_r >>> 8;
            
            h_out_real[idx0] = (shifted_sum_r > 11'sd127) ? 8'sd127 :
                               (shifted_sum_r < -11'sd128) ? -8'sd128 :
                               shifted_sum_r[7:0];
            h_out_real[idx1] = (shifted_diff_r > 11'sd127) ? 8'sd127 :
                               (shifted_diff_r < -11'sd128) ? -8'sd128 :
                               shifted_diff_r[7:0];
                               
            automatic logic signed [8:0] sum_i = h_in_imag[idx0] + h_in_imag[idx1];
            automatic logic signed [8:0] diff_i = h_in_imag[idx0] - h_in_imag[idx1];
            automatic logic signed [18:0] prod_sum_i = sum_i * 19'sd181;
            automatic logic signed [18:0] prod_diff_i = diff_i * 19'sd181;
            automatic logic signed [10:0] shifted_sum_i = prod_sum_i >>> 8;
            automatic logic signed [10:0] shifted_diff_i = prod_diff_i >>> 8;
            
            h_out_imag[idx0] = (shifted_sum_i > 11'sd127) ? 8'sd127 :
                               (shifted_sum_i < -11'sd128) ? -8'sd128 :
                               shifted_sum_i[7:0];
            h_out_imag[idx1] = (shifted_diff_i > 11'sd127) ? 8'sd127 :
                               (shifted_diff_i < -11'sd128) ? -8'sd128 :
                               shifted_diff_i[7:0];
        end
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r1_real[i] <= 8'sd0;
                r1_imag[i] <= 8'sd0;
            end
        end else begin
            r1_valid <= r0_valid;
            if (r0_valid) begin
                r1_real <= h_out_real;
                r1_imag <= h_out_imag;
            end
        end
    end

    // Stage 2: CX on control=0, target=1
    logic signed [7:0] cx1_in_real[32];
    logic signed [7:0] cx1_in_imag[32];
    logic signed [7:0] cx1_out_real[32];
    logic signed [7:0] cx1_out_imag[32];

    assign cx1_in_real = r1_real;
    assign cx1_in_imag = r1_imag;

    always_comb begin
        for (int i = 0; i < 32; i = i + 1) begin
            cx1_out_real[i] = cx1_in_real[i];
            cx1_out_imag[i] = cx1_in_imag[i];
        end
        for (int k = 0; k < 8; k = k + 1) begin
            automatic int idx0 = {k[2:0], 2'b01}; // target b1=0, control b0=1
            automatic int idx1 = {k[2:0], 2'b11}; // target b1=1, control b0=1
            
            cx1_out_real[idx0] = cx1_in_real[idx1];
            cx1_out_imag[idx0] = cx1_in_imag[idx1];
            
            cx1_out_real[idx1] = cx1_in_real[idx0];
            cx1_out_imag[idx1] = cx1_in_imag[idx0];
        end
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r2_real[i] <= 8'sd0;
                r2_imag[i] <= 8'sd0;
            end
        end else begin
            r2_valid <= r1_valid;
            if (r1_valid) begin
                r2_real <= cx1_out_real;
                r2_imag <= cx1_out_imag;
            end
        end
    end

    // Stage 3: CX on control=1, target=2
    logic signed [7:0] cx2_in_real[32];
    logic signed [7:0] cx2_in_imag[32];
    logic signed [7:0] cx2_out_real[32];
    logic signed [7:0] cx2_out_imag[32];

    assign cx2_in_real = r2_real;
    assign cx2_in_imag = r2_imag;

    always_comb begin
        for (int i = 0; i < 32; i = i + 1) begin
            cx2_out_real[i] = cx2_in_real[i];
            cx2_out_imag[i] = cx2_in_imag[i];
        end
        for (int k = 0; k < 8; k = k + 1) begin
            automatic bit b0 = k[0];
            automatic bit [1:0] b43 = k[2:1];
            automatic int idx0 = {b43, 1'b0, 1'b1, b0}; // target b2=0, control b1=1
            automatic int idx1 = {b43, 1'b1, 1'b1, b0}; // target b2=1, control b1=1
            
            cx2_out_real[idx0] = cx2_in_real[idx1];
            cx2_out_imag[idx0] = cx2_in_imag[idx1];
            
            cx2_out_real[idx1] = cx2_in_real[idx0];
            cx2_out_imag[idx1] = cx2_in_imag[idx0];
        end
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r3_real[i] <= 8'sd0;
                r3_imag[i] <= 8'sd0;
            end
        end else begin
            r3_valid <= r2_valid;
            if (r2_valid) begin
                r3_real <= cx2_out_real;
                r3_imag <= cx2_out_imag;
            end
        end
    end

    // Stage 4: CX on control=2, target=3
    logic signed [7:0] cx3_in_real[32];
    logic signed [7:0] cx3_in_imag[32];
    logic signed [7:0] cx3_out_real[32];
    logic signed [7:0] cx3_out_imag[32];

    assign cx3_in_real = r3_real;
    assign cx3_in_imag = r3_imag;

    always_comb begin
        for (int i = 0; i < 32; i = i + 1) begin
            cx3_out_real[i] = cx3_in_real[i];
            cx3_out_imag[i] = cx3_in_imag[i];
        end
        for (int k = 0; k < 8; k = k + 1) begin
            automatic bit [1:0] b10 = k[1:0];
            automatic bit b4 = k[2];
            automatic int idx0 = {b4, 1'b0, 1'b1, b10}; // target b3=0, control b2=1
            automatic int idx1 = {b4, 1'b1, 1'b1, b10}; // target b3=1, control b2=1
            
            cx3_out_real[idx0] = cx3_in_real[idx1];
            cx3_out_imag[idx0] = cx3_in_imag[idx1];
            
            cx3_out_real[idx1] = cx3_in_real[idx0];
            cx3_out_imag[idx1] = cx3_in_imag[idx0];
        end
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r4_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r4_real[i] <= 8'sd0;
                r4_imag[i] <= 8'sd0;
            end
        end else begin
            r4_valid <= r3_valid;
            if (r3_valid) begin
                r4_real <= cx3_out_real;
                r4_imag <= cx3_out_imag;
            end
        end
    end

    // Stage 5: CX on control=3, target=4
    logic signed [7:0] cx4_in_real[32];
    logic signed [7:0] cx4_in_imag[32];
    logic signed [7:0] cx4_out_real[32];
    logic signed [7:0] cx4_out_imag[32];

    assign cx4_in_real = r4_real;
    assign cx4_in_imag = r4_imag;

    always_comb begin
        for (int i = 0; i < 32; i = i + 1) begin
            cx4_out_real[i] = cx4_in_real[i];
            cx4_out_imag[i] = cx4_in_imag[i];
        end
        for (int k = 0; k < 8; k = k + 1) begin
            automatic bit [2:0] b210 = k[2:0];
            automatic int idx0 = {1'b0, 1'b1, b210}; // target b4=0, control b3=1
            automatic int idx1 = {1'b1, 1'b1, b210}; // target b4=1, control b3=1
            
            cx4_out_real[idx0] = cx4_in_real[idx1];
            cx4_out_imag[idx0] = cx4_in_imag[idx1];
            
            cx4_out_real[idx1] = cx4_in_real[idx0];
            cx4_out_imag[idx1] = cx4_in_imag[idx0];
        end
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r5_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r5_real[i] <= 8'sd0;
                r5_imag[i] <= 8'sd0;
            end
        end else begin
            r5_valid <= r4_valid;
            if (r4_valid) begin
                r5_real <= cx4_out_real;
                r5_imag <= cx4_out_imag;
            end
        end
    end

    // Outputs assignment
    assign io_out_valid = r5_valid;
    
    assign io_out_QSV_0_0 = r5_real[0];
    assign io_out_QSV_0_1 = r5_imag[0];
    assign io_out_QSV_1_0 = r5_real[1];
    assign io_out_QSV_1_1 = r5_imag[1];
    assign io_out_QSV_2_0 = r5_real[2];
    assign io_out_QSV_2_1 = r5_imag[2];
    assign io_out_QSV_3_0 = r5_real[3];
    assign io_out_QSV_3_1 = r5_imag[3];
    assign io_out_QSV_4_0 = r5_real[4];
    assign io_out_QSV_4_1 = r5_imag[4];
    assign io_out_QSV_5_0 = r5_real[5];
    assign io_out_QSV_5_1 = r5_imag[5];
    assign io_out_QSV_6_0 = r5_real[6];
    assign io_out_QSV_6_1 = r5_imag[6];
    assign io_out_QSV_7_0 = r5_real[7];
    assign io_out_QSV_7_1 = r5_imag[7];
    assign io_out_QSV_8_0 = r5_real[8];
    assign io_out_QSV_8_1 = r5_imag[8];
    assign io_out_QSV_9_0 = r5_real[9];
    assign io_out_QSV_9_1 = r5_imag[9];
    assign io_out_QSV_10_0 = r5_real[10];
    assign io_out_QSV_10_1 = r5_imag[10];
    assign io_out_QSV_11_0 = r5_real[11];
    assign io_out_QSV_11_1 = r5_imag[11];
    assign io_out_QSV_12_0 = r5_real[12];
    assign io_out_QSV_12_1 = r5_imag[12];
    assign io_out_QSV_13_0 = r5_real[13];
    assign io_out_QSV_13_1 = r5_imag[13];
    assign io_out_QSV_14_0 = r5_real[14];
    assign io_out_QSV_14_1 = r5_imag[14];
    assign io_out_QSV_15_0 = r5_real[15];
    assign io_out_QSV_15_1 = r5_imag[15];
    assign io_out_QSV_16_0 = r5_real[16];
    assign io_out_QSV_16_1 = r5_imag[16];
    assign io_out_QSV_17_0 = r5_real[17];
    assign io_out_QSV_17_1 = r5_imag[17];
    assign io_out_QSV_18_0 = r5_real[18];
    assign io_out_QSV_18_1 = r5_imag[18];
    assign io_out_QSV_19_0 = r5_real[19];
    assign io_out_QSV_19_1 = r5_imag[19];
    assign io_out_QSV_20_0 = r5_real[20];
    assign io_out_QSV_20_1 = r5_imag[20];
    assign io_out_QSV_21_0 = r5_real[21];
    assign io_out_QSV_21_1 = r5_imag[21];
    assign io_out_QSV_22_0 = r5_real[22];
    assign io_out_QSV_22_1 = r5_imag[22];
    assign io_out_QSV_23_0 = r5_real[23];
    assign io_out_QSV_23_1 = r5_imag[23];
    assign io_out_QSV_24_0 = r5_real[24];
    assign io_out_QSV_24_1 = r5_imag[24];
    assign io_out_QSV_25_0 = r5_real[25];
    assign io_out_QSV_25_1 = r5_imag[25];
    assign io_out_QSV_26_0 = r5_real[26];
    assign io_out_QSV_26_1 = r5_imag[26];
    assign io_out_QSV_27_0 = r5_real[27];
    assign io_out_QSV_27_1 = r5_imag[27];
    assign io_out_QSV_28_0 = r5_real[28];
    assign io_out_QSV_28_1 = r5_imag[28];
    assign io_out_QSV_29_0 = r5_real[29];
    assign io_out_QSV_29_1 = r5_imag[29];
    assign io_out_QSV_30_0 = r5_real[30];
    assign io_out_QSV_30_1 = r5_imag[30];
    assign io_out_QSV_31_0 = r5_real[31];
    assign io_out_QSV_31_1 = r5_imag[31];

endmodule
