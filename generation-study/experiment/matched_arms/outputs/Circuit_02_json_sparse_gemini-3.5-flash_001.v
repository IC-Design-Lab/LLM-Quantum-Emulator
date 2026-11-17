module Circuit_02 (
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
    // STAGE 1: H on q0 (Pairs: (0,1) and (2,3))
    // ==========================================
    wire [15:0] s1_out_0_0, s1_out_0_1, s1_out_1_0, s1_out_1_1;
    wire [15:0] s1_out_2_0, s1_out_2_1, s1_out_3_0, s1_out_3_1;

    h_gate_op inst_s1_h0 (
        .in_A_r(io_in_QSV_0_0),
        .in_A_i(io_in_QSV_0_1),
        .in_B_r(io_in_QSV_1_0),
        .in_B_i(io_in_QSV_1_1),
        .out_A_r(s1_out_0_0),
        .out_A_i(s1_out_0_1),
        .out_B_r(s1_out_1_0),
        .out_B_i(s1_out_1_1)
    );

    h_gate_op inst_s1_h1 (
        .in_A_r(io_in_QSV_2_0),
        .in_A_i(io_in_QSV_2_1),
        .in_B_r(io_in_QSV_3_0),
        .in_B_i(io_in_QSV_3_1),
        .out_A_r(s1_out_2_0),
        .out_A_i(s1_out_2_1),
        .out_B_r(s1_out_3_0),
        .out_B_i(s1_out_3_1)
    );

    logic [15:0] reg_s1_QSV_0_0, reg_s1_QSV_0_1, reg_s1_QSV_1_0, reg_s1_QSV_1_1;
    logic [15:0] reg_s1_QSV_2_0, reg_s1_QSV_2_1, reg_s1_QSV_3_0, reg_s1_QSV_3_1;
    logic        reg_s1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_s1_QSV_0_0 <= '0;
            reg_s1_QSV_0_1 <= '0;
            reg_s1_QSV_1_0 <= '0;
            reg_s1_QSV_1_1 <= '0;
            reg_s1_QSV_2_0 <= '0;
            reg_s1_QSV_2_1 <= '0;
            reg_s1_QSV_3_0 <= '0;
            reg_s1_QSV_3_1 <= '0;
            reg_s1_valid   <= 1'b0;
        end else begin
            reg_s1_QSV_0_0 <= s1_out_0_0;
            reg_s1_QSV_0_1 <= s1_out_0_1;
            reg_s1_QSV_1_0 <= s1_out_1_0;
            reg_s1_QSV_1_1 <= s1_out_1_1;
            reg_s1_QSV_2_0 <= s1_out_2_0;
            reg_s1_QSV_2_1 <= s1_out_2_1;
            reg_s1_QSV_3_0 <= s1_out_3_0;
            reg_s1_QSV_3_1 <= s1_out_3_1;
            reg_s1_valid   <= io_in_valid;
        end
    end

    // ==========================================
    // STAGE 2: H on q1 (Pairs: (0,2) and (1,3))
    // ==========================================
    wire [15:0] s2_out_0_0, s2_out_0_1, s2_out_2_0, s2_out_2_1;
    wire [15:0] s2_out_1_0, s2_out_1_1, s2_out_3_0, s2_out_3_1;

    h_gate_op inst_s2_h0 (
        .in_A_r(reg_s1_QSV_0_0),
        .in_A_i(reg_s1_QSV_0_1),
        .in_B_r(reg_s1_QSV_2_0),
        .in_B_i(reg_s1_QSV_2_1),
        .out_A_r(s2_out_0_0),
        .out_A_i(s2_out_0_1),
        .out_B_r(s2_out_2_0),
        .out_B_i(s2_out_2_1)
    );

    h_gate_op inst_s2_h1 (
        .in_A_r(reg_s1_QSV_1_0),
        .in_A_i(reg_s1_QSV_1_1),
        .in_B_r(reg_s1_QSV_3_0),
        .in_B_i(reg_s1_QSV_3_1),
        .out_A_r(s2_out_1_0),
        .out_A_i(s2_out_1_1),
        .out_B_r(s2_out_3_0),
        .out_B_i(s2_out_3_1)
    );

    logic [15:0] reg_s2_QSV_0_0, reg_s2_QSV_0_1, reg_s2_QSV_1_0, reg_s2_QSV_1_1;
    logic [15:0] reg_s2_QSV_2_0, reg_s2_QSV_2_1, reg_s2_QSV_3_0, reg_s2_QSV_3_1;
    logic        reg_s2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_s2_QSV_0_0 <= '0;
            reg_s2_QSV_0_1 <= '0;
            reg_s2_QSV_1_0 <= '0;
            reg_s2_QSV_1_1 <= '0;
            reg_s2_QSV_2_0 <= '0;
            reg_s2_QSV_2_1 <= '0;
            reg_s2_QSV_3_0 <= '0;
            reg_s2_QSV_3_1 <= '0;
            reg_s2_valid   <= 1'b0;
        end else begin
            reg_s2_QSV_0_0 <= s2_out_0_0;
            reg_s2_QSV_0_1 <= s2_out_0_1;
            reg_s2_QSV_1_0 <= s2_out_1_0;
            reg_s2_QSV_1_1 <= s2_out_1_1;
            reg_s2_QSV_2_0 <= s2_out_2_0;
            reg_s2_QSV_2_1 <= s2_out_2_1;
            reg_s2_QSV_3_0 <= s2_out_3_0;
            reg_s2_QSV_3_1 <= s2_out_3_1;
            reg_s2_valid   <= reg_s1_valid;
        end
    end

    // ==========================================
    // STAGE 3: SWAP on q0, q1
    // (Swaps state vector indices 1 and 2)
    // ==========================================
    logic [15:0] reg_s3_QSV_0_0, reg_s3_QSV_0_1, reg_s3_QSV_1_0, reg_s3_QSV_1_1;
    logic [15:0] reg_s3_QSV_2_0, reg_s3_QSV_2_1, reg_s3_QSV_3_0, reg_s3_QSV_3_1;
    logic        reg_s3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_s3_QSV_0_0 <= '0;
            reg_s3_QSV_0_1 <= '0;
            reg_s3_QSV_1_0 <= '0;
            reg_s3_QSV_1_1 <= '0;
            reg_s3_QSV_2_0 <= '0;
            reg_s3_QSV_2_1 <= '0;
            reg_s3_QSV_3_0 <= '0;
            reg_s3_QSV_3_1 <= '0;
            reg_s3_valid   <= 1'b0;
        end else begin
            reg_s3_QSV_0_0 <= reg_s2_QSV_0_0;
            reg_s3_QSV_0_1 <= reg_s2_QSV_0_1;
            reg_s3_QSV_1_0 <= reg_s2_QSV_2_0; // swapped
            reg_s3_QSV_1_1 <= reg_s2_QSV_2_1; // swapped
            reg_s3_QSV_2_0 <= reg_s2_QSV_1_0; // swapped
            reg_s3_QSV_2_1 <= reg_s2_QSV_1_1; // swapped
            reg_s3_QSV_3_0 <= reg_s2_QSV_3_0;
            reg_s3_QSV_3_1 <= reg_s2_QSV_3_1;
            reg_s3_valid   <= reg_s2_valid;
        end
    end

    // Output assignments
    assign io_out_QSV_0_0 = reg_s3_QSV_0_0;
    assign io_out_QSV_0_1 = reg_s3_QSV_0_1;
    assign io_out_QSV_1_0 = reg_s3_QSV_1_0;
    assign io_out_QSV_1_1 = reg_s3_QSV_1_1;
    assign io_out_QSV_2_0 = reg_s3_QSV_2_0;
    assign io_out_QSV_2_1 = reg_s3_QSV_2_1;
    assign io_out_QSV_3_0 = reg_s3_QSV_3_0;
    assign io_out_QSV_3_1 = reg_s3_QSV_3_1;
    assign io_out_valid   = reg_s3_valid;

endmodule

// Helper module for Hadamard (H) Gate operation
module h_gate_op (
    input  logic [15:0] in_A_r,
    input  logic [15:0] in_A_i,
    input  logic [15:0] in_B_r,
    input  logic [15:0] in_B_i,
    output logic [15:0] out_A_r,
    output logic [15:0] out_A_i,
    output logic [15:0] out_B_r,
    output logic [15:0] out_B_i
);
    // 1/sqrt(2) in Q1.15 format (0.70710678 * 32768 = 23170 = 16'h5A82)
    localparam logic signed [15:0] INV_SQRT_2 = 16'h5A82;

    wire signed [16:0] sum_r  = $signed(in_A_r) + $signed(in_B_r);
    wire signed [16:0] sum_i  = $signed(in_A_i) + $signed(in_B_i);
    wire signed [16:0] diff_r = $signed(in_A_r) - $signed(in_B_r);
    wire signed [16:0] diff_i = $signed(in_A_i) - $signed(in_B_i);

    wire signed [32:0] prod_sum_r  = sum_r  * INV_SQRT_2;
    wire signed [32:0] prod_sum_i  = sum_i  * INV_SQRT_2;
    wire signed [32:0] prod_diff_r = diff_r * INV_SQRT_2;
    wire signed [32:0] prod_diff_i = diff_i * INV_SQRT_2;

    assign out_A_r = prod_sum_r[30:15];
    assign out_A_i = prod_sum_i[30:15];
    assign out_B_r = prod_diff_r[30:15];
    assign out_B_i = prod_diff_i[30:15];
endmodule
