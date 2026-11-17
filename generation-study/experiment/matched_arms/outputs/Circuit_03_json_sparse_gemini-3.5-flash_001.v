module Circuit_03 (
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

    // ==========================================
    // STAGE 0: Hadamard gate (H) on qubit 0
    // Couples (0, 1) and (2, 3)
    // ==========================================
    wire signed [15:0] in_0_r = $signed(io_in_QSV_0_0);
    wire signed [15:0] in_0_i = $signed(io_in_QSV_0_1);
    wire signed [15:0] in_1_r = $signed(io_in_QSV_1_0);
    wire signed [15:0] in_1_i = $signed(io_in_QSV_1_1);
    wire signed [15:0] in_2_r = $signed(io_in_QSV_2_0);
    wire signed [15:0] in_2_i = $signed(io_in_QSV_2_1);
    wire signed [15:0] in_3_r = $signed(io_in_QSV_3_0);
    wire signed [15:0] in_3_i = $signed(io_in_QSV_3_1);

    // Additions/Subtractions in 17-bit signed precision to prevent overflow
    wire signed [16:0] sum_01_r = in_0_r + in_1_r;
    wire signed [16:0] diff_01_r = in_0_r - in_1_r;
    wire signed [16:0] sum_01_i = in_0_i + in_1_i;
    wire signed [16:0] diff_01_i = in_0_i - in_1_i;

    wire signed [16:0] sum_23_r = in_2_r + in_3_r;
    wire signed [16:0] diff_23_r = in_2_r - in_3_r;
    wire signed [16:0] sum_23_i = in_2_i + in_3_i;
    wire signed [16:0] diff_23_i = in_2_i - in_3_i;

    // Multiplication by 1/sqrt(2) approx 0.70710678 (23170 / 32768)
    wire signed [32:0] prod_sum_01_r = sum_01_r * 17'sd23170;
    wire signed [32:0] prod_diff_01_r = diff_01_r * 17'sd23170;
    wire signed [32:0] prod_sum_01_i = sum_01_i * 17'sd23170;
    wire signed [32:0] prod_diff_01_i = diff_01_i * 17'sd23170;

    wire signed [32:0] prod_sum_23_r = sum_23_r * 17'sd23170;
    wire signed [32:0] prod_diff_23_r = diff_23_r * 17'sd23170;
    wire signed [32:0] prod_sum_23_i = sum_23_i * 17'sd23170;
    wire signed [32:0] prod_diff_23_i = diff_23_i * 17'sd23170;

    logic signed [15:0] stage0_0_r, stage0_0_i;
    logic signed [15:0] stage0_1_r, stage0_1_i;
    logic signed [15:0] stage0_2_r, stage0_2_i;
    logic signed [15:0] stage0_3_r, stage0_3_i;
    logic               stage0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage0_0_r   <= 16'sd0;
            stage0_0_i   <= 16'sd0;
            stage0_1_r   <= 16'sd0;
            stage0_1_i   <= 16'sd0;
            stage0_2_r   <= 16'sd0;
            stage0_2_i   <= 16'sd0;
            stage0_3_r   <= 16'sd0;
            stage0_3_i   <= 16'sd0;
            stage0_valid <= 1'b0;
        end else begin
            stage0_valid <= io_in_valid;
            if (io_in_valid) begin
                stage0_0_r <= prod_sum_01_r >>> 15;
                stage0_0_i <= prod_sum_01_i >>> 15;
                stage0_1_r <= prod_diff_01_r >>> 15;
                stage0_1_i <= prod_diff_01_i >>> 15;
                stage0_2_r <= prod_sum_23_r >>> 15;
                stage0_2_i <= prod_sum_23_i >>> 15;
                stage0_3_r <= prod_diff_23_r >>> 15;
                stage0_3_i <= prod_diff_23_i >>> 15;
            end
        end
    end

    // ==========================================
    // STAGE 1: Pauli-X gate (X) on qubit 1
    // Swaps state 0 <-> 2, and 1 <-> 3
    // ==========================================
    logic signed [15:0] stage1_0_r, stage1_0_i;
    logic signed [15:0] stage1_1_r, stage1_1_i;
    logic signed [15:0] stage1_2_r, stage1_2_i;
    logic signed [15:0] stage1_3_r, stage1_3_i;
    logic               stage1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage1_0_r   <= 16'sd0;
            stage1_0_i   <= 16'sd0;
            stage1_1_r   <= 16'sd0;
            stage1_1_i   <= 16'sd0;
            stage1_2_r   <= 16'sd0;
            stage1_2_i   <= 16'sd0;
            stage1_3_r   <= 16'sd0;
            stage1_3_i   <= 16'sd0;
            stage1_valid <= 1'b0;
        end else begin
            stage1_valid <= stage0_valid;
            if (stage0_valid) begin
                stage1_0_r <= stage0_2_r;
                stage1_0_i <= stage0_2_i;
                stage1_1_r <= stage0_3_r;
                stage1_1_i <= stage0_3_i;
                stage1_2_r <= stage0_0_r;
                stage1_2_i <= stage0_0_i;
                stage1_3_r <= stage0_1_r;
                stage1_3_i <= stage0_1_i;
            end
        end
    end

    // ==========================================
    // STAGE 2: Hadamard gate (H) on qubit 1
    // Couples (0, 2) and (1, 3)
    // ==========================================
    wire signed [16:0] sum_02_r = stage1_0_r + stage1_2_r;
    wire signed [16:0] diff_02_r = stage1_0_r - stage1_2_r;
    wire signed [16:0] sum_02_i = stage1_0_i + stage1_2_i;
    wire signed [16:0] diff_02_i = stage1_0_i - stage1_2_i;

    wire signed [16:0] sum_13_r = stage1_1_r + stage1_3_r;
    wire signed [16:0] diff_13_r = stage1_1_r - stage1_3_r;
    wire signed [16:0] sum_13_i = stage1_1_i + stage1_3_i;
    wire signed [16:0] diff_13_i = stage1_1_i - stage1_3_i;

    wire signed [32:0] prod_sum_02_r = sum_02_r * 17'sd23170;
    wire signed [32:0] prod_diff_02_r = diff_02_r * 17'sd23170;
    wire signed [32:0] prod_sum_02_i = sum_02_i * 17'sd23170;
    wire signed [32:0] prod_diff_02_i = diff_02_i * 17'sd23170;

    wire signed [32:0] prod_sum_13_r = sum_13_r * 17'sd23170;
    wire signed [32:0] prod_diff_13_r = diff_13_r * 17'sd23170;
    wire signed [32:0] prod_sum_13_i = sum_13_i * 17'sd23170;
    wire signed [32:0] prod_diff_13_i = diff_13_i * 17'sd23170;

    logic signed [15:0] stage2_0_r, stage2_0_i;
    logic signed [15:0] stage2_1_r, stage2_1_i;
    logic signed [15:0] stage2_2_r, stage2_2_i;
    logic signed [15:0] stage2_3_r, stage2_3_i;
    logic               stage2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage2_0_r   <= 16'sd0;
            stage2_0_i   <= 16'sd0;
            stage2_1_r   <= 16'sd0;
            stage2_1_i   <= 16'sd0;
            stage2_2_r   <= 16'sd0;
            stage2_2_i   <= 16'sd0;
            stage2_3_r   <= 16'sd0;
            stage2_3_i   <= 16'sd0;
            stage2_valid <= 1'b0;
        end else begin
            stage2_valid <= stage1_valid;
            if (stage1_valid) begin
                stage2_0_r <= prod_sum_02_r >>> 15;
                stage2_0_i <= prod_sum_02_i >>> 15;
                stage2_2_r <= prod_diff_02_r >>> 15;
                stage2_2_i <= prod_diff_02_i >>> 15;
                stage2_1_r <= prod_sum_13_r >>> 15;
                stage2_1_i <= prod_sum_13_i >>> 15;
                stage2_3_r <= prod_diff_13_r >>> 15;
                stage2_3_i <= prod_diff_13_i >>> 15;
            end
        end
    end

    // ==========================================
    // STAGE 3: Swap gate (SWAP) on qubits 0 and 1
    // Swaps state 1 <-> 2
    // ==========================================
    logic signed [15:0] stage3_0_r, stage3_0_i;
    logic signed [15:0] stage3_1_r, stage3_1_i;
    logic signed [15:0] stage3_2_r, stage3_2_i;
    logic signed [15:0] stage3_3_r, stage3_3_i;
    logic               stage3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage3_0_r   <= 16'sd0;
            stage3_0_i   <= 16'sd0;
            stage3_1_r   <= 16'sd0;
            stage3_1_i   <= 16'sd0;
            stage3_2_r   <= 16'sd0;
            stage3_2_i   <= 16'sd0;
            stage3_3_r   <= 16'sd0;
            stage3_3_i   <= 16'sd0;
            stage3_valid <= 1'b0;
        end else begin
            stage3_valid <= stage2_valid;
            if (stage2_valid) begin
                stage3_0_r <= stage2_0_r;
                stage3_0_i <= stage2_0_i;
                stage3_1_r <= stage2_2_r;
                stage3_1_i <= stage2_2_i;
                stage3_2_r <= stage2_1_r;
                stage3_2_i <= stage2_1_i;
                stage3_3_r <= stage2_3_r;
                stage3_3_i <= stage2_3_i;
            end
        end
    end

    // ==========================================
    // Outputs Assignment
    // ==========================================
    assign io_out_QSV_0_0 = stage3_0_r;
    assign io_out_QSV_0_1 = stage3_0_i;
    assign io_out_QSV_1_0 = stage3_1_r;
    assign io_out_QSV_1_1 = stage3_1_i;
    assign io_out_QSV_2_0 = stage3_2_r;
    assign io_out_QSV_2_1 = stage3_2_i;
    assign io_out_QSV_3_0 = stage3_3_r;
    assign io_out_QSV_3_1 = stage3_3_i;
    assign io_out_valid   = stage3_valid;

endmodule
