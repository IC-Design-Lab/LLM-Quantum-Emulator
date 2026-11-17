module Circuit_06 (
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

  // Constant for 1/sqrt(2) in Q15 format: 0.707106 * 32768 = 23170
  localparam signed [16:0] COEFF = 17'sd23170;

  // Signed interpretation of inputs
  wire signed [15:0] in_0_0 = io_in_QSV_0_0;
  wire signed [15:0] in_0_1 = io_in_QSV_0_1;
  wire signed [15:0] in_1_0 = io_in_QSV_1_0;
  wire signed [15:0] in_1_1 = io_in_QSV_1_1;
  wire signed [15:0] in_2_0 = io_in_QSV_2_0;
  wire signed [15:0] in_2_1 = io_in_QSV_2_1;
  wire signed [15:0] in_3_0 = io_in_QSV_3_0;
  wire signed [15:0] in_3_1 = io_in_QSV_3_1;

  // Intermediate sums and products for Stage 1 (H on q0)
  wire signed [16:0] sum_0_0 = in_0_0 + in_1_0;
  wire signed [16:0] sum_0_1 = in_0_1 + in_1_1;
  wire signed [16:0] diff_0_0 = in_0_0 - in_1_0;
  wire signed [16:0] diff_0_1 = in_0_1 - in_1_1;

  wire signed [16:0] sum_1_0 = in_2_0 + in_3_0;
  wire signed [16:0] sum_1_1 = in_2_1 + in_3_1;
  wire signed [16:0] diff_1_0 = in_2_0 - in_3_0;
  wire signed [16:0] diff_1_1 = in_2_1 - in_3_1;

  wire signed [33:0] prod_0_0 = sum_0_0 * COEFF;
  wire signed [33:0] prod_0_1 = sum_0_1 * COEFF;
  wire signed [33:0] prod_1_0 = diff_0_0 * COEFF;
  wire signed [33:0] prod_1_1 = diff_0_1 * COEFF;

  wire signed [33:0] prod_2_0 = sum_1_0 * COEFF;
  wire signed [33:0] prod_2_1 = sum_1_1 * COEFF;
  wire signed [33:0] prod_3_0 = diff_1_0 * COEFF;
  wire signed [33:0] prod_3_1 = diff_1_1 * COEFF;

  // Stage 1 Registers
  logic signed [15:0] reg_B0_0, reg_B0_1;
  logic signed [15:0] reg_B1_0, reg_B1_1;
  logic signed [15:0] reg_B2_0, reg_B2_1;
  logic signed [15:0] reg_B3_0, reg_B3_1;
  logic reg_valid_1;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      reg_B0_0    <= '0;
      reg_B0_1    <= '0;
      reg_B1_0    <= '0;
      reg_B1_1    <= '0;
      reg_B2_0    <= '0;
      reg_B2_1    <= '0;
      reg_B3_0    <= '0;
      reg_B3_1    <= '0;
      reg_valid_1 <= 1'b0;
    end else begin
      reg_B0_0    <= 16'(prod_0_0 >>> 15);
      reg_B0_1    <= 16'(prod_0_1 >>> 15);
      reg_B1_0    <= 16'(prod_1_0 >>> 15);
      reg_B1_1    <= 16'(prod_1_1 >>> 15);
      reg_B2_0    <= 16'(prod_2_0 >>> 15);
      reg_B2_1    <= 16'(prod_2_1 >>> 15);
      reg_B3_0    <= 16'(prod_3_0 >>> 15);
      reg_B3_1    <= 16'(prod_3_1 >>> 15);
      reg_valid_1 <= io_in_valid;
    end
  end

  // Stage 2 Registers (CX on q0 -> q1; swapping B1 and B3)
  logic [15:0] reg_out_0_0, reg_out_0_1;
  logic [15:0] reg_out_1_0, reg_out_1_1;
  logic [15:0] reg_out_2_0, reg_out_2_1;
  logic [15:0] reg_out_3_0, reg_out_3_1;
  logic reg_valid_2;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      reg_out_0_0 <= '0;
      reg_out_0_1 <= '0;
      reg_out_1_0 <= '0;
      reg_out_1_1 <= '0;
      reg_out_2_0 <= '0;
      reg_out_2_1 <= '0;
      reg_out_3_0 <= '0;
      reg_out_3_1 <= '0;
      reg_valid_2 <= 1'b0;
    end else begin
      reg_out_0_0 <= reg_B0_0;
      reg_out_0_1 <= reg_B0_1;
      reg_out_1_0 <= reg_B3_0; // Swap (target flip when control is 1)
      reg_out_1_1 <= reg_B3_1; // Swap (target flip when control is 1)
      reg_out_2_0 <= reg_B2_0;
      reg_out_2_1 <= reg_B2_1;
      reg_out_3_0 <= reg_B1_0; // Swap (target flip when control is 1)
      reg_out_3_1 <= reg_B1_1; // Swap (target flip when control is 1)
      reg_valid_2 <= reg_valid_1;
    end
  end

  // Output assignments
  assign io_out_QSV_0_0 = reg_out_0_0;
  assign io_out_QSV_0_1 = reg_out_0_1;
  assign io_out_QSV_1_0 = reg_out_1_0;
  assign io_out_QSV_1_1 = reg_out_1_1;
  assign io_out_QSV_2_0 = reg_out_2_0;
  assign io_out_QSV_2_1 = reg_out_2_1;
  assign io_out_QSV_3_0 = reg_out_3_0;
  assign io_out_QSV_3_1 = reg_out_3_1;
  assign io_out_valid   = reg_valid_2;

endmodule
