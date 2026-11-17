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

    // Stage 1 Signals
    logic [15:0] s1_out_0_0, s1_out_0_1, s1_out_1_0, s1_out_1_1;
    logic [15:0] s1_out_2_0, s1_out_2_1, s1_out_3_0, s1_out_3_1;

    logic [15:0] stage1_QSV_0_0, stage1_QSV_0_1, stage1_QSV_1_0, stage1_QSV_1_1;
    logic [15:0] stage1_QSV_2_0, stage1_QSV_2_1, stage1_QSV_3_0, stage1_QSV_3_1;
    logic        stage1_valid;

    // Stage 2 Signals
    logic [15:0] stage2_QSV_0_0, stage2_QSV_0_1, stage2_QSV_1_0, stage2_QSV_1_1;
    logic [15:0] stage2_QSV_2_0, stage2_QSV_2_1, stage2_QSV_3_0, stage2_QSV_3_1;
    logic        stage2_valid;

    // Stage 3 Signals
    logic [15:0] s3_out_0_0, s3_out_0_1, s3_out_1_0, s3_out_1_1;
    logic [15:0] s3_out_2_0, s3_out_2_1, s3_out_3_0, s3_out_3_1;

    // ==========================================
    // STAGE 1: H(0) Gate
    // ==========================================
    H_gate_07 H_s1_r01 (
        .in_A (io_in_QSV_0_0),
        .in_B (io_in_QSV_1_0),
        .out_A(s1_out_0_0),
        .out_B(s1_out_1_0)
    );

    H_gate_07 H_s1_i01 (
        .in_A (io_in_QSV_0_1),
        .in_B (io_in_QSV_1_1),
        .out_A(s1_out_0_1),
        .out_B(s1_out_1_1)
    );

    H_gate_07 H_s1_r23 (
        .in_A (io_in_QSV_2_0),
        .in_B (io_in_QSV_3_0),
        .out_A(s1_out_2_0),
        .out_B(s1_out_3_0)
    );

    H_gate_07 H_s1_i23 (
        .in_A (io_in_QSV_2_1),
        .in_B (io_in_QSV_3_1),
        .out_A(s1_out_2_1),
        .out_B(s1_out_3_1)
    );

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage1_QSV_0_0 <= '0;
            stage1_QSV_0_1 <= '0;
            stage1_QSV_1_0 <= '0;
            stage1_QSV_1_1 <= '0;
            stage1_QSV_2_0 <= '0;
            stage1_QSV_2_1 <= '0;
            stage1_QSV_3_0 <= '0;
            stage1_QSV_3_1 <= '0;
            stage1_valid   <= 1'b0;
        end else begin
            stage1_QSV_0_0 <= s1_out_0_0;
            stage1_QSV_0_1 <= s1_out_0_1;
            stage1_QSV_1_0 <= s1_out_1_0;
            stage1_QSV_1_1 <= s1_out_1_1;
            stage1_QSV_2_0 <= s1_out_2_0;
            stage1_QSV_2_1 <= s1_out_2_1;
            stage1_QSV_3_0 <= s1_out_3_0;
            stage1_QSV_3_1 <= s1_out_3_1;
            stage1_valid   <= io_in_valid;
        end
    end

    // ==========================================
    // STAGE 2: CX(0, 1) Gate (Swaps State 1 and 3)
    // ==========================================
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage2_QSV_0_0 <= '0;
            stage2_QSV_0_1 <= '0;
            stage2_QSV_1_0 <= '0;
            stage2_QSV_1_1 <= '0;
            stage2_QSV_2_0 <= '0;
            stage2_QSV_2_1 <= '0;
            stage2_QSV_3_0 <= '0;
            stage2_QSV_3_1 <= '0;
            stage2_valid   <= 1'b0;
        end else begin
            stage2_QSV_0_0 <= stage1_QSV_0_0;
            stage2_QSV_0_1 <= stage1_QSV_0_1;
            stage2_QSV_1_0 <= stage1_QSV_3_0; // swapped
            stage2_QSV_1_1 <= stage1_QSV_3_1; // swapped
            stage2_QSV_2_0 <= stage1_QSV_2_0;
            stage2_QSV_2_1 <= stage1_QSV_2_1;
            stage2_QSV_3_0 <= stage1_QSV_1_0; // swapped
            stage2_QSV_3_1 <= stage1_QSV_1_1; // swapped
            stage2_valid   <= stage1_valid;
        end
    end

    // ==========================================
    // STAGE 3: H(0) Gate
    // ==========================================
    H_gate_07 H_s3_r01 (
        .in_A (stage2_QSV_0_0),
        .in_B (stage2_QSV_1_0),
        .out_A(s3_out_0_0),
        .out_B(s3_out_1_0)
    );

    H_gate_07 H_s3_i01 (
        .in_A (stage2_QSV_0_1),
        .in_B (stage2_QSV_1_1),
        .out_A(s3_out_0_1),
        .out_B(s3_out_1_1)
    );

    H_gate_07 H_s3_r23 (
        .in_A (stage2_QSV_2_0),
        .in_B (stage2_QSV_3_0),
        .out_A(s3_out_2_0),
        .out_B(s3_out_3_0)
    );

    H_gate_07 H_s3_i23 (
        .in_A (stage2_QSV_2_1),
        .in_B (stage2_QSV_3_1),
        .out_A(s3_out_2_1),
        .out_B(s3_out_3_1)
    );

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_QSV_0_0 <= '0;
            io_out_QSV_0_1 <= '0;
            io_out_QSV_1_0 <= '0;
            io_out_QSV_1_1 <= '0;
            io_out_QSV_2_0 <= '0;
            io_out_QSV_2_1 <= '0;
            io_out_QSV_3_0 <= '0;
            io_out_QSV_3_1 <= '0;
            io_out_valid   <= 1'b0;
        end else begin
            io_out_QSV_0_0 <= s3_out_0_0;
            io_out_QSV_0_1 <= s3_out_0_1;
            io_out_QSV_1_0 <= s3_out_1_0;
            io_out_QSV_1_1 <= s3_out_1_1;
            io_out_QSV_2_0 <= s3_out_2_0;
            io_out_QSV_2_1 <= s3_out_2_1;
            io_out_QSV_3_0 <= s3_out_3_0;
            io_out_QSV_3_1 <= s3_out_3_1;
            io_out_valid   <= stage2_valid;
        end
    end

endmodule

// Helper module for Hadamard computation (signed 16-bit)
module H_gate_07 (
    input  logic [15:0] in_A,
    input  logic [15:0] in_B,
    output logic [15:0] out_A,
    output logic [15:0] out_B
);
    logic signed [15:0] s_in_A;
    logic signed [15:0] s_in_B;
    logic signed [16:0] sum;
    logic signed [16:0] diff;
    logic signed [32:0] prod_sum;
    logic signed [32:0] prod_diff;

    assign s_in_A = $signed(in_A);
    assign s_in_B = $signed(in_B);
    assign sum = s_in_A + s_in_B;
    assign diff = s_in_A - s_in_B;
    
    // Scaling factor: 1/sqrt(2) approx 0.70710678 * 32768 = 23170
    assign prod_sum = sum * 17'sd23170;
    assign prod_diff = diff * 17'sd23170;

    assign out_A = prod_sum[30:15];
    assign out_B = prod_diff[30:15];
endmodule
