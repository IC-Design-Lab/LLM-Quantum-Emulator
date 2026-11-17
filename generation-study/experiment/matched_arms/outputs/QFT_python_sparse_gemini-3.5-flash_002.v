module QFT (
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
    output logic        io_out_valid
);

    // Pipeline registers for state vector amplitudes (24-bit signed for high precision)
    logic signed [23:0] r_s1 [0:7];
    logic signed [23:0] i_s1 [0:7];
    logic               val_s1;

    logic signed [23:0] r_s2 [0:7];
    logic signed [23:0] i_s2 [0:7];
    logic               val_s2;

    logic signed [23:0] r_s3 [0:7];
    logic signed [23:0] i_s3 [0:7];
    logic               val_s3;

    logic signed [23:0] r_s4 [0:7];
    logic signed [23:0] i_s4 [0:7];
    logic               val_s4;

    logic signed [23:0] r_s5 [0:7];
    logic signed [23:0] i_s5 [0:7];
    logic               val_s5;

    logic signed [23:0] r_s6 [0:7];
    logic signed [23:0] i_s6 [0:7];
    logic               val_s6;

    // Saturation logic helper to safely convert 24-bit values to 8-bit output
    function automatic logic [7:0] saturate(logic signed [23:0] val);
        if (val > 24'sd127) begin
            return 8'sd127;
        end else if (val < -24'sd128) begin
            return -8'sd128;
        end else begin
            return val[7:0];
        end
    endfunction

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            val_s1 <= 1'b0;
            val_s2 <= 1'b0;
            val_s3 <= 1'b0;
            val_s4 <= 1'b0;
            val_s5 <= 1'b0;
            val_s6 <= 1'b0;
            for (int i = 0; i < 8; i++) begin
                r_s1[i] <= 24'sd0; i_s1[i] <= 24'sd0;
                r_s2[i] <= 24'sd0; i_s2[i] <= 24'sd0;
                r_s3[i] <= 24'sd0; i_s3[i] <= 24'sd0;
                r_s4[i] <= 24'sd0; i_s4[i] <= 24'sd0;
                r_s5[i] <= 24'sd0; i_s5[i] <= 24'sd0;
                r_s6[i] <= 24'sd0; i_s6[i] <= 24'sd0;
            end
        end else begin
            val_s1 <= io_in_valid;
            val_s2 <= val_s1;
            val_s3 <= val_s2;
            val_s4 <= val_s3;
            val_s5 <= val_s4;
            val_s6 <= val_s5;

            // Stage 1: Hadamard on Qubit 0 (H(0))
            // Pairs: (0,1), (2,3), (4,5), (6,7)
            begin
                logic signed [23:0] sum_r_01, diff_r_01, sum_i_01, diff_i_01;
                logic signed [23:0] sum_r_23, diff_r_23, sum_i_23, diff_i_23;
                logic signed [23:0] sum_r_45, diff_r_45, sum_i_45, diff_i_45;
                logic signed [23:0] sum_r_67, diff_r_67, sum_i_67, diff_i_67;

                logic signed [23:0] in_r[0:7];
                logic signed [23:0] in_i[0:7];
                
                in_r[0] = 24'(signed'(io_in_QSV_0_0)); in_i[0] = 24'(signed'(io_in_QSV_0_1));
                in_r[1] = 24'(signed'(io_in_QSV_1_0)); in_i[1] = 24'(signed'(io_in_QSV_1_1));
                in_r[2] = 24'(signed'(io_in_QSV_2_0)); in_i[2] = 24'(signed'(io_in_QSV_2_1));
                in_r[3] = 24'(signed'(io_in_QSV_3_0)); in_i[3] = 24'(signed'(io_in_QSV_3_1));
                in_r[4] = 24'(signed'(io_in_QSV_4_0)); in_i[4] = 24'(signed'(io_in_QSV_4_1));
                in_r[5] = 24'(signed'(io_in_QSV_5_0)); in_i[5] = 24'(signed'(io_in_QSV_5_1));
                in_r[6] = 24'(signed'(io_in_QSV_6_0)); in_i[6] = 24'(signed'(io_in_QSV_6_1));
                in_r[7] = 24'(signed'(io_in_QSV_7_0)); in_i[7] = 24'(signed'(io_in_QSV_7_1));

                sum_r_01 = in_r[0] + in_r[1]; diff_r_01 = in_r[0] - in_r[1];
                sum_i_01 = in_i[0] + in_i[1]; diff_i_01 = in_i[0] - in_i[1];
                r_s1[0] <= (sum_r_01 * 24'sd181) >>> 8;
                i_s1[0] <= (sum_i_01 * 24'sd181) >>> 8;
                r_s1[1] <= (diff_r_01 * 24'sd181) >>> 8;
                i_s1[1] <= (diff_i_01 * 24'sd181) >>> 8;

                sum_r_23 = in_r[2] + in_r[3]; diff_r_23 = in_r[2] - in_r[3];
                sum_i_23 = in_i[2] + in_i[3]; diff_i_23 = in_i[2] - in_i[3];
                r_s1[2] <= (sum_r_23 * 24'sd181) >>> 8;
                i_s1[2] <= (sum_i_23 * 24'sd181) >>> 8;
                r_s1[3] <= (diff_r_23 * 24'sd181) >>> 8;
                i_s1[3] <= (diff_i_23 * 24'sd181) >>> 8;

                sum_r_45 = in_r[4] + in_r[5]; diff_r_45 = in_r[4] - in_r[5];
                sum_i_45 = in_i[4] + in_i[5]; diff_i_45 = in_i[4] - in_i[5];
                r_s1[4] <= (sum_r_45 * 24'sd181) >>> 8;
                i_s1[4] <= (sum_i_45 * 24'sd181) >>> 8;
                r_s1[5] <= (diff_r_45 * 24'sd181) >>> 8;
                i_s1[5] <= (diff_i_45 * 24'sd181) >>> 8;

                sum_r_67 = in_r[6] + in_r[7]; diff_r_67 = in_r[6] - in_r[7];
                sum_i_67 = in_i[6] + in_i[7]; diff_i_67 = in_i[6] - in_i[7];
                r_s1[6] <= (sum_r_67 * 24'sd181) >>> 8;
                i_s1[6] <= (sum_i_67 * 24'sd181) >>> 8;
                r_s1[7] <= (diff_r_67 * 24'sd181) >>> 8;
                i_s1[7] <= (diff_i_67 * 24'sd181) >>> 8;
            end

            // Stage 2: Controlled-S on Qubits 1 and 0 (CS(1,0))
            // Affects state indices where both Qubit 1 and Qubit 0 are 1 (indices 3 and 7)
            for (int i = 0; i < 8; i++) begin
                if (i == 3 || i == 7) begin
                    r_s2[i] <= -i_s1[i];
                    i_s2[i] <= r_s1[i];
                end else begin
                    r_s2[i] <= r_s1[i];
                    i_s2[i] <= i_s1[i];
                end
            end

            // Stage 3: Controlled-Phase by pi/4 on Qubits 2 and 0 (CP(pi/4, 2, 0))
            // Affects state indices where both Qubit 2 and Qubit 0 are 1 (indices 5 and 7)
            for (int i = 0; i < 8; i++) begin
                if (i == 5 || i == 7) begin
                    logic signed [23:0] sub_r, add_i;
                    sub_r = r_s2[i] - i_s2[i];
                    add_i = r_s2[i] + i_s2[i];
                    r_s3[i] <= (sub_r * 24'sd181) >>> 8;
                    i_s3[i] <= (add_i * 24'sd181) >>> 8;
                end else begin
                    r_s3[i] <= r_s2[i];
                    i_s3[i] <= i_s2[i];
                end
            end

            // Stage 4: Hadamard on Qubit 1 (H(1))
            // Pairs: (0,2), (1,3), (4,6), (5,7)
            begin
                logic signed [23:0] sum_r_02, diff_r_02, sum_i_02, diff_i_02;
                logic signed [23:0] sum_r_13, diff_r_13, sum_i_13, diff_i_13;
                logic signed [23:0] sum_r_46, diff_r_46, sum_i_46, diff_i_46;
                logic signed [23:0] sum_r_57, diff_r_57, sum_i_57, diff_i_57;

                sum_r_02 = r_s3[0] + r_s3[2]; diff_r_02 = r_s3[0] - r_s3[2];
                sum_i_02 = i_s3[0] + i_s3[2]; diff_i_02 = i_s3[0] - i_s3[2];
                r_s4[0] <= (sum_r_02 * 24'sd181) >>> 8;
                i_s4[0] <= (sum_i_02 * 24'sd181) >>> 8;
                r_s4[2] <= (diff_r_02 * 24'sd181) >>> 8;
                i_s4[2] <= (diff_i_02 * 24'sd181) >>> 8;

                sum_r_13 = r_s3[1] + r_s3[3]; diff_r_13 = r_s3[1] - r_s3[3];
                sum_i_13 = i_s3[1] + i_s3[3]; diff_i_13 = i_s3[1] - i_s3[3];
                r_s4[1] <= (sum_r_13 * 24'sd181) >>> 8;
                i_s4[1] <= (sum_i_13 * 24'sd181) >>> 8;
                r_s4[3] <= (diff_r_13 * 24'sd181) >>> 8;
                i_s4[3] <= (diff_i_13 * 24'sd181) >>> 8;

                sum_r_46 = r_s3[4] + r_s3[6]; diff_r_46 = r_s3[4] - r_s3[6];
                sum_i_46 = i_s3[4] + i_s3[6]; diff_i_46 = i_s3[4] - i_s3[6];
                r_s4[4] <= (sum_r_46 * 24'sd181) >>> 8;
                i_s4[4] <= (sum_i_46 * 24'sd181) >>> 8;
                r_s4[6] <= (diff_r_46 * 24'sd181) >>> 8;
                i_s4[6] <= (diff_i_46 * 24'sd181) >>> 8;

                sum_r_57 = r_s3[5] + r_s3[7]; diff_r_57 = r_s3[5] - r_s3[7];
                sum_i_57 = i_s3[5] + i_s3[7]; diff_i_57 = i_s3[5] - i_s3[7];
                r_s4[5] <= (sum_r_57 * 24'sd181) >>> 8;
                i_s4[5] <= (sum_i_57 * 24'sd181) >>> 8;
                r_s4[7] <= (diff_r_57 * 24'sd181) >>> 8;
                i_s4[7] <= (diff_i_57 * 24'sd181) >>> 8;
            end

            // Stage 5: Controlled-S on Qubits 2 and 1 (CS(2,1))
            // Affects state indices where both Qubit 2 and Qubit 1 are 1 (indices 6 and 7)
            for (int i = 0; i < 8; i++) begin
                if (i == 6 || i == 7) begin
                    r_s5[i] <= -i_s4[i];
                    i_s5[i] <= r_s4[i];
                end else begin
                    r_s5[i] <= r_s4[i];
                    i_s5[i] <= i_s4[i];
                end
            end

            // Stage 6: Hadamard on Qubit 2 (H(2))
            // Pairs: (0,4), (1,5), (2,6), (3,7)
            begin
                logic signed [23:0] sum_r_04, diff_r_04, sum_i_04, diff_i_04;
                logic signed [23:0] sum_r_15, diff_r_15, sum_i_15, diff_i_15;
                logic signed [23:0] sum_r_26, diff_r_26, sum_i_26, diff_i_26;
                logic signed [23:0] sum_r_37, diff_r_37, sum_i_37, diff_i_37;

                sum_r_04 = r_s5[0] + r_s5[4]; diff_r_04 = r_s5[0] - r_s5[4];
                sum_i_04 = i_s5[0] + i_s5[4]; diff_i_04 = i_s5[0] - i_s5[4];
                r_s6[0] <= (sum_r_04 * 24'sd181) >>> 8;
                i_s6[0] <= (sum_i_04 * 24'sd181) >>> 8;
                r_s6[4] <= (diff_r_04 * 24'sd181) >>> 8;
                i_s6[4] <= (diff_i_04 * 24'sd181) >>> 8;

                sum_r_15 = r_s5[1] + r_s5[5]; diff_r_15 = r_s5[1] - r_s5[5];
                sum_i_15 = i_s5[1] + i_s5[5]; diff_i_15 = i_s5[1] - i_s5[5];
                r_s6[1] <= (sum_r_15 * 24'sd181) >>> 8;
                i_s6[1] <= (sum_i_15 * 24'sd181) >>> 8;
                r_s6[5] <= (diff_r_15 * 24'sd181) >>> 8;
                i_s6[5] <= (diff_i_15 * 24'sd181) >>> 8;

                sum_r_26 = r_s5[2] + r_s5[6]; diff_r_26 = r_s5[2] - r_s5[6];
                sum_i_26 = i_s5[2] + i_s5[6]; diff_i_26 = i_s5[2] - i_s5[6];
                r_s6[2] <= (sum_r_26 * 24'sd181) >>> 8;
                i_s6[2] <= (sum_i_26 * 24'sd181) >>> 8;
                r_s6[6] <= (diff_r_26 * 24'sd181) >>> 8;
                i_s6[6] <= (diff_i_26 * 24'sd181) >>> 8;

                sum_r_37 = r_s5[3] + r_s5[7]; diff_r_37 = r_s5[3] - r_s5[7];
                sum_i_37 = i_s5[3] + i_s5[7]; diff_i_37 = i_s5[3] - i_s5[7];
                r_s6[3] <= (sum_r_37 * 24'sd181) >>> 8;
                i_s6[3] <= (sum_i_37 * 24'sd181) >>> 8;
                r_s6[7] <= (diff_r_37 * 24'sd181) >>> 8;
                i_s6[7] <= (diff_i_37 * 24'sd181) >>> 8;
            end
        end
    end

    // Stage 7: Swap (0, 2) permutation and output routing
    // Output 0 is from state 0 (000 -> 000)
    assign io_out_QSV_0_0 = saturate(r_s6[0]);
    assign io_out_QSV_0_1 = saturate(i_s6[0]);

    // Output 1 is from state 4 (100 -> 001)
    assign io_out_QSV_1_0 = saturate(r_s6[4]);
    assign io_out_QSV_1_1 = saturate(i_s6[4]);

    // Output 2 is from state 2 (010 -> 010)
    assign io_out_QSV_2_0 = saturate(r_s6[2]);
    assign io_out_QSV_2_1 = saturate(i_s6[2]);

    // Output 3 is from state 6 (110 -> 011)
    assign io_out_QSV_3_0 = saturate(r_s6[6]);
    assign io_out_QSV_3_1 = saturate(i_s6[6]);

    // Output 4 is from state 1 (001 -> 100)
    assign io_out_QSV_4_0 = saturate(r_s6[1]);
    assign io_out_QSV_4_1 = saturate(i_s6[1]);

    // Output 5 is from state 5 (101 -> 101)
    assign io_out_QSV_5_0 = saturate(r_s6[5]);
    assign io_out_QSV_5_1 = saturate(i_s6[5]);

    // Output 6 is from state 3 (011 -> 110)
    assign io_out_QSV_6_0 = saturate(r_s6[3]);
    assign io_out_QSV_6_1 = saturate(i_s6[3]);

    // Output 7 is from state 7 (111 -> 111)
    assign io_out_QSV_7_0 = saturate(r_s6[7]);
    assign io_out_QSV_7_1 = saturate(i_s6[7]);

    assign io_out_valid = val_s6;

endmodule
