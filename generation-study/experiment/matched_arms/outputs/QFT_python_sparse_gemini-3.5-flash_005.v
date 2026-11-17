module QFT (
    input  logic              clock,
    input  logic              reset,
    input  logic signed [7:0] io_in_QSV_0_0,
    input  logic signed [7:0] io_in_QSV_0_1,
    input  logic signed [7:0] io_in_QSV_1_0,
    input  logic signed [7:0] io_in_QSV_1_1,
    input  logic signed [7:0] io_in_QSV_2_0,
    input  logic signed [7:0] io_in_QSV_2_1,
    input  logic signed [7:0] io_in_QSV_3_0,
    input  logic signed [7:0] io_in_QSV_3_1,
    input  logic signed [7:0] io_in_QSV_4_0,
    input  logic signed [7:0] io_in_QSV_4_1,
    input  logic signed [7:0] io_in_QSV_5_0,
    input  logic signed [7:0] io_in_QSV_5_1,
    input  logic signed [7:0] io_in_QSV_6_0,
    input  logic signed [7:0] io_in_QSV_6_1,
    input  logic signed [7:0] io_in_QSV_7_0,
    input  logic signed [7:0] io_in_QSV_7_1,
    input  logic              io_in_valid,
    output logic signed [7:0] io_out_QSV_0_0,
    output logic signed [7:0] io_out_QSV_0_1,
    output logic signed [7:0] io_out_QSV_1_0,
    output logic signed [7:0] io_out_QSV_1_1,
    output logic signed [7:0] io_out_QSV_2_0,
    output logic signed [7:0] io_out_QSV_2_1,
    output logic signed [7:0] io_out_QSV_3_0,
    output logic signed [7:0] io_out_QSV_3_1,
    output logic signed [7:0] io_out_QSV_4_0,
    output logic signed [7:0] io_out_QSV_4_1,
    output logic signed [7:0] io_out_QSV_5_0,
    output logic signed [7:0] io_out_QSV_5_1,
    output logic signed [7:0] io_out_QSV_6_0,
    output logic signed [7:0] io_out_QSV_6_1,
    output logic signed [7:0] io_out_QSV_7_0,
    output logic signed [7:0] io_out_QSV_7_1,
    output logic              io_out_valid
);

    // Saturation logic to prevent overflow on signed 8-bit limits [-128, 127]
    function automatic logic signed [7:0] saturate(input logic signed [31:0] val);
        if (val > 32'sd127) return 8'sd127;
        else if (val < -32'sd128) return -8'sd128;
        else return val[7:0];
    endfunction

    // Pipeline Registers
    logic signed [7:0] r0_s1, i0_s1, r1_s1, i1_s1, r2_s1, i2_s1, r3_s1, i3_s1;
    logic signed [7:0] r4_s1, i4_s1, r5_s1, i5_s1, r6_s1, i6_s1, r7_s1, i7_s1;
    logic valid_s1;

    logic signed [7:0] r0_s2, i0_s2, r1_s2, i1_s2, r2_s2, i2_s2, r3_s2, i3_s2;
    logic signed [7:0] r4_s2, i4_s2, r5_s2, i5_s2, r6_s2, i6_s2, r7_s2, i7_s2;
    logic valid_s2;

    logic signed [7:0] r0_s3, i0_s3, r1_s3, i1_s3, r2_s3, i2_s3, r3_s3, i3_s3;
    logic signed [7:0] r4_s3, i4_s3, r5_s3, i5_s3, r6_s3, i6_s3, r7_s3, i7_s3;
    logic valid_s3;

    logic signed [7:0] r0_s4, i0_s4, r1_s4, i1_s4, r2_s4, i2_s4, r3_s4, i3_s4;
    logic signed [7:0] r4_s4, i4_s4, r5_s4, i5_s4, r6_s4, i6_s4, r7_s4, i7_s4;
    logic valid_s4;

    logic signed [7:0] r0_s5, i0_s5, r1_s5, i1_s5, r2_s5, i2_s5, r3_s5, i3_s5;
    logic signed [7:0] r4_s5, i4_s5, r5_s5, i5_s5, r6_s5, i6_s5, r7_s5, i7_s5;
    logic valid_s5;

    logic signed [7:0] r0_s6, i0_s6, r1_s6, i1_s6, r2_s6, i2_s6, r3_s6, i3_s6;
    logic signed [7:0] r4_s6, i4_s6, r5_s6, i5_s6, r6_s6, i6_s6, r7_s6, i7_s6;
    logic valid_s6;

    // Combinational signals for Stage 6 (H(2) & SWAP)
    logic signed [7:0] r0_temp, i0_temp, r1_temp, i1_temp, r2_temp, i2_temp, r3_temp, i3_temp;
    logic signed [7:0] r4_temp, i4_temp, r5_temp, i5_temp, r6_temp, i6_temp, r7_temp, i7_temp;

    always_comb begin
        r0_temp = saturate( ( (logic signed [31:0]'(r0_s5) + logic signed [31:0]'(r4_s5)) * 32'sd90 ) >>> 7 );
        i0_temp = saturate( ( (logic signed [31:0]'(i0_s5) + logic signed [31:0]'(i4_s5)) * 32'sd90 ) >>> 7 );
        r4_temp = saturate( ( (logic signed [31:0]'(r0_s5) - logic signed [31:0]'(r4_s5)) * 32'sd90 ) >>> 7 );
        i4_temp = saturate( ( (logic signed [31:0]'(i0_s5) - logic signed [31:0]'(i4_s5)) * 32'sd90 ) >>> 7 );

        r1_temp = saturate( ( (logic signed [31:0]'(r1_s5) + logic signed [31:0]'(r5_s5)) * 32'sd90 ) >>> 7 );
        i1_temp = saturate( ( (logic signed [31:0]'(i1_s5) + logic signed [31:0]'(i5_s5)) * 32'sd90 ) >>> 7 );
        r5_temp = saturate( ( (logic signed [31:0]'(r1_s5) - logic signed [31:0]'(r5_s5)) * 32'sd90 ) >>> 7 );
        i5_temp = saturate( ( (logic signed [31:0]'(i1_s5) - logic signed [31:0]'(i5_s5)) * 32'sd90 ) >>> 7 );

        r2_temp = saturate( ( (logic signed [31:0]'(r2_s5) + logic signed [31:0]'(r6_s5)) * 32'sd90 ) >>> 7 );
        i2_temp = saturate( ( (logic signed [31:0]'(i2_s5) + logic signed [31:0]'(i6_s5)) * 32'sd90 ) >>> 7 );
        r6_temp = saturate( ( (logic signed [31:0]'(r2_s5) - logic signed [31:0]'(r6_s5)) * 32'sd90 ) >>> 7 );
        i6_temp = saturate( ( (logic signed [31:0]'(i2_s5) - logic signed [31:0]'(i6_s5)) * 32'sd90 ) >>> 7 );

        r3_temp = saturate( ( (logic signed [31:0]'(r3_s5) + logic signed [31:0]'(r7_s5)) * 32'sd90 ) >>> 7 );
        i3_temp = saturate( ( (logic signed [31:0]'(i3_s5) + logic signed [31:0]'(i7_s5)) * 32'sd90 ) >>> 7 );
        r7_temp = saturate( ( (logic signed [31:0]'(r3_s5) - logic signed [31:0]'(r7_s5)) * 32'sd90 ) >>> 7 );
        i7_temp = saturate( ( (logic signed [31:0]'(i3_s5) - logic signed [31:0]'(i7_s5)) * 32'sd90 ) >>> 7 );
    end

    // Sequential Pipeline Logic
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_s1 <= 8'sd0; i0_s1 <= 8'sd0; r1_s1 <= 8'sd0; i1_s1 <= 8'sd0;
            r2_s1 <= 8'sd0; i2_s1 <= 8'sd0; r3_s1 <= 8'sd0; i3_s1 <= 8'sd0;
            r4_s1 <= 8'sd0; i4_s1 <= 8'sd0; r5_s1 <= 8'sd0; i5_s1 <= 8'sd0;
            r6_s1 <= 8'sd0; i6_s1 <= 8'sd0; r7_s1 <= 8'sd0; i7_s1 <= 8'sd0;
            valid_s1 <= 1'b0;

            r0_s2 <= 8'sd0; i0_s2 <= 8'sd0; r1_s2 <= 8'sd0; i1_s2 <= 8'sd0;
            r2_s2 <= 8'sd0; i2_s2 <= 8'sd0; r3_s2 <= 8'sd0; i3_s2 <= 8'sd0;
            r4_s2 <= 8'sd0; i4_s2 <= 8'sd0; r5_s2 <= 8'sd0; i5_s2 <= 8'sd0;
            r6_s2 <= 8'sd0; i6_s2 <= 8'sd0; r7_s2 <= 8'sd0; i7_s2 <= 8'sd0;
            valid_s2 <= 1'b0;

            r0_s3 <= 8'sd0; i0_s3 <= 8'sd0; r1_s3 <= 8'sd0; i1_s3 <= 8'sd0;
            r2_s3 <= 8'sd0; i2_s3 <= 8'sd0; r3_s3 <= 8'sd0; i3_s3 <= 8'sd0;
            r4_s3 <= 8'sd0; i4_s3 <= 8'sd0; r5_s3 <= 8'sd0; i5_s3 <= 8'sd0;
            r6_s3 <= 8'sd0; i6_s3 <= 8'sd0; r7_s3 <= 8'sd0; i7_s3 <= 8'sd0;
            valid_s3 <= 1'b0;

            r0_s4 <= 8'sd0; i0_s4 <= 8'sd0; r1_s4 <= 8'sd0; i1_s4 <= 8'sd0;
            r2_s4 <= 8'sd0; i2_s4 <= 8'sd0; r3_s4 <= 8'sd0; i3_s4 <= 8'sd0;
            r4_s4 <= 8'sd0; i4_s4 <= 8'sd0; r5_s4 <= 8'sd0; i5_s4 <= 8'sd0;
            r6_s4 <= 8'sd0; i6_s4 <= 8'sd0; r7_s4 <= 8'sd0; i7_s4 <= 8'sd0;
            valid_s4 <= 1'b0;

            r0_s5 <= 8'sd0; i0_s5 <= 8'sd0; r1_s5 <= 8'sd0; i1_s5 <= 8'sd0;
            r2_s5 <= 8'sd0; i2_s5 <= 8'sd0; r3_s5 <= 8'sd0; i3_s5 <= 8'sd0;
            r4_s5 <= 8'sd0; i4_s5 <= 8'sd0; r5_s5 <= 8'sd0; i5_s5 <= 8'sd0;
            r6_s5 <= 8'sd0; i6_s5 <= 8'sd0; r7_s5 <= 8'sd0; i7_s5 <= 8'sd0;
            valid_s5 <= 1'b0;

            r0_s6 <= 8'sd0; i0_s6 <= 8'sd0; r1_s6 <= 8'sd0; i1_s6 <= 8'sd0;
            r2_s6 <= 8'sd0; i2_s6 <= 8'sd0; r3_s6 <= 8'sd0; i3_s6 <= 8'sd0;
            r4_s6 <= 8'sd0; i4_s6 <= 8'sd0; r5_s6 <= 8'sd0; i5_s6 <= 8'sd0;
            r6_s6 <= 8'sd0; i6_s6 <= 8'sd0; r7_s6 <= 8'sd0; i7_s6 <= 8'sd0;
            valid_s6 <= 1'b0;
        end else begin
            // Stage 1: Hadamard on Qubit 0
            r0_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_0_0) + logic signed [31:0]'(io_in_QSV_1_0)) * 32'sd90 ) >>> 7 );
            i0_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_0_1) + logic signed [31:0]'(io_in_QSV_1_1)) * 32'sd90 ) >>> 7 );
            r1_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_0_0) - logic signed [31:0]'(io_in_QSV_1_0)) * 32'sd90 ) >>> 7 );
            i1_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_0_1) - logic signed [31:0]'(io_in_QSV_1_1)) * 32'sd90 ) >>> 7 );

            r2_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_2_0) + logic signed [31:0]'(io_in_QSV_3_0)) * 32'sd90 ) >>> 7 );
            i2_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_2_1) + logic signed [31:0]'(io_in_QSV_3_1)) * 32'sd90 ) >>> 7 );
            r3_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_2_0) - logic signed [31:0]'(io_in_QSV_3_0)) * 32'sd90 ) >>> 7 );
            i3_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_2_1) - logic signed [31:0]'(io_in_QSV_3_1)) * 32'sd90 ) >>> 7 );

            r4_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_4_0) + logic signed [31:0]'(io_in_QSV_5_0)) * 32'sd90 ) >>> 7 );
            i4_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_4_1) + logic signed [31:0]'(io_in_QSV_5_1)) * 32'sd90 ) >>> 7 );
            r5_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_4_0) - logic signed [31:0]'(io_in_QSV_5_0)) * 32'sd90 ) >>> 7 );
            i5_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_4_1) - logic signed [31:0]'(io_in_QSV_5_1)) * 32'sd90 ) >>> 7 );

            r6_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_6_0) + logic signed [31:0]'(io_in_QSV_7_0)) * 32'sd90 ) >>> 7 );
            i6_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_6_1) + logic signed [31:0]'(io_in_QSV_7_1)) * 32'sd90 ) >>> 7 );
            r7_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_6_0) - logic signed [31:0]'(io_in_QSV_7_0)) * 32'sd90 ) >>> 7 );
            i7_s1 <= saturate( ( (logic signed [31:0]'(io_in_QSV_6_1) - logic signed [31:0]'(io_in_QSV_7_1)) * 32'sd90 ) >>> 7 );
            valid_s1 <= io_in_valid;

            // Stage 2: Controlled-S on Qubits 1 and 0 (affects indices 3 and 7)
            r0_s2 <= r0_s1; i0_s2 <= i0_s1;
            r1_s2 <= r1_s1; i1_s2 <= i1_s1;
            r2_s2 <= r2_s1; i2_s2 <= i2_s1;
            r3_s2 <= (i3_s1 == -8'sd128) ? 8'sd127 : -i3_s1;
            i3_s2 <= r3_s1;
            r4_s2 <= r4_s1; i4_s2 <= i4_s1;
            r5_s2 <= r5_s1; i5_s2 <= i5_s1;
            r6_s2 <= r6_s1; i6_s2 <= i6_s1;
            r7_s2 <= (i7_s1 == -8'sd128) ? 8'sd127 : -i7_s1;
            i7_s2 <= r7_s1;
            valid_s2 <= valid_s1;

            // Stage 3: Controlled-Phase (pi/4) on Qubits 2 and 0 (affects indices 5 and 7)
            r0_s3 <= r0_s2; i0_s3 <= i0_s2;
            r1_s3 <= r1_s2; i1_s3 <= i1_s2;
            r2_s3 <= r2_s2; i2_s3 <= i2_s2;
            r3_s3 <= r3_s2; i3_s3 <= i3_s2;
            r4_s3 <= r4_s2; i4_s3 <= i4_s2;
            r5_s3 <= saturate( ( (logic signed [31:0]'(r5_s2) - logic signed [31:0]'(i5_s2)) * 32'sd90 ) >>> 7 );
            i5_s3 <= saturate( ( (logic signed [31:0]'(r5_s2) + logic signed [31:0]'(i5_s2)) * 32'sd90 ) >>> 7 );
            r6_s3 <= r6_s2; i6_s3 <= i6_s2;
            r7_s3 <= saturate( ( (logic signed [31:0]'(r7_s2) - logic signed [31:0]'(i7_s2)) * 32'sd90 ) >>> 7 );
            i7_s3 <= saturate( ( (logic signed [31:0]'(r7_s2) + logic signed [31:0]'(i7_s2)) * 32'sd90 ) >>> 7 );
            valid_s3 <= valid_s2;

            // Stage 4: Hadamard on Qubit 1
            r0_s4 <= saturate( ( (logic signed [31:0]'(r0_s3) + logic signed [31:0]'(r2_s3)) * 32'sd90 ) >>> 7 );
            i0_s4 <= saturate( ( (logic signed [31:0]'(i0_s3) + logic signed [31:0]'(i2_s3)) * 32'sd90 ) >>> 7 );
            r2_s4 <= saturate( ( (logic signed [31:0]'(r0_s3) - logic signed [31:0]'(r2_s3)) * 32'sd90 ) >>> 7 );
            i2_s4 <= saturate( ( (logic signed [31:0]'(i0_s3) - logic signed [31:0]'(i2_s3)) * 32'sd90 ) >>> 7 );

            r1_s4 <= saturate( ( (logic signed [31:0]'(r1_s3) + logic signed [31:0]'(r3_s3)) * 32'sd90 ) >>> 7 );
            i1_s4 <= saturate( ( (logic signed [31:0]'(i1_s3) + logic signed [31:0]'(i3_s3)) * 32'sd90 ) >>> 7 );
            r3_s4 <= saturate( ( (logic signed [31:0]'(r1_s3) - logic signed [31:0]'(r3_s3)) * 32'sd90 ) >>> 7 );
            i3_s4 <= saturate( ( (logic signed [31:0]'(i1_s3) - logic signed [31:0]'(i3_s3)) * 32'sd90 ) >>> 7 );

            r4_s4 <= saturate( ( (logic signed [31:0]'(r4_s3) + logic signed [31:0]'(r6_s3)) * 32'sd90 ) >>> 7 );
            i4_s4 <= saturate( ( (logic signed [31:0]'(i4_s3) + logic signed [31:0]'(i6_s3)) * 32'sd90 ) >>> 7 );
            r6_s4 <= saturate( ( (logic signed [31:0]'(r4_s3) - logic signed [31:0]'(r6_s3)) * 32'sd90 ) >>> 7 );
            i6_s4 <= saturate( ( (logic signed [31:0]'(i4_s3) - logic signed [31:0]'(i6_s3)) * 32'sd90 ) >>> 7 );

            r5_s4 <= saturate( ( (logic signed [31:0]'(r5_s3) + logic signed [31:0]'(r7_s3)) * 32'sd90 ) >>> 7 );
            i5_s4 <= saturate( ( (logic signed [31:0]'(i5_s3) + logic signed [31:0]'(i7_s3)) * 32'sd90 ) >>> 7 );
            r7_s4 <= saturate( ( (logic signed [31:0]'(r5_s3) - logic signed [31:0]'(r7_s3)) * 32'sd90 ) >>> 7 );
            i7_s4 <= saturate( ( (logic signed [31:0]'(i5_s3) - logic signed [31:0]'(i7_s3)) * 32'sd90 ) >>> 7 );
            valid_s4 <= valid_s3;

            // Stage 5: Controlled-S on Qubits 2 and 1 (affects indices 6 and 7)
            r0_s5 <= r0_s4; i0_s5 <= i0_s4;
            r1_s5 <= r1_s4; i1_s5 <= i1_s4;
            r2_s5 <= r2_s4; i2_s5 <= i2_s4;
            r3_s5 <= r3_s4; i3_s5 <= i3_s4;
            r4_s5 <= r4_s4; i4_s5 <= i4_s4;
            r5_s5 <= r5_s4; i5_s5 <= i5_s4;
            r6_s5 <= (i6_s4 == -8'sd128) ? 8'sd127 : -i6_s4;
            i6_s5 <= r6_s4;
            r7_s5 <= (i7_s4 == -8'sd128) ? 8'sd127 : -i7_s4;
            i7_s5 <= r7_s4;
            valid_s5 <= valid_s4;

            // Stage 6: Hadamard on Qubit 2 & Swap Qubits 0 and 2
            r0_s6 <= r0_temp; i0_s6 <= i0_temp;
            r1_s6 <= r4_temp; i1_s6 <= i4_temp;
            r2_s6 <= r2_temp; i2_s6 <= i2_temp;
            r3_s6 <= r6_temp; i3_s6 <= i6_temp;
            r4_s6 <= r1_temp; i4_s6 <= i1_temp;
            r5_s6 <= r5_temp; i5_s6 <= i5_temp;
            r6_s6 <= r3_temp; i6_s6 <= i3_temp;
            r7_s6 <= r7_temp; i7_s6 <= i7_temp;
            valid_s6 <= valid_s5;
        end
    end

    // Output Assignment
    assign io_out_QSV_0_0 = r0_s6;
    assign io_out_QSV_0_1 = i0_s6;
    assign io_out_QSV_1_0 = r1_s6;
    assign io_out_QSV_1_1 = i1_s6;
    assign io_out_QSV_2_0 = r2_s6;
    assign io_out_QSV_2_1 = i2_s6;
    assign io_out_QSV_3_0 = r3_s6;
    assign io_out_QSV_3_1 = i3_s6;
    assign io_out_QSV_4_0 = r4_s6;
    assign io_out_QSV_4_1 = i4_s6;
    assign io_out_QSV_5_0 = r5_s6;
    assign io_out_QSV_5_1 = i5_s6;
    assign io_out_QSV_6_0 = r6_s6;
    assign io_out_QSV_6_1 = i6_s6;
    assign io_out_QSV_7_0 = r7_s6;
    assign io_out_QSV_7_1 = i7_s6;
    assign io_out_valid   = valid_s6;

endmodule
