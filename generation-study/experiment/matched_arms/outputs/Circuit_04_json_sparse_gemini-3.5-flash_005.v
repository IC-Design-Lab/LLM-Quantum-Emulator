module Circuit_04 (
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

    // ---------------------------------------------------------
    // Stage 0: Hadamard gate on qubit 0
    // ---------------------------------------------------------
    // Pair A: (s0, s1)
    logic signed [16:0] sum_0_1_real;
    logic signed [16:0] sum_0_1_imag;
    logic signed [16:0] diff_0_1_real;
    logic signed [16:0] diff_0_1_imag;

    assign sum_0_1_real  = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    assign sum_0_1_imag  = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    assign diff_0_1_real = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    assign diff_0_1_imag = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    logic signed [33:0] mul_s0_0;
    logic signed [33:0] mul_s0_1;
    logic signed [33:0] mul_s1_0;
    logic signed [33:0] mul_s1_1;

    assign mul_s0_0 = sum_0_1_real  * 17'sd23170;
    assign mul_s0_1 = sum_0_1_imag  * 17'sd23170;
    assign mul_s1_0 = diff_0_1_real * 17'sd23170;
    assign mul_s1_1 = diff_0_1_imag * 17'sd23170;

    logic [15:0] next_s0_0;
    logic [15:0] next_s0_1;
    logic [15:0] next_s1_0;
    logic [15:0] next_s1_1;

    assign next_s0_0 = 16'(mul_s0_0 >>> 15);
    assign next_s0_1 = 16'(mul_s0_1 >>> 15);
    assign next_s1_0 = 16'(mul_s1_0 >>> 15);
    assign next_s1_1 = 16'(mul_s1_1 >>> 15);

    // Pair B: (s2, s3)
    logic signed [16:0] sum_2_3_real;
    logic signed [16:0] sum_2_3_imag;
    logic signed [16:0] diff_2_3_real;
    logic signed [16:0] diff_2_3_imag;

    assign sum_2_3_real  = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    assign sum_2_3_imag  = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    assign diff_2_3_real = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    assign diff_2_3_imag = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    logic signed [33:0] mul_s2_0;
    logic signed [33:0] mul_s2_1;
    logic signed [33:0] mul_s3_0;
    logic signed [33:0] mul_s3_1;

    assign mul_s2_0 = sum_2_3_real  * 17'sd23170;
    assign mul_s2_1 = sum_2_3_imag  * 17'sd23170;
    assign mul_s3_0 = diff_2_3_real * 17'sd23170;
    assign mul_s3_1 = diff_2_3_imag * 17'sd23170;

    logic [15:0] next_s2_0;
    logic [15:0] next_s2_1;
    logic [15:0] next_s3_0;
    logic [15:0] next_s3_1;

    assign next_s2_0 = 16'(mul_s2_0 >>> 15);
    assign next_s2_1 = 16'(mul_s2_1 >>> 15);
    assign next_s3_0 = 16'(mul_s3_0 >>> 15);
    assign next_s3_1 = 16'(mul_s3_1 >>> 15);

    // Registers Stage 0
    logic [15:0] r0_QSV_0_0, r0_QSV_0_1, r0_QSV_1_0, r0_QSV_1_1;
    logic [15:0] r0_QSV_2_0, r0_QSV_2_1, r0_QSV_3_0, r0_QSV_3_1;
    logic r0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_QSV_0_0 <= '0;
            r0_QSV_0_1 <= '0;
            r0_QSV_1_0 <= '0;
            r0_QSV_1_1 <= '0;
            r0_QSV_2_0 <= '0;
            r0_QSV_2_1 <= '0;
            r0_QSV_3_0 <= '0;
            r0_QSV_3_1 <= '0;
            r0_valid   <= 1'b0;
        end else begin
            r0_QSV_0_0 <= next_s0_0;
            r0_QSV_0_1 <= next_s0_1;
            r0_QSV_1_0 <= next_s1_0;
            r0_QSV_1_1 <= next_s1_1;
            r0_QSV_2_0 <= next_s2_0;
            r0_QSV_2_1 <= next_s2_1;
            r0_QSV_3_0 <= next_s3_0;
            r0_QSV_3_1 <= next_s3_1;
            r0_valid   <= io_in_valid;
        end
    end

    // ---------------------------------------------------------
    // Stage 1: SXdg (sqrt(X) dagger) on qubit 1
    // ---------------------------------------------------------
    // Pair C: (s0, s2)
    logic signed [17:0] s0_real_sum;
    logic signed [17:0] s0_imag_sum;
    logic signed [17:0] s2_real_sum;
    logic signed [17:0] s2_imag_sum;

    assign s0_real_sum = $signed(r0_QSV_0_0) + $signed(r0_QSV_2_0) + $signed(r0_QSV_0_1) - $signed(r0_QSV_2_1);
    assign s0_imag_sum = $signed(r0_QSV_0_1) + $signed(r0_QSV_2_1) - $signed(r0_QSV_0_0) + $signed(r0_QSV_2_0);
    assign s2_real_sum = $signed(r0_QSV_0_0) + $signed(r0_QSV_2_0) - $signed(r0_QSV_0_1) + $signed(r0_QSV_2_1);
    assign s2_imag_sum = $signed(r0_QSV_0_1) + $signed(r0_QSV_2_1) + $signed(r0_QSV_0_0) - $signed(r0_QSV_2_0);

    // Pair D: (s1, s3)
    logic signed [17:0] s1_real_sum;
    logic signed [17:0] s1_imag_sum;
    logic signed [17:0] s3_real_sum;
    logic signed [17:0] s3_imag_sum;

    assign s1_real_sum = $signed(r0_QSV_1_0) + $signed(r0_QSV_3_0) + $signed(r0_QSV_1_1) - $signed(r0_QSV_3_1);
    assign s1_imag_sum = $signed(r0_QSV_1_1) + $signed(r0_QSV_3_1) - $signed(r0_QSV_1_0) + $signed(r0_QSV_3_0);
    assign s3_real_sum = $signed(r0_QSV_1_0) + $signed(r0_QSV_3_0) - $signed(r0_QSV_1_1) + $signed(r0_QSV_3_1);
    assign s3_imag_sum = $signed(r0_QSV_1_1) + $signed(r0_QSV_3_1) + $signed(r0_QSV_1_0) - $signed(r0_QSV_3_0);

    logic [15:0] next_s0_0_s1;
    logic [15:0] next_s0_1_s1;
    logic [15:0] next_s2_0_s1;
    logic [15:0] next_s2_1_s1;
    logic [15:0] next_s1_0_s1;
    logic [15:0] next_s1_1_s1;
    logic [15:0] next_s3_0_s1;
    logic [15:0] next_s3_1_s1;

    assign next_s0_0_s1 = 16'(s0_real_sum >>> 1);
    assign next_s0_1_s1 = 16'(s0_imag_sum >>> 1);
    assign next_s2_0_s1 = 16'(s2_real_sum >>> 1);
    assign next_s2_1_s1 = 16'(s2_imag_sum >>> 1);

    assign next_s1_0_s1 = 16'(s1_real_sum >>> 1);
    assign next_s1_1_s1 = 16'(s1_imag_sum >>> 1);
    assign next_s3_0_s1 = 16'(s3_real_sum >>> 1);
    assign next_s3_1_s1 = 16'(s3_imag_sum >>> 1);

    // Registers Stage 1
    logic [15:0] r1_QSV_0_0, r1_QSV_0_1, r1_QSV_1_0, r1_QSV_1_1;
    logic [15:0] r1_QSV_2_0, r1_QSV_2_1, r1_QSV_3_0, r1_QSV_3_1;
    logic r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_QSV_0_0 <= '0;
            r1_QSV_0_1 <= '0;
            r1_QSV_1_0 <= '0;
            r1_QSV_1_1 <= '0;
            r1_QSV_2_0 <= '0;
            r1_QSV_2_1 <= '0;
            r1_QSV_3_0 <= '0;
            r1_QSV_3_1 <= '0;
            r1_valid   <= 1'b0;
        end else begin
            r1_QSV_0_0 <= next_s0_0_s1;
            r1_QSV_0_1 <= next_s0_1_s1;
            r1_QSV_1_0 <= next_s1_0_s1;
            r1_QSV_1_1 <= next_s1_1_s1;
            r1_QSV_2_0 <= next_s2_0_s1;
            r1_QSV_2_1 <= next_s2_1_s1;
            r1_QSV_3_0 <= next_s3_0_s1;
            r1_QSV_3_1 <= next_s3_1_s1;
            r1_valid   <= r0_valid;
        end
    end

    // ---------------------------------------------------------
    // Stage 2: SWAP gate on qubits 0 and 1 (and final registered outputs)
    // ---------------------------------------------------------
    // Swaps state 1 and state 2.
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_QSV_0_0 <= '0;
            io_out_QSV_0_1 <= '0;
            io_out_QSV_1_0 <= '0;
            io_out_QSV_1_1 <= '0;
            io_out_QSV_2_0 <= '0;
            io_out_QSV_2_1 <= '0;
            io_out_QSV_3_0 <= '0;
            io_out_QSV_3_1 <= '0;
            io_out_valid   <= 1'b0;
        end else begin
            io_out_QSV_0_0 <= r1_QSV_0_0;
            io_out_QSV_0_1 <= r1_QSV_0_1;
            io_out_QSV_1_0 <= r1_QSV_2_0; // Swapped
            io_out_QSV_1_1 <= r1_QSV_2_1; // Swapped
            io_out_QSV_2_0 <= r1_QSV_1_0; // Swapped
            io_out_QSV_2_1 <= r1_QSV_1_1; // Swapped
            io_out_QSV_3_0 <= r1_QSV_3_0;
            io_out_QSV_3_1 <= r1_QSV_3_1;
            io_out_valid   <= r1_valid;
        end
    end

endmodule
