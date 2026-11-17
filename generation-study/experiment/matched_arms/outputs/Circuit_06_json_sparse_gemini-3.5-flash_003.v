module Circuit_06 (
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

    // Hadamard calculation function in Q1.15 fixed-point
    function automatic logic [15:0] h_calc(input logic [15:0] a, input logic [15:0] b, input logic sub);
        logic signed [16:0] sum_diff;
        logic signed [33:0] prod;
        logic signed [33:0] prod_shifted;
        begin
            if (sub) begin
                sum_diff = $signed(a) - $signed(b);
            end else begin
                sum_diff = $signed(a) + $signed(b);
            end
            prod = sum_diff * 17'sd23170; // 23170 / 32768 approx 0.7071
            prod_shifted = prod >>> 15;
            return prod_shifted[15:0];
        end
    endfunction

    // Stage 0: H on qubit 0 (LSB)
    logic        valid_stage0;
    logic [15:0] r_t0_real, r_t0_imag;
    logic [15:0] r_t1_real, r_t1_imag;
    logic [15:0] r_t2_real, r_t2_imag;
    logic [15:0] r_t3_real, r_t3_imag;

    // Stage 1: CX on control=0, target=1 (Swaps state 1 and 3)
    logic        valid_stage1;
    logic [15:0] r_out_0_0, r_out_0_1;
    logic [15:0] r_out_1_0, r_out_1_1;
    logic [15:0] r_out_2_0, r_out_2_1;
    logic [15:0] r_out_3_0, r_out_3_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            valid_stage0 <= 1'b0;
            valid_stage1 <= 1'b0;
            r_t0_real    <= 16'h0;
            r_t0_imag    <= 16'h0;
            r_t1_real    <= 16'h0;
            r_t1_imag    <= 16'h0;
            r_t2_real    <= 16'h0;
            r_t2_imag    <= 16'h0;
            r_t3_real    <= 16'h0;
            r_t3_imag    <= 16'h0;
            r_out_0_0    <= 16'h0;
            r_out_0_1    <= 16'h0;
            r_out_1_0    <= 16'h0;
            r_out_1_1    <= 16'h0;
            r_out_2_0    <= 16'h0;
            r_out_2_1    <= 16'h0;
            r_out_3_0    <= 16'h0;
            r_out_3_1    <= 16'h0;
        end else begin
            valid_stage0 <= io_in_valid;
            valid_stage1 <= valid_stage0;

            if (io_in_valid) begin
                r_t0_real <= h_calc(io_in_QSV_0_0, io_in_QSV_1_0, 1'b0);
                r_t0_imag <= h_calc(io_in_QSV_0_1, io_in_QSV_1_1, 1'b0);
                r_t1_real <= h_calc(io_in_QSV_0_0, io_in_QSV_1_0, 1'b1);
                r_t1_imag <= h_calc(io_in_QSV_0_1, io_in_QSV_1_1, 1'b1);
                r_t2_real <= h_calc(io_in_QSV_2_0, io_in_QSV_3_0, 1'b0);
                r_t2_imag <= h_calc(io_in_QSV_2_1, io_in_QSV_3_1, 1'b0);
                r_t3_real <= h_calc(io_in_QSV_2_0, io_in_QSV_3_0, 1'b1);
                r_t3_imag <= h_calc(io_in_QSV_2_1, io_in_QSV_3_1, 1'b1);
            end

            if (valid_stage0) begin
                r_out_0_0 <= r_t0_real;
                r_out_0_1 <= r_t0_imag;
                r_out_1_0 <= r_t3_real; // Swapped with 3
                r_out_1_1 <= r_t3_imag; // Swapped with 3
                r_out_2_0 <= r_t2_real;
                r_out_2_1 <= r_t2_imag;
                r_out_3_0 <= r_t1_real; // Swapped with 1
                r_out_3_1 <= r_t1_imag; // Swapped with 1
            end
        end
    end

    assign io_out_QSV_0_0 = r_out_0_0;
    assign io_out_QSV_0_1 = r_out_0_1;
    assign io_out_QSV_1_0 = r_out_1_0;
    assign io_out_QSV_1_1 = r_out_1_1;
    assign io_out_QSV_2_0 = r_out_2_0;
    assign io_out_QSV_2_1 = r_out_2_1;
    assign io_out_QSV_3_0 = r_out_3_0;
    assign io_out_QSV_3_1 = r_out_3_1;
    assign io_out_valid   = valid_stage1;

endmodule
