module Circuit_05 (
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

    // Q1.14 Fixed-point Helper Functions for Hadamard
    function automatic logic signed [15:0] q_mul_H(input logic signed [15:0] x, input logic signed [15:0] y);
        logic signed [16:0] sum;
        logic signed [32:0] prod;
        begin
            sum = $signed(x) + $signed(y);
            prod = sum * $signed(16'h2D41); // 16'h2D41 is 1/sqrt(2) in Q1.14
            q_mul_H = prod[29:14];
        end
    endfunction

    function automatic logic signed [15:0] q_mul_H_sub(input logic signed [15:0] x, input logic signed [15:0] y);
        logic signed [16:0] diff;
        logic signed [32:0] prod;
        begin
            diff = $signed(x) - $signed(y);
            prod = diff * $signed(16'h2D41); // 16'h2D41 is 1/sqrt(2) in Q1.14
            q_mul_H_sub = prod[29:14];
        end
    endfunction

    // Pipeline Registers
    logic        r_valid_1, r_valid_2, r_valid_3;
    
    // Stage 1: Hadamard on Q0
    logic signed [15:0] r1_QSV_0_0, r1_QSV_0_1;
    logic signed [15:0] r1_QSV_1_0, r1_QSV_1_1;
    logic signed [15:0] r1_QSV_2_0, r1_QSV_2_1;
    logic signed [15:0] r1_QSV_3_0, r1_QSV_3_1;

    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            r1_QSV_0_0 <= '0; r1_QSV_0_1 <= '0;
            r1_QSV_1_0 <= '0; r1_QSV_1_1 <= '0;
            r1_QSV_2_0 <= '0; r1_QSV_2_1 <= '0;
            r1_QSV_3_0 <= '0; r1_QSV_3_1 <= '0;
            r_valid_1  <= 1'b0;
        end else begin
            r_valid_1 <= io_in_valid;
            if (io_in_valid) begin
                r1_QSV_0_0 <= q_mul_H(io_in_QSV_0_0, io_in_QSV_1_0);
                r1_QSV_0_1 <= q_mul_H(io_in_QSV_0_1, io_in_QSV_1_1);
                r1_QSV_1_0 <= q_mul_H_sub(io_in_QSV_0_0, io_in_QSV_1_0);
                r1_QSV_1_1 <= q_mul_H_sub(io_in_QSV_0_1, io_in_QSV_1_1);
                
                r1_QSV_2_0 <= q_mul_H(io_in_QSV_2_0, io_in_QSV_3_0);
                r1_QSV_2_1 <= q_mul_H(io_in_QSV_2_1, io_in_QSV_3_1);
                r1_QSV_3_0 <= q_mul_H_sub(io_in_QSV_2_0, io_in_QSV_3_0);
                r1_QSV_3_1 <= q_mul_H_sub(io_in_QSV_2_1, io_in_QSV_3_1);
            end
        end
    end

    // Stage 2: X on Q1 (Swaps state 0 with 2, and 1 with 3)
    logic signed [15:0] r2_QSV_0_0, r2_QSV_0_1;
    logic signed [15:0] r2_QSV_1_0, r2_QSV_1_1;
    logic signed [15:0] r2_QSV_2_0, r2_QSV_2_1;
    logic signed [15:0] r2_QSV_3_0, r2_QSV_3_1;

    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            r2_QSV_0_0 <= '0; r2_QSV_0_1 <= '0;
            r2_QSV_1_0 <= '0; r2_QSV_1_1 <= '0;
            r2_QSV_2_0 <= '0; r2_QSV_2_1 <= '0;
            r2_QSV_3_0 <= '0; r2_QSV_3_1 <= '0;
            r_valid_2  <= 1'b0;
        end else begin
            r_valid_2 <= r_valid_1;
            if (r_valid_1) begin
                r2_QSV_0_0 <= r1_QSV_2_0;
                r2_QSV_0_1 <= r1_QSV_2_1;
                r2_QSV_1_0 <= r1_QSV_3_0;
                r2_QSV_1_1 <= r1_QSV_3_1;
                r2_QSV_2_0 <= r1_QSV_0_0;
                r2_QSV_2_1 <= r1_QSV_0_1;
                r2_QSV_3_0 <= r1_QSV_1_0;
                r2_QSV_3_1 <= r1_QSV_1_1;
            end
        end
    end

    // Stage 3: SXdg on Q1 (Operates on pairs (0,2) and (1,3))
    logic signed [17:0] sum_0_0, sum_0_1, sum_2_0, sum_2_1;
    logic signed [17:0] sum_1_0, sum_1_1, sum_3_0, sum_3_1;

    assign sum_0_0 = $signed(r2_QSV_0_0) + $signed(r2_QSV_0_1) + $signed(r2_QSV_2_0) - $signed(r2_QSV_2_1);
    assign sum_0_1 = $signed(r2_QSV_0_1) - $signed(r2_QSV_0_0) + $signed(r2_QSV_2_1) + $signed(r2_QSV_2_0);
    assign sum_2_0 = $signed(r2_QSV_0_0) - $signed(r2_QSV_0_1) + $signed(r2_QSV_2_0) + $signed(r2_QSV_2_1);
    assign sum_2_1 = $signed(r2_QSV_0_1) + $signed(r2_QSV_0_0) + $signed(r2_QSV_2_1) - $signed(r2_QSV_2_0);

    assign sum_1_0 = $signed(r2_QSV_1_0) + $signed(r2_QSV_1_1) + $signed(r2_QSV_3_0) - $signed(r2_QSV_3_1);
    assign sum_1_1 = $signed(r2_QSV_1_1) - $signed(r2_QSV_1_0) + $signed(r2_QSV_3_1) + $signed(r2_QSV_3_0);
    assign sum_3_0 = $signed(r2_QSV_1_0) - $signed(r2_QSV_1_1) + $signed(r2_QSV_3_0) + $signed(r2_QSV_3_1);
    assign sum_3_1 = $signed(r2_QSV_1_1) + $signed(r2_QSV_1_0) + $signed(r2_QSV_3_1) - $signed(r2_QSV_3_0);

    logic signed [15:0] r3_QSV_0_0, r3_QSV_0_1;
    logic signed [15:0] r3_QSV_1_0, r3_QSV_1_1;
    logic signed [15:0] r3_QSV_2_0, r3_QSV_2_1;
    logic signed [15:0] r3_QSV_3_0, r3_QSV_3_1;

    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            r3_QSV_0_0 <= '0; r3_QSV_0_1 <= '0;
            r3_QSV_1_0 <= '0; r3_QSV_1_1 <= '0;
            r3_QSV_2_0 <= '0; r3_QSV_2_1 <= '0;
            r3_QSV_3_0 <= '0; r3_QSV_3_1 <= '0;
            r_valid_3  <= 1'b0;
        end else begin
            r_valid_3 <= r_valid_2;
            if (r_valid_2) begin
                r3_QSV_0_0 <= sum_0_0[16:1];
                r3_QSV_0_1 <= sum_0_1[16:1];
                r3_QSV_1_0 <= sum_1_0[16:1];
                r3_QSV_1_1 <= sum_1_1[16:1];
                r3_QSV_2_0 <= sum_2_0[16:1];
                r3_QSV_2_1 <= sum_2_1[16:1];
                r3_QSV_3_0 <= sum_3_0[16:1];
                r3_QSV_3_1 <= sum_3_1[16:1];
            end
        end
    end

    // Stage 4: Swap Q0 and Q1 (Output Registers)
    // Swapping Q0 and Q1 corresponds to swapping state 1 and state 2
    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            io_out_QSV_0_0 <= '0; io_out_QSV_0_1 <= '0;
            io_out_QSV_1_0 <= '0; io_out_QSV_1_1 <= '0;
            io_out_QSV_2_0 <= '0; io_out_QSV_2_1 <= '0;
            io_out_QSV_3_0 <= '0; io_out_QSV_3_1 <= '0;
            io_out_valid   <= 1'b0;
        end else begin
            io_out_valid <= r_valid_3;
            if (r_valid_3) begin
                io_out_QSV_0_0 <= r3_QSV_0_0;
                io_out_QSV_0_1 <= r3_QSV_0_1;
                io_out_QSV_1_0 <= r3_QSV_2_0; // State 1 <- State 2
                io_out_QSV_1_1 <= r3_QSV_2_1;
                io_out_QSV_2_0 <= r3_QSV_1_0; // State 2 <- State 1
                io_out_QSV_2_1 <= r3_QSV_1_1;
                io_out_QSV_3_0 <= r3_QSV_3_0;
                io_out_QSV_3_1 <= r3_QSV_3_1;
            end
        end
    end

endmodule
