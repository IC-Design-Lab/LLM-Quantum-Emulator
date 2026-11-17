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

    // --- Stage 1: H Gate on Qubit 0 ---
    logic signed [15:0] r0_in, i0_in, r1_in, i1_in, r2_in, i2_in, r3_in, i3_in;
    assign r0_in = io_in_QSV_0_0;
    assign i0_in = io_in_QSV_0_1;
    assign r1_in = io_in_QSV_1_0;
    assign i1_in = io_in_QSV_1_1;
    assign r2_in = io_in_QSV_2_0;
    assign i2_in = io_in_QSV_2_1;
    assign r3_in = io_in_QSV_3_0;
    assign i3_in = io_in_QSV_3_1;

    logic signed [16:0] h_sum_r0, h_sum_i0, h_diff_r0, h_diff_i0;
    logic signed [16:0] h_sum_r2, h_sum_i2, h_diff_r2, h_diff_i2;

    assign h_sum_r0  = $signed(r0_in) + $signed(r1_in);
    assign h_sum_i0  = $signed(i0_in) + $signed(i1_in);
    assign h_diff_r0 = $signed(r0_in) - $signed(r1_in);
    assign h_diff_i0 = $signed(i0_in) - $signed(i1_in);

    assign h_sum_r2  = $signed(r2_in) + $signed(r3_in);
    assign h_sum_i2  = $signed(i2_in) + $signed(i3_in);
    assign h_diff_r2 = $signed(r2_in) - $signed(r3_in);
    assign h_diff_i2 = $signed(i2_in) - $signed(i3_in);

    logic signed [32:0] h_prod_r0, h_prod_i0, h_prod_r1, h_prod_i1;
    logic signed [32:0] h_prod_r2, h_prod_i2, h_prod_r3, h_prod_i3;

    assign h_prod_r0 = h_sum_r0  * 17'sd23170;
    assign h_prod_i0 = h_sum_i0  * 17'sd23170;
    assign h_prod_r1 = h_diff_r0 * 17'sd23170;
    assign h_prod_i1 = h_diff_i0 * 17'sd23170;

    assign h_prod_r2 = h_sum_r2  * 17'sd23170;
    assign h_prod_i2 = h_sum_i2  * 17'sd23170;
    assign h_prod_r3 = h_diff_r2 * 17'sd23170;
    assign h_prod_i3 = h_diff_i2 * 17'sd23170;

    logic signed [15:0] h_r0, h_i0, h_r1, h_i1, h_r2, h_i2, h_r3, h_i3;
    logic h_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            h_r0    <= '0;
            h_i0    <= '0;
            h_r1    <= '0;
            h_i1    <= '0;
            h_r2    <= '0;
            h_i2    <= '0;
            h_r3    <= '0;
            h_i3    <= '0;
            h_valid <= 1'b0;
        end else begin
            h_r0    <= 16'(h_prod_r0 >>> 15);
            h_i0    <= 16'(h_prod_i0 >>> 15);
            h_r1    <= 16'(h_prod_r1 >>> 15);
            h_i1    <= 16'(h_prod_i1 >>> 15);
            h_r2    <= 16'(h_prod_r2 >>> 15);
            h_i2    <= 16'(h_prod_i2 >>> 15);
            h_r3    <= 16'(h_prod_r3 >>> 15);
            h_i3    <= 16'(h_prod_i3 >>> 15);
            h_valid <= io_in_valid;
        end
    end

    // --- Stage 2: CX(0,1) Permutation and SX Gate on Qubit 0 ---
    logic signed [17:0] sx_sum_r0, sx_sum_i0, sx_sum_r1, sx_sum_i1;
    logic signed [17:0] sx_sum_r2, sx_sum_i2, sx_sum_r3, sx_sum_i3;

    // Pair 1: (h_v0, h_v3) -> (v_out0, v_out1)
    assign sx_sum_r0 = $signed(h_r0) - $signed(h_i0) + $signed(h_r3) + $signed(h_i3);
    assign sx_sum_i0 = $signed(h_r0) + $signed(h_i0) - $signed(h_r3) + $signed(h_i3);
    assign sx_sum_r1 = $signed(h_r0) + $signed(h_i0) + $signed(h_r3) - $signed(h_i3);
    assign sx_sum_i1 = $signed(h_i0) + $signed(h_r3) + $signed(h_i3) - $signed(h_r0);

    // Pair 2: (h_v2, h_v1) -> (v_out2, v_out3)
    assign sx_sum_r2 = $signed(h_r2) - $signed(h_i2) + $signed(h_r1) + $signed(h_i1);
    assign sx_sum_i2 = $signed(h_r2) + $signed(h_i2) - $signed(h_r1) + $signed(h_i1);
    assign sx_sum_r3 = $signed(h_r2) + $signed(h_i2) + $signed(h_r1) - $signed(h_i1);
    assign sx_sum_i3 = $signed(h_i2) + $signed(h_r1) + $signed(h_i1) - $signed(h_r2);

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
            io_out_QSV_0_0 <= 16'(sx_sum_r0 >>> 1);
            io_out_QSV_0_1 <= 16'(sx_sum_i0 >>> 1);
            io_out_QSV_1_0 <= 16'(sx_sum_r1 >>> 1);
            io_out_QSV_1_1 <= 16'(sx_sum_i1 >>> 1);
            io_out_QSV_2_0 <= 16'(sx_sum_r2 >>> 1);
            io_out_QSV_2_1 <= 16'(sx_sum_i2 >>> 1);
            io_out_QSV_3_0 <= 16'(sx_sum_r3 >>> 1);
            io_out_QSV_3_1 <= 16'(sx_sum_i3 >>> 1);
            io_out_valid   <= h_valid;
        end
    end

endmodule
