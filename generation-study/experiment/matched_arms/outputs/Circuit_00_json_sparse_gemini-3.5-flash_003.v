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

    // Constant for 1/sqrt(2) in Q15 format (0.70710678 * 32768 = 23170)
    localparam logic signed [16:0] COEFF = 17'sd23170;

    // Hadamard (Step 0) Stage Logic
    logic signed [16:0] h0_sum_r,  h0_diff_r;
    logic signed [16:0] h0_sum_i,  h0_diff_i;
    logic signed [16:0] h2_sum_r,  h2_diff_r;
    logic signed [16:0] h2_sum_i,  h2_diff_i;

    logic signed [33:0] h0_prod_sum_r,  h0_prod_diff_r;
    logic signed [33:0] h0_prod_sum_i,  h0_prod_diff_i;
    logic signed [33:0] h2_prod_sum_r,  h2_prod_diff_r;
    logic signed [33:0] h2_prod_sum_i,  h2_prod_diff_i;

    always_comb begin
        h0_sum_r  = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
        h0_diff_r = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
        h0_sum_i  = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
        h0_diff_i = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

        h2_sum_r  = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
        h2_diff_r = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
        h2_sum_i  = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
        h2_diff_i = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

        h0_prod_sum_r  = h0_sum_r  * COEFF;
        h0_prod_diff_r = h0_diff_r * COEFF;
        h0_prod_sum_i  = h0_sum_i  * COEFF;
        h0_prod_diff_i = h0_diff_i * COEFF;

        h2_prod_sum_r  = h2_sum_r  * COEFF;
        h2_prod_diff_r = h2_diff_r * COEFF;
        h2_prod_sum_i  = h2_sum_i  * COEFF;
        h2_prod_diff_i = h2_diff_i * COEFF;
    end

    // Stage 1 Registers (Hadamard outputs)
    logic [15:0] st1_QSV_0_0, st1_QSV_0_1;
    logic [15:0] st1_QSV_1_0, st1_QSV_1_1;
    logic [15:0] st1_QSV_2_0, st1_QSV_2_1;
    logic [15:0] st1_QSV_3_0, st1_QSV_3_1;
    logic        st1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            st1_QSV_0_0 <= 16'd0;
            st1_QSV_0_1 <= 16'd0;
            st1_QSV_1_0 <= 16'd0;
            st1_QSV_1_1 <= 16'd0;
            st1_QSV_2_0 <= 16'd0;
            st1_QSV_2_1 <= 16'd0;
            st1_QSV_3_0 <= 16'd0;
            st1_QSV_3_1 <= 16'd0;
            st1_valid   <= 1'b0;
        end else if (io_in_valid) begin
            st1_QSV_0_0 <= 16'(h0_prod_sum_r >>> 15);
            st1_QSV_0_1 <= 16'(h0_prod_sum_i >>> 15);
            st1_QSV_1_0 <= 16'(h0_prod_diff_r >>> 15);
            st1_QSV_1_1 <= 16'(h0_prod_diff_i >>> 15);
            st1_QSV_2_0 <= 16'(h2_prod_sum_r >>> 15);
            st1_QSV_2_1 <= 16'(h2_prod_sum_i >>> 15);
            st1_QSV_3_0 <= 16'(h2_prod_diff_r >>> 15);
            st1_QSV_3_1 <= 16'(h2_prod_diff_i >>> 15);
            st1_valid   <= 1'b1;
        end else begin
            st1_valid   <= 1'b0;
        end
    end

    // Stage 2 Registers (SWAP Gate & Output Mapping)
    // Swap on qubits 0 and 1:
    // State 00 (index 0) remains 00 (index 0)
    // State 01 (index 1) becomes 10 (index 2)
    // State 10 (index 2) becomes 01 (index 1)
    // State 11 (index 3) remains 11 (index 3)
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
        end else if (st1_valid) begin
            io_out_QSV_0_0 <= st1_QSV_0_0;
            io_out_QSV_0_1 <= st1_QSV_0_1;
            io_out_QSV_1_0 <= st1_QSV_2_0; // Swapped from index 2
            io_out_QSV_1_1 <= st1_QSV_2_1; // Swapped from index 2
            io_out_QSV_2_0 <= st1_QSV_1_0; // Swapped from index 1
            io_out_QSV_2_1 <= st1_QSV_1_1; // Swapped from index 1
            io_out_QSV_3_0 <= st1_QSV_3_0;
            io_out_QSV_3_1 <= st1_QSV_3_1;
            io_out_valid   <= 1'b1;
        end else begin
            io_out_valid   <= 1'b0;
        end
    end

endmodule
