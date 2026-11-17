module Circuit_08 (
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

    // Helper function for Hadamard gate calculation (division by sqrt(2) with scaling)
    function automatic logic [15:0] scale_h(
        input logic [15:0] a,
        input logic [15:0] b,
        input logic sub
    );
        logic signed [16:0] val;
        logic signed [32:0] prod;
        logic signed [15:0] factor;
        begin
            factor = 16'sd23170; // 1/sqrt(2) * 2^15
            if (sub)
                val = $signed(a) - $signed(b);
            else
                val = $signed(a) + $signed(b);
            prod = val * factor;
            prod = prod + 33'sd16384; // Rounding
            scale_h = 16'(prod >>> 15);
        end
    endfunction

    // Pipeline Stage 1 Registers (Input)
    logic [15:0] r1_QSV_0_0, r1_QSV_0_1;
    logic [15:0] r1_QSV_1_0, r1_QSV_1_1;
    logic [15:0] r1_QSV_2_0, r1_QSV_2_1;
    logic [15:0] r1_QSV_3_0, r1_QSV_3_1;
    logic r1_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r1_valid <= 1'b0;
            r1_QSV_0_0 <= 16'd0; r1_QSV_0_1 <= 16'd0;
            r1_QSV_1_0 <= 16'd0; r1_QSV_1_1 <= 16'd0;
            r1_QSV_2_0 <= 16'd0; r1_QSV_2_1 <= 16'd0;
            r1_QSV_3_0 <= 16'd0; r1_QSV_3_1 <= 16'd0;
        end else begin
            r1_valid   <= io_in_valid;
            r1_QSV_0_0 <= io_in_QSV_0_0; r1_QSV_0_1 <= io_in_QSV_0_1;
            r1_QSV_1_0 <= io_in_QSV_1_0; r1_QSV_1_1 <= io_in_QSV_1_1;
            r1_QSV_2_0 <= io_in_QSV_2_0; r1_QSV_2_1 <= io_in_QSV_2_1;
            r1_QSV_3_0 <= io_in_QSV_3_0; r1_QSV_3_1 <= io_in_QSV_3_1;
        end
    end

    // Stage 1: Hadamard on Qubit 0
    logic [15:0] s1_out_0_0, s1_out_0_1;
    logic [15:0] s1_out_1_0, s1_out_1_1;
    logic [15:0] s1_out_2_0, s1_out_2_1;
    logic [15:0] s1_out_3_0, s1_out_3_1;

    assign s1_out_0_0 = scale_h(r1_QSV_0_0, r1_QSV_1_0, 1'b0);
    assign s1_out_0_1 = scale_h(r1_QSV_0_1, r1_QSV_1_1, 1'b0);
    assign s1_out_1_0 = scale_h(r1_QSV_0_0, r1_QSV_1_0, 1'b1);
    assign s1_out_1_1 = scale_h(r1_QSV_0_1, r1_QSV_1_1, 1'b1);

    assign s1_out_2_0 = scale_h(r1_QSV_2_0, r1_QSV_3_0, 1'b0);
    assign s1_out_2_1 = scale_h(r1_QSV_2_1, r1_QSV_3_1, 1'b0);
    assign s1_out_3_0 = scale_h(r1_QSV_2_0, r1_QSV_3_0, 1'b1);
    assign s1_out_3_1 = scale_h(r1_QSV_2_1, r1_QSV_3_1, 1'b1);

    // Pipeline Stage 2 Registers (Hadamard Done)
    logic [15:0] r2_QSV_0_0, r2_QSV_0_1;
    logic [15:0] r2_QSV_1_0, r2_QSV_1_1;
    logic [15:0] r2_QSV_2_0, r2_QSV_2_1;
    logic [15:0] r2_QSV_3_0, r2_QSV_3_1;
    logic r2_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r2_valid <= 1'b0;
            r2_QSV_0_0 <= 16'd0; r2_QSV_0_1 <= 16'd0;
            r2_QSV_1_0 <= 16'd0; r2_QSV_1_1 <= 16'd0;
            r2_QSV_2_0 <= 16'd0; r2_QSV_2_1 <= 16'd0;
            r2_QSV_3_0 <= 16'd0; r2_QSV_3_1 <= 16'd0;
        end else begin
            r2_valid   <= r1_valid;
            r2_QSV_0_0 <= s1_out_0_0; r2_QSV_0_1 <= s1_out_0_1;
            r2_QSV_1_0 <= s1_out_1_0; r2_QSV_1_1 <= s1_out_1_1;
            r2_QSV_2_0 <= s1_out_2_0; r2_QSV_2_1 <= s1_out_2_1;
            r2_QSV_3_0 <= s1_out_3_0; r2_QSV_3_1 <= s1_out_3_1;
        end
    end

    // Stage 2: CX on 0, 1 (control 0, target 1)
    logic [15:0] s2_out_0_0, s2_out_0_1;
    logic [15:0] s2_out_1_0, s2_out_1_1;
    logic [15:0] s2_out_2_0, s2_out_2_1;
    logic [15:0] s2_out_3_0, s2_out_3_1;

    assign s2_out_0_0 = r2_QSV_0_0;
    assign s2_out_0_1 = r2_QSV_0_1;
    assign s2_out_1_0 = r2_QSV_3_0; // Swap 1 and 3
    assign s2_out_1_1 = r2_QSV_3_1;
    assign s2_out_2_0 = r2_QSV_2_0;
    assign s2_out_2_1 = r2_QSV_2_1;
    assign s2_out_3_0 = r2_QSV_1_0; // Swap 1 and 3
    assign s2_out_3_1 = r2_QSV_1_1;

    // Pipeline Stage 3 Registers (CX Done)
    logic [15:0] r3_QSV_0_0, r3_QSV_0_1;
    logic [15:0] r3_QSV_1_0, r3_QSV_1_1;
    logic [15:0] r3_QSV_2_0, r3_QSV_2_1;
    logic [15:0] r3_QSV_3_0, r3_QSV_3_1;
    logic r3_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r3_valid <= 1'b0;
            r3_QSV_0_0 <= 16'd0; r3_QSV_0_1 <= 16'd0;
            r3_QSV_1_0 <= 16'd0; r3_QSV_1_1 <= 16'd0;
            r3_QSV_2_0 <= 16'd0; r3_QSV_2_1 <= 16'd0;
            r3_QSV_3_0 <= 16'd0; r3_QSV_3_1 <= 16'd0;
        end else begin
            r3_valid   <= r2_valid;
            r3_QSV_0_0 <= s2_out_0_0; r3_QSV_0_1 <= s2_out_0_1;
            r3_QSV_1_0 <= s2_out_1_0; r3_QSV_1_1 <= s2_out_1_1;
            r3_QSV_2_0 <= s2_out_2_0; r3_QSV_2_1 <= s2_out_2_1;
            r3_QSV_3_0 <= s2_out_3_0; r3_QSV_3_1 <= s2_out_3_1;
        end
    end

    // Stage 3: SX on Qubit 0
    logic [15:0] s3_out_0_0, s3_out_0_1;
    logic [15:0] s3_out_1_0, s3_out_1_1;
    logic [15:0] s3_out_2_0, s3_out_2_1;
    logic [15:0] s3_out_3_0, s3_out_3_1;

    assign s3_out_0_0 = 16'( ( $signed(r3_QSV_0_0) - $signed(r3_QSV_0_1) + $signed(r3_QSV_1_0) + $signed(r3_QSV_1_1) + 1 ) >>> 1 );
    assign s3_out_0_1 = 16'( ( $signed(r3_QSV_0_0) + $signed(r3_QSV_0_1) - $signed(r3_QSV_1_0) + $signed(r3_QSV_1_1) + 1 ) >>> 1 );
    assign s3_out_1_0 = 16'( ( $signed(r3_QSV_0_0) + $signed(r3_QSV_0_1) + $signed(r3_QSV_1_0) - $signed(r3_QSV_1_1) + 1 ) >>> 1 );
    assign s3_out_1_1 = 16'( ( -$signed(r3_QSV_0_0) + $signed(r3_QSV_0_1) + $signed(r3_QSV_1_0) + $signed(r3_QSV_1_1) + 1 ) >>> 1 );

    assign s3_out_2_0 = 16'( ( $signed(r3_QSV_2_0) - $signed(r3_QSV_2_1) + $signed(r3_QSV_3_0) + $signed(r3_QSV_3_1) + 1 ) >>> 1 );
    assign s3_out_2_1 = 16'( ( $signed(r3_QSV_2_0) + $signed(r3_QSV_2_1) - $signed(r3_QSV_3_0) + $signed(r3_QSV_3_1) + 1 ) >>> 1 );
    assign s3_out_3_0 = 16'( ( $signed(r3_QSV_2_0) + $signed(r3_QSV_2_1) + $signed(r3_QSV_3_0) - $signed(r3_QSV_3_1) + 1 ) >>> 1 );
    assign s3_out_3_1 = 16'( ( -$signed(r3_QSV_2_0) + $signed(r3_QSV_2_1) + $signed(r3_QSV_3_0) + $signed(r3_QSV_3_1) + 1 ) >>> 1 );

    // Output Registers (SX Done)
    always_ff @(posedge clock) begin
        if (reset) begin
            io_out_valid   <= 1'b0;
            io_out_QSV_0_0 <= 16'd0; io_out_QSV_0_1 <= 16'd0;
            io_out_QSV_1_0 <= 16'd0; io_out_QSV_1_1 <= 16'd0;
            io_out_QSV_2_0 <= 16'd0; io_out_QSV_2_1 <= 16'd0;
            io_out_QSV_3_0 <= 16'd0; io_out_QSV_3_1 <= 16'd0;
        end else begin
            io_out_valid   <= r3_valid;
            io_out_QSV_0_0 <= s3_out_0_0; io_out_QSV_0_1 <= s3_out_0_1;
            io_out_QSV_1_0 <= s3_out_1_0; io_out_QSV_1_1 <= s3_out_1_1;
            io_out_QSV_2_0 <= s3_out_2_0; io_out_QSV_2_1 <= s3_out_2_1;
            io_out_QSV_3_0 <= s3_out_3_0; io_out_QSV_3_1 <= s3_out_3_1;
        end
    end

endmodule
