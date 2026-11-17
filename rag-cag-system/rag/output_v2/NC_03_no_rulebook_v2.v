module Circuit (
  input          clock,
  input          reset,
  input  [15:0]  io_in_QSV_0_0,
  input  [15:0]  io_in_QSV_0_1,
  input  [15:0]  io_in_QSV_1_0,
  input  [15:0]  io_in_QSV_1_1,
  input  [15:0]  io_in_QSV_2_0,
  input  [15:0]  io_in_QSV_2_1,
  input  [15:0]  io_in_QSV_3_0,
  input  [15:0]  io_in_QSV_3_1,
  input          io_in_valid,
  output [15:0]  io_out_QSV_0_0,
  output [15:0]  io_out_QSV_0_1,
  output [15:0]  io_out_QSV_1_0,
  output [15:0]  io_out_QSV_1_1,
  output [15:0]  io_out_QSV_2_0,
  output [15:0]  io_out_QSV_2_1,
  output [15:0]  io_out_QSV_3_0,
  output [15:0]  io_out_QSV_3_1,
  output         io_out_valid
);

  wire [15:0] w1_QSV_0_0, w1_QSV_0_1, w1_QSV_1_0, w1_QSV_1_1, w1_QSV_2_0, w1_QSV_2_1, w1_QSV_3_0, w1_QSV_3_1;
  wire        w1_valid;

  wire [15:0] w2_QSV_0_0, w2_QSV_0_1, w2_QSV_1_0, w2_QSV_1_1, w2_QSV_2_0, w2_QSV_2_1, w2_QSV_3_0, w2_QSV_3_1;
  wire        w2_valid;

  wire [15:0] w3_QSV_0_0, w3_QSV_0_1, w3_QSV_1_0, w3_QSV_1_1, w3_QSV_2_0, w3_QSV_2_1, w3_QSV_3_0, w3_QSV_3_1;
  wire        w3_valid;

  wire [15:0] w4_QSV_0_0, w4_QSV_0_1, w4_QSV_1_0, w4_QSV_1_1, w4_QSV_2_0, w4_QSV_2_1, w4_QSV_3_0, w4_QSV_3_1;
  wire        w4_valid;

  HGate2QubitVector16bit m0 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (io_in_QSV_0_0),
    .io_in_QSV_0_1  (io_in_QSV_0_1),
    .io_in_QSV_1_0  (io_in_QSV_1_0),
    .io_in_QSV_1_1  (io_in_QSV_1_1),
    .io_in_QSV_2_0  (io_in_QSV_2_0),
    .io_in_QSV_2_1  (io_in_QSV_2_1),
    .io_in_QSV_3_0  (io_in_QSV_3_0),
    .io_in_QSV_3_1  (io_in_QSV_3_1),
    .io_in_valid    (io_in_valid),
    .io_out_QSV_0_0 (w1_QSV_0_0),
    .io_out_QSV_0_1 (w1_QSV_0_1),
    .io_out_QSV_1_0 (w1_QSV_1_0),
    .io_out_QSV_1_1 (w1_QSV_1_1),
    .io_out_QSV_2_0 (w1_QSV_2_0),
    .io_out_QSV_2_1 (w1_QSV_2_1),
    .io_out_QSV_3_0 (w1_QSV_3_0),
    .io_out_QSV_3_1 (w1_QSV_3_1),
    .io_out_valid   (w1_valid)
  );

  XGate2QubitVector16bit m1 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (w1_QSV_0_0),
    .io_in_QSV_0_1  (w1_QSV_0_1),
    .io_in_QSV_1_0  (w1_QSV_1_0),
    .io_in_QSV_1_1  (w1_QSV_1_1),
    .io_in_QSV_2_0  (w1_QSV_2_0),
    .io_in_QSV_2_1  (w1_QSV_2_1),
    .io_in_QSV_3_0  (w1_QSV_3_0),
    .io_in_QSV_3_1  (w1_QSV_3_1),
    .io_in_valid    (w1_valid),
    .io_out_QSV_0_0 (w2_QSV_0_0),
    .io_out_QSV_0_1 (w2_QSV_0_1),
    .io_out_QSV_1_0 (w2_QSV_1_0),
    .io_out_QSV_1_1 (w2_QSV_1_1),
    .io_out_QSV_2_0 (w2_QSV_2_0),
    .io_out_QSV_2_1 (w2_QSV_2_1),
    .io_out_QSV_3_0 (w2_QSV_3_0),
    .io_out_QSV_3_1 (w2_QSV_3_1),
    .io_out_valid   (w2_valid)
  );

  CompatiblePerm m2 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (w2_QSV_0_0),
    .io_in_QSV_0_1  (w2_QSV_0_1),
    .io_in_QSV_1_0  (w2_QSV_1_0),
    .io_in_QSV_1_1  (w2_QSV_1_1),
    .io_in_QSV_2_0  (w2_QSV_2_0),
    .io_in_QSV_2_1  (w2_QSV_2_1),
    .io_in_QSV_3_0  (w2_QSV_3_0),
    .io_in_QSV_3_1  (w2_QSV_3_1),
    .io_in_valid    (w2_valid),
    .io_out_QSV_0_0 (w3_QSV_0_0),
    .io_out_QSV_0_1 (w3_QSV_0_1),
    .io_out_QSV_1_0 (w3_QSV_1_0),
    .io_out_QSV_1_1 (w3_QSV_1_1),
    .io_out_QSV_2_0 (w3_QSV_2_0),
    .io_out_QSV_2_1 (w3_QSV_2_1),
    .io_out_QSV_3_0 (w3_QSV_3_0),
    .io_out_QSV_3_1 (w3_QSV_3_1),
    .io_out_valid   (w3_valid)
  );

  CNGate2QubitVector16bit m3 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (w3_QSV_0_0),
    .io_in_QSV_0_1  (w3_QSV_0_1),
    .io_in_QSV_1_0  (w3_QSV_1_0),
    .io_in_QSV_1_1  (w3_QSV_1_1),
    .io_in_QSV_2_0  (w3_QSV_2_0),
    .io_in_QSV_2_1  (w3_QSV_2_1),
    .io_in_QSV_3_0  (w3_QSV_3_0),
    .io_in_QSV_3_1  (w3_QSV_3_1),
    .io_in_valid    (w3_valid),
    .io_out_QSV_0_0 (w4_QSV_0_0),
    .io_out_QSV_0_1 (w4_QSV_0_1),
    .io_out_QSV_1_0 (w4_QSV_1_0),
    .io_out_QSV_1_1 (w4_QSV_1_1),
    .io_out_QSV_2_0 (w4_QSV_2_0),
    .io_out_QSV_2_1 (w4_QSV_2_1),
    .io_out_QSV_3_0 (w4_QSV_3_0),
    .io_out_QSV_3_1 (w4_QSV_3_1),
    .io_out_valid   (w4_valid)
  );

  CompatiblePerm m4 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (w4_QSV_0_0),
    .io_in_QSV_0_1  (w4_QSV_0_1),
    .io_in_QSV_1_0  (w4_QSV_1_0),
    .io_in_QSV_1_1  (w4_QSV_1_1),
    .io_in_QSV_2_0  (w4_QSV_2_0),
    .io_in_QSV_2_1  (w4_QSV_2_1),
    .io_in_QSV_3_0  (w4_QSV_3_0),
    .io_in_QSV_3_1  (w4_QSV_3_1),
    .io_in_valid    (w4_valid),
    .io_out_QSV_0_0 (io_out_QSV_0_0),
    .io_out_QSV_0_1 (io_out_QSV_0_1),
    .io_out_QSV_1_0 (io_out_QSV_1_0),
    .io_out_QSV_1_1 (io_out_QSV_1_1),
    .io_out_QSV_2_0 (io_out_QSV_2_0),
    .io_out_QSV_2_1 (io_out_QSV_2_1),
    .io_out_QSV_3_0 (io_out_QSV_3_0),
    .io_out_QSV_3_1 (io_out_QSV_3_1),
    .io_out_valid   (io_out_valid)
  );

endmodule
