`default_nettype none

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

    // Stage 0 registers (input capture)
    logic signed [15:0] r_0_q0, m_0_q0;
    logic signed [15:0] r_1_q0, m_1_q0;
    logic signed [15:0] r_2_q0, m_2_q0;
    logic signed [15:0] r_3_q0, m_3_q0;
    logic               valid_q0;

    always_ff @(posedge clock) begin
        if (reset) begin
            valid_q0 <= 1'b0;
        end else begin
            valid_q0 <= io_in_valid;
        end
        r_0_q0 <= $signed(io_in_QSV_0_0);
        m_0_q0 <= $signed(io_in_QSV_0_1);
        r_1_q0 <= $signed(io_in_QSV_1_0);
        m_1_q0 <= $signed(io_in_QSV_1_1);
        r_2_q0 <= $signed(io_in_QSV_2_0);
        m_2_q0 <= $signed(io_in_QSV_2_1);
        r_3_q0 <= $signed(io_in_QSV_3_0);
        m_3_q0 <= $signed(io_in_QSV_3_1);
    end

    // Stage 1: Hadamard on Qubit 0
    // c0' = (c0 + c1) / sqrt(2)
    // c1' = (c0 - c1) / sqrt(2)
    // c2' = (c2 + c3) / sqrt(2)
    // c3' = (c2 - c3) / sqrt(2)
    
    wire signed [16:0] h0_sum_r0 = r_0_q0 + r_1_q0;
    wire signed [16:0] h0_sum_m0 = m_0_q0 + m_1_q0;
    wire signed [16:0] h0_sub_r1 = r_0_q0 - r_1_q0;
    wire signed [16:0] h0_sub_m1 = m_0_q0 - m_1_q0;

    wire signed [16:0] h0_sum_r2 = r_2_q0 + r_3_q0;
    wire signed [16:0] h0_sum_m2 = m_2_q0 + m_3_q0;
    wire signed [16:0] h0_sub_r3 = r_2_q0 - r_3_q0;
    wire signed [16:0] h0_sub_m3 = m_2_q0 - m_3_q0;

    // 1/sqrt(2) approx in Q15: 23170 (0.70709)
    wire signed [32:0] h0_prod_r0 = h0_sum_r0 * 16'sd23170;
    wire signed [32:0] h0_prod_m0 = h0_sum_m0 * 16'sd23170;
    wire signed [32:0] h0_prod_r1 = h0_sub_r1 * 16'sd23170;
    wire signed [32:0] h0_prod_m1 = h0_sub_m1 * 16'sd23170;

    wire signed [32:0] h0_prod_r2 = h0_sum_r2 * 16'sd23170;
    wire signed [32:0] h0_prod_m2 = h0_sum_m2 * 16'sd23170;
    wire signed [32:0] h0_prod_r3 = h0_sub_r3 * 16'sd23170;
    wire signed [32:0] h0_prod_m3 = h0_sub_m3 * 16'sd23170;

    logic signed [15:0] r_0_q1, m_0_q1;
    logic signed [15:0] r_1_q1, m_1_q1;
    logic signed [15:0] r_2_q1, m_2_q1;
    logic signed [15:0] r_3_q1, m_3_q1;
    logic               valid_q1;

    always_ff @(posedge clock) begin
        if (reset) begin
            valid_q1 <= 1'b0;
        end else begin
            valid_q1 <= valid_q0;
        end
        r_0_q1 <= h0_prod_r0[30:15];
        m_0_q1 <= h0_prod_m0[30:15];
        r_1_q1 <= h0_prod_r1[30:15];
        m_1_q1 <= h0_prod_m1[30:15];
        r_2_q1 <= h0_prod_r2[30:15];
        m_2_q1 <= h0_prod_m2[30:15];
        r_3_q1 <= h0_prod_r3[30:15];
        m_3_q1 <= h0_prod_m3[30:15];
    end

    // Stage 2: SXdg on Qubit 1
    // Acts on pairs (c0, c2) and (c1, c3)
    
    wire signed [17:0] sxdg_r0_sum = r_0_q1 + r_2_q1 + m_0_q1 - m_2_q1;
    wire signed [17:0] sxdg_m0_sum = -r_0_q1 + r_2_q1 + m_0_q1 + m_2_q1;
    wire signed [17:0] sxdg_r2_sum = r_0_q1 + r_2_q1 - m_0_q1 + m_2_q1;
    wire signed [17:0] sxdg_m2_sum = r_0_q1 - r_2_q1 + m_0_q1 + m_2_q1;

    wire signed [17:0] sxdg_r1_sum = r_1_q1 + r_3_q1 + m_1_q1 - m_3_q1;
    wire signed [17:0] sxdg_m1_sum = -r_1_q1 + r_3_q1 + m_1_q1 + m_3_q1;
    wire signed [17:0] sxdg_r3_sum = r_1_q1 + r_3_q1 - m_1_q1 + m_3_q1;
    wire signed [17:0] sxdg_m3_sum = r_1_q1 - r_3_q1 + m_1_q1 + m_3_q1;

    logic signed [15:0] r_0_q2, m_0_q2;
    logic signed [15:0] r_1_q2, m_1_q2;
    logic signed [15:0] r_2_q2, m_2_q2;
    logic signed [15:0] r_3_q2, m_3_q2;
    logic               valid_q2;

    always_ff @(posedge clock) begin
        if (reset) begin
            valid_q2 <= 1'b0;
        end else begin
            valid_q2 <= valid_q1;
        end
        r_0_q2 <= 16'(sxdg_r0_sum >>> 1);
        m_0_q2 <= 16'(sxdg_m0_sum >>> 1);
        r_2_q2 <= 16'(sxdg_r2_sum >>> 1);
        m_2_q2 <= 16'(sxdg_m2_sum >>> 1);
        r_1_q2 <= 16'(sxdg_r1_sum >>> 1);
        m_1_q2 <= 16'(sxdg_m1_sum >>> 1);
        r_3_q2 <= 16'(sxdg_r3_sum >>> 1);
        m_3_q2 <= 16'(sxdg_m3_sum >>> 1);
    end

    // Stage 3: SWAP(0, 1) and output registration
    // SWAP swaps state 1 and 2.
    always_ff @(posedge clock) begin
        if (reset) begin
            io_out_valid <= 1'b0;
        end else begin
            io_out_valid <= valid_q2;
        end
        io_out_QSV_0_0 <= r_0_q2;
        io_out_QSV_0_1 <= m_0_q2;
        io_out_QSV_1_0 <= r_2_q2; // swapped from state 2
        io_out_QSV_1_1 <= m_2_q2; // swapped from state 2
        io_out_QSV_2_0 <= r_1_q2; // swapped from state 1
        io_out_QSV_2_1 <= m_1_q2; // swapped from state 1
        io_out_QSV_3_0 <= r_3_q2;
        io_out_QSV_3_1 <= m_3_q2;
    end

endmodule
