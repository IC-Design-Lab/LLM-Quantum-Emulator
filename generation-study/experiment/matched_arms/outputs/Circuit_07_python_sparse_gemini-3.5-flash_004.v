module Circuit_07 (
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

    // Functions for Hadamard operations
    function automatic logic [15:0] hadamard_sum(input logic [15:0] a, input logic [15:0] b);
        logic signed [16:0] sum;
        logic signed [32:0] prod;
        sum = $signed(a) + $signed(b);
        prod = sum * 16'sd23170;
        return prod[30:15];
    endfunction

    function automatic logic [15:0] hadamard_diff(input logic [15:0] a, input logic [15:0] b);
        logic signed [16:0] diff;
        logic signed [32:0] prod;
        diff = $signed(a) - $signed(b);
        prod = diff * 16'sd23170;
        return prod[30:15];
    endfunction

    // Stage 1 registers (H(0))
    logic [15:0] stage1_0_0, stage1_0_1;
    logic [15:0] stage1_1_0, stage1_1_1;
    logic [15:0] stage1_2_0, stage1_2_1;
    logic [15:0] stage1_3_0, stage1_3_1;
    logic        stage1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage1_0_0   <= 16'h0;
            stage1_0_1   <= 16'h0;
            stage1_1_0   <= 16'h0;
            stage1_1_1   <= 16'h0;
            stage1_2_0   <= 16'h0;
            stage1_2_1   <= 16'h0;
            stage1_3_0   <= 16'h0;
            stage1_3_1   <= 16'h0;
            stage1_valid <= 1'b0;
        end else begin
            stage1_valid <= io_in_valid;
            if (io_in_valid) begin
                stage1_0_0 <= hadamard_sum(io_in_QSV_0_0, io_in_QSV_1_0);
                stage1_0_1 <= hadamard_sum(io_in_QSV_0_1, io_in_QSV_1_1);
                stage1_1_0 <= hadamard_diff(io_in_QSV_0_0, io_in_QSV_1_0);
                stage1_1_1 <= hadamard_diff(io_in_QSV_0_1, io_in_QSV_1_1);
                
                stage1_2_0 <= hadamard_sum(io_in_QSV_2_0, io_in_QSV_3_0);
                stage1_2_1 <= hadamard_sum(io_in_QSV_2_1, io_in_QSV_3_1);
                stage1_3_0 <= hadamard_diff(io_in_QSV_2_0, io_in_QSV_3_0);
                stage1_3_1 <= hadamard_diff(io_in_QSV_2_1, io_in_QSV_3_1);
            end
        end
    end

    // Stage 2 registers (CX(0, 1))
    logic [15:0] stage2_0_0, stage2_0_1;
    logic [15:0] stage2_1_0, stage2_1_1;
    logic [15:0] stage2_2_0, stage2_2_1;
    logic [15:0] stage2_3_0, stage2_3_1;
    logic        stage2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage2_0_0   <= 16'h0;
            stage2_0_1   <= 16'h0;
            stage2_1_0   <= 16'h0;
            stage2_1_1   <= 16'h0;
            stage2_2_0   <= 16'h0;
            stage2_2_1   <= 16'h0;
            stage2_3_0   <= 16'h0;
            stage2_3_1   <= 16'h0;
            stage2_valid <= 1'b0;
        end else begin
            stage2_valid <= stage1_valid;
            if (stage1_valid) begin
                stage2_0_0 <= stage1_0_0;
                stage2_0_1 <= stage1_0_1;
                
                stage2_1_0 <= stage1_3_0; // Swap 1 and 3
                stage2_1_1 <= stage1_3_1;
                
                stage2_2_0 <= stage1_2_0;
                stage2_2_1 <= stage1_2_1;
                
                stage2_3_0 <= stage1_1_0; // Swap 1 and 3
                stage2_3_1 <= stage1_1_1;
            end
        end
    end

    // Stage 3 registers (H(0))
    logic [15:0] stage3_0_0, stage3_0_1;
    logic [15:0] stage3_1_0, stage3_1_1;
    logic [15:0] stage3_2_0, stage3_2_1;
    logic [15:0] stage3_3_0, stage3_3_1;
    logic        stage3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage3_0_0   <= 16'h0;
            stage3_0_1   <= 16'h0;
            stage3_1_0   <= 16'h0;
            stage3_1_1   <= 16'h0;
            stage3_2_0   <= 16'h0;
            stage3_2_1   <= 16'h0;
            stage3_3_0   <= 16'h0;
            stage3_3_1   <= 16'h0;
            stage3_valid <= 1'b0;
        end else begin
            stage3_valid <= stage2_valid;
            if (stage2_valid) begin
                stage3_0_0 <= hadamard_sum(stage2_0_0, stage2_1_0);
                stage3_0_1 <= hadamard_sum(stage2_0_1, stage2_1_1);
                stage3_1_0 <= hadamard_diff(stage2_0_0, stage2_1_0);
                stage3_1_1 <= hadamard_diff(stage2_0_1, stage2_1_1);
                
                stage3_2_0 <= hadamard_sum(stage2_2_0, stage2_3_0);
                stage3_2_1 <= hadamard_sum(stage2_2_1, stage2_3_1);
                stage3_3_0 <= hadamard_diff(stage2_2_0, stage2_3_0);
                stage3_3_1 <= hadamard_diff(stage2_2_1, stage2_3_1);
            end
        end
    end

    // Output assignments
    assign io_out_QSV_0_0 = stage3_0_0;
    assign io_out_QSV_0_1 = stage3_0_1;
    assign io_out_QSV_1_0 = stage3_1_0;
    assign io_out_QSV_1_1 = stage3_1_1;
    assign io_out_QSV_2_0 = stage3_2_0;
    assign io_out_QSV_2_1 = stage3_2_1;
    assign io_out_QSV_3_0 = stage3_3_0;
    assign io_out_QSV_3_1 = stage3_3_1;
    assign io_out_valid   = stage3_valid;

endmodule
