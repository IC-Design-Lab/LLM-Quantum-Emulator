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

    // Q1.15 representation of 1/sqrt(2) approx 0.70710678 * 32768 = 23170
    localparam logic signed [15:0] SQRT_1_2 = 16'sd23170;

    // Sums for Hadamard stage on qubit 0
    logic signed [16:0] sum_0_0, sum_0_1;
    logic signed [16:0] sum_1_0, sum_1_1;
    logic signed [16:0] sum_2_0, sum_2_1;
    logic signed [16:0] sum_3_0, sum_3_1;

    // Multiplier products
    logic signed [32:0] prod_0_0, prod_0_1;
    logic signed [32:0] prod_1_0, prod_1_1;
    logic signed [32:0] prod_2_0, prod_2_1;
    logic signed [32:0] prod_3_0, prod_3_1;

    // Registers for Stage 1 (after Hadamard gate)
    logic signed [15:0] h_v0_0, h_v0_1;
    logic signed [15:0] h_v1_0, h_v1_1;
    logic signed [15:0] h_v2_0, h_v2_1;
    logic signed [15:0] h_v3_0, h_v3_1;
    logic               valid_r1;

    // Combinational Sums
    assign sum_0_0 = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    assign sum_0_1 = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    assign sum_1_0 = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    assign sum_1_1 = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);
    assign sum_2_0 = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    assign sum_2_1 = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    assign sum_3_0 = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    assign sum_3_1 = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    // Combinational Products
    assign prod_0_0 = sum_0_0 * SQRT_1_2;
    assign prod_0_1 = sum_0_1 * SQRT_1_2;
    assign prod_1_0 = sum_1_0 * SQRT_1_2;
    assign prod_1_1 = sum_1_1 * SQRT_1_2;
    assign prod_2_0 = sum_2_0 * SQRT_1_2;
    assign prod_2_1 = sum_2_1 * SQRT_1_2;
    assign prod_3_0 = sum_3_0 * SQRT_1_2;
    assign prod_3_1 = sum_3_1 * SQRT_1_2;

    // Stage 1 Registers (Hadamard Output)
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            h_v0_0   <= 16'sb0;
            h_v0_1   <= 16'sb0;
            h_v1_0   <= 16'sb0;
            h_v1_1   <= 16'sb0;
            h_v2_0   <= 16'sb0;
            h_v2_1   <= 16'sb0;
            h_v3_0   <= 16'sb0;
            h_v3_1   <= 16'sb0;
            valid_r1 <= 1'b0;
        end else begin
            h_v0_0   <= prod_0_0[30:15];
            h_v0_1   <= prod_0_1[30:15];
            h_v1_0   <= prod_1_0[30:15];
            h_v1_1   <= prod_1_1[30:15];
            h_v2_0   <= prod_2_0[30:15];
            h_v2_1   <= prod_2_1[30:15];
            h_v3_0   <= prod_3_0[30:15];
            h_v3_1   <= prod_3_1[30:15];
            valid_r1 <= io_in_valid;
        end
    end

    // Stage 2 Registers with incorporated permutation (X and SWAP gates)
    // Permutation mapping:
    // v0_out = h_v2
    // v1_out = h_v0
    // v2_out = h_v3
    // v3_out = h_v1
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_QSV_0_0 <= 16'sb0;
            io_out_QSV_0_1 <= 16'sb0;
            io_out_QSV_1_0 <= 16'sb0;
            io_out_QSV_1_1 <= 16'sb0;
            io_out_QSV_2_0 <= 16'sb0;
            io_out_QSV_2_1 <= 16'sb0;
            io_out_QSV_3_0 <= 16'sb0;
            io_out_QSV_3_1 <= 16'sb0;
            io_out_valid   <= 1'b0;
        end else begin
            io_out_QSV_0_0 <= h_v2_0;
            io_out_QSV_0_1 <= h_v2_1;
            io_out_QSV_1_0 <= h_v0_0;
            io_out_QSV_1_1 <= h_v0_1;
            io_out_QSV_2_0 <= h_v3_0;
            io_out_QSV_2_1 <= h_v3_1;
            io_out_QSV_3_0 <= h_v1_0;
            io_out_QSV_3_1 <= h_v1_1;
            io_out_valid   <= valid_r1;
        end
    end

endmodule
