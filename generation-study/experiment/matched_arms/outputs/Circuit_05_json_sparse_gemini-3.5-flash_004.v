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

    // Stage 0: Input Registers
    logic signed [15:0] r0_0, r0_1, r1_0, r1_1, r2_0, r2_1, r3_0, r3_1;
    logic v0;

    always_ff @(posedge clock) begin
        if (reset) begin
            v0   <= 1'b0;
            r0_0 <= '0; r0_1 <= '0;
            r1_0 <= '0; r1_1 <= '0;
            r2_0 <= '0; r2_1 <= '0;
            r3_0 <= '0; r3_1 <= '0;
        end else begin
            v0   <= io_in_valid;
            r0_0 <= signed'(io_in_QSV_0_0);
            r0_1 <= signed'(io_in_QSV_0_1);
            r1_0 <= signed'(io_in_QSV_1_0);
            r1_1 <= signed'(io_in_QSV_1_1);
            r2_0 <= signed'(io_in_QSV_2_0);
            r2_1 <= signed'(io_in_QSV_2_1);
            r3_0 <= signed'(io_in_QSV_3_0);
            r3_1 <= signed'(io_in_QSV_3_1);
        end
    end

    // Stage 1: Hadamard on Qubit 0
    logic signed [16:0] sum0_0, sub1_0, sum0_1, sub1_1;
    logic signed [16:0] sum2_0, sub3_0, sum2_1, sub3_1;
    logic signed [32:0] h0_0_next, h0_1_next, h1_0_next, h1_1_next;
    logic signed [32:0] h2_0_next, h2_1_next, h3_0_next, h3_1_next;

    always_comb begin
        sum0_0 = 17'(r0_0) + 17'(r1_0);
        sub1_0 = 17'(r0_0) - 17'(r1_0);
        sum0_1 = 17'(r0_1) + 17'(r1_1);
        sub1_1 = 17'(r0_1) - 17'(r1_1);

        sum2_0 = 17'(r2_0) + 17'(r3_0);
        sub3_0 = 17'(r2_0) - 17'(r3_0);
        sum2_1 = 17'(r2_1) + 17'(r3_1);
        sub3_1 = 17'(r2_1) - 17'(r3_1);

        h0_0_next = sum0_0 * 17'sd23170;
        h1_0_next = sub1_0 * 17'sd23170;
        h0_1_next = sum0_1 * 17'sd23170;
        h1_1_next = sub1_1 * 17'sd23170;

        h2_0_next = sum2_0 * 17'sd23170;
        h3_0_next = sub3_0 * 17'sd23170;
        h2_1_next = sum2_1 * 17'sd23170;
        h3_1_next = sub3_1 * 17'sd23170;
    end

    logic signed [15:0] r0_0_s1, r0_1_s1, r1_0_s1, r1_1_s1, r2_0_s1, r2_1_s1, r3_0_s1, r3_1_s1;
    logic v1;

    always_ff @(posedge clock) begin
        if (reset) begin
            v1 <= 1'b0;
            r0_0_s1 <= '0; r0_1_s1 <= '0;
            r1_0_s1 <= '0; r1_1_s1 <= '0;
            r2_0_s1 <= '0; r2_1_s1 <= '0;
            r3_0_s1 <= '0; r3_1_s1 <= '0;
        end else begin
            v1 <= v0;
            r0_0_s1 <= 16'(h0_0_next >>> 15);
            r0_1_s1 <= 16'(h0_1_next >>> 15);
            r1_0_s1 <= 16'(h1_0_next >>> 15);
            r1_1_s1 <= 16'(h1_1_next >>> 15);
            r2_0_s1 <= 16'(h2_0_next >>> 15);
            r2_1_s1 <= 16'(h2_1_next >>> 15);
            r3_0_s1 <= 16'(h3_0_next >>> 15);
            r3_1_s1 <= 16'(h3_1_next >>> 15);
        end
    end

    // Stage 2: X on Qubit 1
    logic signed [15:0] r0_0_s2, r0_1_s2, r1_0_s2, r1_1_s2, r2_0_s2, r2_1_s2, r3_0_s2, r3_1_s2;
    logic v2;

    always_ff @(posedge clock) begin
        if (reset) begin
            v2 <= 1'b0;
            r0_0_s2 <= '0; r0_1_s2 <= '0;
            r1_0_s2 <= '0; r1_1_s2 <= '0;
            r2_0_s2 <= '0; r2_1_s2 <= '0;
            r3_0_s2 <= '0; r3_1_s2 <= '0;
        end else begin
            v2 <= v1;
            r0_0_s2 <= r2_0_s1;
            r0_1_s2 <= r2_1_s1;
            r2_0_s2 <= r0_0_s1;
            r2_1_s2 <= r0_1_s1;
            r1_0_s2 <= r3_0_s1;
            r1_1_s2 <= r3_1_s1;
            r3_0_s2 <= r1_0_s1;
            r3_1_s2 <= r1_1_s1;
        end
    end

    // Stage 3: SXdg on Qubit 1
    logic signed [17:0] sxdg_02_r0, sxdg_02_i0, sxdg_02_r2, sxdg_02_i2;
    logic signed [17:0] sxdg_13_r1, sxdg_13_i1, sxdg_13_r3, sxdg_13_i3;

    always_comb begin
        sxdg_02_r0 = 18'(r0_0_s2) + 18'(r0_1_s2) + 18'(r2_0_s2) - 18'(r2_1_s2);
        sxdg_02_i0 = 18'(r0_1_s2) - 18'(r0_0_s2) + 18'(r2_1_s2) + 18'(r2_0_s2);
        sxdg_02_r2 = 18'(r0_0_s2) - 18'(r0_1_s2) + 18'(r2_0_s2) + 18'(r2_1_s2);
        sxdg_02_i2 = 18'(r0_1_s2) + 18'(r0_0_s2) + 18'(r2_1_s2) - 18'(r2_0_s2);

        sxdg_13_r1 = 18'(r1_0_s2) + 18'(r1_1_s2) + 18'(r3_0_s2) - 18'(r3_1_s2);
        sxdg_13_i1 = 18'(r1_1_s2) - 18'(r1_0_s2) + 18'(r3_1_s2) + 18'(r3_0_s2);
        sxdg_13_r3 = 18'(r1_0_s2) - 18'(r1_1_s2) + 18'(r3_0_s2) + 18'(r3_1_s2);
        sxdg_13_i3 = 18'(r1_1_s2) + 18'(r1_0_s2) + 18'(r3_1_s2) - 18'(r3_0_s2);
    end

    logic signed [15:0] r0_0_s3, r0_1_s3, r1_0_s3, r1_1_s3, r2_0_s3, r2_1_s3, r3_0_s3, r3_1_s3;
    logic v3;

    always_ff @(posedge clock) begin
        if (reset) begin
            v3 <= 1'b0;
            r0_0_s3 <= '0; r0_1_s3 <= '0;
            r1_0_s3 <= '0; r1_1_s3 <= '0;
            r2_0_s3 <= '0; r2_1_s3 <= '0;
            r3_0_s3 <= '0; r3_1_s3 <= '0;
        end else begin
            v3 <= v2;
            r0_0_s3 <= 16'(sxdg_02_r0 >>> 1);
            r0_1_s3 <= 16'(sxdg_02_i0 >>> 1);
            r2_0_s3 <= 16'(sxdg_02_r2 >>> 1);
            r2_1_s3 <= 16'(sxdg_02_i2 >>> 1);

            r1_0_s3 <= 16'(sxdg_13_r1 >>> 1);
            r1_1_s3 <= 16'(sxdg_13_i1 >>> 1);
            r3_0_s3 <= 16'(sxdg_13_r3 >>> 1);
            r3_1_s3 <= 16'(sxdg_13_i3 >>> 1);
        end
    end

    // Stage 4: Swap on Qubits 0 and 1
    logic signed [15:0] r0_0_s4, r0_1_s4, r1_0_s4, r1_1_s4, r2_0_s4, r2_1_s4, r3_0_s4, r3_1_s4;
    logic v4;

    always_ff @(posedge clock) begin
        if (reset) begin
            v4 <= 1'b0;
            r0_0_s4 <= '0; r0_1_s4 <= '0;
            r1_0_s4 <= '0; r1_1_s4 <= '0;
            r2_0_s4 <= '0; r2_1_s4 <= '0;
            r3_0_s4 <= '0; r3_1_s4 <= '0;
        end else begin
            v4 <= v3;
            r0_0_s4 <= r0_0_s3;
            r0_1_s4 <= r0_1_s3;
            r1_0_s4 <= r2_0_s3;
            r1_1_s4 <= r2_1_s3;
            r2_0_s4 <= r1_0_s3;
            r2_1_s4 <= r1_1_s3;
            r3_0_s4 <= r3_0_s3;
            r3_1_s4 <= r3_1_s3;
        end
    end

    // Output assignments
    assign io_out_QSV_0_0 = logic [15:0]'(r0_0_s4);
    assign io_out_QSV_0_1 = logic [15:0]'(r0_1_s4);
    assign io_out_QSV_1_0 = logic [15:0]'(r1_0_s4);
    assign io_out_QSV_1_1 = logic [15:0]'(r1_1_s4);
    assign io_out_QSV_2_0 = logic [15:0]'(r2_0_s4);
    assign io_out_QSV_2_1 = logic [15:0]'(r2_1_s4);
    assign io_out_QSV_3_0 = logic [15:0]'(r3_0_s4);
    assign io_out_QSV_3_1 = logic [15:0]'(r3_1_s4);
    assign io_out_valid   = v4;

endmodule
