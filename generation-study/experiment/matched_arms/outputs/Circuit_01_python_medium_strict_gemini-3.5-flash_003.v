module Circuit_01 (
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
  output wire [15:0] io_out_QSV_0_0,
  output wire [15:0] io_out_QSV_0_1,
  output wire [15:0] io_out_QSV_1_0,
  output wire [15:0] io_out_QSV_1_1,
  output wire [15:0] io_out_QSV_2_0,
  output wire [15:0] io_out_QSV_2_1,
  output wire [15:0] io_out_QSV_3_0,
  output wire [15:0] io_out_QSV_3_1,
  output wire        io_out_valid
);

  wire [15:0] _m1_io_out_QSV_0_0, _m1_io_out_QSV_0_1, _m1_io_out_QSV_1_0, _m1_io_out_QSV_1_1;
  wire [15:0] _m1_io_out_QSV_2_0, _m1_io_out_QSV_2_1, _m1_io_out_QSV_3_0, _m1_io_out_QSV_3_1;
  wire        _m1_io_out_valid;

  wire [15:0] _m2_0_io_out_QSV_0_0, _m2_0_io_out_QSV_0_1, _m2_0_io_out_QSV_1_0, _m2_0_io_out_QSV_1_1;
  wire [15:0] _m2_0_io_out_QSV_2_0, _m2_0_io_out_QSV_2_1, _m2_0_io_out_QSV_3_0, _m2_0_io_out_QSV_3_1;
  wire        _m2_0_io_out_valid;

  wire [15:0] _m2_io_out_QSV_0_0, _m2_io_out_QSV_0_1, _m2_io_out_QSV_1_0, _m2_io_out_QSV_1_1;
  wire [15:0] _m2_io_out_QSV_2_0, _m2_io_out_QSV_2_1, _m2_io_out_QSV_3_0, _m2_io_out_QSV_3_1;
  wire        _m2_io_out_valid;

  wire [15:0] _m2_1_io_out_QSV_0_0, _m2_1_io_out_QSV_0_1, _m2_1_io_out_QSV_1_0, _m2_1_io_out_QSV_1_1;
  wire [15:0] _m2_1_io_out_QSV_2_0, _m2_1_io_out_QSV_2_1, _m2_1_io_out_QSV_3_0, _m2_1_io_out_QSV_3_1;
  wire        _m2_1_io_out_valid;

  HGate2QubitVector16bit m1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(io_in_QSV_0_0),
    .io_in_QSV_0_1(io_in_QSV_0_1),
    .io_in_QSV_1_0(io_in_QSV_1_0),
    .io_in_QSV_1_1(io_in_QSV_1_1),
    .io_in_QSV_2_0(io_in_QSV_2_0),
    .io_in_QSV_2_1(io_in_QSV_2_1),
    .io_in_QSV_3_0(io_in_QSV_3_0),
    .io_in_QSV_3_1(io_in_QSV_3_1),
    .io_in_valid(io_in_valid),
    .io_out_QSV_0_0(_m1_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m1_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m1_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m1_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m1_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m1_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m1_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m1_io_out_QSV_3_1),
    .io_out_valid(_m1_io_out_valid)
  );

  CompatiblePerm m2_0 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m1_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m1_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m1_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m1_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m1_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m1_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m1_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m1_io_out_QSV_3_1),
    .io_in_valid(_m1_io_out_valid),
    .io_out_QSV_0_0(_m2_0_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m2_0_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m2_0_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m2_0_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m2_0_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m2_0_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m2_0_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m2_0_io_out_QSV_3_1),
    .io_out_valid(_m2_0_io_out_valid)
  );

  XGate2QubitVector16bit m2 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m2_0_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m2_0_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m2_0_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m2_0_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m2_0_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m2_0_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m2_0_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m2_0_io_out_QSV_3_1),
    .io_in_valid(_m2_0_io_out_valid),
    .io_out_QSV_0_0(_m2_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m2_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m2_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m2_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m2_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m2_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m2_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m2_io_out_QSV_3_1),
    .io_out_valid(_m2_io_out_valid)
  );

  CompatiblePerm m2_1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m2_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m2_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m2_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m2_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m2_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m2_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m2_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m2_io_out_QSV_3_1),
    .io_in_valid(_m2_io_out_valid),
    .io_out_QSV_0_0(_m2_1_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m2_1_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m2_1_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m2_1_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m2_1_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m2_1_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m2_1_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m2_1_io_out_QSV_3_1),
    .io_out_valid(_m2_1_io_out_valid)
  );

  SWGate2QubitVector16bit m3 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m2_1_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m2_1_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m2_1_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m2_1_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m2_1_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m2_1_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m2_1_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m2_1_io_out_QSV_3_1),
    .io_in_valid(_m2_1_io_out_valid),
    .io_out_QSV_0_0(io_out_QSV_0_0),
    .io_out_QSV_0_1(io_out_QSV_0_1),
    .io_out_QSV_1_0(io_out_QSV_1_0),
    .io_out_QSV_1_1(io_out_QSV_1_1),
    .io_out_QSV_2_0(io_out_QSV_2_0),
    .io_out_QSV_2_1(io_out_QSV_2_1),
    .io_out_QSV_3_0(io_out_QSV_3_0),
    .io_out_QSV_3_1(io_out_QSV_3_1),
    .io_out_valid(io_out_valid)
  );

endmodule
