module Circuit_01 (
    input  logic clock,
    input  logic reset,
    input  logic signed [15:0] io_in_QSV_0_0,
    input  logic signed [15:0] io_in_QSV_0_1,
    input  logic signed [15:0] io_in_QSV_1_0,
    input  logic signed [15:0] io_in_QSV_1_1,
    input  logic signed [15:0] io_in_QSV_2_0,
    input  logic signed [15:0] io_in_QSV_2_1,
    input  logic signed [15:0] io_in_QSV_3_0,
    input  logic signed [15:0] io_in_QSV_3_1,
    input  logic io_in_valid,
    output logic signed [15:0] io_out_QSV_0_0,
    output logic signed [15:0] io_out_QSV_0_1,
    output logic signed [15:0] io_out_QSV_1_0,
    output logic signed [15:0] io_out_QSV_1_1,
    output logic signed [15:0] io_out_QSV_2_0,
    output logic signed [15:0] io_out_QSV_2_1,
    output logic signed [15:0] io_out_QSV_3_0,
    output logic signed [15:0] io_out_QSV_3_1,
    output logic io_out_valid
);

    // Stage 0: Input Registers
    logic signed [15:0] r0_QSV_0_0, r0_QSV_0_1;
    logic signed [15:0] r0_QSV_1_0, r0_QSV_1_1;
    logic signed [15:0] r0_QSV_2_0, r0_QSV_2_1;
    logic signed [15:0] r0_QSV_3_0, r0_QSV_3_1;
    logic r0_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r0_valid    <= 1'b0;
            r0_QSV_0_0  <= 16'd0;
            r0_QSV_0_1  <= 16'd0;
            r0_QSV_1_0  <= 16'd0;
            r0_QSV_1_1  <= 16'd0;
            r0_QSV_2_0  <= 16'd0;
            r0_QSV_2_1  <= 16'd0;
            r0_QSV_3_0  <= 16'd0;
            r0_QSV_3_1  <= 16'd0;
        end begin
            r0_valid    <= io_in_valid;
            r0_QSV_0_0  <= io_in_QSV_0_0;
            r0_QSV_0_1  <= io_in_QSV_0_1;
            r0_QSV_1_0  <= io_in_QSV_1_0;
            r0_QSV_1_1  <= io_in_QSV_1_1;
            r0_QSV_2_0  <= io_in_QSV_2_0;
            r0_QSV_2_1  <= io_in_QSV_2_1;
            r0_QSV_3_0  <= io_in_QSV_3_0;
            r0_QSV_3_1  <= io_in_QSV_3_1;
        end
    end

    // Stage 1: Hadamard Gate on Qubit 0
    logic signed [15:0] r1_QSV_0_0, r1_QSV_0_1;
    logic signed [15:0] r1_QSV_1_0, r1_QSV_1_1;
    logic signed [15:0] r1_QSV_2_0, r1_QSV_2_1;
    logic signed [15:0] r1_QSV_3_0, r1_QSV_3_1;
    logic r1_valid;

    logic signed [16:0] sum_r0, diff_r0, sum_i0, diff_i0;
    logic signed [16:0] sum_r2, diff_r2, sum_i2, diff_i2;

    assign sum_r0  = r0_QSV_0_0 + r0_QSV_1_0;
    assign diff_r0 = r0_QSV_0_0 - r0_QSV_1_0;
    assign sum_i0  = r0_QSV_0_1 + r0_QSV_1_1;
    assign diff_i0 = r0_QSV_0_1 - r0_QSV_1_1;

    assign sum_r2  = r0_QSV_2_0 + r0_QSV_3_0;
    assign diff_r2 = r0_QSV_2_0 - r0_QSV_3_0;
    assign sum_i2  = r0_QSV_2_1 + r0_QSV_3_1;
    assign diff_i2 = r0_QSV_2_1 - r0_QSV_3_1;

    logic signed [33:0] prod_sum_r0, prod_diff_r0, prod_sum_i0, prod_diff_i0;
    logic signed [33:0] prod_sum_r2, prod_diff_r2, prod_sum_i2, prod_diff_i2;

    // 17'sd23170 is approximately 1/sqrt(2) in signed Q1.15 format
    assign prod_sum_r0  = sum_r0 * 17'sd23170;
    assign prod_diff_r0 = diff_r0 * 17'sd23170;
    assign prod_sum_i0  = sum_i0 * 17'sd23170;
    assign prod_diff_i0 = diff_i0 * 17'sd23170;

    assign prod_sum_r2  = sum_r2 * 17'sd23170;
    assign prod_diff_r2 = diff_r2 * 17'sd23170;
    assign prod_sum_i2  = sum_i2 * 17'sd23170;
    assign prod_diff_i2 = diff_i2 * 17'sd23170;

    always_ff @(posedge clock) begin
        if (reset) begin
            r1_valid    <= 1'b0;
            r1_QSV_0_0  <= 16'd0;
            r1_QSV_0_1  <= 16'd0;
            r1_QSV_1_0  <= 16'd0;
            r1_QSV_1_1  <= 16'd0;
            r1_QSV_2_0  <= 16'd0;
            r1_QSV_2_1  <= 16'd0;
            r1_QSV_3_0  <= 16'd0;
            r1_QSV_3_1  <= 16'd0;
        end else begin
            r1_valid    <= r0_valid;
            r1_QSV_0_0  <= prod_sum_r0 >>> 15;
            r1_QSV_0_1  <= prod_sum_i0 >>> 15;
            r1_QSV_1_0  <= prod_diff_r0 >>> 15;
            r1_QSV_1_1  <= prod_diff_i0 >>> 15;
            r1_QSV_2_0  <= prod_sum_r2 >>> 15;
            r1_QSV_2_1  <= prod_sum_i2 >>> 15;
            r1_QSV_3_0  <= prod_diff_r2 >>> 15;
            r1_QSV_3_1  <= prod_diff_i2 >>> 15;
        end
    end

    // Stage 2: Pauli-X Gate on Qubit 1
    // X gate on Qubit 1 (MSB) swaps states: (0 <-> 2) and (1 <-> 3)
    logic signed [15:0] r2_QSV_0_0, r2_QSV_0_1;
    logic signed [15:0] r2_QSV_1_0, r2_QSV_1_1;
    logic signed [15:0] r2_QSV_2_0, r2_QSV_2_1;
    logic signed [15:0] r2_QSV_3_0, r2_QSV_3_1;
    logic r2_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r2_valid    <= 1'b0;
            r2_QSV_0_0  <= 16'd0;
            r2_QSV_0_1  <= 16'd0;
            r2_QSV_1_0  <= 16'd0;
            r2_QSV_1_1  <= 16'd0;
            r2_QSV_2_0  <= 16'd0;
            r2_QSV_2_1  <= 16'd0;
            r2_QSV_3_0  <= 16'd0;
            r2_QSV_3_1  <= 16'd0;
        end else begin
            r2_valid    <= r1_valid;
            r2_QSV_0_0  <= r1_QSV_2_0;
            r2_QSV_0_1  <= r1_QSV_2_1;
            r2_QSV_1_0  <= r1_QSV_3_0;
            r2_QSV_1_1  <= r1_QSV_3_1;
            r2_QSV_2_0  <= r1_QSV_0_0;
            r2_QSV_2_1  <= r1_QSV_0_1;
            r2_QSV_3_0  <= r1_QSV_1_0;
            r2_QSV_3_1  <= r1_QSV_1_1;
        end
    end

    // Stage 3: SWAP Gate on Qubit 0 and 1
    // SWAP gate swaps states: (1 <-> 2)
    logic signed [15:0] r3_QSV_0_0, r3_QSV_0_1;
    logic signed [15:0] r3_QSV_1_0, r3_QSV_1_1;
    logic signed [15:0] r3_QSV_2_0, r3_QSV_2_1;
    logic signed [15:0] r3_QSV_3_0, r3_QSV_3_1;
    logic r3_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r3_valid    <= 1'b0;
            r3_QSV_0_0  <= 16'd0;
            r3_QSV_0_1  <= 16'd0;
            r3_QSV_1_0  <= 16'd0;
            r3_QSV_1_1  <= 16'd0;
            r3_QSV_2_0  <= 16'd0;
            r3_QSV_2_1  <= 16'd0;
            r3_QSV_3_0  <= 16'd0;
            r3_QSV_3_1  <= 16'd0;
        end else begin
            r3_valid    <= r2_valid;
            r3_QSV_0_0  <= r2_QSV_0_0;
            r3_QSV_0_1  <= r2_QSV_0_1;
            r3_QSV_1_0  <= r2_QSV_2_0;
            r3_QSV_1_1  <= r2_QSV_2_1;
            r3_QSV_2_0  <= r2_QSV_1_0;
            r3_QSV_2_1  <= r2_QSV_1_1;
            r3_QSV_3_0  <= r2_QSV_3_0;
            r3_QSV_3_1  <= r2_QSV_3_1;
        end
    end

    // Connect Output Ports
    assign io_out_QSV_0_0 = r3_QSV_0_0;
    assign io_out_QSV_0_1 = r3_QSV_0_1;
    assign io_out_QSV_1_0 = r3_QSV_1_0;
    assign io_out_QSV_1_1 = r3_QSV_1_1;
    assign io_out_QSV_2_0 = r3_QSV_2_0;
    assign io_out_QSV_2_1 = r3_QSV_2_1;
    assign io_out_QSV_3_0 = r3_QSV_3_0;
    assign io_out_QSV_3_1 = r3_QSV_3_1;
    assign io_out_valid   = r3_valid;

endmodule
