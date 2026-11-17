`default_nettype none

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

    // Q1.15 constant for 1/sqrt(2)
    localparam logic signed [16:0] INV_SQRT2 = 17'sd23170;

    // --- Step 1: H(0) on QSV ---
    // Qubit 0 is LSB. Mix (0, 1) and (2, 3)
    logic signed [16:0] sum_01_r, diff_01_r;
    logic signed [16:0] sum_01_i, diff_01_i;
    logic signed [16:0] sum_23_r, diff_23_r;
    logic signed [16:0] sum_23_i, diff_23_i;

    assign sum_01_r = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    assign diff_01_r = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    assign sum_01_i = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    assign diff_01_i = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    assign sum_23_r = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    assign diff_23_r = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    assign sum_23_i = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    assign diff_23_i = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    logic signed [33:0] prod_sum_01_r, prod_diff_01_r;
    logic signed [33:0] prod_sum_01_i, prod_diff_01_i;
    logic signed [33:0] prod_sum_23_r, prod_diff_23_r;
    logic signed [33:0] prod_sum_23_i, prod_diff_23_i;

    assign prod_sum_01_r  = sum_01_r * INV_SQRT2;
    assign prod_diff_01_r = diff_01_r * INV_SQRT2;
    assign prod_sum_01_i  = sum_01_i * INV_SQRT2;
    assign prod_diff_01_i = diff_01_i * INV_SQRT2;

    assign prod_sum_23_r  = sum_23_r * INV_SQRT2;
    assign prod_diff_23_r = diff_23_r * INV_SQRT2;
    assign prod_sum_23_i  = sum_23_i * INV_SQRT2;
    assign prod_diff_23_i = diff_23_i * INV_SQRT2;

    logic signed [15:0] h0_v0_r, h0_v0_i;
    logic signed [15:0] h0_v1_r, h0_v1_i;
    logic signed [15:0] h0_v2_r, h0_v2_i;
    logic signed [15:0] h0_v3_r, h0_v3_i;

    assign h0_v0_r = prod_sum_01_r[30:15];
    assign h0_v0_i = prod_sum_01_i[30:15];
    assign h0_v1_r = prod_diff_01_r[30:15];
    assign h0_v1_i = prod_diff_01_i[30:15];

    assign h0_v2_r = prod_sum_23_r[30:15];
    assign h0_v2_i = prod_sum_23_i[30:15];
    assign h0_v3_r = prod_diff_23_r[30:15];
    assign h0_v3_i = prod_diff_23_i[30:15];

    // --- Step 2 & 3: X(1) followed by SWAP(0, 1) ---
    // Combined index mapping:
    // swap_v0 = h0_v2
    // swap_v1 = h0_v0
    // swap_v2 = h0_v3
    // swap_v3 = h0_v1

    logic [15:0] next_QSV_0_0, next_QSV_0_1;
    logic [15:0] next_QSV_1_0, next_QSV_1_1;
    logic [15:0] next_QSV_2_0, next_QSV_2_1;
    logic [15:0] next_QSV_3_0, next_QSV_3_1;

    assign next_QSV_0_0 = h0_v2_r;
    assign next_QSV_0_1 = h0_v2_i;
    assign next_QSV_1_0 = h0_v0_r;
    assign next_QSV_1_1 = h0_v0_i;
    assign next_QSV_2_0 = h0_v3_r;
    assign next_QSV_2_1 = h0_v3_i;
    assign next_QSV_3_0 = h0_v1_r;
    assign next_QSV_3_1 = h0_v1_i;

    // --- Output Registers ---
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_QSV_0_0 <= 16'h0000;
            io_out_QSV_0_1 <= 16'h0000;
            io_out_QSV_1_0 <= 16'h0000;
            io_out_QSV_1_1 <= 16'h0000;
            io_out_QSV_2_0 <= 16'h0000;
            io_out_QSV_2_1 <= 16'h0000;
            io_out_QSV_3_0 <= 16'h0000;
            io_out_QSV_3_1 <= 16'h0000;
            io_out_valid   <= 1'b0;
        end else begin
            io_out_valid   <= io_in_valid;
            if (io_in_valid) begin
                io_out_QSV_0_0 <= next_QSV_0_0;
                io_out_QSV_0_1 <= next_QSV_0_1;
                io_out_QSV_1_0 <= next_QSV_1_0;
                io_out_QSV_1_1 <= next_QSV_1_1;
                io_out_QSV_2_0 <= next_QSV_2_0;
                io_out_QSV_2_1 <= next_QSV_2_1;
                io_out_QSV_3_0 <= next_QSV_3_0;
                io_out_QSV_3_1 <= next_QSV_3_1;
            end
        end
    end

endmodule
