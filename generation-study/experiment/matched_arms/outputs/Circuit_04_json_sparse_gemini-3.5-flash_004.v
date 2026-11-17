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

    // Constant for 1/sqrt(2) in Q2.14 format (approx 0.7071)
    localparam signed [15:0] INV_SQRT_2 = 16'sh2D41;

    // --- Step 0: Hadamard gate on qubit 0 ---
    // Intermediate sums and differences (17-bit signed to prevent overflow)
    wire signed [16:0] s0_sum_0_0  = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    wire signed [16:0] s0_diff_0_0 = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    wire signed [16:0] s0_sum_0_1  = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    wire signed [16:0] s0_diff_0_1 = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    wire signed [16:0] s0_sum_1_0  = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    wire signed [16:0] s0_diff_1_0 = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    wire signed [16:0] s0_sum_1_1  = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    wire signed [16:0] s0_diff_1_1 = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    // Multiplication with INV_SQRT_2
    wire signed [32:0] s0_prod_sum_0_0  = s0_sum_0_0  * INV_SQRT_2;
    wire signed [32:0] s0_prod_diff_0_0 = s0_diff_0_0 * INV_SQRT_2;
    wire signed [32:0] s0_prod_sum_0_1  = s0_sum_0_1  * INV_SQRT_2;
    wire signed [32:0] s0_prod_diff_0_1 = s0_diff_0_1 * INV_SQRT_2;

    wire signed [32:0] s0_prod_sum_1_0  = s0_sum_1_0  * INV_SQRT_2;
    wire signed [32:0] s0_prod_diff_1_0 = s0_diff_1_0 * INV_SQRT_2;
    wire signed [32:0] s0_prod_sum_1_1  = s0_sum_1_1  * INV_SQRT_2;
    wire signed [32:0] s0_prod_diff_1_1 = s0_diff_1_1 * INV_SQRT_2;

    // Registers for Step 0 outputs
    logic [15:0] r0_QSV_0_0, r0_QSV_0_1, r0_QSV_1_0, r0_QSV_1_1;
    logic [15:0] r0_QSV_2_0, r0_QSV_2_1, r0_QSV_3_0, r0_QSV_3_1;
    logic        r0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_valid    <= 1'b0;
            r0_QSV_0_0 <= 16'h0;
            r0_QSV_0_1 <= 16'h0;
            r0_QSV_1_0 <= 16'h0;
            r0_QSV_1_1 <= 16'h0;
            r0_QSV_2_0 <= 16'h0;
            r0_QSV_2_1 <= 16'h0;
            r0_QSV_3_0 <= 16'h0;
            r0_QSV_3_1 <= 16'h0;
        end else begin
            r0_valid <= io_in_valid;
            if (io_in_valid) begin
                r0_QSV_0_0 <= s0_prod_sum_0_0[29:14];
                r0_QSV_1_0 <= s0_prod_diff_0_0[29:14];
                r0_QSV_0_1 <= s0_prod_sum_0_1[29:14];
                r0_QSV_1_1 <= s0_prod_diff_0_1[29:14];
                r0_QSV_2_0 <= s0_prod_sum_1_0[29:14];
                r0_QSV_3_0 <= s0_prod_diff_1_0[29:14];
                r0_QSV_2_1 <= s0_prod_sum_1_1[29:14];
                r0_QSV_3_1 <= s0_prod_diff_1_1[29:14];
            end
        end
    end

    // --- Step 1: sxdg (adjoint of SX) gate on qubit 1 ---
    // Intermediate 18-bit signed values for the additions/subtractions
    wire signed [17:0] s1_sum_0_0 = $signed(r0_QSV_0_0) + $signed(r0_QSV_0_1) + $signed(r0_QSV_2_0) - $signed(r0_QSV_2_1);
    wire signed [17:0] s1_sum_0_1 = $signed(r0_QSV_0_1) - $signed(r0_QSV_0_0) + $signed(r0_QSV_2_1) + $signed(r0_QSV_2_0);
    wire signed [17:0] s1_sum_2_0 = $signed(r0_QSV_0_0) - $signed(r0_QSV_0_1) + $signed(r0_QSV_2_0) + $signed(r0_QSV_2_1);
    wire signed [17:0] s1_sum_2_1 = $signed(r0_QSV_0_1) + $signed(r0_QSV_0_0) + $signed(r0_QSV_2_1) - $signed(r0_QSV_2_0);

    wire signed [17:0] s1_sum_1_0 = $signed(r0_QSV_1_0) + $signed(r0_QSV_1_1) + $signed(r0_QSV_3_0) - $signed(r0_QSV_3_1);
    wire signed [17:0] s1_sum_1_1 = $signed(r0_QSV_1_1) - $signed(r0_QSV_1_0) + $signed(r0_QSV_3_1) + $signed(r0_QSV_3_0);
    wire signed [17:0] s1_sum_3_0 = $signed(r0_QSV_1_0) - $signed(r0_QSV_1_1) + $signed(r0_QSV_3_0) + $signed(r0_QSV_3_1);
    wire signed [17:0] s1_sum_3_1 = $signed(r0_QSV_1_1) + $signed(r0_QSV_1_0) + $signed(r0_QSV_3_1) - $signed(r0_QSV_3_0);

    // Registers for Step 1 outputs
    logic [15:0] r1_QSV_0_0, r1_QSV_0_1, r1_QSV_1_0, r1_QSV_1_1;
    logic [15:0] r1_QSV_2_0, r1_QSV_2_1, r1_QSV_3_0, r1_QSV_3_1;
    logic        r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_valid    <= 1'b0;
            r1_QSV_0_0 <= 16'h0;
            r1_QSV_0_1 <= 16'h0;
            r1_QSV_1_0 <= 16'h0;
            r1_QSV_1_1 <= 16'h0;
            r1_QSV_2_0 <= 16'h0;
            r1_QSV_2_1 <= 16'h0;
            r1_QSV_3_0 <= 16'h0;
            r1_QSV_3_1 <= 16'h0;
        end else begin
            r1_valid <= r0_valid;
            if (r0_valid) begin
                r1_QSV_0_0 <= s1_sum_0_0[16:1];
                r1_QSV_0_1 <= s1_sum_0_1[16:1];
                r1_QSV_2_0 <= s1_sum_2_0[16:1];
                r1_QSV_2_1 <= s1_sum_2_1[16:1];
                r1_QSV_1_0 <= s1_sum_1_0[16:1];
                r1_QSV_1_1 <= s1_sum_1_1[16:1];
                r1_QSV_3_0 <= s1_sum_3_0[16:1];
                r1_QSV_3_1 <= s1_sum_3_1[16:1];
            end
        end
    end

    // --- Step 2: SWAP gate on qubits 0 and 1 ---
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_valid    <= 1'b0;
            io_out_QSV_0_0 <= 16'h0;
            io_out_QSV_0_1 <= 16'h0;
            io_out_QSV_1_0 <= 16'h0;
            io_out_QSV_1_1 <= 16'h0;
            io_out_QSV_2_0 <= 16'h0;
            io_out_QSV_2_1 <= 16'h0;
            io_out_QSV_3_0 <= 16'h0;
            io_out_QSV_3_1 <= 16'h0;
        end else begin
            io_out_valid <= r1_valid;
            if (r1_valid) begin
                io_out_QSV_0_0 <= r1_QSV_0_0;
                io_out_QSV_0_1 <= r1_QSV_0_1;
                io_out_QSV_1_0 <= r1_QSV_2_0; // SWAP: state 01 gets value from state 10
                io_out_QSV_1_1 <= r1_QSV_2_1;
                io_out_QSV_2_0 <= r1_QSV_1_0; // SWAP: state 10 gets value from state 01
                io_out_QSV_2_1 <= r1_QSV_1_1;
                io_out_QSV_3_0 <= r1_QSV_3_0;
                io_out_QSV_3_1 <= r1_QSV_3_1;
            end
        end
    end

endmodule
