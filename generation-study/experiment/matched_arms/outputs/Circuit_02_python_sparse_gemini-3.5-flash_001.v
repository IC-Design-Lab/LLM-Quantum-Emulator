module Circuit_02 (
    input  logic        clock,
    input  logic        reset,
    input  logic signed [15:0] io_in_QSV_0_0,
    input  logic signed [15:0] io_in_QSV_0_1,
    input  logic signed [15:0] io_in_QSV_1_0,
    input  logic signed [15:0] io_in_QSV_1_1,
    input  logic signed [15:0] io_in_QSV_2_0,
    input  logic signed [15:0] io_in_QSV_2_1,
    input  logic signed [15:0] io_in_QSV_3_0,
    input  logic signed [15:0] io_in_QSV_3_1,
    input  logic        io_in_valid,
    output logic signed [15:0] io_out_QSV_0_0,
    output logic signed [15:0] io_out_QSV_0_1,
    output logic signed [15:0] io_out_QSV_1_0,
    output logic signed [15:0] io_out_QSV_1_1,
    output logic signed [15:0] io_out_QSV_2_0,
    output logic signed [15:0] io_out_QSV_2_1,
    output logic signed [15:0] io_out_QSV_3_0,
    output logic signed [15:0] io_out_QSV_3_1,
    output logic        io_out_valid
);

    // Q15 division factor for 1/sqrt(2) = 0.70710678 -> approx 23170 / 32768
    function automatic logic signed [15:0] qmul_h(
        input logic signed [15:0] a,
        input logic signed [15:0] b,
        input logic sub
    );
        logic signed [16:0] sum_diff;
        logic signed [33:0] prod;
        logic signed [33:0] shifted;
        begin
            if (sub) begin
                sum_diff = {a[15], a} - {b[15], b};
            end else begin
                sum_diff = {a[15], a} + {b[15], b};
            end
            prod = sum_diff * 17'sd23170;
            prod = prod + 34'sh4000; // Rounding offset
            shifted = prod >>> 15;
            qmul_h = shifted[15:0];
        end
    endfunction

    // Stage 0: Input Registers
    logic signed [15:0] r_in_0_0, r_in_0_1;
    logic signed [15:0] r_in_1_0, r_in_1_1;
    logic signed [15:0] r_in_2_0, r_in_2_1;
    logic signed [15:0] r_in_3_0, r_in_3_1;
    logic               r_in_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_in_0_0   <= 16'sd0;
            r_in_0_1   <= 16'sd0;
            r_in_1_0   <= 16'sd0;
            r_in_1_1   <= 16'sd0;
            r_in_2_0   <= 16'sd0;
            r_in_2_1   <= 16'sd0;
            r_in_3_0   <= 16'sd0;
            r_in_3_1   <= 16'sd0;
            r_in_valid <= 1'b0;
        end else begin
            r_in_valid <= io_in_valid;
            if (io_in_valid) begin
                r_in_0_0 <= io_in_QSV_0_0;
                r_in_0_1 <= io_in_QSV_0_1;
                r_in_1_0 <= io_in_QSV_1_0;
                r_in_1_1 <= io_in_QSV_1_1;
                r_in_2_0 <= io_in_QSV_2_0;
                r_in_2_1 <= io_in_QSV_2_1;
                r_in_3_0 <= io_in_QSV_3_0;
                r_in_3_1 <= io_in_QSV_3_1;
            end
        end
    end

    // Stage 1: H(0) applied (mixes pairs 0-1 and 2-3)
    logic signed [15:0] r_h0_0_0, r_h0_0_1;
    logic signed [15:0] r_h0_1_0, r_h0_1_1;
    logic signed [15:0] r_h0_2_0, r_h0_2_1;
    logic signed [15:0] r_h0_3_0, r_h0_3_1;
    logic               r_h0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_h0_0_0   <= 16'sd0;
            r_h0_0_1   <= 16'sd0;
            r_h0_1_0   <= 16'sd0;
            r_h0_1_1   <= 16'sd0;
            r_h0_2_0   <= 16'sd0;
            r_h0_2_1   <= 16'sd0;
            r_h0_3_0   <= 16'sd0;
            r_h0_3_1   <= 16'sd0;
            r_h0_valid <= 1'b0;
        end else begin
            r_h0_valid <= r_in_valid;
            if (r_in_valid) begin
                r_h0_0_0 <= qmul_h(r_in_0_0, r_in_1_0, 1'b0);
                r_h0_0_1 <= qmul_h(r_in_0_1, r_in_1_1, 1'b0);
                r_h0_1_0 <= qmul_h(r_in_0_0, r_in_1_0, 1'b1);
                r_h0_1_1 <= qmul_h(r_in_0_1, r_in_1_1, 1'b1);

                r_h0_2_0 <= qmul_h(r_in_2_0, r_in_3_0, 1'b0);
                r_h0_2_1 <= qmul_h(r_in_2_1, r_in_3_1, 1'b0);
                r_h0_3_0 <= qmul_h(r_in_2_0, r_in_3_0, 1'b1);
                r_h0_3_1 <= qmul_h(r_in_2_1, r_in_3_1, 1'b1);
            end
        end
    end

    // Stage 2: H(1) applied (mixes pairs 0-2 and 1-3)
    logic signed [15:0] r_h1_0_0, r_h1_0_1;
    logic signed [15:0] r_h1_1_0, r_h1_1_1;
    logic signed [15:0] r_h1_2_0, r_h1_2_1;
    logic signed [15:0] r_h1_3_0, r_h1_3_1;
    logic               r_h1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_h1_0_0   <= 16'sd0;
            r_h1_0_1   <= 16'sd0;
            r_h1_1_0   <= 16'sd0;
            r_h1_1_1   <= 16'sd0;
            r_h1_2_0   <= 16'sd0;
            r_h1_2_1   <= 16'sd0;
            r_h1_3_0   <= 16'sd0;
            r_h1_3_1   <= 16'sd0;
            r_h1_valid <= 1'b0;
        end else begin
            r_h1_valid <= r_h0_valid;
            if (r_h0_valid) begin
                r_h1_0_0 <= qmul_h(r_h0_0_0, r_h0_2_0, 1'b0);
                r_h1_0_1 <= qmul_h(r_h0_0_1, r_h0_2_1, 1'b0);
                r_h1_2_0 <= qmul_h(r_h0_0_0, r_h0_2_0, 1'b1);
                r_h1_2_1 <= qmul_h(r_h0_0_1, r_h0_2_1, 1'b1);

                r_h1_1_0 <= qmul_h(r_h0_1_0, r_h0_3_0, 1'b0);
                r_h1_1_1 <= qmul_h(r_h0_1_1, r_h0_3_1, 1'b0);
                r_h1_3_0 <= qmul_h(r_h0_1_0, r_h0_3_0, 1'b1);
                r_h1_3_1 <= qmul_h(r_h0_1_1, r_h0_3_1, 1'b1);
            end
        end
    end

    // Stage 3: SWAP applied and output registered
    // SWAP(0, 1) swaps states |01> (1) and |10> (2)
    logic signed [15:0] r_out_0_0, r_out_0_1;
    logic signed [15:0] r_out_1_0, r_out_1_1;
    logic signed [15:0] r_out_2_0, r_out_2_1;
    logic signed [15:0] r_out_3_0, r_out_3_1;
    logic               r_out_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_out_0_0   <= 16'sd0;
            r_out_0_1   <= 16'sd0;
            r_out_1_0   <= 16'sd0;
            r_out_1_1   <= 16'sd0;
            r_out_2_0   <= 16'sd0;
            r_out_2_1   <= 16'sd0;
            r_out_3_0   <= 16'sd0;
            r_out_3_1   <= 16'sd0;
            r_out_valid <= 1'b0;
        end else begin
            r_out_valid <= r_h1_valid;
            if (r_h1_valid) begin
                r_out_0_0 <= r_h1_0_0;
                r_out_0_1 <= r_h1_0_1;
                r_out_1_0 <= r_h1_2_0; // Swapped with 2
                r_out_1_1 <= r_h1_2_1; // Swapped with 2
                r_out_2_0 <= r_h1_1_0; // Swapped with 1
                r_out_2_1 <= r_h1_1_1; // Swapped with 1
                r_out_3_0 <= r_h1_3_0;
                r_out_3_1 <= r_h1_3_1;
            end
        end
    end

    // Continuous Output Assignment
    assign io_out_QSV_0_0 = r_out_0_0;
    assign io_out_QSV_0_1 = r_out_0_1;
    assign io_out_QSV_1_0 = r_out_1_0;
    assign io_out_QSV_1_1 = r_out_1_1;
    assign io_out_QSV_2_0 = r_out_2_0;
    assign io_out_QSV_2_1 = r_out_2_1;
    assign io_out_QSV_3_0 = r_out_3_0;
    assign io_out_QSV_3_1 = r_out_3_1;
    assign io_out_valid   = r_out_valid;

endmodule
