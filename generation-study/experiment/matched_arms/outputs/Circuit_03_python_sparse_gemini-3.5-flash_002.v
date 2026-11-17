module Circuit_03 (
    input  logic        clock,
    input  logic        reset,
    input  logic signed [15:0] io_in_QSV_0_0,
    input  logic signed [15:0] io_in_QSV_0_1,
    input  logic signed [15:0] io_in_QSV_1_0,
    input  logic signed [15:0] io_in_QSV_1_1,
    input  logic signed [15:0] io_in_QSV_2_0,
    input  logic signed [15:0] io_in_QSV_2_1,
    input  logic signed [15:0] io_in_QSV_3_0,
    input  logic signed [15:0] io_in_QSV_3_1,
    input  logic        io_in_valid,
    output logic signed [15:0] io_out_QSV_0_0,
    output logic signed [15:0] io_out_QSV_0_1,
    output logic signed [15:0] io_out_QSV_1_0,
    output logic signed [15:0] io_out_QSV_1_1,
    output logic signed [15:0] io_out_QSV_2_0,
    output logic signed [15:0] io_out_QSV_2_1,
    output logic signed [15:0] io_out_QSV_3_0,
    output logic signed [15:0] io_out_QSV_3_1,
    output logic        io_out_valid
);

    // --- Stage 0: Input Registration ---
    logic signed [15:0] r0_q0_0, r0_q0_1;
    logic signed [15:0] r0_q1_0, r0_q1_1;
    logic signed [15:0] r0_q2_0, r0_q2_1;
    logic signed [15:0] r0_q3_0, r0_q3_1;
    logic r0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_q0_0  <= 16'sd0;
            r0_q0_1  <= 16'sd0;
            r0_q1_0  <= 16'sd0;
            r0_q1_1  <= 16'sd0;
            r0_q2_0  <= 16'sd0;
            r0_q2_1  <= 16'sd0;
            r0_q3_0  <= 16'sd0;
            r0_q3_1  <= 16'sd0;
            r0_valid <= 1'b0;
        end else begin
            r0_q0_0  <= io_in_QSV_0_0;
            r0_q0_1  <= io_in_QSV_0_1;
            r0_q1_0  <= io_in_QSV_1_0;
            r0_q1_1  <= io_in_QSV_1_1;
            r0_q2_0  <= io_in_QSV_2_0;
            r0_q2_1  <= io_in_QSV_2_1;
            r0_q3_0  <= io_in_QSV_3_0;
            r0_q3_1  <= io_in_QSV_3_1;
            r0_valid <= io_in_valid;
        end
    end

    // --- Stage 1: h(0) ---
    logic signed [15:0] r1_q0_0, r1_q0_1;
    logic signed [15:0] r1_q1_0, r1_q1_1;
    logic signed [15:0] r1_q2_0, r1_q2_1;
    logic signed [15:0] r1_q3_0, r1_q3_1;
    logic r1_valid;

    logic signed [31:0] h0_add, h0_sub;
    logic signed [31:0] h0_sum, h0_diff;

    assign h0_add  = 32'(r0_q0_0) + 32'(r0_q0_1);
    assign h0_sub  = 32'(r0_q0_0) - 32'(r0_q0_1);
    assign h0_sum  = h0_add * 32'sd23170;
    assign h0_diff = h0_sub * 32'sd23170;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_q0_0  <= 16'sd0;
            r1_q0_1  <= 16'sd0;
            r1_q1_0  <= 16'sd0;
            r1_q1_1  <= 16'sd0;
            r1_q2_0  <= 16'sd0;
            r1_q2_1  <= 16'sd0;
            r1_q3_0  <= 16'sd0;
            r1_q3_1  <= 16'sd0;
            r1_valid <= 1'b0;
        end else begin
            r1_q0_0  <= h0_sum[30:15];
            r1_q0_1  <= h0_diff[30:15];
            r1_q1_0  <= r0_q1_0;
            r1_q1_1  <= r0_q1_1;
            r1_q2_0  <= r0_q2_0;
            r1_q2_1  <= r0_q2_1;
            r1_q3_0  <= r0_q3_0;
            r1_q3_1  <= r0_q3_1;
            r1_valid <= r0_valid;
        end
    end

    // --- Stage 2: x(1) ---
    logic signed [15:0] r2_q0_0, r2_q0_1;
    logic signed [15:0] r2_q1_0, r2_q1_1;
    logic signed [15:0] r2_q2_0, r2_q2_1;
    logic signed [15:0] r2_q3_0, r2_q3_1;
    logic r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_q0_0  <= 16'sd0;
            r2_q0_1  <= 16'sd0;
            r2_q1_0  <= 16'sd0;
            r2_q1_1  <= 16'sd0;
            r2_q2_0  <= 16'sd0;
            r2_q2_1  <= 16'sd0;
            r2_q3_0  <= 16'sd0;
            r2_q3_1  <= 16'sd0;
            r2_valid <= 1'b0;
        end else begin
            r2_q0_0  <= r1_q0_0;
            r2_q0_1  <= r1_q0_1;
            r2_q1_0  <= r1_q1_1; // Pauli-X: Swap state 0 and 1 amplitudes
            r2_q1_1  <= r1_q1_0;
            r2_q2_0  <= r1_q2_0;
            r2_q2_1  <= r1_q2_1;
            r2_q3_0  <= r1_q3_0;
            r2_q3_1  <= r1_q3_1;
            r2_valid <= r1_valid;
        end
    end

    // --- Stage 3: h(1) ---
    logic signed [15:0] r3_q0_0, r3_q0_1;
    logic signed [15:0] r3_q1_0, r3_q1_1;
    logic signed [15:0] r3_q2_0, r3_q2_1;
    logic signed [15:0] r3_q3_0, r3_q3_1;
    logic r3_valid;

    logic signed [31:0] h1_add, h1_sub;
    logic signed [31:0] h1_sum, h1_diff;

    assign h1_add  = 32'(r2_q1_0) + 32'(r2_q1_1);
    assign h1_sub  = 32'(r2_q1_0) - 32'(r2_q1_1);
    assign h1_sum  = h1_add * 32'sd23170;
    assign h1_diff = h1_sub * 32'sd23170;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_q0_0  <= 16'sd0;
            r3_q0_1  <= 16'sd0;
            r3_q1_0  <= 16'sd0;
            r3_q1_1  <= 16'sd0;
            r3_q2_0  <= 16'sd0;
            r3_q2_1  <= 16'sd0;
            r3_q3_0  <= 16'sd0;
            r3_q3_1  <= 16'sd0;
            r3_valid <= 1'b0;
        end else begin
            r3_q0_0  <= r2_q0_0;
            r3_q0_1  <= r2_q0_1;
            r3_q1_0  <= h1_sum[30:15];
            r3_q1_1  <= h1_diff[30:15];
            r3_q2_0  <= r2_q2_0;
            r3_q2_1  <= r2_q2_1;
            r3_q3_0  <= r2_q3_0;
            r3_q3_1  <= r2_q3_1;
            r3_valid <= r2_valid;
        end
    end

    // --- Stage 4: swap(0, 1) ---
    logic signed [15:0] r4_q0_0, r4_q0_1;
    logic signed [15:0] r4_q1_0, r4_q1_1;
    logic signed [15:0] r4_q2_0, r4_q2_1;
    logic signed [15:0] r4_q3_0, r4_q3_1;
    logic r4_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r4_q0_0  <= 16'sd0;
            r4_q0_1  <= 16'sd0;
            r4_q1_0  <= 16'sd0;
            r4_q1_1  <= 16'sd0;
            r4_q2_0  <= 16'sd0;
            r4_q2_1  <= 16'sd0;
            r4_q3_0  <= 16'sd0;
            r4_q3_1  <= 16'sd0;
            r4_valid <= 1'b0;
        end else begin
            r4_q0_0  <= r3_q1_0; // Swap Qubit 0 and Qubit 1
            r4_q0_1  <= r3_q1_1;
            r4_q1_0  <= r3_q0_0;
            r4_q1_1  <= r3_q0_1;
            r4_q2_0  <= r3_q2_0;
            r4_q2_1  <= r3_q2_1;
            r4_q3_0  <= r3_q3_0;
            r4_q3_1  <= r3_q3_1;
            r4_valid <= r3_valid;
        end
    end

    // --- Output Assignment ---
    assign io_out_QSV_0_0 = r4_q0_0;
    assign io_out_QSV_0_1 = r4_q0_1;
    assign io_out_QSV_1_0 = r4_q1_0;
    assign io_out_QSV_1_1 = r4_q1_1;
    assign io_out_QSV_2_0 = r4_q2_0;
    assign io_out_QSV_2_1 = r4_q2_1;
    assign io_out_QSV_3_0 = r4_q3_0;
    assign io_out_QSV_3_1 = r4_q3_1;
    assign io_out_valid   = r4_valid;

endmodule
