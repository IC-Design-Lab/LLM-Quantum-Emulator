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

    // --- Stage 1: H(0) ---
    logic signed [15:0] r0_s1, i0_s1;
    logic signed [15:0] r1_s1, i1_s1;
    logic signed [15:0] r2_s1, i2_s1;
    logic signed [15:0] r3_s1, i3_s1;
    logic               v_s1;

    logic signed [16:0] sum_r01, diff_r01;
    logic signed [16:0] sum_i01, diff_i01;
    logic signed [16:0] sum_r23, diff_r23;
    logic signed [16:0] sum_i23, diff_i23;

    assign sum_r01  = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    assign diff_r01 = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    assign sum_i01  = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    assign diff_i01 = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    assign sum_r23  = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    assign diff_r23 = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    assign sum_i23  = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    assign diff_i23 = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    logic signed [32:0] prod_r0_s1, prod_i0_s1;
    logic signed [32:0] prod_r1_s1, prod_i1_s1;
    logic signed [32:0] prod_r2_s1, prod_i2_s1;
    logic signed [32:0] prod_r3_s1, prod_i3_s1;

    assign prod_r0_s1 = sum_r01  * 16'sd23170;
    assign prod_i0_s1 = sum_i01  * 16'sd23170;
    assign prod_r1_s1 = diff_r01 * 16'sd23170;
    assign prod_i1_s1 = diff_i01 * 16'sd23170;

    assign prod_r2_s1 = sum_r23  * 16'sd23170;
    assign prod_i2_s1 = sum_i23  * 16'sd23170;
    assign prod_r3_s1 = diff_r23 * 16'sd23170;
    assign prod_i3_s1 = diff_i23 * 16'sd23170;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_s1 <= '0; i0_s1 <= '0;
            r1_s1 <= '0; i1_s1 <= '0;
            r2_s1 <= '0; i2_s1 <= '0;
            r3_s1 <= '0; i3_s1 <= '0;
            v_s1  <= 1'b0;
        end else begin
            v_s1  <= io_in_valid;
            if (io_in_valid) begin
                r0_s1 <= prod_r0_s1[30:15];
                i0_s1 <= prod_i0_s1[30:15];
                r1_s1 <= prod_r1_s1[30:15];
                i1_s1 <= prod_i1_s1[30:15];
                r2_s1 <= prod_r2_s1[30:15];
                i2_s1 <= prod_i2_s1[30:15];
                r3_s1 <= prod_r3_s1[30:15];
                i3_s1 <= prod_i3_s1[30:15];
            end
        end
    end

    // --- Stage 2: X(1) ---
    logic signed [15:0] r0_s2, i0_s2;
    logic signed [15:0] r1_s2, i1_s2;
    logic signed [15:0] r2_s2, i2_s2;
    logic signed [15:0] r3_s2, i3_s2;
    logic               v_s2;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_s2 <= '0; i0_s2 <= '0;
            r1_s2 <= '0; i1_s2 <= '0;
            r2_s2 <= '0; i2_s2 <= '0;
            r3_s2 <= '0; i3_s2 <= '0;
            v_s2  <= 1'b0;
        end else begin
            v_s2  <= v_s1;
            if (v_s1) begin
                r0_s2 <= r2_s1;
                i0_s2 <= i2_s1;
                r1_s2 <= r3_s1;
                i1_s2 <= i3_s1;
                r2_s2 <= r0_s1;
                i2_s2 <= i0_s1;
                r3_s2 <= r1_s1;
                i3_s2 <= i1_s1;
            end
        end
    end

    // --- Stage 3: SXDG(1) ---
    logic signed [15:0] r0_s3, i0_s3;
    logic signed [15:0] r1_s3, i1_s3;
    logic signed [15:0] r2_s3, i2_s3;
    logic signed [15:0] r3_s3, i3_s3;
    logic               v_s3;

    logic signed [18:0] sum_r0_s3, sum_i0_s3, sum_r2_s3, sum_i2_s3;
    logic signed [18:0] sum_r1_s3, sum_i1_s3, sum_r3_s3, sum_i3_s3;

    assign sum_r0_s3 = $signed(r0_s2) + $signed(i0_s2) + $signed(r2_s2) - $signed(i2_s2);
    assign sum_i0_s3 = -$signed(r0_s2) + $signed(i0_s2) + $signed(r2_s2) + $signed(i2_s2);
    assign sum_r2_s3 = $signed(r0_s2) - $signed(i0_s2) + $signed(r2_s2) + $signed(i2_s2);
    assign sum_i2_s3 = $signed(r0_s2) + $signed(i0_s2) - $signed(r2_s2) + $signed(i2_s2);

    assign sum_r1_s3 = $signed(r1_s2) + $signed(i1_s2) + $signed(r3_s2) - $signed(i3_s2);
    assign sum_i1_s3 = -$signed(r1_s2) + $signed(i1_s2) + $signed(r3_s2) + $signed(i3_s2);
    assign sum_r3_s3 = $signed(r1_s2) - $signed(i1_s2) + $signed(r3_s2) + $signed(i3_s2);
    assign sum_i3_s3 = $signed(r1_s2) + $signed(i1_s2) - $signed(r3_s2) + $signed(i3_s2);

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_s3 <= '0; i0_s3 <= '0;
            r1_s3 <= '0; i1_s3 <= '0;
            r2_s3 <= '0; i2_s3 <= '0;
            r3_s3 <= '0; i3_s3 <= '0;
            v_s3  <= 1'b0;
        end else begin
            v_s3  <= v_s2;
            if (v_s2) begin
                r0_s3 <= sum_r0_s3[16:1];
                i0_s3 <= sum_i0_s3[16:1];
                r1_s3 <= sum_r1_s3[16:1];
                i1_s3 <= sum_i1_s3[16:1];
                r2_s3 <= sum_r2_s3[16:1];
                i2_s3 <= sum_i2_s3[16:1];
                r3_s3 <= sum_r3_s3[16:1];
                i3_s3 <= sum_i3_s3[16:1];
            end
        end
    end

    // --- Stage 4: SWAP(0, 1) ---
    logic signed [15:0] r0_s4, i0_s4;
    logic signed [15:0] r1_s4, i1_s4;
    logic signed [15:0] r2_s4, i2_s4;
    logic signed [15:0] r3_s4, i3_s4;
    logic               v_s4;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_s4 <= '0; i0_s4 <= '0;
            r1_s4 <= '0; i1_s4 <= '0;
            r2_s4 <= '0; i2_s4 <= '0;
            r3_s4 <= '0; i3_s4 <= '0;
            v_s4  <= 1'b0;
        end else begin
            v_s4  <= v_s3;
            if (v_s3) begin
                r0_s4 <= r0_s3;
                i0_s4 <= i0_s3;
                r1_s4 <= r2_s3;
                i1_s4 <= i2_s3;
                r2_s4 <= r1_s3;
                i2_s4 <= i1_s3;
                r3_s4 <= r3_s3;
                i3_s4 <= i3_s3;
            end
        end
    end

    // --- Outputs ---
    assign io_out_QSV_0_0 = r0_s4;
    assign io_out_QSV_0_1 = i0_s4;
    assign io_out_QSV_1_0 = r1_s4;
    assign io_out_QSV_1_1 = i1_s4;
    assign io_out_QSV_2_0 = r2_s4;
    assign io_out_QSV_2_1 = i2_s4;
    assign io_out_QSV_3_0 = r3_s4;
    assign io_out_QSV_3_1 = i3_s4;
    assign io_out_valid   = v_s4;

endmodule
