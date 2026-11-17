module Circuit_05 (
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

    // Q15 fixed-point functions for Hadamard gate division by sqrt(2)
    function automatic logic signed [15:0] sum_and_scale(logic signed [15:0] a, logic signed [15:0] b);
        logic signed [16:0] sum;
        logic signed [32:0] prod;
        sum = a + b;
        prod = sum * 16'sh5A82; // 1/sqrt(2) in Q15 is 0.7071 (16'h5A82)
        return prod[30:15];
    endfunction

    function automatic logic signed [15:0] diff_and_scale(logic signed [15:0] a, logic signed [15:0] b);
        logic signed [16:0] diff;
        logic signed [32:0] prod;
        diff = a - b;
        prod = diff * 16'sh5A82;
        return prod[30:15];
    endfunction

    // Stage 0: Input Registers
    logic signed [15:0] r0_0_R, r0_0_I;
    logic signed [15:0] r0_1_R, r0_1_I;
    logic signed [15:0] r0_2_R, r0_2_I;
    logic signed [15:0] r0_3_R, r0_3_I;
    logic r0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_0_R   <= '0; r0_0_I   <= '0;
            r0_1_R   <= '0; r0_1_I   <= '0;
            r0_2_R   <= '0; r0_2_I   <= '0;
            r0_3_R   <= '0; r0_3_I   <= '0;
            r0_valid <= 1'b0;
        end else begin
            r0_0_R   <= $signed(io_in_QSV_0_0);
            r0_0_I   <= $signed(io_in_QSV_0_1);
            r0_1_R   <= $signed(io_in_QSV_1_0);
            r0_1_I   <= $signed(io_in_QSV_1_1);
            r0_2_R   <= $signed(io_in_QSV_2_0);
            r0_2_I   <= $signed(io_in_QSV_2_1);
            r0_3_R   <= $signed(io_in_QSV_3_0);
            r0_3_I   <= $signed(io_in_QSV_3_1);
            r0_valid <= io_in_valid;
        end
    end

    // Stage 1: H(0) Gate
    logic signed [15:0] r1_0_R, r1_0_I;
    logic signed [15:0] r1_1_R, r1_1_I;
    logic signed [15:0] r1_2_R, r1_2_I;
    logic signed [15:0] r1_3_R, r1_3_I;
    logic r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_0_R   <= '0; r1_0_I   <= '0;
            r1_1_R   <= '0; r1_1_I   <= '0;
            r1_2_R   <= '0; r1_2_I   <= '0;
            r1_3_R   <= '0; r1_3_I   <= '0;
            r1_valid <= 1'b0;
        end else begin
            r1_0_R   <= sum_and_scale(r0_0_R, r0_1_R);
            r1_0_I   <= sum_and_scale(r0_0_I, r0_1_I);
            r1_1_R   <= diff_and_scale(r0_0_R, r0_1_R);
            r1_1_I   <= diff_and_scale(r0_0_I, r0_1_I);
            r1_2_R   <= sum_and_scale(r0_2_R, r0_3_R);
            r1_2_I   <= sum_and_scale(r0_2_I, r0_3_I);
            r1_3_R   <= diff_and_scale(r0_2_R, r0_3_R);
            r1_3_I   <= diff_and_scale(r0_2_I, r0_3_I);
            r1_valid <= r0_valid;
        end
    end

    // Stage 2: X(1) Gate (Swaps state 0 <-> 2 and 1 <-> 3)
    logic signed [15:0] r2_0_R, r2_0_I;
    logic signed [15:0] r2_1_R, r2_1_I;
    logic signed [15:0] r2_2_R, r2_2_I;
    logic signed [15:0] r2_3_R, r2_3_I;
    logic r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_0_R   <= '0; r2_0_I   <= '0;
            r2_1_R   <= '0; r2_1_I   <= '0;
            r2_2_R   <= '0; r2_2_I   <= '0;
            r2_3_R   <= '0; r2_3_I   <= '0;
            r2_valid <= 1'b0;
        end else begin
            r2_0_R   <= r1_2_R;
            r2_0_I   <= r1_2_I;
            r2_1_R   <= r1_3_R;
            r2_1_I   <= r1_3_I;
            r2_2_R   <= r1_0_R;
            r2_2_I   <= r1_0_I;
            r2_3_R   <= r1_1_R;
            r2_3_I   <= r1_1_I;
            r2_valid <= r1_valid;
        end
    end

    // Stage 3: SXdg(1) Gate (SXdg on target qubit 1)
    // Intermediate sum calculations for SXdg(1) to avoid arithmetic overflow
    logic signed [17:0] sum0_R, sum0_I, sum2_R, sum2_I;
    logic signed [17:0] sum1_R, sum1_I, sum3_R, sum3_I;

    // Formulas based on SXdg matrix transformation on qubits (0, 2) and (1, 3)
    assign sum0_R = $signed(r2_0_R) + $signed(r2_0_I) + $signed(r2_2_R) - $signed(r2_2_I);
    assign sum0_I = -$signed(r2_0_R) + $signed(r2_0_I) + $signed(r2_2_R) + $signed(r2_2_I);
    assign sum2_R = $signed(r2_0_R) - $signed(r2_0_I) + $signed(r2_2_R) + $signed(r2_2_I);
    assign sum2_I = $signed(r2_0_R) + $signed(r2_0_I) - $signed(r2_2_R) + $signed(r2_2_I);

    assign sum1_R = $signed(r2_1_R) + $signed(r2_1_I) + $signed(r2_3_R) - $signed(r2_3_I);
    assign sum1_I = -$signed(r2_1_R) + $signed(r2_1_I) + $signed(r2_3_R) + $signed(r2_3_I);
    assign sum3_R = $signed(r2_1_R) - $signed(r2_1_I) + $signed(r2_3_R) + $signed(r2_3_I);
    assign sum3_I = $signed(r2_1_R) + $signed(r2_1_I) - $signed(r2_3_R) + $signed(r2_3_I);

    logic signed [15:0] r3_0_R, r3_0_I;
    logic signed [15:0] r3_1_R, r3_1_I;
    logic signed [15:0] r3_2_R, r3_2_I;
    logic signed [15:0] r3_3_R, r3_3_I;
    logic r3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_0_R   <= '0; r3_0_I   <= '0;
            r3_1_R   <= '0; r3_1_I   <= '0;
            r3_2_R   <= '0; r3_2_I   <= '0;
            r3_3_R   <= '0; r3_3_I   <= '0;
            r3_valid <= 1'b0;
        end else begin
            r3_0_R   <= sum0_R >>> 1;
            r3_0_I   <= sum0_I >>> 1;
            r3_2_R   <= sum2_R >>> 1;
            r3_2_I   <= sum2_I >>> 1;

            r3_1_R   <= sum1_R >>> 1;
            r3_1_I   <= sum1_I >>> 1;
            r3_3_R   <= sum3_R >>> 1;
            r3_3_I   <= sum3_I >>> 1;

            r3_valid <= r2_valid;
        end
    end

    // Stage 4: SWAP(0, 1) Gate (Swaps state 1 <-> 2) & Output Registers
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_QSV_0_0 <= '0; io_out_QSV_0_1 <= '0;
            io_out_QSV_1_0 <= '0; io_out_QSV_1_1 <= '0;
            io_out_QSV_2_0 <= '0; io_out_QSV_2_1 <= '0;
            io_out_QSV_3_0 <= '0; io_out_QSV_3_1 <= '0;
            io_out_valid   <= 1'b0;
        end else begin
            io_out_QSV_0_0 <= r3_0_R;
            io_out_QSV_0_1 <= r3_0_I;
            io_out_QSV_1_0 <= r3_2_R; // Swapped from index 1 to index 2
            io_out_QSV_1_1 <= r3_2_I;
            io_out_QSV_2_0 <= r3_1_R; // Swapped from index 2 to index 1
            io_out_QSV_2_1 <= r3_1_I;
            io_out_QSV_3_0 <= r3_3_R;
            io_out_QSV_3_1 <= r3_3_I;
            io_out_valid   <= r3_valid;
        end
    end

endmodule
