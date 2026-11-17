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

    // Q1.15 Fixed-point Multiplication by 1/sqrt(2) approx 0.7071 (23170 / 32768)
    function automatic logic signed [15:0] q_mul(logic signed [15:0] a);
        logic signed [31:0] prod;
        prod = a * 16'sd23170;
        return prod[30:15];
    endfunction

    // Stage 0: Step 0 (H on Qubit 0)
    logic signed [15:0] s0_add_0_r, s0_sub_0_r, s0_add_0_i, s0_sub_0_i;
    logic signed [15:0] s0_add_1_r, s0_sub_1_r, s0_add_1_i, s0_sub_1_i;

    assign s0_add_0_r = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    assign s0_sub_0_r = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    assign s0_add_0_i = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    assign s0_sub_0_i = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    assign s0_add_1_r = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    assign s0_sub_1_r = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    assign s0_add_1_i = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    assign s0_sub_1_i = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    logic        stage0_valid;
    logic [15:0] stage0_QSV_0_0, stage0_QSV_0_1;
    logic [15:0] stage0_QSV_1_0, stage0_QSV_1_1;
    logic [15:0] stage0_QSV_2_0, stage0_QSV_2_1;
    logic [15:0] stage0_QSV_3_0, stage0_QSV_3_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage0_valid   <= 1'b0;
            stage0_QSV_0_0 <= '0; stage0_QSV_0_1 <= '0;
            stage0_QSV_1_0 <= '0; stage0_QSV_1_1 <= '0;
            stage0_QSV_2_0 <= '0; stage0_QSV_2_1 <= '0;
            stage0_QSV_3_0 <= '0; stage0_QSV_3_1 <= '0;
        end else begin
            stage0_valid   <= io_in_valid;
            stage0_QSV_0_0 <= q_mul(s0_add_0_r);
            stage0_QSV_0_1 <= q_mul(s0_add_0_i);
            stage0_QSV_1_0 <= q_mul(s0_sub_0_r);
            stage0_QSV_1_1 <= q_mul(s0_sub_0_i);
            stage0_QSV_2_0 <= q_mul(s0_add_1_r);
            stage0_QSV_2_1 <= q_mul(s0_add_1_i);
            stage0_QSV_3_0 <= q_mul(s0_sub_1_r);
            stage0_QSV_3_1 <= q_mul(s0_sub_1_i);
        end
    end

    // Stage 1: Step 1 (X on Qubit 1) -> Swap (0,2) and (1,3)
    logic        stage1_valid;
    logic [15:0] stage1_QSV_0_0, stage1_QSV_0_1;
    logic [15:0] stage1_QSV_1_0, stage1_QSV_1_1;
    logic [15:0] stage1_QSV_2_0, stage1_QSV_2_1;
    logic [15:0] stage1_QSV_3_0, stage1_QSV_3_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage1_valid   <= 1'b0;
            stage1_QSV_0_0 <= '0; stage1_QSV_0_1 <= '0;
            stage1_QSV_1_0 <= '0; stage1_QSV_1_1 <= '0;
            stage1_QSV_2_0 <= '0; stage1_QSV_2_1 <= '0;
            stage1_QSV_3_0 <= '0; stage1_QSV_3_1 <= '0;
        end else begin
            stage1_valid   <= stage0_valid;
            stage1_QSV_0_0 <= stage0_QSV_2_0;
            stage1_QSV_0_1 <= stage0_QSV_2_1;
            stage1_QSV_1_0 <= stage0_QSV_3_0;
            stage1_QSV_1_1 <= stage0_QSV_3_1;
            stage1_QSV_2_0 <= stage0_QSV_0_0;
            stage1_QSV_2_1 <= stage0_QSV_0_1;
            stage1_QSV_3_0 <= stage0_QSV_1_0;
            stage1_QSV_3_1 <= stage0_QSV_1_1;
        end
    end

    // Stage 2: Step 2 (H on Qubit 1)
    logic signed [15:0] s2_add_0_r, s2_sub_0_r, s2_add_0_i, s2_sub_0_i;
    logic signed [15:0] s2_add_1_r, s2_sub_1_r, s2_add_1_i, s2_sub_1_i;

    assign s2_add_0_r = $signed(stage1_QSV_0_0) + $signed(stage1_QSV_2_0);
    assign s2_sub_0_r = $signed(stage1_QSV_0_0) - $signed(stage1_QSV_2_0);
    assign s2_add_0_i = $signed(stage1_QSV_0_1) + $signed(stage1_QSV_2_1);
    assign s2_sub_0_i = $signed(stage1_QSV_0_1) - $signed(stage1_QSV_2_1);

    assign s2_add_1_r = $signed(stage1_QSV_1_0) + $signed(stage1_QSV_3_0);
    assign s2_sub_1_r = $signed(stage1_QSV_1_0) - $signed(stage1_QSV_3_0);
    assign s2_add_1_i = $signed(stage1_QSV_1_1) + $signed(stage1_QSV_3_1);
    assign s2_sub_1_i = $signed(stage1_QSV_1_1) - $signed(stage1_QSV_3_1);

    logic        stage2_valid;
    logic [15:0] stage2_QSV_0_0, stage2_QSV_0_1;
    logic [15:0] stage2_QSV_1_0, stage2_QSV_1_1;
    logic [15:0] stage2_QSV_2_0, stage2_QSV_2_1;
    logic [15:0] stage2_QSV_3_0, stage2_QSV_3_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage2_valid   <= 1'b0;
            stage2_QSV_0_0 <= '0; stage2_QSV_0_1 <= '0;
            stage2_QSV_1_0 <= '0; stage2_QSV_1_1 <= '0;
            stage2_QSV_2_0 <= '0; stage2_QSV_2_1 <= '0;
            stage2_QSV_3_0 <= '0; stage2_QSV_3_1 <= '0;
        end else begin
            stage2_valid   <= stage1_valid;
            stage2_QSV_0_0 <= q_mul(s2_add_0_r);
            stage2_QSV_0_1 <= q_mul(s2_add_0_i);
            stage2_QSV_1_0 <= q_mul(s2_add_1_r);
            stage2_QSV_1_1 <= q_mul(s2_add_1_i);
            stage2_QSV_2_0 <= q_mul(s2_sub_0_r);
            stage2_QSV_2_1 <= q_mul(s2_sub_0_i);
            stage2_QSV_3_0 <= q_mul(s2_sub_1_r);
            stage2_QSV_3_1 <= q_mul(s2_sub_1_i);
        end
    end

    // Stage 3: Step 3 (SWAP) -> Swap (1,2)
    logic        stage3_valid;
    logic [15:0] stage3_QSV_0_0, stage3_QSV_0_1;
    logic [15:0] stage3_QSV_1_0, stage3_QSV_1_1;
    logic [15:0] stage3_QSV_2_0, stage3_QSV_2_1;
    logic [15:0] stage3_QSV_3_0, stage3_QSV_3_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            stage3_valid   <= 1'b0;
            stage3_QSV_0_0 <= '0; stage3_QSV_0_1 <= '0;
            stage3_QSV_1_0 <= '0; stage3_QSV_1_1 <= '0;
            stage3_QSV_2_0 <= '0; stage3_QSV_2_1 <= '0;
            stage3_QSV_3_0 <= '0; stage3_QSV_3_1 <= '0;
        end else begin
            stage3_valid   <= stage2_valid;
            stage3_QSV_0_0 <= stage2_QSV_0_0;
            stage3_QSV_0_1 <= stage2_QSV_0_1;
            stage3_QSV_1_0 <= stage2_QSV_2_0;
            stage3_QSV_1_1 <= stage2_QSV_2_1;
            stage3_QSV_2_0 <= stage2_QSV_1_0;
            stage3_QSV_2_1 <= stage2_QSV_1_1;
            stage3_QSV_3_0 <= stage2_QSV_3_0;
            stage3_QSV_3_1 <= stage2_QSV_3_1;
        end
    end

    // Outputs
    assign io_out_valid   = stage3_valid;
    assign io_out_QSV_0_0 = stage3_QSV_0_0;
    assign io_out_QSV_0_1 = stage3_QSV_0_1;
    assign io_out_QSV_1_0 = stage3_QSV_1_0;
    assign io_out_QSV_1_1 = stage3_QSV_1_1;
    assign io_out_QSV_2_0 = stage3_QSV_2_0;
    assign io_out_QSV_2_1 = stage3_QSV_2_1;
    assign io_out_QSV_3_0 = stage3_QSV_3_0;
    assign io_out_QSV_3_1 = stage3_QSV_3_1;

endmodule
