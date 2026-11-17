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

    // Scaling function for Hadamard gates in Q2.14 fixed-point format
    function automatic logic [15:0] scale_h(input logic [15:0] a, input logic [15:0] b, input logic sub);
        logic signed [17:0] sum_diff;
        logic signed [33:0] product;
        begin
            if (sub)
                sum_diff = $signed(a) - $signed(b);
            else
                sum_diff = $signed(a) + $signed(b);
            product = sum_diff * 18'sd11585; // 11585 is 1/sqrt(2) in Q14
            scale_h = logic [15:0]'(product >>> 14);
        end
    endfunction

    // Stage 0: Input Registers
    logic [15:0] reg_0_QSV_0_0, reg_0_QSV_0_1;
    logic [15:0] reg_0_QSV_1_0, reg_0_QSV_1_1;
    logic [15:0] reg_0_QSV_2_0, reg_0_QSV_2_1;
    logic [15:0] reg_0_QSV_3_0, reg_0_QSV_3_1;
    logic        reg_0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_0_QSV_0_0 <= 16'h0;
            reg_0_QSV_0_1 <= 16'h0;
            reg_0_QSV_1_0 <= 16'h0;
            reg_0_QSV_1_1 <= 16'h0;
            reg_0_QSV_2_0 <= 16'h0;
            reg_0_QSV_2_1 <= 16'h0;
            reg_0_QSV_3_0 <= 16'h0;
            reg_0_QSV_3_1 <= 16'h0;
            reg_0_valid   <= 1'b0;
        end else begin
            reg_0_QSV_0_0 <= io_in_QSV_0_0;
            reg_0_QSV_0_1 <= io_in_QSV_0_1;
            reg_0_QSV_1_0 <= io_in_QSV_1_0;
            reg_0_QSV_1_1 <= io_in_QSV_1_1;
            reg_0_QSV_2_0 <= io_in_QSV_2_0;
            reg_0_QSV_2_1 <= io_in_QSV_2_1;
            reg_0_QSV_3_0 <= io_in_QSV_3_0;
            reg_0_QSV_3_1 <= io_in_QSV_3_1;
            reg_0_valid   <= io_in_valid;
        end
    end

    // Stage 1: H(0) Gate
    logic [15:0] reg_1_QSV_0_0, reg_1_QSV_0_1;
    logic [15:0] reg_1_QSV_1_0, reg_1_QSV_1_1;
    logic [15:0] reg_1_QSV_2_0, reg_1_QSV_2_1;
    logic [15:0] reg_1_QSV_3_0, reg_1_QSV_3_1;
    logic        reg_1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_1_QSV_0_0 <= 16'h0;
            reg_1_QSV_0_1 <= 16'h0;
            reg_1_QSV_1_0 <= 16'h0;
            reg_1_QSV_1_1 <= 16'h0;
            reg_1_QSV_2_0 <= 16'h0;
            reg_1_QSV_2_1 <= 16'h0;
            reg_1_QSV_3_0 <= 16'h0;
            reg_1_QSV_3_1 <= 16'h0;
            reg_1_valid   <= 1'b0;
        end else begin
            reg_1_QSV_0_0 <= scale_h(reg_0_QSV_0_0, reg_0_QSV_1_0, 1'b0);
            reg_1_QSV_0_1 <= scale_h(reg_0_QSV_0_1, reg_0_QSV_1_1, 1'b0);
            reg_1_QSV_1_0 <= scale_h(reg_0_QSV_0_0, reg_0_QSV_1_0, 1'b1);
            reg_1_QSV_1_1 <= scale_h(reg_0_QSV_0_1, reg_0_QSV_1_1, 1'b1);
            reg_1_QSV_2_0 <= scale_h(reg_0_QSV_2_0, reg_0_QSV_3_0, 1'b0);
            reg_1_QSV_2_1 <= scale_h(reg_0_QSV_2_1, reg_0_QSV_3_1, 1'b0);
            reg_1_QSV_3_0 <= scale_h(reg_0_QSV_2_0, reg_0_QSV_3_0, 1'b1);
            reg_1_QSV_3_1 <= scale_h(reg_0_QSV_2_1, reg_0_QSV_3_1, 1'b1);
            reg_1_valid   <= reg_0_valid;
        end
    end

    // Stage 2: X(1) Gate (Permutes states: 0<->2, 1<->3)
    logic [15:0] reg_2_QSV_0_0, reg_2_QSV_0_1;
    logic [15:0] reg_2_QSV_1_0, reg_2_QSV_1_1;
    logic [15:0] reg_2_QSV_2_0, reg_2_QSV_2_1;
    logic [15:0] reg_2_QSV_3_0, reg_2_QSV_3_1;
    logic        reg_2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_2_QSV_0_0 <= 16'h0;
            reg_2_QSV_0_1 <= 16'h0;
            reg_2_QSV_1_0 <= 16'h0;
            reg_2_QSV_1_1 <= 16'h0;
            reg_2_QSV_2_0 <= 16'h0;
            reg_2_QSV_2_1 <= 16'h0;
            reg_2_QSV_3_0 <= 16'h0;
            reg_2_QSV_3_1 <= 16'h0;
            reg_2_valid   <= 1'b0;
        end else begin
            reg_2_QSV_0_0 <= reg_1_QSV_2_0;
            reg_2_QSV_0_1 <= reg_1_QSV_2_1;
            reg_2_QSV_1_0 <= reg_1_QSV_3_0;
            reg_2_QSV_1_1 <= reg_1_QSV_3_1;
            reg_2_QSV_2_0 <= reg_1_QSV_0_0;
            reg_2_QSV_2_1 <= reg_1_QSV_0_1;
            reg_2_QSV_3_0 <= reg_1_QSV_1_0;
            reg_2_QSV_3_1 <= reg_1_QSV_1_1;
            reg_2_valid   <= reg_1_valid;
        end
    end

    // Stage 3: H(1) Gate (Acts on pairs (0,2) and (1,3))
    logic [15:0] reg_3_QSV_0_0, reg_3_QSV_0_1;
    logic [15:0] reg_3_QSV_1_0, reg_3_QSV_1_1;
    logic [15:0] reg_3_QSV_2_0, reg_3_QSV_2_1;
    logic [15:0] reg_3_QSV_3_0, reg_3_QSV_3_1;
    logic        reg_3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_3_QSV_0_0 <= 16'h0;
            reg_3_QSV_0_1 <= 16'h0;
            reg_3_QSV_1_0 <= 16'h0;
            reg_3_QSV_1_1 <= 16'h0;
            reg_3_QSV_2_0 <= 16'h0;
            reg_3_QSV_2_1 <= 16'h0;
            reg_3_QSV_3_0 <= 16'h0;
            reg_3_QSV_3_1 <= 16'h0;
            reg_3_valid   <= 1'b0;
        end else begin
            reg_3_QSV_0_0 <= scale_h(reg_2_QSV_0_0, reg_2_QSV_2_0, 1'b0);
            reg_3_QSV_0_1 <= scale_h(reg_2_QSV_0_1, reg_2_QSV_2_1, 1'b0);
            reg_3_QSV_1_0 <= scale_h(reg_2_QSV_1_0, reg_2_QSV_3_0, 1'b0);
            reg_3_QSV_1_1 <= scale_h(reg_2_QSV_1_1, reg_2_QSV_3_1, 1'b0);
            reg_3_QSV_2_0 <= scale_h(reg_2_QSV_0_0, reg_2_QSV_2_0, 1'b1);
            reg_3_QSV_2_1 <= scale_h(reg_2_QSV_0_1, reg_2_QSV_2_1, 1'b1);
            reg_3_QSV_3_0 <= scale_h(reg_2_QSV_1_0, reg_2_QSV_3_0, 1'b1);
            reg_3_QSV_3_1 <= scale_h(reg_2_QSV_1_1, reg_2_QSV_3_1, 1'b1);
            reg_3_valid   <= reg_2_valid;
        end
    end

    // Stage 4: SWAP(0, 1) Gate (Permutes states: 1<->2)
    logic [15:0] reg_4_QSV_0_0, reg_4_QSV_0_1;
    logic [15:0] reg_4_QSV_1_0, reg_4_QSV_1_1;
    logic [15:0] reg_4_QSV_2_0, reg_4_QSV_2_1;
    logic [15:0] reg_4_QSV_3_0, reg_4_QSV_3_1;
    logic        reg_4_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_4_QSV_0_0 <= 16'h0;
            reg_4_QSV_0_1 <= 16'h0;
            reg_4_QSV_1_0 <= 16'h0;
            reg_4_QSV_1_1 <= 16'h0;
            reg_4_QSV_2_0 <= 16'h0;
            reg_4_QSV_2_1 <= 16'h0;
            reg_4_QSV_3_0 <= 16'h0;
            reg_4_QSV_3_1 <= 16'h0;
            reg_4_valid   <= 1'b0;
        end else begin
            reg_4_QSV_0_0 <= reg_3_QSV_0_0;
            reg_4_QSV_0_1 <= reg_3_QSV_0_1;
            reg_4_QSV_1_0 <= reg_3_QSV_2_0;
            reg_4_QSV_1_1 <= reg_3_QSV_2_1;
            reg_4_QSV_2_0 <= reg_3_QSV_1_0;
            reg_4_QSV_2_1 <= reg_3_QSV_1_1;
            reg_4_QSV_3_0 <= reg_3_QSV_3_0;
            reg_4_QSV_3_1 <= reg_3_QSV_3_1;
            reg_4_valid   <= reg_3_valid;
        end
    end

    // Output assignments
    assign io_out_QSV_0_0 = reg_4_QSV_0_0;
    assign io_out_QSV_0_1 = reg_4_QSV_0_1;
    assign io_out_QSV_1_0 = reg_4_QSV_1_0;
    assign io_out_QSV_1_1 = reg_4_QSV_1_1;
    assign io_out_QSV_2_0 = reg_4_QSV_2_0;
    assign io_out_QSV_2_1 = reg_4_QSV_2_1;
    assign io_out_QSV_3_0 = reg_4_QSV_3_0;
    assign io_out_QSV_3_1 = reg_4_QSV_3_1;
    assign io_out_valid   = reg_4_valid;

endmodule
