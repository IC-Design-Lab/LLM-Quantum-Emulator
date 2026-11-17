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

    localparam signed [15:0] INV_SQRT2 = 16'd23170;

    // --- Stage 1 (Hadamard on Qubit 0) ---
    logic signed [15:0] stage1_real[4];
    logic signed [15:0] stage1_imag[4];
    logic               stage1_valid;

    wire signed [16:0] sum_real_0 = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    wire signed [16:0] sum_imag_0 = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    wire signed [16:0] diff_real_0 = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    wire signed [16:0] diff_imag_0 = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    wire signed [16:0] sum_real_2 = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    wire signed [16:0] sum_imag_2 = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    wire signed [16:0] diff_real_2 = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    wire signed [16:0] diff_imag_2 = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    wire signed [32:0] prod_real_0 = sum_real_0 * INV_SQRT2;
    wire signed [32:0] prod_imag_0 = sum_imag_0 * INV_SQRT2;
    wire signed [32:0] prod_real_1 = diff_real_0 * INV_SQRT2;
    wire signed [32:0] prod_imag_1 = diff_imag_0 * INV_SQRT2;

    wire signed [32:0] prod_real_2 = sum_real_2 * INV_SQRT2;
    wire signed [32:0] prod_imag_2 = sum_imag_2 * INV_SQRT2;
    wire signed [32:0] prod_real_3 = diff_real_2 * INV_SQRT2;
    wire signed [32:0] prod_imag_3 = diff_imag_2 * INV_SQRT2;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage1_valid   <= 1'b0;
            stage1_real[0] <= 16'sb0;
            stage1_imag[0] <= 16'sb0;
            stage1_real[1] <= 16'sb0;
            stage1_imag[1] <= 16'sb0;
            stage1_real[2] <= 16'sb0;
            stage1_imag[2] <= 16'sb0;
            stage1_real[3] <= 16'sb0;
            stage1_imag[3] <= 16'sb0;
        end else begin
            stage1_valid <= io_in_valid;
            if (io_in_valid) begin
                stage1_real[0] <= (prod_real_0 + 33'sd16384) >>> 15;
                stage1_imag[0] <= (prod_imag_0 + 33'sd16384) >>> 15;
                stage1_real[1] <= (prod_real_1 + 33'sd16384) >>> 15;
                stage1_imag[1] <= (prod_imag_1 + 33'sd16384) >>> 15;
                stage1_real[2] <= (prod_real_2 + 33'sd16384) >>> 15;
                stage1_imag[2] <= (prod_imag_2 + 33'sd16384) >>> 15;
                stage1_real[3] <= (prod_real_3 + 33'sd16384) >>> 15;
                stage1_imag[3] <= (prod_imag_3 + 33'sd16384) >>> 15;
            end
        end
    end

    // --- Stage 2 (CX on Qubit 0 -> Qubit 1) ---
    // Swaps states index 1 and 3 when control (Qubit 0) is 1.
    logic signed [15:0] stage2_real[4];
    logic signed [15:0] stage2_imag[4];
    logic               stage2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage2_valid   <= 1'b0;
            stage2_real[0] <= 16'sb0;
            stage2_imag[0] <= 16'sb0;
            stage2_real[1] <= 16'sb0;
            stage2_imag[1] <= 16'sb0;
            stage2_real[2] <= 16'sb0;
            stage2_imag[2] <= 16'sb0;
            stage2_real[3] <= 16'sb0;
            stage2_imag[3] <= 16'sb0;
        end else begin
            stage2_valid <= stage1_valid;
            if (stage1_valid) begin
                stage2_real[0] <= stage1_real[0];
                stage2_imag[0] <= stage1_imag[0];
                stage2_real[1] <= stage1_real[3];
                stage2_imag[1] <= stage1_imag[3];
                stage2_real[2] <= stage1_real[2];
                stage2_imag[2] <= stage1_imag[2];
                stage2_real[3] <= stage1_real[1];
                stage2_imag[3] <= stage1_imag[1];
            end
        end
    end

    // --- Stage 3 (SX on Qubit 0) ---
    logic signed [15:0] stage3_real[4];
    logic signed [15:0] stage3_imag[4];
    logic               stage3_valid;

    wire signed [18:0] sum_r0 = $signed(stage2_real[0]) - $signed(stage2_imag[0]) + $signed(stage2_real[1]) + $signed(stage2_imag[1]);
    wire signed [18:0] sum_m0 = $signed(stage2_real[0]) + $signed(stage2_imag[0]) - $signed(stage2_real[1]) + $signed(stage2_imag[1]);
    wire signed [18:0] sum_r1 = $signed(stage2_real[0]) + $signed(stage2_imag[0]) + $signed(stage2_real[1]) - $signed(stage2_imag[1]);
    wire signed [18:0] sum_m1 = -$signed(stage2_real[0]) + $signed(stage2_imag[0]) + $signed(stage2_real[1]) + $signed(stage2_imag[1]);

    wire signed [18:0] sum_r2 = $signed(stage2_real[2]) - $signed(stage2_imag[2]) + $signed(stage2_real[3]) + $signed(stage2_imag[3]);
    wire signed [18:0] sum_m2 = $signed(stage2_real[2]) + $signed(stage2_imag[2]) - $signed(stage2_real[3]) + $signed(stage2_imag[3]);
    wire signed [18:0] sum_r3 = $signed(stage2_real[2]) + $signed(stage2_imag[2]) + $signed(stage2_real[3]) - $signed(stage2_imag[3]);
    wire signed [18:0] sum_m3 = -$signed(stage2_real[2]) + $signed(stage2_imag[2]) + $signed(stage2_real[3]) + $signed(stage2_imag[3]);

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage3_valid   <= 1'b0;
            stage3_real[0] <= 16'sb0;
            stage3_imag[0] <= 16'sb0;
            stage3_real[1] <= 16'sb0;
            stage3_imag[1] <= 16'sb0;
            stage3_real[2] <= 16'sb0;
            stage3_imag[2] <= 16'sb0;
            stage3_real[3] <= 16'sb0;
            stage3_imag[3] <= 16'sb0;
        end else begin
            stage3_valid <= stage2_valid;
            if (stage2_valid) begin
                stage3_real[0] <= (sum_r0 + 19'sd1) >>> 1;
                stage3_imag[0] <= (sum_m0 + 19'sd1) >>> 1;
                stage3_real[1] <= (sum_r1 + 19'sd1) >>> 1;
                stage3_imag[1] <= (sum_m1 + 19'sd1) >>> 1;
                stage3_real[2] <= (sum_r2 + 19'sd1) >>> 1;
                stage3_imag[2] <= (sum_m2 + 19'sd1) >>> 1;
                stage3_real[3] <= (sum_r3 + 19'sd1) >>> 1;
                stage3_imag[3] <= (sum_m3 + 19'sd1) >>> 1;
            end
        end
    end

    // --- Output Assignments ---
    assign io_out_QSV_0_0 = stage3_real[0];
    assign io_out_QSV_0_1 = stage3_imag[0];
    assign io_out_QSV_1_0 = stage3_real[1];
    assign io_out_QSV_1_1 = stage3_imag[1];
    assign io_out_QSV_2_0 = stage3_real[2];
    assign io_out_QSV_2_1 = stage3_imag[2];
    assign io_out_QSV_3_0 = stage3_real[3];
    assign io_out_QSV_3_1 = stage3_imag[3];
    assign io_out_valid   = stage3_valid;

endmodule
