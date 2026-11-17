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

    localparam signed [15:0] COEFF = 16'd23170;

    // Cast inputs to signed
    wire signed [15:0] in_r0 = $signed(io_in_QSV_0_0);
    wire signed [15:0] in_i0 = $signed(io_in_QSV_0_1);
    wire signed [15:0] in_r1 = $signed(io_in_QSV_1_0);
    wire signed [15:0] in_i1 = $signed(io_in_QSV_1_1);
    wire signed [15:0] in_r2 = $signed(io_in_QSV_2_0);
    wire signed [15:0] in_i2 = $signed(io_in_QSV_2_1);
    wire signed [15:0] in_r3 = $signed(io_in_QSV_3_0);
    wire signed [15:0] in_i3 = $signed(io_in_QSV_3_1);

    // H-gate (Step 0) logic
    wire signed [16:0] sum_r01  = in_r0 + in_r1;
    wire signed [16:0] diff_r01 = in_r0 - in_r1;
    wire signed [16:0] sum_i01  = in_i0 + in_i1;
    wire signed [16:0] diff_i01 = in_i0 - in_i1;

    wire signed [16:0] sum_r23  = in_r2 + in_r3;
    wire signed [16:0] diff_r23 = in_r2 - in_r3;
    wire signed [16:0] sum_i23  = in_i2 + in_i3;
    wire signed [16:0] diff_i23 = in_i2 - in_i3;

    wire signed [32:0] prod_sum_r01  = sum_r01 * COEFF;
    wire signed [32:0] prod_diff_r01 = diff_r01 * COEFF;
    wire signed [32:0] prod_sum_i01  = sum_i01 * COEFF;
    wire signed [32:0] prod_diff_i01 = diff_i01 * COEFF;

    wire signed [32:0] prod_sum_r23  = sum_r23 * COEFF;
    wire signed [32:0] prod_diff_r23 = diff_r23 * COEFF;
    wire signed [32:0] prod_sum_i23  = sum_i23 * COEFF;
    wire signed [32:0] prod_diff_i23 = diff_i23 * COEFF;

    // Registers for Stage 1 (H Gate complete)
    logic signed [15:0] r0_stage1, i0_stage1;
    logic signed [15:0] r1_stage1, i1_stage1;
    logic signed [15:0] r2_stage1, i2_stage1;
    logic signed [15:0] r3_stage1, i3_stage1;
    logic               valid_stage1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_stage1    <= 16'd0;
            i0_stage1    <= 16'd0;
            r1_stage1    <= 16'd0;
            i1_stage1    <= 16'd0;
            r2_stage1    <= 16'd0;
            i2_stage1    <= 16'd0;
            r3_stage1    <= 16'd0;
            i3_stage1    <= 16'd0;
            valid_stage1 <= 1'b0;
        end else begin
            r0_stage1    <= 16'($signed(prod_sum_r01) >>> 15);
            i0_stage1    <= 16'($signed(prod_sum_i01) >>> 15);
            r1_stage1    <= 16'($signed(prod_diff_r01) >>> 15);
            i1_stage1    <= 16'($signed(prod_diff_i01) >>> 15);
            r2_stage1    <= 16'($signed(prod_sum_r23) >>> 15);
            i2_stage1    <= 16'($signed(prod_sum_i23) >>> 15);
            r3_stage1    <= 16'($signed(prod_diff_r23) >>> 15);
            i3_stage1    <= 16'($signed(prod_diff_i23) >>> 15);
            valid_stage1 <= io_in_valid;
        end
    end

    // Stage 2 (CX Gate complete)
    logic signed [15:0] r0_stage2, i0_stage2;
    logic signed [15:0] r1_stage2, i1_stage2;
    logic signed [15:0] r2_stage2, i2_stage2;
    logic signed [15:0] r3_stage2, i3_stage2;
    logic               valid_stage2;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_stage2    <= 16'd0;
            i0_stage2    <= 16'd0;
            r1_stage2    <= 16'd0;
            i1_stage2    <= 16'd0;
            r2_stage2    <= 16'd0;
            i2_stage2    <= 16'd0;
            r3_stage2    <= 16'd0;
            i3_stage2    <= 16'd0;
            valid_stage2 <= 1'b0;
        end else begin
            r0_stage2    <= r0_stage1;
            i0_stage2    <= i0_stage1;
            r1_stage2    <= r3_stage1; // Swap state |01> (index 1) and |11> (index 3)
            i1_stage2    <= i3_stage1;
            r2_stage2    <= r2_stage1;
            i2_stage2    <= i2_stage1;
            r3_stage2    <= r1_stage1;
            i3_stage2    <= i1_stage1;
            valid_stage2 <= valid_stage1;
        end
    end

    // Assign output ports
    assign io_out_QSV_0_0 = r0_stage2;
    assign io_out_QSV_0_1 = i0_stage2;
    assign io_out_QSV_1_0 = r1_stage2;
    assign io_out_QSV_1_1 = i1_stage2;
    assign io_out_QSV_2_0 = r2_stage2;
    assign io_out_QSV_2_1 = i2_stage2;
    assign io_out_QSV_3_0 = r3_stage2;
    assign io_out_QSV_3_1 = i3_stage2;
    assign io_out_valid   = valid_stage2;

endmodule
