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

    // Q15 fixed-point representation of 1/sqrt(2) is ~23170
    function automatic logic [15:0] q_mul_h(input [15:0] a, input [15:0] b, input sub);
        logic signed [16:0] sum_diff;
        logic signed [32:0] prod;
        begin
            if (sub)
                sum_diff = $signed(a) - $signed(b);
            else
                sum_diff = $signed(a) + $signed(b);
            prod = sum_diff * 17'sd23170;
            q_mul_h = prod >>> 15;
        end
    endfunction

    // Stage 1 Registers (Hadamard Gate on Q0)
    logic        r1_valid;
    logic [15:0] r1_0_0, r1_0_1;
    logic [15:0] r1_1_0, r1_1_1;
    logic [15:0] r1_2_0, r1_2_1;
    logic [15:0] r1_3_0, r1_3_1;

    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            r1_valid <= 1'b0;
            r1_0_0   <= 16'd0;
            r1_0_1   <= 16'd0;
            r1_1_0   <= 16'd0;
            r1_1_1   <= 16'd0;
            r1_2_0   <= 16'd0;
            r1_2_1   <= 16'd0;
            r1_3_0   <= 16'd0;
            r1_3_1   <= 16'd0;
        end else begin
            r1_valid <= io_in_valid;
            if (io_in_valid) begin
                r1_0_0 <= q_mul_h(io_in_QSV_0_0, io_in_QSV_1_0, 1'b0);
                r1_0_1 <= q_mul_h(io_in_QSV_0_1, io_in_QSV_1_1, 1'b0);
                r1_1_0 <= q_mul_h(io_in_QSV_0_0, io_in_QSV_1_0, 1'b1);
                r1_1_1 <= q_mul_h(io_in_QSV_0_1, io_in_QSV_1_1, 1'b1);
                r1_2_0 <= q_mul_h(io_in_QSV_2_0, io_in_QSV_3_0, 1'b0);
                r1_2_1 <= q_mul_h(io_in_QSV_2_1, io_in_QSV_3_1, 1'b0);
                r1_3_0 <= q_mul_h(io_in_QSV_2_0, io_in_QSV_3_0, 1'b1);
                r1_3_1 <= q_mul_h(io_in_QSV_2_1, io_in_QSV_3_1, 1'b1);
            end
        end
    end

    // Stage 2 Registers (CX Gate and Output Mapping)
    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            io_out_valid   <= 1'b0;
            io_out_QSV_0_0 <= 16'd0;
            io_out_QSV_0_1 <= 16'd0;
            io_out_QSV_1_0 <= 16'd0;
            io_out_QSV_1_1 <= 16'd0;
            io_out_QSV_2_0 <= 16'd0;
            io_out_QSV_2_1 <= 16'd0;
            io_out_QSV_3_0 <= 16'd0;
            io_out_QSV_3_1 <= 16'd0;
        end else begin
            io_out_valid <= r1_valid;
            if (r1_valid) begin
                io_out_QSV_0_0 <= r1_0_0;
                io_out_QSV_0_1 <= r1_0_1;
                // CX swaps QSV_1 and QSV_3 under LSB-first convention
                io_out_QSV_1_0 <= r1_3_0;
                io_out_QSV_1_1 <= r1_3_1;
                io_out_QSV_2_0 <= r1_2_0;
                io_out_QSV_2_1 <= r1_2_1;
                io_out_QSV_3_0 <= r1_1_0;
                io_out_QSV_3_1 <= r1_1_1;
            end
        end
    end

endmodule
