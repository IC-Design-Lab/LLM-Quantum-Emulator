module Circuit_01 (
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

    // Stage 0 registers (Input Capture)
    logic [15:0] r00_s0, i00_s0, r01_s0, i01_s0, r10_s0, i10_s0, r11_s0, i11_s0;
    logic valid_s0;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r00_s0   <= '0;
            i00_s0   <= '0;
            r01_s0   <= '0;
            i01_s0   <= '0;
            r10_s0   <= '0;
            i10_s0   <= '0;
            r11_s0   <= '0;
            i11_s0   <= '0;
            valid_s0 <= 1'b0;
        end else begin
            valid_s0 <= io_in_valid;
            if (io_in_valid) begin
                r00_s0 <= io_in_QSV_0_0;
                i00_s0 <= io_in_QSV_0_1;
                r01_s0 <= io_in_QSV_1_0;
                i01_s0 <= io_in_QSV_1_1;
                r10_s0 <= io_in_QSV_2_0;
                i10_s0 <= io_in_QSV_2_1;
                r11_s0 <= io_in_QSV_3_0;
                i11_s0 <= io_in_QSV_3_1;
            end
        end
    end

    // Stage 1 (H on Qubit 0)
    // 1/sqrt(2) approx in Q1.15 is 23170 (0x5A82)
    localparam logic signed [16:0] INV_SQRT2 = 17'sd23170;

    wire signed [16:0] sum_r0_01  = $signed(r00_s0) + $signed(r01_s0);
    wire signed [16:0] diff_r0_01 = $signed(r00_s0) - $signed(r01_s0);
    wire signed [33:0] prod_sum_r0_01  = sum_r0_01  * INV_SQRT2;
    wire signed [33:0] prod_diff_r0_01 = diff_r0_01 * INV_SQRT2;

    wire signed [16:0] sum_i0_01  = $signed(i00_s0) + $signed(i01_s0);
    wire signed [16:0] diff_i0_01 = $signed(i00_s0) - $signed(i01_s0);
    wire signed [33:0] prod_sum_i0_01  = sum_i0_01  * INV_SQRT2;
    wire signed [33:0] prod_diff_i0_01 = diff_i0_01 * INV_SQRT2;

    wire signed [16:0] sum_r1_01  = $signed(r10_s0) + $signed(r11_s0);
    wire signed [16:0] diff_r1_01 = $signed(r10_s0) - $signed(r11_s0);
    wire signed [33:0] prod_sum_r1_01  = sum_r1_01  * INV_SQRT2;
    wire signed [33:0] prod_diff_r1_01 = diff_r1_01 * INV_SQRT2;

    wire signed [16:0] sum_i1_01  = $signed(i10_s0) + $signed(i11_s0);
    wire signed [16:0] diff_i1_01 = $signed(i10_s0) - $signed(i11_s0);
    wire signed [33:0] prod_sum_i1_01  = sum_i1_01  * INV_SQRT2;
    wire signed [33:0] prod_diff_i1_01 = diff_i1_01 * INV_SQRT2;

    logic [15:0] r00_s1, i00_s1, r01_s1, i01_s1, r10_s1, i10_s1, r11_s1, i11_s1;
    logic valid_s1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r00_s1   <= '0;
            i00_s1   <= '0;
            r01_s1   <= '0;
            i01_s1   <= '0;
            r10_s1   <= '0;
            i10_s1   <= '0;
            r11_s1   <= '0;
            i11_s1   <= '0;
            valid_s1 <= 1'b0;
        end else begin
            valid_s1 <= valid_s0;
            if (valid_s0) begin
                r00_s1 <= prod_sum_r0_01[30:15];
                i00_s1 <= prod_sum_i0_01[30:15];
                r01_s1 <= prod_diff_r0_01[30:15];
                i01_s1 <= prod_diff_i0_01[30:15];
                r10_s1 <= prod_sum_r1_01[30:15];
                i10_s1 <= prod_sum_i1_01[30:15];
                r11_s1 <= prod_diff_r1_01[30:15];
                i11_s1 <= prod_diff_i1_01[30:15];
            end
        end
    end

    // Stage 2 (X on Qubit 1)
    // Swaps states (00 <-> 10) and (01 <-> 11)
    logic [15:0] r00_s2, i00_s2, r01_s2, i01_s2, r10_s2, i10_s2, r11_s2, i11_s2;
    logic valid_s2;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r00_s2   <= '0;
            i00_s2   <= '0;
            r01_s2   <= '0;
            i01_s2   <= '0;
            r10_s2   <= '0;
            i10_s2   <= '0;
            r11_s2   <= '0;
            i11_s2   <= '0;
            valid_s2 <= 1'b0;
        end else begin
            valid_s2 <= valid_s1;
            if (valid_s1) begin
                r00_s2 <= r10_s1;
                i00_s2 <= i10_s1;
                r01_s2 <= r11_s1;
                i01_s2 <= i11_s1;
                r10_s2 <= r00_s1;
                i10_s2 <= i00_s1;
                r11_s2 <= r01_s1;
                i11_s2 <= i01_s1;
            end
        end
    end

    // Stage 3 (SWAP on Qubit 0 and 1)
    // Swaps states (01 <-> 10), while 00 and 11 remain unchanged.
    logic [15:0] r00_s3, i00_s3, r01_s3, i01_s3, r10_s3, i10_s3, r11_s3, i11_s3;
    logic valid_s3;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r00_s3   <= '0;
            i00_s3   <= '0;
            r01_s3   <= '0;
            i01_s3   <= '0;
            r10_s3   <= '0;
            i10_s3   <= '0;
            r11_s3   <= '0;
            i11_s3   <= '0;
            valid_s3 <= 1'b0;
        end else begin
            valid_s3 <= valid_s2;
            if (valid_s2) begin
                r00_s3 <= r00_s2;
                i00_s3 <= i00_s2;
                r01_s3 <= r10_s2;
                i01_s3 <= i10_s2;
                r10_s3 <= r01_s2;
                i10_s3 <= i01_s2;
                r11_s3 <= r11_s2;
                i11_s3 <= i11_s2;
            end
        end
    end

    // Output assignments
    assign io_out_QSV_0_0 = r00_s3;
    assign io_out_QSV_0_1 = i00_s3;
    assign io_out_QSV_1_0 = r01_s3;
    assign io_out_QSV_1_1 = i01_s3;
    assign io_out_QSV_2_0 = r10_s3;
    assign io_out_QSV_2_1 = i10_s3;
    assign io_out_QSV_3_0 = r11_s3;
    assign io_out_QSV_3_1 = i11_s3;
    assign io_out_valid   = valid_s3;

endmodule
