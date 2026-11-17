`default_nettype none

module Circuit_01 (
    input  wire        clock,
    input  wire        reset,
    input  wire [15:0] io_in_QSV_0_0,
    input  wire [15:0] io_in_QSV_0_1,
    input  wire [15:0] io_in_QSV_1_0,
    input  wire [15:0] io_in_QSV_1_1,
    input  wire [15:0] io_in_QSV_2_0,
    input  wire [15:0] io_in_QSV_2_1,
    input  wire [15:0] io_in_QSV_3_0,
    input  wire [15:0] io_in_QSV_3_1,
    input  wire        io_in_valid,
    output wire [15:0] io_out_QSV_0_0,
    output wire [15:0] io_out_QSV_0_1,
    output wire [15:0] io_out_QSV_1_0,
    output wire [15:0] io_out_QSV_1_1,
    output wire [15:0] io_out_QSV_2_0,
    output wire [15:0] io_out_QSV_2_1,
    output wire [15:0] io_out_QSV_3_0,
    output wire [15:0] io_out_QSV_3_1,
    output wire        io_out_valid
);

    // --- Stage 1: Hadamard on Qubit 0 ---
    // Qubit 0 is the LSB, so we pair (00, 01) and (10, 11)
    
    // Sums and differences for real/imag parts
    wire signed [16:0] sum_r0  = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    wire signed [16:0] diff_r0 = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    wire signed [16:0] sum_i0  = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    wire signed [16:0] diff_i0 = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    wire signed [16:0] sum_r1  = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    wire signed [16:0] diff_r1 = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    wire signed [16:0] sum_i1  = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    wire signed [16:0] diff_i1 = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    // Products (1/sqrt(2) approx 23170 in Q1.15)
    wire signed [33:0] prod_sum_r0  = sum_r0  * 17'sd23170;
    wire signed [33:0] prod_diff_r0 = diff_r0 * 17'sd23170;
    wire signed [33:0] prod_sum_i0  = sum_i0  * 17'sd23170;
    wire signed [33:0] prod_diff_i0 = diff_i0 * 17'sd23170;

    wire signed [33:0] prod_sum_r1  = sum_r1  * 17'sd23170;
    wire signed [33:0] prod_diff_r1 = diff_r1 * 17'sd23170;
    wire signed [33:0] prod_sum_i1  = sum_i1  * 17'sd23170;
    wire signed [33:0] prod_diff_i1 = diff_i1 * 17'sd23170;

    // Registers for Stage 1
    reg [15:0] s1_QSV_0_0, s1_QSV_0_1;
    reg [15:0] s1_QSV_1_0, s1_QSV_1_1;
    reg [15:0] s1_QSV_2_0, s1_QSV_2_1;
    reg [15:0] s1_QSV_3_0, s1_QSV_3_1;
    reg        s1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s1_QSV_0_0 <= 16'd0;
            s1_QSV_0_1 <= 16'd0;
            s1_QSV_1_0 <= 16'd0;
            s1_QSV_1_1 <= 16'd0;
            s1_QSV_2_0 <= 16'd0;
            s1_QSV_2_1 <= 16'd0;
            s1_QSV_3_0 <= 16'd0;
            s1_QSV_3_1 <= 16'd0;
            s1_valid   <= 1'b0;
        end else begin
            s1_QSV_0_0 <= prod_sum_r0[30:15];
            s1_QSV_0_1 <= prod_sum_i0[30:15];
            s1_QSV_1_0 <= prod_diff_r0[30:15];
            s1_QSV_1_1 <= prod_diff_i0[30:15];
            s1_QSV_2_0 <= prod_sum_r1[30:15];
            s1_QSV_2_1 <= prod_sum_i1[30:15];
            s1_QSV_3_0 <= prod_diff_r1[30:15];
            s1_QSV_3_1 <= prod_diff_i1[30:15];
            s1_valid   <= io_in_valid;
        end
    end

    // --- Stage 2: Pauli-X on Qubit 1 ---
    // Qubit 1 is MSB, so swap (00, 10) and (01, 11)
    reg [15:0] s2_QSV_0_0, s2_QSV_0_1;
    reg [15:0] s2_QSV_1_0, s2_QSV_1_1;
    reg [15:0] s2_QSV_2_0, s2_QSV_2_1;
    reg [15:0] s2_QSV_3_0, s2_QSV_3_1;
    reg        s2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s2_QSV_0_0 <= 16'd0;
            s2_QSV_0_1 <= 16'd0;
            s2_QSV_1_0 <= 16'd0;
            s2_QSV_1_1 <= 16'd0;
            s2_QSV_2_0 <= 16'd0;
            s2_QSV_2_1 <= 16'd0;
            s2_QSV_3_0 <= 16'd0;
            s2_QSV_3_1 <= 16'd0;
            s2_valid   <= 1'b0;
        end else begin
            s2_QSV_0_0 <= s1_QSV_2_0;
            s2_QSV_0_1 <= s1_QSV_2_1;
            s2_QSV_1_0 <= s1_QSV_3_0;
            s2_QSV_1_1 <= s1_QSV_3_1;
            s2_QSV_2_0 <= s1_QSV_0_0;
            s2_QSV_2_1 <= s1_QSV_0_1;
            s2_QSV_3_0 <= s1_QSV_1_0;
            s2_QSV_3_1 <= s1_QSV_1_1;
            s2_valid   <= s1_valid;
        end
    end

    // --- Stage 3: SWAP(0, 1) ---
    // Swap qubit 0 and 1, so swap (01, 10) while (00) and (11) remain
    reg [15:0] s3_QSV_0_0, s3_QSV_0_1;
    reg [15:0] s3_QSV_1_0, s3_QSV_1_1;
    reg [15:0] s3_QSV_2_0, s3_QSV_2_1;
    reg [15:0] s3_QSV_3_0, s3_QSV_3_1;
    reg        s3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s3_QSV_0_0 <= 16'd0;
            s3_QSV_0_1 <= 16'd0;
            s3_QSV_1_0 <= 16'd0;
            s3_QSV_1_1 <= 16'd0;
            s3_QSV_2_0 <= 16'd0;
            s3_QSV_2_1 <= 16'd0;
            s3_QSV_3_0 <= 16'd0;
            s3_QSV_3_1 <= 16'd0;
            s3_valid   <= 1'b0;
        end else begin
            s3_QSV_0_0 <= s2_QSV_0_0;
            s3_QSV_0_1 <= s2_QSV_0_1;
            s3_QSV_1_0 <= s2_QSV_2_0;
            s3_QSV_1_1 <= s2_QSV_2_1;
            s3_QSV_2_0 <= s2_QSV_1_0;
            s3_QSV_2_1 <= s2_QSV_1_1;
            s3_QSV_3_0 <= s2_QSV_3_0;
            s3_QSV_3_1 <= s2_QSV_3_1;
            s3_valid   <= s2_valid;
        end
    end

    // Assign Outputs
    assign io_out_QSV_0_0 = s3_QSV_0_0;
    assign io_out_QSV_0_1 = s3_QSV_0_1;
    assign io_out_QSV_1_0 = s3_QSV_1_0;
    assign io_out_QSV_1_1 = s3_QSV_1_1;
    assign io_out_QSV_2_0 = s3_QSV_2_0;
    assign io_out_QSV_2_1 = s3_QSV_2_1;
    assign io_out_QSV_3_0 = s3_QSV_3_0;
    assign io_out_QSV_3_1 = s3_QSV_3_1;
    assign io_out_valid   = s3_valid;

endmodule
