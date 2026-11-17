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

    localparam logic signed [15:0] INV_SQRT2 = 16'sh5A82;

    function automatic logic [15:0] h_op_plus(input logic [15:0] a, input logic [15:0] b);
        logic signed [16:0] sum;
        logic signed [32:0] prod;
        sum = $signed(a) + $signed(b);
        prod = sum * INV_SQRT2;
        return logic [15:0]'((prod + 33'sd16384) >>> 15);
    endfunction

    function automatic logic [15:0] h_op_minus(input logic [15:0] a, input logic [15:0] b);
        logic signed [16:0] diff;
        logic signed [32:0] prod;
        diff = $signed(a) - $signed(b);
        prod = diff * INV_SQRT2;
        return logic [15:0]'((prod + 33'sd16384) >>> 15);
    endfunction

    // Stage 1 Registers: Step 0 (H on Qubit 0)
    logic [15:0] r1_0_0, r1_0_1, r1_1_0, r1_1_1, r1_2_0, r1_2_1, r1_3_0, r1_3_1;
    logic r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_valid <= 1'b0;
            r1_0_0 <= '0; r1_0_1 <= '0;
            r1_1_0 <= '0; r1_1_1 <= '0;
            r1_2_0 <= '0; r1_2_1 <= '0;
            r1_3_0 <= '0; r1_3_1 <= '0;
        end else begin
            r1_valid <= io_in_valid;
            if (io_in_valid) begin
                r1_0_0 <= h_op_plus(io_in_QSV_0_0, io_in_QSV_1_0);
                r1_0_1 <= h_op_plus(io_in_QSV_0_1, io_in_QSV_1_1);
                r1_1_0 <= h_op_minus(io_in_QSV_0_0, io_in_QSV_1_0);
                r1_1_1 <= h_op_minus(io_in_QSV_0_1, io_in_QSV_1_1);
                r1_2_0 <= h_op_plus(io_in_QSV_2_0, io_in_QSV_3_0);
                r1_2_1 <= h_op_plus(io_in_QSV_2_1, io_in_QSV_3_1);
                r1_3_0 <= h_op_minus(io_in_QSV_2_0, io_in_QSV_3_0);
                r1_3_1 <= h_op_minus(io_in_QSV_2_1, io_in_QSV_3_1);
            end
        end
    end

    // Stage 2 Registers: Step 1 (H on Qubit 1)
    logic [15:0] r2_0_0, r2_0_1, r2_1_0, r2_1_1, r2_2_0, r2_2_1, r2_3_0, r2_3_1;
    logic r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_valid <= 1'b0;
            r2_0_0 <= '0; r2_0_1 <= '0;
            r2_1_0 <= '0; r2_1_1 <= '0;
            r2_2_0 <= '0; r2_2_1 <= '0;
            r2_3_0 <= '0; r2_3_1 <= '0;
        end else begin
            r2_valid <= r1_valid;
            if (r1_valid) begin
                r2_0_0 <= h_op_plus(r1_0_0, r1_2_0);
                r2_0_1 <= h_op_plus(r1_0_1, r1_2_1);
                r2_2_0 <= h_op_minus(r1_0_0, r1_2_0);
                r2_2_1 <= h_op_minus(r1_0_1, r1_2_1);
                r2_1_0 <= h_op_plus(r1_1_0, r1_3_0);
                r2_1_1 <= h_op_plus(r1_1_1, r1_3_1);
                r2_3_0 <= h_op_minus(r1_1_0, r1_3_0);
                r2_3_1 <= h_op_minus(r1_1_1, r1_3_1);
            end
        end
    end

    // Stage 3 Registers: Step 2 (SWAP on Qubits 0 and 1)
    logic [15:0] r3_0_0, r3_0_1, r3_1_0, r3_1_1, r3_2_0, r3_2_1, r3_3_0, r3_3_1;
    logic r3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_valid <= 1'b0;
            r3_0_0 <= '0; r3_0_1 <= '0;
            r3_1_0 <= '0; r3_1_1 <= '0;
            r3_2_0 <= '0; r3_2_1 <= '0;
            r3_3_0 <= '0; r3_3_1 <= '0;
        end else begin
            r3_valid <= r2_valid;
            if (r2_valid) begin
                r3_0_0 <= r2_0_0;
                r3_0_1 <= r2_0_1;
                r3_1_0 <= r2_2_0; // State 01 <- State 10
                r3_1_1 <= r2_2_1;
                r3_2_0 <= r2_1_0; // State 10 <- State 01
                r3_2_1 <= r2_1_1;
                r3_3_0 <= r2_3_0;
                r3_3_1 <= r2_3_1;
            end
        end
    end

    // Output assignments
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
