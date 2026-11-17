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

    // Helper function for saturation
    function automatic logic signed [7:0] sat8(logic signed [16:0] val);
        if (val > 17'sd127) begin
            return 8'sd127;
        end else if (val < -17'sd128) begin
            return -8'sd128;
        end else begin
            return val[7:0];
        end
    endfunction

    // Input state vectors
    logic signed [7:0] in_re [0:7];
    logic signed [7:0] in_im [0:7];

    assign in_re[0] = io_in_QSV_0_0;
    assign in_im[0] = io_in_QSV_0_1;
    assign in_re[1] = io_in_QSV_1_0;
    assign in_im[1] = io_in_QSV_1_1;
    assign in_re[2] = io_in_QSV_2_0;
    assign in_im[2] = io_in_QSV_2_1;
    assign in_re[3] = io_in_QSV_3_0;
    assign in_im[3] = io_in_QSV_3_1;
    assign in_re[4] = io_in_QSV_4_0;
    assign in_im[4] = io_in_QSV_4_1;
    assign in_re[5] = io_in_QSV_5_0;
    assign in_im[5] = io_in_QSV_5_1;
    assign in_re[6] = io_in_QSV_6_0;
    assign in_im[6] = io_in_QSV_6_1;
    assign in_re[7] = io_in_QSV_7_0;
    assign in_im[7] = io_in_QSV_7_1;

    // Pipeline Registers
    logic signed [7:0] r_re [0:6][0:7];
    logic signed [7:0] r_im [0:6][0:7];
    logic r_valid [0:6];

    // --- STAGE 0: H on qubit 0 (bit 0) ---
    logic signed [8:0] s0_sum_re [0:3];
    logic signed [8:0] s0_diff_re [0:3];
    logic signed [8:0] s0_sum_im [0:3];
    logic signed [8:0] s0_diff_im [0:3];

    generate
        for (genvar k = 0; k < 4; k++) begin : stage0_calc
            assign s0_sum_re[k]  = $signed(in_re[2*k]) + $signed(in_re[2*k+1]);
            assign s0_diff_re[k] = $signed(in_re[2*k]) - $signed(in_re[2*k+1]);
            assign s0_sum_im[k]  = $signed(in_im[2*k]) + $signed(in_im[2*k+1]);
            assign s0_diff_im[k] = $signed(in_im[2*k]) - $signed(in_im[2*k+1]);
        end
    endgenerate

    // --- STAGE 2: CP on ctrl 2, tgt 0 ---
    logic signed [8:0] s2_diff [0:1];
    logic signed [8:0] s2_sum [0:1];

    assign s2_diff[0] = $signed(r_re[1][5]) - $signed(r_im[1][5]);
    assign s2_sum[0]  = $signed(r_re[1][5]) + $signed(r_im[1][5]);
    assign s2_diff[1] = $signed(r_re[1][7]) - $signed(r_im[1][7]);
    assign s2_sum[1]  = $signed(r_re[1][7]) + $signed(r_im[1][7]);

    // --- STAGE 3: H on qubit 1 (bit 1) ---
    logic signed [8:0] s3_sum_re [0:3];
    logic signed [8:0] s3_diff_re [0:3];
    logic signed [8:0] s3_sum_im [0:3];
    logic signed [8:0] s3_diff_im [0:3];

    assign s3_sum_re[0]  = $signed(r_re[2][0]) + $signed(r_re[2][2]);
    assign s3_diff_re[0] = $signed(r_re[2][0]) - $signed(r_re[2][2]);
    assign s3_sum_im[0]  = $signed(r_im[2][0]) + $signed(r_im[2][2]);
    assign s3_diff_im[0] = $signed(r_im[2][0]) - $signed(r_im[2][2]);

    assign s3_sum_re[1]  = $signed(r_re[2][1]) + $signed(r_re[2][3]);
    assign s3_diff_re[1] = $signed(r_re[2][1]) - $signed(r_re[2][3]);
    assign s3_sum_im[1]  = $signed(r_im[2][1]) + $signed(r_im[2][3]);
    assign s3_diff_im[1] = $signed(r_im[2][1]) - $signed(r_im[2][3]);

    assign s3_sum_re[2]  = $signed(r_re[2][4]) + $signed(r_re[2][6]);
    assign s3_diff_re[2] = $signed(r_re[2][4]) - $signed(r_re[2][6]);
    assign s3_sum_im[2]  = $signed(r_im[2][4]) + $signed(r_im[2][6]);
    assign s3_diff_im[2] = $signed(r_im[2][4]) - $signed(r_im[2][6]);

    assign s3_sum_re[3]  = $signed(r_re[2][5]) + $signed(r_re[2][7]);
    assign s3_diff_re[3] = $signed(r_re[2][5]) - $signed(r_re[2][7]);
    assign s3_sum_im[3]  = $signed(r_im[2][5]) + $signed(r_im[2][7]);
    assign s3_diff_im[3] = $signed(r_im[2][5]) - $signed(r_im[2][7]);

    // --- STAGE 5: H on qubit 2 (bit 2) ---
    logic signed [8:0] s5_sum_re [0:3];
    logic signed [8:0] s5_diff_re [0:3];
    logic signed [8:0] s5_sum_im [0:3];
    logic signed [8:0] s5_diff_im [0:3];

    generate
        for (genvar k = 0; k < 4; k++) begin : stage5_calc
            assign s5_sum_re[k]  = $signed(r_re[4][k]) + $signed(r_re[4][k+4]);
            assign s5_diff_re[k] = $signed(r_re[4][k]) - $signed(r_re[4][k+4]);
            assign s5_sum_im[k]  = $signed(r_im[4][k]) + $signed(r_im[4][k+4]);
            assign s5_diff_im[k] = $signed(r_im[4][k]) - $signed(r_im[4][k+4]);
        end
    endgenerate

    // Pipeline Registers Logic
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int stage = 0; stage < 7; stage++) begin
                r_valid[stage] <= 1'b0;
                for (int i = 0; i < 8; i++) begin
                    r_re[stage][i] <= 8'sd0;
                    r_im[stage][i] <= 8'sd0;
                end
            end
        end else begin
            // --- STAGE 0 Transition ---
            r_valid[0] <= io_in_valid;
            for (int k = 0; k < 4; k++) begin
                r_re[0][2*k]   <= sat8((s0_sum_re[k] * 8'sd91) >>> 7);
                r_im[0][2*k]   <= sat8((s0_sum_im[k] * 8'sd91) >>> 7);
                r_re[0][2*k+1] <= sat8((s0_diff_re[k] * 8'sd91) >>> 7);
                r_im[0][2*k+1] <= sat8((s0_diff_im[k] * 8'sd91) >>> 7);
            end

            // --- STAGE 1 Transition (CS ctrl 1, tgt 0) ---
            r_valid[1] <= r_valid[0];
            for (int i = 0; i < 8; i++) begin
                if ((i & 3) == 3) begin
                    r_re[1][i] <= (r_im[0][i] == -8'sd128) ? 8'sd127 : -r_im[0][i];
                    r_im[1][i] <= r_re[0][i];
                end else begin
                    r_re[1][i] <= r_re[0][i];
                    r_im[1][i] <= r_im[0][i];
                end
            end

            // --- STAGE 2 Transition (CP ctrl 2, tgt 0) ---
            r_valid[2] <= r_valid[1];
            for (int i = 0; i < 8; i++) begin
                if (i == 5) begin
                    r_re[2][5] <= sat8((s2_diff[0] * 8'sd91) >>> 7);
                    r_im[2][5] <= sat8((s2_sum[0] * 8'sd91) >>> 7);
                end else if (i == 7) begin
                    r_re[2][7] <= sat8((s2_diff[1] * 8'sd91) >>> 7);
                    r_im[2][7] <= sat8((s2_sum[1] * 8'sd91) >>> 7);
                end else begin
                    r_re[2][i] <= r_re[1][i];
                    r_im[2][i] <= r_im[1][i];
                end
            end

            // --- STAGE 3 Transition (H qubit 1) ---
            r_valid[3] <= r_valid[2];
            r_re[3][0] <= sat8((s3_sum_re[0] * 8'sd91) >>> 7);
            r_im[3][0] <= sat8((s3_sum_im[0] * 8'sd91) >>> 7);
            r_re[3][2] <= sat8((s3_diff_re[0] * 8'sd91) >>> 7);
            r_im[3][2] <= sat8((s3_diff_im[0] * 8'sd91) >>> 7);

            r_re[3][1] <= sat8((s3_sum_re[1] * 8'sd91) >>> 7);
            r_im[3][1] <= sat8((s3_sum_im[1] * 8'sd91) >>> 7);
            r_re[3][3] <= sat8((s3_diff_re[1] * 8'sd91) >>> 7);
            r_im[3][3] <= sat8((s3_diff_im[1] * 8'sd91) >>> 7);

            r_re[3][4] <= sat8((s3_sum_re[2] * 8'sd91) >>> 7);
            r_im[3][4] <= sat8((s3_sum_im[2] * 8'sd91) >>> 7);
            r_re[3][6] <= sat8((s3_diff_re[2] * 8'sd91) >>> 7);
            r_im[3][6] <= sat8((s3_diff_im[2] * 8'sd91) >>> 7);

            r_re[3][5] <= sat8((s3_sum_re[3] * 8'sd91) >>> 7);
            r_im[3][5] <= sat8((s3_sum_im[3] * 8'sd91) >>> 7);
            r_re[3][7] <= sat8((s3_diff_re[3] * 8'sd91) >>> 7);
            r_im[3][7] <= sat8((s3_diff_im[3] * 8'sd91) >>> 7);

            // --- STAGE 4 Transition (CS ctrl 2, tgt 1) ---
            r_valid[4] <= r_valid[3];
            for (int i = 0; i < 8; i++) begin
                if ((i & 6) == 6) begin
                    r_re[4][i] <= (r_im[3][i] == -8'sd128) ? 8'sd127 : -r_im[3][i];
                    r_im[4][i] <= r_re[3][i];
                end else begin
                    r_re[4][i] <= r_re[3][i];
                    r_im[4][i] <= r_im[3][i];
                end
            end

            // --- STAGE 5 Transition (H qubit 2) ---
            r_valid[5] <= r_valid[4];
            for (int k = 0; k < 4; k++) begin
                r_re[5][k]   <= sat8((s5_sum_re[k] * 8'sd91) >>> 7);
                r_im[5][k]   <= sat8((s5_sum_im[k] * 8'sd91) >>> 7);
                r_re[5][k+4] <= sat8((s5_diff_re[k] * 8'sd91) >>> 7);
                r_im[5][k+4] <= sat8((s5_diff_im[k] * 8'sd91) >>> 7);
            end

            // --- STAGE 6 Transition (SWAP qubit 0, 2) ---
            r_valid[6] <= r_valid[5];
            r_re[6][0] <= r_re[5][0];
            r_im[6][0] <= r_im[5][0];
            r_re[6][1] <= r_re[5][4];
            r_im[6][1] <= r_im[5][4];
            r_re[6][2] <= r_re[5][2];
            r_im[6][2] <= r_im[5][2];
            r_re[6][3] <= r_re[5][6];
            r_im[6][3] <= r_im[5][6];
            r_re[6][4] <= r_re[5][1];
            r_im[6][4] <= r_im[5][1];
            r_re[6][5] <= r_re[5][5];
            r_im[6][5] <= r_im[5][5];
            r_re[6][6] <= r_re[5][3];
            r_im[6][6] <= r_im[5][3];
            r_re[6][7] <= r_re[5][7];
            r_im[6][7] <= r_im[5][7];
        end
    end

    // Map outputs from Stage 6
    assign io_out_QSV_0_0 = r_re[6][0];
    assign io_out_QSV_0_1 = r_im[6][0];
    assign io_out_QSV_1_0 = r_re[6][1];
    assign io_out_QSV_1_1 = r_im[6][1];
    assign io_out_QSV_2_0 = r_re[6][2];
    assign io_out_QSV_2_1 = r_im[6][2];
    assign io_out_QSV_3_0 = r_re[6][3];
    assign io_out_QSV_3_1 = r_im[6][3];
    assign io_out_QSV_4_0 = r_re[6][4];
    assign io_out_QSV_4_1 = r_im[6][4];
    assign io_out_QSV_5_0 = r_re[6][5];
    assign io_out_QSV_5_1 = r_im[6][5];
    assign io_out_QSV_6_0 = r_re[6][6];
    assign io_out_QSV_6_1 = r_im[6][6];
    assign io_out_QSV_7_0 = r_re[6][7];
    assign io_out_QSV_7_1 = r_im[6][7];
    assign io_out_valid   = r_valid[6];

endmodule
