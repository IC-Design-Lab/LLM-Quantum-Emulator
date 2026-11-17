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

    // --- Helper Module for Hadamard Pair ---
    // Calculates:
    // out0 = (in0 + in1) / sqrt(2)
    // out1 = (in0 - in1) / sqrt(2)
    // with 16-bit signed fixed point math
    interface class Hadamard_pkg;
        // Interface classes are not required, we can just define a helper module.
    endclass

    // Intermediate wires for Step 0 outputs
    logic [15:0] s0_out_0_0, s0_out_0_1, s0_out_1_0, s0_out_1_1;
    logic [15:0] s0_out_2_0, s0_out_2_1, s0_out_3_0, s0_out_3_1;

    // Step 0: Hadamard on qubit 0 (pairs 0-1 and 2-3)
    Hadamard_Pair h0_01 (
        .in_r0(io_in_QSV_0_0), .in_i0(io_in_QSV_0_1),
        .in_r1(io_in_QSV_1_0), .in_i1(io_in_QSV_1_1),
        .out_r0(s0_out_0_0), .out_i0(s0_out_0_1),
        .out_r1(s0_out_1_0), .out_i1(s0_out_1_1)
    );

    Hadamard_Pair h0_23 (
        .in_r0(io_in_QSV_2_0), .in_i0(io_in_QSV_2_1),
        .in_r1(io_in_QSV_3_0), .in_i1(io_in_QSV_3_1),
        .out_r0(s0_out_2_0), .out_i0(s0_out_2_1),
        .out_r1(s0_out_3_0), .out_i1(s0_out_3_1)
    );

    // Registers after Stage 1 (Step 0)
    logic [15:0] r_s1_0_0, r_s1_0_1, r_s1_1_0, r_s1_1_1;
    logic [15:0] r_s1_2_0, r_s1_2_1, r_s1_3_0, r_s1_3_1;
    logic        r_s1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_s1_0_0   <= '0;
            r_s1_0_1   <= '0;
            r_s1_1_0   <= '0;
            r_s1_1_1   <= '0;
            r_s1_2_0   <= '0;
            r_s1_2_1   <= '0;
            r_s1_3_0   <= '0;
            r_s1_3_1   <= '0;
            r_s1_valid <= 1'b0;
        end else begin
            r_s1_0_0   <= s0_out_0_0;
            r_s1_0_1   <= s0_out_0_1;
            r_s1_1_0   <= s0_out_1_0;
            r_s1_1_1   <= s0_out_1_1;
            r_s1_2_0   <= s0_out_2_0;
            r_s1_2_1   <= s0_out_2_1;
            r_s1_3_0   <= s0_out_3_0;
            r_s1_3_1   <= s0_out_3_1;
            r_s1_valid <= io_in_valid;
        end
    end

    // Step 1: CX on qubits [0, 1] (Control=0, Target=1)
    // Swaps state 1 and state 3; state 0 and state 2 remain unchanged.
    // Registering the results to Stage 2
    logic [15:0] r_s2_0_0, r_s2_0_1, r_s2_1_0, r_s2_1_1;
    logic [15:0] r_s2_2_0, r_s2_2_1, r_s2_3_0, r_s2_3_1;
    logic        r_s2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_s2_0_0   <= '0;
            r_s2_0_1   <= '0;
            r_s2_1_0   <= '0;
            r_s2_1_1   <= '0;
            r_s2_2_0   <= '0;
            r_s2_2_1   <= '0;
            r_s2_3_0   <= '0;
            r_s2_3_1   <= '0;
            r_s2_valid <= 1'b0;
        end else begin
            r_s2_0_0   <= r_s1_0_0;
            r_s2_0_1   <= r_s1_0_1;
            r_s2_1_0   <= r_s1_3_0; // Swapped with 3
            r_s2_1_1   <= r_s1_3_1; // Swapped with 3
            r_s2_2_0   <= r_s1_2_0;
            r_s2_2_1   <= r_s1_2_1;
            r_s2_3_0   <= r_s1_1_0; // Swapped with 1
            r_s2_3_1   <= r_s1_1_1; // Swapped with 1
            r_s2_valid <= r_s1_valid;
        end
    end

    // Step 2: Hadamard on qubit 0 (pairs 0-1 and 2-3 of stage 2 output)
    logic [15:0] s2_out_0_0, s2_out_0_1, s2_out_1_0, s2_out_1_1;
    logic [15:0] s2_out_2_0, s2_out_2_1, s2_out_3_0, s2_out_3_1;

    Hadamard_Pair h2_01 (
        .in_r0(r_s2_0_0), .in_i0(r_s2_0_1),
        .in_r1(r_s2_1_0), .in_i1(r_s2_1_1),
        .out_r0(s2_out_0_0), .out_i0(s2_out_0_1),
        .out_r1(s2_out_1_0), .out_i1(s2_out_1_1)
    );

    Hadamard_Pair h2_23 (
        .in_r0(r_s2_2_0), .in_i0(r_s2_2_1),
        .in_r1(r_s2_3_0), .in_i1(r_s2_3_1),
        .out_r0(s2_out_2_0), .out_i0(s2_out_2_1),
        .out_r1(s2_out_3_0), .out_i1(s2_out_3_1)
    );

    // Final Stage output registers
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_QSV_0_0 <= '0;
            io_out_QSV_0_1 <= '0;
            io_out_QSV_1_0 <= '0;
            io_out_QSV_1_1 <= '0;
            io_out_QSV_2_0 <= '0;
            io_out_QSV_2_1 <= '0;
            io_out_QSV_3_0 <= '0;
            io_out_QSV_3_1 <= '0;
            io_out_valid   <= 1'b0;
        end else begin
            io_out_QSV_0_0 <= s2_out_0_0;
            io_out_QSV_0_1 <= s2_out_0_1;
            io_out_QSV_1_0 <= s2_out_1_0;
            io_out_QSV_1_1 <= s2_out_1_1;
            io_out_QSV_2_0 <= s2_out_2_0;
            io_out_QSV_2_1 <= s2_out_2_1;
            io_out_QSV_3_0 <= s2_out_3_0;
            io_out_QSV_3_1 <= s2_out_3_1;
            io_out_valid   <= r_s2_valid;
        end
    end

