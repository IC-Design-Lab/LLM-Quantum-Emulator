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
    wire signed [15:0] in_0_0 = signed'(io_in_QSV_0_0);
    wire signed [15:0] in_0_1 = signed'(io_in_QSV_0_1);
    wire signed [15:0] in_1_0 = signed'(io_in_QSV_1_0);
    wire signed [15:0] in_1_1 = signed'(io_in_QSV_1_1);
    wire signed [15:0] in_2_0 = signed'(io_in_QSV_2_0);
    wire signed [15:0] in_2_1 = signed'(io_in_QSV_2_1);
    wire signed [15:0] in_3_0 = signed'(io_in_QSV_3_0);
    wire signed [15:0] in_3_1 = signed'(io_in_QSV_3_1);

    // Step 0: H on Qubit 0
    // State 0 and State 1 are paired (differ on LSB)
    // State 2 and State 3 are paired (differ on LSB)
    wire signed [31:0] sum_01_0 = (in_0_0 + in_1_0) * 32'sd23170;
    wire signed [31:0] sum_01_1 = (in_0_1 + in_1_1) * 32'sd23170;
    wire signed [31:0] diff_01_0 = (in_0_0 - in_1_0) * 32'sd23170;
    wire signed [31:0] diff_01_1 = (in_0_1 - in_1_1) * 32'sd23170;
    
    wire signed [31:0] sum_23_0 = (in_2_0 + in_3_0) * 32'sd23170;
    wire signed [31:0] sum_23_1 = (in_2_1 + in_3_1) * 32'sd23170;
    wire signed [31:0] diff_23_0 = (in_2_0 - in_3_0) * 32'sd23170;
    wire signed [31:0] diff_23_1 = (in_2_1 - in_3_1) * 32'sd23170;

    reg signed [15:0] r1_0_0, r1_0_1, r1_1_0, r1_1_1;
    reg signed [15:0] r1_2_0, r1_2_1, r1_3_0, r1_3_1;
    reg r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_0_0   <= 16'sb0;
            r1_0_1   <= 16'sb0;
            r1_1_0   <= 16'sb0;
            r1_1_1   <= 16'sb0;
            r1_2_0   <= 16'sb0;
            r1_2_1   <= 16'sb0;
            r1_3_0   <= 16'sb0;
            r1_3_1   <= 16'sb0;
            r1_valid <= 1'b0;
        end else begin
            r1_0_0   <= 16'(sum_01_0 >>> 15);
            r1_0_1   <= 16'(sum_01_1 >>> 15);
            r1_1_0   <= 16'(diff_01_0 >>> 15);
            r1_1_1   <= 16'(diff_01_1 >>> 15);
            r1_2_0   <= 16'(sum_23_0 >>> 15);
            r1_2_1   <= 16'(sum_23_1 >>> 15);
            r1_3_0   <= 16'(diff_23_0 >>> 15);
            r1_3_1   <= 16'(diff_23_1 >>> 15);
            r1_valid <= io_in_valid;
        end
    end

    // Step 1: CX (Control Q0, Target Q1)
    // If Q0 (LSB) is 1, flip Q1 (MSB) -> Swaps state 1 (|01>) and state 3 (|11>)
    reg signed [15:0] r2_0_0, r2_0_1, r2_1_0, r2_1_1;
    reg signed [15:0] r2_2_0, r2_2_1, r2_3_0, r2_3_1;
    reg r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_0_0   <= 16'sb0;
            r2_0_1   <= 16'sb0;
            r2_1_0   <= 16'sb0;
            r2_1_1   <= 16'sb0;
            r2_2_0   <= 16'sb0;
            r2_2_1   <= 16'sb0;
            r2_3_0   <= 16'sb0;
            r2_3_1   <= 16'sb0;
            r2_valid <= 1'b0;
        end else begin
            r2_0_0   <= r1_0_0;
            r2_0_1   <= r1_0_1;
            r2_1_0   <= r1_3_0; // Swapped with 3
            r2_1_1   <= r1_3_1; // Swapped with 3
            r2_2_0   <= r1_2_0;
            r2_2_1   <= r1_2_1;
            r2_3_0   <= r1_1_0; // Swapped with 1
            r2_3_1   <= r1_1_1; // Swapped with 1
            r2_valid <= r1_valid;
        end
    end

    // Step 2: H on Qubit 0
    wire signed [31:0] sum_r2_01_0 = (r2_0_0 + r2_1_0) * 32'sd23170;
    wire signed [31:0] sum_r2_01_1 = (r2_0_1 + r2_1_1) * 32'sd23170;
    wire signed [31:0] diff_r2_01_0 = (r2_0_0 - r2_1_0) * 32'sd23170;
    wire signed [31:0] diff_r2_01_1 = (r2_0_1 - r2_1_1) * 32'sd23170;
    
    wire signed [31:0] sum_r2_23_0 = (r2_2_0 + r2_3_0) * 32'sd23170;
    wire signed [31:0] sum_r2_23_1 = (r2_2_1 + r2_3_1) * 32'sd23170;
    wire signed [31:0] diff_r2_23_0 = (r2_2_0 - r2_3_0) * 32'sd23170;
    wire signed [31:0] diff_r2_23_1 = (r2_2_1 - r2_3_1) * 32'sd23170;

    reg signed [15:0] r3_0_0, r3_0_1, r3_1_0, r3_1_1;
    reg signed [15:0] r3_2_0, r3_2_1, r3_3_0, r3_3_1;
    reg r3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_0_0   <= 16'sb0;
            r3_0_1   <= 16'sb0;
            r3_1_0   <= 16'sb0;
            r3_1_1   <= 16'sb0;
            r3_2_0   <= 16'sb0;
            r3_2_1   <= 16'sb0;
            r3_3_0   <= 16'sb0;
            r3_3_1   <= 16'sb0;
            r3_valid <= 1'b0;
        end else begin
            r3_0_0   <= 16'(sum_r2_01_0 >>> 15);
            r3_0_1   <= 16'(sum_r2_01_1 >>> 15);
            r3_1_0   <= 16'(diff_r2_01_0 >>> 15);
            r3_1_1   <= 16'(diff_r2_01_1 >>> 15);
            r3_2_0   <= 16'(sum_r2_23_0 >>> 15);
            r3_2_1   <= 16'(sum_r2_23_1 >>> 15);
            r3_3_0   <= 16'(diff_r2_23_0 >>> 15);
            r3_3_1   <= 16'(diff_r2_23_1 >>> 15);
            r3_valid <= r2_valid;
        end
    end

    // Outputs
    assign io_out_QSV_0_0 = r3_0_0;
    assign io_out_QSV_0_1 = r3_0_1;
    assign io_out_QSV_1_0 = r3_1_0;
    assign io_out_QSV_1_1 = r3_1_1;
    assign io_out_QSV_2_0 = r3_2_0;
    assign io_out_QSV_2_1 = r3_2_1;
    assign io_out_QSV_3_0 = r3_3_0;
    assign io_out_QSV_3_1 = r3_3_1;
    assign io_out_valid   = r3_valid;

endmodule
