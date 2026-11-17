module Circuit_05 (
    input  logic        clock,
    input  logic        reset,
    input  logic [15:0] io_in_QSV_0_0,
    input  logic [15:0] io_in_QSV_0_1,
    input  logic [15:0] io_in_QSV_1_0,
    input  logic [15:0] io_in_QSV_1_1,
    input  logic [15:0] io_in_QSV_2_0,
    input  logic [15:0] io_in_QSV_2_1,
    input  logic [15:0] io_in_QSV_3_0,
    input  logic [15:0] io_in_QSV_3_1,
    input  logic        io_in_valid,
    output logic [15:0] io_out_QSV_0_0,
    output logic [15:0] io_out_QSV_0_1,
    output logic [15:0] io_out_QSV_1_0,
    output logic [15:0] io_out_QSV_1_1,
    output logic [15:0] io_out_QSV_2_0,
    output logic [15:0] io_out_QSV_2_1,
    output logic [15:0] io_out_QSV_3_0,
    output logic [15:0] io_out_QSV_3_1,
    output logic        io_out_valid
);

    // --- STAGE 1: H on q0 ---
    wire signed [16:0] sum_0_1_re = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    wire signed [16:0] diff_0_1_re = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    wire signed [16:0] sum_0_1_im = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    wire signed [16:0] diff_0_1_im = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    wire signed [33:0] prod_sum_0_1_re = sum_0_1_re * 17'sd23170;
    wire signed [33:0] prod_diff_0_1_re = diff_0_1_re * 17'sd23170;
    wire signed [33:0] prod_sum_0_1_im = sum_0_1_im * 17'sd23170;
    wire signed [33:0] prod_diff_0_1_im = diff_0_1_im * 17'sd23170;

    wire signed [16:0] sum_2_3_re = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    wire signed [16:0] diff_2_3_re = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    wire signed [16:0] sum_2_3_im = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    wire signed [16:0] diff_2_3_im = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    wire signed [33:0] prod_sum_2_3_re = sum_2_3_re * 17'sd23170;
    wire signed [33:0] prod_diff_2_3_re = diff_2_3_re * 17'sd23170;
    wire signed [33:0] prod_sum_2_3_im = sum_2_3_im * 17'sd23170;
    wire signed [33:0] prod_diff_2_3_im = diff_2_3_im * 17'sd23170;

    logic [15:0] qsv_0_0_s1, qsv_0_1_s1, qsv_1_0_s1, qsv_1_1_s1, qsv_2_0_s1, qsv_2_1_s1, qsv_3_0_s1, qsv_3_1_s1;
    logic val_s1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            qsv_0_0_s1 <= 16'd0;
            qsv_0_1_s1 <= 16'd0;
            qsv_1_0_s1 <= 16'd0;
            qsv_1_1_s1 <= 16'd0;
            qsv_2_0_s1 <= 16'd0;
            qsv_2_1_s1 <= 16'd0;
            qsv_3_0_s1 <= 16'd0;
            qsv_3_1_s1 <= 16'd0;
            val_s1     <= 1'b0;
        end else begin
            val_s1 <= io_in_valid;
            if (io_in_valid) begin
                qsv_0_0_s1 <= prod_sum_0_1_re[30:15];
                qsv_0_1_s1 <= prod_sum_0_1_im[30:15];
                qsv_1_0_s1 <= prod_diff_0_1_re[30:15];
                qsv_1_1_s1 <= prod_diff_0_1_im[30:15];
                qsv_2_0_s1 <= prod_sum_2_3_re[30:15];
                qsv_2_1_s1 <= prod_sum_2_3_im[30:15];
                qsv_3_0_s1 <= prod_diff_2_3_re[30:15];
                qsv_3_1_s1 <= prod_diff_2_3_im[30:15];
            end
        end
    end

    // --- STAGE 2: X on q1 ---
    logic [15:0] qsv_0_0_s2, qsv_0_1_s2, qsv_1_0_s2, qsv_1_1_s2, qsv_2_0_s2, qsv_2_1_s2, qsv_3_0_s2, qsv_3_1_s2;
    logic val_s2;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            qsv_0_0_s2 <= 16'd0;
            qsv_0_1_s2 <= 16'd0;
            qsv_1_0_s2 <= 16'd0;
            qsv_1_1_s2 <= 16'd0;
            qsv_2_0_s2 <= 16'd0;
            qsv_2_1_s2 <= 16'd0;
            qsv_3_0_s2 <= 16'd0;
            qsv_3_1_s2 <= 16'd0;
            val_s2     <= 1'b0;
        end else begin
            val_s2 <= val_s1;
            if (val_s1) begin
                qsv_0_0_s2 <= qsv_2_0_s1;
                qsv_0_1_s2 <= qsv_2_1_s1;
                qsv_1_0_s2 <= qsv_3_0_s1;
                qsv_1_1_s2 <= qsv_3_1_s1;
                qsv_2_0_s2 <= qsv_0_0_s1;
                qsv_2_1_s2 <= qsv_0_1_s1;
                qsv_3_0_s2 <= qsv_1_0_s1;
                qsv_3_1_s2 <= qsv_1_1_s1;
            end
        end
    end

    // --- STAGE 3: SXdg on q1 ---
    wire signed [17:0] sum_0_2_r0 = $signed(qsv_0_0_s2) + $signed(qsv_0_1_s2) + $signed(qsv_2_0_s2) - $signed(qsv_2_1_s2);
    wire signed [17:0] shifted_0_2_r0 = sum_0_2_r0 >>> 1;
    wire [15:0] res_0_2_r0 = shifted_0_2_r0[15:0];

    wire signed [17:0] sum_0_2_i0 = $signed(qsv_0_1_s2) - $signed(qsv_0_0_s2) + $signed(qsv_2_1_s2) + $signed(qsv_2_0_s2);
    wire signed [17:0] shifted_0_2_i0 = sum_0_2_i0 >>> 1;
    wire [15:0] res_0_2_i0 = shifted_0_2_i0[15:0];

    wire signed [17:0] sum_0_2_r1 = $signed(qsv_0_0_s2) - $signed(qsv_0_1_s2) + $signed(qsv_2_0_s2) + $signed(qsv_2_1_s2);
    wire signed [17:0] shifted_0_2_r1 = sum_0_2_r1 >>> 1;
    wire [15:0] res_0_2_r1 = shifted_0_2_r1[15:0];

    wire signed [17:0] sum_0_2_i1 = $signed(qsv_0_1_s2) + $signed(qsv_0_0_s2) + $signed(qsv_2_1_s2) - $signed(qsv_2_0_s2);
    wire signed [17:0] shifted_0_2_i1 = sum_0_2_i1 >>> 1;
    wire [15:0] res_0_2_i1 = shifted_0_2_i1[15:0];

    wire signed [17:0] sum_1_3_r0 = $signed(qsv_1_0_s2) + $signed(qsv_1_1_s2) + $signed(qsv_3_0_s2) - $signed(qsv_3_1_s2);
    wire signed [17:0] shifted_1_3_r0 = sum_1_3_r0 >>> 1;
    wire [15:0] res_1_3_r0 = shifted_1_3_r0[15:0];

    wire signed [17:0] sum_1_3_i0 = $signed(qsv_1_1_s2) - $signed(qsv_1_0_s2) + $signed(qsv_3_1_s2) + $signed(qsv_3_0_s2);
    wire signed [17:0] shifted_1_3_i0 = sum_1_3_i0 >>> 1;
    wire [15:0] res_1_3_i0 = shifted_1_3_i0[15:0];

    wire signed [17:0] sum_1_3_r1 = $signed(qsv_1_0_s2) - $signed(qsv_1_1_s2) + $signed(qsv_3_0_s2) + $signed(qsv_3_1_s2);
    wire signed [17:0] shifted_1_3_r1 = sum_1_3_r1 >>> 1;
    wire [15:0] res_1_3_r1 = shifted_1_3_r1[15:0];

    wire signed [17:0] sum_1_3_i1 = $signed(qsv_1_1_s2) + $signed(qsv_1_0_s2) + $signed(qsv_3_1_s2) - $signed(qsv_3_0_s2);
    wire signed [17:0] shifted_1_3_i1 = sum_1_3_i1 >>> 1;
    wire [15:0] res_1_3_i1 = shifted_1_3_i1[15:0];

    logic [15:0] qsv_0_0_s3, qsv_0_1_s3, qsv_1_0_s3, qsv_1_1_s3, qsv_2_0_s3, qsv_2_1_s3, qsv_3_0_s3, qsv_3_1_s3;
    logic val_s3;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            qsv_0_0_s3 <= 16'd0;
            qsv_0_1_s3 <= 16'd0;
            qsv_1_0_s3 <= 16'd0;
            qsv_1_1_s3 <= 16'd0;
            qsv_2_0_s3 <= 16'd0;
            qsv_2_1_s3 <= 16'd0;
            qsv_3_0_s3 <= 16'd0;
            qsv_3_1_s3 <= 16'd0;
            val_s3     <= 1'b0;
        end else begin
            val_s3 <= val_s2;
            if (val_s2) begin
                qsv_0_0_s3 <= res_0_2_r0;
                qsv_0_1_s3 <= res_0_2_i0;
                qsv_1_0_s3 <= res_1_3_r0;
                qsv_1_1_s3 <= res_1_3_i0;
                qsv_2_0_s3 <= res_0_2_r1;
                qsv_2_1_s3 <= res_0_2_i1;
                qsv_3_0_s3 <= res_1_3_r1;
                qsv_3_1_s3 <= res_1_3_i1;
            end
        end
    end

    // --- STAGE 4: SWAP on q0 and q1 ---
    logic [15:0] qsv_0_0_s4, qsv_0_1_s4, qsv_1_0_s4, qsv_1_1_s4, qsv_2_0_s4, qsv_2_1_s4, qsv_3_0_s4, qsv_3_1_s4;
    logic val_s4;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            qsv_0_0_s4 <= 16'd0;
            qsv_0_1_s4 <= 16'd0;
            qsv_1_0_s4 <= 16'd0;
            qsv_1_1_s4 <= 16'd0;
            qsv_2_0_s4 <= 16'd0;
            qsv_2_1_s4 <= 16'd0;
            qsv_3_0_s4 <= 16'd0;
            qsv_3_1_s4 <= 16'd0;
            val_s4     <= 1'b0;
        end else begin
            val_s4 <= val_s3;
            if (val_s3) begin
                qsv_0_0_s4 <= qsv_0_0_s3;
                qsv_0_1_s4 <= qsv_0_1_s3;
                qsv_1_0_s4 <= qsv_2_0_s3;
                qsv_1_1_s4 <= qsv_2_1_s3;
                qsv_2_0_s4 <= qsv_1_0_s3;
                qsv_2_1_s4 <= qsv_1_1_s3;
                qsv_3_0_s4 <= qsv_3_0_s3;
                qsv_3_1_s4 <= qsv_3_1_s3;
            end
        end
    end

    // --- Output Assignments ---
    assign io_out_QSV_0_0 = qsv_0_0_s4;
    assign io_out_QSV_0_1 = qsv_0_1_s4;
    assign io_out_QSV_1_0 = qsv_1_0_s4;
    assign io_out_QSV_1_1 = qsv_1_1_s4;
    assign io_out_QSV_2_0 = qsv_2_0_s4;
    assign io_out_QSV_2_1 = qsv_2_1_s4;
    assign io_out_QSV_3_0 = qsv_3_0_s4;
    assign io_out_QSV_3_1 = qsv_3_1_s4;
    assign io_out_valid   = val_s4;

endmodule
