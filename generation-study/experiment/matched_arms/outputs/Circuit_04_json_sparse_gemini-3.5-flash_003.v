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

    // Constant for 1/sqrt(2) in Q1.15 format (0.70710678 * 32768 = 23170)
    localparam signed [15:0] INV_SQRT2 = 16'sd23170;

    // --- Stage 1: Hadamard Gate on Qubit 0 ---
    // Qubit 0 is the LSB, so the mixing pairs are (0,1) and (2,3).
    wire signed [16:0] sum_r0_r1  = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    wire signed [16:0] diff_r0_r1 = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    wire signed [16:0] sum_i0_i1  = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    wire signed [16:0] diff_i0_i1 = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    wire signed [16:0] sum_r2_r3  = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    wire signed [16:0] diff_r2_r3 = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    wire signed [16:0] sum_i2_i3  = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    wire signed [16:0] diff_i2_i3 = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    wire signed [32:0] prod_r0 = sum_r0_r1  * INV_SQRT2;
    wire signed [32:0] prod_r1 = diff_r0_r1 * INV_SQRT2;
    wire signed [32:0] prod_i0 = sum_i0_i1  * INV_SQRT2;
    wire signed [32:0] prod_i1 = diff_i0_i1 * INV_SQRT2;

    wire signed [32:0] prod_r2 = sum_r2_r3  * INV_SQRT2;
    wire signed [32:0] prod_r3 = diff_r2_r3 * INV_SQRT2;
    wire signed [32:0] prod_i2 = sum_i2_i3  * INV_SQRT2;
    wire signed [32:0] prod_i3 = diff_i2_i3 * INV_SQRT2;

    reg signed [15:0] r0_stage1, i0_stage1;
    reg signed [15:0] r1_stage1, i1_stage1;
    reg signed [15:0] r2_stage1, i2_stage1;
    reg signed [15:0] r3_stage1, i3_stage1;
    reg               valid_stage1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_stage1    <= '0;
            i0_stage1    <= '0;
            r1_stage1    <= '0;
            i1_stage1    <= '0;
            r2_stage1    <= '0;
            i2_stage1    <= '0;
            r3_stage1    <= '0;
            i3_stage1    <= '0;
            valid_stage1 <= 1'b0;
        end else begin
            r0_stage1    <= 16'(prod_r0 >>> 15);
            i0_stage1    <= 16'(prod_i0 >>> 15);
            r1_stage1    <= 16'(prod_r1 >>> 15);
            i1_stage1    <= 16'(prod_i1 >>> 15);
            r2_stage1    <= 16'(prod_r2 >>> 15);
            i2_stage1    <= 16'(prod_i2 >>> 15);
            r3_stage1    <= 16'(prod_r3 >>> 15);
            i3_stage1    <= 16'(prod_i3 >>> 15);
            valid_stage1 <= io_in_valid;
        end
    end

    // --- Stage 2: SXdg (Square Root of X Dagger) Gate on Qubit 1 ---
    // Qubit 1 is the MSB, so the mixing pairs are (0,2) and (1,3).
    // Formula for SXdg on (a, b) pair:
    //   a' = 0.5 * ((Ra + Ia + Rb - Ib) + i * (Ia - Ra + Ib + Rb))
    //   b' = 0.5 * ((Ra - Ia + Rb + Ib) + i * (Ia + Ra + Ib - Rb))
    wire signed [17:0] sum_R0 = $signed(r0_stage1) + $signed(i0_stage1) + $signed(r2_stage1) - $signed(i2_stage1);
    wire signed [17:0] sum_I0 = $signed(i0_stage1) - $signed(r0_stage1) + $signed(i2_stage1) + $signed(r2_stage1);
    wire signed [17:0] sum_R2 = $signed(r0_stage1) - $signed(i0_stage1) + $signed(r2_stage1) + $signed(i2_stage1);
    wire signed [17:0] sum_I2 = $signed(i0_stage1) + $signed(r0_stage1) + $signed(i2_stage1) - $signed(r2_stage1);

    wire signed [17:0] sum_R1 = $signed(r1_stage1) + $signed(i1_stage1) + $signed(r3_stage1) - $signed(i3_stage1);
    wire signed [17:0] sum_I1 = $signed(i1_stage1) - $signed(r1_stage1) + $signed(i3_stage1) + $signed(r3_stage1);
    wire signed [17:0] sum_R3 = $signed(r1_stage1) - $signed(i1_stage1) + $signed(r3_stage1) + $signed(i3_stage1);
    wire signed [17:0] sum_I3 = $signed(i1_stage1) + $signed(r1_stage1) + $signed(i3_stage1) - $signed(r3_stage1);

    reg signed [15:0] r0_stage2, i0_stage2;
    reg signed [15:0] r1_stage2, i1_stage2;
    reg signed [15:0] r2_stage2, i2_stage2;
    reg signed [15:0] r3_stage2, i3_stage2;
    reg               valid_stage2;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_stage2    <= '0;
            i0_stage2    <= '0;
            r1_stage2    <= '0;
            i1_stage2    <= '0;
            r2_stage2    <= '0;
            i2_stage2    <= '0;
            r3_stage2    <= '0;
            i3_stage2    <= '0;
            valid_stage2 <= 1'b0;
        end else begin
            r0_stage2    <= 16'(sum_R0 >>> 1);
            i0_stage2    <= 16'(sum_I0 >>> 1);
            r1_stage2    <= 16'(sum_R1 >>> 1);
            i1_stage2    <= 16'(sum_I1 >>> 1);
            r2_stage2    <= 16'(sum_R2 >>> 1);
            i2_stage2    <= 16'(sum_I2 >>> 1);
            r3_stage2    <= 16'(sum_R3 >>> 1);
            i3_stage2    <= 16'(sum_I3 >>> 1);
            valid_stage2 <= valid_stage1;
        end
    end

    // --- Stage 3: SWAP Gate on Qubits 0 and 1 ---
    // Swapping qubits 0 and 1 swaps states |01> and |10> (indices 1 and 2).
    reg signed [15:0] r0_stage3, i0_stage3;
    reg signed [15:0] r1_stage3, i1_stage3;
    reg signed [15:0] r2_stage3, i2_stage3;
    reg signed [15:0] r3_stage3, i3_stage3;
    reg               valid_stage3;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_stage3    <= '0;
            i0_stage3    <= '0;
            r1_stage3    <= '0;
            i1_stage3    <= '0;
            r2_stage3    <= '0;
            i2_stage3    <= '0;
            r3_stage3    <= '0;
            i3_stage3    <= '0;
            valid_stage3 <= 1'b0;
        end else begin
            r0_stage3    <= r0_stage2;
            i0_stage3    <= i0_stage2;
            r1_stage3    <= r2_stage2; // swapped
            i1_stage3    <= i2_stage2; // swapped
            r2_stage3    <= r1_stage2; // swapped
            i2_stage3    <= i1_stage2; // swapped
            r3_stage3    <= r3_stage2;
            i3_stage3    <= i3_stage2;
            valid_stage3 <= valid_stage2;
        end
    end

    // --- Outputs ---
    assign io_out_QSV_0_0 = r0_stage3;
    assign io_out_QSV_0_1 = i0_stage3;
    assign io_out_QSV_1_0 = r1_stage3;
    assign io_out_QSV_1_1 = i1_stage3;
    assign io_out_QSV_2_0 = r2_stage3;
    assign io_out_QSV_2_1 = i2_stage3;
    assign io_out_QSV_3_0 = r3_stage3;
    assign io_out_QSV_3_1 = i3_stage3;
    assign io_out_valid   = valid_stage3;

endmodule
