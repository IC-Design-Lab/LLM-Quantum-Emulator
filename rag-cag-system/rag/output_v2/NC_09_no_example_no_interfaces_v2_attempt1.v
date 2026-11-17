module top (
  input clock,
  input reset,
  input [15:0] io_in_QSV_0_real,
  input [15:0] io_in_QSV_0_imag,
  input [15:0] io_in_QSV_1_real,
  input [15:0] io_in_QSV_1_imag,
  input [15:0] io_in_QSV_2_real,
  input [15:0] io_in_QSV_2_imag,
  input [15:0] io_in_QSV_3_real,
  input [15:0] io_in_QSV_3_imag,
  input io_in_valid,
  output [15:0] io_out_QSV_0_real,
  output [15:0] io_out_QSV_0_imag,
  output [15:0] io_out_QSV_1_real,
  output [15:0] io_out_QSV_1_imag,
  output [15:0] io_out_QSV_2_real,
  output [15:0] io_out_QSV_2_imag,
  output [15:0] io_out_QSV_3_real,
  output [15:0] io_out_QSV_3_imag,
  output io_out_valid
);

  wire [15:0] _m_2_io_out_QSV_0_real;
  wire [15:0] _m_2_io_out_QSV_0_imag;
  wire [15:0] _m_2_io_out_QSV_1_real;
  wire [15:0] _m_2_io_out_QSV_1_imag;
  wire [15:0] _m_2_io_out_QSV_2_real;
  wire [15:0] _m_2_io_out_QSV_2_imag;
  wire [15:0] _m_2_io_out_QSV_3_real;
  wire [15:0] _m_2_io_out_QSV_3_imag;
  wire _m_2_io_out_valid;

  wire [15:0] _m_1_io_out_QSV_0_real;
  wire [15:0] _m_1_io_out_QSV_0_imag;
  wire [15:0] _m_1_io_out_QSV_1_real;
  wire [15:0] _m_1_io_out_QSV_1_imag;
  wire [15:0] _m_1_io_out_QSV_2_real;
  wire [15:0] _m_1_io_out_QSV_2_imag;
  wire [15:0] _m_1_io_out_QSV_3_real;
  wire [15:0] _m_1_io_out_QSV_3_imag;
  wire _m_1_io_out_valid;

  wire [15:0] _m_io_out_QSV_0_real;
  wire [15:0] _m_io_out_QSV_0_imag;
  wire [15:0] _m_io_out_QSV_1_real;
  wire [15:0] _m_io_out_QSV_1_imag;
  wire [15:0] _m_io_out_QSV_2_real;
  wire [15:0] _m_io_out_QSV_2_imag;
  wire [15:0] _m_io_out_QSV_3_real;
  wire [15:0] _m_io_out_QSV_3_imag;
  wire _m_io_out_valid;

  CompatiblePerm m (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_real(io_in_QSV_0_real),
    .io_in_QSV_0_imag(io_in_QSV_0_imag),
    .io_in_QSV_1_real(io_in_QSV_1_real),
    .io_in_QSV_1_imag(io_in_QSV_1_imag),
    .io_in_QSV_2_real(io_in_QSV_2_real),
    .io_in_QSV_2_imag(io_in_QSV_2_imag),
    .io_in_QSV_3_real(io_in_QSV_3_real),
    .io_in_QSV_3_imag(io_in_QSV_3_imag),
    .io_in_valid(io_in_valid),
    .io_out_QSV_0_real(_m_io_out_QSV_0_real),
    .io_out_QSV_0_imag(_m_io_out_QSV_0_imag),
    .io_out_QSV_1_real(_m_io_out_QSV_1_real),
    .io_out_QSV_1_imag(_m_io_out_QSV_1_imag),
    .io_out_QSV_2_real(_m_io_out_QSV_2_real),
    .io_out_QSV_2_imag(_m_io_out_QSV_2_imag),
    .io_out_QSV_3_real(_m_io_out_QSV_3_real),
    .io_out_QSV_3_imag(_m_io_out_QSV_3_imag),
    .io_out_valid(_m_io_out_valid)
  );

  XGate2QubitVector16bit m_1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_real(_m_io_out_QSV_0_real),
    .io_in_QSV_0_imag(_m_io_out_QSV_0_imag),
    .io_in_QSV_1_real(_m_io_out_QSV_1_real),
    .io_in_QSV_1_imag(_m_io_out_QSV_1_imag),
    .io_in_QSV_2_real(_m_io_out_QSV_2_real),
    .io_in_QSV_2_imag(_m_io_out_QSV_2_imag),
    .io_in_QSV_3_real(_m_io_out_QSV_3_real),
    .io_in_QSV_3_imag(_m_io_out_QSV_3_imag),
    .io_in_valid(_m_io_out_valid),
    .io_out_QSV_0_real(_m_1_io_out_QSV_0_real),
    .io_out_QSV_0_imag(_m_1_io_out_QSV_0_imag),
    .io_out_QSV_1_real(_m_1_io_out_QSV_1_real),
    .io_out_QSV_1_imag(_m_1_io_out_QSV_1_imag),
    .io_out_QSV_2_real(_m_1_io_out_QSV_2_real),
    .io_out_QSV_2_imag(_m_1_io_out_QSV_2_imag),
    .io_out_QSV_3_real(_m_1_io_out_QSV_3_real),
    .io_out_QSV_3_imag(_m_1_io_out_QSV_3_imag),
    .io_out_valid(_m_1_io_out_valid)
  );

  CompatiblePerm m_2 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_real(_m_1_io_out_QSV_0_real),
    .io_in_QSV_0_imag(_m_1_io_out_QSV_0_imag),
    .io_in_QSV_1_real(_m_1_io_out_QSV_1_real),
    .io_in_QSV_1_imag(_m_1_io_out_QSV_1_imag),
    .io_in_QSV_2_real(_m_1_io_out_QSV_2_real),
    .io_in_QSV_2_imag(_m_1_io_out_QSV_2_imag),
    .io_in_QSV_3_real(_m_1_io_out_QSV_3_real),
    .io_in_QSV_3_imag(_m_1_io_out_QSV_3_imag),
    .io_in_valid(_m_1_io_out_valid),
    .io_out_QSV_0_real(_m_2_io_out_QSV_0_real),
    .io_out_QSV_0_imag(_m_2_io_out_QSV_0_imag),
    .io_out_QSV_1_real(_m_2_io_out_QSV_1_real),
    .io_out_QSV_1_imag(_m_2_io_out_QSV_1_imag),
    .io_out_QSV_2_real(_m_2_io_out_QSV_2_real),
    .io_out_QSV_2_imag(_m_2_io_out_QSV_2_imag),
    .io_out_QSV_3_real(_m_2_io_out_QSV_3_real),
    .io_out_QSV_3_imag(_m_2_io_out_QSV_3_imag),
    .io_out_valid(_m_2_io_out_valid)
  );

  HGate2QubitVector16bit m_3 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_real(_m_2_io_out_QSV_0_real),
    .io_in_QSV_0_imag(_m_2_io_out_QSV_0_imag),
    .io_in_QSV_1_real(_m_2_io_out_QSV_1_real),
    .io_in_QSV_1_imag(_m_2_io_out_QSV_1_imag),
    .io_in_QSV_2_real(_m_2_io_out_QSV_2_real),
    .io_in_QSV_2_imag(_m_2_io_out_QSV_2_imag),
    .io_in_QSV_3_real(_m_2_io_out_QSV_3_real),
    .io_in_QSV_3_imag(_m_2_io_out_QSV_3_imag),
    .io_in_valid(_m_2_io_out_valid),
    .io_out_QSV_0_real(io_out_QSV_0_real),
    .io_out_QSV_0_imag(io_out_QSV_0_imag),
    .io_out_QSV_1_real(io_out_QSV_1_real),
    .io_out_QSV_1_imag(io_out_QSV_1_imag),
    .io_out_QSV_2_real(io_out_QSV_2_real),
    .io_out_QSV_2_imag(io_out_QSV_2_imag),
    .io_out_QSV_3_real(io_out_QSV_3_real),
    .io_out_QSV_3_imag(io_out_QSV_3_imag),
    .io_out_valid(io_out_valid)
  );

endmodule
