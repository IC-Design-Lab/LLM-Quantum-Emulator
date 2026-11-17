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

    // Helper functions
    function automatic logic signed [15:0] q_mul_h_add(input logic signed [15:0] a, input logic signed [15:0] b);
        logic signed [16:0] sum;
        logic signed [32:0] prod;
        sum = a + b;
        prod = sum * 16'sd23170;
        return prod[30:15];
    endfunction

    function automatic logic signed [15:0] q_mul_h_sub(input logic signed [15:0] a, input logic signed [15:0] b);
        logic signed [16:0] diff;
        logic signed [32:0] prod;
        diff = a - b;
        prod = diff * 16'sd23170;
        return prod[30:15];
    endfunction

    function automatic logic signed [15:0] calc_sxdg_real_A(
        input logic signed [15:0] ra, input logic signed [15:0] ia,
        input logic signed [15:0] rb, input logic signed [15:0] ib
    );
        logic signed [17:0] temp;
        temp = ra + ia + rb - ib;
        return temp[16:1];
    endfunction

    function automatic logic signed [15:0] calc_sxdg_imag_A(
        input logic signed [15:0] ra, input logic signed [15:0] ia,
        input logic signed [15:0] rb, input logic signed [15:0] ib
    );
        logic signed [17:0] temp;
        temp = -ra + ia + rb + ib;
        return temp[16:1];
    endfunction

    function automatic logic signed [15:0] calc_sxdg_real_B(
        input logic signed [15:0] ra, input logic signed [15:0] ia,
        input logic signed [15:0] rb, input logic signed [15:0] ib
    );
        logic signed [17:0] temp;
        temp = ra - ia + rb + ib;
        return temp[16:1];
    endfunction

    function automatic logic signed [15:0] calc_sxdg_imag_B(
        input logic signed [15:0] ra, input logic signed [15:0] ia,
        input logic signed [15:0] rb, input logic signed [15:0] ib
    );
        logic signed [17:0] temp;
        temp = ra + ia - rb + ib;
        return temp[16:1];
    endfunction

    // Stage 1 Registers (Hadamard on Q0)
    logic signed [15:0] r1_QSV_0_0, r1_QSV_0_1;
    logic signed [15:0] r1_QSV_1_0, r1_QSV_1_1;
    logic signed [15:0] r1_QSV_2_0, r1_QSV_2_1;
    logic signed [15:0] r1_QSV_3_0, r1_QSV_3_1;
    logic               r1_valid;

    // Stage 1 Logic
    logic signed [15:0] s1_0_0, s1_0_1, s1_1_0, s1_1_1;
    logic signed [15:0] s1_2_0, s1_2_1, s1_3_0, s1_3_1;

    assign s1_0_0 = q_mul_h_add($signed(io_in_QSV_0_0), $signed(io_in_QSV_1_0));
    assign s1_0_1 = q_mul_h_add($signed(io_in_QSV_0_1), $signed(io_in_QSV_1_1));
    assign s1_1_0 = q_mul_h_sub($signed(io_in_QSV_0_0), $signed(io_in_QSV_1_0));
    assign s1_1_1 = q_mul_h_sub($signed(io_in_QSV_0_1), $signed(io_in_QSV_1_1));

    assign s1_2_0 = q_mul_h_add($signed(io_in_QSV_2_0), $signed(io_in_QSV_3_0));
    assign s1_2_1 = q_mul_h_add($signed(io_in_QSV_2_1), $signed(io_in_QSV_3_1));
    assign s1_3_0 = q_mul_h_sub($signed(io_in_QSV_2_0), $signed(io_in_QSV_3_0));
    assign s1_3_1 = q_mul_h_sub($signed(io_in_QSV_2_1), $signed(io_in_QSV_3_1));

    // Stage 2 Registers (SXdg on Q1)
    logic signed [15:0] r2_QSV_0_0, r2_QSV_0_1;
    logic signed [15:0] r2_QSV_1_0, r2_QSV_1_1;
    logic signed [15:0] r2_QSV_2_0, r2_QSV_2_1;
    logic signed [15:0] r2_QSV_3_0, r2_QSV_3_1;
    logic               r2_valid;

    // Stage 2 Logic
    logic signed [15:0] s2_0_0, s2_0_1, s2_1_0, s2_1_1;
    logic signed [15:0] s2_2_0, s2_2_1, s2_3_0, s2_3_1;

    assign s2_0_0 = calc_sxdg_real_A(r1_QSV_0_0, r1_QSV_0_1, r1_QSV_2_0, r1_QSV_2_1);
    assign s2_0_1 = calc_sxdg_imag_A(r1_QSV_0_0, r1_QSV_0_1, r1_QSV_2_0, r1_QSV_2_1);
    assign s2_2_0 = calc_sxdg_real_B(r1_QSV_0_0, r1_QSV_0_1, r1_QSV_2_0, r1_QSV_2_1);
    assign s2_2_1 = calc_sxdg_imag_B(r1_QSV_0_0, r1_QSV_0_1, r1_QSV_2_0, r1_QSV_2_1);

    assign s2_1_0 = calc_sxdg_real_A(r1_QSV_1_0, r1_QSV_1_1, r1_QSV_3_0, r1_QSV_3_1);
    assign s2_1_1 = calc_sxdg_imag_A(r1_QSV_1_0, r1_QSV_1_1, r1_QSV_3_0, r1_QSV_3_1);
    assign s2_3_0 = calc_sxdg_real_B(r1_QSV_1_0, r1_QSV_1_1, r1_QSV_3_0, r1_QSV_3_1);
    assign s2_3_1 = calc_sxdg_imag_B(r1_QSV_1_0, r1_QSV_1_1, r1_QSV_3_0, r1_QSV_3_1);

    // Sequential update
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_valid   <= 1'b0;
            r1_QSV_0_0 <= '0; r1_QSV_0_1 <= '0;
            r1_QSV_1_0 <= '0; r1_QSV_1_1 <= '0;
            r1_QSV_2_0 <= '0; r1_QSV_2_1 <= '0;
            r1_QSV_3_0 <= '0; r1_QSV_3_1 <= '0;

            r2_valid   <= 1'b0;
            r2_QSV_0_0 <= '0; r2_QSV_0_1 <= '0;
            r2_QSV_1_0 <= '0; r2_QSV_1_1 <= '0;
            r2_QSV_2_0 <= '0; r2_QSV_2_1 <= '0;
            r2_QSV_3_0 <= '0; r2_QSV_3_1 <= '0;
        end else begin
            r1_valid   <= io_in_valid;
            r1_QSV_0_0 <= s1_0_0; r1_QSV_0_1 <= s1_0_1;
            r1_QSV_1_0 <= s1_1_0; r1_QSV_1_1 <= s1_1_1;
            r1_QSV_2_0 <= s1_2_0; r1_QSV_2_1 <= s1_2_1;
            r1_QSV_3_0 <= s1_3_0; r1_QSV_3_1 <= s1_3_1;

            r2_valid   <= r1_valid;
            r2_QSV_0_0 <= s2_0_0; r2_QSV_0_1 <= s2_0_1;
            r2_QSV_1_0 <= s2_1_0; r2_QSV_1_1 <= s2_1_1;
            r2_QSV_2_0 <= s2_2_0; r2_QSV_2_1 <= s2_2_1;
            r2_QSV_3_0 <= s2_3_0; r2_QSV_3_1 <= s2_3_1;
        end
    end

    // Stage 3 (Output / Swap Logic)
    assign io_out_QSV_0_0 = r2_QSV_0_0;
    assign io_out_QSV_0_1 = r2_QSV_0_1;
    assign io_out_QSV_1_0 = r2_QSV_2_0; // Swapped
    assign io_out_QSV_1_1 = r2_QSV_2_1; // Swapped
    assign io_out_QSV_2_0 = r2_QSV_1_0; // Swapped
    assign io_out_QSV_2_1 = r2_QSV_1_1; // Swapped
    assign io_out_QSV_3_0 = r2_QSV_3_0;
    assign io_out_QSV_3_1 = r2_QSV_3_1;
    assign io_out_valid   = r2_valid;

endmodule
