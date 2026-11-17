`default_nettype none

module Circuit_03 (
    input  wire        clock,
    input  wire        reset,
    input  wire [15:0] io_in_QSV_0_0,
    input  wire [15:0] io_in_QSV_0_1,
    input  wire [15:0] io_in_QSV_1_0,
    input  wire [15:0] io_in_QSV_1_1,
    input  wire [15:0] io_in_QSV_2_0,
    input  wire [15:0] io_in_QSV_2_1,
    input  wire [15:0] io_in_QSV_3_0,
    input  wire [15:0] io_in_QSV_3_1,
    input  wire        io_in_valid,
    output reg  [15:0] io_out_QSV_0_0,
    output reg  [15:0] io_out_QSV_0_1,
    output reg  [15:0] io_out_QSV_1_0,
    output reg  [15:0] io_out_QSV_1_1,
    output reg  [15:0] io_out_QSV_2_0,
    output reg  [15:0] io_out_QSV_2_1,
    output reg  [15:0] io_out_QSV_3_0,
    output reg  [15:0] io_out_QSV_3_1,
    output reg         io_out_valid
);

  // Fixed-point scaling multiplication function: 17-bit * 16-bit -> 16-bit Q1.15
  function automatic logic signed [15:0] qmul_17(logic signed [16:0] a, logic signed [15:0] b);
    logic signed [32:0] prod;
    prod = a * b;
    prod = prod + 33'sd16384; // Rounding
    return 16'(prod >>> 15);
  endfunction

  // Step 0: H on qubit 0 (mixes states 0-1 and 2-3)
  logic signed [16:0] step0_sum_0_r, step0_sub_0_r;
  logic signed [16:0] step0_sum_0_i, step0_sub_0_i;
  logic signed [16:0] step0_sum_1_r, step0_sub_1_r;
  logic signed [16:0] step0_sum_1_i, step0_sub_1_i;

  assign step0_sum_0_r = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
  assign step0_sub_0_r = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
  assign step0_sum_0_i = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
  assign step0_sub_0_i = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

  assign step0_sum_1_r = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
  assign step0_sub_1_r = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
  assign step0_sum_1_i = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
  assign step0_sub_1_i = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

  logic signed [15:0] r0_s1, i0_s1, r1_s1, i1_s1;
  logic signed [15:0] r2_s1, i2_s1, r3_s1, i3_s1;
  logic valid_s1;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      r0_s1    <= 16'sh0;
      i0_s1    <= 16'sh0;
      r1_s1    <= 16'sh0;
      i1_s1    <= 16'sh0;
      r2_s1    <= 16'sh0;
      i2_s1    <= 16'sh0;
      r3_s1    <= 16'sh0;
      i3_s1    <= 16'sh0;
      valid_s1 <= 1'b0;
    end else begin
      r0_s1    <= qmul_17(step0_sum_0_r, 16'sh5A82);
      i0_s1    <= qmul_17(step0_sum_0_i, 16'sh5A82);
      r1_s1    <= qmul_17(step0_sub_0_r, 16'sh5A82);
      i1_s1    <= qmul_17(step0_sub_0_i, 16'sh5A82);
      r2_s1    <= qmul_17(step0_sum_1_r, 16'sh5A82);
      i2_s1    <= qmul_17(step0_sum_1_i, 16'sh5A82);
      r3_s1    <= qmul_17(step0_sub_1_r, 16'sh5A82);
      i3_s1    <= qmul_17(step0_sub_1_i, 16'sh5A82);
      valid_s1 <= io_in_valid;
    end
  end

  // Step 1: X on qubit 1 (swaps 0 <-> 2 and 1 <-> 3)
  logic signed [15:0] r0_s2, i0_s2, r1_s2, i1_s2;
  logic signed [15:0] r2_s2, i2_s2, r3_s2, i3_s2;
  logic valid_s2;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      r0_s2    <= 16'sh0;
      i0_s2    <= 16'sh0;
      r1_s2    <= 16'sh0;
      i1_s2    <= 16'sh0;
      r2_s2    <= 16'sh0;
      i2_s2    <= 16'sh0;
      r3_s2    <= 16'sh0;
      i3_s2    <= 16'sh0;
      valid_s2 <= 1'b0;
    end else begin
      r0_s2    <= r2_s1;
      i0_s2    <= i2_s1;
      r1_s2    <= r3_s1;
      i1_s2    <= i3_s1;
      r2_s2    <= r0_s1;
      i2_s2    <= i0_s1;
      r3_s2    <= r1_s1;
      i3_s2    <= i1_s1;
      valid_s2 <= valid_s1;
    end
  end

  // Step 2: H on qubit 1 (mixes states 0-2 and 1-3)
  logic signed [16:0] step2_sum_0_r, step2_sub_0_r;
  logic signed [16:0] step2_sum_0_i, step2_sub_0_i;
  logic signed [16:0] step2_sum_1_r, step2_sub_1_r;
  logic signed [16:0] step2_sum_1_i, step2_sub_1_i;

  assign step2_sum_0_r = $signed(r0_s2) + $signed(r2_s2);
  assign step2_sub_0_r = $signed(r0_s2) - $signed(r2_s2);
  assign step2_sum_0_i = $signed(i0_s2) + $signed(i2_s2);
  assign step2_sub_0_i = $signed(i0_s2) - $signed(i2_s2);

  assign step2_sum_1_r = $signed(r1_s2) + $signed(r3_s2);
  assign step2_sub_1_r = $signed(r1_s2) - $signed(r3_s2);
  assign step2_sum_1_i = $signed(i1_s2) + $signed(i3_s2);
  assign step2_sub_1_i = $signed(i1_s2) - $signed(i3_s2);

  logic signed [15:0] r0_s3, i0_s3, r1_s3, i1_s3;
  logic signed [15:0] r2_s3, i2_s3, r3_s3, i3_s3;
  logic valid_s3;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      r0_s3    <= 16'sh0;
      i0_s3    <= 16'sh0;
      r1_s3    <= 16'sh0;
      i1_s3    <= 16'sh0;
      r2_s3    <= 16'sh0;
      i2_s3    <= 16'sh0;
      r3_s3    <= 16'sh0;
      i3_s3    <= 16'sh0;
      valid_s3 <= 1'b0;
    end else begin
      r0_s3    <= qmul_17(step2_sum_0_r, 16'sh5A82);
      i0_s3    <= qmul_17(step2_sum_0_i, 16'sh5A82);
      r2_s3    <= qmul_17(step2_sub_0_r, 16'sh5A82);
      i2_s3    <= qmul_17(step2_sub_0_i, 16'sh5A82);
      r1_s3    <= qmul_17(step2_sum_1_r, 16'sh5A82);
      i1_s3    <= qmul_17(step2_sum_1_i, 16'sh5A82);
      r3_s3    <= qmul_17(step2_sub_1_r, 16'sh5A82);
      i3_s3    <= qmul_17(step2_sub_1_i, 16'sh5A82);
      valid_s3 <= valid_s2;
    end
  end

  // Step 3: SWAP on 0 and 1 (swaps 1 <-> 2) and output registration
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      io_out_QSV_0_0 <= 16'sh0;
      io_out_QSV_0_1 <= 16'sh0;
      io_out_QSV_1_0 <= 16'sh0;
      io_out_QSV_1_1 <= 16'sh0;
      io_out_QSV_2_0 <= 16'sh0;
      io_out_QSV_2_1 <= 16'sh0;
      io_out_QSV_3_0 <= 16'sh0;
      io_out_QSV_3_1 <= 16'sh0;
      io_out_valid   <= 1'b0;
    end else begin
      io_out_QSV_0_0 <= r0_s3;
      io_out_QSV_0_1 <= i0_s3;
      io_out_QSV_1_0 <= r2_s3; // Swapped state 1 and 2
      io_out_QSV_1_1 <= i2_s3;
      io_out_QSV_2_0 <= r1_s3; // Swapped state 2 and 1
      io_out_QSV_2_1 <= i1_s3;
      io_out_QSV_3_0 <= r3_s3;
      io_out_QSV_3_1 <= i3_s3;
      io_out_valid   <= valid_s3;
    end
  end

endmodule
