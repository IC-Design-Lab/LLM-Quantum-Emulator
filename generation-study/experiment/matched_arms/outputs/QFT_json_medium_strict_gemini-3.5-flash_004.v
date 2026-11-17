module QFT (
  input  logic       clock,
  input  logic       reset,
  input  logic [7:0] io_in_QSV_0_0,
  input  logic [7:0] io_in_QSV_0_1,
  input  logic [7:0] io_in_QSV_1_0,
  input  logic [7:0] io_in_QSV_1_1,
  input  logic [7:0] io_in_QSV_2_0,
  input  logic [7:0] io_in_QSV_2_1,
  input  logic [7:0] io_in_QSV_3_0,
  input  logic [7:0] io_in_QSV_3_1,
  input  logic [7:0] io_in_QSV_4_0,
  input  logic [7:0] io_in_QSV_4_1,
  input  logic [7:0] io_in_QSV_5_0,
  input  logic [7:0] io_in_QSV_5_1,
  input  logic [7:0] io_in_QSV_6_0,
  input  logic [7:0] io_in_QSV_6_1,
  input  logic [7:0] io_in_QSV_7_0,
  input  logic [7:0] io_in_QSV_7_1,
  input  logic       io_in_valid,
  output logic [7:0] io_out_QSV_0_0,
  output logic [7:0] io_out_QSV_0_1,
  output logic [7:0] io_out_QSV_1_0,
  output logic [7:0] io_out_QSV_1_1,
  output logic [7:0] io_out_QSV_2_0,
  output logic [7:0] io_out_QSV_2_1,
  output logic [7:0] io_out_QSV_3_0,
  output logic [7:0] io_out_QSV_3_1,
  output logic [7:0] io_out_QSV_4_0,
  output logic [7:0] io_out_QSV_4_1,
  output logic [7:0] io_out_QSV_5_0,
  output logic [7:0] io_out_QSV_5_1,
  output logic [7:0] io_out_QSV_6_0,
  output logic [7:0] io_out_QSV_6_1,
  output logic [7:0] io_out_QSV_7_0,
  output logic [7:0] io_out_QSV_7_1,
  output logic       io_out_valid
);

  wire [7:0] _m0_io_out_QSV_0_0;
  wire [7:0] _m0_io_out_QSV_0_1;
  wire [7:0] _m0_io_out_QSV_1_0;
  wire [7:0] _m0_io_out_QSV_1_1;
  wire [7:0] _m0_io_out_QSV_2_0;
  wire [7:0] _m0_io_out_QSV_2_1;
  wire [7:0] _m0_io_out_QSV_3_0;
  wire [7:0] _m0_io_out_QSV_3_1;
  wire [7:0] _m0_io_out_QSV_4_0;
  wire [7:0] _m0_io_out_QSV_4_1;
  wire [7:0] _m0_io_out_QSV_5_0;
  wire [7:0] _m0_io_out_QSV_5_1;
  wire [7:0] _m0_io_out_QSV_6_0;
  wire [7:0] _m0_io_out_QSV_6_1;
  wire [7:0] _m0_io_out_QSV_7_0;
  wire [7:0] _m0_io_out_QSV_7_1;
  wire       _m0_io_out_valid;

  HGate3QubitVector8bit m0 (
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
    .io_in_QSV_4_0(io_in_QSV_4_0),
    .io_in_QSV_4_1(io_in_QSV_4_1),
    .io_in_QSV_5_0(io_in_QSV_5_0),
    .io_in_QSV_5_1(io_in_QSV_5_1),
    .io_in_QSV_6_0(io_in_QSV_6_0),
    .io_in_QSV_6_1(io_in_QSV_6_1),
    .io_in_QSV_7_0(io_in_QSV_7_0),
    .io_in_QSV_7_1(io_in_QSV_7_1),
    .io_in_valid(io_in_valid),
    .io_out_QSV_0_0(_m0_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m0_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m0_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m0_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m0_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m0_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m0_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m0_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m0_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m0_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m0_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m0_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m0_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m0_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m0_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m0_io_out_QSV_7_1),
    .io_out_valid(_m0_io_out_valid)
  );

  wire [7:0] _m1_io_out_QSV_0_0;
  wire [7:0] _m1_io_out_QSV_0_1;
  wire [7:0] _m1_io_out_QSV_1_0;
  wire [7:0] _m1_io_out_QSV_1_1;
  wire [7:0] _m1_io_out_QSV_2_0;
  wire [7:0] _m1_io_out_QSV_2_1;
  wire [7:0] _m1_io_out_QSV_3_0;
  wire [7:0] _m1_io_out_QSV_3_1;
  wire [7:0] _m1_io_out_QSV_4_0;
  wire [7:0] _m1_io_out_QSV_4_1;
  wire [7:0] _m1_io_out_QSV_5_0;
  wire [7:0] _m1_io_out_QSV_5_1;
  wire [7:0] _m1_io_out_QSV_6_0;
  wire [7:0] _m1_io_out_QSV_6_1;
  wire [7:0] _m1_io_out_QSV_7_0;
  wire [7:0] _m1_io_out_QSV_7_1;
  wire       _m1_io_out_valid;

  CSGate3QubitVector8bit m1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m0_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m0_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m0_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m0_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m0_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m0_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m0_io_out_QSV_3_0),
    .io_in_QSV_4_0(_m0_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m0_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m0_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m0_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m0_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m0_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m0_io_out_QSV_7_0),
    .io_in_valid(_m0_io_out_valid),
    .io_out_QSV_0_0(_m1_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m1_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m1_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m1_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m1_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m1_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m1_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m1_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m1_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m1_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m1_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m1_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m1_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m1_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m1_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m1_io_out_QSV_7_1),
    .io_out_valid(_m1_io_out_valid)
  );

  wire [7:0] _m2_p1_io_out_QSV_0_0;
  wire [7:0] _m2_p1_io_out_QSV_0_1;
  wire [7:0] _m2_p1_io_out_QSV_1_0;
  wire [7:0] _m2_p1_io_out_QSV_1_1;
  wire [7:0] _m2_p1_io_out_QSV_2_0;
  wire [7:0] _m2_p1_io_out_QSV_2_1;
  wire [7:0] _m2_p1_io_out_QSV_3_0;
  wire [7:0] _m2_p1_io_out_QSV_3_1;
  wire [7:0] _m2_p1_io_out_QSV_4_0;
  wire [7:0] _m2_p1_io_out_QSV_4_1;
  wire [7:0] _m2_p1_io_out_QSV_5_0;
  wire [7:0] _m2_p1_io_out_QSV_5_1;
  wire [7:0] _m2_p1_io_out_QSV_6_0;
  wire [7:0] _m2_p1_io_out_QSV_6_1;
  wire [7:0] _m2_p1_io_out_QSV_7_0;
  wire [7:0] _m2_p1_io_out_QSV_7_1;
  wire       _m2_p1_io_out_valid;

  CompatiblePerm_2 m2_p1 (
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
    .io_in_QSV_4_0(_m1_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m1_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m1_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m1_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m1_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m1_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m1_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m1_io_out_QSV_7_1),
    .io_in_valid(_m1_io_out_valid),
    .io_out_QSV_0_0(_m2_p1_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m2_p1_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m2_p1_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m2_p1_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m2_p1_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m2_p1_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m2_p1_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m2_p1_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m2_p1_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m2_p1_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m2_p1_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m2_p1_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m2_p1_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m2_p1_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m2_p1_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m2_p1_io_out_QSV_7_1),
    .io_out_valid(_m2_p1_io_out_valid)
  );

  wire [7:0] _m2_io_out_QSV_0_0;
  wire [7:0] _m2_io_out_QSV_0_1;
  wire [7:0] _m2_io_out_QSV_1_0;
  wire [7:0] _m2_io_out_QSV_1_1;
  wire [7:0] _m2_io_out_QSV_2_0;
  wire [7:0] _m2_io_out_QSV_2_1;
  wire [7:0] _m2_io_out_QSV_3_0;
  wire [7:0] _m2_io_out_QSV_3_1;
  wire [7:0] _m2_io_out_QSV_4_0;
  wire [7:0] _m2_io_out_QSV_4_1;
  wire [7:0] _m2_io_out_QSV_5_0;
  wire [7:0] _m2_io_out_QSV_5_1;
  wire [7:0] _m2_io_out_QSV_6_0;
  wire [7:0] _m2_io_out_QSV_6_1;
  wire [7:0] _m2_io_out_QSV_7_0;
  wire [7:0] _m2_io_out_QSV_7_1;
  wire       _m2_io_out_valid;

  CTGate3QubitVector8bit m2 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m2_p1_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m2_p1_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m2_p1_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m2_p1_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m2_p1_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m2_p1_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m2_p1_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m2_p1_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m2_p1_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m2_p1_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m2_p1_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m2_p1_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m2_p1_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m2_p1_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m2_p1_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m2_p1_io_out_QSV_7_1),
    .io_in_valid(_m2_p1_io_out_valid),
    .io_out_QSV_0_0(_m2_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m2_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m2_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m2_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m2_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m2_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m2_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m2_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m2_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m2_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m2_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m2_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m2_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m2_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m2_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m2_io_out_QSV_7_1),
    .io_out_valid(_m2_io_out_valid)
  );

  wire [7:0] _m2_p2_io_out_QSV_0_0;
  wire [7:0] _m2_p2_io_out_QSV_0_1;
  wire [7:0] _m2_p2_io_out_QSV_1_0;
  wire [7:0] _m2_p2_io_out_QSV_1_1;
  wire [7:0] _m2_p2_io_out_QSV_2_0;
  wire [7:0] _m2_p2_io_out_QSV_2_1;
  wire [7:0] _m2_p2_io_out_QSV_3_0;
  wire [7:0] _m2_p2_io_out_QSV_3_1;
  wire [7:0] _m2_p2_io_out_QSV_4_0;
  wire [7:0] _m2_p2_io_out_QSV_4_1;
  wire [7:0] _m2_p2_io_out_QSV_5_0;
  wire [7:0] _m2_p2_io_out_QSV_5_1;
  wire [7:0] _m2_p2_io_out_QSV_6_0;
  wire [7:0] _m2_p2_io_out_QSV_6_1;
  wire [7:0] _m2_p2_io_out_QSV_7_0;
  wire [7:0] _m2_p2_io_out_QSV_7_1;
  wire       _m2_p2_io_out_valid;

  CompatiblePerm_2 m2_p2 (
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
    .io_in_QSV_4_0(_m2_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m2_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m2_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m2_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m2_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m2_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m2_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m2_io_out_QSV_7_1),
    .io_in_valid(_m2_io_out_valid),
    .io_out_QSV_0_0(_m2_p2_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m2_p2_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m2_p2_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m2_p2_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m2_p2_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m2_p2_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m2_p2_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m2_p2_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m2_p2_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m2_p2_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m2_p2_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m2_p2_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m2_p2_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m2_p2_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m2_p2_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m2_p2_io_out_QSV_7_1),
    .io_out_valid(_m2_p2_io_out_valid)
  );

  wire [7:0] _m3_p1_io_out_QSV_0_0;
  wire [7:0] _m3_p1_io_out_QSV_0_1;
  wire [7:0] _m3_p1_io_out_QSV_1_0;
  wire [7:0] _m3_p1_io_out_QSV_1_1;
  wire [7:0] _m3_p1_io_out_QSV_2_0;
  wire [7:0] _m3_p1_io_out_QSV_2_1;
  wire [7:0] _m3_p1_io_out_QSV_3_0;
  wire [7:0] _m3_p1_io_out_QSV_3_1;
  wire [7:0] _m3_p1_io_out_QSV_4_0;
  wire [7:0] _m3_p1_io_out_QSV_4_1;
  wire [7:0] _m3_p1_io_out_QSV_5_0;
  wire [7:0] _m3_p1_io_out_QSV_5_1;
  wire [7:0] _m3_p1_io_out_QSV_6_0;
  wire [7:0] _m3_p1_io_out_QSV_6_1;
  wire [7:0] _m3_p1_io_out_QSV_7_0;
  wire [7:0] _m3_p1_io_out_QSV_7_1;
  wire       _m3_p1_io_out_valid;

  CompatiblePerm m3_p1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m2_p2_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m2_p2_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m2_p2_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m2_p2_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m2_p2_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m2_p2_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m2_p2_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m2_p2_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m2_p2_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m2_p2_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m2_p2_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m2_p2_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m2_p2_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m2_p2_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m2_p2_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m2_p2_io_out_QSV_7_1),
    .io_in_valid(_m2_p2_io_out_valid),
    .io_out_QSV_0_0(_m3_p1_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m3_p1_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m3_p1_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m3_p1_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m3_p1_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m3_p1_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m3_p1_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m3_p1_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m3_p1_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m3_p1_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m3_p1_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m3_p1_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m3_p1_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m3_p1_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m3_p1_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m3_p1_io_out_QSV_7_1),
    .io_out_valid(_m3_p1_io_out_valid)
  );

  wire [7:0] _m3_io_out_QSV_0_0;
  wire [7:0] _m3_io_out_QSV_0_1;
  wire [7:0] _m3_io_out_QSV_1_0;
  wire [7:0] _m3_io_out_QSV_1_1;
  wire [7:0] _m3_io_out_QSV_2_0;
  wire [7:0] _m3_io_out_QSV_2_1;
  wire [7:0] _m3_io_out_QSV_3_0;
  wire [7:0] _m3_io_out_QSV_3_1;
  wire [7:0] _m3_io_out_QSV_4_0;
  wire [7:0] _m3_io_out_QSV_4_1;
  wire [7:0] _m3_io_out_QSV_5_0;
  wire [7:0] _m3_io_out_QSV_5_1;
  wire [7:0] _m3_io_out_QSV_6_0;
  wire [7:0] _m3_io_out_QSV_6_1;
  wire [7:0] _m3_io_out_QSV_7_0;
  wire [7:0] _m3_io_out_QSV_7_1;
  wire       _m3_io_out_valid;

  HGate3QubitVector8bit m3 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m3_p1_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m3_p1_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m3_p1_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m3_p1_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m3_p1_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m3_p1_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m3_p1_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m3_p1_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m3_p1_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m3_p1_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m3_p1_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m3_p1_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m3_p1_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m3_p1_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m3_p1_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m3_p1_io_out_QSV_7_1),
    .io_in_valid(_m3_p1_io_out_valid),
    .io_out_QSV_0_0(_m3_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m3_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m3_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m3_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m3_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m3_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m3_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m3_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m3_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m3_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m3_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m3_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m3_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m3_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m3_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m3_io_out_QSV_7_1),
    .io_out_valid(_m3_io_out_valid)
  );

  wire [7:0] _m3_p2_io_out_QSV_0_0;
  wire [7:0] _m3_p2_io_out_QSV_0_1;
  wire [7:0] _m3_p2_io_out_QSV_1_0;
  wire [7:0] _m3_p2_io_out_QSV_1_1;
  wire [7:0] _m3_p2_io_out_QSV_2_0;
  wire [7:0] _m3_p2_io_out_QSV_2_1;
  wire [7:0] _m3_p2_io_out_QSV_3_0;
  wire [7:0] _m3_p2_io_out_QSV_3_1;
  wire [7:0] _m3_p2_io_out_QSV_4_0;
  wire [7:0] _m3_p2_io_out_QSV_4_1;
  wire [7:0] _m3_p2_io_out_QSV_5_0;
  wire [7:0] _m3_p2_io_out_QSV_5_1;
  wire [7:0] _m3_p2_io_out_QSV_6_0;
  wire [7:0] _m3_p2_io_out_QSV_6_1;
  wire [7:0] _m3_p2_io_out_QSV_7_0;
  wire [7:0] _m3_p2_io_out_QSV_7_1;
  wire       _m3_p2_io_out_valid;

  CompatiblePerm m3_p2 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m3_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m3_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m3_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m3_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m3_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m3_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m3_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m3_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m3_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m3_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m3_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m3_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m3_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m3_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m3_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m3_io_out_QSV_7_1),
    .io_in_valid(_m3_io_out_valid),
    .io_out_QSV_0_0(_m3_p2_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m3_p2_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m3_p2_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m3_p2_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m3_p2_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m3_p2_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m3_p2_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m3_p2_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m3_p2_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m3_p2_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m3_p2_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m3_p2_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m3_p2_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m3_p2_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m3_p2_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m3_p2_io_out_QSV_7_1),
    .io_out_valid(_m3_p2_io_out_valid)
  );

  wire [7:0] _m4_p1_io_out_QSV_0_0;
  wire [7:0] _m4_p1_io_out_QSV_0_1;
  wire [7:0] _m4_p1_io_out_QSV_1_0;
  wire [7:0] _m4_p1_io_out_QSV_1_1;
  wire [7:0] _m4_p1_io_out_QSV_2_0;
  wire [7:0] _m4_p1_io_out_QSV_2_1;
  wire [7:0] _m4_p1_io_out_QSV_3_0;
  wire [7:0] _m4_p1_io_out_QSV_3_1;
  wire [7:0] _m4_p1_io_out_QSV_4_0;
  wire [7:0] _m4_p1_io_out_QSV_4_1;
  wire [7:0] _m4_p1_io_out_QSV_5_0;
  wire [7:0] _m4_p1_io_out_QSV_5_1;
  wire [7:0] _m4_p1_io_out_QSV_6_0;
  wire [7:0] _m4_p1_io_out_QSV_6_1;
  wire [7:0] _m4_p1_io_out_QSV_7_0;
  wire [7:0] _m4_p1_io_out_QSV_7_1;
  wire       _m4_p1_io_out_valid;

  CompatiblePerm_1 m4_p1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m3_p2_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m3_p2_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m3_p2_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m3_p2_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m3_p2_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m3_p2_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m3_p2_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m3_p2_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m3_p2_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m3_p2_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m3_p2_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m3_p2_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m3_p2_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m3_p2_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m3_p2_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m3_p2_io_out_QSV_7_1),
    .io_in_valid(_m3_p2_io_out_valid),
    .io_out_QSV_0_0(_m4_p1_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m4_p1_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m4_p1_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m4_p1_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m4_p1_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m4_p1_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m4_p1_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m4_p1_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m4_p1_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m4_p1_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m4_p1_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m4_p1_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m4_p1_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m4_p1_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m4_p1_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m4_p1_io_out_QSV_7_1),
    .io_out_valid(_m4_p1_io_out_valid)
  );

  wire [7:0] _m4_io_out_QSV_0_0;
  wire [7:0] _m4_io_out_QSV_0_1;
  wire [7:0] _m4_io_out_QSV_1_0;
  wire [7:0] _m4_io_out_QSV_1_1;
  wire [7:0] _m4_io_out_QSV_2_0;
  wire [7:0] _m4_io_out_QSV_2_1;
  wire [7:0] _m4_io_out_QSV_3_0;
  wire [7:0] _m4_io_out_QSV_3_1;
  wire [7:0] _m4_io_out_QSV_4_0;
  wire [7:0] _m4_io_out_QSV_4_1;
  wire [7:0] _m4_io_out_QSV_5_0;
  wire [7:0] _m4_io_out_QSV_5_1;
  wire [7:0] _m4_io_out_QSV_6_0;
  wire [7:0] _m4_io_out_QSV_6_1;
  wire [7:0] _m4_io_out_QSV_7_0;
  wire [7:0] _m4_io_out_QSV_7_1;
  wire       _m4_io_out_valid;

  CSGate3QubitVector8bit m4 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m4_p1_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m4_p1_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m4_p1_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m4_p1_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m4_p1_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m4_p1_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m4_p1_io_out_QSV_3_0),
    .io_in_QSV_4_0(_m4_p1_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m4_p1_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m4_p1_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m4_p1_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m4_p1_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m4_p1_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m4_p1_io_out_QSV_7_0),
    .io_in_valid(_m4_p1_io_out_valid),
    .io_out_QSV_0_0(_m4_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m4_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m4_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m4_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m4_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m4_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m4_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m4_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m4_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m4_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m4_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m4_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m4_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m4_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m4_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m4_io_out_QSV_7_1),
    .io_out_valid(_m4_io_out_valid)
  );

  wire [7:0] _m4_p2_io_out_QSV_0_0;
  wire [7:0] _m4_p2_io_out_QSV_0_1;
  wire [7:0] _m4_p2_io_out_QSV_1_0;
  wire [7:0] _m4_p2_io_out_QSV_1_1;
  wire [7:0] _m4_p2_io_out_QSV_2_0;
  wire [7:0] _m4_p2_io_out_QSV_2_1;
  wire [7:0] _m4_p2_io_out_QSV_3_0;
  wire [7:0] _m4_p2_io_out_QSV_3_1;
  wire [7:0] _m4_p2_io_out_QSV_4_0;
  wire [7:0] _m4_p2_io_out_QSV_4_1;
  wire [7:0] _m4_p2_io_out_QSV_5_0;
  wire [7:0] _m4_p2_io_out_QSV_5_1;
  wire [7:0] _m4_p2_io_out_QSV_6_0;
  wire [7:0] _m4_p2_io_out_QSV_6_1;
  wire [7:0] _m4_p2_io_out_QSV_7_0;
  wire [7:0] _m4_p2_io_out_QSV_7_1;
  wire       _m4_p2_io_out_valid;

  CompatiblePerm_1 m4_p2 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m4_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m4_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m4_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m4_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m4_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m4_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m4_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m4_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m4_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m4_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m4_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m4_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m4_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m4_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m4_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m4_io_out_QSV_7_1),
    .io_in_valid(_m4_io_out_valid),
    .io_out_QSV_0_0(_m4_p2_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m4_p2_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m4_p2_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m4_p2_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m4_p2_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m4_p2_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m4_p2_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m4_p2_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m4_p2_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m4_p2_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m4_p2_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m4_p2_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m4_p2_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m4_p2_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m4_p2_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m4_p2_io_out_QSV_7_1),
    .io_out_valid(_m4_p2_io_out_valid)
  );

  wire [7:0] _m5_p1_io_out_QSV_0_0;
  wire [7:0] _m5_p1_io_out_QSV_0_1;
  wire [7:0] _m5_p1_io_out_QSV_1_0;
  wire [7:0] _m5_p1_io_out_QSV_1_1;
  wire [7:0] _m5_p1_io_out_QSV_2_0;
  wire [7:0] _m5_p1_io_out_QSV_2_1;
  wire [7:0] _m5_p1_io_out_QSV_3_0;
  wire [7:0] _m5_p1_io_out_QSV_3_1;
  wire [7:0] _m5_p1_io_out_QSV_4_0;
  wire [7:0] _m5_p1_io_out_QSV_4_1;
  wire [7:0] _m5_p1_io_out_QSV_5_0;
  wire [7:0] _m5_p1_io_out_QSV_5_1;
  wire [7:0] _m5_p1_io_out_QSV_6_0;
  wire [7:0] _m5_p1_io_out_QSV_6_1;
  wire [7:0] _m5_p1_io_out_QSV_7_0;
  wire [7:0] _m5_p1_io_out_QSV_7_1;
  wire       _m5_p1_io_out_valid;

  CompatiblePerm_1 m5_p1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m4_p2_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m4_p2_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m4_p2_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m4_p2_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m4_p2_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m4_p2_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m4_p2_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m4_p2_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m4_p2_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m4_p2_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m4_p2_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m4_p2_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m4_p2_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m4_p2_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m4_p2_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m4_p2_io_out_QSV_7_1),
    .io_in_valid(_m4_p2_io_out_valid),
    .io_out_QSV_0_0(_m5_p1_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m5_p1_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m5_p1_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m5_p1_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m5_p1_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m5_p1_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m5_p1_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m5_p1_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m5_p1_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m5_p1_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m5_p1_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m5_p1_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m5_p1_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m5_p1_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m5_p1_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m5_p1_io_out_QSV_7_1),
    .io_out_valid(_m5_p1_io_out_valid)
  );

  wire [7:0] _m5_io_out_QSV_0_0;
  wire [7:0] _m5_io_out_QSV_0_1;
  wire [7:0] _m5_io_out_QSV_1_0;
  wire [7:0] _m5_io_out_QSV_1_1;
  wire [7:0] _m5_io_out_QSV_2_0;
  wire [7:0] _m5_io_out_QSV_2_1;
  wire [7:0] _m5_io_out_QSV_3_0;
  wire [7:0] _m5_io_out_QSV_3_1;
  wire [7:0] _m5_io_out_QSV_4_0;
  wire [7:0] _m5_io_out_QSV_4_1;
  wire [7:0] _m5_io_out_QSV_5_0;
  wire [7:0] _m5_io_out_QSV_5_1;
  wire [7:0] _m5_io_out_QSV_6_0;
  wire [7:0] _m5_io_out_QSV_6_1;
  wire [7:0] _m5_io_out_QSV_7_0;
  wire [7:0] _m5_io_out_QSV_7_1;
  wire       _m5_io_out_valid;

  HGate3QubitVector8bit m5 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m5_p1_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m5_p1_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m5_p1_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m5_p1_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m5_p1_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m5_p1_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m5_p1_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m5_p1_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m5_p1_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m5_p1_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m5_p1_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m5_p1_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m5_p1_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m5_p1_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m5_p1_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m5_p1_io_out_QSV_7_1),
    .io_in_valid(_m5_p1_io_out_valid),
    .io_out_QSV_0_0(_m5_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m5_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m5_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m5_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m5_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m5_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m5_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m5_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m5_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m5_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m5_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m5_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m5_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m5_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m5_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m5_io_out_QSV_7_1),
    .io_out_valid(_m5_io_out_valid)
  );

  wire [7:0] _m5_p2_io_out_QSV_0_0;
  wire [7:0] _m5_p2_io_out_QSV_0_1;
  wire [7:0] _m5_p2_io_out_QSV_1_0;
  wire [7:0] _m5_p2_io_out_QSV_1_1;
  wire [7:0] _m5_p2_io_out_QSV_2_0;
  wire [7:0] _m5_p2_io_out_QSV_2_1;
  wire [7:0] _m5_p2_io_out_QSV_3_0;
  wire [7:0] _m5_p2_io_out_QSV_3_1;
  wire [7:0] _m5_p2_io_out_QSV_4_0;
  wire [7:0] _m5_p2_io_out_QSV_4_1;
  wire [7:0] _m5_p2_io_out_QSV_5_0;
  wire [7:0] _m5_p2_io_out_QSV_5_1;
  wire [7:0] _m5_p2_io_out_QSV_6_0;
  wire [7:0] _m5_p2_io_out_QSV_6_1;
  wire [7:0] _m5_p2_io_out_QSV_7_0;
  wire [7:0] _m5_p2_io_out_QSV_7_1;
  wire       _m5_p2_io_out_valid;

  CompatiblePerm_1 m5_p2 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m5_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m5_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m5_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m5_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m5_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m5_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m5_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m5_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m5_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m5_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m5_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m5_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m5_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m5_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m5_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m5_io_out_QSV_7_1),
    .io_in_valid(_m5_io_out_valid),
    .io_out_QSV_0_0(_m5_p2_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m5_p2_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m5_p2_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m5_p2_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m5_p2_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m5_p2_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m5_p2_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m5_p2_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m5_p2_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m5_p2_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m5_p2_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m5_p2_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m5_p2_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m5_p2_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m5_p2_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m5_p2_io_out_QSV_7_1),
    .io_out_valid(_m5_p2_io_out_valid)
  );

  SWGate3QubitVector8bit m6 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m5_p2_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m5_p2_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m5_p2_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m5_p2_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m5_p2_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m5_p2_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m5_p2_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m5_p2_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m5_p2_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m5_p2_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m5_p2_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m5_p2_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m5_p2_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m5_p2_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m5_p2_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m5_p2_io_out_QSV_7_1),
    .io_in_valid(_m5_p2_io_out_valid),
    .io_out_QSV_0_0(io_out_QSV_0_0),
    .io_out_QSV_0_1(io_out_QSV_0_1),
    .io_out_QSV_1_0(io_out_QSV_1_0),
    .io_out_QSV_1_1(io_out_QSV_1_1),
    .io_out_QSV_2_0(io_out_QSV_2_0),
    .io_out_QSV_2_1(io_out_QSV_2_1),
    .io_out_QSV_3_0(io_out_QSV_3_0),
    .io_out_QSV_3_1(io_out_QSV_3_1),
    .io_out_QSV_4_0(io_out_QSV_4_0),
    .io_out_QSV_4_1(io_out_QSV_4_1),
    .io_out_QSV_5_0(io_out_QSV_5_0),
    .io_out_QSV_5_1(io_out_QSV_5_1),
    .io_out_QSV_6_0(io_out_QSV_6_0),
    .io_out_QSV_6_1(io_out_QSV_6_1),
    .io_out_QSV_7_0(io_out_QSV_7_0),
    .io_out_QSV_7_1(io_out_QSV_7_1),
    .io_out_valid(io_out_valid)
  );

endmodule
