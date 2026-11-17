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

    // Fixed-point scaling function for Hadamard gate: (a +/- b) / sqrt(2)
    // 1 / sqrt(2) is approximated as 11585 / 16384 (Q2.14)
    function automatic logic [15:0] scale_hadamard(input logic [15:0] a, input logic [15:0] b, input logic sub);
        logic signed [16:0] sum;
        logic signed [33:0] prod;
        begin
            if (sub)
                sum = $signed(a) - $signed(b);
            else
                sum = $signed(a) + $signed(b);
            prod = sum * 17'sd11585;
            scale_hadamard = prod[29:14];
        end
    endfunction

    // Stage 1 Registers (Hadamard on qubit 0)
    logic [15:0] r1_0_r, r1_0_i;
    logic [15:0] r1_1_r, r1_1_i;
    logic [15:0] r1_2_r, r1_2_i;
    logic [15:0] r1_3_r, r1_3_i;
    logic        r1_valid;

    // Stage 2 Registers (CX permutation followed by Hadamard on qubit 0)
    logic [15:0] r2_0_r, r2_0_i;
    logic [15:0] r2_1_r, r2_1_i;
    logic [15:0] r2_2_r, r2_2_i;
    logic [15:0] r2_3_r, r2_3_i;
    logic        r2_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r1_valid <= 1'b0;
            r1_0_r   <= '0; r1_0_i   <= '0;
            r1_1_r   <= '0; r1_1_i   <= '0;
            r1_2_r   <= '0; r1_2_i   <= '0;
            r1_3_r   <= '0; r1_3_i   <= '0;

            r2_valid <= 1'b0;
            r2_0_r   <= '0; r2_0_i   <= '0;
            r2_1_r   <= '0; r2_1_i   <= '0;
            r2_2_r   <= '0; r2_2_i   <= '0;
            r2_3_r   <= '0; r2_3_i   <= '0;
        end else begin
            r1_valid <= io_in_valid;
            if (io_in_valid) begin
                r1_0_r <= scale_hadamard(io_in_QSV_0_0, io_in_QSV_1_0, 1'b0);
                r1_0_i <= scale_hadamard(io_in_QSV_0_1, io_in_QSV_1_1, 1'b0);
                r1_1_r <= scale_hadamard(io_in_QSV_0_0, io_in_QSV_1_0, 1'b1);
                r1_1_i <= scale_hadamard(io_in_QSV_0_1, io_in_QSV_1_1, 1'b1);
                r1_2_r <= scale_hadamard(io_in_QSV_2_0, io_in_QSV_3_0, 1'b0);
                r1_2_i <= scale_hadamard(io_in_QSV_2_1, io_in_QSV_3_1, 1'b0);
                r1_3_r <= scale_hadamard(io_in_QSV_2_0, io_in_QSV_3_0, 1'b1);
                r1_3_i <= scale_hadamard(io_in_QSV_2_1, io_in_QSV_3_1, 1'b1);
            end

            r2_valid <= r1_valid;
            if (r1_valid) begin
                // CX Gate swaps indices 1 and 3 before applying the second Hadamard gate.
                // New virtual inputs to the second Hadamard:
                // v0 = r1_0, v1 = r1_3, v2 = r1_2, v3 = r1_1
                r2_0_r <= scale_hadamard(r1_0_r, r1_3_r, 1'b0);
                r2_0_i <= scale_hadamard(r1_0_i, r1_3_i, 1'b0);
                r2_1_r <= scale_hadamard(r1_0_r, r1_3_r, 1'b1);
                r2_1_i <= scale_hadamard(r1_0_i, r1_3_i, 1'b1);
                r2_2_r <= scale_hadamard(r1_2_r, r1_1_r, 1'b0);
                r2_2_i <= scale_hadamard(r1_2_i, r1_1_i, 1'b0);
                r2_3_r <= scale_hadamard(r1_2_r, r1_1_r, 1'b1);
                r2_3_i <= scale_hadamard(r1_2_i, r1_1_i, 1'b1);
            end
        end
    end

    assign io_out_QSV_0_0 = r2_0_r;
    assign io_out_QSV_0_1 = r2_0_i;
    assign io_out_QSV_1_0 = r2_1_r;
    assign io_out_QSV_1_1 = r2_1_i;
    assign io_out_QSV_2_0 = r2_2_r;
    assign io_out_QSV_2_1 = r2_2_i;
    assign io_out_QSV_3_0 = r2_3_r;
    assign io_out_QSV_3_1 = r2_3_i;
    assign io_out_valid   = r2_valid;

endmodule
