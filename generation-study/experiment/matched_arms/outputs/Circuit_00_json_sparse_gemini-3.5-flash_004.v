module Circuit_00 (
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

    // Q15 coefficient for 1/sqrt(2)
    localparam signed [15:0] H_COEF = 16'sd23170;

    // Intermediate sum/diff signals for Stage 1 (Hadamard on qubit 0)
    wire signed [16:0] sum_0_0 = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    wire signed [16:0] diff_1_0 = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    wire signed [16:0] sum_2_0 = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    wire signed [16:0] diff_3_0 = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);

    wire signed [16:0] sum_0_1 = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    wire signed [16:0] diff_1_1 = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);
    wire signed [16:0] sum_2_1 = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    wire signed [16:0] diff_3_1 = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    wire signed [32:0] prod_0_0 = sum_0_0 * H_COEF;
    wire signed [32:0] prod_1_0 = diff_1_0 * H_COEF;
    wire signed [32:0] prod_2_0 = sum_2_0 * H_COEF;
    wire signed [32:0] prod_3_0 = diff_3_0 * H_COEF;

    wire signed [32:0] prod_0_1 = sum_0_1 * H_COEF;
    wire signed [32:0] prod_1_1 = diff_1_1 * H_COEF;
    wire signed [32:0] prod_2_1 = sum_2_1 * H_COEF;
    wire signed [32:0] prod_3_1 = diff_3_1 * H_COEF;

    wire signed [15:0] h_out_0_0 = (prod_0_0 + 33'sh4000) >>> 15;
    wire signed [15:0] h_out_1_0 = (prod_1_0 + 33'sh4000) >>> 15;
    wire signed [15:0] h_out_2_0 = (prod_2_0 + 33'sh4000) >>> 15;
    wire signed [15:0] h_out_3_0 = (prod_3_0 + 33'sh4000) >>> 15;

    wire signed [15:0] h_out_0_1 = (prod_0_1 + 33'sh4000) >>> 15;
    wire signed [15:0] h_out_1_1 = (prod_1_1 + 33'sh4000) >>> 15;
    wire signed [15:0] h_out_2_1 = (prod_2_1 + 33'sh4000) >>> 15;
    wire signed [15:0] h_out_3_1 = (prod_3_1 + 33'sh4000) >>> 15;

    // Stage 1 registers
    logic [15:0] r1_QSV_0_0, r1_QSV_0_1;
    logic [15:0] r1_QSV_1_0, r1_QSV_1_1;
    logic [15:0] r1_QSV_2_0, r1_QSV_2_1;
    logic [15:0] r1_QSV_3_0, r1_QSV_3_1;
    logic        r1_valid;

    always_ff @(posedge clock) begin
        if (reset) begin
            r1_QSV_0_0 <= 16'h0;
            r1_QSV_0_1 <= 16'h0;
            r1_QSV_1_0 <= 16'h0;
            r1_QSV_1_1 <= 16'h0;
            r1_QSV_2_0 <= 16'h0;
            r1_QSV_2_1 <= 16'h0;
            r1_QSV_3_0 <= 16'h0;
            r1_QSV_3_1 <= 16'h0;
            r1_valid   <= 1'b0;
        end else begin
            r1_QSV_0_0 <= h_out_0_0;
            r1_QSV_0_1 <= h_out_0_1;
            r1_QSV_1_0 <= h_out_1_0;
            r1_QSV_1_1 <= h_out_1_1;
            r1_QSV_2_0 <= h_out_2_0;
            r1_QSV_2_1 <= h_out_2_1;
            r1_QSV_3_0 <= h_out_3_0;
            r1_QSV_3_1 <= h_out_3_1;
            r1_valid   <= io_in_valid;
        end
    end

    // Stage 2 registers (SWAP on qubits 0 and 1)
    always_ff @(posedge clock) begin
        if (reset) begin
            io_out_QSV_0_0 <= 16'h0;
            io_out_QSV_0_1 <= 16'h0;
            io_out_QSV_1_0 <= 16'h0;
            io_out_QSV_1_1 <= 16'h0;
            io_out_QSV_2_0 <= 16'h0;
            io_out_QSV_2_1 <= 16'h0;
            io_out_QSV_3_0 <= 16'h0;
            io_out_QSV_3_1 <= 16'h0;
            io_out_valid   <= 1'b0;
        end else begin
            io_out_QSV_0_0 <= r1_QSV_0_0;
            io_out_QSV_0_1 <= r1_QSV_0_1;
            io_out_QSV_1_0 <= r1_QSV_2_0; // SWAP 1 and 2
            io_out_QSV_1_1 <= r1_QSV_2_1;
            io_out_QSV_2_0 <= r1_QSV_1_0; // SWAP 2 and 1
            io_out_QSV_2_1 <= r1_QSV_1_1;
            io_out_QSV_3_0 <= r1_QSV_3_0;
            io_out_QSV_3_1 <= r1_QSV_3_1;
            io_out_valid   <= r1_valid;
        end
    end

endmodule
