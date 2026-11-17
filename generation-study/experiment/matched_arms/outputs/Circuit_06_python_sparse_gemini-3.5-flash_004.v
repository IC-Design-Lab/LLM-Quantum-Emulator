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

    localparam logic signed [15:0] INV_SQRT2 = 16'sd23170;

    // --- Stage 1: Hadamard on Qubit 0 ---
    logic signed [16:0] sum_01_real;
    logic signed [16:0] diff_01_real;
    logic signed [16:0] sum_01_imag;
    logic signed [16:0] diff_01_imag;

    logic signed [16:0] sum_23_real;
    logic signed [16:0] diff_23_real;
    logic signed [16:0] sum_23_imag;
    logic signed [16:0] diff_23_imag;

    assign sum_01_real  = signed'(io_in_QSV_0_0) + signed'(io_in_QSV_1_0);
    assign diff_01_real = signed'(io_in_QSV_0_0) - signed'(io_in_QSV_1_0);
    assign sum_01_imag  = signed'(io_in_QSV_0_1) + signed'(io_in_QSV_1_1);
    assign diff_01_imag = signed'(io_in_QSV_0_1) - signed'(io_in_QSV_1_1);

    assign sum_23_real  = signed'(io_in_QSV_2_0) + signed'(io_in_QSV_3_0);
    assign diff_23_real = signed'(io_in_QSV_2_0) - signed'(io_in_QSV_3_0);
    assign sum_23_imag  = signed'(io_in_QSV_2_1) + signed'(io_in_QSV_3_1);
    assign diff_23_imag = signed'(io_in_QSV_2_1) - signed'(io_in_QSV_3_1);

    logic signed [32:0] prod_sum_01_real;
    logic signed [32:0] prod_diff_01_real;
    logic signed [32:0] prod_sum_01_imag;
    logic signed [32:0] prod_diff_01_imag;

    logic signed [32:0] prod_sum_23_real;
    logic signed [32:0] prod_diff_23_real;
    logic signed [32:0] prod_sum_23_imag;
    logic signed [32:0] prod_diff_23_imag;

    assign prod_sum_01_real  = sum_01_real  * INV_SQRT2;
    assign prod_diff_01_real = diff_01_real * INV_SQRT2;
    assign prod_sum_01_imag  = sum_01_imag  * INV_SQRT2;
    assign prod_diff_01_imag = diff_01_imag * INV_SQRT2;

    assign prod_sum_23_real  = sum_23_real  * INV_SQRT2;
    assign prod_diff_23_real = diff_23_real * INV_SQRT2;
    assign prod_sum_23_imag  = sum_23_imag  * INV_SQRT2;
    assign prod_diff_23_imag = diff_23_imag * INV_SQRT2;

    logic [15:0] s1_0_0, s1_0_1;
    logic [15:0] s1_1_0, s1_1_1;
    logic [15:0] s1_2_0, s1_2_1;
    logic [15:0] s1_3_0, s1_3_1;
    logic        s1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s1_0_0   <= 16'h0;
            s1_0_1   <= 16'h0;
            s1_1_0   <= 16'h0;
            s1_1_1   <= 16'h0;
            s1_2_0   <= 16'h0;
            s1_2_1   <= 16'h0;
            s1_3_0   <= 16'h0;
            s1_3_1   <= 16'h0;
            s1_valid <= 1'b0;
        end else begin
            s1_valid <= io_in_valid;
            if (io_in_valid) begin
                s1_0_0 <= 16'(prod_sum_01_real  >>> 15);
                s1_0_1 <= 16'(prod_sum_01_imag  >>> 15);
                s1_1_0 <= 16'(prod_diff_01_real >>> 15);
                s1_1_1 <= 16'(prod_diff_01_imag >>> 15);
                s1_2_0 <= 16'(prod_sum_23_real  >>> 15);
                s1_2_1 <= 16'(prod_sum_23_imag  >>> 15);
                s1_3_0 <= 16'(prod_diff_23_real >>> 15);
                s1_3_1 <= 16'(prod_diff_23_imag >>> 15);
            end
        end
    end

    // --- Stage 2: CX on Qubit 0 (control) and Qubit 1 (target) ---
    // Swap state 1 and state 3 amplitudes
    logic [15:0] s2_0_0, s2_0_1;
    logic [15:0] s2_1_0, s2_1_1;
    logic [15:0] s2_2_0, s2_2_1;
    logic [15:0] s2_3_0, s2_3_1;
    logic        s2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s2_0_0   <= 16'h0;
            s2_0_1   <= 16'h0;
            s2_1_0   <= 16'h0;
            s2_1_1   <= 16'h0;
            s2_2_0   <= 16'h0;
            s2_2_1   <= 16'h0;
            s2_3_0   <= 16'h0;
            s2_3_1   <= 16'h0;
            s2_valid <= 1'b0;
        end else begin
            s2_valid <= s1_valid;
            if (s1_valid) begin
                s2_0_0 <= s1_0_0;
                s2_0_1 <= s1_0_1;
                s2_1_0 <= s1_3_0;
                s2_1_1 <= s1_3_1;
                s2_2_0 <= s1_2_0;
                s2_2_1 <= s1_2_1;
                s2_3_0 <= s1_1_0;
                s2_3_1 <= s1_1_1;
            end
        end
    end

    // --- Output Mapping ---
    assign io_out_QSV_0_0 = s2_0_0;
    assign io_out_QSV_0_1 = s2_0_1;
    assign io_out_QSV_1_0 = s2_1_0;
    assign io_out_QSV_1_1 = s2_1_1;
    assign io_out_QSV_2_0 = s2_2_0;
    assign io_out_QSV_2_1 = s2_2_1;
    assign io_out_QSV_3_0 = s2_3_0;
    assign io_out_QSV_3_1 = s2_3_1;
    assign io_out_valid   = s2_valid;

endmodule
