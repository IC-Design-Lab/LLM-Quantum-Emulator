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

    // Stage 1 Registers (H on Q0)
    logic signed [15:0] s1_r0_0, s1_r0_1;
    logic signed [15:0] s1_r1_0, s1_r1_1;
    logic signed [15:0] s1_r2_0, s1_r2_1;
    logic signed [15:0] s1_r3_0, s1_r3_1;
    logic s1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s1_r0_0  <= '0;
            s1_r0_1  <= '0;
            s1_r1_0  <= '0;
            s1_r1_1  <= '0;
            s1_r2_0  <= '0;
            s1_r2_1  <= '0;
            s1_r3_0  <= '0;
            s1_r3_1  <= '0;
            s1_valid <= 1'b0;
        end else begin
            s1_valid <= io_in_valid;
            if (io_in_valid) begin
                // Pair 0 & 1
                s1_r0_0 <= 16'(( ($signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0)) * 17'sd23170 ) >>> 15);
                s1_r0_1 <= 16'(( ($signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1)) * 17'sd23170 ) >>> 15);
                s1_r1_0 <= 16'(( ($signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0)) * 17'sd23170 ) >>> 15);
                s1_r1_1 <= 16'(( ($signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1)) * 17'sd23170 ) >>> 15);

                // Pair 2 & 3
                s1_r2_0 <= 16'(( ($signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0)) * 17'sd23170 ) >>> 15);
                s1_r2_1 <= 16'(( ($signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1)) * 17'sd23170 ) >>> 15);
                s1_r3_0 <= 16'(( ($signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0)) * 17'sd23170 ) >>> 15);
                s1_r3_1 <= 16'(( ($signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1)) * 17'sd23170 ) >>> 15);
            end
        end
    end

    // Stage 2 Registers (CX on Q0, Q1)
    logic signed [15:0] s2_r0_0, s2_r0_1;
    logic signed [15:0] s2_r1_0, s2_r1_1;
    logic signed [15:0] s2_r2_0, s2_r2_1;
    logic signed [15:0] s2_r3_0, s2_r3_1;
    logic s2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s2_r0_0  <= '0;
            s2_r0_1  <= '0;
            s2_r1_0  <= '0;
            s2_r1_1  <= '0;
            s2_r2_0  <= '0;
            s2_r2_1  <= '0;
            s2_r3_0  <= '0;
            s2_r3_1  <= '0;
            s2_valid <= 1'b0;
        end else begin
            s2_valid <= s1_valid;
            if (s1_valid) begin
                s2_r0_0 <= s1_r0_0;
                s2_r0_1 <= s1_r0_1;
                
                // Swap 1 and 3 (Control Q0=1, flip Q1)
                s2_r1_0 <= s1_r3_0;
                s2_r1_1 <= s1_r3_1;
                
                s2_r2_0 <= s1_r2_0;
                s2_r2_1 <= s1_r2_1;
                
                s2_r3_0 <= s1_r1_0;
                s2_r3_1 <= s1_r1_1;
            end
        end
    end

    // Stage 3 Registers (SX on Q0)
    logic signed [15:0] s3_r0_0, s3_r0_1;
    logic signed [15:0] s3_r1_0, s3_r1_1;
    logic signed [15:0] s3_r2_0, s3_r2_1;
    logic signed [15:0] s3_r3_0, s3_r3_1;
    logic s3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s3_r0_0  <= '0;
            s3_r0_1  <= '0;
            s3_r1_0  <= '0;
            s3_r1_1  <= '0;
            s3_r2_0  <= '0;
            s3_r2_1  <= '0;
            s3_r3_0  <= '0;
            s3_r3_1  <= '0;
            s3_valid <= 1'b0;
        end else begin
            s3_valid <= s2_valid;
            if (s2_valid) begin
                // Pair 0 & 1
                s3_r0_0 <= 16'(( $signed(s2_r0_0) - $signed(s2_r0_1) + $signed(s2_r1_0) + $signed(s2_r1_1) ) >>> 1);
                s3_r0_1 <= 16'(( $signed(s2_r0_0) + $signed(s2_r0_1) - $signed(s2_r1_0) + $signed(s2_r1_1) ) >>> 1);
                s3_r1_0 <= 16'(( $signed(s2_r0_0) + $signed(s2_r0_1) + $signed(s2_r1_0) - $signed(s2_r1_1) ) >>> 1);
                s3_r1_1 <= 16'(( -$signed(s2_r0_0) + $signed(s2_r0_1) + $signed(s2_r1_0) + $signed(s2_r1_1) ) >>> 1);

                // Pair 2 & 3
                s3_r2_0 <= 16'(( $signed(s2_r2_0) - $signed(s2_r2_1) + $signed(s2_r3_0) + $signed(s2_r3_1) ) >>> 1);
                s3_r2_1 <= 16'(( $signed(s2_r2_0) + $signed(s2_r2_1) - $signed(s2_r3_0) + $signed(s2_r3_1) ) >>> 1);
                s3_r3_0 <= 16'(( $signed(s2_r2_0) + $signed(s2_r2_1) + $signed(s2_r3_0) - $signed(s2_r3_1) ) >>> 1);
                s3_r3_1 <= 16'(( -$signed(s2_r2_0) + $signed(s2_r2_1) + $signed(s2_r3_0) + $signed(s2_r3_1) ) >>> 1);
            end
        end
    end

    // Output Assignment
    assign io_out_QSV_0_0 = s3_r0_0;
    assign io_out_QSV_0_1 = s3_r0_1;
    assign io_out_QSV_1_0 = s3_r1_0;
    assign io_out_QSV_1_1 = s3_r1_1;
    assign io_out_QSV_2_0 = s3_r2_0;
    assign io_out_QSV_2_1 = s3_r2_1;
    assign io_out_QSV_3_0 = s3_r3_0;
    assign io_out_QSV_3_1 = s3_r3_1;
    assign io_out_valid   = s3_valid;

endmodule
