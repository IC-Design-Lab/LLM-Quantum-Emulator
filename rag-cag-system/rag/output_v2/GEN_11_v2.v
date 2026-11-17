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

  wire [15:0] _m_5_io_out_QSV_0_0;
  wire [15:0] _m_5_io_out_QSV_0_1;
  wire [15:0] _m_5_io_out_QSV_1_0;
  wire [15:0] _m_5_io_out_QSV_1_1;
  wire [15:0] _m_5_io_out_QSV_2_0;
  wire [15:0] _m_5_io_out_QSV_2_1;
  wire [15:0] _m_5_io_out_QSV_3_0;
  wire [15:0] _m_5_io_out_QSV_3_1;
  wire        _m_5_io_out_valid;

  wire [15:0] _m_4_io_out_QSV_0_0;
  wire [15:0] _m_4_io_out_QSV_0_1;
  wire [15:0] _m_4_io_out_QSV_1_0;
  wire [15:0] _m_4_io_out_QSV_1_1;
  wire [15:0] _m_4_io_out_QSV_2_0;
  wire [15:0] _m_4_io_out_QSV_2_1;
  wire [15:0] _m_4_io_out_QSV_3_0;
  wire [15:0] _m_4_io_out_QSV_3_1;
  wire        _m_4_io_out_valid;

  wire [15:0] _m_3_io_out_QSV_0_0;
  wire [15:0] _m_3_io_out_QSV_0_1;
  wire [15:0] _m_3_io_out_QSV_1_0;
  wire [15:0] _m_3_io_out_QSV_1_1;
  wire [15:0] _m_3_io_out_QSV_2_0;
  wire [15:0] _m_3_io_out_QSV_2_1;
  wire [15:0] _m_3_io_out_QSV_3_0;
  wire [15:0] _m_3_io_out_QSV_3_1;
  wire        _m_3_io_out_valid;

  wire [15:0] _m_2_io_out_QSV_0_0;
  wire [15:0] _m_2_io_out_QSV_0_1;
  wire [15:0] _m_2_io_out_QSV_1_0;
  wire [15:0] _m_2_io_out_QSV_1_1;
  wire [15:0] _m_2_io_out_QSV_2_0;
  wire [15:0] _m_2_io_out_QSV_2_1;
  wire [15:0] _m_2_io_out_QSV_3_0;
  wire [15:0] _m_2_io_out_QSV_3_1;
  wire        _m_2_io_out_valid;

  wire [15:0] _m_1_io_out_QSV_0_0;
  wire [15:0] _m_1_io_out_QSV_0_1;
  wire [15:0] _m_1_io_out_QSV_1_0;
  wire [15:0] _m_1_io_out_QSV_1_1;
  wire [15:0] _m_1_io_out_QSV_2_0;
  wire [15:0] _m_1_io_out_QSV_2_1;
  wire [15:0] _m_1_io_out_QSV_3_0;
  wire [15:0] _m_1_io_out_QSV_3_1;
  wire        _m_1_io_out_valid;

  wire [15:0] _m_io_out_QSV_0_0;
  wire [15:0] _m_io_out_QSV_0_1;
  wire [15:0] _m_io_out_QSV_1_0;
  wire [15:0] _m_io_out_QSV_1_1;
  wire [15:0] _m_io_out_QSV_2_0;
  wire [15:0] _m_io_out_QSV_2_1;
  wire [15:0] _m_io_out_QSV_3_0;
  wire [15:0] _m_io_out_QSV_3_1;
  wire        _m_io_out_valid;

  CompatiblePerm m (
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
    .io_out_QSV_0_0 (_m_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_io_out_QSV_3_1),
    .io_out_valid   (_m_io_out_valid)
  );

  XGate2QubitVector16bit m_1 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_io_out_QSV_3_1),
    .io_in_valid    (_m_io_out_valid),
    .io_out_QSV_0_0 (_m_1_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_1_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_1_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_1_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_1_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_1_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_1_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_1_io_out_QSV_3_1),
    .io_out_valid   (_m_1_io_out_valid)
  );

  CompatiblePerm m_2 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_1_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_1_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_1_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_1_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_1_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_1_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_1_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_1_io_out_QSV_3_1),
    .io_in_valid    (_m_1_io_out_valid),
    .io_out_QSV_0_0 (_m_2_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_2_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_2_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_2_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_2_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_2_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_2_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_2_io_out_QSV_3_1),
    .io_out_valid   (_m_2_io_out_valid)
  );

  HGate2QubitVector16bit m_3 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_2_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_2_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_2_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_2_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_2_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_2_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_2_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_2_io_out_QSV_3_1),
    .io_in_valid    (_m_2_io_out_valid),
    .io_out_QSV_0_0 (_m_3_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_3_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_3_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_3_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_3_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_3_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_3_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_3_io_out_QSV_3_1),
    .io_out_valid   (_m_3_io_out_valid)
  );

  CompatiblePerm m_4 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_3_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_3_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_3_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_3_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_3_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_3_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_3_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_3_io_out_QSV_3_1),
    .io_in_valid    (_m_3_io_out_valid),
    .io_out_QSV_0_0 (_m_4_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_4_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_4_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_4_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_4_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_4_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_4_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_4_io_out_QSV_3_1),
    .io_out_valid   (_m_4_io_out_valid)
  );

  CNGate2QubitVector16bit m_5 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_4_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_4_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_4_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_4_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_4_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_4_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_4_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_4_io_out_QSV_3_1),
    .io_in_valid    (_m_4_io_out_valid),
    .io_out_QSV_0_0 (_m_5_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_5_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_5_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_5_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_5_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_5_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_5_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_5_io_out_QSV_3_1),
    .io_out_valid   (_m_5_io_out_valid)
  );

  CompatiblePerm m_6 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_5_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_5_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_5_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_5_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_5_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_5_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_5_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_5_io_out_QSV_3_1),
    .io_in_valid    (_m_5_io_out_valid),
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
