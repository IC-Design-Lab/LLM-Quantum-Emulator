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

    // Stage 0: Input Registers
    logic signed [15:0] r0_0, r0_1, r1_0, r1_1, r2_0, r2_1, r3_0, r3_1;
    logic in_valid_r;

    always_ff @(posedge clock) begin
        if (reset) begin
            r0_0       <= 16'sd0;
            r0_1       <= 16'sd0;
            r1_0       <= 16'sd0;
            r1_1       <= 16'sd0;
            r2_0       <= 16'sd0;
            r2_1       <= 16'sd0;
            r3_0       <= 16'sd0;
            r3_1       <= 16'sd0;
            in_valid_r <= 1'b0;
        end else begin
            r0_0       <= $signed(io_in_QSV_0_0);
            r0_1       <= $signed(io_in_QSV_0_1);
            r1_0       <= $signed(io_in_QSV_1_0);
            r1_1       <= $signed(io_in_QSV_1_1);
            r2_0       <= $signed(io_in_QSV_2_0);
            r2_1       <= $signed(io_in_QSV_2_1);
            r3_0       <= $signed(io_in_QSV_3_0);
            r3_1       <= $signed(io_in_QSV_3_1);
            in_valid_r <= io_in_valid;
        end
    end

    // Stage 1: Hadamard Gate on Qubit 0
    logic signed [16:0] sum_01_R, diff_01_R;
    logic signed [16:0] sum_01_I, diff_01_I;
    logic signed [16:0] sum_23_R, diff_23_R;
    logic signed [16:0] sum_23_I, diff_23_I;

    assign sum_01_R  = $signed(r0_0) + $signed(r1_0);
    assign diff_01_R = $signed(r0_0) - $signed(r1_0);
    assign sum_01_I  = $signed(r0_1) + $signed(r1_1);
    assign diff_01_I = $signed(r0_1) - $signed(r1_1);

    assign sum_23_R  = $signed(r2_0) + $signed(r3_0);
    assign diff_23_R = $signed(r2_0) - $signed(r3_0);
    assign sum_23_I  = $signed(r2_1) + $signed(r3_1);
    assign diff_23_I = $signed(r2_1) - $signed(r3_1);

    logic signed [15:0] h_r0_0, h_r0_1, h_r1_0, h_r1_1;
    logic signed [15:0] h_r2_0, h_r2_1, h_r3_0, h_r3_1;
    logic h_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            h_r0_0  <= 16'sd0;
            h_r0_1  <= 16'sd0;
            h_r1_0  <= 16'sd0;
            h_r1_1  <= 16'sd0;
            h_r2_0  <= 16'sd0;
            h_r2_1  <= 16'sd0;
            h_r3_0  <= 16'sd0;
            h_r3_1  <= 16'sd0;
            h_valid <= 1'b0;
        end else begin
            h_r0_0  <= 16'(($signed(sum_01_R) * 17'sd23170) >>> 15);
            h_r0_1  <= 16'(($signed(sum_01_I) * 17'sd23170) >>> 15);
            h_r1_0  <= 16'(($signed(diff_01_R) * 17'sd23170) >>> 15);
            h_r1_1  <= 16'(($signed(diff_01_I) * 17'sd23170) >>> 15);
            
            h_r2_0  <= 16'(($signed(sum_23_R) * 17'sd23170) >>> 15);
            h_r2_1  <= 16'(($signed(sum_23_I) * 17'sd23170) >>> 15);
            h_r3_0  <= 16'(($signed(diff_23_R) * 17'sd23170) >>> 15);
            h_r3_1  <= 16'(($signed(diff_23_I) * 17'sd23170) >>> 15);
            
            h_valid <= in_valid_r;
        end
    end

    // Stage 2: sxdg Gate on Qubit 1
    // Target is qubit 1. Pairs are (0, 2) and (1, 3)
    logic signed [17:0] sum_02_a_R, sum_02_a_I, sum_02_b_R, sum_02_b_I;
    assign sum_02_a_R = $signed(h_r0_0) + $signed(h_r0_1) + $signed(h_r2_0) - $signed(h_r2_1);
    assign sum_02_a_I = -$signed(h_r0_0) + $signed(h_r0_1) + $signed(h_r2_0) + $signed(h_r2_1);
    assign sum_02_b_R = $signed(h_r0_0) - $signed(h_r0_1) + $signed(h_r2_0) + $signed(h_r2_1);
    assign sum_02_b_I = $signed(h_r0_0) + $signed(h_r0_1) - $signed(h_r2_0) + $signed(h_r2_1);

    logic signed [17:0] sum_13_a_R, sum_13_a_I, sum_13_b_R, sum_13_b_I;
    assign sum_13_a_R = $signed(h_r1_0) + $signed(h_r1_1) + $signed(h_r3_0) - $signed(h_r3_1);
    assign sum_13_a_I = -$signed(h_r1_0) + $signed(h_r1_1) + $signed(h_r3_0) + $signed(h_r3_1);
    assign sum_13_b_R = $signed(h_r1_0) - $signed(h_r1_1) + $signed(h_r3_0) + $signed(h_r3_1);
    assign sum_13_b_I = $signed(h_r1_0) + $signed(h_r1_1) - $signed(h_r3_0) + $signed(h_r3_1);

    logic signed [15:0] sx_r0_0, sx_r0_1, sx_r1_0, sx_r1_1;
    logic signed [15:0] sx_r2_0, sx_r2_1, sx_r3_0, sx_r3_1;
    logic sx_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            sx_r0_0  <= 16'sd0;
            sx_r0_1  <= 16'sd0;
            sx_r1_0  <= 16'sd0;
            sx_r1_1  <= 16'sd0;
            sx_r2_0  <= 16'sd0;
            sx_r2_1  <= 16'sd0;
            sx_r3_0  <= 16'sd0;
            sx_r3_1  <= 16'sd0;
            sx_valid <= 1'b0;
        end else begin
            sx_r0_0  <= 16'(sum_02_a_R >>> 1);
            sx_r0_1  <= 16'(sum_02_a_I >>> 1);
            sx_r2_0  <= 16'(sum_02_b_R >>> 1);
            sx_r2_1  <= 16'(sum_02_b_I >>> 1);
            
            sx_r1_0  <= 16'(sum_13_a_R >>> 1);
            sx_r1_1  <= 16'(sum_13_a_I >>> 1);
            sx_r3_0  <= 16'(sum_13_b_R >>> 1);
            sx_r3_1  <= 16'(sum_13_b_I >>> 1);
            
            sx_valid <= h_valid;
        end
    end

    // Stage 3: Swap Gate on Qubits 0 and 1
    // Swapping state 1 and state 2
    logic signed [15:0] out_QSV_0_0, out_QSV_0_1, out_QSV_1_0, out_QSV_1_1;
    logic signed [15:0] out_QSV_2_0, out_QSV_2_1, out_QSV_3_0, out_QSV_3_1;
    logic out_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            out_QSV_0_0 <= 16'sd0;
            out_QSV_0_1 <= 16'sd0;
            out_QSV_1_0 <= 16'sd0;
            out_QSV_1_1 <= 16'sd0;
            out_QSV_2_0 <= 16'sd0;
            out_QSV_2_1 <= 16'sd0;
            out_QSV_3_0 <= 16'sd0;
            out_QSV_3_1 <= 16'sd0;
            out_valid   <= 1'b0;
        end else begin
            out_QSV_0_0 <= sx_r0_0;
            out_QSV_0_1 <= sx_r0_1;
            out_QSV_1_0 <= sx_r2_0; // swapped with state 2
            out_QSV_1_1 <= sx_r2_1; // swapped with state 2
            out_QSV_2_0 <= sx_r1_0; // swapped with state 1
            out_QSV_2_1 <= sx_r1_1; // swapped with state 1
            out_QSV_3_0 <= sx_r3_0;
            out_QSV_3_1 <= sx_r3_1;
            out_valid   <= sx_valid;
        end
    end

    assign io_out_QSV_0_0 = out_QSV_0_0;
    assign io_out_QSV_0_1 = out_QSV_0_1;
    assign io_out_QSV_1_0 = out_QSV_1_0;
    assign io_out_QSV_1_1 = out_QSV_1_1;
    assign io_out_QSV_2_0 = out_QSV_2_0;
    assign io_out_QSV_2_1 = out_QSV_2_1;
    assign io_out_QSV_3_0 = out_QSV_3_0;
    assign io_out_QSV_3_1 = out_QSV_3_1;
    assign io_out_valid   = out_valid;

endmodule
