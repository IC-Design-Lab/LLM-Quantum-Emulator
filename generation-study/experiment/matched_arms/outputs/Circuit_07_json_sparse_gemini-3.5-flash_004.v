module Circuit_07 (
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

    // Cast inputs to signed
    wire signed [15:0] s0_r0 = signed'(io_in_QSV_0_0);
    wire signed [15:0] s0_i0 = signed'(io_in_QSV_0_1);
    wire signed [15:0] s0_r1 = signed'(io_in_QSV_1_0);
    wire signed [15:0] s0_i1 = signed'(io_in_QSV_1_1);
    wire signed [15:0] s0_r2 = signed'(io_in_QSV_2_0);
    wire signed [15:0] s0_i2 = signed'(io_in_QSV_2_1);
    wire signed [15:0] s0_r3 = signed'(io_in_QSV_3_0);
    wire signed [15:0] s0_i3 = signed'(io_in_QSV_3_1);
    wire               s0_valid = io_in_valid;

    // --- Stage 1: Step 0 (H on qubit 0) ---
    logic signed [15:0] s1_r0, s1_i0, s1_r1, s1_i1, s1_r2, s1_i2, s1_r3, s1_i3;
    logic               s1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s1_r0    <= '0;
            s1_i0    <= '0;
            s1_r1    <= '0;
            s1_i1    <= '0;
            s1_r2    <= '0;
            s1_i2    <= '0;
            s1_r3    <= '0;
            s1_i3    <= '0;
            s1_valid <= 1'b0;
        end else begin
            s1_valid <= s0_valid;
            if (s0_valid) begin
                s1_r0 <= 16'((( (32'(s0_r0) + 32'(s0_r1)) * 23170 ) + 16384) >>> 15);
                s1_i0 <= 16'((( (32'(s0_i0) + 32'(s0_i1)) * 23170 ) + 16384) >>> 15);
                s1_r1 <= 16'((( (32'(s0_r0) - 32'(s0_r1)) * 23170 ) + 16384) >>> 15);
                s1_i1 <= 16'((( (32'(s0_i0) - 32'(s0_i1)) * 23170 ) + 16384) >>> 15);

                s1_r2 <= 16'((( (32'(s0_r2) + 32'(s0_r3)) * 23170 ) + 16384) >>> 15);
                s1_i2 <= 16'((( (32'(s0_i2) + 32'(s0_i3)) * 23170 ) + 16384) >>> 15);
                s1_r3 <= 16'((( (32'(s0_r2) - 32'(s0_r3)) * 23170 ) + 16384) >>> 15);
                s1_i3 <= 16'((( (32'(s0_i2) - 32'(s0_i3)) * 23170 ) + 16384) >>> 15);
            end
        end
    end

    // --- Stage 2: Step 1 (CX with Control=0, Target=1) ---
    // Under binary representation, Q0 is LSB, Q1 is MSB.
    // Control Q0=1 means we invert Q1.
    // States 1 (|01>) and 3 (|11>) are swapped.
    logic signed [15:0] s2_r0, s2_i0, s2_r1, s2_i1, s2_r2, s2_i2, s2_r3, s2_i3;
    logic               s2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s2_r0    <= '0;
            s2_i0    <= '0;
            s2_r1    <= '0;
            s2_i1    <= '0;
            s2_r2    <= '0;
            s2_i2    <= '0;
            s2_r3    <= '0;
            s2_i3    <= '0;
            s2_valid <= 1'b0;
        end else begin
            s2_valid <= s1_valid;
            if (s1_valid) begin
                s2_r0 <= s1_r0;
                s2_i0 <= s1_i0;
                s2_r1 <= s1_r3; // swapped
                s2_i1 <= s1_i3; // swapped
                s2_r2 <= s1_r2;
                s2_i2 <= s1_i2;
                s2_r3 <= s1_r1; // swapped
                s2_i3 <= s1_i1; // swapped
            end
        end
    end

    // --- Stage 3: Step 2 (H on qubit 0) ---
    logic signed [15:0] s3_r0, s3_i0, s3_r1, s3_i1, s3_r2, s3_i2, s3_r3, s3_i3;
    logic               s3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s3_r0    <= '0;
            s3_i0    <= '0;
            s3_r1    <= '0;
            s3_i1    <= '0;
            s3_r2    <= '0;
            s3_i2    <= '0;
            s3_r3    <= '0;
            s3_i3    <= '0;
            s3_valid <= 1'b0;
        end else begin
            s3_valid <= s2_valid;
            if (s2_valid) begin
                s3_r0 <= 16'((( (32'(s2_r0) + 32'(s2_r1)) * 23170 ) + 16384) >>> 15);
                s3_i0 <= 16'((( (32'(s2_i0) + 32'(s2_i1)) * 23170 ) + 16384) >>> 15);
                s3_r1 <= 16'((( (32'(s2_r0) - 32'(s2_r1)) * 23170 ) + 16384) >>> 15);
                s3_i1 <= 16'((( (32'(s2_i0) - 32'(s2_i1)) * 23170 ) + 16384) >>> 15);

                s3_r2 <= 16'((( (32'(s2_r2) + 32'(s2_r3)) * 23170 ) + 16384) >>> 15);
                s3_i2 <= 16'((( (32'(s2_i2) + 32'(s2_i3)) * 23170 ) + 16384) >>> 15);
                s3_r3 <= 16'((( (32'(s2_r2) - 32'(s2_r3)) * 23170 ) + 16384) >>> 15);
                s3_i3 <= 16'((( (32'(s2_i2) - 32'(s2_i3)) * 23170 ) + 16384) >>> 15);
            end
        end
    end

    // Assign outputs
    assign io_out_QSV_0_0 = s3_r0;
    assign io_out_QSV_0_1 = s3_i0;
    assign io_out_QSV_1_0 = s3_r1;
    assign io_out_QSV_1_1 = s3_i1;
    assign io_out_QSV_2_0 = s3_r2;
    assign io_out_QSV_2_1 = s3_i2;
    assign io_out_QSV_3_0 = s3_r3;
    assign io_out_QSV_3_1 = s3_i3;
    assign io_out_valid   = s3_valid;

endmodule
