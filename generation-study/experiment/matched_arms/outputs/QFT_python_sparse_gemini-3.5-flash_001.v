module QFT (
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
    output logic io_out_valid
);

    // Fixed-point scaling (1/sqrt(2) approx 0.7071 -> 90/128)
    function automatic logic signed [7:0] scale_and_sat(logic signed [15:0] sum);
        logic signed [23:0] prod;
        logic signed [23:0] shifted;
        prod = sum * 24'sd90;
        shifted = prod >>> 7;
        if (shifted > 24'sd127)
            return 8'sd127;
        else if (shifted < -24'sd128)
            return -8'sd128;
        else
            return shifted[7:0];
    endfunction

    // Safe negation to prevent overflow
    function automatic logic signed [7:0] safe_neg(logic signed [7:0] val);
        if (val == -8'sd128)
            return 8'sd127;
        else
            return -val;
    endfunction

    // Stage 0 Registers
    logic signed [7:0] r0[8], i0[8];
    logic v0;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            v0 <= 1'b0;
            for (int i = 0; i < 8; i++) begin
                r0[i] <= 8'sd0;
                i0[i] <= 8'sd0;
            end
        end else begin
            v0 <= io_in_valid;
            r0[0] <= $signed(io_in_QSV_0_0); i0[0] <= $signed(io_in_QSV_0_1);
            r0[1] <= $signed(io_in_QSV_1_0); i0[1] <= $signed(io_in_QSV_1_1);
            r0[2] <= $signed(io_in_QSV_2_0); i0[2] <= $signed(io_in_QSV_2_1);
            r0[3] <= $signed(io_in_QSV_3_0); i0[3] <= $signed(io_in_QSV_3_1);
            r0[4] <= $signed(io_in_QSV_4_0); i0[4] <= $signed(io_in_QSV_4_1);
            r0[5] <= $signed(io_in_QSV_5_0); i0[5] <= $signed(io_in_QSV_5_1);
            r0[6] <= $signed(io_in_QSV_6_0); i0[6] <= $signed(io_in_QSV_6_1);
            r0[7] <= $signed(io_in_QSV_7_0); i0[7] <= $signed(io_in_QSV_7_1);
        end
    end

    // Stage 1 Registers: H(0)
    logic signed [7:0] r1[8], i1[8];
    logic v1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            v1 <= 1'b0;
            for (int i = 0; i < 8; i++) begin
                r1[i] <= 8'sd0;
                i1[i] <= 8'sd0;
            end
        end else begin
            v1 <= v0;
            // Pairs: (0, 1)
            r1[0] <= scale_and_sat($signed(r0[0]) + $signed(r0[1]));
            i1[0] <= scale_and_sat($signed(i0[0]) + $signed(i0[1]));
            r1[1] <= scale_and_sat($signed(r0[0]) - $signed(r0[1]));
            i1[1] <= scale_and_sat($signed(i0[0]) - $signed(i0[1]));

            // Pairs: (2, 3)
            r1[2] <= scale_and_sat($signed(r0[2]) + $signed(r0[3]));
            i1[2] <= scale_and_sat($signed(i0[2]) + $signed(i0[3]));
            r1[3] <= scale_and_sat($signed(r0[2]) - $signed(r0[3]));
            i1[3] <= scale_and_sat($signed(i0[2]) - $signed(i0[3]));

            // Pairs: (4, 5)
            r1[4] <= scale_and_sat($signed(r0[4]) + $signed(r0[5]));
            i1[4] <= scale_and_sat($signed(i0[4]) + $signed(i0[5]));
            r1[5] <= scale_and_sat($signed(r0[4]) - $signed(r0[5]));
            i1[5] <= scale_and_sat($signed(i0[4]) - $signed(i0[5]));

            // Pairs: (6, 7)
            r1[6] <= scale_and_sat($signed(r0[6]) + $signed(r0[7]));
            i1[6] <= scale_and_sat($signed(i0[6]) + $signed(i0[7]));
            r1[7] <= scale_and_sat($signed(r0[6]) - $signed(r0[7]));
            i1[7] <= scale_and_sat($signed(i0[6]) - $signed(i0[7]));
        end
    end

    // Stage 2 Registers: CS(1, 0)
    logic signed [7:0] r2[8], i2[8];
    logic v2;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            v2 <= 1'b0;
            for (int i = 0; i < 8; i++) begin
                r2[i] <= 8'sd0;
                i2[i] <= 8'sd0;
            end
        end else begin
            v2 <= v1;
            r2[0] <= r1[0]; i2[0] <= i1[0];
            r2[1] <= r1[1]; i2[1] <= i1[1];
            r2[2] <= r1[2]; i2[2] <= i1[2];
            r2[4] <= r1[4]; i2[4] <= i1[4];
            r2[5] <= r1[5]; i2[5] <= i1[5];
            r2[6] <= r1[6]; i2[6] <= i1[6];

            // CS on 3 (control 1, target 0)
            r2[3] <= safe_neg(i1[3]);
            i2[3] <= r1[3];

            // CS on 7 (control 1, target 0)
            r2[7] <= safe_neg(i1[7]);
            i2[7] <= r1[7];
        end
    end

    // Stage 3 Registers: CP(pi/4, 2, 0)
    logic signed [7:0] r3[8], i3[8];
    logic v3;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            v3 <= 1'b0;
            for (int i = 0; i < 8; i++) begin
                r3[i] <= 8'sd0;
                i3[i] <= 8'sd0;
            end
        end else begin
            v3 <= v2;
            r3[0] <= r2[0]; i3[0] <= i2[0];
            r3[1] <= r2[1]; i3[1] <= i2[1];
            r3[2] <= r2[2]; i3[2] <= i2[2];
            r3[3] <= r2[3]; i3[3] <= i2[3];
            r3[4] <= r2[4]; i3[4] <= i2[4];
            r3[6] <= r2[6]; i3[6] <= i2[6];

            // CP on 5 (control 2, target 0)
            r3[5] <= scale_and_sat($signed(r2[5]) - $signed(i2[5]));
            i3[5] <= scale_and_sat($signed(r2[5]) + $signed(i2[5]));

            // CP on 7 (control 2, target 0)
            r3[7] <= scale_and_sat($signed(r2[7]) - $signed(i2[7]));
            i3[7] <= scale_and_sat($signed(r2[7]) + $signed(i2[7]));
        end
    end

    // Stage 4 Registers: H(1)
    logic signed [7:0] r4[8], i4[8];
    logic v4;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            v4 <= 1'b0;
            for (int i = 0; i < 8; i++) begin
                r4[i] <= 8'sd0;
                i4[i] <= 8'sd0;
            end
        end else begin
            v4 <= v3;
            // Pairs: (0, 2)
            r4[0] <= scale_and_sat($signed(r3[0]) + $signed(r3[2]));
            i4[0] <= scale_and_sat($signed(i3[0]) + $signed(i3[2]));
            r4[2] <= scale_and_sat($signed(r3[0]) - $signed(r3[2]));
            i4[2] <= scale_and_sat($signed(i3[0]) - $signed(i3[2]));

            // Pairs: (1, 3)
            r4[1] <= scale_and_sat($signed(r3[1]) + $signed(r3[3]));
            i4[1] <= scale_and_sat($signed(i3[1]) + $signed(i3[3]));
            r4[3] <= scale_and_sat($signed(r3[1]) - $signed(r3[3]));
            i4[3] <= scale_and_sat($signed(i3[1]) - $signed(i3[3]));

            // Pairs: (4, 6)
            r4[4] <= scale_and_sat($signed(r3[4]) + $signed(r3[6]));
            i4[4] <= scale_and_sat($signed(i3[4]) + $signed(i3[6]));
            r4[6] <= scale_and_sat($signed(r3[4]) - $signed(r3[6]));
            i4[6] <= scale_and_sat($signed(i3[4]) - $signed(i3[6]));

            // Pairs: (5, 7)
            r4[5] <= scale_and_sat($signed(r3[5]) + $signed(r3[7]));
            i4[5] <= scale_and_sat($signed(i3[5]) + $signed(i3[7]));
            r4[7] <= scale_and_sat($signed(r3[5]) - $signed(r3[7]));
            i4[7] <= scale_and_sat($signed(i3[5]) - $signed(i3[7]));
        end
    end

    // Stage 5 Registers: CS(2, 1)
    logic signed [7:0] r5[8], i5[8];
    logic v5;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            v5 <= 1'b0;
            for (int i = 0; i < 8; i++) begin
                r5[i] <= 8'sd0;
                i5[i] <= 8'sd0;
            end
        end else begin
            v5 <= v4;
            r5[0] <= r4[0]; i5[0] <= i4[0];
            r5[1] <= r4[1]; i5[1] <= i4[1];
            r5[2] <= r4[2]; i5[2] <= i4[2];
            r5[3] <= r4[3]; i5[3] <= i4[3];
            r5[4] <= r4[4]; i5[4] <= i4[4];
            r5[5] <= r4[5]; i5[5] <= i4[5];

            // CS on 6 (control 2, target 1)
            r5[6] <= safe_neg(i4[6]);
            i5[6] <= r4[6];

            // CS on 7 (control 2, target 1)
            r5[7] <= safe_neg(i4[7]);
            i5[7] <= r4[7];
        end
    end

    // Stage 6 Output Registers: H(2) and SWAP(0, 2)
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_valid <= 1'b0;
            io_out_QSV_0_0 <= 8'd0; io_out_QSV_0_1 <= 8'd0;
            io_out_QSV_1_0 <= 8'd0; io_out_QSV_1_1 <= 8'd0;
            io_out_QSV_2_0 <= 8'd0; io_out_QSV_2_1 <= 8'd0;
            io_out_QSV_3_0 <= 8'd0; io_out_QSV_3_1 <= 8'd0;
            io_out_QSV_4_0 <= 8'd0; io_out_QSV_4_1 <= 8'd0;
            io_out_QSV_5_0 <= 8'd0; io_out_QSV_5_1 <= 8'd0;
            io_out_QSV_6_0 <= 8'd0; io_out_QSV_6_1 <= 8'd0;
            io_out_QSV_7_0 <= 8'd0; io_out_QSV_7_1 <= 8'd0;
        end else begin
            io_out_valid <= v5;

            // Final Output 0 is final_0 (H(2) on (0,4) sum)
            io_out_QSV_0_0 <= scale_and_sat($signed(r5[0]) + $signed(r5[4]));
            io_out_QSV_0_1 <= scale_and_sat($signed(i5[0]) + $signed(i5[4]));

            // Final Output 1 is final_4 (H(2) on (0,4) diff)
            io_out_QSV_1_0 <= scale_and_sat($signed(r5[0]) - $signed(r5[4]));
            io_out_QSV_1_1 <= scale_and_sat($signed(i5[0]) - $signed(i5[4]));

            // Final Output 2 is final_2 (H(2) on (2,6) sum)
            io_out_QSV_2_0 <= scale_and_sat($signed(r5[2]) + $signed(r5[6]));
            io_out_QSV_2_1 <= scale_and_sat($signed(i5[2]) + $signed(i5[6]));

            // Final Output 3 is final_6 (H(2) on (2,6) diff)
            io_out_QSV_3_0 <= scale_and_sat($signed(r5[2]) - $signed(r5[6]));
            io_out_QSV_3_1 <= scale_and_sat($signed(i5[2]) - $signed(i5[6]));

            // Final Output 4 is final_1 (H(2) on (1,5) sum)
            io_out_QSV_4_0 <= scale_and_sat($signed(r5[1]) + $signed(r5[5]));
            io_out_QSV_4_1 <= scale_and_sat($signed(i5[1]) + $signed(i5[5]));

            // Final Output 5 is final_5 (H(2) on (1,5) diff)
            io_out_QSV_5_0 <= scale_and_sat($signed(r5[1]) - $signed(r5[5]));
            io_out_QSV_5_1 <= scale_and_sat($signed(i5[1]) - $signed(i5[5]));

            // Final Output 6 is final_3 (H(2) on (3,7) sum)
            io_out_QSV_6_0 <= scale_and_sat($signed(r5[3]) + $signed(r5[7]));
            io_out_QSV_6_1 <= scale_and_sat($signed(i5[3]) + $signed(i5[7]));

            // Final Output 7 is final_7 (H(2) on (3,7) diff)
            io_out_QSV_7_0 <= scale_and_sat($signed(r5[3]) - $signed(r5[7]));
            io_out_QSV_7_1 <= scale_and_sat($signed(i5[3]) - $signed(i5[7]));
        end
    end

endmodule
