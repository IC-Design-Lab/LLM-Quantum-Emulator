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

    // Stage 1 Inputs (signed representation)
    wire signed [15:0] r0_in_R = io_in_QSV_0_0;
    wire signed [15:0] r0_in_I = io_in_QSV_0_1;
    wire signed [15:0] r1_in_R = io_in_QSV_1_0;
    wire signed [15:0] r1_in_I = io_in_QSV_1_1;
    wire signed [15:0] r2_in_R = io_in_QSV_2_0;
    wire signed [15:0] r2_in_I = io_in_QSV_2_1;
    wire signed [15:0] r3_in_R = io_in_QSV_3_0;
    wire signed [15:0] r3_in_I = io_in_QSV_3_1;

    // Hadamard (H) gate on Qubit 0
    wire signed [16:0] sum_01_R = r0_in_R + r1_in_R;
    wire signed [16:0] diff_01_R = r0_in_R - r1_in_R;
    wire signed [16:0] sum_01_I = r0_in_I + r1_in_I;
    wire signed [16:0] diff_01_I = r0_in_I - r1_in_I;

    wire signed [16:0] sum_23_R = r2_in_R + r3_in_R;
    wire signed [16:0] diff_23_R = r2_in_R - r3_in_R;
    wire signed [16:0] sum_23_I = r2_in_I + r3_in_I;
    wire signed [16:0] diff_23_I = r2_in_I - r3_in_I;

    localparam logic signed [15:0] INV_SQRT2 = 16'sd23170; // 1/sqrt(2) in Q1.15

    wire signed [32:0] prod_01_sum_R  = sum_01_R * INV_SQRT2;
    wire signed [32:0] prod_01_diff_R = diff_01_R * INV_SQRT2;
    wire signed [32:0] prod_01_sum_I  = sum_01_I * INV_SQRT2;
    wire signed [32:0] prod_01_diff_I = diff_01_I * INV_SQRT2;

    wire signed [32:0] prod_23_sum_R  = sum_23_R * INV_SQRT2;
    wire signed [32:0] prod_23_diff_R = diff_23_R * INV_SQRT2;
    wire signed [32:0] prod_23_sum_I  = sum_23_I * INV_SQRT2;
    wire signed [32:0] prod_23_diff_I = diff_23_I * INV_SQRT2;

    // Stage 1 Pipeline Registers
    logic signed [15:0] reg_stage1_0_R;
    logic signed [15:0] reg_stage1_0_I;
    logic signed [15:0] reg_stage1_1_R;
    logic signed [15:0] reg_stage1_1_I;
    logic signed [15:0] reg_stage1_2_R;
    logic signed [15:0] reg_stage1_2_I;
    logic signed [15:0] reg_stage1_3_R;
    logic signed [15:0] reg_stage1_3_I;
    logic               reg_stage1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_stage1_0_R   <= 16'sd0;
            reg_stage1_0_I   <= 16'sd0;
            reg_stage1_1_R   <= 16'sd0;
            reg_stage1_1_I   <= 16'sd0;
            reg_stage1_2_R   <= 16'sd0;
            reg_stage1_2_I   <= 16'sd0;
            reg_stage1_3_R   <= 16'sd0;
            reg_stage1_3_I   <= 16'sd0;
            reg_stage1_valid <= 1'b0;
        end else begin
            reg_stage1_0_R   <= 16'(prod_01_sum_R >>> 15);
            reg_stage1_0_I   <= 16'(prod_01_sum_I >>> 15);
            reg_stage1_1_R   <= 16'(prod_01_diff_R >>> 15);
            reg_stage1_1_I   <= 16'(prod_01_diff_I >>> 15);
            reg_stage1_2_R   <= 16'(prod_23_sum_R >>> 15);
            reg_stage1_2_I   <= 16'(prod_23_sum_I >>> 15);
            reg_stage1_3_R   <= 16'(prod_23_diff_R >>> 15);
            reg_stage1_3_I   <= 16'(prod_23_diff_I >>> 15);
            reg_stage1_valid <= io_in_valid;
        end
    end

    // sxdg gate on Qubit 1
    // Formula calculations for (0, 2) and (1, 3) pairs:
    wire signed [17:0] s2_0_R_sum = $signed(reg_stage1_0_R) + $signed(reg_stage1_0_I) + $signed(reg_stage1_2_R) - $signed(reg_stage1_2_I);
    wire signed [17:0] s2_0_I_sum = $signed(reg_stage1_0_I) - $signed(reg_stage1_0_R) + $signed(reg_stage1_2_I) + $signed(reg_stage1_2_R);
    wire signed [17:0] s2_2_R_sum = $signed(reg_stage1_0_R) - $signed(reg_stage1_0_I) + $signed(reg_stage1_2_R) + $signed(reg_stage1_2_I);
    wire signed [17:0] s2_2_I_sum = $signed(reg_stage1_0_I) + $signed(reg_stage1_0_R) + $signed(reg_stage1_2_I) - $signed(reg_stage1_2_R);

    wire signed [17:0] s2_1_R_sum = $signed(reg_stage1_1_R) + $signed(reg_stage1_1_I) + $signed(reg_stage1_3_R) - $signed(reg_stage1_3_I);
    wire signed [17:0] s2_1_I_sum = $signed(reg_stage1_1_I) - $signed(reg_stage1_1_R) + $signed(reg_stage1_3_I) + $signed(reg_stage1_3_R);
    wire signed [17:0] s2_3_R_sum = $signed(reg_stage1_1_R) - $signed(reg_stage1_1_I) + $signed(reg_stage1_3_R) + $signed(reg_stage1_3_I);
    wire signed [17:0] s2_3_I_sum = $signed(reg_stage1_1_I) + $signed(reg_stage1_1_R) + $signed(reg_stage1_3_I) - $signed(reg_stage1_3_R);

    // Stage 2 Pipeline Registers
    logic signed [15:0] reg_stage2_0_R;
    logic signed [15:0] reg_stage2_0_I;
    logic signed [15:0] reg_stage2_1_R;
    logic signed [15:0] reg_stage2_1_I;
    logic signed [15:0] reg_stage2_2_R;
    logic signed [15:0] reg_stage2_2_I;
    logic signed [15:0] reg_stage2_3_R;
    logic signed [15:0] reg_stage2_3_I;
    logic               reg_stage2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_stage2_0_R   <= 16'sd0;
            reg_stage2_0_I   <= 16'sd0;
            reg_stage2_1_R   <= 16'sd0;
            reg_stage2_1_I   <= 16'sd0;
            reg_stage2_2_R   <= 16'sd0;
            reg_stage2_2_I   <= 16'sd0;
            reg_stage2_3_R   <= 16'sd0;
            reg_stage2_3_I   <= 16'sd0;
            reg_stage2_valid <= 1'b0;
        end else begin
            reg_stage2_0_R   <= 16'(s2_0_R_sum >>> 1);
            reg_stage2_0_I   <= 16'(s2_0_I_sum >>> 1);
            reg_stage2_1_R   <= 16'(s2_1_R_sum >>> 1);
            reg_stage2_1_I   <= 16'(s2_1_I_sum >>> 1);
            reg_stage2_2_R   <= 16'(s2_2_R_sum >>> 1);
            reg_stage2_2_I   <= 16'(s2_2_I_sum >>> 1);
            reg_stage2_3_R   <= 16'(s2_3_R_sum >>> 1);
            reg_stage2_3_I   <= 16'(s2_3_I_sum >>> 1);
            reg_stage2_valid <= reg_stage1_valid;
        end
    end

    // Stage 3 (SWAP 0, 1) & Outputs
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_QSV_0_0 <= 16'sd0;
            io_out_QSV_0_1 <= 16'sd0;
            io_out_QSV_1_0 <= 16'sd0;
            io_out_QSV_1_1 <= 16'sd0;
            io_out_QSV_2_0 <= 16'sd0;
            io_out_QSV_2_1 <= 16'sd0;
            io_out_QSV_3_0 <= 16'sd0;
            io_out_QSV_3_1 <= 16'sd0;
            io_out_valid   <= 1'b0;
        end else begin
            // State 0 remains 0
            io_out_QSV_0_0 <= reg_stage2_0_R;
            io_out_QSV_0_1 <= reg_stage2_0_I;
            // State 1 and State 2 are swapped
            io_out_QSV_1_0 <= reg_stage2_2_R;
            io_out_QSV_1_1 <= reg_stage2_2_I;
            io_out_QSV_2_0 <= reg_stage2_1_R;
            io_out_QSV_2_1 <= reg_stage2_1_I;
            // State 3 remains 3
            io_out_QSV_3_0 <= reg_stage2_3_R;
            io_out_QSV_3_1 <= reg_stage2_3_I;
            
            io_out_valid   <= reg_stage2_valid;
        end
    end

endmodule
