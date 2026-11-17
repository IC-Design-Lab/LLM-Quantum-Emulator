module Circuit_04 (
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
    localparam signed [15:0] H_COEFF = 16'sd23170;

    // ------------------------------------------------------------------------
    // Stage 0: Input Registers
    // ------------------------------------------------------------------------
    logic        r0_valid;
    logic [15:0] r0_QSV_0_0, r0_QSV_0_1;
    logic [15:0] r0_QSV_1_0, r0_QSV_1_1;
    logic [15:0] r0_QSV_2_0, r0_QSV_2_1;
    logic [15:0] r0_QSV_3_0, r0_QSV_3_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_valid    <= 1'b0;
            r0_QSV_0_0  <= 16'd0; r0_QSV_0_1  <= 16'd0;
            r0_QSV_1_0  <= 16'd0; r0_QSV_1_1  <= 16'd0;
            r0_QSV_2_0  <= 16'd0; r0_QSV_2_1  <= 16'd0;
            r0_QSV_3_0  <= 16'd0; r0_QSV_3_1  <= 16'd0;
        end else begin
            r0_valid    <= io_in_valid;
            r0_QSV_0_0  <= io_in_QSV_0_0; r0_QSV_0_1  <= io_in_QSV_0_1;
            r0_QSV_1_0  <= io_in_QSV_1_0; r0_QSV_1_1  <= io_in_QSV_1_1;
            r0_QSV_2_0  <= io_in_QSV_2_0; r0_QSV_2_1  <= io_in_QSV_2_1;
            r0_QSV_3_0  <= io_in_QSV_3_0; r0_QSV_3_1  <= io_in_QSV_3_1;
        end
    end

    // ------------------------------------------------------------------------
    // Stage 1: Hadamard Add/Subtract
    // ------------------------------------------------------------------------
    logic               r1_valid;
    logic signed [16:0] r1_sum_01_R,  r1_diff_01_R;
    logic signed [16:0] r1_sum_01_I,  r1_diff_01_I;
    logic signed [16:0] r1_sum_23_R,  r1_diff_23_R;
    logic signed [16:0] r1_sum_23_I,  r1_diff_23_I;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_valid      <= 1'b0;
            r1_sum_01_R   <= 17'd0; r1_diff_01_R  <= 17'd0;
            r1_sum_01_I   <= 17'd0; r1_diff_01_I  <= 17'd0;
            r1_sum_23_R   <= 17'd0; r1_diff_23_R  <= 17'd0;
            r1_sum_23_I   <= 17'd0; r1_diff_23_I  <= 17'd0;
        end else begin
            r1_valid      <= r0_valid;
            r1_sum_01_R   <= $signed(r0_QSV_0_0) + $signed(r0_QSV_1_0);
            r1_diff_01_R  <= $signed(r0_QSV_0_0) - $signed(r0_QSV_1_0);
            r1_sum_01_I   <= $signed(r0_QSV_0_1) + $signed(r0_QSV_1_1);
            r1_diff_01_I  <= $signed(r0_QSV_0_1) - $signed(r0_QSV_1_1);
            r1_sum_23_R   <= $signed(r0_QSV_2_0) + $signed(r0_QSV_3_0);
            r1_diff_23_R  <= $signed(r0_QSV_2_0) - $signed(r0_QSV_3_0);
            r1_sum_23_I   <= $signed(r0_QSV_2_1) + $signed(r0_QSV_3_1);
            r1_diff_23_I  <= $signed(r0_QSV_2_1) - $signed(r0_QSV_3_1);
        end
    end

    // ------------------------------------------------------------------------
    // Stage 2: Hadamard Scaling (Multipliers)
    // ------------------------------------------------------------------------
    logic               r2_valid;
    logic signed [15:0] r2_h_0_R, r2_h_0_I;
    logic signed [15:0] r2_h_1_R, r2_h_1_I;
    logic signed [15:0] r2_h_2_R, r2_h_2_I;
    logic signed [15:0] r2_h_3_R, r2_h_3_I;

    wire signed [32:0] p_sum_01_R  = r1_sum_01_R  * H_COEFF;
    wire signed [32:0] p_diff_01_R = r1_diff_01_R * H_COEFF;
    wire signed [32:0] p_sum_01_I  = r1_sum_01_I  * H_COEFF;
    wire signed [32:0] p_diff_01_I = r1_diff_01_I * H_COEFF;
    wire signed [32:0] p_sum_23_R  = r1_sum_23_R  * H_COEFF;
    wire signed [32:0] p_diff_23_R = r1_diff_23_R * H_COEFF;
    wire signed [32:0] p_sum_23_I  = r1_sum_23_I  * H_COEFF;
    wire signed [32:0] p_diff_23_I = r1_diff_23_I * H_COEFF;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_valid <= 1'b0;
            r2_h_0_R <= 16'd0; r2_h_0_I <= 16'd0;
            r2_h_1_R <= 16'd0; r2_h_1_I <= 16'd0;
            r2_h_2_R <= 16'd0; r2_h_2_I <= 16'd0;
            r2_h_3_R <= 16'd0; r2_h_3_I <= 16'd0;
        end else begin
            r2_valid <= r1_valid;
            r2_h_0_R <= p_sum_01_R[30:15];
            r2_h_0_I <= p_sum_01_I[30:15];
            r2_h_1_R <= p_diff_01_R[30:15];
            r2_h_1_I <= p_diff_01_I[30:15];
            r2_h_2_R <= p_sum_23_R[30:15];
            r2_h_2_I <= p_sum_23_I[30:15];
            r2_h_3_R <= p_diff_23_R[30:15];
            r2_h_3_I <= p_diff_23_I[30:15];
        end
    end

    // ------------------------------------------------------------------------
    // Stage 3: SXdg Gate on Qubit 1 (Mixes (0,2) and (1,3))
    // ------------------------------------------------------------------------
    logic               r3_valid;
    logic signed [15:0] r3_s_0_R, r3_s_0_I;
    logic signed [15:0] r3_s_1_R, r3_s_1_I;
    logic signed [15:0] r3_s_2_R, r3_s_2_I;
    logic signed [15:0] r3_s_3_R, r3_s_3_I;

    // SXdg(1) formulas:
    // Pair (0, 2):
    wire signed [17:0] w_sxdg_0_R = $signed(r2_h_0_R) + $signed(r2_h_0_I) + $signed(r2_h_2_R) - $signed(r2_h_2_I);
    wire signed [17:0] w_sxdg_0_I = -$signed(r2_h_0_R) + $signed(r2_h_0_I) + $signed(r2_h_2_R) + $signed(r2_h_2_I);
    wire signed [17:0] w_sxdg_2_R = $signed(r2_h_0_R) - $signed(r2_h_0_I) + $signed(r2_h_2_R) + $signed(r2_h_2_I);
    wire signed [17:0] w_sxdg_2_I = $signed(r2_h_0_R) + $signed(r2_h_0_I) - $signed(r2_h_2_R) + $signed(r2_h_2_I);

    // Pair (1, 3):
    wire signed [17:0] w_sxdg_1_R = $signed(r2_h_1_R) + $signed(r2_h_1_I) + $signed(r2_h_3_R) - $signed(r2_h_3_I);
    wire signed [17:0] w_sxdg_1_I = -$signed(r2_h_1_R) + $signed(r2_h_1_I) + $signed(r2_h_3_R) + $signed(r2_h_3_I);
    wire signed [17:0] w_sxdg_3_R = $signed(r2_h_1_R) - $signed(r2_h_1_I) + $signed(r2_h_3_R) + $signed(r2_h_3_I);
    wire signed [17:0] w_sxdg_3_I = $signed(r2_h_1_R) + $signed(r2_h_1_I) - $signed(r2_h_3_R) + $signed(r2_h_3_I);

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_valid <= 1'b0;
            r3_s_0_R <= 16'd0; r3_s_0_I <= 16'd0;
            r3_s_1_R <= 16'd0; r3_s_1_I <= 16'd0;
            r3_s_2_R <= 16'd0; r3_s_2_I <= 16'd0;
            r3_s_3_R <= 16'd0; r3_s_3_I <= 16'd0;
        end else begin
            r3_valid <= r2_valid;
            r3_s_0_R <= w_sxdg_0_R[16:1];
            r3_s_0_I <= w_sxdg_0_I[16:1];
            r3_s_1_R <= w_sxdg_1_R[16:1];
            r3_s_1_I <= w_sxdg_1_I[16:1];
            r3_s_2_R <= w_sxdg_2_R[16:1];
            r3_s_2_I <= w_sxdg_2_I[16:1];
            r3_s_3_R <= w_sxdg_3_R[16:1];
            r3_s_3_I <= w_sxdg_3_I[16:1];
        end
    end

    // ------------------------------------------------------------------------
    // Stage 4: Swap(0, 1) and Register Outputs
    // ------------------------------------------------------------------------
    // Swap(0, 1) swaps index 1 (|01>) and index 2 (|10>)
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_valid     <= 1'b0;
            io_out_QSV_0_0   <= 16'd0; io_out_QSV_0_1   <= 16'd0;
            io_out_QSV_1_0   <= 16'd0; io_out_QSV_1_1   <= 16'd0;
            io_out_QSV_2_0   <= 16'd0; io_out_QSV_2_1   <= 16'd0;
            io_out_QSV_3_0   <= 16'd0; io_out_QSV_3_1   <= 16'd0;
        end else begin
            io_out_valid     <= r3_valid;
            io_out_QSV_0_0   <= r3_s_0_R;
            io_out_QSV_0_1   <= r3_s_0_I;
            io_out_QSV_1_0   <= r3_s_2_R; // Swapped (originally state 2)
            io_out_QSV_1_1   <= r3_s_2_I; // Swapped (originally state 2)
            io_out_QSV_2_0   <= r3_s_1_R; // Swapped (originally state 1)
            io_out_QSV_2_1   <= r3_s_1_I; // Swapped (originally state 1)
            io_out_QSV_3_0   <= r3_s_3_R;
            io_out_QSV_3_1   <= r3_s_3_I;
        end
    end

endmodule
