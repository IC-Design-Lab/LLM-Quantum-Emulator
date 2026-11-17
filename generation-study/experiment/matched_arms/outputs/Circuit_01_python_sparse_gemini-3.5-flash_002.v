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

    //---------------------------------------------------------
    // Stage 0: Input Registers
    //---------------------------------------------------------
    logic signed [15:0] r_in_QSV_0_0, r_in_QSV_0_1;
    logic signed [15:0] r_in_QSV_1_0, r_in_QSV_1_1;
    logic signed [15:0] r_in_QSV_2_0, r_in_QSV_2_1;
    logic signed [15:0] r_in_QSV_3_0, r_in_QSV_3_1;
    logic               r_in_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_in_QSV_0_0 <= '0;
            r_in_QSV_0_1 <= '0;
            r_in_QSV_1_0 <= '0;
            r_in_QSV_1_1 <= '0;
            r_in_QSV_2_0 <= '0;
            r_in_QSV_2_1 <= '0;
            r_in_QSV_3_0 <= '0;
            r_in_QSV_3_1 <= '0;
            r_in_valid   <= 1'b0;
        end else begin
            r_in_QSV_0_0 <= io_in_QSV_0_0;
            r_in_QSV_0_1 <= io_in_QSV_0_1;
            r_in_QSV_1_0 <= io_in_QSV_1_0;
            r_in_QSV_1_1 <= io_in_QSV_1_1;
            r_in_QSV_2_0 <= io_in_QSV_2_0;
            r_in_QSV_2_1 <= io_in_QSV_2_1;
            r_in_QSV_3_0 <= io_in_QSV_3_0;
            r_in_QSV_3_1 <= io_in_QSV_3_1;
            r_in_valid   <= io_in_valid;
        end
    end

    //---------------------------------------------------------
    // Stage 1: Hadamard Gate on Qubit 0
    // Target pairs: (0, 1) and (2, 3)
    //---------------------------------------------------------
    localparam logic signed [15:0] INV_SQRT2 = 16'sd23170; // 1/sqrt(2) in Q1.15

    // Sums and differences (17-bit signed to prevent overflow)
    logic signed [16:0] sum_0_R, diff_0_R;
    logic signed [16:0] sum_0_I, diff_0_I;
    logic signed [16:0] sum_2_R, diff_2_R;
    logic signed [16:0] sum_2_I, diff_2_I;

    assign sum_0_R  = r_in_QSV_0_0 + r_in_QSV_1_0;
    assign diff_0_R = r_in_QSV_0_0 - r_in_QSV_1_0;
    assign sum_0_I  = r_in_QSV_0_1 + r_in_QSV_1_1;
    assign diff_0_I = r_in_QSV_0_1 - r_in_QSV_1_1;

    assign sum_2_R  = r_in_QSV_2_0 + r_in_QSV_3_0;
    assign diff_2_R = r_in_QSV_2_0 - r_in_QSV_3_0;
    assign sum_2_I  = r_in_QSV_2_1 + r_in_QSV_3_1;
    assign diff_2_I = r_in_QSV_2_1 - r_in_QSV_3_1;

    // Multiplications (33-bit signed products)
    logic signed [32:0] prod_sum_0_R, prod_diff_0_R;
    logic signed [32:0] prod_sum_0_I, prod_diff_0_I;
    logic signed [32:0] prod_sum_2_R, prod_diff_2_R;
    logic signed [32:0] prod_sum_2_I, prod_diff_2_I;

    assign prod_sum_0_R  = sum_0_R * INV_SQRT2;
    assign prod_diff_0_R = diff_0_R * INV_SQRT2;
    assign prod_sum_0_I  = sum_0_I * INV_SQRT2;
    assign prod_diff_0_I = diff_0_I * INV_SQRT2;

    assign prod_sum_2_R  = sum_2_R * INV_SQRT2;
    assign prod_diff_2_R = diff_2_R * INV_SQRT2;
    assign prod_sum_2_I  = sum_2_I * INV_SQRT2;
    assign prod_diff_2_I = diff_2_I * INV_SQRT2;

    // Registers for Stage 1 (Hadamard Output)
    logic signed [15:0] r_h_QSV_0_0, r_h_QSV_0_1;
    logic signed [15:0] r_h_QSV_1_0, r_h_QSV_1_1;
    logic signed [15:0] r_h_QSV_2_0, r_h_QSV_2_1;
    logic signed [15:0] r_h_QSV_3_0, r_h_QSV_3_1;
    logic               r_h_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_h_QSV_0_0 <= '0;
            r_h_QSV_0_1 <= '0;
            r_h_QSV_1_0 <= '0;
            r_h_QSV_1_1 <= '0;
            r_h_QSV_2_0 <= '0;
            r_h_QSV_2_1 <= '0;
            r_h_QSV_3_0 <= '0;
            r_h_QSV_3_1 <= '0;
            r_h_valid   <= 1'b0;
        end else begin
            r_h_QSV_0_0 <= prod_sum_0_R[30:15];
            r_h_QSV_0_1 <= prod_sum_0_I[30:15];
            r_h_QSV_1_0 <= prod_diff_0_R[30:15];
            r_h_QSV_1_1 <= prod_diff_0_I[30:15];
            r_h_QSV_2_0 <= prod_sum_2_R[30:15];
            r_h_QSV_2_1 <= prod_sum_2_I[30:15];
            r_h_QSV_3_0 <= prod_diff_2_R[30:15];
            r_h_QSV_3_1 <= prod_diff_2_I[30:15];
            r_h_valid   <= r_in_valid;
        end
    end

    //---------------------------------------------------------
    // Stage 2: X Gate on Qubit 1
    // Swaps state 0 with 2, and state 1 with 3
    //---------------------------------------------------------
    logic signed [15:0] r_x_QSV_0_0, r_x_QSV_0_1;
    logic signed [15:0] r_x_QSV_1_0, r_x_QSV_1_1;
    logic signed [15:0] r_x_QSV_2_0, r_x_QSV_2_1;
    logic signed [15:0] r_x_QSV_3_0, r_x_QSV_3_1;
    logic               r_x_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_x_QSV_0_0 <= '0;
            r_x_QSV_0_1 <= '0;
            r_x_QSV_1_0 <= '0;
            r_x_QSV_1_1 <= '0;
            r_x_QSV_2_0 <= '0;
            r_x_QSV_2_1 <= '0;
            r_x_QSV_3_0 <= '0;
            r_x_QSV_3_1 <= '0;
            r_x_valid   <= 1'b0;
        end else begin
            r_x_QSV_0_0 <= r_h_QSV_2_0;
            r_x_QSV_0_1 <= r_h_QSV_2_1;
            r_x_QSV_1_0 <= r_h_QSV_3_0;
            r_x_QSV_1_1 <= r_h_QSV_3_1;
            r_x_QSV_2_0 <= r_h_QSV_0_0;
            r_x_QSV_2_1 <= r_h_QSV_0_1;
            r_x_QSV_3_0 <= r_h_QSV_1_0;
            r_x_QSV_3_1 <= r_h_QSV_1_1;
            r_x_valid   <= r_h_valid;
        end
    end

    //---------------------------------------------------------
    // Stage 3: SWAP Gate on Qubits 0 and 1
    // Swaps state 1 with 2 (0 and 3 remain unchanged)
    //---------------------------------------------------------
    logic signed [15:0] r_swap_QSV_0_0, r_swap_QSV_0_1;
    logic signed [15:0] r_swap_QSV_1_0, r_swap_QSV_1_1;
    logic signed [15:0] r_swap_QSV_2_0, r_swap_QSV_2_1;
    logic signed [15:0] r_swap_QSV_3_0, r_swap_QSV_3_1;
    logic               r_swap_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_swap_QSV_0_0 <= '0;
            r_swap_QSV_0_1 <= '0;
            r_swap_QSV_1_0 <= '0;
            r_swap_QSV_1_1 <= '0;
            r_swap_QSV_2_0 <= '0;
            r_swap_QSV_2_1 <= '0;
            r_swap_QSV_3_0 <= '0;
            r_swap_QSV_3_1 <= '0;
            r_swap_valid   <= 1'b0;
        end else begin
            r_swap_QSV_0_0 <= r_x_QSV_0_0;
            r_swap_QSV_0_1 <= r_x_QSV_0_1;
            r_swap_QSV_1_0 <= r_x_QSV_2_0;
            r_swap_QSV_1_1 <= r_x_QSV_2_1;
            r_swap_QSV_2_0 <= r_x_QSV_1_0;
            r_swap_QSV_2_1 <= r_x_QSV_1_1;
            r_swap_QSV_3_0 <= r_x_QSV_3_0;
            r_swap_QSV_3_1 <= r_x_QSV_3_1;
            r_swap_valid   <= r_x_valid;
        end
    end

    //---------------------------------------------------------
    // Outputs Assignment
    //---------------------------------------------------------
    assign io_out_QSV_0_0 = r_swap_QSV_0_0;
    assign io_out_QSV_0_1 = r_swap_QSV_0_1;
    assign io_out_QSV_1_0 = r_swap_QSV_1_0;
    assign io_out_QSV_1_1 = r_swap_QSV_1_1;
    assign io_out_QSV_2_0 = r_swap_QSV_2_0;
    assign io_out_QSV_2_1 = r_swap_QSV_2_1;
    assign io_out_QSV_3_0 = r_swap_QSV_3_0;
    assign io_out_QSV_3_1 = r_swap_QSV_3_1;
    assign io_out_valid   = r_swap_valid;

endmodule
