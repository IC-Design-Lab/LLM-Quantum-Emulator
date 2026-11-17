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

    // Stage 1: Hadamard Gate on Qubit 0
    logic signed [15:0] h_r0_r, h_r0_i, h_r1_r, h_r1_i;
    logic signed [15:0] h_r2_r, h_r2_i, h_r3_r, h_r3_i;
    logic h_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            h_r0_r  <= 16'sd0;
            h_r0_i  <= 16'sd0;
            h_r1_r  <= 16'sd0;
            h_r1_i  <= 16'sd0;
            h_r2_r  <= 16'sd0;
            h_r2_i  <= 16'sd0;
            h_r3_r  <= 16'sd0;
            h_r3_i  <= 16'sd0;
            h_valid <= 1'b0;
        end else begin
            h_valid <= io_in_valid;
            if (io_in_valid) begin
                h_r0_r <= 16'((($signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0)) * 16'sd23170) >>> 15);
                h_r0_i <= 16'((($signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1)) * 16'sd23170) >>> 15);
                
                h_r1_r <= 16'((($signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0)) * 16'sd23170) >>> 15);
                h_r1_i <= 16'((($signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1)) * 16'sd23170) >>> 15);
                
                h_r2_r <= 16'((($signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0)) * 16'sd23170) >>> 15);
                h_r2_i <= 16'((($signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1)) * 16'sd23170) >>> 15);
                
                h_r3_r <= 16'((($signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0)) * 16'sd23170) >>> 15);
                h_r3_i <= 16'((($signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1)) * 16'sd23170) >>> 15);
            end
        end
    end

    // Stage 2: CNOT Gate (Control Qubit 0, Target Qubit 1)
    // Swaps states |01> (index 1) and |11> (index 3)
    logic signed [15:0] cx_r0_r, cx_r0_i, cx_r1_r, cx_r1_i;
    logic signed [15:0] cx_r2_r, cx_r2_i, cx_r3_r, cx_r3_i;
    logic cx_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            cx_r0_r  <= 16'sd0;
            cx_r0_i  <= 16'sd0;
            cx_r1_r  <= 16'sd0;
            cx_r1_i  <= 16'sd0;
            cx_r2_r  <= 16'sd0;
            cx_r2_i  <= 16'sd0;
            cx_r3_r  <= 16'sd0;
            cx_r3_i  <= 16'sd0;
            cx_valid <= 1'b0;
        end else begin
            cx_valid <= h_valid;
            if (h_valid) begin
                cx_r0_r <= h_r0_r;
                cx_r0_i <= h_r0_i;
                
                cx_r1_r <= h_r3_r;
                cx_r1_i <= h_r3_i;
                
                cx_r2_r <= h_r2_r;
                cx_r2_i <= h_r2_i;
                
                cx_r3_r <= h_r1_r;
                cx_r3_i <= h_r1_i;
            end
        end
    end

    // Stage 3: SX Gate on Qubit 0
    logic signed [15:0] sx_r0_r, sx_r0_i, sx_r1_r, sx_r1_i;
    logic signed [15:0] sx_r2_r, sx_r2_i, sx_r3_r, sx_r3_i;
    logic sx_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            sx_r0_r  <= 16'sd0;
            sx_r0_i  <= 16'sd0;
            sx_r1_r  <= 16'sd0;
            sx_r1_i  <= 16'sd0;
            sx_r2_r  <= 16'sd0;
            sx_r2_i  <= 16'sd0;
            sx_r3_r  <= 16'sd0;
            sx_r3_i  <= 16'sd0;
            sx_valid <= 1'b0;
        end else begin
            sx_valid <= cx_valid;
            if (cx_valid) begin
                // b1 = 0
                sx_r0_r <= 16'(($signed(cx_r0_r) + $signed(cx_r1_r) - $signed(cx_r0_i) + $signed(cx_r1_i)) >>> 1);
                sx_r0_i <= 16'(($signed(cx_r0_r) - $signed(cx_r1_r) + $signed(cx_r0_i) + $signed(cx_r1_i)) >>> 1);
                
                sx_r1_r <= 16'(($signed(cx_r0_r) + $signed(cx_r1_r) + $signed(cx_r0_i) - $signed(cx_r1_i)) >>> 1);
                sx_r1_i <= 16'((-$signed(cx_r0_r) + $signed(cx_r1_r) + $signed(cx_r0_i) + $signed(cx_r1_i)) >>> 1);
                
                // b1 = 1
                sx_r2_r <= 16'(($signed(cx_r2_r) + $signed(cx_r3_r) - $signed(cx_r2_i) + $signed(cx_r3_i)) >>> 1);
                sx_r2_i <= 16'(($signed(cx_r2_r) - $signed(cx_r3_r) + $signed(cx_r2_i) + $signed(cx_r3_i)) >>> 1);
                
                sx_r3_r <= 16'(($signed(cx_r2_r) + $signed(cx_r3_r) + $signed(cx_r2_i) - $signed(cx_r3_i)) >>> 1);
                sx_r3_i <= 16'((-$signed(cx_r2_r) + $signed(cx_r3_r) + $signed(cx_r2_i) + $signed(cx_r3_i)) >>> 1);
            end
        end
    end

    // Output assignments
    assign io_out_QSV_0_0 = logic'(sx_r0_r);
    assign io_out_QSV_0_1 = logic'(sx_r0_i);
    assign io_out_QSV_1_0 = logic'(sx_r1_r);
    assign io_out_QSV_1_1 = logic'(sx_r1_i);
    assign io_out_QSV_2_0 = logic'(sx_r2_r);
    assign io_out_QSV_2_1 = logic'(sx_r2_i);
    assign io_out_QSV_3_0 = logic'(sx_r3_r);
    assign io_out_QSV_3_1 = logic'(sx_r3_i);
    assign io_out_valid   = sx_valid;

endmodule
