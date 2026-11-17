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

    typedef struct packed {
        logic signed [7:0] re;
        logic signed [7:0] im;
    } complex_t;

    // Helper functions for fixed-point arithmetic
    function automatic logic signed [7:0] saturate_and_shift(logic signed [16:0] val);
        logic signed [16:0] shifted;
        shifted = val >>> 8;
        if (shifted > 17'sd127)
            return 8'sd127;
        else if (shifted < -17'sd128)
            return -8'sd128;
        else
            return shifted[7:0];
    endfunction

    function automatic logic signed [7:0] h_sum(logic signed [7:0] a, logic signed [7:0] b);
        logic signed [8:0] sum;
        logic signed [16:0] prod;
        sum = $signed(a) + $signed(b);
        prod = sum * 9'sd181; // 181/256 ≈ 0.7071
        return saturate_and_shift(prod);
    endfunction

    function automatic logic signed [7:0] h_diff(logic signed [7:0] a, logic signed [7:0] b);
        logic signed [8:0] diff;
        logic signed [16:0] prod;
        diff = $signed(a) - $signed(b);
        prod = diff * 9'sd181; // 181/256 ≈ 0.7071
        return saturate_and_shift(prod);
    endfunction

    complex_t in_state[32];
    assign in_state[0].re = io_in_QSV_0_0;
    assign in_state[0].im = io_in_QSV_0_1;
    assign in_state[1].re = io_in_QSV_1_0;
    assign in_state[1].im = io_in_QSV_1_1;
    assign in_state[2].re = io_in_QSV_2_0;
    assign in_state[2].im = io_in_QSV_2_1;
    assign in_state[3].re = io_in_QSV_3_0;
    assign in_state[3].im = io_in_QSV_3_1;
    assign in_state[4].re = io_in_QSV_4_0;
    assign in_state[4].im = io_in_QSV_4_1;
    assign in_state[5].re = io_in_QSV_5_0;
    assign in_state[5].im = io_in_QSV_5_1;
    assign in_state[6].re = io_in_QSV_6_0;
    assign in_state[6].im = io_in_QSV_6_1;
    assign in_state[7].re = io_in_QSV_7_0;
    assign in_state[7].im = io_in_QSV_7_1;
    assign in_state[8].re = io_in_QSV_8_0;
    assign in_state[8].im = io_in_QSV_8_1;
    assign in_state[9].re = io_in_QSV_9_0;
    assign in_state[9].im = io_in_QSV_9_1;
    assign in_state[10].re = io_in_QSV_10_0;
    assign in_state[10].im = io_in_QSV_10_1;
    assign in_state[11].re = io_in_QSV_11_0;
    assign in_state[11].im = io_in_QSV_11_1;
    assign in_state[12].re = io_in_QSV_12_0;
    assign in_state[12].im = io_in_QSV_12_1;
    assign in_state[13].re = io_in_QSV_13_0;
    assign in_state[13].im = io_in_QSV_13_1;
    assign in_state[14].re = io_in_QSV_14_0;
    assign in_state[14].im = io_in_QSV_14_1;
    assign in_state[15].re = io_in_QSV_15_0;
    assign in_state[15].im = io_in_QSV_15_1;
    assign in_state[16].re = io_in_QSV_16_0;
    assign in_state[16].im = io_in_QSV_16_1;
    assign in_state[17].re = io_in_QSV_17_0;
    assign in_state[17].im = io_in_QSV_17_1;
    assign in_state[18].re = io_in_QSV_18_0;
    assign in_state[18].im = io_in_QSV_18_1;
    assign in_state[19].re = io_in_QSV_19_0;
    assign in_state[19].im = io_in_QSV_19_1;
    assign in_state[20].re = io_in_QSV_20_0;
    assign in_state[20].im = io_in_QSV_20_1;
    assign in_state[21].re = io_in_QSV_21_0;
    assign in_state[21].im = io_in_QSV_21_1;
    assign in_state[22].re = io_in_QSV_22_0;
    assign in_state[22].im = io_in_QSV_22_1;
    assign in_state[23].re = io_in_QSV_23_0;
    assign in_state[23].im = io_in_QSV_23_1;
    assign in_state[24].re = io_in_QSV_24_0;
    assign in_state[24].im = io_in_QSV_24_1;
    assign in_state[25].re = io_in_QSV_25_0;
    assign in_state[25].im = io_in_QSV_25_1;
    assign in_state[26].re = io_in_QSV_26_0;
    assign in_state[26].im = io_in_QSV_26_1;
    assign in_state[27].re = io_in_QSV_27_0;
    assign in_state[27].im = io_in_QSV_27_1;
    assign in_state[28].re = io_in_QSV_28_0;
    assign in_state[28].im = io_in_QSV_28_1;
    assign in_state[29].re = io_in_QSV_29_0;
    assign in_state[29].im = io_in_QSV_29_1;
    assign in_state[30].re = io_in_QSV_30_0;
    assign in_state[30].im = io_in_QSV_30_1;
    assign in_state[31].re = io_in_QSV_31_0;
    assign in_state[31].im = io_in_QSV_31_1;

    // Stage 0: Input Register
    complex_t r0[32];
    logic r0_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r0_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r0[i].re <= 8'sd0;
                r0[i].im <= 8'sd0;
            end
        end else begin
            r0_valid <= io_in_valid;
            if (io_in_valid) begin
                r0 <= in_state;
            end
        end
    end

    // Stage 1: H on Qubit 0
    complex_t next_r1[32];
    always_comb begin
        for (int k = 0; k < 16; k = k + 1) begin
            next_r1[2*k].re   = h_sum(r0[2*k].re, r0[2*k+1].re);
            next_r1[2*k].im   = h_sum(r0[2*k].im, r0[2*k+1].im);
            next_r1[2*k+1].re = h_diff(r0[2*k].re, r0[2*k+1].re);
            next_r1[2*k+1].im = h_diff(r0[2*k].im, r0[2*k+1].im);
        end
    end

    complex_t r1[32];
    logic r1_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r1_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r1[i].re <= 8'sd0;
                r1[i].im <= 8'sd0;
            end
        end else begin
            r1_valid <= r0_valid;
            if (r0_valid) begin
                r1 <= next_r1;
            end
        end
    end

    // Stage 2: CX with control 0, target 1
    complex_t next_r2[32];
    always_comb begin
        for (int idx = 0; idx < 32; idx = idx + 1) begin
            if (idx[0] == 1'b1) begin
                next_r2[idx] = r1[idx ^ 5'd2];
            end else begin
                next_r2[idx] = r1[idx];
            end
        end
    end

    complex_t r2[32];
    logic r2_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r2_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r2[i].re <= 8'sd0;
                r2[i].im <= 8'sd0;
            end
        end else begin
            r2_valid <= r1_valid;
            if (r1_valid) begin
                r2 <= next_r2;
            end
        end
    end

    // Stage 3: CX with control 1, target 2
    complex_t next_r3[32];
    always_comb begin
        for (int idx = 0; idx < 32; idx = idx + 1) begin
            if (idx[1] == 1'b1) begin
                next_r3[idx] = r2[idx ^ 5'd4];
            end else begin
                next_r3[idx] = r2[idx];
            end
        end
    end

    complex_t r3[32];
    logic r3_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r3_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r3[i].re <= 8'sd0;
                r3[i].im <= 8'sd0;
            end
        end else begin
            r3_valid <= r2_valid;
            if (r2_valid) begin
                r3 <= next_r3;
            end
        end
    end

    // Stage 4: CX with control 2, target 3
    complex_t next_r4[32];
    always_comb begin
        for (int idx = 0; idx < 32; idx = idx + 1) begin
            if (idx[2] == 1'b1) begin
                next_r4[idx] = r3[idx ^ 5'd8];
            end else begin
                next_r4[idx] = r3[idx];
            end
        end
    end

    complex_t r4[32];
    logic r4_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r4_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r4[i].re <= 8'sd0;
                r4[i].im <= 8'sd0;
            end
        end else begin
            r4_valid <= r3_valid;
            if (r3_valid) begin
                r4 <= next_r4;
            end
        end
    end

    // Stage 5: CX with control 3, target 4
    complex_t next_r5[32];
    always_comb begin
        for (int idx = 0; idx < 32; idx = idx + 1) begin
            if (idx[3] == 1'b1) begin
                next_r5[idx] = r4[idx ^ 5'd16];
            end else begin
                next_r5[idx] = r4[idx];
            end
        end
    end

    complex_t r5[32];
    logic r5_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r5_valid <= 1'b0;
            for (int i = 0; i < 32; i = i + 1) begin
                r5[i].re <= 8'sd0;
                r5[i].im <= 8'sd0;
            end
        end else begin
            r5_valid <= r4_valid;
            if (r4_valid) begin
                r5 <= next_r5;
            end
        end
    end

    // Output assignments
    assign io_out_valid = r5_valid;

    assign io_out_QSV_0_0 = r5[0].re;
    assign io_out_QSV_0_1 = r5[0].im;
    assign io_out_QSV_1_0 = r5[1].re;
    assign io_out_QSV_1_1 = r5[1].im;
    assign io_out_QSV_2_0 = r5[2].re;
    assign io_out_QSV_2_1 = r5[2].im;
    assign io_out_QSV_3_0 = r5[3].re;
    assign io_out_QSV_3_1 = r5[3].im;
    assign io_out_QSV_4_0 = r5[4].re;
    assign io_out_QSV_4_1 = r5[4].im;
    assign io_out_QSV_5_0 = r5[5].re;
    assign io_out_QSV_5_1 = r5[5].im;
    assign io_out_QSV_6_0 = r5[6].re;
    assign io_out_QSV_6_1 = r5[6].im;
    assign io_out_QSV_7_0 = r5[7].re;
    assign io_out_QSV_7_1 = r5[7].im;
    assign io_out_QSV_8_0 = r5[8].re;
    assign io_out_QSV_8_1 = r5[8].im;
    assign io_out_QSV_9_0 = r5[9].re;
    assign io_out_QSV_9_1 = r5[9].im;
    assign io_out_QSV_10_0 = r5[10].re;
    assign io_out_QSV_10_1 = r5[10].im;
    assign io_out_QSV_11_0 = r5[11].re;
    assign io_out_QSV_11_1 = r5[11].im;
    assign io_out_QSV_12_0 = r5[12].re;
    assign io_out_QSV_12_1 = r5[12].im;
    assign io_out_QSV_13_0 = r5[13].re;
    assign io_out_QSV_13_1 = r5[13].im;
    assign io_out_QSV_14_0 = r5[14].re;
    assign io_out_QSV_14_1 = r5[14].im;
    assign io_out_QSV_15_0 = r5[15].re;
    assign io_out_QSV_15_1 = r5[15].im;
    assign io_out_QSV_16_0 = r5[16].re;
    assign io_out_QSV_16_1 = r5[16].im;
    assign io_out_QSV_17_0 = r5[17].re;
    assign io_out_QSV_17_1 = r5[17].im;
    assign io_out_QSV_18_0 = r5[18].re;
    assign io_out_QSV_18_1 = r5[18].im;
    assign io_out_QSV_19_0 = r5[19].re;
    assign io_out_QSV_19_1 = r5[19].im;
    assign io_out_QSV_20_0 = r5[20].re;
    assign io_out_QSV_20_1 = r5[20].im;
    assign io_out_QSV_21_0 = r5[21].re;
    assign io_out_QSV_21_1 = r5[21].im;
    assign io_out_QSV_22_0 = r5[22].re;
    assign io_out_QSV_22_1 = r5[22].im;
    assign io_out_QSV_23_0 = r5[23].re;
    assign io_out_QSV_23_1 = r5[23].im;
    assign io_out_QSV_24_0 = r5[24].re;
    assign io_out_QSV_24_1 = r5[24].im;
    assign io_out_QSV_25_0 = r5[25].re;
    assign io_out_QSV_25_1 = r5[25].im;
    assign io_out_QSV_26_0 = r5[26].re;
    assign io_out_QSV_26_1 = r5[26].im;
    assign io_out_QSV_27_0 = r5[27].re;
    assign io_out_QSV_27_1 = r5[27].im;
    assign io_out_QSV_28_0 = r5[28].re;
    assign io_out_QSV_28_1 = r5[28].im;
    assign io_out_QSV_29_0 = r5[29].re;
    assign io_out_QSV_29_1 = r5[29].im;
    assign io_out_QSV_30_0 = r5[30].re;
    assign io_out_QSV_30_1 = r5[30].im;
    assign io_out_QSV_31_0 = r5[31].re;
    assign io_out_QSV_31_1 = r5[31].im;

endmodule
