module Shor (
    input  wire        clock,
    input  wire        reset,
    input  wire [7:0]  io_in_QSV_0_0,
    input  wire [7:0]  io_in_QSV_0_1,
    input  wire [7:0]  io_in_QSV_1_0,
    input  wire [7:0]  io_in_QSV_1_1,
    input  wire [7:0]  io_in_QSV_2_0,
    input  wire [7:0]  io_in_QSV_2_1,
    input  wire [7:0]  io_in_QSV_3_0,
    input  wire [7:0]  io_in_QSV_3_1,
    input  wire [7:0]  io_in_QSV_4_0,
    input  wire [7:0]  io_in_QSV_4_1,
    input  wire [7:0]  io_in_QSV_5_0,
    input  wire [7:0]  io_in_QSV_5_1,
    input  wire [7:0]  io_in_QSV_6_0,
    input  wire [7:0]  io_in_QSV_6_1,
    input  wire [7:0]  io_in_QSV_7_0,
    input  wire [7:0]  io_in_QSV_7_1,
    input  wire [7:0]  io_in_QSV_8_0,
    input  wire [7:0]  io_in_QSV_8_1,
    input  wire [7:0]  io_in_QSV_9_0,
    input  wire [7:0]  io_in_QSV_9_1,
    input  wire [7:0]  io_in_QSV_10_0,
    input  wire [7:0]  io_in_QSV_10_1,
    input  wire [7:0]  io_in_QSV_11_0,
    input  wire [7:0]  io_in_QSV_11_1,
    input  wire [7:0]  io_in_QSV_12_0,
    input  wire [7:0]  io_in_QSV_12_1,
    input  wire [7:0]  io_in_QSV_13_0,
    input  wire [7:0]  io_in_QSV_13_1,
    input  wire [7:0]  io_in_QSV_14_0,
    input  wire [7:0]  io_in_QSV_14_1,
    input  wire [7:0]  io_in_QSV_15_0,
    input  wire [7:0]  io_in_QSV_15_1,
    input  wire [7:0]  io_in_QSV_16_0,
    input  wire [7:0]  io_in_QSV_16_1,
    input  wire [7:0]  io_in_QSV_17_0,
    input  wire [7:0]  io_in_QSV_17_1,
    input  wire [7:0]  io_in_QSV_18_0,
    input  wire [7:0]  io_in_QSV_18_1,
    input  wire [7:0]  io_in_QSV_19_0,
    input  wire [7:0]  io_in_QSV_19_1,
    input  wire [7:0]  io_in_QSV_20_0,
    input  wire [7:0]  io_in_QSV_20_1,
    input  wire [7:0]  io_in_QSV_21_0,
    input  wire [7:0]  io_in_QSV_21_1,
    input  wire [7:0]  io_in_QSV_22_0,
    input  wire [7:0]  io_in_QSV_22_1,
    input  wire [7:0]  io_in_QSV_23_0,
    input  wire [7:0]  io_in_QSV_23_1,
    input  wire [7:0]  io_in_QSV_24_0,
    input  wire [7:0]  io_in_QSV_24_1,
    input  wire [7:0]  io_in_QSV_25_0,
    input  wire [7:0]  io_in_QSV_25_1,
    input  wire [7:0]  io_in_QSV_26_0,
    input  wire [7:0]  io_in_QSV_26_1,
    input  wire [7:0]  io_in_QSV_27_0,
    input  wire [7:0]  io_in_QSV_27_1,
    input  wire [7:0]  io_in_QSV_28_0,
    input  wire [7:0]  io_in_QSV_28_1,
    input  wire [7:0]  io_in_QSV_29_0,
    input  wire [7:0]  io_in_QSV_29_1,
    input  wire [7:0]  io_in_QSV_30_0,
    input  wire [7:0]  io_in_QSV_30_1,
    input  wire [7:0]  io_in_QSV_31_0,
    input  wire [7:0]  io_in_QSV_31_1,
    input  wire        io_in_valid,
    output wire        io_out_QSV_0_0,
    output wire        io_out_QSV_0_1,
    output wire        io_out_QSV_1_0,
    output wire        io_out_QSV_1_1,
    output wire        io_out_QSV_2_0,
    output wire        io_out_QSV_2_1,
    output wire        io_out_QSV_3_0,
    output wire        io_out_QSV_3_1,
    output wire        io_out_QSV_4_0,
    output wire        io_out_QSV_4_1,
    output wire        io_out_QSV_5_0,
    output wire        io_out_QSV_5_1,
    output wire        io_out_QSV_6_0,
    output wire        io_out_QSV_6_1,
    output wire        io_out_QSV_7_0,
    output wire        io_out_QSV_7_1,
    output wire        io_out_QSV_8_0,
    output wire        io_out_QSV_8_1,
    output wire        io_out_QSV_9_0,
    output wire        io_out_QSV_9_1,
    output wire        io_out_QSV_10_0,
    output wire        io_out_QSV_10_1,
    output wire        io_out_QSV_11_0,
    output wire        io_out_QSV_11_1,
    output wire        io_out_QSV_12_0,
    output wire        io_out_QSV_12_1,
    output wire        io_out_QSV_13_0,
    output wire        io_out_QSV_13_1,
    output wire        io_out_QSV_14_0,
    output wire        io_out_QSV_14_1,
    output wire        io_out_QSV_15_0,
    output wire        io_out_QSV_15_1,
    output wire        io_out_QSV_16_0,
    output wire        io_out_QSV_16_1,
    output wire        io_out_QSV_17_0,
    output wire        io_out_QSV_17_1,
    output wire        io_out_QSV_18_0,
    output wire        io_out_QSV_18_1,
    output wire        io_out_QSV_19_0,
    output wire        io_out_QSV_19_1,
    output wire        io_out_QSV_20_0,
    output wire        io_out_QSV_20_1,
    output wire        io_out_QSV_21_0,
    output wire        io_out_QSV_21_1,
    output wire        io_out_QSV_22_0,
    output wire        io_out_QSV_22_1,
    output wire        io_out_QSV_23_0,
    output wire        io_out_QSV_23_1,
    output wire        io_out_QSV_24_0,
    output wire        io_out_QSV_24_1,
    output wire        io_out_QSV_25_0,
    output wire        io_out_QSV_25_1,
    output wire        io_out_QSV_26_0,
    output wire        io_out_QSV_26_1,
    output wire        io_out_QSV_27_0,
    output wire        io_out_QSV_27_1,
    output wire        io_out_QSV_28_0,
    output wire        io_out_QSV_28_1,
    output wire        io_out_QSV_29_0,
    output wire        io_out_QSV_29_1,
    output wire        io_out_QSV_30_0,
    output wire        io_out_QSV_30_1,
    output wire        io_out_QSV_31_0,
    output wire        io_out_QSV_31_1,
    output wire        io_out_valid
);

    // --- Inputs Packing ---
    wire signed [7:0] in_real[32];
    wire signed [7:0] in_imag[32];

    assign in_real[0]  = $signed(io_in_QSV_0_0);   assign in_imag[0]  = $signed(io_in_QSV_0_1);
    assign in_real[1]  = $signed(io_in_QSV_1_0);   assign in_imag[1]  = $signed(io_in_QSV_1_1);
    assign in_real[2]  = $signed(io_in_QSV_2_0);   assign in_imag[2]  = $signed(io_in_QSV_2_1);
    assign in_real[3]  = $signed(io_in_QSV_3_0);   assign in_imag[3]  = $signed(io_in_QSV_3_1);
    assign in_real[4]  = $signed(io_in_QSV_4_0);   assign in_imag[4]  = $signed(io_in_QSV_4_1);
    assign in_real[5]  = $signed(io_in_QSV_5_0);   assign in_imag[5]  = $signed(io_in_QSV_5_1);
    assign in_real[6]  = $signed(io_in_QSV_6_0);   assign in_imag[6]  = $signed(io_in_QSV_6_1);
    assign in_real[7]  = $signed(io_in_QSV_7_0);   assign in_imag[7]  = $signed(io_in_QSV_7_1);
    assign in_real[8]  = $signed(io_in_QSV_8_0);   assign in_imag[8]  = $signed(io_in_QSV_8_1);
    assign in_real[9]  = $signed(io_in_QSV_9_0);   assign in_imag[9]  = $signed(io_in_QSV_9_1);
    assign in_real[10] = $signed(io_in_QSV_10_0);  assign in_imag[10] = $signed(io_in_QSV_10_1);
    assign in_real[11] = $signed(io_in_QSV_11_0);  assign in_imag[11] = $signed(io_in_QSV_11_1);
    assign in_real[12] = $signed(io_in_QSV_12_0);  assign in_imag[12] = $signed(io_in_QSV_12_1);
    assign in_real[13] = $signed(io_in_QSV_13_0);  assign in_imag[13] = $signed(io_in_QSV_13_1);
    assign in_real[14] = $signed(io_in_QSV_14_0);  assign in_imag[14] = $signed(io_in_QSV_14_1);
    assign in_real[15] = $signed(io_in_QSV_15_0);  assign in_imag[15] = $signed(io_in_QSV_15_1);
    assign in_real[16] = $signed(io_in_QSV_16_0);  assign in_imag[16] = $signed(io_in_QSV_16_1);
    assign in_real[17] = $signed(io_in_QSV_17_0);  assign in_imag[17] = $signed(io_in_QSV_17_1);
    assign in_real[18] = $signed(io_in_QSV_18_0);  assign in_imag[18] = $signed(io_in_QSV_18_1);
    assign in_real[19] = $signed(io_in_QSV_19_0);  assign in_imag[19] = $signed(io_in_QSV_19_1);
    assign in_real[20] = $signed(io_in_QSV_20_0);  assign in_imag[20] = $signed(io_in_QSV_20_1);
    assign in_real[21] = $signed(io_in_QSV_21_0);  assign in_imag[21] = $signed(io_in_QSV_21_1);
    assign in_real[22] = $signed(io_in_QSV_22_0);  assign in_imag[22] = $signed(io_in_QSV_22_1);
    assign in_real[23] = $signed(io_in_QSV_23_0);  assign in_imag[23] = $signed(io_in_QSV_23_1);
    assign in_real[24] = $signed(io_in_QSV_24_0);  assign in_imag[24] = $signed(io_in_QSV_24_1);
    assign in_real[25] = $signed(io_in_QSV_25_0);  assign in_imag[25] = $signed(io_in_QSV_25_1);
    assign in_real[26] = $signed(io_in_QSV_26_0);  assign in_imag[26] = $signed(io_in_QSV_26_1);
    assign in_real[27] = $signed(io_in_QSV_27_0);  assign in_imag[27] = $signed(io_in_QSV_27_1);
    assign in_real[28] = $signed(io_in_QSV_28_0);  assign in_imag[28] = $signed(io_in_QSV_28_1);
    assign in_real[29] = $signed(io_in_QSV_29_0);  assign in_imag[29] = $signed(io_in_QSV_29_1);
    assign in_real[30] = $signed(io_in_QSV_30_0);  assign in_imag[30] = $signed(io_in_QSV_30_1);
    assign in_real[31] = $signed(io_in_QSV_31_0);  assign in_imag[31] = $signed(io_in_QSV_31_1);

    // --- Step 0: Hadamard on Q0 ---
    wire signed [7:0] h_out_real[32];
    wire signed [7:0] h_out_imag[32];

    generate
        for (genvar k = 0; k < 16; k = k + 1) begin : gen_h_q0
            wire signed [8:0] sum_r  = in_real[2*k] + in_real[2*k+1];
            wire signed [8:0] diff_r = in_real[2*k] - in_real[2*k+1];
            wire signed [8:0] sum_i  = in_imag[2*k] + in_imag[2*k+1];
            wire signed [8:0] diff_i = in_imag[2*k] - in_imag[2*k+1];

            wire signed [16:0] prod_sum_r  = sum_r * 8'sd90;
            wire signed [16:0] prod_diff_r = diff_r * 8'sd90;
            wire signed [16:0] prod_sum_i  = sum_i * 8'sd90;
            wire signed [16:0] prod_diff_i = diff_i * 8'sd90;

            assign h_out_real[2*k]   = prod_sum_r[14:7];
            assign h_out_imag[2*k]   = prod_sum_i[14:7];
            assign h_out_real[2*k+1] = prod_diff_r[14:7];
            assign h_out_imag[2*k+1] = prod_diff_i[14:7];
        end
    endgenerate

    // Pipeline Stage 1 Registers
    reg signed [7:0] r1_real[32];
    reg signed [7:0] r1_imag[32];
    reg r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r1_real[i] <= 8'sd0;
                r1_imag[i] <= 8'sd0;
            end
        end else begin
            r1_valid <= io_in_valid;
            for (int i = 0; i < 32; i = i + 1) begin
                r1_real[i] <= h_out_real[i];
                r1_imag[i] <= h_out_imag[i];
            end
        end
    end

    // --- Step 1: CX on 0 -> 1 ---
    wire signed [7:0] cx01_out_real[32];
    wire signed [7:0] cx01_out_imag[32];

    generate
        for (genvar i = 0; i < 32; i = i + 1) begin : gen_cx_0_1
            assign cx01_out_real[i] = (i[0] == 1'b1) ? r1_real[i ^ 2] : r1_real[i];
            assign cx01_out_imag[i] = (i[0] == 1'b1) ? r1_imag[i ^ 2] : r1_imag[i];
        end
    endgenerate

    // Pipeline Stage 2 Registers
    reg signed [7:0] r2_real[32];
    reg signed [7:0] r2_imag[32];
    reg r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r2_real[i] <= 8'sd0;
                r2_imag[i] <= 8'sd0;
            end
        end else begin
            r2_valid <= r1_valid;
            for (int i = 0; i < 32; i = i + 1) begin
                r2_real[i] <= cx01_out_real[i];
                r2_imag[i] <= cx01_out_imag[i];
            end
        end
    end

    // --- Step 2: CX on 1 -> 2 ---
    wire signed [7:0] cx12_out_real[32];
    wire signed [7:0] cx12_out_imag[32];

    generate
        for (genvar i = 0; i < 32; i = i + 1) begin : gen_cx_1_2
            assign cx12_out_real[i] = (i[1] == 1'b1) ? r2_real[i ^ 4] : r2_real[i];
            assign cx12_out_imag[i] = (i[1] == 1'b1) ? r2_imag[i ^ 4] : r2_imag[i];
        end
    endgenerate

    // Pipeline Stage 3 Registers
    reg signed [7:0] r3_real[32];
    reg signed [7:0] r3_imag[32];
    reg r3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r3_real[i] <= 8'sd0;
                r3_imag[i] <= 8'sd0;
            end
        end else begin
            r3_valid <= r2_valid;
            for (int i = 0; i < 32; i = i + 1) begin
                r3_real[i] <= cx12_out_real[i];
                r3_imag[i] <= cx12_out_imag[i];
            end
        end
    end

    // --- Step 3: CX on 2 -> 3 ---
    wire signed [7:0] cx23_out_real[32];
    wire signed [7:0] cx23_out_imag[32];

    generate
        for (genvar i = 0; i < 32; i = i + 1) begin : gen_cx_2_3
            assign cx23_out_real[i] = (i[2] == 1'b1) ? r3_real[i ^ 8] : r3_real[i];
            assign cx23_out_imag[i] = (i[2] == 1'b1) ? r3_imag[i ^ 8] : r3_imag[i];
        end
    endgenerate

    // Pipeline Stage 4 Registers
    reg signed [7:0] r4_real[32];
    reg signed [7:0] r4_imag[32];
    reg r4_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r4_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r4_real[i] <= 8'sd0;
                r4_imag[i] <= 8'sd0;
            end
        end else begin
            r4_valid <= r3_valid;
            for (int i = 0; i < 32; i = i + 1) begin
                r4_real[i] <= cx23_out_real[i];
                r4_imag[i] <= cx23_out_imag[i];
            end
        end
    end

    // --- Step 4: CX on 3 -> 4 ---
    wire signed [7:0] cx34_out_real[32];
    wire signed [7:0] cx34_out_imag[32];

    generate
        for (genvar i = 0; i < 32; i = i + 1) begin : gen_cx_3_4
            assign cx34_out_real[i] = (i[3] == 1'b1) ? r4_real[i ^ 16] : r4_real[i];
            assign cx34_out_imag[i] = (i[3] == 1'b1) ? r4_imag[i ^ 16] : r4_imag[i];
        end
    endgenerate

    // Pipeline Stage 5 Registers (Output Registers)
    reg signed [7:0] r5_real[32];
    reg signed [7:0] r5_imag[32];
    reg r5_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r5_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r5_real[i] <= 8'sd0;
                r5_imag[i] <= 8'sd0;
            end
        end else begin
            r5_valid <= r4_valid;
            for (int i = 0; i < 32; i = i + 1) begin
                r5_real[i] <= cx34_out_real[i];
                r5_imag[i] <= cx34_out_imag[i];
            end
        end
    end

    // --- Outputs Unpacking ---
    assign io_out_valid = r5_valid;
    assign io_out_QSV_0_0 = r5_real[0];   assign io_out_QSV_0_1 = r5_imag[0];
    assign io_out_QSV_1_0 = r5_real[1];   assign io_out_QSV_1_1 = r5_imag[1];
    assign io_out_QSV_2_0 = r5_real[2];   assign io_out_QSV_2_1 = r5_imag[2];
    assign io_out_QSV_3_0 = r5_real[3];   assign io_out_QSV_3_1 = r5_imag[3];
    assign io_out_QSV_4_0 = r5_real[4];   assign io_out_QSV_4_1 = r5_imag[4];
    assign io_out_QSV_5_0 = r5_real[5];   assign io_out_QSV_5_1 = r5_imag[5];
    assign io_out_QSV_6_0 = r5_real[6];   assign io_out_QSV_6_1 = r5_imag[6];
    assign io_out_QSV_7_0 = r5_real[7];   assign io_out_QSV_7_1 = r5_imag[7];
    assign io_out_QSV_8_0 = r5_real[8];   assign io_out_QSV_8_1 = r5_imag[8];
    assign io_out_QSV_9_0 = r5_real[9];   assign io_out_QSV_9_1 = r5_imag[9];
    assign io_out_QSV_10_0 = r5_real[10]; assign io_out_QSV_10_1 = r5_imag[10];
    assign io_out_QSV_11_0 = r5_real[11]; assign io_out_QSV_11_1 = r5_imag[11];
    assign io_out_QSV_12_0 = r5_real[12]; assign io_out_QSV_12_1 = r5_imag[12];
    assign io_out_QSV_13_0 = r5_real[13]; assign io_out_QSV_13_1 = r5_imag[13];
    assign io_out_QSV_14_0 = r5_real[14]; assign io_out_QSV_14_1 = r5_imag[14];
    assign io_out_QSV_15_0 = r5_real[15]; assign io_out_QSV_15_1 = r5_imag[15];
    assign io_out_QSV_16_0 = r5_real[16]; assign io_out_QSV_16_1 = r5_imag[16];
    assign io_out_QSV_17_0 = r5_real[17]; assign io_out_QSV_17_1 = r5_imag[17];
    assign io_out_QSV_18_0 = r5_real[18]; assign io_out_QSV_18_1 = r5_imag[18];
    assign io_out_QSV_19_0 = r5_real[19]; assign io_out_QSV_19_1 = r5_imag[19];
    assign io_out_QSV_20_0 = r5_real[20]; assign io_out_QSV_20_1 = r5_imag[20];
    assign io_out_QSV_21_0 = r5_real[21]; assign io_out_QSV_21_1 = r5_imag[21];
    assign io_out_QSV_22_0 = r5_real[22]; assign io_out_QSV_22_1 = r5_imag[22];
    assign io_out_QSV_23_0 = r5_real[23]; assign io_out_QSV_23_1 = r5_imag[23];
    assign io_out_QSV_24_0 = r5_real[24]; assign io_out_QSV_24_1 = r5_imag[24];
    assign io_out_QSV_25_0 = r5_real[25]; assign io_out_QSV_25_1 = r5_imag[25];
    assign io_out_QSV_26_0 = r5_real[26]; assign io_out_QSV_26_1 = r5_imag[26];
    assign io_out_QSV_27_0 = r5_real[27]; assign io_out_QSV_27_1 = r5_imag[27];
    assign io_out_QSV_28_0 = r5_real[28]; assign io_out_QSV_28_1 = r5_imag[28];
    assign io_out_QSV_29_0 = r5_real[29]; assign io_out_QSV_29_1 = r5_imag[29];
    assign io_out_QSV_30_0 = r5_real[30]; assign io_out_QSV_30_1 = r5_imag[30];
    assign io_out_QSV_31_0 = r5_real[31]; assign io_out_QSV_31_1 = r5_imag[31];

endmodule
