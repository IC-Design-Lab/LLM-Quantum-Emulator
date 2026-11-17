`timescale 1ns / 1ps

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

    // Intermediate signals for Hadamard gate on qubit 0
    logic signed [16:0] sum_r_01, diff_r_01;
    logic signed [16:0] sum_i_01, diff_i_01;
    logic signed [16:0] sum_r_23, diff_r_23;
    logic signed [16:0] sum_i_23, diff_i_23;

    logic signed [33:0] prod_r_01_sum, prod_r_01_diff;
    logic signed [33:0] prod_i_01_sum, prod_i_01_diff;
    logic signed [33:0] prod_r_23_sum, prod_r_23_diff;
    logic signed [33:0] prod_i_23_sum, prod_i_23_diff;

    // Fixed-point scaling constant 1/sqrt(2) in Q1.15 represented as 17-bit signed
    localparam logic signed [16:0] H_COEFF = 17'sd23170;

    assign sum_r_01 = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    assign diff_r_01 = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    assign sum_i_01 = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    assign diff_i_01 = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    assign sum_r_23 = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    assign diff_r_23 = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    assign sum_i_23 = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    assign diff_i_23 = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    assign prod_r_01_sum  = sum_r_01  * H_COEFF;
    assign prod_r_01_diff = diff_r_01 * H_COEFF;
    assign prod_i_01_sum  = sum_i_01  * H_COEFF;
    assign prod_i_01_diff = diff_i_01 * H_COEFF;

    assign prod_r_23_sum  = sum_r_23  * H_COEFF;
    assign prod_r_23_diff = diff_r_23 * H_COEFF;
    assign prod_i_23_sum  = sum_i_23  * H_COEFF;
    assign prod_i_23_diff = diff_i_23 * H_COEFF;

    // Pipeline Stage 1 Registers (Hadamard Outputs)
    logic        valid_stg1;
    logic [15:0] r0_stg1, i0_stg1;
    logic [15:0] r1_stg1, i1_stg1;
    logic [15:0] r2_stg1, i2_stg1;
    logic [15:0] r3_stg1, i3_stg1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            valid_stg1 <= 1'b0;
            r0_stg1    <= 16'd0;
            i0_stg1    <= 16'd0;
            r1_stg1    <= 16'd0;
            i1_stg1    <= 16'd0;
            r2_stg1    <= 16'd0;
            i2_stg1    <= 16'd0;
            r3_stg1    <= 16'd0;
            i3_stg1    <= 16'd0;
        end else begin
            valid_stg1 <= io_in_valid;
            if (io_in_valid) begin
                r0_stg1 <= prod_r_01_sum[30:15];
                i0_stg1 <= prod_i_01_sum[30:15];
                r1_stg1 <= prod_r_01_diff[30:15];
                i1_stg1 <= prod_i_01_diff[30:15];
                r2_stg1 <= prod_r_23_sum[30:15];
                i2_stg1 <= prod_i_23_sum[30:15];
                r3_stg1 <= prod_r_23_diff[30:15];
                i3_stg1 <= prod_i_23_diff[30:15];
            end
        end
    end

    // Pipeline Stage 2 Registers (CX(0,1) Swap & Output Alignment)
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_valid   <= 1'b0;
            io_out_QSV_0_0 <= 16'd0;
            io_out_QSV_0_1 <= 16'd0;
            io_out_QSV_1_0 <= 16'd0;
            io_out_QSV_1_1 <= 16'd0;
            io_out_QSV_2_0 <= 16'd0;
            io_out_QSV_2_1 <= 16'd0;
            io_out_QSV_3_0 <= 16'd0;
            io_out_QSV_3_1 <= 16'd0;
        end else begin
            io_out_valid <= valid_stg1;
            if (valid_stg1) begin
                io_out_QSV_0_0 <= r0_stg1;
                io_out_QSV_0_1 <= i0_stg1;
                io_out_QSV_1_0 <= r3_stg1; // Swap state 1 and 3 due to CNOT(0,1)
                io_out_QSV_1_1 <= i3_stg1;
                io_out_QSV_2_0 <= r2_stg1;
                io_out_QSV_2_1 <= i2_stg1;
                io_out_QSV_3_0 <= r1_stg1; // Swap state 1 and 3 due to CNOT(0,1)
                io_out_QSV_3_1 <= i1_stg1;
            end
        end
    end

endmodule
