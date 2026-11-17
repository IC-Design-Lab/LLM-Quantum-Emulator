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

    // Fixed-point Hadamard calculation helper
    function automatic logic [15:0] h_calc(logic [15:0] a, logic [15:0] b, logic sub);
        logic signed [16:0] sum_diff;
        logic signed [33:0] prod;
        logic signed [33:0] prod_rounded;
        begin
            if (sub)
                sum_diff = $signed(a) - $signed(b);
            else
                sum_diff = $signed(a) + $signed(b);
            prod = sum_diff * 17'sd23170; // 23170 is 1/sqrt(2) in Q15
            prod_rounded = prod + 34'sd16384; // Round to nearest
            return 16'(prod_rounded >>> 15);
        end
    endfunction

    // Stage 1 Registers: H on Qubit 0
    logic [15:0] r1_QSV_0_0, r1_QSV_0_1;
    logic [15:0] r1_QSV_1_0, r1_QSV_1_1;
    logic [15:0] r1_QSV_2_0, r1_QSV_2_1;
    logic [15:0] r1_QSV_3_0, r1_QSV_3_1;
    logic        r1_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r1_QSV_0_0 <= 16'd0;
            r1_QSV_0_1 <= 16'd0;
            r1_QSV_1_0 <= 16'd0;
            r1_QSV_1_1 <= 16'd0;
            r1_QSV_2_0 <= 16'd0;
            r1_QSV_2_1 <= 16'd0;
            r1_QSV_3_0 <= 16'd0;
            r1_QSV_3_1 <= 16'd0;
            r1_valid   <= 1'b0;
        end else begin
            r1_valid   <= io_in_valid;
            r1_QSV_0_0 <= h_calc(io_in_QSV_0_0, io_in_QSV_1_0, 1'b0);
            r1_QSV_0_1 <= h_calc(io_in_QSV_0_1, io_in_QSV_1_1, 1'b0);
            r1_QSV_1_0 <= h_calc(io_in_QSV_0_0, io_in_QSV_1_0, 1'b1);
            r1_QSV_1_1 <= h_calc(io_in_QSV_0_1, io_in_QSV_1_1, 1'b1);
            r1_QSV_2_0 <= h_calc(io_in_QSV_2_0, io_in_QSV_3_0, 1'b0);
            r1_QSV_2_1 <= h_calc(io_in_QSV_2_1, io_in_QSV_3_1, 1'b0);
            r1_QSV_3_0 <= h_calc(io_in_QSV_2_0, io_in_QSV_3_0, 1'b1);
            r1_QSV_3_1 <= h_calc(io_in_QSV_2_1, io_in_QSV_3_1, 1'b1);
        end
    end

    // Stage 2 Registers: H on Qubit 1
    logic [15:0] r2_QSV_0_0, r2_QSV_0_1;
    logic [15:0] r2_QSV_1_0, r2_QSV_1_1;
    logic [15:0] r2_QSV_2_0, r2_QSV_2_1;
    logic [15:0] r2_QSV_3_0, r2_QSV_3_1;
    logic        r2_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r2_QSV_0_0 <= 16'd0;
            r2_QSV_0_1 <= 16'd0;
            r2_QSV_1_0 <= 16'd0;
            r2_QSV_1_1 <= 16'd0;
            r2_QSV_2_0 <= 16'd0;
            r2_QSV_2_1 <= 16'd0;
            r2_QSV_3_0 <= 16'd0;
            r2_QSV_3_1 <= 16'd0;
            r2_valid   <= 1'b0;
        end else begin
            r2_valid   <= r1_valid;
            r2_QSV_0_0 <= h_calc(r1_QSV_0_0, r1_QSV_2_0, 1'b0);
            r2_QSV_0_1 <= h_calc(r1_QSV_0_1, r1_QSV_2_1, 1'b0);
            r2_QSV_1_0 <= h_calc(r1_QSV_1_0, r1_QSV_3_0, 1'b0);
            r2_QSV_1_1 <= h_calc(r1_QSV_1_1, r1_QSV_3_1, 1'b0);
            r2_QSV_2_0 <= h_calc(r1_QSV_0_0, r1_QSV_2_0, 1'b1);
            r2_QSV_2_1 <= h_calc(r1_QSV_0_1, r1_QSV_2_1, 1'b1);
            r2_QSV_3_0 <= h_calc(r1_QSV_1_0, r1_QSV_3_0, 1'b1);
            r2_QSV_3_1 <= h_calc(r1_QSV_1_1, r1_QSV_3_1, 1'b1);
        end
    end

    // Stage 3 Registers: SWAP Qubit 0 and Qubit 1
    logic [15:0] r3_QSV_0_0, r3_QSV_0_1;
    logic [15:0] r3_QSV_1_0, r3_QSV_1_1;
    logic [15:0] r3_QSV_2_0, r3_QSV_2_1;
    logic [15:0] r3_QSV_3_0, r3_QSV_3_1;
    logic        r3_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r3_QSV_0_0 <= 16'd0;
            r3_QSV_0_1 <= 16'd0;
            r3_QSV_1_0 <= 16'd0;
            r3_QSV_1_1 <= 16'd0;
            r3_QSV_2_0 <= 16'd0;
            r3_QSV_2_1 <= 16'd0;
            r3_QSV_3_0 <= 16'd0;
            r3_QSV_3_1 <= 16'd0;
            r3_valid   <= 1'b0;
        end else begin
            r3_valid   <= r2_valid;
            r3_QSV_0_0 <= r2_QSV_0_0;
            r3_QSV_0_1 <= r2_QSV_0_1;
            r3_QSV_1_0 <= r2_QSV_2_0; // SWAP state index 1 and 2
            r3_QSV_1_1 <= r2_QSV_2_1;
            r3_QSV_2_0 <= r2_QSV_1_0; // SWAP state index 1 and 2
            r3_QSV_2_1 <= r2_QSV_1_1;
            r3_QSV_3_0 <= r2_QSV_3_0;
            r3_QSV_3_1 <= r2_QSV_3_1;
        end
    end

    // Output Assignment
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
