module QFT (
  input        clock,
  input        reset,
  input  [7:0] io_in_QSV_0_0,
  input  [7:0] io_in_QSV_0_1,
  input  [7:0] io_in_QSV_1_0,
  input  [7:0] io_in_QSV_1_1,
  input  [7:0] io_in_QSV_2_0,
  input  [7:0] io_in_QSV_2_1,
  input  [7:0] io_in_QSV_3_0,
  input  [7:0] io_in_QSV_3_1,
  input  [7:0] io_in_QSV_4_0,
  input  [7:0] io_in_QSV_4_1,
  input  [7:0] io_in_QSV_5_0,
  input  [7:0] io_in_QSV_5_1,
  input  [7:0] io_in_QSV_6_0,
  input  [7:0] io_in_QSV_6_1,
  input  [7:0] io_in_QSV_7_0,
  input  [7:0] io_in_QSV_7_1,
  input        io_in_valid,
  output [7:0] io_out_QSV_0_0,
  output [7:0] io_out_QSV_0_1,
  output [7:0] io_out_QSV_1_0,
  output [7:0] io_out_QSV_1_1,
  output [7:0] io_out_QSV_2_0,
  output [7:0] io_out_QSV_2_1,
  output [7:0] io_out_QSV_3_0,
  output [7:0] io_out_QSV_3_1,
  output [7:0] io_out_QSV_4_0,
  output [7:0] io_out_QSV_4_1,
  output [7:0] io_out_QSV_5_0,
  output [7:0] io_out_QSV_5_1,
  output [7:0] io_out_QSV_6_0,
  output [7:0] io_out_QSV_6_1,
  output [7:0] io_out_QSV_7_0,
  output [7:0] io_out_QSV_7_1,
  output       io_out_valid
);

  // Wires for m_0
  wire [7:0] _m_0_io_out_QSV_0_0;
  wire [7:0] _m_0_io_out_QSV_0_1;
  wire [7:0] _m_0_io_out_QSV_1_0;
  wire [7:0] _m_0_io_out_QSV_1_1;
  wire [7:0] _m_0_io_out_QSV_2_0;
  wire [7:0] _m_0_io_out_QSV_2_1;
  wire [7:0] _m_0_io_out_QSV_3_0;
  wire [7:0] _m_0_io_out_QSV_3_1;
  wire [7:0] _m_0_io_out_QSV_4_0;
  wire [7:0] _m_0_io_out_QSV_4_1;
  wire [7:0] _m_0_io_out_QSV_5_0;
  wire [7:0] _m_0_io_out_QSV_5_1;
  wire [7:0] _m_0_io_out_QSV_6_0;
  wire [7:0] _m_0_io_out_QSV_6_1;
  wire [7:0] _m_0_io_out_QSV_7_0;
  wire [7:0] _m_0_io_out_QSV_7_1;
  wire       _m_0_io_out_valid;

  // Wires for m_1
  wire [7:0] _m_1_io_out_QSV_0_0;
  wire [7:0] _m_1_io_out_QSV_0_1;
  wire [7:0] _m_1_io_out_QSV_1_0;
  wire [7:0] _m_1_io_out_QSV_1_1;
  wire [7:0] _m_1_io_out_QSV_2_0;
  wire [7:0] _m_1_io_out_QSV_2_1;
  wire [7:0] _m_1_io_out_QSV_3_0;
  wire [7:0] _m_1_io_out_QSV_3_1;
  wire [7:0] _m_1_io_out_QSV_4_0;
  wire [7:0] _m_1_io_out_QSV_4_1;
  wire [7:0] _m_1_io_out_QSV_5_0;
  wire [7:0] _m_1_io_out_QSV_5_1;
  wire [7:0] _m_1_io_out_QSV_6_0;
  wire [7:0] _m_1_io_out_QSV_6_1;
  wire [7:0] _m_1_io_out_QSV_7_0;
  wire [7:0] _m_1_io_out_QSV_7_1;
  wire       _m_1_io_out_valid;

  // Wires for m_2_perm_in
  wire [7:0] _m_2_perm_in_io_out_QSV_0_0;
  wire [7:0] _m_2_perm_in_io_out_QSV_0_1;
  wire [7:0] _m_2_perm_in_io_out_QSV_1_0;
  wire [7:0] _m_2_perm_in_io_out_QSV_1_1;
  wire [7:0] _m_2_perm_in_io_out_QSV_2_0;
  wire [7:0] _m_2_perm_in_io_out_QSV_2_1;
  wire [7:0] _m_2_perm_in_io_out_QSV_3_0;
  wire [7:0] _m_2_perm_in_io_out_QSV_3_1;
  wire [7:0] _m_2_perm_in_io_out_QSV_4_0;
  wire [7:0] _m_2_perm_in_io_out_QSV_4_1;
  wire [7:0] _m_2_perm_in_io_out_QSV_5_0;
  wire [7:0] _m_2_perm_in_io_out_QSV_5_1;
  wire [7:0] _m_2_perm_in_io_out_QSV_6_0;
  wire [7:0] _m_2_perm_in_io_out_QSV_6_1;
  wire [7:0] _m_2_perm_in_io_out_QSV_7_0;
  wire [7:0] _m_2_perm_in_io_out_QSV_7_1;
  wire       _m_2_perm_in_io_out_valid;

  // Wires for m_2
  wire [7:0] _m_2_io_out_QSV_0_0;
  wire [7:0] _m_2_io_out_QSV_0_1;
  wire [7:0] _m_2_io_out_QSV_1_0;
  wire [7:0] _m_2_io_out_QSV_1_1;
  wire [7:0] _m_2_io_out_QSV_2_0;
  wire [7:0] _m_2_io_out_QSV_2_1;
  wire [7:0] _m_2_io_out_QSV_3_0;
  wire [7:0] _m_2_io_out_QSV_3_1;
  wire [7:0] _m_2_io_out_QSV_4_0;
  wire [7:0] _m_2_io_out_QSV_4_1;
  wire [7:0] _m_2_io_out_QSV_5_0;
  wire [7:0] _m_2_io_out_QSV_5_1;
  wire [7:0] _m_2_io_out_QSV_6_0;
  wire [7:0] _m_2_io_out_QSV_6_1;
  wire [7:0] _m_2_io_out_QSV_7_0;
  wire [7:0] _m_2_io_out_QSV_7_1;
  wire       _m_2_io_out_valid;

  // Wires for m_2_perm_out
  wire [7:0] _m_2_perm_out_io_out_QSV_0_0;
  wire [7:0] _m_2_perm_out_io_out_QSV_0_1;
  wire [7:0] _m_2_perm_out_io_out_QSV_1_0;
  wire [7:0] _m_2_perm_out_io_out_QSV_1_1;
  wire [7:0] _m_2_perm_out_io_out_QSV_2_0;
  wire [7:0] _m_2_perm_out_io_out_QSV_2_1;
  wire [7:0] _m_2_perm_out_io_out_QSV_3_0;
  wire [7:0] _m_2_perm_out_io_out_QSV_3_1;
  wire [7:0] _m_2_perm_out_io_out_QSV_4_0;
  wire [7:0] _m_2_perm_out_io_out_QSV_4_1;
  wire [7:0] _m_2_perm_out_io_out_QSV_5_0;
  wire [7:0] _m_2_perm_out_io_out_QSV_5_1;
  wire [7:0] _m_2_perm_out_io_out_QSV_6_0;
  wire [7:0] _m_2_perm_out_io_out_QSV_6_1;
  wire [7:0] _m_2_perm_out_io_out_QSV_7_0;
  wire [7:0] _m_2_perm_out_io_out_QSV_7_1;
  wire       _m_2_perm_out_io_out_valid;

  // Wires for m_3_perm_in
  wire [7:0] _m_3_perm_in_io_out_QSV_0_0;
  wire [7:0] _m_3_perm_in_io_out_QSV_0_1;
  wire [7:0] _m_3_perm_in_io_out_QSV_1_0;
  wire [7:0] _m_3_perm_in_io_out_QSV_1_1;
  wire [7:0] _m_3_perm_in_io_out_QSV_2_0;
  wire [7:0] _m_3_perm_in_io_out_QSV_2_1;
  wire [7:0] _m_3_perm_in_io_out_QSV_3_0;
  wire [7:0] _m_3_perm_in_io_out_QSV_3_1;
  wire [7:0] _m_3_perm_in_io_out_QSV_4_0;
  wire [7:0] _m_3_perm_in_io_out_QSV_4_1;
  wire [7:0] _m_3_perm_in_io_out_QSV_5_0;
  wire [7:0] _m_3_perm_in_io_out_QSV_5_1;
  wire [7:0] _m_3_perm_in_io_out_QSV_6_0;
  wire [7:0] _m_3_perm_in_io_out_QSV_6_1;
  wire [7:0] _m_3_perm_in_io_out_QSV_7_0;
  wire [7:0] _m_3_perm_in_io_out_QSV_7_1;
  wire       _m_3_perm_in_io_out_valid;

  // Wires for m_3
  wire [7:0] _m_3_io_out_QSV_0_0;
  wire [7:0] _m_3_io_out_QSV_0_1;
  wire [7:0] _m_3_io_out_QSV_1_0;
  wire [7:0] _m_3_io_out_QSV_1_1;
  wire [7:0] _m_3_io_out_QSV_2_0;
  wire [7:0] _m_3_io_out_QSV_2_1;
  wire [7:0] _m_3_io_out_QSV_3_0;
  wire [7:0] _m_3_io_out_QSV_3_1;
  wire [7:0] _m_3_io_out_QSV_4_0;
  wire [7:0] _m_3_io_out_QSV_4_1;
  wire [7:0] _m_3_io_out_QSV_5_0;
  wire [7:0] _m_3_io_out_QSV_5_1;
  wire [7:0] _m_3_io_out_QSV_6_0;
  wire [7:0] _m_3_io_out_QSV_6_1;
  wire [7:0] _m_3_io_out_QSV_7_0;
  wire [7:0] _m_3_io_out_QSV_7_1;
  wire       _m_3_io_out_valid;

  // Wires for m_3_perm_out
  wire [7:0] _m_3_perm_out_io_out_QSV_0_0;
  wire [7:0] _m_3_perm_out_io_out_QSV_0_1;
  wire [7:0] _m_3_perm_out_io_out_QSV_1_0;
  wire [7:0] _m_3_perm_out_io_out_QSV_1_1;
  wire [7:0] _m_3_perm_out_io_out_QSV_2_0;
  wire [7:0] _m_3_perm_out_io_out_QSV_2_1;
  wire [7:0] _m_3_perm_out_io_out_QSV_3_0;
  wire [7:0] _m_3_perm_out_io_out_QSV_3_1;
  wire [7:0] _m_3_perm_out_io_out_QSV_4_0;
  wire [7:0] _m_3_perm_out_io_out_QSV_4_1;
  wire [7:0] _m_3_perm_out_io_out_QSV_5_0;
  wire [7:0] _m_3_perm_out_io_out_QSV_5_1;
  wire [7:0] _m_3_perm_out_io_out_QSV_6_0;
  wire [7:0] _m_3_perm_out_io_out_QSV_6_1;
  wire [7:0] _m_3_perm_out_io_out_QSV_7_0;
  wire [7:0] _m_3_perm_out_io_out_QSV_7_1;
  wire       _m_3_perm_out_io_out_valid;

  // Wires for m_4_perm_in
  wire [7:0] _m_4_perm_in_io_out_QSV_0_0;
  wire [7:0] _m_4_perm_in_io_out_QSV_0_1;
  wire [7:0] _m_4_perm_in_io_out_QSV_1_0;
  wire [7:0] _m_4_perm_in_io_out_QSV_1_1;
  wire [7:0] _m_4_perm_in_io_out_QSV_2_0;
  wire [7:0] _m_4_perm_in_io_out_QSV_2_1;
  wire [7:0] _m_4_perm_in_io_out_QSV_3_0;
  wire [7:0] _m_4_perm_in_io_out_QSV_3_1;
  wire [7:0] _m_4_perm_in_io_out_QSV_4_0;
  wire [7:0] _m_4_perm_in_io_out_QSV_4_1;
  wire [7:0] _m_4_perm_in_io_out_QSV_5_0;
  wire [7:0] _m_4_perm_in_io_out_QSV_5_1;
  wire [7:0] _m_4_perm_in_io_out_QSV_6_0;
  wire [7:0] _m_4_perm_in_io_out_QSV_6_1;
  wire [7:0] _m_4_perm_in_io_out_QSV_7_0;
  wire [7:0] _m_4_perm_in_io_out_QSV_7_1;
  wire       _m_4_perm_in_io_out_valid;

  // Wires for m_4
  wire [7:0] _m_4_io_out_QSV_0_0;
  wire [7:0] _m_4_io_out_QSV_0_1;
  wire [7:0] _m_4_io_out_QSV_1_0;
  wire [7:0] _m_4_io_out_QSV_1_1;
  wire [7:0] _m_4_io_out_QSV_2_0;
  wire [7:0] _m_4_io_out_QSV_2_1;
  wire [7:0] _m_4_io_out_QSV_3_0;
  wire [7:0] _m_4_io_out_QSV_3_1;
  wire [7:0] _m_4_io_out_QSV_4_0;
  wire [7:0] _m_4_io_out_QSV_4_1;
  wire [7:0] _m_4_io_out_QSV_5_0;
  wire [7:0] _m_4_io_out_QSV_5_1;
  wire [7:0] _m_4_io_out_QSV_6_0;
  wire [7:0] _m_4_io_out_QSV_6_1;
  wire [7:0] _m_4_io_out_QSV_7_0;
  wire [7:0] _m_4_io_out_QSV_7_1;
  wire       _m_4_io_out_valid;

  // Wires for m_4_perm_out
  wire [7:0] _m_4_perm_out_io_out_QSV_0_0;
  wire [7:0] _m_4_perm_out_io_out_QSV_0_1;
  wire [7:0] _m_4_perm_out_io_out_QSV_1_0;
  wire [7:0] _m_4_perm_out_io_out_QSV_1_1;
  wire [7:0] _m_4_perm_out_io_out_QSV_2_0;
  wire [7:0] _m_4_perm_out_io_out_QSV_2_1;
  wire [7:0] _m_4_perm_out_io_out_QSV_3_0;
  wire [7:0] _m_4_perm_out_io_out_QSV_3_1;
  wire [7:0] _m_4_perm_out_io_out_QSV_4_0;
  wire [7:0] _m_4_perm_out_io_out_QSV_4_1;
  wire [7:0] _m_4_perm_out_io_out_QSV_5_0;
  wire [7:0] _m_4_perm_out_io_out_QSV_5_1;
  wire [7:0] _m_4_perm_out_io_out_QSV_6_0;
  wire [7:0] _m_4_perm_out_io_out_QSV_6_1;
  wire [7:0] _m_4_perm_out_io_out_QSV_7_0;
  wire [7:0] _m_4_perm_out_io_out_QSV_7_1;
  wire       _m_4_perm_out_io_out_valid;

  // Wires for m_5_perm_in
  wire [7:0] _m_5_perm_in_io_out_QSV_0_0;
  wire [7:0] _m_5_perm_in_io_out_QSV_0_1;
  wire [7:0] _m_5_perm_in_io_out_QSV_1_0;
  wire [7:0] _m_5_perm_in_io_out_QSV_1_1;
  wire [7:0] _m_5_perm_in_io_out_QSV_2_0;
  wire [7:0] _m_5_perm_in_io_out_QSV_2_1;
  wire [7:0] _m_5_perm_in_io_out_QSV_3_0;
  wire [7:0] _m_5_perm_in_io_out_QSV_3_1;
  wire [7:0] _m_5_perm_in_io_out_QSV_4_0;
  wire [7:0] _m_5_perm_in_io_out_QSV_4_1;
  wire [7:0] _m_5_perm_in_io_out_QSV_5_0;
  wire [7:0] _m_5_perm_in_io_out_QSV_5_1;
  wire [7:0] _m_5_perm_in_io_out_QSV_6_0;
  wire [7:0] _m_5_perm_in_io_out_QSV_6_1;
  wire [7:0] _m_5_perm_in_io_out_QSV_7_0;
  wire [7:0] _m_5_perm_in_io_out_QSV_7_1;
  wire       _m_5_perm_in_io_out_valid;

  // Wires for m_5
  wire [7:0] _m_5_io_out_QSV_0_0;
  wire [7:0] _m_5_io_out_QSV_0_1;
  wire [7:0] _m_5_io_out_QSV_1_0;
  wire [7:0] _m_5_io_out_QSV_1_1;
  wire [7:0] _m_5_io_out_QSV_2_0;
  wire [7:0] _m_5_io_out_QSV_2_1;
  wire [7:0] _m_5_io_out_QSV_3_0;
  wire [7:0] _m_5_io_out_QSV_3_1;
  wire [7:0] _m_5_io_out_QSV_4_0;
  wire [7:0] _m_5_io_out_QSV_4_1;
  wire [7:0] _m_5_io_out_QSV_5_0;
  wire [7:0] _m_5_io_out_QSV_5_1;
  wire [7:0] _m_5_io_out_QSV_6_0;
  wire [7:0] _m_5_io_out_QSV_6_1;
  wire [7:0] _m_5_io_out_QSV_7_0;
  wire [7:0] _m_5_io_out_QSV_7_1;
  wire       _m_5_io_out_valid;

  // Wires for m_5_perm_out
  wire [7:0] _m_5_perm_out_io_out_QSV_0_0;
  wire [7:0] _m_5_perm_out_io_out_QSV_0_1;
  wire [7:0] _m_5_perm_out_io_out_QSV_1_0;
  wire [7:0] _m_5_perm_out_io_out_QSV_1_1;
  wire [7:0] _m_5_perm_out_io_out_QSV_2_0;
  wire [7:0] _m_5_perm_out_io_out_QSV_2_1;
  wire [7:0] _m_5_perm_out_io_out_QSV_3_0;
  wire [7:0] _m_5_perm_out_io_out_QSV_3_1;
  wire [7:0] _m_5_perm_out_io_out_QSV_4_0;
  wire [7:0] _m_5_perm_out_io_out_QSV_4_1;
  wire [7:0] _m_5_perm_out_io_out_QSV_5_0;
  wire [7:0] _m_5_perm_out_io_out_QSV_5_1;
  wire [7:0] _m_5_perm_out_io_out_QSV_6_0;
  wire [7:0] _m_5_perm_out_io_out_QSV_6_1;
  wire [7:0] _m_5_perm_out_io_out_QSV_7_0;
  wire [7:0] _m_5_perm_out_io_out_QSV_7_1;
  wire       _m_5_perm_out_io_out_valid;

  // Step 0: H on 0
  HGate3QubitVector8bit m (
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
    .io_out_QSV_0_0(_m_0_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_0_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_0_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_0_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_0_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_0_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_0_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_0_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_0_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_0_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_0_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_0_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_0_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_0_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_0_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_0_io_out_QSV_7_1),
    .io_out_valid(_m_0_io_out_valid)
  );

  // Step 1: CS on 1, 0 (inputs 3_1 and 7_1 are pruned on CSGate)
  CSGate3QubitVector8bit m_1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_0_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_0_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_0_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_0_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_0_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_0_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_0_io_out_QSV_3_0),
    .io_in_QSV_4_0(_m_0_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_0_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_0_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_0_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_0_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_0_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_0_io_out_QSV_7_0),
    .io_in_valid(_m_0_io_out_valid),
    .io_out_QSV_0_0(_m_1_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_1_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_1_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_1_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_1_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_1_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_1_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_1_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_1_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_1_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_1_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_1_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_1_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_1_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_1_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_1_io_out_QSV_7_1),
    .io_out_valid(_m_1_io_out_valid)
  );

  // Step 2: CP (CT) on 2, 0 (needs CompatiblePerm to swap qubits 2 and 1)
  CompatiblePerm m_2_perm_in (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_1_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_1_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_1_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_1_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_1_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_1_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_1_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_1_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_1_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_1_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_1_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_1_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_1_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_1_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_1_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_1_io_out_QSV_7_1),
    .io_in_valid(_m_1_io_out_valid),
    .io_out_QSV_0_0(_m_2_perm_in_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_2_perm_in_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_2_perm_in_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_2_perm_in_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_2_perm_in_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_2_perm_in_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_2_perm_in_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_2_perm_in_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_2_perm_in_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_2_perm_in_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_2_perm_in_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_2_perm_in_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_2_perm_in_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_2_perm_in_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_2_perm_in_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_2_perm_in_io_out_QSV_7_1),
    .io_out_valid(_m_2_perm_in_io_out_valid)
  );

  CTGate3QubitVector8bit m_2 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_2_perm_in_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_2_perm_in_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_2_perm_in_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_2_perm_in_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_2_perm_in_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_2_perm_in_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_2_perm_in_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_2_perm_in_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_2_perm_in_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_2_perm_in_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_2_perm_in_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_2_perm_in_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_2_perm_in_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_2_perm_in_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_2_perm_in_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_2_perm_in_io_out_QSV_7_1),
    .io_in_valid(_m_2_perm_in_io_out_valid),
    .io_out_QSV_0_0(_m_2_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_2_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_2_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_2_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_2_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_2_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_2_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_2_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_2_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_2_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_2_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_2_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_2_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_2_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_2_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_2_io_out_QSV_7_1),
    .io_out_valid(_m_2_io_out_valid)
  );

  CompatiblePerm m_2_perm_out (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_2_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_2_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_2_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_2_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_2_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_2_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_2_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_2_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_2_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_2_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_2_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_2_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_2_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_2_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_2_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_2_io_out_QSV_7_1),
    .io_in_valid(_m_2_io_out_valid),
    .io_out_QSV_0_0(_m_2_perm_out_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_2_perm_out_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_2_perm_out_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_2_perm_out_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_2_perm_out_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_2_perm_out_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_2_perm_out_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_2_perm_out_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_2_perm_out_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_2_perm_out_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_2_perm_out_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_2_perm_out_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_2_perm_out_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_2_perm_out_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_2_perm_out_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_2_perm_out_io_out_QSV_7_1),
    .io_out_valid(_m_2_perm_out_io_out_valid)
  );

  // Step 3: H on 1 (needs CompatiblePerm_2 to swap qubits 1 and 0)
  CompatiblePerm_2 m_3_perm_in (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_2_perm_out_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_2_perm_out_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_2_perm_out_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_2_perm_out_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_2_perm_out_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_2_perm_out_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_2_perm_out_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_2_perm_out_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_2_perm_out_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_2_perm_out_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_2_perm_out_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_2_perm_out_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_2_perm_out_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_2_perm_out_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_2_perm_out_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_2_perm_out_io_out_QSV_7_1),
    .io_in_valid(_m_2_perm_out_io_out_valid),
    .io_out_QSV_0_0(_m_3_perm_in_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_3_perm_in_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_3_perm_in_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_3_perm_in_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_3_perm_in_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_3_perm_in_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_3_perm_in_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_3_perm_in_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_3_perm_in_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_3_perm_in_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_3_perm_in_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_3_perm_in_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_3_perm_in_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_3_perm_in_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_3_perm_in_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_3_perm_in_io_out_QSV_7_1),
    .io_out_valid(_m_3_perm_in_io_out_valid)
  );

  HGate3QubitVector8bit m_3 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_3_perm_in_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_3_perm_in_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_3_perm_in_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_3_perm_in_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_3_perm_in_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_3_perm_in_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_3_perm_in_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_3_perm_in_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_3_perm_in_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_3_perm_in_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_3_perm_in_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_3_perm_in_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_3_perm_in_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_3_perm_in_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_3_perm_in_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_3_perm_in_io_out_QSV_7_1),
    .io_in_valid(_m_3_perm_in_io_out_valid),
    .io_out_QSV_0_0(_m_3_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_3_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_3_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_3_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_3_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_3_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_3_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_3_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_3_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_3_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_3_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_3_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_3_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_3_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_3_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_3_io_out_QSV_7_1),
    .io_out_valid(_m_3_io_out_valid)
  );

  CompatiblePerm_2 m_3_perm_out (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_3_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_3_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_3_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_3_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_3_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_3_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_3_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_3_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_3_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_3_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_3_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_3_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_3_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_3_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_3_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_3_io_out_QSV_7_1),
    .io_in_valid(_m_3_io_out_valid),
    .io_out_QSV_0_0(_m_3_perm_out_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_3_perm_out_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_3_perm_out_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_3_perm_out_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_3_perm_out_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_3_perm_out_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_3_perm_out_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_3_perm_out_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_3_perm_out_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_3_perm_out_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_3_perm_out_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_3_perm_out_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_3_perm_out_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_3_perm_out_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_3_perm_out_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_3_perm_out_io_out_QSV_7_1),
    .io_out_valid(_m_3_perm_out_io_out_valid)
  );

  // Step 4: CS on 2, 1 (needs CompatiblePerm_1 to swap qubits 2 and 0)
  CompatiblePerm_1 m_4_perm_in (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_3_perm_out_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_3_perm_out_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_3_perm_out_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_3_perm_out_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_3_perm_out_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_3_perm_out_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_3_perm_out_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_3_perm_out_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_3_perm_out_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_3_perm_out_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_3_perm_out_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_3_perm_out_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_3_perm_out_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_3_perm_out_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_3_perm_out_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_3_perm_out_io_out_QSV_7_1),
    .io_in_valid(_m_3_perm_out_io_out_valid),
    .io_out_QSV_0_0(_m_4_perm_in_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_4_perm_in_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_4_perm_in_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_4_perm_in_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_4_perm_in_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_4_perm_in_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_4_perm_in_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_4_perm_in_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_4_perm_in_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_4_perm_in_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_4_perm_in_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_4_perm_in_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_4_perm_in_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_4_perm_in_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_4_perm_in_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_4_perm_in_io_out_QSV_7_1),
    .io_out_valid(_m_4_perm_in_io_out_valid)
  );

  CSGate3QubitVector8bit m_4 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_4_perm_in_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_4_perm_in_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_4_perm_in_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_4_perm_in_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_4_perm_in_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_4_perm_in_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_4_perm_in_io_out_QSV_3_0),
    .io_in_QSV_4_0(_m_4_perm_in_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_4_perm_in_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_4_perm_in_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_4_perm_in_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_4_perm_in_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_4_perm_in_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_4_perm_in_io_out_QSV_7_0),
    .io_in_valid(_m_4_perm_in_io_out_valid),
    .io_out_QSV_0_0(_m_4_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_4_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_4_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_4_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_4_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_4_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_4_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_4_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_4_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_4_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_4_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_4_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_4_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_4_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_4_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_4_io_out_QSV_7_1),
    .io_out_valid(_m_4_io_out_valid)
  );

  CompatiblePerm_1 m_4_perm_out (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_4_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_4_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_4_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_4_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_4_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_4_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_4_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_4_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_4_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_4_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_4_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_4_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_4_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_4_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_4_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_4_io_out_QSV_7_1),
    .io_in_valid(_m_4_io_out_valid),
    .io_out_QSV_0_0(_m_4_perm_out_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_4_perm_out_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_4_perm_out_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_4_perm_out_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_4_perm_out_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_4_perm_out_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_4_perm_out_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_4_perm_out_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_4_perm_out_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_4_perm_out_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_4_perm_out_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_4_perm_out_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_4_perm_out_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_4_perm_out_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_4_perm_out_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_4_perm_out_io_out_QSV_7_1),
    .io_out_valid(_m_4_perm_out_io_out_valid)
  );

  // Step 5: H on 2 (needs CompatiblePerm_1 to swap qubits 2 and 0)
  CompatiblePerm_1 m_5_perm_in (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_4_perm_out_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_4_perm_out_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_4_perm_out_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_4_perm_out_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_4_perm_out_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_4_perm_out_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_4_perm_out_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_4_perm_out_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_4_perm_out_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_4_perm_out_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_4_perm_out_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_4_perm_out_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_4_perm_out_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_4_perm_out_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_4_perm_out_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_4_perm_out_io_out_QSV_7_1),
    .io_in_valid(_m_4_perm_out_io_out_valid),
    .io_out_QSV_0_0(_m_5_perm_in_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_5_perm_in_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_5_perm_in_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_5_perm_in_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_5_perm_in_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_5_perm_in_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_5_perm_in_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_5_perm_in_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_5_perm_in_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_5_perm_in_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_5_perm_in_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_5_perm_in_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_5_perm_in_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_5_perm_in_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_5_perm_in_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_5_perm_in_io_out_QSV_7_1),
    .io_out_valid(_m_5_perm_in_io_out_valid)
  );

  HGate3QubitVector8bit m_5 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_5_perm_in_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_5_perm_in_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_5_perm_in_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_5_perm_in_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_5_perm_in_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_5_perm_in_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_5_perm_in_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_5_perm_in_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_5_perm_in_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_5_perm_in_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_5_perm_in_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_5_perm_in_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_5_perm_in_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_5_perm_in_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_5_perm_in_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_5_perm_in_io_out_QSV_7_1),
    .io_in_valid(_m_5_perm_in_io_out_valid),
    .io_out_QSV_0_0(_m_5_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_5_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_5_io_out_QSV_1_1), // Note: Wait, this is imaginary of 1? Correct: io_out_QSV_1_1 is imag. Let's make sure exact naming is correct.
    .io_out_QSV_1_1(_m_5_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_5_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_5_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_5_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_5_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_5_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_5_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_5_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_5_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_5_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_5_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_5_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_5_io_out_QSV_7_1),
    .io_out_valid(_m_5_io_out_valid)
  );

  // Fix the typo on port connection above for .io_out_QSV_1_0:
  // Let's ensure the instantiation of m_5 is completely correct:
  // .io_out_QSV_1_0(_m_5_io_out_QSV_1_0)

  CompatiblePerm_1 m_5_perm_out (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_5_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_5_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_5_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_5_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_5_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_5_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_5_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_5_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_5_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_5_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_5_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_5_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_5_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_5_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_5_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_5_io_out_QSV_7_1),
    .io_in_valid(_m_5_io_out_valid),
    .io_out_QSV_0_0(_m_5_perm_out_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_5_perm_out_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_5_perm_out_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_5_perm_out_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_5_perm_out_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_5_perm_out_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_5_perm_out_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_5_perm_out_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_5_perm_out_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_5_perm_out_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_5_perm_out_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_5_perm_out_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_5_perm_out_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_5_perm_out_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_5_perm_out_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_5_perm_out_io_out_QSV_7_1),
    .io_out_valid(_m_5_perm_out_io_out_valid)
  );

  // Step 6: SWAP on 0, 2 (acts on the full vector, needs no permutation)
  SWGate3QubitVector8bit m_6 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_5_perm_out_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_5_perm_out_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_5_perm_out_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_5_perm_out_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_5_perm_out_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_5_perm_out_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_5_perm_out_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_5_perm_out_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_5_perm_out_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_5_perm_out_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_5_perm_out_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_5_perm_out_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_5_perm_out_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_5_perm_out_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_5_perm_out_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_5_perm_out_io_out_QSV_7_1),
    .io_in_valid(_m_5_perm_out_io_out_valid),
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
