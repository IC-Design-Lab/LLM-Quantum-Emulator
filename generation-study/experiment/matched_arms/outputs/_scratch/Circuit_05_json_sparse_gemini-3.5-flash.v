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

    // Cast inputs to signed values
    wire signed [15:0] in_s0_r = io_in_QSV_0_0;
    wire signed [15:0] in_s0_i = io_in_QSV_0_1;
    wire signed [15:0] in_s1_r = io_in_QSV_1_0;
    wire signed [15:0] in_s1_i = io_in_QSV_1_1;
    wire signed [15:0] in_s2_r = io_in_QSV_2_0;
    wire signed [15:0] in_s2_i = io_in_QSV_2_1;
    wire signed [15:0] in_s3_r = io_in_QSV_3_0;
    wire signed [15:0] in_s3_i = io_in_QSV_3_1;

    // ==========================================
    // STAGE 0: H on Qubit 0
    // ==========================================
    // 1/sqrt(2) approx 23170 in Q1.15
    localparam logic signed [15:0] H_COEFF = 16'sd23170;

    wire signed [16:0] sum0_r = in_s0_r + in_s1_r;
    wire signed [16:0] sum0_i = in_s0_i + in_s1_i;
    wire signed [16:0] diff0_r = in_s0_r - in_s1_r;
    wire signed [16:0] diff0_i = in_s0_i - in_s1_i;

    wire signed [16:0] sum1_r = in_s2_r + in_s3_r;
    wire signed [16:0] sum1_i = in_s2_i + in_s3_i;
    wire signed [16:0] diff1_r = in_s2_r - in_s3_r;
    wire signed [16:0] diff1_i = in_s2_i - in_s3_i;

    wire signed [32:0] prod0_r = sum0_r * H_COEFF;
    wire signed [32:0] prod0_i = sum0_i * H_COEFF;
    wire signed [32:0] prod1_r = diff0_r * H_COEFF;
    wire signed [32:0] prod1_i = diff0_i * H_COEFF;

    wire signed [32:0] prod2_r = sum1_r * H_COEFF;
    wire signed [32:0] prod2_i = sum1_i * H_COEFF;
    wire signed [32:0] prod3_r = diff1_r * H_COEFF;
    wire signed [32:0] prod3_i = diff1_i * H_COEFF;

    logic signed [15:0] r0_s0_r, r0_s0_i;
    logic signed [15:0] r0_s1_r, r0_s1_i;
    logic signed [15:0] r0_s2_r, r0_s2_i;
    logic signed [15:0] r0_s3_r, r0_s3_i;
    logic r0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_s0_r  <= 16'sd0;
            r0_s0_i  <= 16'sd0;
            r0_s1_r  <= 16'sd0;
            r0_s1_i  <= 16'sd0;
            r0_s2_r  <= 16'sd0;
            r0_s2_i  <= 16'sd0;
            r0_s3_r  <= 16'sd0;
            r0_s3_i  <= 16'sd0;
            r0_valid <= 1'b0;
        end else begin
            r0_s0_r  <= prod0_r[30:15];
            r0_s0_i  <= prod0_i[30:15];
            r0_s1_r  <= prod1_r[30:15];
            r0_s1_i  <= prod1_i[30:15];
            r0_s2_r  <= prod2_r[30:15];
            r0_s2_i  <= prod2_i[30:15];
            r0_s3_r  <= prod3_r[30:15];
            r0_s3_i  <= prod3_i[30:15];
            r0_valid <= io_in_valid;
        end
    end

    // ==========================================
    // STAGE 1: X on Qubit 1
    // ==========================================
    // Swaps index 0 <-> 2, and 1 <-> 3
    logic signed [15:0] r1_s0_r, r1_s0_i;
    logic signed [15:0] r1_s1_r, r1_s1_i;
    logic signed [15:0] r1_s2_r, r1_s2_i;
    logic signed [15:0] r1_s3_r, r1_s3_i;
    logic r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_s0_r  <= 16'sd0;
            r1_s0_i  <= 16'sd0;
            r1_s1_r  <= 16'sd0;
            r1_s1_i  <= 16'sd0;
            r1_s2_r  <= 16'sd0;
            r1_s2_i  <= 16'sd0;
            r1_s3_r  <= 16'sd0;
            r1_s3_i  <= 16'sd0;
            r1_valid <= 1'b0;
        end else begin
            r1_s0_r  <= r0_s2_r;
            r1_s0_i  <= r0_s2_i;
            r1_s1_r  <= r0_s3_r;
            r1_s1_i  <= r0_s3_i;
            r1_s2_r  <= r0_s0_r;
            r1_s2_i  <= r0_s0_i;
            r1_s3_r  <= r0_s1_r;
            r1_s3_i  <= r0_s1_i;
            r1_valid <= r0_valid;
        end
    end

    // ==========================================
    // STAGE 2: SXDG on Qubit 1
    // ==========================================
    // Pair 1: a=s0, b=s2.  Pair 2: a=s1, b=s3.
    wire signed [17:0] sxdg_s0_r_sum = $signed(r1_s0_r) + $signed(r1_s0_i) + $signed(r1_s2_r) - $signed(r1_s2_i);
    wire signed [17:0] sxdg_s0_i_sum = $signed(r1_s0_i) - $signed(r1_s0_r) + $signed(r1_s2_r) + $signed(r1_s2_i);
    wire signed [17:0] sxdg_s2_r_sum = $signed(r1_s0_r) - $signed(r1_s0_i) + $signed(r1_s2_r) + $signed(r1_s2_i);
    wire signed [17:0] sxdg_s2_i_sum = $signed(r1_s0_r) + $signed(r1_s0_i) + $signed(r1_s2_i) - $signed(r1_s2_r);

    wire signed [17:0] sxdg_s1_r_sum = $signed(r1_s1_r) + $signed(r1_s1_i) + $signed(r1_s3_r) - $signed(r1_s3_i);
    wire signed [17:0] sxdg_s1_i_sum = $signed(r1_s1_i) - $signed(r1_s1_r) + $signed(r1_s3_r) + $signed(r1_s3_i);
    wire signed [17:0] sxdg_s3_r_sum = $signed(r1_s1_r) - $signed(r1_s1_i) + $signed(r1_s3_r) + $signed(r1_s3_i);
    wire signed [17:0] sxdg_s3_i_sum = $signed(r1_s1_r) + $signed(r1_s1_i) + $signed(r1_s3_i) - $signed(r1_s3_r);

    logic signed [15:0] r2_s0_r, r2_s0_i;
    logic signed [15:0] r2_s1_r, r2_s1_i;
    logic signed [15:0] r2_s2_r, r2_s2_i;
    logic signed [15:0] r2_s3_r, r2_s3_i;
    logic r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_s0_r  <= 16'sd0;
            r2_s0_i  <= 16'sd0;
            r2_s1_r  <= 16'sd0;
            r2_s1_i  <= 16'sd0;
            r2_s2_r  <= 16'sd0;
            r2_s2_i  <= 16'sd0;
            r2_s3_r  <= 16'sd0;
            r2_s3_i  <= 16'sd0;
            r2_valid <= 1'b0;
        end else begin
            r2_s0_r  <= sxdg_s0_r_sum >>> 1;
            r2_s0_i  <= sxdg_s0_i_sum >>> 1;
            r2_s2_r  <= sxdg_s2_r_sum >>> 1;
            r2_s2_i  <= sxdg_s2_i_sum >>> 1;

            r2_s1_r  <= sxdg_s1_r_sum >>> 1;
            r2_s1_i  <= sxdg_s1_i_sum >>> 1;
            r2_s3_r  <= sxdg_s3_r_sum >>> 1;
            r2_s3_i  <= sxdg_s3_i_sum >>> 1;

            r2_valid <= r1_valid;
        end
    end

    // ==========================================
    // STAGE 3: SWAP on Q0 and Q1
    // ==========================================
    // Swaps index 1 <-> 2, index 0 and 3 unchanged
    logic signed [15:0] r3_s0_r, r3_s0_i;
    logic signed [15:0] r3_s1_r, r3_s1_i;
    logic signed [15:0] r3_s2_r, r3_s2_i;
    logic signed [15:0] r3_s3_r, r3_s3_i;
    logic r3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_s0_r  <= 16'sd0;
            r3_s0_i  <= 16'sd0;
            r3_s1_r  <= 16'sd0;
            r3_s1_i  <= 16'sd0;
            r3_s2_r  <= 16'sd0;
            r3_s2_i  <= 16'sd0;
            r3_s3_r  <= 16'sd0;
            r3_s3_i  <= 16'sd0;
            r3_valid <= 1'b0;
        end else begin
            r3_s0_r  <= r2_s0_r;
            r3_s0_i  <= r2_s0_i;
            r3_s1_r  <= r2_s2_r;
            r3_s1_i  <= r2_s2_i;
            r3_s2_r  <= r2_s1_r;
            r3_s2_i  <= r2_s1_i;
            r3_s3_r  <= r2_s3_r;
            r3_s3_i  <= r2_s3_i;
            r3_valid <= r2_valid;
        end
    end

    // Output assignments
    assign io_out_QSV_0_0 = r3_s0_r;
    assign io_out_QSV_0_1 = r3_s0_i;
    assign io_out_QSV_1_0 = r3_s1_r;
    assign io_out_QSV_1_1 = r3_s1_i;
    assign io_out_QSV_2_0 = r3_s2_r;
    assign io_out_QSV_2_1 = r3_s2_i;
    assign io_out_QSV_3_0 = r3_s3_r;
    assign io_out_QSV_3_1 = r3_s3_i;
    assign io_out_valid   = r3_valid;

endmodule
