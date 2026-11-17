`default_nettype none

module QFT (
  input  wire        clock,
  input  wire        reset,
  input  wire [7:0]  io_in_QSV_0_0,
  input  wire [7:0]  io_in_QSV_0_1,
  input  wire [7:0]  io_in_QSV_1_0,
  input  wire [7:0]  io_in_QSV_1_1,
  input  wire [7:0]  io_in_QSV_2_0,
  input  wire [7:0]  io_in_QSV_2_1,
  input  wire [7:0]  io_in_QSV_3_0,
  input  wire [7:0]  io_in_QSV_3_1,
  input  wire [7:0]  io_in_QSV_4_0,
  input  wire [7:0]  io_in_QSV_4_1,
  input  wire [7:0]  io_in_QSV_5_0,
  input  wire [7:0]  io_in_QSV_5_1,
  input  wire [7:0]  io_in_QSV_6_0,
  input  wire [7:0]  io_in_QSV_6_1,
  input  wire [7:0]  io_in_QSV_7_0,
  input  wire [7:0]  io_in_QSV_7_1,
  input  wire        io_in_valid,
  output wire [7:0]  io_out_QSV_0_0,
  output wire [7:0]  io_out_QSV_0_1,
  output wire [7:0]  io_out_QSV_1_0,
  output wire [7:0]  io_out_QSV_1_1,
  output wire [7:0]  io_out_QSV_2_0,
  output wire [7:0]  io_out_QSV_2_1,
  output wire [7:0]  io_out_QSV_3_0,
  output wire [7:0]  io_out_QSV_3_1,
  output wire [7:0]  io_out_QSV_4_0,
  output wire [7:0]  io_out_QSV_4_1,
  output wire [7:0]  io_out_QSV_5_0,
  output wire [7:0]  io_out_QSV_5_1,
  output wire [7:0]  io_out_QSV_6_0,
  output wire [7:0]  io_out_QSV_6_1,
  output wire [7:0]  io_out_QSV_7_0,
  output wire [7:0]  io_out_QSV_7_1,
  output wire        io_out_valid
);

  // Scaling function to divide by sqrt(2) represented as *90/128
  function automatic logic signed [7:0] scale_h(input logic signed [8:0] sum);
    logic signed [16:0] prod;
    prod = sum * 9'sd90;
    return prod[14:7];
  endfunction

  // Safe negation function to prevent overflow on -128
  function automatic logic signed [7:0] safe_neg(input logic signed [7:0] val);
    return (val == -128) ? 8'sd127 : -val;
  endfunction

  // Signed representation of inputs
  logic signed [7:0] in_r[7:0];
  logic signed [7:0] in_c[7:0];

  assign in_r[0] = $signed(io_in_QSV_0_0);
  assign in_c[0] = $signed(io_in_QSV_0_1);
  assign in_r[1] = $signed(io_in_QSV_1_0);
  assign in_c[1] = $signed(io_in_QSV_1_1);
  assign in_r[2] = $signed(io_in_QSV_2_0);
  assign in_c[2] = $signed(io_in_QSV_2_1);
  assign in_r[3] = $signed(io_in_QSV_3_0);
  assign in_c[3] = $signed(io_in_QSV_3_1);
  assign in_r[4] = $signed(io_in_QSV_4_0);
  assign in_c[4] = $signed(io_in_QSV_4_1);
  assign in_r[5] = $signed(io_in_QSV_5_0);
  assign in_c[5] = $signed(io_in_QSV_5_1);
  assign in_r[6] = $signed(io_in_QSV_6_0);
  assign in_c[6] = $signed(io_in_QSV_6_1);
  assign in_r[7] = $signed(io_in_QSV_7_0);
  assign in_c[7] = $signed(io_in_QSV_7_1);

  // --- Stage 1 (Step 0: H on Q0) ---
  logic signed [7:0] r_s1[7:0];
  logic signed [7:0] c_s1[7:0];
  logic v_s1;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      v_s1 <= 1'b0;
      for (int i = 0; i < 8; i++) begin
        r_s1[i] <= 8'd0;
        c_s1[i] <= 8'd0;
      end
    end else begin
      v_s1 <= io_in_valid;
      
      r_s1[0] <= scale_h($signed(in_r[0]) + $signed(in_r[1]));
      c_s1[0] <= scale_h($signed(in_c[0]) + $signed(in_c[1]));
      r_s1[1] <= scale_h($signed(in_r[0]) - $signed(in_r[1]));
      c_s1[1] <= scale_h($signed(in_c[0]) - $signed(in_c[1]));

      r_s1[2] <= scale_h($signed(in_r[2]) + $signed(in_r[3]));
      c_s1[2] <= scale_h($signed(in_c[2]) + $signed(in_c[3]));
      r_s1[3] <= scale_h($signed(in_r[2]) - $signed(in_r[3]));
      c_s1[3] <= scale_h($signed(in_c[2]) - $signed(in_c[3]));

      r_s1[4] <= scale_h($signed(in_r[4]) + $signed(in_r[5]));
      c_s1[4] <= scale_h($signed(in_c[4]) + $signed(in_c[5]));
      r_s1[5] <= scale_h($signed(in_r[4]) - $signed(in_r[5]));
      c_s1[5] <= scale_h($signed(in_c[4]) - $signed(in_c[5]));

      r_s1[6] <= scale_h($signed(in_r[6]) + $signed(in_r[7]));
      c_s1[6] <= scale_h($signed(in_c[6]) + $signed(in_c[7]));
      r_s1[7] <= scale_h($signed(in_r[6]) - $signed(in_r[7]));
      c_s1[7] <= scale_h($signed(in_c[6]) - $signed(in_c[7]));
    end
  end

  // --- Stage 2 (Step 1: CS on Q1, Q0) ---
  logic signed [7:0] r_s2[7:0];
  logic signed [7:0] c_s2[7:0];
  logic v_s2;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      v_s2 <= 1'b0;
      for (int i = 0; i < 8; i++) begin
        r_s2[i] <= 8'd0;
        c_s2[i] <= 8'd0;
      end
    end else begin
      v_s2 <= v_s1;
      
      r_s2[0] <= r_s1[0]; c_s2[0] <= c_s1[0];
      r_s2[1] <= r_s1[1]; c_s2[1] <= c_s1[1];
      r_s2[2] <= r_s1[2]; c_s2[2] <= c_s1[2];
      r_s2[4] <= r_s1[4]; c_s2[4] <= c_s1[4];
      r_s2[5] <= r_s1[5]; c_s2[5] <= c_s1[5];
      r_s2[6] <= r_s1[6]; c_s2[6] <= c_s1[6];

      // Multiply state 3 by i
      r_s2[3] <= safe_neg(c_s1[3]);
      c_s2[3] <= r_s1[3];

      // Multiply state 7 by i
      r_s2[7] <= safe_neg(c_s1[7]);
      c_s2[7] <= r_s1[7];
    end
  end

  // --- Stage 3 (Step 2: CP with theta=pi/4 on Q2, Q0) ---
  logic signed [7:0] r_s3[7:0];
  logic signed [7:0] c_s3[7:0];
  logic v_s3;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      v_s3 <= 1'b0;
      for (int i = 0; i < 8; i++) begin
        r_s3[i] <= 8'd0;
        c_s3[i] <= 8'd0;
      end
    end else begin
      v_s3 <= v_s2;
      
      r_s3[0] <= r_s2[0]; c_s3[0] <= c_s2[0];
      r_s3[1] <= r_s2[1]; c_s3[1] <= c_s2[1];
      r_s3[2] <= r_s2[2]; c_s3[2] <= c_s2[2];
      r_s3[3] <= r_s2[3]; c_s3[3] <= c_s2[3];
      r_s3[4] <= r_s2[4]; c_s3[4] <= c_s2[4];
      r_s3[6] <= r_s2[6]; c_s3[6] <= c_s2[6];

      // Multiply state 5 by e^(i*pi/4)
      r_s3[5] <= scale_h($signed(r_s2[5]) - $signed(c_s2[5]));
      c_s3[5] <= scale_h($signed(r_s2[5]) + $signed(c_s2[5]));

      // Multiply state 7 by e^(i*pi/4)
      r_s3[7] <= scale_h($signed(r_s2[7]) - $signed(c_s2[7]));
      c_s3[7] <= scale_h($signed(r_s2[7]) + $signed(c_s2[7]));
    end
  end

  // --- Stage 4 (Step 3: H on Q1) ---
  logic signed [7:0] r_s4[7:0];
  logic signed [7:0] c_s4[7:0];
  logic v_s4;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      v_s4 <= 1'b0;
      for (int i = 0; i < 8; i++) begin
        r_s4[i] <= 8'd0;
        c_s4[i] <= 8'd0;
      end
    end else begin
      v_s4 <= v_s3;

      r_s4[0] <= scale_h($signed(r_s3[0]) + $signed(r_s3[2]));
      c_s4[0] <= scale_h($signed(c_s3[0]) + $signed(c_s3[2]));
      r_s4[2] <= scale_h($signed(r_s3[0]) - $signed(r_s3[2]));
      c_s4[2] <= scale_h($signed(c_s3[0]) - $signed(c_s3[2]));

      r_s4[1] <= scale_h($signed(r_s3[1]) + $signed(r_s3[3]));
      c_s4[1] <= scale_h($signed(c_s3[1]) + $signed(c_s3[3]));
      r_s4[3] <= scale_h($signed(r_s3[1]) - $signed(r_s3[3]));
      c_s4[3] <= scale_h($signed(c_s3[1]) - $signed(c_s3[3]));

      r_s4[4] <= scale_h($signed(r_s3[4]) + $signed(r_s3[6]));
      c_s4[4] <= scale_h($signed(c_s3[4]) + $signed(c_s3[6]));
      r_s4[6] <= scale_h($signed(r_s3[4]) - $signed(r_s3[6]));
      c_s4[6] <= scale_h($signed(c_s3[4]) - $signed(c_s3[6]));

      r_s4[5] <= scale_h($signed(r_s3[5]) + $signed(r_s3[7]));
      c_s4[5] <= scale_h($signed(c_s3[5]) + $signed(c_s3[7]));
      r_s4[7] <= scale_h($signed(r_s3[5]) - $signed(r_s3[7]));
      c_s4[7] <= scale_h($signed(c_s3[5]) - $signed(c_s3[7]));
    end
  end

  // --- Stage 5 (Step 4: CS on Q2, Q1) ---
  logic signed [7:0] r_s5[7:0];
  logic signed [7:0] c_s5[7:0];
  logic v_s5;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      v_s5 <= 1'b0;
      for (int i = 0; i < 8; i++) begin
        r_s5[i] <= 8'd0;
        c_s5[i] <= 8'd0;
      end
    end else begin
      v_s5 <= v_s4;

      r_s5[0] <= r_s4[0]; c_s5[0] <= c_s4[0];
      r_s5[1] <= r_s4[1]; c_s5[1] <= c_s4[1];
      r_s5[2] <= r_s4[2]; c_s5[2] <= c_s4[2];
      r_s5[3] <= r_s4[3]; c_s5[3] <= c_s4[3];
      r_s5[4] <= r_s4[4]; c_s5[4] <= c_s4[4];
      r_s5[5] <= r_s4[5]; c_s5[5] <= c_s4[5];

      // Multiply state 6 by i
      r_s5[6] <= safe_neg(c_s4[6]);
      c_s5[6] <= r_s4[6];

      // Multiply state 7 by i
      r_s5[7] <= safe_neg(c_s4[7]);
      c_s5[7] <= r_s4[7];
    end
  end

  // --- Stage 6 (Step 5: H on Q2) ---
  logic signed [7:0] r_s6[7:0];
  logic signed [7:0] c_s6[7:0];
  logic v_s6;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      v_s6 <= 1'b0;
      for (int i = 0; i < 8; i++) begin
        r_s6[i] <= 8'd0;
        c_s6[i] <= 8'd0;
      end
    end else begin
      v_s6 <= v_s5;

      r_s6[0] <= scale_h($signed(r_s5[0]) + $signed(r_s5[4]));
      c_s6[0] <= scale_h($signed(c_s5[0]) + $signed(c_s5[4]));
      r_s6[4] <= scale_h($signed(r_s5[0]) - $signed(r_s5[4]));
      c_s6[4] <= scale_h($signed(c_s5[0]) - $signed(c_s5[4]));

      r_s6[1] <= scale_h($signed(r_s5[1]) + $signed(r_s5[5]));
      c_s6[1] <= scale_h($signed(c_s5[1]) + $signed(c_s5[5]));
      r_s6[5] <= scale_h($signed(r_s5[1]) - $signed(r_s5[5]));
      c_s6[5] <= scale_h($signed(c_s5[1]) - $signed(c_s5[5]));

      r_s6[2] <= scale_h($signed(r_s5[2]) + $signed(r_s5[6]));
      c_s6[2] <= scale_h($signed(c_s5[2]) + $signed(c_s5[6]));
      r_s6[6] <= scale_h($signed(r_s5[2]) - $signed(r_s5[6]));
      c_s6[6] <= scale_h($signed(c_s5[2]) - $signed(c_s5[6]));

      r_s6[3] <= scale_h($signed(r_s5[3]) + $signed(r_s5[7]));
      c_s6[3] <= scale_h($signed(c_s5[3]) + $signed(c_s5[7]));
      r_s6[7] <= scale_h($signed(r_s5[3]) - $signed(r_s5[7]));
      c_s6[7] <= scale_h($signed(c_s5[3]) - $signed(c_s5[7]));
    end
  end

  // --- Stage 7 (Step 6: SWAP on Q2, Q0) ---
  logic signed [7:0] r_s7[7:0];
  logic signed [7:0] c_s7[7:0];
  logic v_s7;

  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      v_s7 <= 1'b0;
      for (int i = 0; i < 8; i++) begin
        r_s7[i] <= 8'd0;
        c_s7[i] <= 8'd0;
      end
    end else begin
      v_s7 <= v_s6;

      r_s7[0] <= r_s6[0]; c_s7[0] <= c_s6[0];
      r_s7[2] <= r_s6[2]; c_s7[2] <= c_s6[2];
      r_s7[5] <= r_s6[5]; c_s7[5] <= c_s6[5];
      r_s7[7] <= r_s6[7]; c_s7[7] <= c_s6[7];

      // Swap 1 and 4
      r_s7[1] <= r_s6[4]; c_s7[1] <= c_s6[4];
      r_s7[4] <= r_s6[1]; c_s7[4] <= c_s6[1];

      // Swap 3 and 6
      r_s7[3] <= r_s6[6]; c_s7[3] <= c_s6[6];
      r_s7[6] <= r_s6[3]; c_s7[6] <= c_s6[3];
    end
  end

  // Output mappings
  assign io_out_QSV_0_0 = r_s7[0];
  assign io_out_QSV_0_1 = c_s7[0];
  assign io_out_QSV_1_0 = r_s7[1];
  assign io_out_QSV_1_1 = c_s7[1];
  assign io_out_QSV_2_0 = r_s7[2];
  assign io_out_QSV_2_1 = c_s7[2];
  assign io_out_QSV_3_0 = r_s7[3];
  assign io_out_QSV_3_1 = c_s7[3];
  assign io_out_QSV_4_0 = r_s7[4];
  assign io_out_QSV_4_1 = c_s7[4];
  assign io_out_QSV_5_0 = r_s7[5];
  assign io_out_QSV_5_1 = c_s7[5];
  assign io_out_QSV_6_0 = r_s7[6];
  assign io_out_QSV_6_1 = c_s7[6];
  assign io_out_QSV_7_0 = r_s7[7];
  assign io_out_QSV_7_1 = c_s7[7];
  assign io_out_valid   = v_s7;

endmodule
