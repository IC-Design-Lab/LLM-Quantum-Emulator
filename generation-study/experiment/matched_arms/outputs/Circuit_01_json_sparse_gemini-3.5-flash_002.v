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

    // --- Stage 1: Hadamard on Qubit 0 ---
    // Cast inputs to signed
    wire signed [15:0] s0_r0 = $signed(io_in_QSV_0_0);
    wire signed [15:0] s0_i0 = $signed(io_in_QSV_0_1);
    wire signed [15:0] s0_r1 = $signed(io_in_QSV_1_0);
    wire signed [15:0] s0_i1 = $signed(io_in_QSV_1_1);
    wire signed [15:0] s0_r2 = $signed(io_in_QSV_2_0);
    wire signed [15:0] s0_i2 = $signed(io_in_QSV_2_1);
    wire signed [15:0] s0_r3 = $signed(io_in_QSV_3_0);
    wire signed [15:0] s0_i3 = $signed(io_in_QSV_3_1);

    // Sums and differences
    wire signed [16:0] sum_0_0  = s0_r0 + s0_r1;
    wire signed [16:0] diff_0_0 = s0_r0 - s0_r1;
    wire signed [16:0] sum_0_1  = s0_i0 + s0_i1;
    wire signed [16:0] diff_0_1 = s0_i0 - s0_i1;

    wire signed [16:0] sum_2_0  = s0_r2 + s0_r3;
    wire signed [16:0] diff_2_0 = s0_r2 - s0_r3;
    wire signed [16:0] sum_2_1  = s0_i2 + s0_i2; // Note: actually s0_i2 + s0_i3
    wire signed [16:0] sum_2_1_corrected  = s0_r2 + s0_r3; // Wait, let's use the correct ones:
    wire signed [16:0] sum_q2_1 = s0_i2 + s0_i3;
    wire signed [16:0] diff_q2_1 = s0_i2 - s0_i3;

    // Fixed point scaling (1/sqrt(2) approx 23170 in Q15)
    wire signed [32:0] p_sum_0_0  = sum_0_0 * 17'sd23170;
    wire signed [32:0] p_diff_0_0 = diff_0_0 * 17'sd23170;
    wire signed [32:0] p_sum_0_1  = sum_0_1 * 17'sd23170;
    wire signed [32:0] p_diff_0_1 = diff_0_1 * 17'sd23170;

    wire signed [32:0] p_sum_2_0  = sum_2_0 * 17'sd23170;
    wire signed [32:0] p_diff_2_0 = diff_2_0 * 17'sd23170;
    wire signed [32:0] p_sum_2_1  = sum_q2_1 * 17'sd23170;
    wire signed [32:0] p_diff_2_1 = diff_q2_1 * 17'sd23170;

    // Shift right by 15
    wire signed [32:0] r_sum_0_0  = p_sum_0_0 >>> 15;
    wire signed [32:0] r_diff_0_0 = p_diff_0_0 >>> 15;
    wire signed [32:0] r_sum_0_1  = p_sum_0_1 >>> 15;
    wire signed [32:0] r_diff_0_1 = p_diff_0_1 >>> 15;

    wire signed [32:0] r_sum_2_0  = p_sum_2_0 >>> 15;
    wire signed [32:0] r_diff_2_0 = p_diff_2_0 >>> 15;
    wire signed [32:0] r_sum_2_1  = p_sum_2_1 >>> 15;
    wire signed [32:0] r_diff_2_1 = p_diff_2_1 >>> 15;

    // Registers for Stage 1
    logic        r1_valid;
    logic [15:0] r1_QSV_0_0;
    logic [15:0] r1_QSV_0_1;
    logic [15:0] r1_QSV_1_0;
    logic [15:0] r1_QSV_1_1;
    logic [15:0] r1_QSV_2_0;
    logic [15:0] r1_QSV_2_1;
    logic [15:0] r1_QSV_3_0;
    logic [15:0] r1_QSV_3_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_valid   <= 1'b0;
            r1_QSV_0_0 <= 16'h0;
            r1_QSV_0_1 <= 16'h0;
            r1_QSV_1_0 <= 16'h0;
            r1_QSV_1_1 <= 16'h0;
            r1_QSV_2_0 <= 16'h0;
            r1_QSV_2_1 <= 16'h0;
            r1_QSV_3_0 <= 16'h0;
            r1_QSV_3_1 <= 16'h0;
        end else begin
            r1_valid   <= io_in_valid;
            r1_QSV_0_0 <= r_sum_0_0[15:0];
            r1_QSV_0_1 <= r_sum_0_1[15:0];
            r1_QSV_1_0 <= r_diff_0_0[15:0];
            r1_QSV_1_1 <= r_diff_0_1[15:0];
            r1_QSV_2_0 <= r_sum_2_0[15:0];
            r1_QSV_2_1 <= r_sum_2_1[15:0];
            r1_QSV_3_0 <= r_diff_2_0[15:0];
            r1_QSV_3_1 <= r_diff_2_1[15:0];
        end
    end

    // --- Stage 2: Pauli-X on Qubit 1 ---
    // Swaps elements (0, 2) and (1, 3)
    logic        r2_valid;
    logic [15:0] r2_QSV_0_0;
    logic [15:0] r2_QSV_0_1;
    logic [15:0] r2_QSV_1_0;
    logic [15:0] r2_QSV_1_1;
    logic [15:0] r2_QSV_2_0;
    logic [15:0] r2_QSV_2_1;
    logic [15:0] r2_QSV_3_0;
    logic [15:0] r2_QSV_3_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_valid   <= 1'b0;
            r2_QSV_0_0 <= 16'h0;
            r2_QSV_0_1 <= 16'h0;
            r2_QSV_1_0 <= 16'h0;
            r2_QSV_1_1 <= 16'h0;
            r2_QSV_2_0 <= 16'h0;
            r2_QSV_2_1 <= 16'h0;
            r2_QSV_3_0 <= 16'h0;
            r2_QSV_3_1 <= 16'h0;
        end else begin
            r2_valid   <= r1_valid;
            r2_QSV_0_0 <= r1_QSV_2_0;
            r2_QSV_0_1 <= r1_QSV_2_1;
            r2_QSV_1_0 <= r1_QSV_3_0;
            r2_QSV_1_1 <= r1_QSV_3_1;
            r2_QSV_2_0 <= r1_QSV_0_0;
            r2_QSV_2_1 <= r1_QSV_0_1;
            r2_QSV_3_0 <= r1_QSV_1_0;
            r2_QSV_3_1 <= r1_QSV_1_1;
        end
    end

    // --- Stage 3: SWAP Qubits 0 and 1 ---
    // Swaps element 1 and 2, keeps 0 and 3 unchanged
    logic        r3_valid;
    logic [15:0] r3_QSV_0_0;
    logic [15:0] r3_QSV_0_1;
    logic [15:0] r3_QSV_1_0;
    logic [15:0] r3_QSV_1_1;
    logic [15:0] r3_QSV_2_0;
    logic [15:0] r3_QSV_2_1;
    logic [15:0] r3_QSV_3_0;
    logic [15:0] r3_QSV_3_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_valid   <= 1'b0;
            r3_QSV_0_0 <= 16'h0;
            r3_QSV_0_1 <= 16'h0;
            r3_QSV_1_0 <= 16'h0;
            r3_QSV_1_1 <= 16'h0;
            r3_QSV_2_0 <= 16'h0;
            r3_QSV_2_1 <= 16'h0;
            r3_QSV_3_0 <= 16'h0;
            r3_QSV_3_1 <= 16'h0;
        end else begin
            r3_valid   <= r2_valid;
            r3_QSV_0_0 <= r2_QSV_0_0;
            r3_QSV_0_1 <= r2_QSV_0_1;
            r3_QSV_1_0 <= r2_QSV_2_0;
            r3_QSV_1_1 <= r2_QSV_2_1;
            r3_QSV_2_0 <= r2_QSV_1_0;
            r3_QSV_2_1 <= r2_QSV_1_1;
            r3_QSV_3_0 <= r2_QSV_3_0;
            r3_QSV_3_1 <= r2_QSV_3_1;
        end
    end

    // --- Output Assignments ---
    assign io_out_QSV_0_0 = r3_QSV_0_0;
    assign io_out_QSV_0_1 = r3_QSV_0_1;
    assign io_out_QSV_1_0 = r3_QSV_1_0;
    assign io_out_QSV_1_1 = r3_QSV_1_1;
    assign io_out_QSV_2_0 = r3_QSV_2_0;
    assign io_out_QSV_2_1 = r3_QSV_2_1;
    assign io_out_QSV_3_0 = r3_QSV_3_0;
    assign io_out_QSV_3_1 = r3_QSV_3_1;
    assign io_out_valid   = r3_valid;

endmodule
