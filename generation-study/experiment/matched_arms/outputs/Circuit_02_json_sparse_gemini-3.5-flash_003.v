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

    // Q15 fixed-point representation of 1/sqrt(2)
    localparam logic signed [16:0] H_FACTOR = 17'sd23170;

    // Helper function for Hadamard gate calculation
    function automatic logic signed [15:0] h_calc(
        input logic signed [15:0] a,
        input logic signed [15:0] b,
        input logic sub
    );
        logic signed [16:0] sum_diff;
        logic signed [33:0] prod;
        begin
            if (sub)
                sum_diff = a - b;
            else
                sum_diff = a + b;
            prod = sum_diff * H_FACTOR;
            h_calc = logic signed [15:0]'(prod >>> 15);
        end
    endfunction

    // Stage 1 Registers (H on Qubit 0)
    logic signed [15:0] r0_s1, i0_s1;
    logic signed [15:0] r1_s1, i1_s1;
    logic signed [15:0] r2_s1, i2_s1;
    logic signed [15:0] r3_s1, i3_s1;
    logic               valid_s1;

    // Stage 2 Registers (H on Qubit 1)
    logic signed [15:0] r0_s2, i0_s2;
    logic signed [15:0] r1_s2, i1_s2;
    logic signed [15:0] r2_s2, i2_s2;
    logic signed [15:0] r3_s2, i3_s2;
    logic               valid_s2;

    // Stage 3 Registers (SWAP Qubit 0 and Qubit 1)
    logic signed [15:0] r0_s3, i0_s3;
    logic signed [15:0] r1_s3, i1_s3;
    logic signed [15:0] r2_s3, i2_s3;
    logic signed [15:0] r3_s3, i3_s3;
    logic               valid_s3;

    // Pipeline Stage 1: H on Qubit 0
    // Pairs: (0, 1) and (2, 3)
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_s1    <= 16'sd0;
            i0_s1    <= 16'sd0;
            r1_s1    <= 16'sd0;
            i1_s1    <= 16'sd0;
            r2_s1    <= 16'sd0;
            i2_s1    <= 16'sd0;
            r3_s1    <= 16'sd0;
            i3_s1    <= 16'sd0;
            valid_s1 <= 1'b0;
        end else begin
            valid_s1 <= io_in_valid;
            if (io_in_valid) begin
                r0_s1 <= h_calc(logic signed '[15:0](io_in_QSV_0_0), logic signed '[15:0](io_in_QSV_1_0), 1'b0);
                i0_s1 <= h_calc(logic signed '[15:0](io_in_QSV_0_1), logic signed '[15:0](io_in_QSV_1_1), 1'b0);
                r1_s1 <= h_calc(logic signed '[15:0](io_in_QSV_0_0), logic signed '[15:0](io_in_QSV_1_0), 1'b1);
                i1_s1 <= h_calc(logic signed '[15:0](io_in_QSV_0_1), logic signed '[15:0](io_in_QSV_1_1), 1'b1);

                r2_s1 <= h_calc(logic signed '[15:0](io_in_QSV_2_0), logic signed '[15:0](io_in_QSV_3_0), 1'b0);
                i2_s1 <= h_calc(logic signed '[15:0](io_in_QSV_2_1), logic signed '[15:0](io_in_QSV_3_1), 1'b0);
                r3_s1 <= h_calc(logic signed '[15:0](io_in_QSV_2_0), logic signed '[15:0](io_in_QSV_3_0), 1'b1);
                i3_s1 <= h_calc(logic signed '[15:0](io_in_QSV_2_1), logic signed '[15:0](io_in_QSV_3_1), 1'b1);
            end
        end
    end

    // Pipeline Stage 2: H on Qubit 1
    // Pairs: (0, 2) and (1, 3)
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_s2    <= 16'sd0;
            i0_s2    <= 16'sd0;
            r1_s2    <= 16'sd0;
            i1_s2    <= 16'sd0;
            r2_s2    <= 16'sd0;
            i2_s2    <= 16'sd0;
            r3_s2    <= 16'sd0;
            i3_s2    <= 16'sd0;
            valid_s2 <= 1'b0;
        end else begin
            valid_s2 <= valid_s1;
            if (valid_s1) begin
                r0_s2 <= h_calc(r0_s1, r2_s1, 1'b0);
                i0_s2 <= h_calc(i0_s1, i2_s1, 1'b0);
                r2_s2 <= h_calc(r0_s1, r2_s1, 1'b1);
                i2_s2 <= h_calc(i0_s1, i2_s1, 1'b1);

                r1_s2 <= h_calc(r1_s1, r3_s1, 1'b0);
                i1_s2 <= h_calc(i1_s1, i3_s1, 1'b0);
                r3_s2 <= h_calc(r1_s1, r3_s1, 1'b1);
                i3_s2 <= h_calc(i1_s1, i3_s1, 1'b1);
            end
        end
    end

    // Pipeline Stage 3: SWAP Qubit 0 and Qubit 1
    // State permutation: 00 -> 00, 01 -> 10, 10 -> 01, 11 -> 11
    // Swaps state index 1 and index 2
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_s3    <= 16'sd0;
            i0_s3    <= 16'sd0;
            r1_s3    <= 16'sd0;
            i1_s3    <= 16'sd0;
            r2_s3    <= 16'sd0;
            i2_s3    <= 16'sd0;
            r3_s3    <= 16'sd0;
            i3_s3    <= 16'sd0;
            valid_s3 <= 1'b0;
        end else begin
            valid_s3 <= valid_s2;
            if (valid_s2) begin
                r0_s3 <= r0_s2;
                i0_s3 <= i0_s2;

                r1_s3 <= r2_s2;
                i1_s3 <= i2_s2;

                r2_s3 <= r1_s2;
                i2_s3 <= i1_s2;

                r3_s3 <= r3_s2;
                i3_s3 <= i3_s2;
            end
        end
    end

    // Assign outputs
    assign io_out_QSV_0_0 = logic '[15:0](r0_s3);
    assign io_out_QSV_0_1 = logic '[15:0](i0_s3);
    assign io_out_QSV_1_0 = logic '[15:0](r1_s3);
    assign io_out_QSV_1_1 = logic '[15:0](i1_s3);
    assign io_out_QSV_2_0 = logic '[15:0](r2_s3);
    assign io_out_QSV_2_1 = logic '[15:0](i2_s3);
    assign io_out_QSV_3_0 = logic '[15:0](r3_s3);
    assign io_out_QSV_3_1 = logic '[15:0](i3_s3);
    assign io_out_valid   = valid_s3;

endmodule
