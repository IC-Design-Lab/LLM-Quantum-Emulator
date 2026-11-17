module Circuit_08 (
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

    // ==========================================
    // STAGE 1: Hadamard Gate on Qubit 0 (H(0))
    // ==========================================
    // Qubit 0 is the LSB.
    // Pairs: (0, 1) and (2, 3)

    // Intermediate sums for Pair 0 (states 0 and 1)
    logic signed [16:0] h0_sum_r0,  h0_diff_r0;
    logic signed [16:0] h0_sum_m0,  h0_diff_m0;
    assign h0_sum_r0  = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    assign h0_diff_r0 = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    assign h0_sum_m0  = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    assign h0_diff_m0 = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    // Intermediate sums for Pair 1 (states 2 and 3)
    logic signed [16:0] h0_sum_r1,  h0_diff_r1;
    logic signed [16:0] h0_sum_m1,  h0_diff_m1;
    assign h0_sum_r1  = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    assign h0_diff_r1 = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    assign h0_sum_m1  = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    assign h0_diff_m1 = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    // Multiplication with 1/sqrt(2) approx 23170 in Q1.15
    logic signed [33:0] h0_prod_r0_sum,  h0_prod_r0_diff;
    logic signed [33:0] h0_prod_m0_sum,  h0_prod_m0_diff;
    logic signed [33:0] h0_prod_r1_sum,  h0_prod_r1_diff;
    logic signed [33:0] h0_prod_m1_sum,  h0_prod_m1_diff;

    assign h0_prod_r0_sum  = h0_sum_r0  * 17'sd23170;
    assign h0_prod_r0_diff = h0_diff_r0 * 17'sd23170;
    assign h0_prod_m0_sum  = h0_sum_m0  * 17'sd23170;
    assign h0_prod_m0_diff = h0_diff_m0 * 17'sd23170;
    assign h0_prod_r1_sum  = h0_sum_r1  * 17'sd23170;
    assign h0_prod_r1_diff = h0_diff_r1 * 17'sd23170;
    assign h0_prod_m1_sum  = h0_sum_m1  * 17'sd23170;
    assign h0_prod_m1_diff = h0_diff_m1 * 17'sd23170;

    // Registers for Stage 1
    logic signed [15:0] r1_0, m1_0, r1_1, m1_1, r1_2, m1_2, r1_3, m1_3;
    logic               v1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_0     <= '0;
            m1_0     <= '0;
            r1_1     <= '0;
            m1_1     <= '0;
            r1_2     <= '0;
            m1_2     <= '0;
            r1_3     <= '0;
            m1_3     <= '0;
            v1_valid <= 1'b0;
        end else begin
            r1_0     <= h0_prod_r0_sum[30:15];
            m1_0     <= h0_prod_m0_sum[30:15];
            r1_1     <= h0_prod_r0_diff[30:15];
            m1_1     <= h0_prod_m0_diff[30:15];
            r1_2     <= h0_prod_r1_sum[30:15];
            m1_2     <= h0_prod_m1_sum[30:15];
            r1_3     <= h0_prod_r1_diff[30:15];
            m1_3     <= h0_prod_m1_diff[30:15];
            v1_valid <= io_in_valid;
        end
    end


    // ==========================================
    // STAGE 2: Controlled-NOT Gate (CX(0, 1))
    // ==========================================
    // Control: Qubit 0, Target: Qubit 1.
    // If Qubit 0 is 1, invert Qubit 1.
    // This swaps state 1 (|01>) and state 3 (|11>).
    // State 0 (|00>) and state 2 (|10>) remain unchanged.

    // Registers for Stage 2
    logic signed [15:0] r2_0, m2_0, r2_1, m2_1, r2_2, m2_2, r2_3, m2_3;
    logic               v2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_0     <= '0;
            m2_0     <= '0;
            r2_1     <= '0;
            m2_1     <= '0;
            r2_2     <= '0;
            m2_2     <= '0;
            r2_3     <= '0;
            m2_3     <= '0;
            v2_valid <= 1'b0;
        end else begin
            r2_0     <= r1_0;
            m2_0     <= m1_0;
            r2_1     <= r1_3; // Swapped with state 3
            m2_1     <= m1_3;
            r2_2     <= r1_2;
            m2_2     <= m1_2;
            r2_3     <= r1_1; // Swapped with state 1
            m2_3     <= m1_1;
            v2_valid <= v1_valid;
        end
    end


    // ==========================================
    // STAGE 3: Sqrt(X) Gate on Qubit 0 (SX(0))
    // ==========================================
    // Apply SX on Qubit 0. Pairs: (0, 1) and (2, 3)
    // Formula:
    // r'_0 = 1/2 * (r0 - m0 + r1 + m1)
    // m'_0 = 1/2 * (r0 + m0 - r1 + m1)
    // r'_1 = 1/2 * (r0 + m0 + r1 - m1)
    // m'_1 = 1/2 * (-r0 + m0 + r1 + m1)

    // Pair 0: States 0 and 1
    logic signed [17:0] sx_sum_r0, sx_sum_m0, sx_sum_r1, sx_sum_m1;
    assign sx_sum_r0 = $signed(r2_0) - $signed(m2_0) + $signed(r2_1) + $signed(m2_1);
    assign sx_sum_m0 = $signed(r2_0) + $signed(m2_0) - $signed(r2_1) + $signed(m2_1);
    assign sx_sum_r1 = $signed(r2_0) + $signed(m2_0) + $signed(r2_1) - $signed(m2_1);
    assign sx_sum_m1 = -$signed(r2_0) + $signed(m2_0) + $signed(r2_1) + $signed(m2_1);

    logic signed [17:0] sx_shift_r0, sx_shift_m0, sx_shift_r1, sx_shift_m1;
    assign sx_shift_r0 = sx_sum_r0 >>> 1;
    assign sx_shift_m0 = sx_sum_m0 >>> 1;
    assign sx_shift_r1 = sx_sum_r1 >>> 1;
    assign sx_shift_m1 = sx_sum_m1 >>> 1;

    // Pair 1: States 2 and 3
    logic signed [17:0] sx_sum_r2, sx_sum_m2, sx_sum_r3, sx_sum_m3;
    assign sx_sum_r2 = $signed(r2_2) - $signed(m2_2) + $signed(r2_3) + $signed(m2_3);
    assign sx_sum_m2 = $signed(r2_2) + $signed(m2_2) - $signed(r2_3) + $signed(m2_3);
    assign sx_sum_r3 = $signed(r2_2) + $signed(m2_2) + $signed(r2_3) - $signed(m2_3);
    assign sx_sum_m3 = -$signed(r2_2) + $signed(m2_2) + $signed(r2_3) + $signed(m2_3);

    logic signed [17:0] sx_shift_r2, sx_shift_m2, sx_shift_r3, sx_shift_m3;
    assign sx_shift_r2 = sx_sum_r2 >>> 1;
    assign sx_shift_m2 = sx_sum_m2 >>> 1;
    assign sx_shift_r3 = sx_sum_r3 >>> 1;
    assign sx_shift_m3 = sx_sum_m3 >>> 1;

    // Registers for Stage 3
    logic signed [15:0] r3_0, m3_0, r3_1, m3_1, r3_2, m3_2, r3_3, m3_3;
    logic               v3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_0     <= '0;
            m3_0     <= '0;
            r3_1     <= '0;
            m3_1     <= '0;
            r3_2     <= '0;
            m3_2     <= '0;
            r3_3     <= '0;
            m3_3     <= '0;
            v3_valid <= 1'b0;
        end else begin
            r3_0     <= sx_shift_r0[15:0];
            m3_0     <= sx_shift_m0[15:0];
            r3_1     <= sx_shift_r1[15:0];
            m3_1     <= sx_shift_m1[15:0];
            r3_2     <= sx_shift_r2[15:0];
            m3_2     <= sx_shift_m2[15:0];
            r3_3     <= sx_shift_r3[15:0];
            m3_3     <= sx_shift_m3[15:0];
            v3_valid <= v2_valid;
        end
    end


    // ==========================================
    // OUTPUT ASSIGNMENTS
    // ==========================================
    assign io_out_QSV_0_0 = r3_0;
    assign io_out_QSV_0_1 = m3_0;
    assign io_out_QSV_1_0 = r3_1;
    assign io_out_QSV_1_1 = m3_1;
    assign io_out_QSV_2_0 = r3_2;
    assign io_out_QSV_2_1 = m3_2;
    assign io_out_QSV_3_0 = r3_3;
    assign io_out_QSV_3_1 = m3_3;
    assign io_out_valid   = v3_valid;

endmodule
