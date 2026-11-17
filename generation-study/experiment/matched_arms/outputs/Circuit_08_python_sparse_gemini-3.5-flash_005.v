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

    // Internal signed representations
    logic signed [15:0] r0_R [4];
    logic signed [15:0] r0_I [4];
    logic r0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_valid <= 1'b0;
            r0_R[0] <= 16'sh0; r0_I[0] <= 16'sh0;
            r0_R[1] <= 16'sh0; r0_I[1] <= 16'sh0;
            r0_R[2] <= 16'sh0; r0_I[2] <= 16'sh0;
            r0_R[3] <= 16'sh0; r0_I[3] <= 16'sh0;
        end else begin
            r0_valid <= io_in_valid;
            if (io_in_valid) begin
                r0_R[0] <= io_in_QSV_0_0; r0_I[0] <= io_in_QSV_0_1;
                r0_R[1] <= io_in_QSV_1_0; r0_I[1] <= io_in_QSV_1_1;
                r0_R[2] <= io_in_QSV_2_0; r0_I[2] <= io_in_QSV_2_1;
                r0_R[3] <= io_in_QSV_3_0; r0_I[3] <= io_in_QSV_3_1;
            end
        end
    end

    // H helper function (scaled multiplication by 1/sqrt(2) approx 23170/32768)
    function automatic logic signed [15:0] scale_h(logic signed [16:0] sum);
        logic signed [32:0] product;
        logic signed [17:0] shifted;
        product = sum * 16'sd23170;
        shifted = product >>> 15;
        if (shifted > 18'sd32767)
            return 16'sd32767;
        else if (shifted < -18'sd32768)
            return -16'sd32768;
        else
            return shifted[15:0];
    endfunction

    // Stage 1: H(0)
    logic signed [15:0] r1_R [4];
    logic signed [15:0] r1_I [4];
    logic r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_valid <= 1'b0;
            r1_R[0] <= 16'sh0; r1_I[0] <= 16'sh0;
            r1_R[1] <= 16'sh0; r1_I[1] <= 16'sh0;
            r1_R[2] <= 16'sh0; r1_I[2] <= 16'sh0;
            r1_R[3] <= 16'sh0; r1_I[3] <= 16'sh0;
        end else begin
            r1_valid <= r0_valid;
            if (r0_valid) begin
                r1_R[0] <= scale_h(r0_R[0] + r0_R[1]);
                r1_I[0] <= scale_h(r0_I[0] + r0_I[1]);
                r1_R[1] <= scale_h(r0_R[0] - r0_R[1]);
                r1_I[1] <= scale_h(r0_I[0] - r0_I[1]);
                
                r1_R[2] <= scale_h(r0_R[2] + r0_R[3]);
                r1_I[2] <= scale_h(r0_I[2] + r0_I[3]);
                r1_R[3] <= scale_h(r0_R[2] - r0_R[3]);
                r1_I[3] <= scale_h(r0_I[2] - r0_I[3]);
            end
        end
    end

    // Stage 2: CX(0,1) permutation + SX(0) arithmetic
    logic signed [15:0] cx_R [4];
    logic signed [15:0] cx_I [4];

    always_comb begin
        cx_R[0] = r1_R[0]; cx_I[0] = r1_I[0];
        cx_R[1] = r1_R[3]; cx_I[1] = r1_I[3]; // CX(0,1) swaps state 1 and 3
        cx_R[2] = r1_R[2]; cx_I[2] = r1_I[2];
        cx_R[3] = r1_R[1]; cx_I[3] = r1_I[1];
    end

    logic signed [18:0] sum_R_A0, sum_I_A0, sum_R_B0, sum_I_B0;
    logic signed [18:0] sum_R_A1, sum_I_A1, sum_R_B1, sum_I_B1;

    always_comb begin
        // Pair 0 (states 0 and 1)
        sum_R_A0 = (19'(cx_R[0]) - 19'(cx_I[0])) + (19'(cx_R[1]) + 19'(cx_I[1]));
        sum_I_A0 = (19'(cx_R[0]) + 19'(cx_I[0])) - (19'(cx_R[1]) - 19'(cx_I[1]));
        sum_R_B0 = (19'(cx_R[0]) + 19'(cx_I[0])) + (19'(cx_R[1]) - 19'(cx_I[1]));
        sum_I_B0 = (-19'(cx_R[0]) + 19'(cx_I[0])) + (19'(cx_R[1]) + 19'(cx_I[1]));

        // Pair 1 (states 2 and 3)
        sum_R_A1 = (19'(cx_R[2]) - 19'(cx_I[2])) + (19'(cx_R[3]) + 19'(cx_I[3]));
        sum_I_A1 = (19'(cx_R[2]) + 19'(cx_I[2])) - (19'(cx_R[3]) - 19'(cx_I[3]));
        sum_R_B1 = (19'(cx_R[2]) + 19'(cx_I[2])) + (19'(cx_R[3]) - 19'(cx_I[3]));
        sum_I_B1 = (-19'(cx_R[2]) + 19'(cx_I[2])) + (19'(cx_R[3]) + 19'(cx_I[3]));
    end

    // SX helper function (scaled division by 2 with saturation)
    function automatic logic signed [15:0] scale_sx(logic signed [18:0] sum);
        logic signed [17:0] shifted;
        shifted = sum >>> 1;
        if (shifted > 18'sd32767)
            return 16'sd32767;
        else if (shifted < -18'sd32768)
            return -16'sd32768;
        else
            return shifted[15:0];
    endfunction

    logic signed [15:0] r2_R [4];
    logic signed [15:0] r2_I [4];
    logic r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_valid <= 1'b0;
            r2_R[0] <= 16'sh0; r2_I[0] <= 16'sh0;
            r2_R[1] <= 16'sh0; r2_I[1] <= 16'sh0;
            r2_R[2] <= 16'sh0; r2_I[2] <= 16'sh0;
            r2_R[3] <= 16'sh0; r2_I[3] <= 16'sh0;
        end else begin
            r2_valid <= r1_valid;
            if (r1_valid) begin
                r2_R[0] <= scale_sx(sum_R_A0);
                r2_I[0] <= scale_sx(sum_I_A0);
                r2_R[1] <= scale_sx(sum_R_B0);
                r2_I[1] <= scale_sx(sum_I_B0);
                
                r2_R[2] <= scale_sx(sum_R_A1);
                r2_I[2] <= scale_sx(sum_I_A1);
                r2_R[3] <= scale_sx(sum_R_B1);
                r2_I[3] <= scale_sx(sum_I_B1);
            end
        end
    end

    assign io_out_QSV_0_0 = r2_R[0];
    assign io_out_QSV_0_1 = r2_I[0];
    assign io_out_QSV_1_0 = r2_R[1];
    assign io_out_QSV_1_1 = r2_I[1];
    assign io_out_QSV_2_0 = r2_R[2];
    assign io_out_QSV_2_1 = r2_I[2];
    assign io_out_QSV_3_0 = r2_R[3];
    assign io_out_QSV_3_1 = r2_I[3];
    assign io_out_valid   = r2_valid;

endmodule
