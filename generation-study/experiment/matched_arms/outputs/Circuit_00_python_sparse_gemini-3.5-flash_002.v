module Circuit_00 (
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

    // Fixed-point representation of 1/sqrt(2) in Q15
    localparam logic signed [15:0] INV_SQRT2 = 16'sd23170;

    // Stage 0: Input registers
    logic signed [15:0] r0_c0_re, r0_c0_im;
    logic signed [15:0] r0_c1_re, r0_c1_im;
    logic signed [15:0] r0_c2_re, r0_c2_im;
    logic signed [15:0] r0_c3_re, r0_c3_im;
    logic               r0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_c0_re <= '0; r0_c0_im <= '0;
            r0_c1_re <= '0; r0_c1_im <= '0;
            r0_c2_re <= '0; r0_c2_im <= '0;
            r0_c3_re <= '0; r0_c3_im <= '0;
            r0_valid <= 1'b0;
        end else begin
            r0_c0_re <= $signed(io_in_QSV_0_0);
            r0_c0_im <= $signed(io_in_QSV_0_1);
            r0_c1_re <= $signed(io_in_QSV_1_0);
            r0_c1_im <= $signed(io_in_QSV_1_1);
            r0_c2_re <= $signed(io_in_QSV_2_0);
            r0_c2_im <= $signed(io_in_QSV_2_1);
            r0_c3_re <= $signed(io_in_QSV_3_0);
            r0_c3_im <= $signed(io_in_QSV_3_1);
            r0_valid <= io_in_valid;
        end
    end

    // Stage 1: Add/Subtract stage (Hadamard on qubit 0)
    logic signed [16:0] r1_sum_0_1_re, r1_sum_0_1_im;
    logic signed [16:0] r1_diff_0_1_re, r1_diff_0_1_im;
    logic signed [16:0] r1_sum_2_3_re, r1_sum_2_3_im;
    logic signed [16:0] r1_diff_2_3_re, r1_diff_2_3_im;
    logic               r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_sum_0_1_re  <= '0;
            r1_sum_0_1_im  <= '0;
            r1_diff_0_1_re <= '0;
            r1_diff_0_1_im <= '0;
            r1_sum_2_3_re  <= '0;
            r1_sum_2_3_im  <= '0;
            r1_diff_2_3_re <= '0;
            r1_diff_2_3_im <= '0;
            r1_valid       <= 1'b0;
        end else begin
            r1_sum_0_1_re  <= r0_c0_re + r0_c1_re;
            r1_sum_0_1_im  <= r0_c0_im + r0_c1_im;
            r1_diff_0_1_re <= r0_c0_re - r0_c1_re;
            r1_diff_0_1_im <= r0_c0_im - r0_c1_im;
            r1_sum_2_3_re  <= r0_c2_re + r0_c3_re;
            r1_sum_2_3_im  <= r0_c2_im + r0_c3_im;
            r1_diff_2_3_re <= r0_c2_re - r0_c3_re;
            r1_diff_2_3_im <= r0_c2_im - r0_c3_im;
            r1_valid       <= r0_valid;
        end
    end

    // Stage 2: Multiplication by 1/sqrt(2) & Output swap routing
    logic signed [32:0] prod_sum_0_1_re, prod_sum_0_1_im;
    logic signed [32:0] prod_diff_0_1_re, prod_diff_0_1_im;
    logic signed [32:0] prod_sum_2_3_re, prod_sum_2_3_im;
    logic signed [32:0] prod_diff_2_3_re, prod_diff_2_3_im;

    assign prod_sum_0_1_re  = r1_sum_0_1_re * INV_SQRT2;
    assign prod_sum_0_1_im  = r1_sum_0_1_im * INV_SQRT2;
    assign prod_diff_0_1_re = r1_diff_0_1_re * INV_SQRT2;
    assign prod_diff_0_1_im = r1_diff_0_1_im * INV_SQRT2;
    assign prod_sum_2_3_re  = r1_sum_2_3_re * INV_SQRT2;
    assign prod_sum_2_3_im  = r1_sum_2_3_im * INV_SQRT2;
    assign prod_diff_2_3_re = r1_diff_2_3_re * INV_SQRT2;
    assign prod_diff_2_3_im = r1_diff_2_3_im * INV_SQRT2;

    logic signed [15:0] h_c0_re, h_c0_im;
    logic signed [15:0] h_c1_re, h_c1_im;
    logic signed [15:0] h_c2_re, h_c2_im;
    logic signed [15:0] h_c3_re, h_c3_im;

    assign h_c0_re = prod_sum_0_1_re[30:15];
    assign h_c0_im = prod_sum_0_1_im[30:15];
    assign h_c1_re = prod_diff_0_1_re[30:15];
    assign h_c1_im = prod_diff_0_1_im[30:15];
    assign h_c2_re = prod_sum_2_3_re[30:15];
    assign h_c2_im = prod_sum_2_3_im[30:15];
    assign h_c3_re = prod_diff_2_3_re[30:15];
    assign h_c3_im = prod_diff_2_3_im[30:15];

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
            io_out_QSV_0_0 <= h_c0_re;
            io_out_QSV_0_1 <= h_c0_im;
            io_out_QSV_1_0 <= h_c2_re; // Swapped (Qubit 0 <-> 1)
            io_out_QSV_1_1 <= h_c2_im; // Swapped (Qubit 0 <-> 1)
            io_out_QSV_2_0 <= h_c1_re; // Swapped (Qubit 0 <-> 1)
            io_out_QSV_2_1 <= h_c1_im; // Swapped (Qubit 0 <-> 1)
            io_out_QSV_3_0 <= h_c3_re;
            io_out_QSV_3_1 <= h_c3_im;
            io_out_valid   <= r1_valid;
        end
    end

endmodule
