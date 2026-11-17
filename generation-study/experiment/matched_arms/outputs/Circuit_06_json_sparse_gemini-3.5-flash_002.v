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

    // Signed conversion for inputs
    logic signed [15:0] in_c0_0, in_c0_1, in_c1_0, in_c1_1;
    logic signed [15:0] in_c2_0, in_c2_1, in_c3_0, in_c3_1;

    assign in_c0_0 = $signed(io_in_QSV_0_0);
    assign in_c0_1 = $signed(io_in_QSV_0_1);
    assign in_c1_0 = $signed(io_in_QSV_1_0);
    assign in_c1_1 = $signed(io_in_QSV_1_1);
    assign in_c2_0 = $signed(io_in_QSV_2_0);
    assign in_c2_1 = $signed(io_in_QSV_2_1);
    assign in_c3_0 = $signed(io_in_QSV_3_0);
    assign in_c3_1 = $signed(io_in_QSV_3_1);

    // Stage 1: Hadamard on Qubit 0
    logic signed [16:0] sum_01_0, diff_01_0;
    logic signed [16:0] sum_01_1, diff_01_1;
    logic signed [16:0] sum_23_0, diff_23_0;
    logic signed [16:0] sum_23_1, diff_23_1;

    assign sum_01_0  = logic signed [16:0]'(in_c0_0) + logic signed [16:0]'(in_c1_0);
    assign diff_01_0 = logic signed [16:0]'(in_c0_0) - logic signed [16:0]'(in_c1_0);
    assign sum_01_1  = logic signed [16:0]'(in_c0_1) + logic signed [16:0]'(in_c1_1);
    assign diff_01_1 = logic signed [16:0]'(in_c0_1) - logic signed [16:0]'(in_c1_1);

    assign sum_23_0  = logic signed [16:0]'(in_c2_0) + logic signed [16:0]'(in_c3_0);
    assign diff_23_0 = logic signed [16:0]'(in_c2_0) - logic signed [16:0]'(in_c3_0);
    assign sum_23_1  = logic signed [16:0]'(in_c2_1) + logic signed [16:0]'(in_c3_1);
    assign diff_23_1 = logic signed [16:0]'(in_c2_1) - logic signed [16:0]'(in_c3_1);

    // Registers for Stage 1
    logic signed [15:0] r1_c0_0, r1_c0_1, r1_c1_0, r1_c1_1;
    logic signed [15:0] r1_c2_0, r1_c2_1, r1_c3_0, r1_c3_1;
    logic               r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_valid <= 1'b0;
            r1_c0_0  <= '0;
            r1_c0_1  <= '0;
            r1_c1_0  <= '0;
            r1_c1_1  <= '0;
            r1_c2_0  <= '0;
            r1_c2_1  <= '0;
            r1_c3_0  <= '0;
            r1_c3_1  <= '0;
        end else begin
            r1_valid <= io_in_valid;
            if (io_in_valid) begin
                r1_c0_0 <= logic signed [15:0]'((sum_01_0 * 17'sd23170) >>> 15);
                r1_c0_1 <= logic signed [15:0]'((sum_01_1 * 17'sd23170) >>> 15);
                r1_c1_0 <= logic signed [15:0]'((diff_01_0 * 17'sd23170) >>> 15);
                r1_c1_1 <= logic signed [15:0]'((diff_01_1 * 17'sd23170) >>> 15);

                r1_c2_0 <= logic signed [15:0]'((sum_23_0 * 17'sd23170) >>> 15);
                r1_c2_1 <= logic signed [15:0]'((sum_23_1 * 17'sd23170) >>> 15);
                r1_c3_0 <= logic signed [15:0]'((diff_23_0 * 17'sd23170) >>> 15);
                r1_c3_1 <= logic signed [15:0]'((diff_23_1 * 17'sd23170) >>> 15);
            end
        end
    end

    // Stage 2: Controlled-NOT (Control: Qubit 0, Target: Qubit 1)
    // Swaps c1 and c3.
    logic signed [15:0] r2_c0_0, r2_c0_1, r2_c1_0, r2_c1_1;
    logic signed [15:0] r2_c2_0, r2_c2_1, r2_c3_0, r2_c3_1;
    logic               r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_valid <= 1'b0;
            r2_c0_0  <= '0;
            r2_c0_1  <= '0;
            r2_c1_0  <= '0;
            r2_c1_1  <= '0;
            r2_c2_0  <= '0;
            r2_c2_1  <= '0;
            r2_c3_0  <= '0;
            r2_c3_1  <= '0;
        end else begin
            r2_valid <= r1_valid;
            if (r1_valid) begin
                r2_c0_0 <= r1_c0_0;
                r2_c0_1 <= r1_c0_1;
                r2_c1_0 <= r1_c3_0; // Swapped with c3
                r2_c1_1 <= r1_c3_1; // Swapped with c3
                r2_c2_0 <= r1_c2_0;
                r2_c2_1 <= r1_c2_1;
                r2_c3_0 <= r1_c1_0; // Swapped with c1
                r2_c3_1 <= r1_c1_1; // Swapped with c1
            end
        end
    end

    // Assign outputs
    assign io_out_QSV_0_0 = r2_c0_0;
    assign io_out_QSV_0_1 = r2_c0_1;
    assign io_out_QSV_1_0 = r2_c1_0;
    assign io_out_QSV_1_1 = r2_c1_1;
    assign io_out_QSV_2_0 = r2_c2_0;
    assign io_out_QSV_2_1 = r2_c2_1;
    assign io_out_QSV_3_0 = r2_c3_0;
    assign io_out_QSV_3_1 = r2_c3_1;
    assign io_out_valid   = r2_valid;

endmodule
