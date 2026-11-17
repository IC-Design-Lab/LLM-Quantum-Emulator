module QFT (
    input  logic        clock,
    input  logic        reset,
    input  logic signed [7:0] io_in_QSV_0_0,
    input  logic signed [7:0] io_in_QSV_0_1,
    input  logic signed [7:0] io_in_QSV_1_0,
    input  logic signed [7:0] io_in_QSV_1_1,
    input  logic signed [7:0] io_in_QSV_2_0,
    input  logic signed [7:0] io_in_QSV_2_1,
    input  logic signed [7:0] io_in_QSV_3_0,
    input  logic signed [7:0] io_in_QSV_3_1,
    input  logic signed [7:0] io_in_QSV_4_0,
    input  logic signed [7:0] io_in_QSV_4_1,
    input  logic signed [7:0] io_in_QSV_5_0,
    input  logic signed [7:0] io_in_QSV_5_1,
    input  logic signed [7:0] io_in_QSV_6_0,
    input  logic signed [7:0] io_in_QSV_6_1,
    input  logic signed [7:0] io_in_QSV_7_0,
    input  logic signed [7:0] io_in_QSV_7_1,
    input  logic        io_in_valid,
    output logic signed [7:0] io_out_QSV_0_0,
    output logic signed [7:0] io_out_QSV_0_1,
    output logic signed [7:0] io_out_QSV_1_0,
    output logic signed [7:0] io_out_QSV_1_1,
    output logic signed [7:0] io_out_QSV_2_0,
    output logic signed [7:0] io_out_QSV_2_1,
    output logic signed [7:0] io_out_QSV_3_0,
    output logic signed [7:0] io_out_QSV_3_1,
    output logic signed [7:0] io_out_QSV_4_0,
    output logic signed [7:0] io_out_QSV_4_1,
    output logic signed [7:0] io_out_QSV_5_0,
    output logic signed [7:0] io_out_QSV_5_1,
    output logic signed [7:0] io_out_QSV_6_0,
    output logic signed [7:0] io_out_QSV_6_1,
    output logic signed [7:0] io_out_QSV_7_0,
    output logic signed [7:0] io_out_QSV_7_1,
    output logic        io_out_valid
);

    // Helper functions for fixed-point quantum arithmetic
    function automatic logic signed [7:0] scale_and_clamp(logic signed [17:0] val);
        logic signed [10:0] shifted;
        shifted = val >>> 7;
        if (shifted > 11'sd127) begin
            return 8'sd127;
        end else if (shifted < -11'sd128) begin
            return -8'sd128;
        end else begin
            return shifted[7:0];
        end
    endfunction

    function automatic logic signed [7:0] safe_neg(logic signed [7:0] val);
        if (val == -8'sd128) return 8'sd127;
        else return -val;
    endfunction

    function automatic logic signed [7:0] hadamard_sum(logic signed [7:0] a, logic signed [7:0] b);
        logic signed [8:0] sum;
        logic signed [17:0] prod;
        sum = 9'(a) + 9'(b);
        prod = sum * 9'sd91; // 91/128 ~ 1/sqrt(2)
        return scale_and_clamp(prod);
    endfunction

    function automatic logic signed [7:0] hadamard_diff(logic signed [7:0] a, logic signed [7:0] b);
        logic signed [8:0] diff;
        logic signed [17:0] prod;
        diff = 9'(a) - 9'(b);
        prod = diff * 9'sd91; // 91/128 ~ 1/sqrt(2)
        return scale_and_clamp(prod);
    endfunction

    function automatic logic signed [7:0] rot_pi_4_r(logic signed [7:0] r, logic signed [7:0] i);
        logic signed [8:0] diff;
        logic signed [17:0] prod;
        diff = 9'(r) - 9'(i);
        prod = diff * 9'sd91;
        return scale_and_clamp(prod);
    endfunction

    function automatic logic signed [7:0] rot_pi_4_i(logic signed [7:0] r, logic signed [7:0] i);
        logic signed [8:0] sum;
        logic signed [17:0] prod;
        sum = 9'(r) + 9'(i);
        prod = sum * 9'sd91;
        return scale_and_clamp(prod);
    endfunction

    // Pipeline Registers
    logic stage0_valid;
    logic signed [7:0] stage0_QSV_0_0, stage0_QSV_0_1;
    logic signed [7:0] stage0_QSV_1_0, stage0_QSV_1_1;
    logic signed [7:0] stage0_QSV_2_0, stage0_QSV_2_1;
    logic signed [7:0] stage0_QSV_3_0, stage0_QSV_3_1;
    logic signed [7:0] stage0_QSV_4_0, stage0_QSV_4_1;
    logic signed [7:0] stage0_QSV_5_0, stage0_QSV_5_1;
    logic signed [7:0] stage0_QSV_6_0, stage0_QSV_6_1;
    logic signed [7:0] stage0_QSV_7_0, stage0_QSV_7_1;

    logic stage1_valid;
    logic signed [7:0] stage1_QSV_0_0, stage1_QSV_0_1;
    logic signed [7:0] stage1_QSV_1_0, stage1_QSV_1_1;
    logic signed [7:0] stage1_QSV_2_0, stage1_QSV_2_1;
    logic signed [7:0] stage1_QSV_3_0, stage1_QSV_3_1;
    logic signed [7:0] stage1_QSV_4_0, stage1_QSV_4_1;
    logic signed [7:0] stage1_QSV_5_0, stage1_QSV_5_1;
    logic signed [7:0] stage1_QSV_6_0, stage1_QSV_6_1;
    logic signed [7:0] stage1_QSV_7_0, stage1_QSV_7_1;

    logic stage2_valid;
    logic signed [7:0] stage2_QSV_0_0, stage2_QSV_0_1;
    logic signed [7:0] stage2_QSV_1_0, stage2_QSV_1_1;
    logic signed [7:0] stage2_QSV_2_0, stage2_QSV_2_1;
    logic signed [7:0] stage2_QSV_3_0, stage2_QSV_3_1;
    logic signed [7:0] stage2_QSV_4_0, stage2_QSV_4_1;
    logic signed [7:0] stage2_QSV_5_0, stage2_QSV_5_1;
    logic signed [7:0] stage2_QSV_6_0, stage2_QSV_6_1;
    logic signed [7:0] stage2_QSV_7_0, stage2_QSV_7_1;

    logic stage3_valid;
    logic signed [7:0] stage3_QSV_0_0, stage3_QSV_0_1;
    logic signed [7:0] stage3_QSV_1_0, stage3_QSV_1_1;
    logic signed [7:0] stage3_QSV_2_0, stage3_QSV_2_1;
    logic signed [7:0] stage3_QSV_3_0, stage3_QSV_3_1;
    logic signed [7:0] stage3_QSV_4_0, stage3_QSV_4_1;
    logic signed [7:0] stage3_QSV_5_0, stage3_QSV_5_1;
    logic signed [7:0] stage3_QSV_6_0, stage3_QSV_6_1;
    logic signed [7:0] stage3_QSV_7_0, stage3_QSV_7_1;

    logic stage4_valid;
    logic signed [7:0] stage4_QSV_0_0, stage4_QSV_0_1;
    logic signed [7:0] stage4_QSV_1_0, stage4_QSV_1_1;
    logic signed [7:0] stage4_QSV_2_0, stage4_QSV_2_1;
    logic signed [7:0] stage4_QSV_3_0, stage4_QSV_3_1;
    logic signed [7:0] stage4_QSV_4_0, stage4_QSV_4_1;
    logic signed [7:0] stage4_QSV_5_0, stage4_QSV_5_1;
    logic signed [7:0] stage4_QSV_6_0, stage4_QSV_6_1;
    logic signed [7:0] stage4_QSV_7_0, stage4_QSV_7_1;

    logic stage5_valid;
    logic signed [7:0] stage5_QSV_0_0, stage5_QSV_0_1;
    logic signed [7:0] stage5_QSV_1_0, stage5_QSV_1_1;
    logic signed [7:0] stage5_QSV_2_0, stage5_QSV_2_1;
    logic signed [7:0] stage5_QSV_3_0, stage5_QSV_3_1;
    logic signed [7:0] stage5_QSV_4_0, stage5_QSV_4_1;
    logic signed [7:0] stage5_QSV_5_0, stage5_QSV_5_1;
    logic signed [7:0] stage5_QSV_6_0, stage5_QSV_6_1;
    logic signed [7:0] stage5_QSV_7_0, stage5_QSV_7_1;

    logic stage6_valid;
    logic signed [7:0] stage6_QSV_0_0, stage6_QSV_0_1;
    logic signed [7:0] stage6_QSV_1_0, stage6_QSV_1_1;
    logic signed [7:0] stage6_QSV_2_0, stage6_QSV_2_1;
    logic signed [7:0] stage6_QSV_3_0, stage6_QSV_3_1;
    logic signed [7:0] stage6_QSV_4_0, stage6_QSV_4_1;
    logic signed [7:0] stage6_QSV_5_0, stage6_QSV_5_1;
    logic signed [7:0] stage6_QSV_6_0, stage6_QSV_6_1;
    logic signed [7:0] stage6_QSV_7_0, stage6_QSV_7_1;

    // Stage 0: Hadamard on qubit 0
    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            stage0_valid <= 1'b0;
            stage0_QSV_0_0 <= 8'sd0; stage0_QSV_0_1 <= 8'sd0;
            stage0_QSV_1_0 <= 8'sd0; stage0_QSV_1_1 <= 8'sd0;
            stage0_QSV_2_0 <= 8'sd0; stage0_QSV_2_1 <= 8'sd0;
            stage0_QSV_3_0 <= 8'sd0; stage0_QSV_3_1 <= 8'sd0;
            stage0_QSV_4_0 <= 8'sd0; stage0_QSV_4_1 <= 8'sd0;
            stage0_QSV_5_0 <= 8'sd0; stage0_QSV_5_1 <= 8'sd0;
            stage0_QSV_6_0 <= 8'sd0; stage0_QSV_6_1 <= 8'sd0;
            stage0_QSV_7_0 <= 8'sd0; stage0_QSV_7_1 <= 8'sd0;
        end else begin
            stage0_valid <= io_in_valid;
            if (io_in_valid) begin
                stage0_QSV_0_0 <= hadamard_sum(io_in_QSV_0_0, io_in_QSV_1_0);
                stage0_QSV_0_1 <= hadamard_sum(io_in_QSV_0_1, io_in_QSV_1_1);
                stage0_QSV_1_0 <= hadamard_diff(io_in_QSV_0_0, io_in_QSV_1_0);
                stage0_QSV_1_1 <= hadamard_diff(io_in_QSV_0_1, io_in_QSV_1_1);

                stage0_QSV_2_0 <= hadamard_sum(io_in_QSV_2_0, io_in_QSV_3_0);
                stage0_QSV_2_1 <= hadamard_sum(io_in_QSV_2_1, io_in_QSV_3_1);
                stage0_QSV_3_0 <= hadamard_diff(io_in_QSV_2_0, io_in_QSV_3_0);
                stage0_QSV_3_1 <= hadamard_diff(io_in_QSV_2_1, io_in_QSV_3_1);

                stage0_QSV_4_0 <= hadamard_sum(io_in_QSV_4_0, io_in_QSV_5_0);
                stage0_QSV_4_1 <= hadamard_sum(io_in_QSV_4_1, io_in_QSV_5_1);
                stage0_QSV_5_0 <= hadamard_diff(io_in_QSV_4_0, io_in_QSV_5_0);
                stage0_QSV_5_1 <= hadamard_diff(io_in_QSV_4_1, io_in_QSV_5_1);

                stage0_QSV_6_0 <= hadamard_sum(io_in_QSV_6_0, io_in_QSV_7_0);
                stage0_QSV_6_1 <= hadamard_sum(io_in_QSV_6_1, io_in_QSV_7_1);
                stage0_QSV_7_0 <= hadamard_diff(io_in_QSV_6_0, io_in_QSV_7_0);
                stage0_QSV_7_1 <= hadamard_diff(io_in_QSV_6_1, io_in_QSV_7_1);
            end
        end
    end

    // Stage 1: Controlled-S on qubits 1 (control) and 0 (target)
    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            stage1_valid <= 1'b0;
            stage1_QSV_0_0 <= 8'sd0; stage1_QSV_0_1 <= 8'sd0;
            stage1_QSV_1_0 <= 8'sd0; stage1_QSV_1_1 <= 8'sd0;
            stage1_QSV_2_0 <= 8'sd0; stage1_QSV_2_1 <= 8'sd0;
            stage1_QSV_3_0 <= 8'sd0; stage1_QSV_3_1 <= 8'sd0;
            stage1_QSV_4_0 <= 8'sd0; stage1_QSV_4_1 <= 8'sd0;
            stage1_QSV_5_0 <= 8'sd0; stage1_QSV_5_1 <= 8'sd0;
            stage1_QSV_6_0 <= 8'sd0; stage1_QSV_6_1 <= 8'sd0;
            stage1_QSV_7_0 <= 8'sd0; stage1_QSV_7_1 <= 8'sd0;
        end else begin
            stage1_valid <= stage0_valid;
            if (stage0_valid) begin
                stage1_QSV_0_0 <= stage0_QSV_0_0;
                stage1_QSV_0_1 <= stage0_QSV_0_1;
                stage1_QSV_1_0 <= stage0_QSV_1_0;
                stage1_QSV_1_1 <= stage0_QSV_1_1;
                stage1_QSV_2_0 <= stage0_QSV_2_0;
                stage1_QSV_2_1 <= stage0_QSV_2_1;

                stage1_QSV_3_0 <= safe_neg(stage0_QSV_3_1);
                stage1_QSV_3_1 <= stage0_QSV_3_0;

                stage1_QSV_4_0 <= stage0_QSV_4_0;
                stage1_QSV_4_1 <= stage0_QSV_4_1;
                stage1_QSV_5_0 <= stage0_QSV_5_0;
                stage1_QSV_5_1 <= stage0_QSV_5_1;
                stage1_QSV_6_0 <= stage0_QSV_6_0;
                stage1_QSV_6_1 <= stage0_QSV_6_1;

                stage1_QSV_7_0 <= safe_neg(stage0_QSV_7_1);
                stage1_QSV_7_1 <= stage0_QSV_7_0;
            end
        end
    end

    // Stage 2: Controlled-Phase (pi/4) on qubits 2 (control) and 0 (target)
    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            stage2_valid <= 1'b0;
            stage2_QSV_0_0 <= 8'sd0; stage2_QSV_0_1 <= 8'sd0;
            stage2_QSV_1_0 <= 8'sd0; stage2_QSV_1_1 <= 8'sd0;
            stage2_QSV_2_0 <= 8'sd0; stage2_QSV_2_1 <= 8'sd0;
            stage2_QSV_3_0 <= 8'sd0; stage2_QSV_3_1 <= 8'sd0;
            stage2_QSV_4_0 <= 8'sd0; stage2_QSV_4_1 <= 8'sd0;
            stage2_QSV_5_0 <= 8'sd0; stage2_QSV_5_1 <= 8'sd0;
            stage2_QSV_6_0 <= 8'sd0; stage2_QSV_6_1 <= 8'sd0;
            stage2_QSV_7_0 <= 8'sd0; stage2_QSV_7_1 <= 8'sd0;
        end else begin
            stage2_valid <= stage1_valid;
            if (stage1_valid) begin
                stage2_QSV_0_0 <= stage1_QSV_0_0;
                stage2_QSV_0_1 <= stage1_QSV_0_1;
                stage2_QSV_1_0 <= stage1_QSV_1_0;
                stage2_QSV_1_1 <= stage1_QSV_1_1;
                stage2_QSV_2_0 <= stage1_QSV_2_0;
                stage2_QSV_2_1 <= stage1_QSV_2_1;
                stage2_QSV_3_0 <= stage1_QSV_3_0;
                stage2_QSV_3_1 <= stage1_QSV_3_1;
                stage2_QSV_4_0 <= stage1_QSV_4_0;
                stage2_QSV_4_1 <= stage1_QSV_4_1;

                stage2_QSV_5_0 <= rot_pi_4_r(stage1_QSV_5_0, stage1_QSV_5_1);
                stage2_QSV_5_1 <= rot_pi_4_i(stage1_QSV_5_0, stage1_QSV_5_1);

                stage2_QSV_6_0 <= stage1_QSV_6_0;
                stage2_QSV_6_1 <= stage1_QSV_6_1;

                stage2_QSV_7_0 <= rot_pi_4_r(stage1_QSV_7_0, stage1_QSV_7_1);
                stage2_QSV_7_1 <= rot_pi_4_i(stage1_QSV_7_0, stage1_QSV_7_1);
            end
        end
    end

    // Stage 3: Hadamard on qubit 1
    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            stage3_valid <= 1'b0;
            stage3_QSV_0_0 <= 8'sd0; stage3_QSV_0_1 <= 8'sd0;
            stage3_QSV_1_0 <= 8'sd0; stage3_QSV_1_1 <= 8'sd0;
            stage3_QSV_2_0 <= 8'sd0; stage3_QSV_2_1 <= 8'sd0;
            stage3_QSV_3_0 <= 8'sd0; stage3_QSV_3_1 <= 8'sd0;
            stage3_QSV_4_0 <= 8'sd0; stage3_QSV_4_1 <= 8'sd0;
            stage3_QSV_5_0 <= 8'sd0; stage3_QSV_5_1 <= 8'sd0;
            stage3_QSV_6_0 <= 8'sd0; stage3_QSV_6_1 <= 8'sd0;
            stage3_QSV_7_0 <= 8'sd0; stage3_QSV_7_1 <= 8'sd0;
        end else begin
            stage3_valid <= stage2_valid;
            if (stage2_valid) begin
                stage3_QSV_0_0 <= hadamard_sum(stage2_QSV_0_0, stage2_QSV_2_0);
                stage3_QSV_0_1 <= hadamard_sum(stage2_QSV_0_1, stage2_QSV_2_1);
                stage3_QSV_2_0 <= hadamard_diff(stage2_QSV_0_0, stage2_QSV_2_0);
                stage3_QSV_2_1 <= hadamard_diff(stage2_QSV_0_1, stage2_QSV_2_1);

                stage3_QSV_1_0 <= hadamard_sum(stage2_QSV_1_0, stage2_QSV_3_0);
                stage3_QSV_1_1 <= hadamard_sum(stage2_QSV_1_1, stage2_QSV_3_1);
                stage3_QSV_3_0 <= hadamard_diff(stage2_QSV_1_0, stage2_QSV_3_0);
                stage3_QSV_3_1 <= hadamard_diff(stage2_QSV_1_1, stage2_QSV_3_1);

                stage3_QSV_4_0 <= hadamard_sum(stage2_QSV_4_0, stage2_QSV_6_0);
                stage3_QSV_4_1 <= hadamard_sum(stage2_QSV_4_1, stage2_QSV_6_1);
                stage3_QSV_6_0 <= hadamard_diff(stage2_QSV_4_0, stage2_QSV_6_0);
                stage3_QSV_6_1 <= hadamard_diff(stage2_QSV_4_1, stage2_QSV_6_1);

                stage3_QSV_5_0 <= hadamard_sum(stage2_QSV_5_0, stage2_QSV_7_0);
                stage3_QSV_5_1 <= hadamard_sum(stage2_QSV_5_1, stage2_QSV_7_1);
                stage3_QSV_7_0 <= hadamard_diff(stage2_QSV_5_0, stage2_QSV_7_0);
                stage3_QSV_7_1 <= hadamard_diff(stage2_QSV_5_1, stage2_QSV_7_1);
            end
        end
    end

    // Stage 4: Controlled-S on qubits 2 (control) and 1 (target)
    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            stage4_valid <= 1'b0;
            stage4_QSV_0_0 <= 8'sd0; stage4_QSV_0_1 <= 8'sd0;
            stage4_QSV_1_0 <= 8'sd0; stage4_QSV_1_1 <= 8'sd0;
            stage4_QSV_2_0 <= 8'sd0; stage4_QSV_2_1 <= 8'sd0;
            stage4_QSV_3_0 <= 8'sd0; stage4_QSV_3_1 <= 8'sd0;
            stage4_QSV_4_0 <= 8'sd0; stage4_QSV_4_1 <= 8'sd0;
            stage4_QSV_5_0 <= 8'sd0; stage4_QSV_5_1 <= 8'sd0;
            stage4_QSV_6_0 <= 8'sd0; stage4_QSV_6_1 <= 8'sd0;
            stage4_QSV_7_0 <= 8'sd0; stage4_QSV_7_1 <= 8'sd0;
        end else begin
            stage4_valid <= stage3_valid;
            if (stage3_valid) begin
                stage4_QSV_0_0 <= stage3_QSV_0_0;
                stage4_QSV_0_1 <= stage3_QSV_0_1;
                stage4_QSV_1_0 <= stage3_QSV_1_0;
                stage4_QSV_1_1 <= stage3_QSV_1_1;
                stage4_QSV_2_0 <= stage3_QSV_2_0;
                stage4_QSV_2_1 <= stage3_QSV_2_1;
                stage4_QSV_3_0 <= stage3_QSV_3_0;
                stage4_QSV_3_1 <= stage3_QSV_3_1;
                stage4_QSV_4_0 <= stage3_QSV_4_0;
                stage4_QSV_4_1 <= stage3_QSV_4_1;
                stage4_QSV_5_0 <= stage3_QSV_5_0;
                stage4_QSV_5_1 <= stage3_QSV_5_1;

                stage4_QSV_6_0 <= safe_neg(stage3_QSV_6_1);
                stage4_QSV_6_1 <= stage3_QSV_6_0;

                stage4_QSV_7_0 <= safe_neg(stage3_QSV_7_1);
                stage4_QSV_7_1 <= stage3_QSV_7_0;
            end
        end
    end

    // Stage 5: Hadamard on qubit 2
    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            stage5_valid <= 1'b0;
            stage5_QSV_0_0 <= 8'sd0; stage5_QSV_0_1 <= 8'sd0;
            stage5_QSV_1_0 <= 8'sd0; stage5_QSV_1_1 <= 8'sd0;
            stage5_QSV_2_0 <= 8'sd0; stage5_QSV_2_1 <= 8'sd0;
            stage5_QSV_3_0 <= 8'sd0; stage5_QSV_3_1 <= 8'sd0;
            stage5_QSV_4_0 <= 8'sd0; stage5_QSV_4_1 <= 8'sd0;
            stage5_QSV_5_0 <= 8'sd0; stage5_QSV_5_1 <= 8'sd0;
            stage5_QSV_6_0 <= 8'sd0; stage5_QSV_6_1 <= 8'sd0;
            stage5_QSV_7_0 <= 8'sd0; stage5_QSV_7_1 <= 8'sd0;
        end else begin
            stage5_valid <= stage4_valid;
            if (stage4_valid) begin
                stage5_QSV_0_0 <= hadamard_sum(stage4_QSV_0_0, stage4_QSV_4_0);
                stage5_QSV_0_1 <= hadamard_sum(stage4_QSV_0_1, stage4_QSV_4_1);
                stage5_QSV_4_0 <= hadamard_diff(stage4_QSV_0_0, stage4_QSV_4_0);
                stage5_QSV_4_1 <= hadamard_diff(stage4_QSV_0_1, stage4_QSV_4_1);

                stage5_QSV_1_0 <= hadamard_sum(stage4_QSV_1_0, stage4_QSV_5_0);
                stage5_QSV_1_1 <= hadamard_sum(stage4_QSV_1_1, stage4_QSV_5_1);
                stage5_QSV_5_0 <= hadamard_diff(stage4_QSV_1_0, stage4_QSV_5_0);
                stage5_QSV_5_1 <= hadamard_diff(stage4_QSV_1_1, stage4_QSV_5_1);

                stage5_QSV_2_0 <= hadamard_sum(stage4_QSV_2_0, stage4_QSV_6_0);
                stage5_QSV_2_1 <= hadamard_sum(stage4_QSV_2_1, stage4_QSV_6_1);
                stage5_QSV_6_0 <= hadamard_diff(stage4_QSV_2_0, stage4_QSV_6_0);
                stage5_QSV_6_1 <= hadamard_diff(stage4_QSV_2_1, stage4_QSV_6_1);

                stage5_QSV_3_0 <= hadamard_sum(stage4_QSV_3_0, stage4_QSV_7_0);
                stage5_QSV_3_1 <= hadamard_sum(stage4_QSV_3_1, stage4_QSV_7_1);
                stage5_QSV_7_0 <= hadamard_diff(stage4_QSV_3_0, stage4_QSV_7_0);
                stage5_QSV_7_1 <= hadamard_diff(stage4_QSV_3_1, stage4_QSV_7_1);
            end
        end
    end

    // Stage 6: Swap qubits 0 and 2
    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            stage6_valid <= 1'b0;
            stage6_QSV_0_0 <= 8'sd0; stage6_QSV_0_1 <= 8'sd0;
            stage6_QSV_1_0 <= 8'sd0; stage6_QSV_1_1 <= 8'sd0;
            stage6_QSV_2_0 <= 8'sd0; stage6_QSV_2_1 <= 8'sd0;
            stage6_QSV_3_0 <= 8'sd0; stage6_QSV_3_1 <= 8'sd0;
            stage6_QSV_4_0 <= 8'sd0; stage6_QSV_4_1 <= 8'sd0;
            stage6_QSV_5_0 <= 8'sd0; stage6_QSV_5_1 <= 8'sd0;
            stage6_QSV_6_0 <= 8'sd0; stage6_QSV_6_1 <= 8'sd0;
            stage6_QSV_7_0 <= 8'sd0; stage6_QSV_7_1 <= 8'sd0;
        end else begin
            stage6_valid <= stage5_valid;
            if (stage5_valid) begin
                stage6_QSV_0_0 <= stage5_QSV_0_0;
                stage6_QSV_0_1 <= stage5_QSV_0_1;

                stage6_QSV_1_0 <= stage5_QSV_4_0; // swapped with 4
                stage6_QSV_1_1 <= stage5_QSV_4_1;

                stage6_QSV_2_0 <= stage5_QSV_2_0;
                stage6_QSV_2_1 <= stage5_QSV_2_1;

                stage6_QSV_3_0 <= stage5_QSV_6_0; // swapped with 6
                stage6_QSV_3_1 <= stage5_QSV_6_1;

                stage6_QSV_4_0 <= stage5_QSV_1_0; // swapped with 1
                stage6_QSV_4_1 <= stage5_QSV_1_1;

                stage6_QSV_5_0 <= stage5_QSV_5_0;
                stage6_QSV_5_1 <= stage5_QSV_5_1;

                stage6_QSV_6_0 <= stage5_QSV_3_0; // swapped with 3
                stage6_QSV_6_1 <= stage5_QSV_3_1;

                stage6_QSV_7_0 <= stage5_QSV_7_0;
                stage6_QSV_7_1 <= stage5_QSV_7_1;
            end
        end
    end

    // Outputs Assignment
    assign io_out_valid = stage6_valid;
    assign io_out_QSV_0_0 = stage6_QSV_0_0;
    assign io_out_QSV_0_1 = stage6_QSV_0_1;
    assign io_out_QSV_1_0 = stage6_QSV_1_0;
    assign io_out_QSV_1_1 = stage6_QSV_1_1;
    assign io_out_QSV_2_0 = stage6_QSV_2_0;
    assign io_out_QSV_2_1 = stage6_QSV_2_1;
    assign io_out_QSV_3_0 = stage6_QSV_3_0;
    assign io_out_QSV_3_1 = stage6_QSV_3_1;
    assign io_out_QSV_4_0 = stage6_QSV_4_0;
    assign io_out_QSV_4_1 = stage6_QSV_4_1;
    assign io_out_QSV_5_0 = stage6_QSV_5_0;
    assign io_out_QSV_5_1 = stage6_QSV_5_1;
    assign io_out_QSV_6_0 = stage6_QSV_6_0;
    assign io_out_QSV_6_1 = stage6_QSV_6_1;
    assign io_out_QSV_7_0 = stage6_QSV_7_0;
    assign io_out_QSV_7_1 = stage6_QSV_7_1;

endmodule
