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

    // ==========================================
    // STAGE 1: Hadamard Gate (H on Qubit 0)
    // ==========================================
    logic signed [16:0] h_sum_x0, h_sum_y0, h_diff_x0, h_diff_y0;
    logic signed [16:0] h_sum_x2, h_sum_y2, h_diff_x2, h_diff_y2;

    assign h_sum_x0  = signed'(io_in_QSV_0_0) + signed'(io_in_QSV_1_0);
    assign h_sum_y0  = signed'(io_in_QSV_0_1) + signed'(io_in_QSV_1_1);
    assign h_diff_x0 = signed'(io_in_QSV_0_0) - signed'(io_in_QSV_1_0);
    assign h_diff_y0 = signed'(io_in_QSV_0_1) - signed'(io_in_QSV_1_1);

    assign h_sum_x2  = signed'(io_in_QSV_2_0) + signed'(io_in_QSV_3_0);
    assign h_sum_y2  = signed'(io_in_QSV_2_1) + signed'(io_in_QSV_3_1);
    assign h_diff_x2 = signed'(io_in_QSV_2_0) - signed'(io_in_QSV_3_0);
    assign h_diff_y2 = signed'(io_in_QSV_2_1) - signed'(io_in_QSV_3_1);

    logic signed [32:0] h_prod_x0, h_prod_y0, h_prod_x1, h_prod_y1;
    logic signed [32:0] h_prod_x2, h_prod_y2, h_prod_x3, h_prod_y3;

    // Multiply by 1/sqrt(2) ~ 23170 (using Q15 representation)
    assign h_prod_x0 = h_sum_x0  * 17'sd23170;
    assign h_prod_y0 = h_sum_y0  * 17'sd23170;
    assign h_prod_x1 = h_diff_x0 * 17'sd23170;
    assign h_prod_y1 = h_diff_y0 * 17'sd23170;

    assign h_prod_x2 = h_sum_x2  * 17'sd23170;
    assign h_prod_y2 = h_sum_y2  * 17'sd23170;
    assign h_prod_x3 = h_diff_x2 * 17'sd23170;
    assign h_prod_y3 = h_diff_y2 * 17'sd23170;

    logic signed [15:0] r1_x0, r1_y0, r1_x1, r1_y1;
    logic signed [15:0] r1_x2, r1_y2, r1_x3, r1_y3;
    logic r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_x0    <= '0;
            r1_y0    <= '0;
            r1_x1    <= '0;
            r1_y1    <= '0;
            r1_x2    <= '0;
            r1_y2    <= '0;
            r1_x3    <= '0;
            r1_y3    <= '0;
            r1_valid <= 1'b0;
        end else begin
            r1_x0    <= 16'(h_prod_x0 >>> 15);
            r1_y0    <= 16'(h_prod_y0 >>> 15);
            r1_x1    <= 16'(h_prod_x1 >>> 15);
            r1_y1    <= 16'(h_prod_y1 >>> 15);
            r1_x2    <= 16'(h_prod_x2 >>> 15);
            r1_y2    <= 16'(h_prod_y2 >>> 15);
            r1_x3    <= 16'(h_prod_x3 >>> 15);
            r1_y3    <= 16'(h_prod_y3 >>> 15);
            r1_valid <= io_in_valid;
        end
    end

    // ==========================================
    // STAGE 2: Sxdg Gate (Sxdg on Qubit 1)
    // ==========================================
    logic signed [17:0] s_sum_x0, s_sum_y0, s_sum_x2, s_sum_y2;
    logic signed [17:0] s_sum_x1, s_sum_y1, s_sum_x3, s_sum_y3;

    assign s_sum_x0 = r1_x0 + r1_y0 + r1_x2 - r1_y2;
    assign s_sum_y0 = r1_y0 - r1_x0 + r1_x2 + r1_y2;
    assign s_sum_x2 = r1_x0 - r1_y0 + r1_x2 + r1_y2;
    assign s_sum_y2 = r1_x0 + r1_y0 - r1_x2 + r1_y2;

    assign s_sum_x1 = r1_x1 + r1_y1 + r1_x3 - r1_y3;
    assign s_sum_y1 = r1_y1 - r1_x1 + r1_x3 + r1_y3;
    assign s_sum_x3 = r1_x1 - r1_y1 + r1_x3 + r1_y3;
    assign s_sum_y3 = r1_x1 + r1_y1 - r1_x3 + r1_y3;

    logic signed [15:0] r2_x0, r2_y0, r2_x1, r2_y1;
    logic signed [15:0] r2_x2, r2_y2, r2_x3, r2_y3;
    logic r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_x0    <= '0;
            r2_y0    <= '0;
            r2_x1    <= '0;
            r2_y1    <= '0;
            r2_x2    <= '0;
            r2_y2    <= '0;
            r2_x3    <= '0;
            r2_y3    <= '0;
            r2_valid <= 1'b0;
        end else begin
            r2_x0    <= 16'(s_sum_x0 >>> 1);
            r2_y0    <= 16'(s_sum_y0 >>> 1);
            r2_x1    <= 16'(s_sum_x1 >>> 1);
            r2_y1    <= 16'(s_sum_y1 >>> 1);
            r2_x2    <= 16'(s_sum_x2 >>> 1);
            r2_y2    <= 16'(s_sum_y2 >>> 1);
            r2_x3    <= 16'(s_sum_x3 >>> 1);
            r2_y3    <= 16'(s_sum_y3 >>> 1);
            r2_valid <= r1_valid;
        end
    end

    // ==========================================
    // STAGE 3: Swap Gate (Swap Qubit 0 and 1)
    // ==========================================
    logic signed [15:0] r3_x0, r3_y0, r3_x1, r3_y1;
    logic signed [15:0] r3_x2, r3_y2, r3_x3, r3_y3;
    logic r3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_x0    <= '0;
            r3_y0    <= '0;
            r3_x1    <= '0;
            r3_y1    <= '0;
            r3_x2    <= '0;
            r3_y2    <= '0;
            r3_x3    <= '0;
            r3_y3    <= '0;
            r3_valid <= 1'b0;
        end else begin
            r3_x0    <= r2_x0;
            r3_y0    <= r2_y0;
            // Swap state |01> (index 1) and state |10> (index 2)
            r3_x1    <= r2_x2;
            r3_y1    <= r2_y2;
            r3_x2    <= r2_x1;
            r3_y2    <= r2_y1;
            r3_x3    <= r2_x3;
            r3_y3    <= r2_y3;
            r3_valid <= r2_valid;
        end
    end

    // ==========================================
    // Output Assignments
    // ==========================================
    assign io_out_QSV_0_0 = logic'(r3_x0);
    assign io_out_QSV_0_1 = logic'(r3_y0);
    assign io_out_QSV_1_0 = logic'(r3_x1);
    assign io_out_QSV_1_1 = logic'(r3_y1);
    assign io_out_QSV_2_0 = logic'(r3_x2);
    assign io_out_QSV_2_1 = logic'(r3_y2);
    assign io_out_QSV_3_0 = logic'(r3_x3);
    assign io_out_QSV_3_1 = logic'(r3_y3);
    assign io_out_valid   = r3_valid;

endmodule
