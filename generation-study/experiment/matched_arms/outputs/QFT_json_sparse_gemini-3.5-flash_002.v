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

  function automatic logic signed [15:0] scale_half(
    input logic signed [15:0] a,
    input logic signed [15:0] b,
    input logic sub
  );
    logic signed [16:0] sum;
    logic signed [33:0] prod;
    begin
      if (sub)
        sum = $signed(a) - $signed(b);
      else
        sum = $signed(a) + $signed(b);
      prod = sum * $signed(17'd23170);
      scale_half = 16'(prod >>> 15);
    end
  endfunction

  logic signed [15:0] in_r[8];
  logic signed [15:0] in_i[8];

  assign in_r[0] = $signed({io_in_QSV_0_0, 8'b0});
  assign in_i[0] = $signed({io_in_QSV_0_1, 8'b0});
  assign in_r[1] = $signed({io_in_QSV_1_0, 8'b0});
  assign in_i[1] = $signed({io_in_QSV_1_1, 8'b0});
  assign in_r[2] = $signed({io_in_QSV_2_0, 8'b0});
  assign in_i[2] = $signed({io_in_QSV_2_1, 8'b0});
  assign in_r[3] = $signed({io_in_QSV_3_0, 8'b0});
  assign in_i[3] = $signed({io_in_QSV_3_1, 8'b0});
  assign in_r[4] = $signed({io_in_QSV_4_0, 8'b0});
  assign in_i[4] = $signed({io_in_QSV_4_1, 8'b0});
  assign in_r[5] = $signed({io_in_QSV_5_0, 8'b0});
  assign in_i[5] = $signed({io_in_QSV_5_1, 8'b0});
  assign in_r[6] = $signed({io_in_QSV_6_0, 8'b0});
  assign in_i[6] = $signed({io_in_QSV_6_1, 8'b0});
  assign in_r[7] = $signed({io_in_QSV_7_0, 8'b0});
  assign in_i[7] = $signed({io_in_QSV_7_1, 8'b0});

  logic signed [15:0] st0_r[8], st0_i[8];
  logic st0_val;

  logic signed [15:0] st1_r[8], st1_i[8];
  logic st1_val;

  logic signed [15:0] st2_r[8], st2_i[8];
  logic st2_val;

  logic signed [15:0] st3_r[8], st3_i[8];
  logic st3_val;

  logic signed [15:0] st4_r[8], st4_i[8];
  logic st4_val;

  logic signed [15:0] st5_r[8], st5_i[8];
  logic st5_val;

  logic signed [15:0] st6_r[8], st6_i[8];
  logic st6_val;

  // Step 0: H on qubit 0
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      st0_val <= 1'b0;
      for (int i = 0; i < 8; i = i + 1) begin
        st0_r[i] <= '0;
        st0_i[i] <= '0;
      end
    end else begin
      st0_val <= io_in_valid;
      st0_r[0] <= scale_half(in_r[0], in_r[1], 1'b0);
      st0_i[0] <= scale_half(in_i[0], in_i[1], 1'b0);
      st0_r[1] <= scale_half(in_r[0], in_r[1], 1'b1);
      st0_i[1] <= scale_half(in_i[0], in_i[1], 1'b1);

      st0_r[2] <= scale_half(in_r[2], in_r[3], 1'b0);
      st0_i[2] <= scale_half(in_i[2], in_i[3], 1'b0);
      st0_r[3] <= scale_half(in_r[2], in_r[3], 1'b1);
      st0_i[3] <= scale_half(in_i[2], in_i[3], 1'b1);

      st0_r[4] <= scale_half(in_r[4], in_r[5], 1'b0);
      st0_i[4] <= scale_half(in_i[4], in_i[5], 1'b0);
      st0_r[5] <= scale_half(in_r[4], in_r[5], 1'b1);
      st0_i[5] <= scale_half(in_i[4], in_i[5], 1'b1);

      st0_r[6] <= scale_half(in_r[6], in_r[7], 1'b0);
      st0_i[6] <= scale_half(in_i[6], in_i[7], 1'b0);
      st0_r[7] <= scale_half(in_r[6], in_r[7], 1'b1);
      st0_i[7] <= scale_half(in_i[6], in_i[7], 1'b1);
    end
  end

  // Step 1: CS on qubits 1 and 0
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      st1_val <= 1'b0;
      for (int i = 0; i < 8; i = i + 1) begin
        st1_r[i] <= '0;
        st1_i[i] <= '0;
      end
    end else begin
      st1_val <= st0_val;
      for (int i = 0; i < 8; i = i + 1) begin
        if (i == 3 || i == 7) begin
          st1_r[i] <= -st0_i[i];
          st1_i[i] <= st0_r[i];
        end else begin
          st1_r[i] <= st0_r[i];
          st1_i[i] <= st0_i[i];
        end
      end
    end
  end

  // Step 2: CP on qubits 2 and 0 (phase pi/4)
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      st2_val <= 1'b0;
      for (int i = 0; i < 8; i = i + 1) begin
        st2_r[i] <= '0;
        st2_i[i] <= '0;
      end
    end else begin
      st2_val <= st1_val;
      for (int i = 0; i < 8; i = i + 1) begin
        if (i == 5 || i == 7) begin
          st2_r[i] <= scale_half(st1_r[i], st1_i[i], 1'b1);
          st2_i[i] <= scale_half(st1_r[i], st1_i[i], 1'b0);
        end else begin
          st2_r[i] <= st1_r[i];
          st2_i[i] <= st1_i[i];
        end
      end
    end
  end

  // Step 3: H on qubit 1
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      st3_val <= 1'b0;
      for (int i = 0; i < 8; i = i + 1) begin
        st3_r[i] <= '0;
        st3_i[i] <= '0;
      end
    end else begin
      st3_val <= st2_val;
      st3_r[0] <= scale_half(st2_r[0], st2_r[2], 1'b0);
      st3_i[0] <= scale_half(st2_i[0], st2_i[2], 1'b0);
      st3_r[2] <= scale_half(st2_r[0], st2_r[2], 1'b1);
      st3_i[2] <= scale_half(st2_i[0], st2_i[2], 1'b1);

      st3_r[1] <= scale_half(st2_r[1], st2_r[3], 1'b0);
      st3_i[1] <= scale_half(st2_i[1], st2_i[3], 1'b0);
      st3_r[3] <= scale_half(st2_r[1], st2_r[3], 1'b1);
      st3_i[3] <= scale_half(st2_i[1], st2_i[3], 1'b1);

      st3_r[4] <= scale_half(st2_r[4], st2_r[6], 1'b0);
      st3_i[4] <= scale_half(st2_i[4], st2_i[6], 1'b0);
      st3_r[6] <= scale_half(st2_r[4], st2_r[6], 1'b1);
      st3_i[6] <= scale_half(st2_i[4], st2_i[6], 1'b1);

      st3_r[5] <= scale_half(st2_r[5], st2_r[7], 1'b0);
      st3_i[5] <= scale_half(st2_i[5], st2_i[7], 1'b0);
      st3_r[7] <= scale_half(st2_r[5], st2_r[7], 1'b1);
      st3_i[7] <= scale_half(st2_i[5], st2_i[7], 1'b1);
    end
  end

  // Step 4: CS on qubits 2 and 1
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      st4_val <= 1'b0;
      for (int i = 0; i < 8; i = i + 1) begin
        st4_r[i] <= '0;
        st4_i[i] <= '0;
      end
    end else begin
      st4_val <= st3_val;
      for (int i = 0; i < 8; i = i + 1) begin
        if (i == 6 || i == 7) begin
          st4_r[i] <= -st3_i[i];
          st4_i[i] <= st3_r[i];
        end else begin
          st4_r[i] <= st3_r[i];
          st4_i[i] <= st3_i[i];
        end
      end
    end
  end

  // Step 5: H on qubit 2
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      st5_val <= 1'b0;
      for (int i = 0; i < 8; i = i + 1) begin
        st5_r[i] <= '0;
        st5_i[i] <= '0;
      end
    end else begin
      st5_val <= st4_val;
      st5_r[0] <= scale_half(st4_r[0], st4_r[4], 1'b0);
      st5_i[0] <= scale_half(st4_i[0], st4_i[4], 1'b0);
      st5_r[4] <= scale_half(st4_r[0], st4_r[4], 1'b1);
      st5_i[4] <= scale_half(st4_i[0], st4_i[4], 1'b1);

      st5_r[1] <= scale_half(st4_r[1], st4_r[5], 1'b0);
      st5_i[1] <= scale_half(st4_i[1], st4_i[5], 1'b0);
      st5_r[5] <= scale_half(st4_r[1], st4_r[5], 1'b1);
      st5_i[5] <= scale_half(st4_i[1], st4_i[5], 1'b1);

      st5_r[2] <= scale_half(st4_r[2], st4_r[6], 1'b0);
      st5_i[2] <= scale_half(st4_i[2], st4_i[6], 1'b0);
      st5_r[6] <= scale_half(st4_r[2], st4_r[6], 1'b1);
      st5_i[6] <= scale_half(st4_i[2], st4_i[6], 1'b1);

      st5_r[3] <= scale_half(st4_r[3], st4_r[7], 1'b0);
      st5_i[3] <= scale_half(st4_i[3], st4_i[7], 1'b0);
      st5_r[7] <= scale_half(st4_r[3], st4_r[7], 1'b1);
      st5_i[7] <= scale_half(st4_i[3], st4_i[7], 1'b1);
    end
  end

  // Step 6: SWAP on qubits 0 and 2
  always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
      st6_val <= 1'b0;
      for (int i = 0; i < 8; i = i + 1) begin
        st6_r[i] <= '0;
        st6_i[i] <= '0;
      end
    end else begin
      st6_val <= st5_val;
      st6_r[0] <= st5_r[0];
      st6_i[0] <= st5_i[0];
      st6_r[1] <= st5_r[4];
      st6_i[1] <= st5_i[4];
      st6_r[2] <= st5_r[2];
      st6_i[2] <= st5_i[2];
      st6_r[3] <= st5_r[6];
      st6_i[3] <= st5_i[6];
      st6_r[4] <= st5_r[1];
      st6_i[4] <= st5_i[1];
      st6_r[5] <= st5_r[5];
      st6_i[5] <= st5_i[5];
      st6_r[6] <= st5_r[3];
      st6_i[6] <= st5_i[3];
      st6_r[7] <= st5_r[7];
      st6_i[7] <= st5_i[7];
    end
  end

  // Output mappings
  assign io_out_QSV_0_0 = st6_r[0][15:8];
  assign io_out_QSV_0_1 = st6_i[0][15:8];
  assign io_out_QSV_1_0 = st6_r[1][15:8];
  assign io_out_QSV_1_1 = st6_i[1][15:8];
  assign io_out_QSV_2_0 = st6_r[2][15:8];
  assign io_out_QSV_2_1 = st6_i[2][15:8];
  assign io_out_QSV_3_0 = st6_r[3][15:8];
  assign io_out_QSV_3_1 = st6_i[3][15:8];
  assign io_out_QSV_4_0 = st6_r[4][15:8];
  assign io_out_QSV_4_1 = st6_i[4][15:8];
  assign io_out_QSV_5_0 = st6_r[5][15:8];
  assign io_out_QSV_5_1 = st6_i[5][15:8];
  assign io_out_QSV_6_0 = st6_r[6][15:8];
  assign io_out_QSV_6_1 = st6_i[6][15:8];
  assign io_out_QSV_7_0 = st6_r[7][15:8];
  assign io_out_QSV_7_1 = st6_i[7][15:8];
  assign io_out_valid   = st6_val;

endmodule
