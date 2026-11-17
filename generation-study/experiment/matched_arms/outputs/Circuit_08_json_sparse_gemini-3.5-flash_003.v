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

    // Saturation functions for fixed-point math
    function automatic logic signed [15:0] saturate_34_to_16(logic signed [33:0] val);
        logic signed [18:0] shifted;
        shifted = val >>> 15;
        if (shifted > 19'sd32767) begin
            return 16'sd32767;
        end else if (shifted < -19'sd32768) begin
            return -16'sd32768;
        end else begin
            return shifted[15:0];
        end
    endfunction

    function automatic logic signed [15:0] saturate_18_to_16(logic signed [17:0] val);
        if (val > 18'sd32767) begin
            return 16'sd32767;
        end else if (val < -18'sd32768) begin
            return -16'sd32768;
        end else begin
            return val[15:0];
        end
    endfunction

    // Stage 0: Input Register Stage
    logic signed [15:0] r_in_QSV_0_0, r_in_QSV_0_1;
    logic signed [15:0] r_in_QSV_1_0, r_in_QSV_1_1;
    logic signed [15:0] r_in_QSV_2_0, r_in_QSV_2_1;
    logic signed [15:0] r_in_QSV_3_0, r_in_QSV_3_1;
    logic               r_in_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_in_QSV_0_0 <= '0;
            r_in_QSV_0_1 <= '0;
            r_in_QSV_1_0 <= '0;
            r_in_QSV_1_1 <= '0;
            r_in_QSV_2_0 <= '0;
            r_in_QSV_2_1 <= '0;
            r_in_QSV_3_0 <= '0;
            r_in_QSV_3_1 <= '0;
            r_in_valid   <= 1'b0;
        end else begin
            r_in_QSV_0_0 <= io_in_QSV_0_0;
            r_in_QSV_0_1 <= io_in_QSV_0_1;
            r_in_QSV_1_0 <= io_in_QSV_1_0;
            r_in_QSV_1_1 <= io_in_QSV_1_1;
            r_in_QSV_2_0 <= io_in_QSV_2_0;
            r_in_QSV_2_1 <= io_in_QSV_2_1;
            r_in_QSV_3_0 <= io_in_QSV_3_0;
            r_in_QSV_3_1 <= io_in_QSV_3_1;
            r_in_valid   <= io_in_valid;
        end
    end

    // Stage 1: H on qubit 0 (Pairs (0,1) and (2,3))
    logic signed [16:0] sum_0_1_r_add, sum_0_1_r_sub;
    logic signed [16:0] sum_0_1_i_add, sum_0_1_i_sub;
    logic signed [16:0] sum_2_3_r_add, sum_2_3_r_sub;
    logic signed [16:0] sum_2_3_i_add, sum_2_3_i_sub;

    assign sum_0_1_r_add = 17'(signed'(r_in_QSV_0_0)) + 17'(signed'(r_in_QSV_1_0));
    assign sum_0_1_r_sub = 17'(signed'(r_in_QSV_0_0)) - 17'(signed'(r_in_QSV_1_0));
    assign sum_0_1_i_add = 17'(signed'(r_in_QSV_0_1)) + 17'(signed'(r_in_QSV_1_1));
    assign sum_0_1_i_sub = 17'(signed'(r_in_QSV_0_1)) - 17'(signed'(r_in_QSV_1_1));

    assign sum_2_3_r_add = 17'(signed'(r_in_QSV_2_0)) + 17'(signed'(r_in_QSV_3_0));
    assign sum_2_3_r_sub = 17'(signed'(r_in_QSV_2_0)) - 17'(signed'(r_in_QSV_3_0));
    assign sum_2_3_i_add = 17'(signed'(r_in_QSV_2_1)) + 17'(signed'(r_in_QSV_3_1));
    assign sum_2_3_i_sub = 17'(signed'(r_in_QSV_2_1)) - 17'(signed'(r_in_QSV_3_1));

    logic signed [33:0] prod_0_1_r_add, prod_0_1_r_sub;
    logic signed [33:0] prod_0_1_i_add, prod_0_1_i_sub;
    logic signed [33:0] prod_2_3_r_add, prod_2_3_r_sub;
    logic signed [33:0] prod_2_3_i_add, prod_2_3_i_sub;

    // 1/sqrt(2) is represented as 23170 in signed Q0.15 format
    assign prod_0_1_r_add = sum_0_1_r_add * 17'sd23170;
    assign prod_0_1_r_sub = sum_0_1_r_sub * 17'sd23170;
    assign prod_0_1_i_add = sum_0_1_i_add * 17'sd23170;
    assign prod_0_1_i_sub = sum_0_1_i_sub * 17'sd23170;

    assign prod_2_3_r_add = sum_2_3_r_add * 17'sd23170;
    assign prod_2_3_r_sub = sum_2_3_r_sub * 17'sd23170;
    assign prod_2_3_i_add = sum_2_3_i_add * 17'sd23170;
    assign prod_2_3_i_sub = sum_2_3_i_sub * 17'sd23170;

    logic signed [15:0] r_s1_QSV_0_0, r_s1_QSV_0_1;
    logic signed [15:0] r_s1_QSV_1_0, r_s1_QSV_1_1;
    logic signed [15:0] r_s1_QSV_2_0, r_s1_QSV_2_1;
    logic signed [15:0] r_s1_QSV_3_0, r_s1_QSV_3_1;
    logic               r_s1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_s1_QSV_0_0 <= '0;
            r_s1_QSV_0_1 <= '0;
            r_s1_QSV_1_0 <= '0;
            r_s1_QSV_1_1 <= '0;
            r_s1_QSV_2_0 <= '0;
            r_s1_QSV_2_1 <= '0;
            r_s1_QSV_3_0 <= '0;
            r_s1_QSV_3_1 <= '0;
            r_s1_valid   <= 1'b0;
        end else begin
            r_s1_QSV_0_0 <= saturate_34_to_16(prod_0_1_r_add);
            r_s1_QSV_0_1 <= saturate_34_to_16(prod_0_1_i_add);
            r_s1_QSV_1_0 <= saturate_34_to_16(prod_0_1_r_sub);
            r_s1_QSV_1_1 <= saturate_34_to_16(prod_0_1_i_sub);
            
            r_s1_QSV_2_0 <= saturate_34_to_16(prod_2_3_r_add);
            r_s1_QSV_2_1 <= saturate_34_to_16(prod_2_3_i_add);
            r_s1_QSV_3_0 <= saturate_34_to_16(prod_2_3_r_sub);
            r_s1_QSV_3_1 <= saturate_34_to_16(prod_2_3_i_sub);
            
            r_s1_valid   <= r_in_valid;
        end
    end

    // Stage 2: CX on control 0, target 1 (Swaps states 1 and 3)
    logic signed [15:0] r_s2_QSV_0_0, r_s2_QSV_0_1;
    logic signed [15:0] r_s2_QSV_1_0, r_s2_QSV_1_1;
    logic signed [15:0] r_s2_QSV_2_0, r_s2_QSV_2_1;
    logic signed [15:0] r_s2_QSV_3_0, r_s2_QSV_3_1;
    logic               r_s2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_s2_QSV_0_0 <= '0;
            r_s2_QSV_0_1 <= '0;
            r_s2_QSV_1_0 <= '0;
            r_s2_QSV_1_1 <= '0;
            r_s2_QSV_2_0 <= '0;
            r_s2_QSV_2_1 <= '0;
            r_s2_QSV_3_0 <= '0;
            r_s2_QSV_3_1 <= '0;
            r_s2_valid   <= 1'b0;
        end else begin
            r_s2_QSV_0_0 <= r_s1_QSV_0_0;
            r_s2_QSV_0_1 <= r_s1_QSV_0_1;
            r_s2_QSV_1_0 <= r_s1_QSV_3_0;
            r_s2_QSV_1_1 <= r_s1_QSV_3_1;
            r_s2_QSV_2_0 <= r_s1_QSV_2_0;
            r_s2_QSV_2_1 <= r_s1_QSV_2_1;
            r_s2_QSV_3_0 <= r_s1_QSV_1_0;
            r_s2_QSV_3_1 <= r_s1_QSV_1_1;
            
            r_s2_valid   <= r_s1_valid;
        end
    end

    // Stage 3: SX on qubit 0 (Pairs (0,1) and (2,3))
    // We sign extend the 16-bit states to 18-bit signed to handle intermediate additions
    logic signed [17:0] s2_0_0, s2_0_1, s2_1_0, s2_1_1;
    assign s2_0_0 = 18'(signed'(r_s2_QSV_0_0));
    assign s2_0_1 = 18'(signed'(r_s2_QSV_0_1));
    assign s2_1_0 = 18'(signed'(r_s2_QSV_1_0));
    assign s2_1_1 = 18'(signed'(r_s2_QSV_1_1));

    logic signed [17:0] s2_2_0, s2_2_1, s2_3_0, s2_3_1;
    assign s2_2_0 = 18'(signed'(r_s2_QSV_2_0));
    assign s2_2_1 = 18'(signed'(r_s2_QSV_2_1));
    assign s2_3_0 = 18'(signed'(r_s2_QSV_3_0));
    assign s2_3_1 = 18'(signed'(r_s2_QSV_3_1));

    // Formulas for SX on pair (0,1)
    logic signed [17:0] sum_0_1_a_r;
    logic signed [17:0] sum_0_1_a_i;
    logic signed [17:0] sum_0_1_b_r;
    logic signed [17:0] sum_0_1_b_i;

    assign sum_0_1_a_r = s2_0_0 - s2_0_1 + s2_1_0 + s2_1_1;
    assign sum_0_1_a_i = s2_0_0 + s2_0_1 - s2_1_0 + s2_1_1;
    assign sum_0_1_b_r = s2_0_0 + s2_0_1 + s2_1_0 - s2_1_1;
    assign sum_0_1_b_i = -s2_0_0 + s2_0_1 + s2_1_0 + s2_1_1;

    // Formulas for SX on pair (2,3)
    logic signed [17:0] sum_2_3_a_r;
    logic signed [17:0] sum_2_3_a_i;
    logic signed [17:0] sum_2_3_b_r;
    logic signed [17:0] sum_2_3_b_i;

    assign sum_2_3_a_r = s2_2_0 - s2_2_1 + s2_3_0 + s2_3_1;
    assign sum_2_3_a_i = s2_2_0 + s2_2_1 - s2_3_0 + s2_3_1;
    assign sum_2_3_b_r = s2_2_0 + s2_2_1 + s2_3_0 - s2_3_1;
    assign sum_2_3_b_i = -s2_2_0 + s2_2_1 + s2_3_0 + s2_3_1;

    logic signed [15:0] r_s3_QSV_0_0, r_s3_QSV_0_1;
    logic signed [15:0] r_s3_QSV_1_0, r_s3_QSV_1_1;
    logic signed [15:0] r_s3_QSV_2_0, r_s3_QSV_2_1;
    logic signed [15:0] r_s3_QSV_3_0, r_s3_QSV_3_1;
    logic               r_s3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_s3_QSV_0_0 <= '0;
            r_s3_QSV_0_1 <= '0;
            r_s3_QSV_1_0 <= '0;
            r_s3_QSV_1_1 <= '0;
            r_s3_QSV_2_0 <= '0;
            r_s3_QSV_2_1 <= '0;
            r_s3_QSV_3_0 <= '0;
            r_s3_QSV_3_1 <= '0;
            r_s3_valid   <= 1'b0;
        end else begin
            r_s3_QSV_0_0 <= saturate_18_to_16(sum_0_1_a_r >>> 1);
            r_s3_QSV_0_1 <= saturate_18_to_16(sum_0_1_a_i >>> 1);
            r_s3_QSV_1_0 <= saturate_18_to_16(sum_0_1_b_r >>> 1);
            r_s3_QSV_1_1 <= saturate_18_to_16(sum_0_1_b_i >>> 1);
            
            r_s3_QSV_2_0 <= saturate_18_to_16(sum_2_3_a_r >>> 1);
            r_s3_QSV_2_1 <= saturate_18_to_16(sum_2_3_a_i >>> 1);
            r_s3_QSV_3_0 <= saturate_18_to_16(sum_2_3_b_r >>> 1);
            r_s3_QSV_3_1 <= saturate_18_to_16(sum_2_3_b_i >>> 1);
            
            r_s3_valid   <= r_s2_valid;
        end
    end

    // Direct assignment to Outputs
    assign io_out_QSV_0_0 = r_s3_QSV_0_0;
    assign io_out_QSV_0_1 = r_s3_QSV_0_1;
    assign io_out_QSV_1_0 = r_s3_QSV_1_0;
    assign io_out_QSV_1_1 = r_s3_QSV_1_1;
    assign io_out_QSV_2_0 = r_s3_QSV_2_0;
    assign io_out_QSV_2_1 = r_s3_QSV_2_1;
    assign io_out_QSV_3_0 = r_s3_QSV_3_0;
    assign io_out_QSV_3_1 = r_s3_QSV_3_1;
    assign io_out_valid   = r_s3_valid;

endmodule
