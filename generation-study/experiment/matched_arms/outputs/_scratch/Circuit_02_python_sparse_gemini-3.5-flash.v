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

    // Cast inputs to signed
    wire signed [15:0] in_0_0 = io_in_QSV_0_0;
    wire signed [15:0] in_0_1 = io_in_QSV_0_1;
    wire signed [15:0] in_1_0 = io_in_QSV_1_0;
    wire signed [15:0] in_1_1 = io_in_QSV_1_1;
    wire signed [15:0] in_2_0 = io_in_QSV_2_0;
    wire signed [15:0] in_2_1 = io_in_QSV_2_1;
    wire signed [15:0] in_3_0 = io_in_QSV_3_0;
    wire signed [15:0] in_3_1 = io_in_QSV_3_1;

    // Stage 1 registers
    logic signed [16:0] r1_A_add_re, r1_A_sub_re, r1_B_add_re, r1_B_sub_re;
    logic signed [16:0] r1_A_add_im, r1_A_sub_im, r1_B_add_im, r1_B_sub_im;
    logic               r1_valid;

    // Stage 2 registers
    logic signed [17:0] r2_out_0_0, r2_out_0_1;
    logic signed [17:0] r2_out_1_0, r2_out_1_1;
    logic signed [17:0] r2_out_2_0, r2_out_2_1;
    logic signed [17:0] r2_out_3_0, r2_out_3_1;
    logic               r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_A_add_re <= '0;
            r1_A_sub_re <= '0;
            r1_B_add_re <= '0;
            r1_B_sub_re <= '0;
            r1_A_add_im <= '0;
            r1_A_sub_im <= '0;
            r1_B_add_im <= '0;
            r1_B_sub_im <= '0;
            r1_valid    <= 1'b0;

            r2_out_0_0  <= '0;
            r2_out_0_1  <= '0;
            r2_out_1_0  <= '0;
            r2_out_1_1  <= '0;
            r2_out_2_0  <= '0;
            r2_out_2_1  <= '0;
            r2_out_3_0  <= '0;
            r2_out_3_1  <= '0;
            r2_valid    <= 1'b0;
        end else begin
            // Stage 1: Parallel sum/difference
            r1_A_add_re <= in_0_0 + in_1_0;
            r1_A_sub_re <= in_0_0 - in_1_0;
            r1_B_add_re <= in_2_0 + in_3_0;
            r1_B_sub_re <= in_2_0 - in_3_0;

            r1_A_add_im <= in_0_1 + in_1_1;
            r1_A_sub_im <= in_0_1 - in_1_1;
            r1_B_add_im <= in_2_1 + in_3_1;
            r1_B_sub_im <= in_2_1 - in_3_1;

            r1_valid    <= io_in_valid;

            // Stage 2: Combine and swap output states
            // swap(0,1) after H(0) and H(1) swaps indices 1 and 2
            r2_out_0_0  <= r1_A_add_re + r1_B_add_re;
            r2_out_0_1  <= r1_A_add_im + r1_B_add_im;

            r2_out_1_0  <= r1_A_add_re - r1_B_add_re;
            r2_out_1_1  <= r1_A_add_im - r1_B_add_im;

            r2_out_2_0  <= r1_A_sub_re + r1_B_sub_re;
            r2_out_2_1  <= r1_A_sub_im + r1_B_sub_im;

            r2_out_3_0  <= r1_A_sub_re - r1_B_sub_re;
            r2_out_3_1  <= r1_A_sub_im - r1_B_sub_im;

            r2_valid    <= r1_valid;
        end
    end

    // Divide by 2 using arithmetic shift and cast to 16-bit
    assign io_out_QSV_0_0 = r2_out_0_0[16:1];
    assign io_out_QSV_0_1 = r2_out_0_1[16:1];

    assign io_out_QSV_1_0 = r2_out_1_0[16:1];
    assign io_out_QSV_1_1 = r2_out_1_1[16:1];

    assign io_out_QSV_2_0 = r2_out_2_0[16:1];
    assign io_out_QSV_2_1 = r2_out_2_1[16:1];

    assign io_out_QSV_3_0 = r2_out_3_0[16:1];
    assign io_out_QSV_3_1 = r2_out_3_1[16:1];

    assign io_out_valid   = r2_valid;

endmodule
