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

    // Step 0: H gate on Qubit 0
    wire signed [16:0] s0_sum_0_1_real  = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    wire signed [16:0] s0_diff_0_1_real = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    wire signed [16:0] s0_sum_0_1_imag  = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    wire signed [16:0] s0_diff_0_1_imag = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    wire signed [16:0] s0_sum_2_3_real  = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    wire signed [16:0] s0_diff_2_3_real = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    wire signed [16:0] s0_sum_2_3_imag  = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    wire signed [16:0] s0_diff_2_3_imag = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    wire signed [33:0] s0_prod_0_0 = s0_sum_0_1_real * $signed(17'sd23170);
    wire signed [33:0] s0_prod_0_1 = s0_sum_0_1_imag * $signed(17'sd23170);
    wire signed [33:0] s0_prod_1_0 = s0_diff_0_1_real * $signed(17'sd23170);
    wire signed [33:0] s0_prod_1_1 = s0_diff_0_1_imag * $signed(17'sd23170);

    wire signed [33:0] s0_prod_2_0 = s0_sum_2_3_real * $signed(17'sd23170);
    wire signed [33:0] s0_prod_2_1 = s0_sum_2_3_imag * $signed(17'sd23170);
    wire signed [33:0] s0_prod_3_0 = s0_diff_2_3_real * $signed(17'sd23170);
    wire signed [33:0] s0_prod_3_1 = s0_diff_2_3_imag * $signed(17'sd23170);

    reg signed [15:0] s0_0_0, s0_0_1;
    reg signed [15:0] s0_1_0, s0_1_1;
    reg signed [15:0] s0_2_0, s0_2_1;
    reg signed [15:0] s0_3_0, s0_3_1;
    reg s0_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            s0_0_0   <= 16'h0;
            s0_0_1   <= 16'h0;
            s0_1_0   <= 16'h0;
            s0_1_1   <= 16'h0;
            s0_2_0   <= 16'h0;
            s0_2_1   <= 16'h0;
            s0_3_0   <= 16'h0;
            s0_3_1   <= 16'h0;
            s0_valid <= 1'b0;
        end else begin
            s0_0_0   <= s0_prod_0_0[30:15];
            s0_0_1   <= s0_prod_0_1[30:15];
            s0_1_0   <= s0_prod_1_0[30:15];
            s0_1_1   <= s0_prod_1_1[30:15];
            s0_2_0   <= s0_prod_2_0[30:15];
            s0_2_1   <= s0_prod_2_1[30:15];
            s0_3_0   <= s0_prod_3_0[30:15];
            s0_3_1   <= s0_prod_3_1[30:15];
            s0_valid <= io_in_valid;
        end
    end

    // Step 1: X gate on Qubit 1
    reg signed [15:0] s1_0_0, s1_0_1;
    reg signed [15:0] s1_1_0, s1_1_1;
    reg signed [15:0] s1_2_0, s1_2_1;
    reg signed [15:0] s1_3_0, s1_3_1;
    reg s1_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            s1_0_0   <= 16'h0;
            s1_0_1   <= 16'h0;
            s1_1_0   <= 16'h0;
            s1_1_1   <= 16'h0;
            s1_2_0   <= 16'h0;
            s1_2_1   <= 16'h0;
            s1_3_0   <= 16'h0;
            s1_3_1   <= 16'h0;
            s1_valid <= 1'b0;
        end else begin
            s1_0_0   <= s0_2_0;
            s1_0_1   <= s0_2_1;
            s1_2_0   <= s0_0_0;
            s1_2_1   <= s0_0_1;
            s1_1_0   <= s0_3_0;
            s1_1_1   <= s0_3_1;
            s1_3_0   <= s0_1_0;
            s1_3_1   <= s0_1_1;
            s1_valid <= s0_valid;
        end
    end

    // Step 2: H gate on Qubit 1
    wire signed [16:0] s2_sum_0_2_real  = $signed(s1_0_0) + $signed(s1_2_0);
    wire signed [16:0] s2_diff_0_2_real = $signed(s1_0_0) - $signed(s1_2_0);
    wire signed [16:0] s2_sum_0_2_imag  = $signed(s1_0_1) + $signed(s1_2_1);
    wire signed [16:0] s2_diff_0_2_imag = $signed(s1_0_1) - $signed(s1_2_1);

    wire signed [16:0] s2_sum_1_3_real  = $signed(s1_1_0) + $signed(s1_3_0);
    wire signed [16:0] s2_diff_1_3_real = $signed(s1_1_0) - $signed(s1_3_0);
    wire signed [16:0] s2_sum_1_3_imag  = $signed(s1_1_1) + $signed(s1_3_1);
    wire signed [16:0] s2_diff_1_3_imag = $signed(s1_1_1) - $signed(s1_3_1);

    wire signed [33:0] s2_prod_0_0 = s2_sum_0_2_real * $signed(17'sd23170);
    wire signed [33:0] s2_prod_0_1 = s2_sum_0_2_imag * $signed(17'sd23170);
    wire signed [33:0] s2_prod_2_0 = s2_diff_0_2_real * $signed(17'sd23170);
    wire signed [33:0] s2_prod_2_1 = s2_diff_0_2_imag * $signed(17'sd23170);

    wire signed [33:0] s2_prod_1_0 = s2_sum_1_3_real * $signed(17'sd23170);
    wire signed [33:0] s2_prod_1_1 = s2_sum_1_3_imag * $signed(17'sd23170);
    wire signed [33:0] s2_prod_3_0 = s2_diff_1_3_real * $signed(17'sd23170);
    wire signed [33:0] s2_prod_3_1 = s2_diff_1_3_imag * $signed(17'sd23170);

    reg signed [15:0] s2_0_0, s2_0_1;
    reg signed [15:0] s2_1_0, s2_1_1;
    reg signed [15:0] s2_2_0, s2_2_1;
    reg signed [15:0] s2_3_0, s2_3_1;
    reg s2_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            s2_0_0   <= 16'h0;
            s2_0_1   <= 16'h0;
            s2_1_0   <= 16'h0;
            s2_1_1   <= 16'h0;
            s2_2_0   <= 16'h0;
            s2_2_1   <= 16'h0;
            s2_3_0   <= 16'h0;
            s2_3_1   <= 16'h0;
            s2_valid <= 1'b0;
        end else begin
            s2_0_0   <= s2_prod_0_0[30:15];
            s2_0_1   <= s2_prod_0_1[30:15];
            s2_2_0   <= s2_prod_2_0[30:15];
            s2_2_1   <= s2_prod_2_1[30:15];
            s2_1_0   <= s2_prod_1_0[30:15];
            s2_1_1   <= s2_prod_1_1[30:15];
            s2_3_0   <= s2_prod_3_0[30:15];
            s2_3_1   <= s2_prod_3_1[30:15];
            s2_valid <= s1_valid;
        end
    end

    // Step 3: SWAP gate on Qubits 0 and 1
    reg signed [15:0] s3_0_0, s3_0_1;
    reg signed [15:0] s3_1_0, s3_1_1;
    reg signed [15:0] s3_2_0, s3_2_1;
    reg signed [15:0] s3_3_0, s3_3_1;
    reg s3_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            s3_0_0   <= 16'h0;
            s3_0_1   <= 16'h0;
            s3_1_0   <= 16'h0;
            s3_1_1   <= 16'h0;
            s3_2_0   <= 16'h0;
            s3_2_1   <= 16'h0;
            s3_3_0   <= 16'h0;
            s3_3_1   <= 16'h0;
            s3_valid <= 1'b0;
        end else begin
            s3_0_0   <= s2_0_0;
            s3_0_1   <= s2_0_1;
            s3_1_0   <= s2_2_0;
            s3_1_1   <= s2_2_1;
            s3_2_0   <= s2_1_0;
            s3_2_1   <= s2_1_1;
            s3_3_0   <= s2_3_0;
            s3_3_1   <= s2_3_1;
            s3_valid <= s2_valid;
        end
    end

    // Output assignments
    assign io_out_QSV_0_0 = s3_0_0;
    assign io_out_QSV_0_1 = s3_0_1;
    assign io_out_QSV_1_0 = s3_1_0;
    assign io_out_QSV_1_1 = s3_1_1;
    assign io_out_QSV_2_0 = s3_2_0;
    assign io_out_QSV_2_1 = s3_2_1;
    assign io_out_QSV_3_0 = s3_3_0;
    assign io_out_QSV_3_1 = s3_3_1;
    assign io_out_valid   = s3_valid;

endmodule
