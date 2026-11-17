module QuantumCircuit (
  input          clock,
  input          reset,
  input  [7:0]   io_in_QSV_0_0,
  input  [7:0]   io_in_QSV_0_1,
  input  [7:0]   io_in_QSV_1_0,
  input  [7:0]   io_in_QSV_1_1,
  input  [7:0]   io_in_QSV_2_0,
  input  [7:0]   io_in_QSV_2_1,
  input  [7:0]   io_in_QSV_3_0,
  input  [7:0]   io_in_QSV_3_1,
  input  [7:0]   io_in_QSV_4_0,
  input  [7:0]   io_in_QSV_4_1,
  input  [7:0]   io_in_QSV_5_0,
  input  [7:0]   io_in_QSV_5_1,
  input  [7:0]   io_in_QSV_6_0,
  input  [7:0]   io_in_QSV_6_1,
  input  [7:0]   io_in_QSV_7_0,
  input  [7:0]   io_in_QSV_7_1,
  input          io_in_valid,
  output [7:0]   io_out_QSV_0_0,
  output [7:0]   io_out_QSV_0_1,
  output [7:0]   io_out_QSV_1_0,
  output [7:0]   io_out_QSV_1_1,
  output [7:0]   io_out_QSV_2_0,
  output [7:0]   io_out_QSV_2_1,
  output [7:0]   io_out_QSV_3_0,
  output [7:0]   io_out_QSV_3_1,
  output [7:0]   io_out_QSV_4_0,
  output [7:0]   io_out_QSV_4_1,
  output [7:0]   io_out_QSV_5_0,
  output [7:0]   io_out_QSV_5_1,
  output [7:0]   io_out_QSV_6_0,
  output [7:0]   io_out_QSV_6_1,
  output [7:0]   io_out_QSV_7_0,
  output [7:0]   io_out_QSV_7_1,
  output         io_out_valid
);

  wire [7:0] w0_QSV_0_0;
  wire [7:0] w0_QSV_0_1;
  wire [7:0] w0_QSV_1_0;
  wire [7:0] w0_QSV_1_1;
  wire [7:0] w0_QSV_2_0;
  wire [7:0] w0_QSV_2_1;
  wire [7:0] w0_QSV_3_0;
  wire [7:0] w0_QSV_3_1;
  wire [7:0] w0_QSV_4_0;
  wire [7:0] w0_QSV_4_1;
  wire [7:0] w0_QSV_5_0;
  wire [7:0] w0_QSV_5_1;
  wire [7:0] w0_QSV_6_0;
  wire [7:0] w0_QSV_6_1;
  wire [7:0] w0_QSV_7_0;
  wire [7:0] w0_QSV_7_1;
  wire       w0_valid;

  wire [7:0] w1_QSV_0_0;
  wire [7:0] w1_QSV_0_1;
  wire [7:0] w1_QSV_1_0;
  wire [7:0] w1_QSV_1_1;
  wire [7:0] w1_QSV_2_0;
  wire [7:0] w1_QSV_2_1;
  wire [7:0] w1_QSV_3_0;
  wire [7:0] w1_QSV_3_1;
  wire [7:0] w1_QSV_4_0;
  wire [7:0] w1_QSV_4_1;
  wire [7:0] w1_QSV_5_0;
  wire [7:0] w1_QSV_5_1;
  wire [7:0] w1_QSV_6_0;
  wire [7:0] w1_QSV_6_1;
  wire [7:0] w1_QSV_7_0;
  wire [7:0] w1_QSV_7_1;
  wire       w1_valid;

  SWGate3QubitVector8bit m0 (
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
    .io_in_QSV_4_0  (io_in_QSV_4_0),
    .io_in_QSV_4_1  (io_in_QSV_4_1),
    .io_in_QSV_5_0  (io_in_QSV_5_0),
    .io_in_QSV_5_1  (io_in_QSV_5_1),
    .io_in_QSV_6_0  (io_in_QSV_6_0),
    .io_in_QSV_6_1  (io_in_QSV_6_1),
    .io_in_QSV_7_0  (io_in_QSV_7_0),
    .io_in_QSV_7_1  (io_in_QSV_7_1),
    .io_in_valid    (io_in_valid),
    .io_out_QSV_0_0 (w0_QSV_0_0),
    .io_out_QSV_0_1 (w0_QSV_0_1),
    .io_out_QSV_1_0 (w0_QSV_1_0),
    .io_out_QSV_1_1 (w0_QSV_1_1),
    .io_out_QSV_2_0 (w0_QSV_2_0),
    .io_out_QSV_2_1 (w0_QSV_2_1),
    .io_out_QSV_3_0 (w0_QSV_3_0),
    .io_out_QSV_3_1 (w0_QSV_3_1),
    .io_out_QSV_4_0 (w0_QSV_4_0),
    .io_out_QSV_4_1 (w0_QSV_4_1),
    .io_out_QSV_5_0 (w0_QSV_5_0),
    .io_out_QSV_5_1 (w0_QSV_5_1),
    .io_out_QSV_6_0 (w0_QSV_6_0),
    .io_out_QSV_6_1 (w0_QSV_6_1),
    .io_out_QSV_7_0 (w0_QSV_7_0),
    .io_out_QSV_7_1 (w0_QSV_7_1),
    .io_out_valid   (w0_valid)
  );

  CompatiblePerm_2 m1 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (w0_QSV_0_0),
    .io_in_QSV_0_1  (w0_QSV_0_1),
    .io_in_QSV_1_0  (w0_QSV_1_0),
    .io_in_QSV_1_1  (w0_QSV_1_1),
    .io_in_QSV_2_0  (w0_QSV_2_0),
    .io_in_QSV_2_1  (w0_QSV_2_1),
    .io_in_QSV_3_0  (w0_QSV_3_0),
    .io_in_QSV_3_1  (w0_QSV_3_1),
    .io_in_QSV_4_0  (w0_QSV_4_0),
    .io_in_QSV_4_1  (w0_QSV_4_1),
    .io_in_QSV_5_0  (w0_QSV_5_0),
    .io_in_QSV_5_1  (w0_QSV_5_1),
    .io_in_QSV_6_0  (w0_QSV_6_0),
    .io_in_QSV_6_1  (w0_QSV_6_1),
    .io_in_QSV_7_0  (w0_QSV_7_0),
    .io_in_QSV_7_1  (w0_QSV_7_1),
    .io_in_valid    (w0_valid),
    .io_out_QSV_0_0 (w1_QSV_0_0),
    .io_out_QSV_0_1 (w1_QSV_0_1),
    .io_out_QSV_1_0 (w1_QSV_1_0),
    .io_out_QSV_1_1 (w1_QSV_1_1),
    .io_out_QSV_2_0 (w1_QSV_2_0),
    .io_out_QSV_2_1 (w1_QSV_2_1),
    .io_out_QSV_3_0 (w1_QSV_3_0),
    .io_out_QSV_3_1 (w1_QSV_3_1),
    .io_out_QSV_4_0 (w1_QSV_4_0),
    .io_out_QSV_4_1 (w1_QSV_4_1),
    .io_out_QSV_5_0 (w1_QSV_5_0),
    .io_out_QSV_5_1 (w1_QSV_5_1),
    .io_out_QSV_6_0 (w1_QSV_6_0),
    .io_out_QSV_6_1 (w1_QSV_6_1),
    .io_out_QSV_7_0 (w1_QSV_7_0),
    .io_out_QSV_7_1 (w1_QSV_7_1),
    .io_out_valid   (w1_valid)
  );

  HGate3QubitVector8bit m2 (
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
    .io_in_QSV_4_0  (w1_QSV_4_0),
    .io_in_QSV_4_1  (w1_QSV_4_1),
    .io_in_QSV_5_0  (w1_QSV_5_0),
    .io_in_QSV_5_1  (w1_QSV_5_1),
    .io_in_QSV_6_0  (w1_QSV_6_0),
    .io_in_QSV_6_1  (w1_QSV_6_1),
    .io_in_QSV_7_0  (w1_QSV_7_0),
    .io_in_QSV_7_1  (w1_QSV_7_1),
    .io_in_valid    (w1_valid),
    .io_out_QSV_0_0 (io_out_QSV_0_0),
    .io_out_QSV_0_1 (io_out_QSV_0_1),
    .io_out_QSV_1_0 (io_out_QSV_1_0),
    .io_out_QSV_1_1 (io_out_QSV_1_1),
    .io_out_QSV_2_0 (io_out_QSV_2_0),
    .io_out_QSV_2_1 (io_out_QSV_2_1),
    .io_out_QSV_3_0 (io_out_QSV_3_0),
    .io_out_QSV_3_1 (io_out_QSV_3_1),
    .io_out_QSV_4_0 (io_out_QSV_4_0),
    .io_out_QSV_4_1 (io_out_QSV_4_1),
    .io_out_QSV_5_0 (io_out_QSV_5_0),
    .io_out_QSV_5_1 (io_out_QSV_5_1),
    .io_out_QSV_6_0 (io_out_QSV_6_0),
    .io_out_QSV_6_1 (io_out_QSV_6_1),
    .io_out_QSV_7_0 (io_out_QSV_7_0),
    .io_out_QSV_7_1 (io_out_QSV_7_1),
    .io_out_valid   (io_out_valid)
  );

endmodule
