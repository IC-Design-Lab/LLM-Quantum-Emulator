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

    // Register Stage 0: Input sampling
    logic [15:0] r_in_QSV_0_0;
    logic [15:0] r_in_QSV_0_1;
    logic [15:0] r_in_QSV_1_0;
    logic [15:0] r_in_QSV_1_1;
    logic [15:0] r_in_QSV_2_0;
    logic [15:0] r_in_QSV_2_1;
    logic [15:0] r_in_QSV_3_0;
    logic [15:0] r_in_QSV_3_1;
    logic        r_in_valid;

    // Register Stage 1: Hadamard Addition / Subtraction
    logic signed [16:0] sum_01_r,  diff_01_r,  sum_01_i,  diff_01_i;
    logic signed [16:0] sum_23_r,  diff_23_r,  sum_23_i,  diff_23_i;
    logic        valid_1;

    // Combinational Products (Stage 2)
    logic signed [33:0] p_sum_01_r,  p_diff_01_r,  p_sum_01_i,  p_diff_01_i;
    logic signed [33:0] p_sum_23_r,  p_diff_23_r,  p_sum_23_i,  p_diff_23_i;

    // Constant 1/sqrt(2) in Q1.15
    localparam logic signed [16:0] INV_SQRT2 = 17'sd23170;

    // H-gate sum/diff products
    assign p_sum_01_r  = sum_01_r  * INV_SQRT2;
    assign p_diff_01_r = diff_01_r * INV_SQRT2;
    assign p_sum_01_i  = sum_01_i  * INV_SQRT2;
    assign p_diff_01_i = diff_01_i * INV_SQRT2;

    assign p_sum_23_r  = sum_23_r  * INV_SQRT2;
    assign p_diff_23_r = diff_23_r * INV_SQRT2;
    assign p_sum_23_i  = sum_23_i  * INV_SQRT2;
    assign p_diff_23_i = diff_23_i * INV_SQRT2;

    // Sequential Logic
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_in_valid   <= 1'b0;
            valid_1      <= 1'b0;
            io_out_valid <= 1'b0;
        end else begin
            r_in_valid   <= io_in_valid;
            valid_1      <= r_in_valid;
            io_out_valid <= valid_1;
        end
    end

    always_ff @(posedge clock) begin
        // Stage 0: Sample Inputs
        r_in_QSV_0_0 <= io_in_QSV_0_0;
        r_in_QSV_0_1 <= io_in_QSV_0_1;
        r_in_QSV_1_0 <= io_in_QSV_1_0;
        r_in_QSV_1_1 <= io_in_QSV_1_1;
        r_in_QSV_2_0 <= io_in_QSV_2_0;
        r_in_QSV_2_1 <= io_in_QSV_2_1;
        r_in_QSV_3_0 <= io_in_QSV_3_0;
        r_in_QSV_3_1 <= io_in_QSV_3_1;

        // Stage 1: Hadamard Sums & Differences
        sum_01_r  <= $signed(r_in_QSV_0_0) + $signed(r_in_QSV_1_0);
        diff_01_r <= $signed(r_in_QSV_0_0) - $signed(r_in_QSV_1_0);
        sum_01_i  <= $signed(r_in_QSV_0_1) + $signed(r_in_QSV_1_1);
        diff_01_i <= $signed(r_in_QSV_0_1) - $signed(r_in_QSV_1_1);

        sum_23_r  <= $signed(r_in_QSV_2_0) + $signed(r_in_QSV_3_0);
        diff_23_r <= $signed(r_in_QSV_2_0) - $signed(r_in_QSV_3_0);
        sum_23_i  <= $signed(r_in_QSV_2_1) + $signed(r_in_QSV_3_1);
        diff_23_i <= $signed(r_in_QSV_2_1) - $signed(r_in_QSV_3_1);

        // Stage 2: Scaling and Output Mapping (incorporating CNOT wire swap)
        // State 0 -> H_out_0 (p_sum_01)
        io_out_QSV_0_0 <= p_sum_01_r >>> 15;
        io_out_QSV_0_1 <= p_sum_01_i >>> 15;

        // State 1 -> H_out_3 (p_diff_23) due to CNOT
        io_out_QSV_1_0 <= p_diff_23_r >>> 15;
        io_out_QSV_1_1 <= p_diff_23_i >>> 15;

        // State 2 -> H_out_2 (p_sum_23)
        io_out_QSV_2_0 <= p_sum_23_r >>> 15;
        io_out_QSV_2_1 <= p_sum_23_i >>> 15;

        // State 3 -> H_out_1 (p_diff_01) due to CNOT
        io_out_QSV_3_0 <= p_diff_01_r >>> 15;
        io_out_QSV_3_1 <= p_diff_01_i >>> 15;
    end

endmodule
