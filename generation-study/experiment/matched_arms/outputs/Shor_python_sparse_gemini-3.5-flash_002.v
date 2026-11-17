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

    // Scaling function for Hadamard
    function automatic logic signed [7:0] scale_H (
        input logic signed [7:0] a,
        input logic signed [7:0] b,
        input logic sub
    );
        logic signed [8:0] sum;
        logic signed [16:0] mult;
        logic signed [8:0] rounded;
        sum = sub ? ($signed(a) - $signed(b)) : ($signed(a) + $signed(b));
        mult = sum * 91;
        rounded = (mult + 64) >>> 7;
        if (rounded > 127) return 127;
        else if (rounded < -128) return -128;
        else return rounded[7:0];
    endfunction

    // Stage 0: Input Registers
    logic signed [7:0] r_in_R[32];
    logic signed [7:0] r_in_I[32];
    logic r_in_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r_in_valid <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                r_in_R[i] <= 8'sd0;
                r_in_I[i] <= 8'sd0;
            end
        end else begin
            r_in_valid <= io_in_valid;
            r_in_R[0] <= $signed(io_in_QSV_0_0); r_in_I[0] <= $signed(io_in_QSV_0_1);
            r_in_R[1] <= $signed(io_in_QSV_1_0); r_in_I[1] <= $signed(io_in_QSV_1_1);
            r_in_R[2] <= $signed(io_in_QSV_2_0); r_in_I[2] <= $signed(io_in_QSV_2_1);
            r_in_R[3] <= $signed(io_in_QSV_3_0); r_in_I[3] <= $signed(io_in_QSV_3_1);
            r_in_R[4] <= $signed(io_in_QSV_4_0); r_in_I[4] <= $signed(io_in_QSV_4_1);
            r_in_R[5] <= $signed(io_in_QSV_5_0); r_in_I[5] <= $signed(io_in_QSV_5_1);
            r_in_R[6] <= $signed(io_in_QSV_6_0); r_in_I[6] <= $signed(io_in_QSV_6_1);
            r_in_R[7] <= $signed(io_in_QSV_7_0); r_in_I[7] <= $signed(io_in_QSV_7_1);
            r_in_R[8] <= $signed(io_in_QSV_8_0); r_in_I[8] <= $signed(io_in_QSV_8_1);
            r_in_R[9] <= $signed(io_in_QSV_9_0); r_in_I[9] <= $signed(io_in_QSV_9_1);
            r_in_R[10] <= $signed(io_in_QSV_10_0); r_in_I[10] <= $signed(io_in_QSV_10_1);
            r_in_R[11] <= $signed(io_in_QSV_11_0); r_in_I[11] <= $signed(io_in_QSV_11_1);
            r_in_R[12] <= $signed(io_in_QSV_12_0); r_in_I[12] <= $signed(io_in_QSV_12_1);
            r_in_R[13] <= $signed(io_in_QSV_13_0); r_in_I[13] <= $signed(io_in_QSV_13_1);
            r_in_R[14] <= $signed(io_in_QSV_14_0); r_in_I[14] <= $signed(io_in_QSV_14_1);
            r_in_R[15] <= $signed(io_in_QSV_15_0); r_in_I[15] <= $signed(io_in_QSV_15_1);
            r_in_R[16] <= $signed(io_in_QSV_16_0); r_in_I[16] <= $signed(io_in_QSV_16_1);
            r_in_R[17] <= $signed(io_in_QSV_17_0); r_in_I[17] <= $signed(io_in_QSV_17_1);
            r_in_R[18] <= $signed(io_in_QSV_18_0); r_in_I[18] <= $signed(io_in_QSV_18_1);
            r_in_R[19] <= $signed(io_in_QSV_19_0); r_in_I[19] <= $signed(io_in_QSV_19_1);
            r_in_R[20] <= $signed(io_in_QSV_20_0); r_in_I[20] <= $signed(io_in_QSV_20_1);
            r_in_R[21] <= $signed(io_in_QSV_21_0); r_in_I[21] <= $signed(io_in_QSV_21_1);
            r_in_R[22] <= $signed(io_in_QSV_22_0); r_in_I[22] <= $signed(io_in_QSV_22_1);
            r_in_R[23] <= $signed(io_in_QSV_23_0); r_in_I[23] <= $signed(io_in_QSV_23_1);
            r_in_R[24] <= $signed(io_in_QSV_24_0); r_in_I[24] <= $signed(io_in_QSV_24_1);
            r_in_R[25] <= $signed(io_in_QSV_25_0); r_in_I[25] <= $signed(io_in_QSV_25_1);
            r_in_R[26] <= $signed(io_in_QSV_26_0); r_in_I[26] <= $signed(io_in_QSV_26_1);
            r_in_R[27] <= $signed(io_in_QSV_27_0); r_in_I[27] <= $signed(io_in_QSV_27_1);
            r_in_R[28] <= $signed(io_in_QSV_28_0); r_in_I[28] <= $signed(io_in_QSV_28_1);
            r_in_R[29] <= $signed(io_in_QSV_29_0); r_in_I[29] <= $signed(io_in_QSV_29_1);
            r_in_R[30] <= $signed(io_in_QSV_30_0); r_in_I[30] <= $signed(io_in_QSV_30_1);
            r_in_R[31] <= $signed(io_in_QSV_31_0); r_in_I[31] <= $signed(io_in_QSV_31_1);
        end
    end

    // Stage 1: Hadamard on Qubit 0 (H(0))
    logic signed [7:0] r_S1_R[32];
    logic signed [7:0] r_S1_I[32];
    logic r_S1_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r_S1_valid <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                r_S1_R[i] <= 8'sd0;
                r_S1_I[i] <= 8'sd0;
            end
        end else begin
            r_S1_valid <= r_in_valid;
            for (int k = 0; k < 16; k++) begin
                r_S1_R[2*k]   <= scale_H(r_in_R[2*k], r_in_R[2*k+1], 1'b0);
                r_S1_I[2*k]   <= scale_H(r_in_I[2*k], r_in_I[2*k+1], 1'b0);
                r_S1_R[2*k+1] <= scale_H(r_in_R[2*k], r_in_R[2*k+1], 1'b1);
                r_S1_I[2*k+1] <= scale_H(r_in_I[2*k], r_in_I[2*k+1], 1'b1);
            end
        end
    end

    // Stage 2: CX(0, 1) (Control=0, Target=1)
    // Swap index j and j^2 if j[0] == 1.
    logic signed [7:0] r_S2_R[32];
    logic signed [7:0] r_S2_I[32];
    logic r_S2_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r_S2_valid <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                r_S2_R[i] <= 8'sd0;
                r_S2_I[i] <= 8'sd0;
            end
        end else begin
            r_S2_valid <= r_S1_valid;
            for (int k = 0; k < 8; k++) begin
                r_S2_R[4*k + 0] <= r_S1_R[4*k + 0];
                r_S2_I[4*k + 0] <= r_S1_I[4*k + 0];

                r_S2_R[4*k + 1] <= r_S1_R[4*k + 3];
                r_S2_I[4*k + 1] <= r_S1_I[4*k + 3];

                r_S2_R[4*k + 2] <= r_S1_R[4*k + 2];
                r_S2_I[4*k + 2] <= r_S1_I[4*k + 2];

                r_S2_R[4*k + 3] <= r_S1_R[4*k + 1];
                r_S2_I[4*k + 3] <= r_S1_I[4*k + 1];
            end
        end
    end

    // Stage 3: CX(1, 2) (Control=1, Target=2)
    // Swap index j and j^4 if j[1] == 1.
    logic signed [7:0] r_S3_R[32];
    logic signed [7:0] r_S3_I[32];
    logic r_S3_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r_S3_valid <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                r_S3_R[i] <= 8'sd0;
                r_S3_I[i] <= 8'sd0;
            end
        end else begin
            r_S3_valid <= r_S2_valid;
            for (int k = 0; k < 4; k++) begin
                r_S3_R[8*k + 0] <= r_S2_R[8*k + 0];
                r_S3_I[8*k + 0] <= r_S2_I[8*k + 0];

                r_S3_R[8*k + 1] <= r_S2_R[8*k + 1];
                r_S3_I[8*k + 1] <= r_S2_I[8*k + 1];

                r_S3_R[8*k + 2] <= r_S2_R[8*k + 6];
                r_S3_I[8*k + 2] <= r_S2_I[8*k + 6];

                r_S3_R[8*k + 3] <= r_S2_R[8*k + 7];
                r_S3_I[8*k + 3] <= r_S2_I[8*k + 7];

                r_S3_R[8*k + 4] <= r_S2_R[8*k + 4];
                r_S3_I[8*k + 4] <= r_S2_I[8*k + 4];

                r_S3_R[8*k + 5] <= r_S2_R[8*k + 5];
                r_S3_I[8*k + 5] <= r_S2_I[8*k + 5];

                r_S3_R[8*k + 6] <= r_S2_R[8*k + 2];
                r_S3_I[8*k + 6] <= r_S2_I[8*k + 2];

                r_S3_R[8*k + 7] <= r_S2_R[8*k + 3];
                r_S3_I[8*k + 7] <= r_S2_I[8*k + 3];
            end
        end
    end

    // Stage 4: CX(2, 3) (Control=2, Target=3)
    // Swap index j and j^8 if j[2] == 1.
    logic signed [7:0] r_S4_R[32];
    logic signed [7:0] r_S4_I[32];
    logic r_S4_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r_S4_valid <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                r_S4_R[i] <= 8'sd0;
                r_S4_I[i] <= 8'sd0;
            end
        end else begin
            r_S4_valid <= r_S3_valid;
            for (int k = 0; k < 2; k++) begin
                // m in [0, 3]
                for (int m = 0; m < 4; m++) begin
                    r_S4_R[16*k + m] <= r_S3_R[16*k + m];
                    r_S4_I[16*k + m] <= r_S3_I[16*k + m];
                end
                // m in [4, 7] (swap with m+8)
                for (int m = 4; m < 8; m++) begin
                    r_S4_R[16*k + m] <= r_S3_R[16*k + m + 8];
                    r_S4_I[16*k + m] <= r_S3_I[16*k + m + 8];
                end
                // m in [8, 11]
                for (int m = 8; m < 12; m++) begin
                    r_S4_R[16*k + m] <= r_S3_R[16*k + m];
                    r_S4_I[16*k + m] <= r_S3_I[16*k + m];
                end
                // m in [12, 15] (swap with m-8)
                for (int m = 12; m < 16; m++) begin
                    r_S4_R[16*k + m] <= r_S3_R[16*k + m - 8];
                    r_S4_I[16*k + m] <= r_S3_I[16*k + m - 8];
                end
            end
        end
    end

    // Stage 5: CX(3, 4) (Control=3, Target=4)
    // Swap index j and j^16 if j[3] == 1.
    logic signed [7:0] r_S5_R[32];
    logic signed [7:0] r_S5_I[32];
    logic r_S5_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r_S5_valid <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                r_S5_R[i] <= 8'sd0;
                r_S5_I[i] <= 8'sd0;
            end
        end else begin
            r_S5_valid <= r_S4_valid;
            // m in [0, 7]
            for (int m = 0; m < 8; m++) begin
                r_S5_R[m] <= r_S4_R[m];
                r_S5_I[m] <= r_S4_I[m];
            end
            // m in [8, 15] (swap with m+16)
            for (int m = 8; m < 16; m++) begin
                r_S5_R[m] <= r_S4_R[m + 16];
                r_S5_I[m] <= r_S4_I[m + 16];
            end
            // m in [16, 23]
            for (int m = 16; m < 24; m++) begin
                r_S5_R[m] <= r_S4_R[m];
                r_S5_I[m] <= r_S4_I[m];
            end
            // m in [24, 31] (swap with m-16)
            for (int m = 24; m < 32; m++) begin
                r_S5_R[m] <= r_S4_R[m - 16];
                r_S5_I[m] <= r_S4_I[m - 16];
            end
        end
    end

    // Output assignments
    assign io_out_valid = r_S5_valid;

    assign io_out_QSV_0_0 = logic'(r_S5_R[0]); assign io_out_QSV_0_1 = logic'(r_S5_I[0]);
    assign io_out_QSV_1_0 = logic'(r_S5_R[1]); assign io_out_QSV_1_1 = logic'(r_S5_I[1]);
    assign io_out_QSV_2_0 = logic'(r_S5_R[2]); assign io_out_QSV_2_1 = logic'(r_S5_I[2]);
    assign io_out_QSV_3_0 = logic'(r_S5_R[3]); assign io_out_QSV_3_1 = logic'(r_S5_I[3]);
    assign io_out_QSV_4_0 = logic'(r_S5_R[4]); assign io_out_QSV_4_1 = logic'(r_S5_I[4]);
    assign io_out_QSV_5_0 = logic'(r_S5_R[5]); assign io_out_QSV_5_1 = logic'(r_S5_I[5]);
    assign io_out_QSV_6_0 = logic'(r_S5_R[6]); assign io_out_QSV_6_1 = logic'(r_S5_I[6]);
    assign io_out_QSV_7_0 = logic'(r_S5_R[7]); assign io_out_QSV_7_1 = logic'(r_S5_I[7]);
    assign io_out_QSV_8_0 = logic'(r_S5_R[8]); assign io_out_QSV_8_1 = logic'(r_S5_I[8]);
    assign io_out_QSV_9_0 = logic'(r_S5_R[9]); assign io_out_QSV_9_1 = logic'(r_S5_I[9]);
    assign io_out_QSV_10_0 = logic'(r_S5_R[10]); assign io_out_QSV_10_1 = logic'(r_S5_I[10]);
    assign io_out_QSV_11_0 = logic'(r_S5_R[11]); assign io_out_QSV_11_1 = logic'(r_S5_I[11]);
    assign io_out_QSV_12_0 = logic'(r_S5_R[12]); assign io_out_QSV_12_1 = logic'(r_S5_I[12]);
    assign io_out_QSV_13_0 = logic'(r_S5_R[13]); assign io_out_QSV_13_1 = logic'(r_S5_I[13]);
    assign io_out_QSV_14_0 = logic'(r_S5_R[14]); assign io_out_QSV_14_1 = logic'(r_S5_I[14]);
    assign io_out_QSV_15_0 = logic'(r_S5_R[15]); assign io_out_QSV_15_1 = logic'(r_S5_I[15]);
    assign io_out_QSV_16_0 = logic'(r_S5_R[16]); assign io_out_QSV_16_1 = logic'(r_S5_I[16]);
    assign io_out_QSV_17_0 = logic'(r_S5_R[17]); assign io_out_QSV_17_1 = logic'(r_S5_I[17]);
    assign io_out_QSV_18_0 = logic'(r_S5_R[18]); assign io_out_QSV_18_1 = logic'(r_S5_I[18]);
    assign io_out_QSV_19_0 = logic'(r_S5_R[19]); assign io_out_QSV_19_1 = logic'(r_S5_I[19]);
    assign io_out_QSV_20_0 = logic'(r_S5_R[20]); assign io_out_QSV_20_1 = logic'(r_S5_I[20]);
    assign io_out_QSV_21_0 = logic'(r_S5_R[21]); assign io_out_QSV_21_1 = logic'(r_S5_I[21]);
    assign io_out_QSV_22_0 = logic'(r_S5_R[22]); assign io_out_QSV_22_1 = logic'(r_S5_I[22]);
    assign io_out_QSV_23_0 = logic'(r_S5_R[23]); assign io_out_QSV_23_1 = logic'(r_S5_I[23]);
    assign io_out_QSV_24_0 = logic'(r_S5_R[24]); assign io_out_QSV_24_1 = logic'(r_S5_I[24]);
    assign io_out_QSV_25_0 = logic'(r_S5_R[25]); assign io_out_QSV_25_1 = logic'(r_S5_I[25]);
    assign io_out_QSV_26_0 = logic'(r_S5_R[26]); assign io_out_QSV_26_1 = logic'(r_S5_I[26]);
    assign io_out_QSV_27_0 = logic'(r_S5_R[27]); assign io_out_QSV_27_1 = logic'(r_S5_I[27]);
    assign io_out_QSV_28_0 = logic'(r_S5_R[28]); assign io_out_QSV_28_1 = logic'(r_S5_I[28]);
    assign io_out_QSV_29_0 = logic'(r_S5_R[29]); assign io_out_QSV_29_1 = logic'(r_S5_I[29]);
    assign io_out_QSV_30_0 = logic'(r_S5_R[30]); assign io_out_QSV_30_1 = logic'(r_S5_I[30]);
    assign io_out_QSV_31_0 = logic'(r_S5_R[31]); assign io_out_QSV_31_1 = logic'(r_S5_I[31]);

endmodule
