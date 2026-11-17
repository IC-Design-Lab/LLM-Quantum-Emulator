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

    // Helper function for Q1.15 clamping and division
    function automatic logic signed [15:0] clamp(input logic signed [32:0] prod);
        logic signed [17:0] shifted;
        shifted = prod >>> 15;
        if (shifted > 18'sd32767) begin
            return 16'sd32767;
        end else if (shifted < -18'sd32768) begin
            return -16'sd32768;
        end else begin
            return shifted[15:0];
        end
    endfunction

    // -------------------------------------------------------------------------
    // STAGE 1: H gate on qubit 0
    // -------------------------------------------------------------------------
    logic signed [15:0] h_in_0_0, h_in_0_1, h_in_1_0, h_in_1_1;
    logic signed [15:0] h_in_2_0, h_in_2_1, h_in_3_0, h_in_3_1;

    assign h_in_0_0 = $signed(io_in_QSV_0_0);
    assign h_in_0_1 = $signed(io_in_QSV_0_1);
    assign h_in_1_0 = $signed(io_in_QSV_1_0);
    assign h_in_1_1 = $signed(io_in_QSV_1_1);
    assign h_in_2_0 = $signed(io_in_QSV_2_0);
    assign h_in_2_1 = $signed(io_in_QSV_2_1);
    assign h_in_3_0 = $signed(io_in_QSV_3_0);
    assign h_in_3_1 = $signed(io_in_QSV_3_1);

    // Sum and difference calculations
    logic signed [16:0] sum_01_0, sum_01_1, diff_01_0, diff_01_1;
    logic signed [16:0] sum_23_0, sum_23_1, diff_23_0, diff_23_1;

    assign sum_01_0 = $signed(h_in_0_0) + $signed(h_in_1_0);
    assign sum_01_1 = $signed(h_in_0_1) + $signed(h_in_1_1);
    assign diff_01_0 = $signed(h_in_0_0) - $signed(h_in_1_0);
    assign diff_01_1 = $signed(h_in_0_1) - $signed(h_in_1_1);

    assign sum_23_0 = $signed(h_in_2_0) + $signed(h_in_3_0);
    assign sum_23_1 = $signed(h_in_2_1) + $signed(h_in_3_1);
    assign diff_23_0 = $signed(h_in_2_0) - $signed(h_in_3_0);
    assign diff_23_1 = $signed(h_in_2_1) - $signed(h_in_3_1);

    // Products
    logic signed [32:0] prod_sum_01_0, prod_sum_01_1, prod_diff_01_0, prod_diff_01_1;
    logic signed [32:0] prod_sum_23_0, prod_sum_23_1, prod_diff_23_0, prod_diff_23_1;

    assign prod_sum_01_0 = sum_01_0 * 16'sd23170;
    assign prod_sum_01_1 = sum_01_1 * 16'sd23170;
    assign prod_diff_01_0 = diff_01_0 * 16'sd23170;
    assign prod_diff_01_1 = diff_01_1 * 16'sd23170;

    assign prod_sum_23_0 = sum_23_0 * 16'sd23170;
    assign prod_sum_23_1 = sum_23_1 * 16'sd23170;
    assign prod_diff_23_0 = diff_23_0 * 16'sd23170;
    assign prod_diff_23_1 = diff_23_1 * 16'sd23170;

    // Stage 1 output values to be registered
    logic signed [15:0] next_r1_0_0, next_r1_0_1, next_r1_1_0, next_r1_1_1;
    logic signed [15:0] next_r1_2_0, next_r1_2_1, next_r1_3_0, next_r1_3_1;

    assign next_r1_0_0 = clamp(prod_sum_01_0);
    assign next_r1_0_1 = clamp(prod_sum_01_1);
    assign next_r1_1_0 = clamp(prod_diff_01_0);
    assign next_r1_1_1 = clamp(prod_diff_01_1);

    assign next_r1_2_0 = clamp(prod_sum_23_0);
    assign next_r1_2_1 = clamp(prod_sum_23_1);
    assign next_r1_3_0 = clamp(prod_diff_23_0);
    assign next_r1_3_1 = clamp(prod_diff_23_1);

    // Stage 1 Registers
    logic signed [15:0] r1_0_0, r1_0_1, r1_1_0, r1_1_1;
    logic signed [15:0] r1_2_0, r1_2_1, r1_3_0, r1_3_1;
    logic               r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_0_0   <= '0;
            r1_0_1   <= '0;
            r1_1_0   <= '0;
            r1_1_1   <= '0;
            r1_2_0   <= '0;
            r1_2_1   <= '0;
            r1_3_0   <= '0;
            r1_3_1   <= '0;
            r1_valid <= 1'b0;
        end else begin
            r1_0_0   <= next_r1_0_0;
            r1_0_1   <= next_r1_0_1;
            r1_1_0   <= next_r1_1_0;
            r1_1_1   <= next_r1_1_1;
            r1_2_0   <= next_r1_2_0;
            r1_2_1   <= next_r1_2_1;
            r1_3_0   <= next_r1_3_0;
            r1_3_1   <= next_r1_3_1;
            r1_valid <= io_in_valid;
        end
    end

    // -------------------------------------------------------------------------
    // STAGE 2: X gate on qubit 1 (Swaps 0 <-> 2, and 1 <-> 3)
    // -------------------------------------------------------------------------
    logic signed [15:0] next_r2_0_0, next_r2_0_1, next_r2_1_0, next_r2_1_1;
    logic signed [15:0] next_r2_2_0, next_r2_2_1, next_r2_3_0, next_r2_3_1;

    assign next_r2_0_0 = r1_2_0;
    assign next_r2_0_1 = r1_2_1;
    assign next_r2_1_0 = r1_3_0;
    assign next_r2_1_1 = r1_3_1;

    assign next_r2_2_0 = r1_0_0;
    assign next_r2_2_1 = r1_0_1;
    assign next_r2_3_0 = r1_1_0;
    assign next_r2_3_1 = r1_1_1;

    // Stage 2 Registers
    logic signed [15:0] r2_0_0, r2_0_1, r2_1_0, r2_1_1;
    logic signed [15:0] r2_2_0, r2_2_1, r2_3_0, r2_3_1;
    logic               r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_0_0   <= '0;
            r2_0_1   <= '0;
            r2_1_0   <= '0;
            r2_1_1   <= '0;
            r2_2_0   <= '0;
            r2_2_1   <= '0;
            r2_3_0   <= '0;
            r2_3_1   <= '0;
            r2_valid <= 1'b0;
        end else begin
            r2_0_0   <= next_r2_0_0;
            r2_0_1   <= next_r2_0_1;
            r2_1_0   <= next_r2_1_0;
            r2_1_1   <= next_r2_1_1;
            r2_2_0   <= next_r2_2_0;
            r2_2_1   <= next_r2_2_1;
            r2_3_0   <= next_r2_3_0;
            r2_3_1   <= next_r2_3_1;
            r2_valid <= r1_valid;
        end
    end

    // -------------------------------------------------------------------------
    // STAGE 3: SWAP gate on qubits 0 and 1 (Swaps 1 <-> 2, keeps 0 and 3)
    // -------------------------------------------------------------------------
    logic signed [15:0] next_r3_0_0, next_r3_0_1, next_r3_1_0, next_r3_1_1;
    logic signed [15:0] next_r3_2_0, next_r3_2_1, next_r3_3_0, next_r3_3_1;

    assign next_r3_0_0 = r2_0_0;
    assign next_r3_0_1 = r2_0_1;

    assign next_r3_1_0 = r2_2_0;
    assign next_r3_1_1 = r2_2_1;

    assign next_r3_2_0 = r2_1_0;
    assign next_r3_2_1 = r2_1_1;

    assign next_r3_3_0 = r2_3_0;
    assign next_r3_3_1 = r2_3_1;

    // Stage 3 Registers
    logic signed [15:0] r3_0_0, r3_0_1, r3_1_0, r3_1_1;
    logic signed [15:0] r3_2_0, r3_2_1, r3_3_0, r3_3_1;
    logic               r3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_0_0   <= '0;
            r3_0_1   <= '0;
            r3_1_0   <= '0;
            r3_1_1   <= '0;
            r3_2_0   <= '0;
            r3_2_1   <= '0;
            r3_3_0   <= '0;
            r3_3_1   <= '0;
            r3_valid <= 1'b0;
        end else begin
            r3_0_0   <= next_r3_0_0;
            r3_0_1   <= next_r3_0_1;
            r3_1_0   <= next_r3_1_0;
            r3_1_1   <= next_r3_1_1;
            r3_2_0   <= next_r3_2_0;
            r3_2_1   <= next_r3_2_1;
            r3_3_0   <= next_r3_3_0;
            r3_3_1   <= next_r3_3_1;
            r3_valid <= r2_valid;
        end
    end

    // Output assignments
    assign io_out_QSV_0_0 = logic'(r3_0_0);
    assign io_out_QSV_0_1 = logic'(r3_0_1);
    assign io_out_QSV_1_0 = logic'(r3_1_0);
    assign io_out_QSV_1_1 = logic'(r3_1_1);
    assign io_out_QSV_2_0 = logic'(r3_2_0);
    assign io_out_QSV_2_1 = logic'(r3_2_1);
    assign io_out_QSV_3_0 = logic'(r3_3_0);
    assign io_out_QSV_3_1 = logic'(r3_3_1);
    assign io_out_valid   = r3_valid;

endmodule
