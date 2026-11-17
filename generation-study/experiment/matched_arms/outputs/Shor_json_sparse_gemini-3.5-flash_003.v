module Shor (
  input  logic        clock,
  input  logic        reset,
  input  logic [7:0]  io_in_QSV_0_0,
  input  logic [7:0]  io_in_QSV_0_1,
  input  logic [7:0]  io_in_QSV_1_0,
  input  logic [7:0]  io_in_QSV_1_1,
  input  logic [7:0]  io_in_QSV_2_0,
  input  logic [7:0]  io_in_QSV_2_1,
  input  logic [7:0]  io_in_QSV_3_0,
  input  logic [7:0]  io_in_QSV_3_1,
  input  logic [7:0]  io_in_QSV_4_0,
  input  logic [7:0]  io_in_QSV_4_1,
  input  logic [7:0]  io_in_QSV_5_0,
  input  logic [7:0]  io_in_QSV_5_1,
  input  logic [7:0]  io_in_QSV_6_0,
  input  logic [7:0]  io_in_QSV_6_1,
  input  logic [7:0]  io_in_QSV_7_0,
  input  logic [7:0]  io_in_QSV_7_1,
  input  logic [7:0]  io_in_QSV_8_0,
  input  logic [7:0]  io_in_QSV_8_1,
  input  logic [7:0]  io_in_QSV_9_0,
  input  logic [7:0]  io_in_QSV_9_1,
  input  logic [7:0]  io_in_QSV_10_0,
  input  logic [7:0]  io_in_QSV_10_1,
  input  logic [7:0]  io_in_QSV_11_0,
  input  logic [7:0]  io_in_QSV_11_1,
  input  logic [7:0]  io_in_QSV_12_0,
  input  logic [7:0]  io_in_QSV_12_1,
  input  logic [7:0]  io_in_QSV_13_0,
  input  logic [7:0]  io_in_QSV_13_1,
  input  logic [7:0]  io_in_QSV_14_0,
  input  logic [7:0]  io_in_QSV_14_1,
  input  logic [7:0]  io_in_QSV_15_0,
  input  logic [7:0]  io_in_QSV_15_1,
  input  logic [7:0]  io_in_QSV_16_0,
  input  logic [7:0]  io_in_QSV_16_1,
  input  logic [7:0]  io_in_QSV_17_0,
  input  logic [7:0]  io_in_QSV_17_1,
  input  logic [7:0]  io_in_QSV_18_0,
  input  logic [7:0]  io_in_QSV_18_1,
  input  logic [7:0]  io_in_QSV_19_0,
  input  logic [7:0]  io_in_QSV_19_1,
  input  logic [7:0]  io_in_QSV_20_0,
  input  logic [7:0]  io_in_QSV_20_1,
  input  logic [7:0]  io_in_QSV_21_0,
  input  logic [7:0]  io_in_QSV_21_1,
  input  logic [7:0]  io_in_QSV_22_0,
  input  logic [7:0]  io_in_QSV_22_1,
  input  logic [7:0]  io_in_QSV_23_0,
  input  logic [7:0]  io_in_QSV_23_1,
  input  logic [7:0]  io_in_QSV_24_0,
  input  logic [7:0]  io_in_QSV_24_1,
  input  logic [7:0]  io_in_QSV_25_0,
  input  logic [7:0]  io_in_QSV_25_1,
  input  logic [7:0]  io_in_QSV_26_0,
  input  logic [7:0]  io_in_QSV_26_1,
  input  logic [7:0]  io_in_QSV_27_0,
  input  logic [7:0]  io_in_QSV_27_1,
  input  logic [7:0]  io_in_QSV_28_0,
  input  logic [7:0]  io_in_QSV_28_1,
  input  logic [7:0]  io_in_QSV_29_0,
  input  logic [7:0]  io_in_QSV_29_1,
  input  logic [7:0]  io_in_QSV_30_0,
  input  logic [7:0]  io_in_QSV_30_1,
  input  logic [7:0]  io_in_QSV_31_0,
  input  logic [7:0]  io_in_QSV_31_1,
  input  logic        io_in_valid,
  output logic [7:0]  io_out_QSV_0_0,
  output logic [7:0]  io_out_QSV_0_1,
  output logic [7:0]  io_out_QSV_1_0,
  output logic [7:0]  io_out_QSV_1_1,
  output logic [7:0]  io_out_QSV_2_0,
  output logic [7:0]  io_out_QSV_2_1,
  output logic [7:0]  io_out_QSV_3_0,
  output logic [7:0]  io_out_QSV_3_1,
  output logic [7:0]  io_out_QSV_4_0,
  output logic [7:0]  io_out_QSV_4_1,
  output logic [7:0]  io_out_QSV_5_0,
  output logic [7:0]  io_out_QSV_5_1,
  output logic [7:0]  io_out_QSV_6_0,
  output logic [7:0]  io_out_QSV_6_1,
  output logic [7:0]  io_out_QSV_7_0,
  output logic [7:0]  io_out_QSV_7_1,
  output logic [7:0]  io_out_QSV_8_0,
  output logic [7:0]  io_out_QSV_8_1,
  output logic [7:0]  io_out_QSV_9_0,
  output logic [7:0]  io_out_QSV_9_1,
  output logic [7:0]  io_out_QSV_10_0,
  output logic [7:0]  io_out_QSV_10_1,
  output logic [7:0]  io_out_QSV_11_0,
  output logic [7:0]  io_out_QSV_11_1,
  output logic [7:0]  io_out_QSV_12_0,
  output logic [7:0]  io_out_QSV_12_1,
  output logic [7:0]  io_out_QSV_13_0,
  output logic [7:0]  io_out_QSV_13_1,
  output logic [7:0]  io_out_QSV_14_0,
  output logic [7:0]  io_out_QSV_14_1,
  output logic [7:0]  io_out_QSV_15_0,
  output logic [7:0]  io_out_QSV_15_1,
  output logic [7:0]  io_out_QSV_16_0,
  output logic [7:0]  io_out_QSV_16_1,
  output logic [7:0]  io_out_QSV_17_0,
  output logic [7:0]  io_out_QSV_17_1,
  output logic [7:0]  io_out_QSV_18_0,
  output logic [7:0]  io_out_QSV_18_1,
  output logic [7:0]  io_out_QSV_19_0,
  output logic [7:0]  io_out_QSV_19_1,
  output logic [7:0]  io_out_QSV_20_0,
  output logic [7:0]  io_out_QSV_20_1,
  output logic [7:0]  io_out_QSV_21_0,
  output logic [7:0]  io_out_QSV_21_1,
  output logic [7:0]  io_out_QSV_22_0,
  output logic [7:0]  io_out_QSV_22_1,
  output logic [7:0]  io_out_QSV_23_0,
  output logic [7:0]  io_out_QSV_23_1,
  output logic [7:0]  io_out_QSV_24_0,
  output logic [7:0]  io_out_QSV_24_1,
  output logic [7:0]  io_out_QSV_25_0,
  output logic [7:0]  io_out_QSV_25_1,
  output logic [7:0]  io_out_QSV_26_0,
  output logic [7:0]  io_out_QSV_26_1,
  output logic [7:0]  io_out_QSV_27_0,
  output logic [7:0]  io_out_QSV_27_1,
  output logic [7:0]  io_out_QSV_28_0,
  output logic [7:0]  io_out_QSV_28_1,
  output logic [7:0]  io_out_QSV_29_0,
  output logic [7:0]  io_out_QSV_29_1,
  output logic [7:0]  io_out_QSV_30_0,
  output logic [7:0]  io_out_QSV_30_1,
  output logic [7:0]  io_out_QSV_31_0,
  output logic [7:0]  io_out_QSV_31_1,
  output logic        io_out_valid
);

  function automatic logic signed [7:0] scale_h(input logic signed [8:0] val);
    logic signed [16:0] prod;
    logic signed [16:0] temp;
    logic signed [8:0] shifted;
    begin
      prod = val * 17'sd181;
      temp = prod + 17'sd128;
      shifted = temp >>> 8;
      if (shifted > 9'sd127) begin
        return 8'sd127;
      end else if (shifted < -9'sd128) begin
        return -8'sd128;
      end else begin
        return shifted[7:0];
      end
    end
  endfunction

  logic signed [7:0] r_in[32];
  logic signed [7:0] i_in[32];

  assign r_in[0] = io_in_QSV_0_0;
  assign i_in[0] = io_in_QSV_0_1;
  assign r_in[1] = io_in_QSV_1_0;
  assign i_in[1] = io_in_QSV_1_1;
  assign r_in[2] = io_in_QSV_2_0;
  assign i_in[2] = io_in_QSV_2_1;
  assign r_in[3] = io_in_QSV_3_0;
  assign i_in[3] = io_in_QSV_3_1;
  assign r_in[4] = io_in_QSV_4_0;
  assign i_in[4] = io_in_QSV_4_1;
  assign r_in[5] = io_in_QSV_5_0;
  assign i_in[5] = io_in_QSV_5_1;
  assign r_in[6] = io_in_QSV_6_0;
  assign i_in[6] = io_in_QSV_6_1;
  assign r_in[7] = io_in_QSV_7_0;
  assign i_in[7] = io_in_QSV_7_1;
  assign r_in[8] = io_in_QSV_8_0;
  assign i_in[8] = io_in_QSV_8_1;
  assign r_in[9] = io_in_QSV_9_0;
  assign i_in[9] = io_in_QSV_9_1;
  assign r_in[10] = io_in_QSV_10_0;
  assign i_in[10] = io_in_QSV_10_1;
  assign r_in[11] = io_in_QSV_11_0;
  assign i_in[11] = io_in_QSV_11_1;
  assign r_in[12] = io_in_QSV_12_0;
  assign i_in[12] = io_in_QSV_12_1;
  assign r_in[13] = io_in_QSV_13_0;
  assign i_in[13] = io_in_QSV_13_1;
  assign r_in[14] = io_in_QSV_14_0;
  assign i_in[14] = io_in_QSV_14_1;
  assign r_in[15] = io_in_QSV_15_0;
  assign i_in[15] = io_in_QSV_15_1;
  assign r_in[16] = io_in_QSV_16_0;
  assign i_in[16] = io_in_QSV_16_1;
  assign r_in[17] = io_in_QSV_17_0;
  assign i_in[17] = io_in_QSV_17_1;
  assign r_in[18] = io_in_QSV_18_0;
  assign i_in[18] = io_in_QSV_18_1;
  assign r_in[19] = io_in_QSV_19_0;
  assign i_in[19] = io_in_QSV_19_1;
  assign r_in[20] = io_in_QSV_20_0;
  assign i_in[20] = io_in_QSV_20_1;
  assign r_in[21] = io_in_QSV_21_0;
  assign i_in[21] = io_in_QSV_21_1;
  assign r_in[22] = io_in_QSV_22_0;
  assign i_in[22] = io_in_QSV_22_1;
  assign r_in[23] = io_in_QSV_23_0;
  assign i_in[23] = io_in_QSV_23_1;
  assign r_in[24] = io_in_QSV_24_0;
  assign i_in[24] = io_in_QSV_24_1;
  assign r_in[25] = io_in_QSV_25_0;
  assign i_in[25] = io_in_QSV_25_1;
  assign r_in[26] = io_in_QSV_26_0;
  assign i_in[26] = io_in_QSV_26_1;
  assign r_in[27] = io_in_QSV_27_0;
  assign i_in[27] = io_in_QSV_27_1;
  assign r_in[28] = io_in_QSV_28_0;
  assign i_in[28] = io_in_QSV_28_1;
  assign r_in[29] = io_in_QSV_29_0;
  assign i_in[29] = io_in_QSV_29_1;
  assign r_in[30] = io_in_QSV_30_0;
  assign i_in[30] = io_in_QSV_30_1;
  assign r_in[31] = io_in_QSV_31_0;
  assign i_in[31] = io_in_QSV_31_1;

  logic signed [7:0] r_s0[32];
  logic signed [7:0] i_s0[32];
  logic              valid_s0;

  logic signed [7:0] r_s1[32];
  logic signed [7:0] i_s1[32];
  logic              valid_s1;

  logic signed [7:0] r_s2[32];
  logic signed [7:0] i_s2[32];
  logic              valid_s2;

  logic signed [7:0] r_s3[32];
  logic signed [7:0] i_s3[32];
  logic              valid_s3;

  logic signed [7:0] r_s4[32];
  logic signed [7:0] i_s4[32];
  logic              valid_s4;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      valid_s0 <= 1'b0;
      for (int k = 0; k < 32; k++) begin
        r_s0[k] <= 8'sd0;
        i_s0[k] <= 8'sd0;
      end
    end else begin
      valid_s0 <= io_in_valid;
      for (int k = 0; k < 32; k += 2) begin
        r_s0[k]   <= scale_h(logic signed [8:0]'(r_in[k]) + logic signed [8:0]'(r_in[k+1]));
        r_s0[k+1] <= scale_h(logic signed [8:0]'(r_in[k]) - logic signed [8:0]'(r_in[k+1]));
        i_s0[k]   <= scale_h(logic signed [8:0]'(i_in[k]) + logic signed [8:0]'(i_in[k+1]));
        i_s0[k+1] <= scale_h(logic signed [8:0]'(i_in[k]) - logic signed [8:0]'(i_in[k+1]));
      end
    end
  end

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      valid_s1 <= 1'b0;
      for (int k = 0; k < 32; k++) begin
        r_s1[k] <= 8'sd0;
        i_s1[k] <= 8'sd0;
      end
    end else begin
      valid_s1 <= valid_s0;
      for (int k = 0; k < 32; k++) begin
        if ((k & 1) == 1) begin
          r_s1[k] <= r_s0[k ^ 2];
          i_s1[k] <= i_s0[k ^ 2];
        end else begin
          r_s1[k] <= r_s0[k];
          i_s1[k] <= i_s0[k];
        end
      end
    end
  end

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      valid_s2 <= 1'b0;
      for (int k = 0; k < 32; k++) begin
        r_s2[k] <= 8'sd0;
        i_s2[k] <= 8'sd0;
      end
    end else begin
      valid_s2 <= valid_s1;
      for (int k = 0; k < 32; k++) begin
        if ((k & 2) != 0) begin
          r_s2[k] <= r_s1[k ^ 4];
          i_s2[k] <= i_s1[k ^ 4];
        end else begin
          r_s2[k] <= r_s1[k];
          i_s2[k] <= i_s1[k];
        end
      end
    end
  end

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      valid_s3 <= 1'b0;
      for (int k = 0; k < 32; k++) begin
        r_s3[k] <= 8'sd0;
        i_s3[k] <= 8'sd0;
      end
    end else begin
      valid_s3 <= valid_s2;
      for (int k = 0; k < 32; k++) begin
        if ((k & 4) != 0) begin
          r_s3[k] <= r_s2[k ^ 8];
          i_s3[k] <= i_s2[k ^ 8];
        end else begin
          r_s3[k] <= r_s2[k];
          i_s3[k] <= i_s2[k];
        end
      end
    end
  end

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      valid_s4 <= 1'b0;
      for (int k = 0; k < 32; k++) begin
        r_s4[k] <= 8'sd0;
        i_s4[k] <= 8'sd0;
      end
    end else begin
      valid_s4 <= valid_s3;
      for (int k = 0; k < 32; k++) begin
        if ((k & 8) != 0) begin
          r_s4[k] <= r_s3[k ^ 16];
          i_s4[k] <= i_s3[k ^ 16];
        end else begin
          r_s4[k] <= r_s3[k];
          i_s4[k] <= i_s3[k];
        end
      end
    end
  end

  assign io_out_QSV_0_0 = r_s4[0];
  assign io_out_QSV_0_1 = i_s4[0];
  assign io_out_QSV_1_0 = r_s4[1];
  assign io_out_QSV_1_1 = i_s4[1];
  assign io_out_QSV_2_0 = r_s4[2];
  assign io_out_QSV_2_1 = i_s4[2];
  assign io_out_QSV_3_0 = r_s4[3];
  assign io_out_QSV_3_1 = i_s4[3];
  assign io_out_QSV_4_0 = r_s4[4];
  assign io_out_QSV_4_1 = i_s4[4];
  assign io_out_QSV_5_0 = r_s4[5];
  assign io_out_QSV_5_1 = i_s4[5];
  assign io_out_QSV_6_0 = r_s4[6];
  assign io_out_QSV_6_1 = i_s4[6];
  assign io_out_QSV_7_0 = r_s4[7];
  assign io_out_QSV_7_1 = i_s4[7];
  assign io_out_QSV_8_0 = r_s4[8];
  assign io_out_QSV_8_1 = i_s4[8];
  assign io_out_QSV_9_0 = r_s4[9];
  assign io_out_QSV_9_1 = i_s4[9];
  assign io_out_QSV_10_0 = r_s4[10];
  assign io_out_QSV_10_1 = i_s4[10];
  assign io_out_QSV_11_0 = r_s4[11];
  assign io_out_QSV_11_1 = i_s4[11];
  assign io_out_QSV_12_0 = r_s4[12];
  assign io_out_QSV_12_1 = i_s4[12];
  assign io_out_QSV_13_0 = r_s4[13];
  assign io_out_QSV_13_1 = i_s4[13];
  assign io_out_QSV_14_0 = r_s4[14];
  assign io_out_QSV_14_1 = i_s4[14];
  assign io_out_QSV_15_0 = r_s4[15];
  assign io_out_QSV_15_1 = i_s4[15];
  assign io_out_QSV_16_0 = r_s4[16];
  assign io_out_QSV_16_1 = i_s4[16];
  assign io_out_QSV_17_0 = r_s4[17];
  assign io_out_QSV_17_1 = i_s4[17];
  assign io_out_QSV_18_0 = r_s4[18];
  assign io_out_QSV_18_1 = i_s4[18];
  assign io_out_QSV_19_0 = r_s4[19];
  assign io_out_QSV_19_1 = i_s4[19];
  assign io_out_QSV_20_0 = r_s4[20];
  assign io_out_QSV_20_1 = i_s4[20];
  assign io_out_QSV_21_0 = r_s4[21];
  assign io_out_QSV_21_1 = i_s4[21];
  assign io_out_QSV_22_0 = r_s4[22];
  assign io_out_QSV_22_1 = i_s4[22];
  assign io_out_QSV_23_0 = r_s4[23];
  assign io_out_QSV_23_1 = i_s4[23];
  assign io_out_QSV_24_0 = r_s4[24];
  assign io_out_QSV_24_1 = i_s4[24];
  assign io_out_QSV_25_0 = r_s4[25];
  assign io_out_QSV_25_1 = i_s4[25];
  assign io_out_QSV_26_0 = r_s4[26];
  assign io_out_QSV_26_1 = i_s4[26];
  assign io_out_QSV_27_0 = r_s4[27];
  assign io_out_QSV_27_1 = i_s4[27];
  assign io_out_QSV_28_0 = r_s4[28];
  assign io_out_QSV_28_1 = i_s4[28];
  assign io_out_QSV_29_0 = r_s4[29];
  assign io_out_QSV_29_1 = i_s4[29];
  assign io_out_QSV_30_0 = r_s4[30];
  assign io_out_QSV_30_1 = i_s4[30];
  assign io_out_QSV_31_0 = r_s4[31];
  assign io_out_QSV_31_1 = i_s4[31];
  assign io_out_valid = valid_s4;

endmodule
