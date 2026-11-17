module Circuit_07 (
    input  logic               clock,
    input  logic               reset,
    input  logic signed [15:0] io_in_QSV_0_0,
    input  logic signed [15:0] io_in_QSV_0_1,
    input  logic signed [15:0] io_in_QSV_1_0,
    input  logic signed [15:0] io_in_QSV_1_1,
    input  logic signed [15:0] io_in_QSV_2_0,
    input  logic signed [15:0] io_in_QSV_2_1,
    input  logic signed [15:0] io_in_QSV_3_0,
    input  logic signed [15:0] io_in_QSV_3_1,
    input  logic               io_in_valid,
    output logic signed [15:0] io_out_QSV_0_0,
    output logic signed [15:0] io_out_QSV_0_1,
    output logic signed [15:0] io_out_QSV_1_0,
    output logic signed [15:0] io_out_QSV_1_1,
    output logic signed [15:0] io_out_QSV_2_0,
    output logic signed [15:0] io_out_QSV_2_1,
    output logic signed [15:0] io_out_QSV_3_0,
    output logic signed [15:0] io_out_QSV_3_1,
    output logic               io_out_valid
);

    // Q15 fixed-point representation of 1/sqrt(2) approx 0.7071
    // 0.70710678 * 32768 = 23170.45 -> 23170
    function automatic logic signed [15:0] scale_h(logic signed [15:0] a, logic signed [15:0] b);
        logic signed [31:0] sum;
        logic signed [31:0] prod;
        sum = signed'(a) + signed'(b);
        prod = sum * 32'sd23170;
        return prod[30:15];
    endfunction

    function automatic logic signed [15:0] scale_h_diff(logic signed [15:0] a, logic signed [15:0] b);
        logic signed [31:0] diff;
        logic signed [31:0] prod;
        diff = signed'(a) - signed'(b);
        prod = diff * 32'sd23170;
        return prod[30:15];
    endfunction

    // Stage 1: H(0) on input QSV
    logic signed [15:0] r1_0_0, r1_0_1, r1_1_0, r1_1_1, r1_2_0, r1_2_1, r1_3_0, r1_3_1;
    logic r1_valid;

    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            r1_0_0   <= 16'sd0;
            r1_0_1   <= 16'sd0;
            r1_1_0   <= 16'sd0;
            r1_1_1   <= 16'sd0;
            r1_2_0   <= 16'sd0;
            r1_2_1   <= 16'sd0;
            r1_3_0   <= 16'sd0;
            r1_3_1   <= 16'sd0;
            r1_valid <= 1'b0;
        end else begin
            r1_0_0   <= scale_h(io_in_QSV_0_0, io_in_QSV_1_0);
            r1_0_1   <= scale_h(io_in_QSV_0_1, io_in_QSV_1_1);
            r1_1_0   <= scale_h_diff(io_in_QSV_0_0, io_in_QSV_1_0);
            r1_1_1   <= scale_h_diff(io_in_QSV_0_1, io_in_QSV_1_1);

            r1_2_0   <= scale_h(io_in_QSV_2_0, io_in_QSV_3_0);
            r1_2_1   <= scale_h(io_in_QSV_2_1, io_in_QSV_3_1);
            r1_3_0   <= scale_h_diff(io_in_QSV_2_0, io_in_QSV_3_0);
            r1_3_1   <= scale_h_diff(io_in_QSV_2_1, io_in_QSV_3_1);

            r1_valid <= io_in_valid;
        end
    end

    // Stage 2: CX(0, 1) - Control 0, Target 1. Swaps index 1 and 3
    logic signed [15:0] r2_0_0, r2_0_1, r2_1_0, r2_1_1, r2_2_0, r2_2_1, r2_3_0, r2_3_1;
    logic r2_valid;

    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            r2_0_0   <= 16'sd0;
            r2_0_1   <= 16'sd0;
            r2_1_0   <= 16'sd0;
            r2_1_1   <= 16'sd0;
            r2_2_0   <= 16'sd0;
            r2_2_1   <= 16'sd0;
            r2_3_0   <= 16'sd0;
            r2_3_1   <= 16'sd0;
            r2_valid <= 1'b0;
        end else begin
            r2_0_0   <= r1_0_0;
            r2_0_1   <= r1_0_1;
            r2_1_0   <= r1_3_0; // Swapped with 3
            r2_1_1   <= r1_3_1; // Swapped with 3
            r2_2_0   <= r1_2_0;
            r2_2_1   <= r1_2_1;
            r2_3_0   <= r1_1_0; // Swapped with 1
            r2_3_1   <= r1_1_1; // Swapped with 1
            r2_valid <= r1_valid;
        end
    end

    // Stage 3: H(0) on r2 QSV
    logic signed [15:0] r3_0_0, r3_0_1, r3_1_0, r3_1_1, r3_2_0, r3_2_1, r3_3_0, r3_3_1;
    logic r3_valid;

    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            r3_0_0   <= 16'sd0;
            r3_0_1   <= 16'sd0;
            r3_1_0   <= 16'sd0;
            r3_1_1   <= 16'sd0;
            r3_2_0   <= 16'sd0;
            r3_2_1   <= 16'sd0;
            r3_3_0   <= 16'sd0;
            r3_3_1   <= 16'sd0;
            r3_valid <= 1'b0;
        end else begin
            r3_0_0   <= scale_h(r2_0_0, r2_1_0);
            r3_0_1   <= scale_h(r2_0_1, r2_1_1);
            r3_1_0   <= scale_h_diff(r2_0_0, r2_1_0);
            r3_1_1   <= scale_h_diff(r2_0_1, r2_1_1);

            r3_2_0   <= scale_h(r2_2_0, r2_3_0);
            r3_2_1   <= scale_h(r2_2_1, r2_3_1);
            r3_3_0   <= scale_h_diff(r2_2_0, r2_3_0);
            r3_3_1   <= scale_h_diff(r2_2_1, r2_3_1);

            r3_valid <= r2_valid;
        end
    end

    // Output Assignment
    assign io_out_QSV_0_0 = r3_0_0;
    assign io_out_QSV_0_1 = r3_0_1;
    assign io_out_QSV_1_0 = r3_1_0;
    assign io_out_QSV_1_1 = r3_1_1;
    assign io_out_QSV_2_0 = r3_2_0;
    assign io_out_QSV_2_1 = r3_2_1;
    assign io_out_QSV_3_0 = r3_3_0;
    assign io_out_QSV_3_1 = r3_3_1;
    assign io_out_valid   = r3_valid;

endmodule
