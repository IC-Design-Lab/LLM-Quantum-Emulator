module Circuit_05 (
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

    // Fixed-point multiplication helper for 1/sqrt(2)
    function automatic logic [15:0] scale_inv_sqrt2(input logic signed [16:0] val);
        logic signed [34:0] temp;
        logic signed [34:0] shifted;
        temp = val * 18'sd23170;
        shifted = temp >>> 15;
        return shifted[15:0];
    endfunction

    // ==========================================
    // Stage 0: H on q0. Pairs are (0, 1) and (2, 3)
    // ==========================================
    logic signed [16:0] s0_sum_0_0, s0_diff_0_0;
    logic signed [16:0] s0_sum_0_1, s0_diff_0_1;
    logic signed [16:0] s0_sum_2_0, s0_diff_2_0;
    logic signed [16:0] s0_sum_2_1, s0_diff_2_1;

    assign s0_sum_0_0  = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    assign s0_diff_0_0 = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    assign s0_sum_0_1  = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    assign s0_diff_0_1 = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    assign s0_sum_2_0  = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    assign s0_diff_2_0 = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    assign s0_sum_2_1  = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    assign s0_diff_2_1 = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    logic [15:0] r0_QSV_0_0, r0_QSV_0_1, r0_QSV_1_0, r0_QSV_1_1;
    logic [15:0] r0_QSV_2_0, r0_QSV_2_1, r0_QSV_3_0, r0_QSV_3_1;
    logic r0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_QSV_0_0 <= '0; r0_QSV_0_1 <= '0; r0_QSV_1_0 <= '0; r0_QSV_1_1 <= '0;
            r0_QSV_2_0 <= '0; r0_QSV_2_1 <= '0; r0_QSV_3_0 <= '0; r0_QSV_3_1 <= '0;
            r0_valid   <= 1'b0;
        end else begin
            r0_valid <= io_in_valid;
            if (io_in_valid) begin
                r0_QSV_0_0 <= scale_inv_sqrt2(s0_sum_0_0);
                r0_QSV_0_1 <= scale_inv_sqrt2(s0_sum_0_1);
                r0_QSV_1_0 <= scale_inv_sqrt2(s0_diff_0_0);
                r0_QSV_1_1 <= scale_inv_sqrt2(s0_diff_0_1);
                
                r0_QSV_2_0 <= scale_inv_sqrt2(s0_sum_2_0);
                r0_QSV_2_1 <= scale_inv_sqrt2(s0_sum_2_1);
                r0_QSV_3_0 <= scale_inv_sqrt2(s0_diff_2_0);
                r0_QSV_3_1 <= scale_inv_sqrt2(s0_diff_2_1);
            end
        end
    end

    // ==========================================
    // Stage 1: X on q1. Swaps (0 <-> 2) and (1 <-> 3)
    // ==========================================
    logic [15:0] r1_QSV_0_0, r1_QSV_0_1, r1_QSV_1_0, r1_QSV_1_1;
    logic [15:0] r1_QSV_2_0, r1_QSV_2_1, r1_QSV_3_0, r1_QSV_3_1;
    logic r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_QSV_0_0 <= '0; r1_QSV_0_1 <= '0; r1_QSV_1_0 <= '0; r1_QSV_1_1 <= '0;
            r1_QSV_2_0 <= '0; r1_QSV_2_1 <= '0; r1_QSV_3_0 <= '0; r1_QSV_3_1 <= '0;
            r1_valid   <= 1'b0;
        end else begin
            r1_valid <= r0_valid;
            if (r0_valid) begin
                r1_QSV_0_0 <= r0_QSV_2_0;
                r1_QSV_0_1 <= r0_QSV_2_1;
                r1_QSV_1_0 <= r0_QSV_3_0;
                r1_QSV_1_1 <= r0_QSV_3_1;
                
                r1_QSV_2_0 <= r0_QSV_0_0;
                r1_QSV_2_1 <= r0_QSV_0_1;
                r1_QSV_3_0 <= r0_QSV_1_0;
                r1_QSV_3_1 <= r0_QSV_1_1;
            end
        end
    end

    // ==========================================
    // Stage 2: SXdg on q1. Pairs are (0, 2) and (1, 3)
    // ==========================================
    logic signed [17:0] s2_num_0_0, s2_num_0_1, s2_num_2_0, s2_num_2_1;
    logic signed [17:0] s2_num_1_0, s2_num_1_1, s2_num_3_0, s2_num_3_1;

    // Pair (0, 2):
    assign s2_num_0_0 = $signed(r1_QSV_0_0) + $signed(r1_QSV_2_0) + $signed(r1_QSV_0_1) - $signed(r1_QSV_2_1);
    assign s2_num_0_1 = $signed(r1_QSV_0_1) + $signed(r1_QSV_2_1) - $signed(r1_QSV_0_0) + $signed(r1_QSV_2_0);
    assign s2_num_2_0 = $signed(r1_QSV_0_0) + $signed(r1_QSV_2_0) - $signed(r1_QSV_0_1) + $signed(r1_QSV_2_1);
    assign s2_num_2_1 = $signed(r1_QSV_0_1) + $signed(r1_QSV_2_1) + $signed(r1_QSV_0_0) - $signed(r1_QSV_2_0);

    // Pair (1, 3):
    assign s2_num_1_0 = $signed(r1_QSV_1_0) + $signed(r1_QSV_3_0) + $signed(r1_QSV_1_1) - $signed(r1_QSV_3_1);
    assign s2_num_1_1 = $signed(r1_QSV_1_1) + $signed(r1_QSV_3_1) - $signed(r1_QSV_1_0) + $signed(r1_QSV_3_0);
    assign s2_num_3_0 = $signed(r1_QSV_1_0) + $signed(r1_QSV_3_0) - $signed(r1_QSV_1_1) + $signed(r1_QSV_3_1);
    assign s2_num_3_1 = $signed(r1_QSV_1_1) + $signed(r1_QSV_3_1) + $signed(r1_QSV_1_0) - $signed(r1_QSV_3_0);

    logic [15:0] r2_QSV_0_0, r2_QSV_0_1, r2_QSV_1_0, r2_QSV_1_1;
    logic [15:0] r2_QSV_2_0, r2_QSV_2_1, r2_QSV_3_0, r2_QSV_3_1;
    logic r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_QSV_0_0 <= '0; r2_QSV_0_1 <= '0; r2_QSV_1_0 <= '0; r2_QSV_1_1 <= '0;
            r2_QSV_2_0 <= '0; r2_QSV_2_1 <= '0; r2_QSV_3_0 <= '0; r2_QSV_3_1 <= '0;
            r2_valid   <= 1'b0;
        end else begin
            r2_valid <= r1_valid;
            if (r1_valid) begin
                r2_QSV_0_0 <= s2_num_0_0 >>> 1;
                r2_QSV_0_1 <= s2_num_0_1 >>> 1;
                r2_QSV_1_0 <= s2_num_1_0 >>> 1;
                r2_QSV_1_1 <= s2_num_1_1 >>> 1;
                
                r2_QSV_2_0 <= s2_num_2_0 >>> 1;
                r2_QSV_2_1 <= s2_num_2_1 >>> 1;
                r2_QSV_3_0 <= s2_num_3_0 >>> 1;
                r2_QSV_3_1 <= s2_num_3_1 >>> 1;
            end
        end
    end

    // ==========================================
    // Stage 3: SWAP on q0 and q1. Swaps (1 <-> 2)
    // ==========================================
    logic [15:0] r3_QSV_0_0, r3_QSV_0_1, r3_QSV_1_0, r3_QSV_1_1;
    logic [15:0] r3_QSV_2_0, r3_QSV_2_1, r3_QSV_3_0, r3_QSV_3_1;
    logic r3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_QSV_0_0 <= '0; r3_QSV_0_1 <= '0; r3_QSV_1_0 <= '0; r3_QSV_1_1 <= '0;
            r3_QSV_2_0 <= '0; r3_QSV_2_1 <= '0; r3_QSV_3_0 <= '0; r3_QSV_3_1 <= '0;
            r3_valid   <= 1'b0;
        end else begin
            r3_valid <= r2_valid;
            if (r2_valid) begin
                r3_QSV_0_0 <= r2_QSV_0_0;
                r3_QSV_0_1 <= r2_QSV_0_1;
                
                r3_QSV_1_0 <= r2_QSV_2_0;
                r3_QSV_1_1 <= r2_QSV_2_1;
                
                r3_QSV_2_0 <= r2_QSV_1_0;
                r3_QSV_2_1 <= r2_QSV_1_1;
                
                r3_QSV_3_0 <= r2_QSV_3_0;
                r3_QSV_3_1 <= r2_QSV_3_1;
            end
        end
    end

    // Output assignments
    assign io_out_QSV_0_0 = r3_QSV_0_0;
    assign io_out_QSV_0_1 = r3_QSV_0_1;
    assign io_out_QSV_1_0 = r3_QSV_1_0;
    assign io_out_QSV_1_1 = r3_QSV_1_1;
    assign io_out_QSV_2_0 = r3_QSV_2_0;
    assign io_out_QSV_2_1 = r3_QSV_2_1;
    assign io_out_QSV_3_0 = r3_QSV_3_0;
    assign io_out_QSV_3_1 = r3_QSV_3_1;
    assign io_out_valid   = r3_valid;

endmodule
