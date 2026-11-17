module QuantumCircuit (
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

  wire [15:0] _m0_io_out_QSV_0_0;
  wire [15:0] _m0_io_out_QSV_0_1;
  wire [15:0] _m0_io_out_QSV_1_0;
  wire [15:0] _m0_io_out_QSV_1_1;
  wire [15:0] _m0_io_out_QSV_2_0;
  wire [15:0] _m0_io_out_QSV_2_1;
  wire [15:0] _m0_io_out_QSV_3_0;
  wire [15:0] _m0_io_out_QSV_3_1;
  wire        _m0_io_out_valid;

  wire [15:0] _m1_io_out_QSV_0_0;
  wire [15:0] _m1_io_out_QSV_0_1;
  wire [15:0] _m1_io_out_QSV_1_0;
  wire [15:0] _m1_io_out_QSV_1_1;
  wire [15:0] _m1_io_out_QSV_2_0;
  wire [15:0] _m1_io_out_QSV_2_1;
  wire [15:0] _m1_io_out_QSV_3_0;
  wire [15:0] _m1_io_out_QSV_3_1;
  wire        _m1_io_out_valid;

  wire [15:0] _m2_io_out_QSV_0_0;
  wire [15:0] _m2_io_out_QSV_0_1;
  wire [15:0] _m2_io_out_QSV_1_0;
  wire [15:0] _m2_io_out_QSV_1_1;
  wire [15:0] _m2_io_out_QSV_2_0;
  wire [15:0] _m2_io_out_QSV_2_1;
  wire [15:0] _m2_io_out_QSV_3_0;
  wire [15:0] _m2_io_out_QSV_3_1;
  wire        _m2_io_out_valid;

  wire [15:0] _m3_io_out_QSV_0_0;
  wire [15:0] _m3_io_out_QSV_0_1;
  wire [15:0] _m3_io_out_QSV_1_0;
  wire [15:0] _m3_io_out_QSV_1_1;
  wire [15:0] _m3_io_out_QSV_2_0;
  wire [15:0] _m3_io_out_QSV_2_1;
  wire [15:0] _m3_io_out_QSV_3_0;
  wire [15:0] _m3_io_out_QSV_3_1;
  wire        _m3_io_out_valid;

  wire [15:0] _m4_io_out_QSV_0_0;
  wire [15:0] _m4_io_out_QSV_0_1;
  wire [15:0] _m4_io_out_QSV_1_0;
  wire [15:0] _m4_io_out_QSV_1_1;
  wire [15:0] _m4_io_out_QSV_2_0;
  wire [15:0] _m4_io_out_QSV_2_1;
  wire [15:0] _m4_io_out_QSV_3_0;
  wire [15:0] _m4_io_out_QSV_3_1;
  wire        _m4_io_out_valid;

  wire [15:0] _m5_io_out_QSV_0_0;
  wire [15:0] _m5_io_out_QSV_0_1;
  wire [15:0] _m5_io_out_QSV_1_0;
  wire [15:0] _m5_io_out_QSV_1_1;
  wire [15:0] _m5_io_out_QSV_2_0;
  wire [15:0] _m5_io_out_QSV_2_1;
  wire [15:0] _m5_io_out_QSV_3_0;
  wire [15:0] _m5_io_out_QSV_3_1;
  wire        _m5_io_out_valid;

  wire [15:0] _m6_io_out_QSV_0_0;
  wire [15:0] _m6_io_out_QSV_0_1;
  wire [15:0] _m6_io_out_QSV_1_0;
  wire [15:0] _m6_io_out_QSV_1_1;
  wire [15:0] _m6_io_out_QSV_2_0;
  wire [15:0] _m6_io_out_QSV_2_1;
  wire [15:0] _m6_io_out_QSV_3_0;
  wire [15:0] _m6_io_out_QSV_3_1;
  wire        _m6_io_out_valid;

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
    .io_out_QSV_0_0 (_m0_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m0_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m0_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m0_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m0_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m0_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m0_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m0_io_out_QSV_3_1),
    .io_out_valid   (_m0_io_out_valid)
  );

  CompatiblePerm m1 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m0_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m0_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m0_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m0_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m0_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m0_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m0_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m0_io_out_QSV_3_1),
    .io_in_valid    (_m0_io_out_valid),
    .io_out_QSV_0_0 (_m1_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m1_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m1_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m1_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m1_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m1_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m1_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m1_io_out_QSV_3_1),
    .io_out_valid   (_m1_io_out_valid)
  );

  XGate2QubitVector16bit m2 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m1_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m1_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m1_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m1_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m1_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m1_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m1_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m1_io_out_QSV_3_1),
    .io_in_valid    (_m1_io_out_valid),
    .io_out_QSV_0_0 (_m2_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m2_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m2_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m2_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m2_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m2_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m2_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m2_io_out_QSV_3_1),
    .io_out_valid   (_m2_io_out_valid)
  );

  CompatiblePerm m3 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m2_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m2_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m2_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m2_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m2_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m2_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m2_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m2_io_out_QSV_3_1),
    .io_in_valid    (_m2_io_out_valid),
    .io_out_QSV_0_0 (_m3_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m3_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m3_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m3_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m3_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m3_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m3_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m3_io_out_QSV_3_1),
    .io_out_valid   (_m3_io_out_valid)
  );

  SWGate2QubitVector16bit m4 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m3_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m3_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m3_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m3_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m3_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m3_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m3_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m3_io_out_QSV_3_1),
    .io_in_valid    (_m3_io_out_valid),
    .io_out_QSV_0_0 (_m4_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m4_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m4_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m4_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m4_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m4_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m4_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m4_io_out_QSV_3_1),
    .io_out_valid   (_m4_io_out_valid)
  );

  CompatiblePerm m5 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m4_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m4_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m4_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m4_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m4_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m4_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m4_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m4_io_out_QSV_3_1),
    .io_in_valid    (_m4_io_out_valid),
    .io_out_QSV_0_0 (_m5_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m5_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m5_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m5_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m5_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m5_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m5_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m5_io_out_QSV_3_1),
    .io_out_valid   (_m5_io_out_valid)
  );

  XGate2QubitVector16bit m6 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m5_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m5_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m5_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m5_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m5_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m5_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m5_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m5_io_out_QSV_3_1),
    .io_in_valid    (_m5_io_out_valid),
    .io_out_QSV_0_0 (_m6_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m6_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m6_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m6_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m6_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m6_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m6_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m6_io_out_QSV_3_1),
    .io_out_valid   (_m6_io_out_valid)
  );

  CompatiblePerm m7 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m6_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m6_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m6_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m6_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m6_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m6_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m6_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m6_io_out_QSV_3_1),
    .io_in_valid    (_m6_io_out_valid),
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