endmodule

module Hadamard_Pair (
    input  logic signed [15:0] in_r0,
    input  logic signed [15:0] in_i0,
    input  logic signed [15:0] in_r1,
    input  logic signed [15:0] in_i1,
    output logic signed [15:0] out_r0,
    output logic signed [15:0] out_i0,
    output logic signed [15:0] out_r1,
    output logic signed [15:0] out_i1
);
    localparam logic signed [15:0] INV_SQRT2 = 16'sd23170; // 0.7071 * 32768

    logic signed [16:0] sum_r, diff_r;
    logic signed [16:0] sum_i, diff_i;

    assign sum_r  = $signed(in_r0) + $signed(in_r1);
    assign diff_r = $signed(in_r0) - $signed(in_r1);
    assign sum_i  = $signed(in_i0) + $signed(in_i1);
    assign diff_i = $signed(in_i0) - $signed(in_i1);

    logic signed [32:0] prod_sum_r, prod_diff_r;
    logic signed [32:0] prod_sum_i, prod_diff_i;

    assign prod_sum_r  = sum_r  * INV_SQRT2;
    assign prod_diff_r = diff_r * INV_SQRT2;
    assign prod_sum_i  = sum_i  * INV_SQRT2;
    assign prod_diff_i = diff_i * INV_SQRT2;

    assign out_r0 = 16'(prod_sum_r  >>> 15);
    assign out_r1 = 16'(prod_diff_r >>> 15);
    assign out_i0 = 16'(prod_sum_i  >>> 15);
    assign out_i1 = 16'(prod_diff_i >>> 15);
endmodule
