module QFT (
    input  logic clock,
    input  logic reset,
    input  logic signed [7:0] io_in_QSV_0_0,
    input  logic signed [7:0] io_in_QSV_0_1,
    input  logic signed [7:0] io_in_QSV_1_0,
    input  logic signed [7:0] io_in_QSV_1_1,
    input  logic signed [7:0] io_in_QSV_2_0,
    input  logic signed [7:0] io_in_QSV_2_1,
    input  logic signed [7:0] io_in_QSV_3_0,
    input  logic signed [7:0] io_in_QSV_3_1,
    input  logic signed [7:0] io_in_QSV_4_0,
    input  logic signed [7:0] io_in_QSV_4_1,
    input  logic signed [7:0] io_in_QSV_5_0,
    input  logic signed [7:0] io_in_QSV_5_1,
    input  logic signed [7:0] io_in_QSV_6_0,
    input  logic signed [7:0] io_in_QSV_6_1,
    input  logic signed [7:0] io_in_QSV_7_0,
    input  logic signed [7:0] io_in_QSV_7_1,
    input  logic io_in_valid,
    output logic signed [7:0] io_out_QSV_0_0,
    output logic signed [7:0] io_out_QSV_0_1,
    output logic signed [7:0] io_out_QSV_1_0,
    output logic signed [7:0] io_out_QSV_1_1,
    output logic signed [7:0] io_out_QSV_2_0,
    output logic signed [7:0] io_out_QSV_2_1,
    output logic signed [7:0] io_out_QSV_3_0,
    output logic signed [7:0] io_out_QSV_3_1,
    output logic signed [7:0] io_out_QSV_4_0,
    output logic signed [7:0] io_out_QSV_4_1,
    output logic signed [7:0] io_out_QSV_5_0,
    output logic signed [7:0] io_out_QSV_5_1,
    output logic signed [7:0] io_out_QSV_6_0,
    output logic signed [7:0] io_out_QSV_6_1,
    output logic signed [7:0] io_out_QSV_7_0,
    output logic signed [7:0] io_out_QSV_7_1,
    output logic io_out_valid
);

    // --- Helper Functions for Signed Saturating Fixed-Point Arithmetic ---
    function automatic logic signed [7:0] sat(logic signed [16:0] val);
        logic signed [9:0] shifted;
        shifted = val >>> 7;
        if (shifted > 10'sd127) begin
            return 8'sd127;
        end else if (shifted < -10'sd128) begin
            return -8'sd128;
        end else begin
            return shifted[7:0];
        end
    endfunction

    function automatic logic signed [7:0] sat_sub_mul(logic signed [7:0] x, logic signed [7:0] y);
        logic signed [8:0] diff;
        logic signed [16:0] prod;
        diff = x - y;
        prod = diff * 8'sd91; // 91 / 128 ≈ 0.70711 (1/sqrt(2))
        return sat(prod);
    endfunction

    function automatic logic signed [7:0] sat_add_mul(logic signed [7:0] x, logic signed [7:0] y);
        logic signed [8:0] sum;
        logic signed [16:0] prod;
        sum = x + y;
        prod = sum * 8'sd91; // 91 / 128 ≈ 0.70711 (1/sqrt(2))
        return sat(prod);
    endfunction

    // --- Pipeline Registers ---

    // Stage 0: Input Registers
    logic signed [7:0] r_st0 [8];
    logic signed [7:0] i_st0 [8];
    logic v_st0;

    // Stage 1: H(0)
    logic signed [7:0] r_st1 [8];
    logic signed [7:0] i_st1 [8];
    logic v_st1;

    // Stage 2: CS(1, 0)
    logic signed [7:0] r_st2 [8];
    logic signed [7:0] i_st2 [8];
    logic v_st2;

    // Stage 3: CP(pi/4, 2, 0)
    logic signed [7:0] r_st3 [8];
    logic signed [7:0] i_st3 [8];
    logic v_st3;

    // Stage 4: H(1)
    logic signed [7:0] r_st4 [8];
    logic signed [7:0] i_st4 [8];
    logic v_st4;

    // Stage 5: CS(2, 1)
    logic signed [7:0] r_st5 [8];
    logic signed [7:0] i_st5 [8];
    logic v_st5;

    // Stage 6: H(2)
    logic signed [7:0] r_st6 [8];
    logic signed [7:0] i_st6 [8];
    logic v_st6;

    // --- Sequential Logic Blocks ---

    // Stage 0: Registers for inputs
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                r_st0[i] <= 8'sd0;
                i_st0[i] <= 8'sd0;
            end
            v_st0 <= 1'b0;
        end else begin
            r_st0[0] <= io_in_QSV_0_0;
            i_st0[0] <= io_in_QSV_0_1;
            r_st0[1] <= io_in_QSV_1_0;
            i_st0[1] <= io_in_QSV_1_1;
            r_st0[2] <= io_in_QSV_2_0;
            i_st0[2] <= io_in_QSV_2_1;
            r_st0[3] <= io_in_QSV_3_0;
            i_st0[3] <= io_in_QSV_3_1;
            r_st0[4] <= io_in_QSV_4_0;
            i_st0[4] <= io_in_QSV_4_1;
            r_st0[5] <= io_in_QSV_5_0;
            i_st0[5] <= io_in_QSV_5_1;
            r_st0[6] <= io_in_QSV_6_0;
            i_st0[6] <= io_in_QSV_6_1;
            r_st0[7] <= io_in_QSV_7_0;
            i_st0[7] <= io_in_QSV_7_1;
            v_st0    <= io_in_valid;
        end
    end

    // Stage 1: H(0) on LSB. Pairs: (0,1), (2,3), (4,5), (6,7)
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                r_st1[i] <= 8'sd0;
                i_st1[i] <= 8'sd0;
            end
            v_st1 <= 1'b0;
        end else begin
            for (int k = 0; k < 4; k++) begin
                r_st1[2*k]   <= sat_add_mul(r_st0[2*k], r_st0[2*k+1]);
                r_st1[2*k+1] <= sat_sub_mul(r_st0[2*k], r_st0[2*k+1]);
                i_st1[2*k]   <= sat_add_mul(i_st0[2*k], i_st0[2*k+1]);
                i_st1[2*k+1] <= sat_sub_mul(i_st0[2*k], i_st0[2*k+1]);
            end
            v_st1 <= v_st0;
        end
    end

    // Stage 2: CS(1, 0). Phase gate of i on states 3 (011) and 7 (111).
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                r_st2[i] <= 8'sd0;
                i_st2[i] <= 8'sd0;
            end
            v_st2 <= 1'b0;
        end else begin
            for (int i = 0; i < 8; i++) begin
                if (i == 3 || i == 7) begin
                    r_st2[i] <= (i_st1[i] == -128) ? 8'sd127 : -i_st1[i];
                    i_st2[i] <= r_st1[i];
                end else begin
                    r_st2[i] <= r_st1[i];
                    i_st2[i] <= i_st1[i];
                end
            end
            v_st2 <= v_st1;
        end
    end

    // Stage 3: CP(pi/4, 2, 0). Phase gate of exp(i*pi/4) on states 5 (101) and 7 (111).
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                r_st3[i] <= 8'sd0;
                i_st3[i] <= 8'sd0;
            end
            v_st3 <= 1'b0;
        end else begin
            for (int i = 0; i < 8; i++) begin
                if (i == 5 || i == 7) begin
                    r_st3[i] <= sat_sub_mul(r_st2[i], i_st2[i]);
                    i_st3[i] <= sat_add_mul(r_st2[i], i_st2[i]);
                end else begin
                    r_st3[i] <= r_st2[i];
                    i_st3[i] <= i_st2[i];
                end
            end
            v_st3 <= v_st2;
        end
    end

    // Stage 4: H(1) on bit 1. Pairs: (0,2), (1,3), (4,6), (5,7)
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                r_st4[i] <= 8'sd0;
                i_st4[i] <= 8'sd0;
            end
            v_st4 <= 1'b0;
        end else begin
            r_st4[0] <= sat_add_mul(r_st3[0], r_st3[2]);
            r_st4[2] <= sat_sub_mul(r_st3[0], r_st3[2]);
            i_st4[0] <= sat_add_mul(i_st3[0], i_st3[2]);
            i_st4[2] <= sat_sub_mul(i_st3[0], i_st3[2]);

            r_st4[1] <= sat_add_mul(r_st3[1], r_st3[3]);
            r_st4[3] <= sat_sub_mul(r_st3[1], r_st3[3]);
            i_st4[1] <= sat_add_mul(i_st3[1], i_st3[3]);
            i_st4[3] <= sat_sub_mul(i_st3[1], i_st3[3]);

            r_st4[4] <= sat_add_mul(r_st3[4], r_st3[6]);
            r_st4[6] <= sat_sub_mul(r_st3[4], r_st3[6]);
            i_st4[4] <= sat_add_mul(i_st3[4], i_st3[6]);
            i_st4[6] <= sat_sub_mul(i_st3[4], i_st3[6]);

            r_st4[5] <= sat_add_mul(r_st3[5], r_st3[7]);
            r_st4[7] <= sat_sub_mul(r_st3[5], r_st3[7]);
            i_st4[5] <= sat_add_mul(i_st3[5], i_st3[7]);
            i_st4[7] <= sat_sub_mul(i_st3[5], i_st3[7]);

            v_st4 <= v_st3;
        end
    end

    // Stage 5: CS(2, 1). Phase gate of i on states 6 (110) and 7 (111).
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                r_st5[i] <= 8'sd0;
                i_st5[i] <= 8'sd0;
            end
            v_st5 <= 1'b0;
        end else begin
            for (int i = 0; i < 8; i++) begin
                if (i == 6 || i == 7) begin
                    r_st5[i] <= (i_st4[i] == -128) ? 8'sd127 : -i_st4[i];
                    i_st5[i] <= r_st4[i];
                end else begin
                    r_st5[i] <= r_st4[i];
                    i_st5[i] <= i_st4[i];
                end
            end
            v_st5 <= v_st4;
        end
    end

    // Stage 6: H(2) on MSB. Pairs: (0,4), (1,5), (2,6), (3,7)
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                r_st6[i] <= 8'sd0;
                i_st6[i] <= 8'sd0;
            end
            v_st6 <= 1'b0;
        end else begin
            r_st6[0] <= sat_add_mul(r_st5[0], r_st5[4]);
            r_st6[4] <= sat_sub_mul(r_st5[0], r_st5[4]);
            i_st6[0] <= sat_add_mul(i_st5[0], i_st5[4]);
            i_st6[4] <= sat_sub_mul(i_st5[0], i_st5[4]);

            r_st6[1] <= sat_add_mul(r_st5[1], r_st5[5]);
            r_st6[5] <= sat_sub_mul(r_st5[1], r_st5[5]);
            i_st6[1] <= sat_add_mul(i_st5[1], i_st5[5]);
            i_st6[5] <= sat_sub_mul(i_st5[1], i_st5[5]);

            r_st6[2] <= sat_add_mul(r_st5[2], r_st5[6]);
            r_st6[6] <= sat_sub_mul(r_st5[2], r_st5[6]);
            i_st6[2] <= sat_add_mul(i_st5[2], i_st5[6]);
            i_st6[6] <= sat_sub_mul(i_st5[2], i_st5[6]);

            r_st6[3] <= sat_add_mul(r_st5[3], r_st5[7]);
            r_st6[7] <= sat_sub_mul(r_st5[3], r_st5[7]);
            i_st6[3] <= sat_add_mul(i_st5[3], i_st5[7]);
            i_st6[7] <= sat_sub_mul(i_st5[3], i_st5[7]);

            v_st6 <= v_st5;
        end
    end

    // Stage 7: SWAP(0, 2) + Output Registers
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_QSV_0_0 <= 8'sd0;
            io_out_QSV_0_1 <= 8'sd0;
            io_out_QSV_1_0 <= 8'sd0;
            io_out_QSV_1_1 <= 8'sd0;
            io_out_QSV_2_0 <= 8'sd0;
            io_out_QSV_2_1 <= 8'sd0;
            io_out_QSV_3_0 <= 8'sd0;
            io_out_QSV_3_1 <= 8'sd0;
            io_out_QSV_4_0 <= 8'sd0;
            io_out_QSV_4_1 <= 8'sd0;
            io_out_QSV_5_0 <= 8'sd0;
            io_out_QSV_5_1 <= 8'sd0;
            io_out_QSV_6_0 <= 8'sd0;
            io_out_QSV_6_1 <= 8'sd0;
            io_out_QSV_7_0 <= 8'sd0;
            io_out_QSV_7_1 <= 8'sd0;
            io_out_valid   <= 1'b0;
        end else begin
            io_out_QSV_0_0 <= r_st6[0];
            io_out_QSV_0_1 <= i_st6[0];
            
            io_out_QSV_1_0 <= r_st6[4];
            io_out_QSV_1_1 <= i_st6[4];
            
            io_out_QSV_2_0 <= r_st6[2];
            io_out_QSV_2_1 <= i_st6[2];
            
            io_out_QSV_3_0 <= r_st6[6];
            io_out_QSV_3_1 <= i_st6[6];
            
            io_out_QSV_4_0 <= r_st6[1];
            io_out_QSV_4_1 <= i_st6[1];
            
            io_out_QSV_5_0 <= r_st6[5];
            io_out_QSV_5_1 <= i_st6[5];
            
            io_out_QSV_6_0 <= r_st6[3];
            io_out_QSV_6_1 <= i_st6[3];
            
            io_out_QSV_7_0 <= r_st6[7];
            io_out_QSV_7_1 <= i_st6[7];
            
            io_out_valid   <= v_st6;
        end
    end

endmodule
