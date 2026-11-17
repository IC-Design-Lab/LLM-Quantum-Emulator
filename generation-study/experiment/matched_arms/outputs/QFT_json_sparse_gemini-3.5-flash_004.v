module QFT (
    input  logic clock,
    input  logic reset,
    input  logic [7:0] io_in_QSV_0_0,
    input  logic [7:0] io_in_QSV_0_1,
    input  logic [7:0] io_in_QSV_1_0,
    input  logic [7:0] io_in_QSV_1_1,
    input  logic [7:0] io_in_QSV_2_0,
    input  logic [7:0] io_in_QSV_2_1,
    input  logic [7:0] io_in_QSV_3_0,
    input  logic [7:0] io_in_QSV_3_1,
    input  logic [7:0] io_in_QSV_4_0,
    input  logic [7:0] io_in_QSV_4_1,
    input  logic [7:0] io_in_QSV_5_0,
    input  logic [7:0] io_in_QSV_5_1,
    input  logic [7:0] io_in_QSV_6_0,
    input  logic [7:0] io_in_QSV_6_1,
    input  logic [7:0] io_in_QSV_7_0,
    input  logic [7:0] io_in_QSV_7_1,
    input  logic io_in_valid,
    output logic [7:0] io_out_QSV_0_0,
    output logic [7:0] io_out_QSV_0_1,
    output logic [7:0] io_out_QSV_1_0,
    output logic [7:0] io_out_QSV_1_1,
    output logic [7:0] io_out_QSV_2_0,
    output logic [7:0] io_out_QSV_2_1,
    output logic [7:0] io_out_QSV_3_0,
    output logic [7:0] io_out_QSV_3_1,
    output logic [7:0] io_out_QSV_4_0,
    output logic [7:0] io_out_QSV_4_1,
    output logic [7:0] io_out_QSV_5_0,
    output logic [7:0] io_out_QSV_5_1,
    output logic [7:0] io_out_QSV_6_0,
    output logic [7:0] io_out_QSV_6_1,
    output logic [7:0] io_out_QSV_7_0,
    output logic [7:0] io_out_QSV_7_1,
    output logic io_out_valid
);

    // Helpers for fixed-point math
    function automatic logic signed [7:0] sat_scale(input logic signed [16:0] temp);
        logic signed [16:0] shifted;
        begin
            shifted = temp >>> 7;
            if (shifted > 16'sd127)
                sat_scale = 8'sd127;
            else if (shifted < -16'sd128)
                sat_scale = -8'sd128;
            else
                sat_scale = shifted[7:0];
        end
    endfunction

    function automatic logic signed [7:0] had_sum(input logic signed [7:0] a, input logic signed [7:0] b);
        logic signed [8:0] sum;
        logic signed [16:0] temp;
        begin
            sum = $signed(a) + $signed(b);
            temp = sum * 17'sd90; // 90 / 128 approx 1/sqrt(2)
            had_sum = sat_scale(temp);
        end
    endfunction

    function automatic logic signed [7:0] had_diff(input logic signed [7:0] a, input logic signed [7:0] b);
        logic signed [8:0] diff;
        logic signed [16:0] temp;
        begin
            diff = $signed(a) - $signed(b);
            temp = diff * 17'sd90;
            had_diff = sat_scale(temp);
        end
    endfunction

    function automatic logic signed [7:0] safe_neg(input logic signed [7:0] val);
        begin
            if (val == -8'sd128)
                safe_neg = 8'sd127;
            else
                safe_neg = -val;
        end
    endfunction

    // Input layout
    logic signed [7:0] in_real[0:7];
    logic signed [7:0] in_imag[0:7];

    assign in_real[0] = $signed(io_in_QSV_0_0);
    assign in_imag[0] = $signed(io_in_QSV_0_1);
    assign in_real[1] = $signed(io_in_QSV_1_0);
    assign in_imag[1] = $signed(io_in_QSV_1_1);
    assign in_real[2] = $signed(io_in_QSV_2_0);
    assign in_imag[2] = $signed(io_in_QSV_2_1);
    assign in_real[3] = $signed(io_in_QSV_3_0);
    assign in_imag[3] = $signed(io_in_QSV_3_1);
    assign in_real[4] = $signed(io_in_QSV_4_0);
    assign in_imag[4] = $signed(io_in_QSV_4_1);
    assign in_real[5] = $signed(io_in_QSV_5_0);
    assign in_imag[5] = $signed(io_in_QSV_5_1);
    assign in_real[6] = $signed(io_in_QSV_6_0);
    assign in_imag[6] = $signed(io_in_QSV_6_1);
    assign in_real[7] = $signed(io_in_QSV_7_0);
    assign in_imag[7] = $signed(io_in_QSV_7_1);

    // ==========================================
    // STAGE 0: H on qubit 0
    // ==========================================
    logic signed [7:0] stage0_next_real[0:7];
    logic signed [7:0] stage0_next_imag[0:7];
    logic stage0_next_valid;

    always_comb begin
        for (int i = 0; i < 8; i++) begin
            if ((i & 1) == 0) begin
                stage0_next_real[i]   = had_sum(in_real[i], in_real[i+1]);
                stage0_next_real[i+1] = had_diff(in_real[i], in_real[i+1]);
                stage0_next_imag[i]   = had_sum(in_imag[i], in_imag[i+1]);
                stage0_next_imag[i+1] = had_diff(in_imag[i], in_imag[i+1]);
            end
        end
        stage0_next_valid = io_in_valid;
    end

    logic signed [7:0] stage0_r_real[0:7];
    logic signed [7:0] stage0_r_imag[0:7];
    logic stage0_r_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                stage0_r_real[i] <= 8'sd0;
                stage0_r_imag[i] <= 8'sd0;
            end
            stage0_r_valid <= 1'b0;
        end else begin
            for (int i = 0; i < 8; i++) begin
                stage0_r_real[i] <= stage0_next_real[i];
                stage0_r_imag[i] <= stage0_next_imag[i];
            end
            stage0_r_valid <= stage0_next_valid;
        end
    end

    // ==========================================
    // STAGE 1: CS on qubit 1 (control), 0 (target)
    // ==========================================
    logic signed [7:0] stage1_next_real[0:7];
    logic signed [7:0] stage1_next_imag[0:7];
    logic stage1_next_valid;

    always_comb begin
        for (int i = 0; i < 8; i++) begin
            if (i == 3 || i == 7) begin
                stage1_next_real[i] = safe_neg(stage0_r_imag[i]);
                stage1_next_imag[i] = stage0_r_real[i];
            end else begin
                stage1_next_real[i] = stage0_r_real[i];
                stage1_next_imag[i] = stage0_r_imag[i];
            end
        end
        stage1_next_valid = stage0_r_valid;
    end

    logic signed [7:0] stage1_r_real[0:7];
    logic signed [7:0] stage1_r_imag[0:7];
    logic stage1_r_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                stage1_r_real[i] <= 8'sd0;
                stage1_r_imag[i] <= 8'sd0;
            end
            stage1_r_valid <= 1'b0;
        end else begin
            for (int i = 0; i < 8; i++) begin
                stage1_r_real[i] <= stage1_next_real[i];
                stage1_r_imag[i] <= stage1_next_imag[i];
            end
            stage1_r_valid <= stage1_next_valid;
        end
    end

    // ==========================================
    // STAGE 2: CP on qubit 2 (control), 0 (target) with angle pi/4
    // ==========================================
    logic signed [7:0] stage2_next_real[0:7];
    logic signed [7:0] stage2_next_imag[0:7];
    logic stage2_next_valid;

    always_comb begin
        for (int i = 0; i < 8; i++) begin
            if (i == 5 || i == 7) begin
                stage2_next_real[i] = had_diff(stage1_r_real[i], stage1_r_imag[i]);
                stage2_next_imag[i] = had_sum(stage1_r_real[i], stage1_r_imag[i]);
            end else begin
                stage2_next_real[i] = stage1_r_real[i];
                stage2_next_imag[i] = stage1_r_imag[i];
            end
        end
        stage2_next_valid = stage1_r_valid;
    end

    logic signed [7:0] stage2_r_real[0:7];
    logic signed [7:0] stage2_r_imag[0:7];
    logic stage2_r_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                stage2_r_real[i] <= 8'sd0;
                stage2_r_imag[i] <= 8'sd0;
            end
            stage2_r_valid <= 1'b0;
        end else begin
            for (int i = 0; i < 8; i++) begin
                stage2_r_real[i] <= stage2_next_real[i];
                stage2_r_imag[i] <= stage2_next_imag[i];
            end
            stage2_r_valid <= stage2_next_valid;
        end
    end

    // ==========================================
    // STAGE 3: H on qubit 1
    // ==========================================
    logic signed [7:0] stage3_next_real[0:7];
    logic signed [7:0] stage3_next_imag[0:7];
    logic stage3_next_valid;

    always_comb begin
        for (int i = 0; i < 8; i++) begin
            if ((i & 2) == 0) begin
                stage3_next_real[i]   = had_sum(stage2_r_real[i], stage2_r_real[i+2]);
                stage3_next_real[i+2] = had_diff(stage2_r_real[i], stage2_r_real[i+2]);
                stage3_next_imag[i]   = had_sum(stage2_r_imag[i], stage2_r_imag[i+2]);
                stage3_next_imag[i+2] = had_diff(stage2_r_imag[i], stage2_r_imag[i+2]);
            end
        end
        stage3_next_valid = stage2_r_valid;
    end

    logic signed [7:0] stage3_r_real[0:7];
    logic signed [7:0] stage3_r_imag[0:7];
    logic stage3_r_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                stage3_r_real[i] <= 8'sd0;
                stage3_r_imag[i] <= 8'sd0;
            end
            stage3_r_valid <= 1'b0;
        end else begin
            for (int i = 0; i < 8; i++) begin
                stage3_r_real[i] <= stage3_next_real[i];
                stage3_r_imag[i] <= stage3_next_imag[i];
            end
            stage3_r_valid <= stage3_next_valid;
        end
    end

    // ==========================================
    // STAGE 4: CS on qubit 2 (control), 1 (target)
    // ==========================================
    logic signed [7:0] stage4_next_real[0:7];
    logic signed [7:0] stage4_next_imag[0:7];
    logic stage4_next_valid;

    always_comb begin
        for (int i = 0; i < 8; i++) begin
            if (i == 6 || i == 7) begin
                stage4_next_real[i] = safe_neg(stage3_r_imag[i]);
                stage4_next_imag[i] = stage3_r_real[i];
            end else begin
                stage4_next_real[i] = stage3_r_real[i];
                stage4_next_imag[i] = stage3_r_imag[i];
            end
        end
        stage4_next_valid = stage3_r_valid;
    end

    logic signed [7:0] stage4_r_real[0:7];
    logic signed [7:0] stage4_r_imag[0:7];
    logic stage4_r_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                stage4_r_real[i] <= 8'sd0;
                stage4_r_imag[i] <= 8'sd0;
            end
            stage4_r_valid <= 1'b0;
        end else begin
            for (int i = 0; i < 8; i++) begin
                stage4_r_real[i] <= stage4_next_real[i];
                stage4_r_imag[i] <= stage4_next_imag[i];
            end
            stage4_r_valid <= stage4_next_valid;
        end
    end

    // ==========================================
    // STAGE 5: H on qubit 2
    // ==========================================
    logic signed [7:0] stage5_next_real[0:7];
    logic signed [7:0] stage5_next_imag[0:7];
    logic stage5_next_valid;

    always_comb begin
        for (int i = 0; i < 8; i++) begin
            if ((i & 4) == 0) begin
                stage5_next_real[i]   = had_sum(stage4_r_real[i], stage4_r_real[i+4]);
                stage5_next_real[i+4] = had_diff(stage4_r_real[i], stage4_r_real[i+4]);
                stage5_next_imag[i]   = had_sum(stage4_r_imag[i], stage4_r_imag[i+4]);
                stage5_next_imag[i+4] = had_diff(stage4_r_imag[i], stage4_r_imag[i+4]);
            end
        end
        stage5_next_valid = stage4_r_valid;
    end

    logic signed [7:0] stage5_r_real[0:7];
    logic signed [7:0] stage5_r_imag[0:7];
    logic stage5_r_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                stage5_r_real[i] <= 8'sd0;
                stage5_r_imag[i] <= 8'sd0;
            end
            stage5_r_valid <= 1'b0;
        end else begin
            for (int i = 0; i < 8; i++) begin
                stage5_r_real[i] <= stage5_next_real[i];
                stage5_r_imag[i] <= stage5_next_imag[i];
            end
            stage5_r_valid <= stage5_next_valid;
        end
    end

    // ==========================================
    // STAGE 6: SWAP qubits 0 and 2
    // ==========================================
    logic signed [7:0] stage6_next_real[0:7];
    logic signed [7:0] stage6_next_imag[0:7];
    logic stage6_next_valid;

    always_comb begin
        for (int i = 0; i < 8; i++) begin
            if (i == 1) begin
                stage6_next_real[i] = stage5_r_real[4];
                stage6_next_imag[i] = stage5_r_imag[4];
            end else if (i == 4) begin
                stage6_next_real[i] = stage5_r_real[1];
                stage6_next_imag[i] = stage5_r_imag[1];
            end else if (i == 3) begin
                stage6_next_real[i] = stage5_r_real[6];
                stage6_next_imag[i] = stage5_r_imag[6];
            end else if (i == 6) begin
                stage6_next_real[i] = stage5_r_real[3];
                stage6_next_imag[i] = stage5_r_imag[3];
            end else begin
                stage6_next_real[i] = stage5_r_real[i];
                stage6_next_imag[i] = stage5_r_imag[i];
            end
        end
        stage6_next_valid = stage5_r_valid;
    end

    logic signed [7:0] stage6_r_real[0:7];
    logic signed [7:0] stage6_r_imag[0:7];
    logic stage6_r_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                stage6_r_real[i] <= 8'sd0;
                stage6_r_imag[i] <= 8'sd0;
            end
            stage6_r_valid <= 1'b0;
        end else begin
            for (int i = 0; i < 8; i++) begin
                stage6_r_real[i] <= stage6_next_real[i];
                stage6_r_imag[i] <= stage6_next_imag[i];
            end
            stage6_r_valid <= stage6_next_valid;
        end
    end

    // Output Mapping
    assign io_out_QSV_0_0 = stage6_r_real[0];
    assign io_out_QSV_0_1 = stage6_r_imag[0];
    assign io_out_QSV_1_0 = stage6_r_real[1];
    assign io_out_QSV_1_1 = stage6_r_imag[1];
    assign io_out_QSV_2_0 = stage6_r_real[2];
    assign io_out_QSV_2_1 = stage6_r_imag[2];
    assign io_out_QSV_3_0 = stage6_r_real[3];
    assign io_out_QSV_3_1 = stage6_r_imag[3];
    assign io_out_QSV_4_0 = stage6_r_real[4];
    assign io_out_QSV_4_1 = stage6_r_imag[4];
    assign io_out_QSV_5_0 = stage6_r_real[5];
    assign io_out_QSV_5_1 = stage6_r_imag[5];
    assign io_out_QSV_6_0 = stage6_r_real[6];
    assign io_out_QSV_6_1 = stage6_r_imag[6];
    assign io_out_QSV_7_0 = stage6_r_real[7];
    assign io_out_QSV_7_1 = stage6_r_imag[7];
    assign io_out_valid   = stage6_r_valid;

endmodule
