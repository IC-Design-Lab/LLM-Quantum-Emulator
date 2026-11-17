module Circuit_07 (
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

    // Fixed-point multiplication function for Hadamard gate (scaling by 1/sqrt(2) approx 23170/32768)
    function automatic logic [15:0] mult_h(
        input logic [15:0] a,
        input logic [15:0] b,
        input logic sub
    );
        logic signed [16:0] sum_diff;
        logic signed [33:0] prod;
        logic signed [15:0] res;
        begin
            if (sub) begin
                sum_diff = $signed(a) - $signed(b);
            end else begin
                sum_diff = $signed(a) + $signed(b);
            end
            prod = sum_diff * 18'sd23170;
            res = prod >>> 15;
            mult_h = res;
        end
    endfunction

    // Stage 1 Registers (after Step 0: H on qubit 0)
    logic        r1_valid;
    logic [15:0] r1_QSV_0_0;
    logic [15:0] r1_QSV_0_1;
    logic [15:0] r1_QSV_1_0;
    logic [15:0] r1_QSV_1_1;
    logic [15:0] r1_QSV_2_0;
    logic [15:0] r1_QSV_2_1;
    logic [15:0] r1_QSV_3_0;
    logic [15:0] r1_QSV_3_1;

    // Stage 2 Registers (after Step 1: CX on control=0, target=1)
    logic        r2_valid;
    logic [15:0] r2_QSV_0_0;
    logic [15:0] r2_QSV_0_1;
    logic [15:0] r2_QSV_1_0;
    logic [15:0] r2_QSV_1_1;
    logic [15:0] r2_QSV_2_0;
    logic [15:0] r2_QSV_2_1;
    logic [15:0] r2_QSV_3_0;
    logic [15:0] r2_QSV_3_1;

    // Stage 3 Registers (after Step 2: H on qubit 0)
    logic        r3_valid;
    logic [15:0] r3_QSV_0_0;
    logic [15:0] r3_QSV_0_1;
    logic [15:0] r3_QSV_1_0;
    logic [15:0] r3_QSV_1_1;
    logic [15:0] r3_QSV_2_0;
    logic [15:0] r3_QSV_2_1;
    logic [15:0] r3_QSV_3_0;
    logic [15:0] r3_QSV_3_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_valid   <= 1'b0;
            r1_QSV_0_0 <= 16'h0;
            r1_QSV_0_1 <= 16'h0;
            r1_QSV_1_0 <= 16'h0;
            r1_QSV_1_1 <= 16'h0;
            r1_QSV_2_0 <= 16'h0;
            r1_QSV_2_1 <= 16'h0;
            r1_QSV_3_0 <= 16'h0;
            r1_QSV_3_1 <= 16'h0;

            r2_valid   <= 1'b0;
            r2_QSV_0_0 <= 16'h0;
            r2_QSV_0_1 <= 16'h0;
            r2_QSV_1_0 <= 16'h0;
            r2_QSV_1_1 <= 16'h0;
            r2_QSV_2_0 <= 16'h0;
            r2_QSV_2_1 <= 16'h0;
            r2_QSV_3_0 <= 16'h0;
            r2_QSV_3_1 <= 16'h0;

            r3_valid   <= 1'b0;
            r3_QSV_0_0 <= 16'h0;
            r3_QSV_0_1 <= 16'h0;
            r3_QSV_1_0 <= 16'h0;
            r3_QSV_1_1 <= 16'h0;
            r3_QSV_2_0 <= 16'h0;
            r3_QSV_2_1 <= 16'h0;
            r3_QSV_3_0 <= 16'h0;
            r3_QSV_3_1 <= 16'h0;
        end else begin
            // Step 0: H on qubit 0 (Pairs: (0,1) and (2,3))
            r1_valid   <= io_in_valid;
            r1_QSV_0_0 <= mult_h(io_in_QSV_0_0, io_in_QSV_1_0, 1'b0);
            r1_QSV_0_1 <= mult_h(io_in_QSV_0_1, io_in_QSV_1_1, 1'b0);
            r1_QSV_1_0 <= mult_h(io_in_QSV_0_0, io_in_QSV_1_0, 1'b1);
            r1_QSV_1_1 <= mult_h(io_in_QSV_0_1, io_in_QSV_1_1, 1'b1);

            r1_QSV_2_0 <= mult_h(io_in_QSV_2_0, io_in_QSV_3_0, 1'b0);
            r1_QSV_2_1 <= mult_h(io_in_QSV_2_1, io_in_QSV_3_1, 1'b0);
            r1_QSV_3_0 <= mult_h(io_in_QSV_2_0, io_in_QSV_3_0, 1'b1);
            r1_QSV_3_1 <= mult_h(io_in_QSV_2_1, io_in_QSV_3_1, 1'b1);

            // Step 1: CX on control=0, target=1 (Swaps State 1 and State 3)
            r2_valid   <= r1_valid;
            r2_QSV_0_0 <= r1_QSV_0_0;
            r2_QSV_0_1 <= r1_QSV_0_1;
            r2_QSV_1_0 <= r1_QSV_3_0;
            r2_QSV_1_1 <= r1_QSV_3_1;
            r2_QSV_2_0 <= r1_QSV_2_0;
            r2_QSV_2_1 <= r1_QSV_2_1;
            r2_QSV_3_0 <= r1_QSV_1_0;
            r2_QSV_3_1 <= r1_QSV_1_1;

            // Step 2: H on qubit 0 (Pairs: (0,1) and (2,3))
            r3_valid   <= r2_valid;
            r3_QSV_0_0 <= mult_h(r2_QSV_0_0, r2_QSV_1_0, 1'b0);
            r3_QSV_0_1 <= mult_h(r2_QSV_0_1, r2_QSV_1_1, 1'b0);
            r3_QSV_1_0 <= mult_h(r2_QSV_0_0, r2_QSV_1_0, 1'b1);
            r3_QSV_1_1 <= mult_h(r2_QSV_0_1, r2_QSV_1_1, 1'b1);

            r3_QSV_2_0 <= mult_h(r2_QSV_2_0, r2_QSV_3_0, 1'b0);
            r3_QSV_2_1 <= mult_h(r2_QSV_2_1, r2_QSV_3_1, 1'b0);
            r3_QSV_3_0 <= mult_h(r2_QSV_2_0, r2_QSV_3_0, 1'b1);
            r3_QSV_3_1 <= mult_h(r2_QSV_2_1, r2_QSV_3_1, 1'b1);
        end
    end

    // Output assignments
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
