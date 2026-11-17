module QuantumCircuit (
  input         clock,
  input         reset,
  input  [15:0] io_in_QSV_00_real,
  input  [15:0] io_in_QSV_00_imag,
  input  [15:0] io_in_QSV_01_real,
  input  [15:0] io_in_QSV_01_imag,
  input  [15:0] io_in_QSV_10_real,
  input  [15:0] io_in_QSV_10_imag,
  input  [15:0] io_in_QSV_11_real,
  input  [15:0] io_in_QSV_11_imag,
  input         io_in_valid,
  output [15:0] io_out_QSV_00_real,
  output [15:0] io_out_QSV_00_imag,
  output [15:0] io_out_QSV_01_real,
  output [15:0] io_out_QSV_01_imag,
  output [15:0] io_out_QSV_10_real,
  output [15:0] io_out_QSV_10_imag,
  output [15:0] io_out_QSV_11_real,
  output [15:0] io_out_QSV_11_imag,
  output        io_out_valid
);

  wire [15:0] _m_io_out_QSV_00_real;
  wire [15:0] _m_io_out_QSV_00_imag;
  wire [15:0] _m_io_out_QSV_01_real;
  wire [15:0] _m_io_out_QSV_01_imag;
  wire [15:0] _m_io_out_QSV_10_real;
  wire [15:0] _m_io_out_QSV_10_imag;
  wire [15:0] _m_io_out_QSV_11_real;
  wire [15:0] _m_io_out_QSV_11_imag;
  wire        _m_io_out_valid;

  HGate2QubitVector16bit m (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_00_real(io_in_QSV_00_real),
    .io_in_QSV_00_imag(io_in_QSV_00_imag),
    .io_in_QSV_01_real(io_in_QSV_01_real),
    .io_in_QSV_01_imag(io_in_QSV_01_imag),
    .io_in_QSV_10_real(io_in_QSV_10_real),
    .io_in_QSV_10_imag(io_in_QSV_10_imag),
    .io_in_QSV_11_real(io_in_QSV_11_real),
    .io_in_QSV_11_imag(io_in_QSV_11_imag),
    .io_in_valid(io_in_valid),
    .io_out_QSV_00_real(_m_io_out_QSV_00_real),
    .io_out_QSV_00_imag(_m_io_out_QSV_00_imag),
    .io_out_QSV_01_real(_m_io_out_QSV_01_real),
    .io_out_QSV_01_imag(_m_io_out_QSV_01_imag),
    .io_out_QSV_10_real(_m_io_out_QSV_10_real),
    .io_out_QSV_10_imag(_m_io_out_QSV_10_imag),
    .io_out_QSV_11_real(_m_io_out_QSV_11_real),
    .io_out_QSV_11_imag(_m_io_out_QSV_11_imag),
    .io_out_valid(_m_io_out_valid)
  );

  SXGate2QubitVector16bit m_1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_00_real(_m_io_out_QSV_00_real),
    .io_in_QSV_00_imag(_m_io_out_QSV_00_imag),
    .io_in_QSV_01_real(_m_io_out_QSV_01_real),
    .io_in_QSV_01_imag(_m_io_out_QSV_01_imag),
    .io_in_QSV_10_real(_m_io_out_QSV_10_real),
    .io_in_QSV_10_imag(_m_io_out_QSV_10_imag),
    .io_in_QSV_11_real(_m_io_out_QSV_11_real),
    .io_in_QSV_11_imag(_m_io_out_QSV_11_imag),
    .io_in_valid(_m_io_out_valid),
    .io_out_QSV_00_real(io_out_QSV_00_real),
    .io_out_QSV_00_imag(io_out_QSV_00_imag),
    .io_out_QSV_01_real(io_out_QSV_01_real),
    .io_out_QSV_01_imag(io_out_QSV_01_imag),
    .io_out_QSV_10_real(io_out_QSV_10_real),
    .io_out_QSV_10_imag(io_out_QSV_10_imag),
    .io_out_QSV_11_real(io_out_QSV_11_real),
    .io_out_QSV_11_imag(io_out_QSV_11_imag),
    .io_out_valid(io_out_valid)
  );

endmodule
