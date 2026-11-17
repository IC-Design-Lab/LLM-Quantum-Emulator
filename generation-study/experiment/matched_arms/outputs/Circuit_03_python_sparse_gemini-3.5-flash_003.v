// Top-level module for Quantum Circuit 03
module Circuit_03 (
    input  logic        clock,
    input  logic        reset,
    input  logic signed [15:0] io_in_QSV_0_0,
    input  logic signed [15:0] io_in_QSV_0_1,
    input  logic signed [15:0] io_in_QSV_1_0,
    input  logic signed [15:0] io_in_QSV_1_1,
    input  logic signed [15:0] io_in_QSV_2_0,
    input  logic signed [15:0] io_in_QSV_2_1,
    input  logic signed [15:0] io_in_QSV_3_0,
    input  logic signed [15:0] io_in_QSV_3_1,
    input  logic        io_in_valid,
    output logic signed [15:0] io_out_QSV_0_0,
    output logic signed [15:0] io_out_QSV_0_1,
    output logic signed [15:0] io_out_QSV_1_0,
    output logic signed [15:0] io_out_QSV_1_1,
    output logic signed [15:0] io_out_QSV_2_0,
    output logic signed [15:0] io_out_QSV_2_1,
    output logic signed [15:0] io_out_QSV_3_0,
    output logic signed [15:0] io_out_QSV_3_1,
    output logic        io_out_valid
);

    // Fixed-point scaling functions for 1/sqrt(2)
    function automatic logic signed [15:0] scale_inv_sqrt2_sum(
        input logic signed [15:0] a,
        input logic signed [15:0] b
    );
        logic signed [16:0] sum;
        logic signed [32:0] prod;
        sum = a + b;
        prod = sum * 16'sh5A82; // 16'sh5A82 is ~0.70710678 in Q1.15
        return logic signed'((prod + 33'sd16384) >>> 15);
    endfunction

    function automatic logic signed [15:0] scale_inv_sqrt2_diff(
        input logic signed [15:0] a,
        input logic signed [15:0] b
    );
        logic signed [16:0] diff;
        logic signed [32:0] prod;
        diff = a - b;
        prod = diff * 16'sh5A82;
        return logic signed'((prod + 33'sd16384) >>> 15);
    endfunction

    // Stage 0 registers (Input Capture)
    logic        stage0_valid;
    logic signed [15:0] stage0_QSV_0_0, stage0_QSV_0_1;
    logic signed [15:0] stage0_QSV_1_0, stage0_QSV_1_1;
    logic signed [15:0] stage0_QSV_2_0, stage0_QSV_2_1;
    logic signed [15:0] stage0_QSV_3_0, stage0_QSV_3_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage0_valid <= 1'b0;
        end else begin
            stage0_valid <= io_in_valid;
        end
    end

    always_ff @(posedge clock) begin
        if (io_in_valid) begin
            stage0_QSV_0_0 <= io_in_QSV_0_0;
            stage0_QSV_0_1 <= io_in_QSV_0_1;
            stage0_QSV_1_0 <= io_in_QSV_1_0;
            stage0_QSV_1_1 <= io_in_QSV_1_1;
            stage0_QSV_2_0 <= io_in_QSV_2_0;
            stage0_QSV_2_1 <= io_in_QSV_2_1;
            stage0_QSV_3_0 <= io_in_QSV_3_0;
            stage0_QSV_3_1 <= io_in_QSV_3_1;
        end
    end

    // Stage 1 registers (H(0) Gate)
    logic        stage1_valid;
    logic signed [15:0] stage1_QSV_0_0, stage1_QSV_0_1;
    logic signed [15:0] stage1_QSV_1_0, stage1_QSV_1_1;
    logic signed [15:0] stage1_QSV_2_0, stage1_QSV_2_1;
    logic signed [15:0] stage1_QSV_3_0, stage1_QSV_3_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage1_valid <= 1'b0;
        end else begin
            stage1_valid <= stage0_valid;
        end
    end

    always_ff @(posedge clock) begin
        if (stage0_valid) begin
            stage1_QSV_0_0 <= scale_inv_sqrt2_sum(stage0_QSV_0_0, stage0_QSV_1_0);
            stage1_QSV_0_1 <= scale_inv_sqrt2_sum(stage0_QSV_0_1, stage0_QSV_1_1);
            
            stage1_QSV_1_0 <= scale_inv_sqrt2_diff(stage0_QSV_0_0, stage0_QSV_1_0);
            stage1_QSV_1_1 <= scale_inv_sqrt2_diff(stage0_QSV_0_1, stage0_QSV_1_1);
            
            stage1_QSV_2_0 <= scale_inv_sqrt2_sum(stage0_QSV_2_0, stage0_QSV_3_0);
            stage1_QSV_2_1 <= scale_inv_sqrt2_sum(stage0_QSV_2_1, stage0_QSV_3_1);
            
            stage1_QSV_3_0 <= scale_inv_sqrt2_diff(stage0_QSV_2_0, stage0_QSV_3_0);
            stage1_QSV_3_1 <= scale_inv_sqrt2_diff(stage0_QSV_2_1, stage0_QSV_3_1);
        end
    end

    // Stage 2 registers (X(1) Gate - State Permutation)
    logic        stage2_valid;
    logic signed [15:0] stage2_QSV_0_0, stage2_QSV_0_1;
    logic signed [15:0] stage2_QSV_1_0, stage2_QSV_1_1;
    logic signed [15:0] stage2_QSV_2_0, stage2_QSV_2_1;
    logic signed [15:0] stage2_QSV_3_0, stage2_QSV_3_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage2_valid <= 1'b0;
        end else begin
            stage2_valid <= stage1_valid;
        end
    end

    always_ff @(posedge clock) begin
        if (stage1_valid) begin
            stage2_QSV_0_0 <= stage1_QSV_2_0;
            stage2_QSV_0_1 <= stage1_QSV_2_1;
            
            stage2_QSV_1_0 <= stage1_QSV_3_0;
            stage2_QSV_1_1 <= stage1_QSV_3_1;
            
            stage2_QSV_2_0 <= stage1_QSV_0_0;
            stage2_QSV_2_1 <= stage1_QSV_0_1;
            
            stage2_QSV_3_0 <= stage1_QSV_1_0;
            stage2_QSV_3_1 <= stage1_QSV_1_1;
        end
    end

    // Stage 3 registers (H(1) Gate)
    logic        stage3_valid;
    logic signed [15:0] stage3_QSV_0_0, stage3_QSV_0_1;
    logic signed [15:0] stage3_QSV_1_0, stage3_QSV_1_1;
    logic signed [15:0] stage3_QSV_2_0, stage3_QSV_2_1;
    logic signed [15:0] stage3_QSV_3_0, stage3_QSV_3_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage3_valid <= 1'b0;
        end else begin
            stage3_valid <= stage2_valid;
        end
    end

    always_ff @(posedge clock) begin
        if (stage2_valid) begin
            stage3_QSV_0_0 <= scale_inv_sqrt2_sum(stage2_QSV_0_0, stage2_QSV_2_0);
            stage3_QSV_0_1 <= scale_inv_sqrt2_sum(stage2_QSV_0_1, stage2_QSV_2_1);
            
            stage3_QSV_1_0 <= scale_inv_sqrt2_sum(stage2_QSV_1_0, stage2_QSV_3_0);
            stage3_QSV_1_1 <= scale_inv_sqrt2_sum(stage2_QSV_1_1, stage2_QSV_3_1);
            
            stage3_QSV_2_0 <= scale_inv_sqrt2_diff(stage2_QSV_0_0, stage2_QSV_2_0);
            stage3_QSV_2_1 <= scale_inv_sqrt2_diff(stage2_QSV_0_1, stage2_QSV_2_1);
            
            stage3_QSV_3_0 <= scale_inv_sqrt2_diff(stage2_QSV_1_0, stage2_QSV_3_0);
            stage3_QSV_3_1 <= scale_inv_sqrt2_diff(stage2_QSV_1_1, stage2_QSV_3_1);
        end
    end

    // Stage 4 registers (Swap(0, 1) and Final Outputs)
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_valid <= 1'b0;
        end else begin
            io_out_valid <= stage3_valid;
        end
    end

    always_ff @(posedge clock) begin
        if (stage3_valid) begin
            io_out_QSV_0_0 <= stage3_QSV_0_0;
            io_out_QSV_0_1 <= stage3_QSV_0_1;
            
            io_out_QSV_1_0 <= stage3_QSV_2_0; // Swapped state 2 -> index 1
            io_out_QSV_1_1 <= stage3_QSV_2_1;
            
            io_out_QSV_2_0 <= stage3_QSV_1_0; // Swapped state 1 -> index 2
            io_out_QSV_2_1 <= stage3_QSV_1_1;
            
            io_out_QSV_3_0 <= stage3_QSV_3_0;
            io_out_QSV_3_1 <= stage3_QSV_3_1;
        end
    end

endmodule
