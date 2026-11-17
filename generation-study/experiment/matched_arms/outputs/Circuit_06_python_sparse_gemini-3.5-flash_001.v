module Circuit_06 (
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

    // Stage 1: Input registers
    logic signed [15:0] r_in_QSV_0_0, r_in_QSV_0_1;
    logic signed [15:0] r_in_QSV_1_0, r_in_QSV_1_1;
    logic signed [15:0] r_in_QSV_2_0, r_in_QSV_2_1;
    logic signed [15:0] r_in_QSV_3_0, r_in_QSV_3_1;
    logic               r_in_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r_in_QSV_0_0 <= 16'sd0;
            r_in_QSV_0_1 <= 16'sd0;
            r_in_QSV_1_0 <= 16'sd0;
            r_in_QSV_1_1 <= 16'sd0;
            r_in_QSV_2_0 <= 16'sd0;
            r_in_QSV_2_1 <= 16'sd0;
            r_in_QSV_3_0 <= 16'sd0;
            r_in_QSV_3_1 <= 16'sd0;
            r_in_valid   <= 1'b0;
        end else begin
            r_in_QSV_0_0 <= $signed(io_in_QSV_0_0);
            r_in_QSV_0_1 <= $signed(io_in_QSV_0_1);
            r_in_QSV_1_0 <= $signed(io_in_QSV_1_0);
            r_in_QSV_1_1 <= $signed(io_in_QSV_1_1);
            r_in_QSV_2_0 <= $signed(io_in_QSV_2_0);
            r_in_QSV_2_1 <= $signed(io_in_QSV_2_1);
            r_in_QSV_3_0 <= $signed(io_in_QSV_3_0);
            r_in_QSV_3_1 <= $signed(io_in_QSV_3_1);
            r_in_valid   <= io_in_valid;
        end
    end

    // Stage 2: Hadamard calculation
    // H0 on Qubit 0 (acts on pairs (0,1) and (2,3))
    wire signed [16:0] sum_0_1_re  = r_in_QSV_0_0 + r_in_QSV_1_0;
    wire signed [16:0] diff_0_1_re = r_in_QSV_0_0 - r_in_QSV_1_0;
    wire signed [16:0] sum_0_1_im  = r_in_QSV_0_1 + r_in_QSV_1_1;
    wire signed [16:0] diff_0_1_im = r_in_QSV_0_1 - r_in_QSV_1_1;

    wire signed [16:0] sum_2_3_re  = r_in_QSV_2_0 + r_in_QSV_3_0;
    wire signed [16:0] diff_2_3_re = r_in_QSV_2_0 - r_in_QSV_3_0;
    wire signed [16:0] sum_2_3_im  = r_in_QSV_2_1 + r_in_QSV_3_1;
    wire signed [16:0] diff_2_3_im = r_in_QSV_2_1 - r_in_QSV_3_1;

    // Fixed-point scaling factor: 1/sqrt(2) approx 0.70710678 -> 23170 in Q1.15
    localparam logic signed [15:0] COEFF = 16'sd23170;

    wire signed [32:0] prod_sum_0_1_re  = sum_0_1_re * COEFF;
    wire signed [32:0] prod_diff_0_1_re = diff_0_1_re * COEFF;
    wire signed [32:0] prod_sum_0_1_im  = sum_0_1_im * COEFF;
    wire signed [32:0] prod_diff_0_1_im = diff_0_1_im * COEFF;

    wire signed [32:0] prod_sum_2_3_re  = sum_2_3_re * COEFF;
    wire signed [32:0] prod_diff_2_3_re = diff_2_3_re * COEFF;
    wire signed [32:0] prod_sum_2_3_im  = sum_2_3_im * COEFF;
    wire signed [32:0] prod_diff_2_3_im = diff_2_3_im * COEFF;

    logic signed [15:0] r_h0_0_0, r_h0_0_1;
    logic signed [15:0] r_h0_1_0, r_h0_1_1;
    logic signed [15:0] r_h0_2_0, r_h0_2_1;
    logic signed [15:0] r_h0_3_0, r_h0_3_1;
    logic               r_h0_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r_h0_0_0   <= 16'sd0;
            r_h0_0_1   <= 16'sd0;
            r_h0_1_0   <= 16'sd0;
            r_h0_1_1   <= 16'sd0;
            r_h0_2_0   <= 16'sd0;
            r_h0_2_1   <= 16'sd0;
            r_h0_3_0   <= 16'sd0;
            r_h0_3_1   <= 16'sd0;
            r_h0_valid <= 1'b0;
        end else begin
            r_h0_0_0   <= prod_sum_0_1_re[30:15];
            r_h0_0_1   <= prod_sum_0_1_im[30:15];
            r_h0_1_0   <= prod_diff_0_1_re[30:15];
            r_h0_1_1   <= prod_diff_0_1_im[30:15];
            r_h0_2_0   <= prod_sum_2_3_re[30:15];
            r_h0_2_1   <= prod_sum_2_3_im[30:15];
            r_h0_3_0   <= prod_diff_2_3_re[30:15];
            r_h0_3_1   <= prod_diff_2_3_im[30:15];
            r_h0_valid <= r_in_valid;
        end
    end

    // Stage 3: CX Gate (Permutes state 1 and 3) & Output Registers
    logic signed [15:0] r_out_QSV_0_0, r_out_QSV_0_1;
    logic signed [15:0] r_out_QSV_1_0, r_out_QSV_1_1;
    logic signed [15:0] r_out_QSV_2_0, r_out_QSV_2_1;
    logic signed [15:0] r_out_QSV_3_0, r_out_QSV_3_1;
    logic               r_out_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r_out_QSV_0_0 <= 16'sd0;
            r_out_QSV_0_1 <= 16'sd0;
            r_out_QSV_1_0 <= 16'sd0;
            r_out_QSV_1_1 <= 16'sd0;
            r_out_QSV_2_0 <= 16'sd0;
            r_out_QSV_2_1 <= 16'sd0;
            r_out_QSV_3_0 <= 16'sd0;
            r_out_QSV_3_1 <= 16'sd0;
            r_out_valid   <= 1'b0;
        end else begin
            r_out_QSV_0_0 <= r_h0_0_0;
            r_out_QSV_0_1 <= r_h0_0_1;
            r_out_QSV_1_0 <= r_h0_3_0; // CX maps state 1 (01) to state 3 (11)
            r_out_QSV_1_1 <= r_h0_3_1;
            r_out_QSV_2_0 <= r_h0_2_0;
            r_out_QSV_2_1 <= r_h0_2_1;
            r_out_QSV_3_0 <= r_h0_1_0; // CX maps state 3 (11) to state 1 (01)
            r_out_QSV_3_1 <= r_h0_1_1;
            r_out_valid   <= r_h0_valid;
        end
    end

    assign io_out_QSV_0_0 = r_out_QSV_0_0;
    assign io_out_QSV_0_1 = r_out_QSV_0_1;
    assign io_out_QSV_1_0 = r_out_QSV_1_0;
    assign io_out_QSV_1_1 = r_out_QSV_1_1;
    assign io_out_QSV_2_0 = r_out_QSV_2_0;
    assign io_out_QSV_2_1 = r_out_QSV_2_1;
    assign io_out_QSV_3_0 = r_out_QSV_3_0;
    assign io_out_QSV_3_1 = r_out_QSV_3_1;
    assign io_out_valid   = r_out_valid;

endmodule
