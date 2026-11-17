module Circuit_00 (
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

    // 1/sqrt(2) in Q1.15 representation (0.70710678 * 32768 = 23170)
    localparam signed [15:0] INV_SQRT2 = 16'h5A82;

    // Stage 1: Hadamard Addition / Subtraction Registers
    logic signed [16:0] sum_00_r,  sum_00_i;
    logic signed [16:0] diff_00_r, diff_00_i;
    logic signed [16:0] sum_10_r,  sum_10_i;
    logic signed [16:0] diff_10_r, diff_10_i;
    logic               valid_q1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            sum_00_r  <= 17'sd0;
            sum_00_i  <= 17'sd0;
            diff_00_r <= 17'sd0;
            diff_00_i <= 17'sd0;
            sum_10_r  <= 17'sd0;
            sum_10_i  <= 17'sd0;
            diff_10_r <= 17'sd0;
            diff_10_i <= 17'sd0;
            valid_q1  <= 1'b0;
        end else begin
            valid_q1  <= io_in_valid;
            if (io_in_valid) begin
                sum_00_r  <= $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
                sum_00_i  <= $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
                diff_00_r <= $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
                diff_00_i <= $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);
                sum_10_r  <= $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
                sum_10_i  <= $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
                diff_10_r <= $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
                diff_10_i <= $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);
            end
        end
    end

    // Stage 2: Scaling by 1/sqrt(2) and applying Qubit SWAP
    // Swap operation exchanges index 1 and index 2:
    // Out_0 <= H_0 (sum_00)
    // Out_1 <= H_2 (sum_10)
    // Out_2 <= H_1 (diff_00)
    // Out_3 <= H_3 (diff_10)
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_QSV_0_0 <= 16'd0;
            io_out_QSV_0_1 <= 16'd0;
            io_out_QSV_1_0 <= 16'd0;
            io_out_QSV_1_1 <= 16'd0;
            io_out_QSV_2_0 <= 16'd0;
            io_out_QSV_2_1 <= 16'd0;
            io_out_QSV_3_0 <= 16'd0;
            io_out_QSV_3_1 <= 16'd0;
            io_out_valid   <= 1'b0;
        end else begin
            io_out_valid   <= valid_q1;
            if (valid_q1) begin
                io_out_QSV_0_0 <= 16'((sum_00_r * INV_SQRT2) >>> 15);
                io_out_QSV_0_1 <= 16'((sum_00_i * INV_SQRT2) >>> 15);

                io_out_QSV_1_0 <= 16'((sum_10_r * INV_SQRT2) >>> 15);
                io_out_QSV_1_1 <= 16'((sum_10_i * INV_SQRT2) >>> 15);

                io_out_QSV_2_0 <= 16'((diff_00_r * INV_SQRT2) >>> 15);
                io_out_QSV_2_1 <= 16'((diff_00_i * INV_SQRT2) >>> 15);

                io_out_QSV_3_0 <= 16'((diff_10_r * INV_SQRT2) >>> 15);
                io_out_QSV_3_1 <= 16'((diff_10_i * INV_SQRT2) >>> 15);
            end
        end
    end

endmodule
