module QFT (
  input  wire       clock,
  input  wire       reset,
  input  wire [7:0] io_in_QSV_0_0,
  input  wire [7:0] io_in_QSV_0_1,
  input  wire [7:0] io_in_QSV_1_0,
  input  wire [7:0] io_in_QSV_1_1,
  input  wire [7:0] io_in_QSV_2_0,
  input  wire [7:0] io_in_QSV_2_1,
  input  wire [7:0] io_in_QSV_3_0,
  input  wire [7:0] io_in_QSV_3_1,
  input  wire [7:0] io_in_QSV_4_0,
  input  wire [7:0] io_in_QSV_4_1,
  input  wire [7:0] io_in_QSV_5_0,
  input  wire [7:0] io_in_QSV_5_1,
  input  wire [7:0] io_in_QSV_6_0,
  input  wire [7:0] io_in_QSV_6_1,
  input  wire [7:0] io_in_QSV_7_0,
  input  wire [7:0] io_in_QSV_7_1,
  input  wire       io_in_valid,
  output wire [7:0] io_out_QSV_0_0,
  output wire [7:0] io_out_QSV_0_1,
  output wire [7:0] io_out_QSV_1_0,
  output wire [7:0] io_out_QSV_1_1,
  output wire [7:0] io_out_QSV_2_0,
  output wire [7:0] io_out_QSV_2_1,
  output wire [7:0] io_out_QSV_3_0,
  output wire [7:0] io_out_QSV_3_1,
  output wire [7:0] io_out_QSV_4_0,
  output wire [7:0] io_out_QSV_4_1,
  output wire [7:0] io_out_QSV_5_0,
  output wire [7:0] io_out_QSV_5_1,
  output wire [7:0] io_out_QSV_6_0,
  output wire [7:0] io_out_QSV_6_1,
  output wire [7:0] io_out_QSV_7_0,
  output wire [7:0] io_out_QSV_7_1,
  output wire       io_out_valid
);

  // Wires for m (HGate)
  wire [7:0] _m_io_out_QSV_0_0;
  wire [7:0] _m_io_out_QSV_0_1;
  wire [7:0] _m_io_out_QSV_1_0;
  wire [7:0] _m_io_out_QSV_1_1;
  wire [7:0] _m_io_out_QSV_2_0;
  wire [7:0] _m_io_out_QSV_2_1;
  wire [7:0] _m_io_out_QSV_3_0;
  wire [7:0] _m_io_out_QSV_3_1;
  wire [7:0] _m_io_out_QSV_4_0;
  wire [7:0] _m_io_out_QSV_4_1;
  wire [7:0] _m_io_out_QSV_5_0;
  wire [7:0] _m_io_out_QSV_5_1;
  wire [7:0] _m_io_out_QSV_6_0;
  wire [7:0] _m_io_out_QSV_6_1;
  wire [7:0] _m_io_out_QSV_7_0;
  wire [7:0] _m_io_out_QSV_7_1;
  wire       _m_io_out_valid;

  // Wires for m_1 (CompatiblePerm) - Feeds CSGate (missing 3_1 and 7_1)
  wire [7:0] _m_1_io_out_QSV_0_0;
  wire [7:0] _m_1_io_out_QSV_0_1;
  wire [7:0] _m_1_io_out_QSV_1_0;
  wire [7:0] _m_1_io_out_QSV_1_1;
  wire [7:0] _m_1_io_out_QSV_2_0;
  wire [7:0] _m_1_io_out_QSV_2_1;
  wire [7:0] _m_1_io_out_QSV_3_0;
  wire [7:0] _m_1_io_out_QSV_4_0;
  wire [7:0] _m_1_io_out_QSV_4_1;
  wire [7:0] _m_1_io_out_QSV_5_0;
  wire [7:0] _m_1_io_out_QSV_5_1;
  wire [7:0] _m_1_io_out_QSV_6_0;
  wire [7:0] _m_1_io_out_QSV_6_1;
  wire [7:0] _m_1_io_out_QSV_7_0;
  wire       _m_1_io_out_valid;

  // Wires for m_2 to m_9
  `define DECLARE_16_WIRES(NAME) \
  wire [7:0] ``NAME``_io_out_QSV_0_0; \
  wire [7:0] ``NAME``_io_out_QSV_0_1; \
  wire [7:0] ``NAME``_io_out_QSV_1_0; \
  wire [7:0] ``NAME``_io_out_QSV_1_1; \
  wire [7:0] ``NAME``_io_out_QSV_2_0; \
  wire [7:0] ``NAME``_io_out_QSV_2_1; \
  wire [7:0] ``NAME``_io_out_QSV_3_0; \
  wire [7:0] ``NAME``_io_out_QSV_3_1; \
  wire [7:0] ``NAME``_io_out_QSV_4_0; \
  wire [7:0] ``NAME``_io_out_QSV_4_1; \
  wire [7:0] ``NAME``_io_out_QSV_5_0; \
  wire [7:0] ``NAME``_io_out_QSV_5_1; \
  wire [7:0] ``NAME``_io_out_QSV_6_0; \
  wire [7:0] ``NAME``_io_out_QSV_6_1; \
  wire [7:0] ``NAME``_io_out_QSV_7_0; \
  wire [7:0] ``NAME``_io_out_QSV_7_1; \
  wire       ``NAME``_io_out_valid;

  `DECLARE_16_WIRES(_m_2)
  `DECLARE_16_WIRES(_m_3)
  `DECLARE_16_WIRES(_m_4)
  `DECLARE_16_WIRES(_m_5)
  `DECLARE_16_WIRES(_m_6)
  `DECLARE_16_WIRES(_m_7)
  `DECLARE_16_WIRES(_m_8)
  `DECLARE_16_WIRES(_m_9)

  // Wires for m_10 (CompatiblePerm_3) - Feeds CSGate (missing 3_1 and 7_1)
  wire [7:0] _m_10_io_out_QSV_0_0;
  wire [7:0] _m_10_io_out_QSV_0_1;
  wire [7:0] _m_10_io_out_QSV_1_0;
  wire [7:0] _m_10_io_out_QSV_1_1;
  wire [7:0] _m_10_io_out_QSV_2_0;
  wire [7:0] _m_10_io_out_QSV_2_1;
  wire [7:0] _m_10_io_out_QSV_3_0;
  wire [7:0] _m_10_io_out_QSV_4_0;
  wire [7:0] _m_10_io_out_QSV_4_1;
  wire [7:0] _m_10_io_out_QSV_5_0;
  wire [7:0] _m_10_io_out_QSV_5_1;
  wire [7:0] _m_10_io_out_QSV_6_0;
  wire [7:0] _m_10_io_out_QSV_6_1;
  wire [7:0] _m_10_io_out_QSV_7_0;
  wire       _m_10_io_out_valid;

  // Wires for m_11 to m_17
  `DECLARE_16_WIRES(_m_11)
  `DECLARE_16_WIRES(_m_12)
  `DECLARE_16_WIRES(_m_13)
  `DECLARE_16_WIRES(_m_14)
  `DECLARE_16_WIRES(_m_15)
  `DECLARE_16_WIRES(_m_16)
  `DECLARE_16_WIRES(_m_17)


  // Stage 0: h [0]
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
    .io_out_QSV_0_0(_m_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_io_out_QSV_7_1),
    .io_out_valid(_m_io_out_valid)
  );

  // Stage 1: Perm A for cs [1,0]
  CompatiblePerm m_1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_io_out_QSV_7_1),
    .io_in_valid(_m_io_out_valid),
    .io_out_QSV_0_0(_m_1_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_1_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_1_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_1_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_1_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_1_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_1_io_out_QSV_3_0),
    .io_out_QSV_4_0(_m_1_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_1_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_1_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_1_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_1_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_1_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_1_io_out_QSV_7_0),
    .io_out_valid(_m_1_io_out_valid)
  );

  // Stage 2: cs [1,0]
  CSGate3QubitVector8bit m_2 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_1_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_1_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_1_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_1_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_1_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_1_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_1_io_out_QSV_3_0),
    .io_in_QSV_4_0(_m_1_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_1_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_1_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_1_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_1_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_1_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_1_io_out_QSV_7_0),
    .io_in_valid(_m_1_io_out_valid),
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

  // Stage 3: Restore perm A
  CompatiblePerm m_3 (
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

  // Stage 4: Perm B for cp [2,0]
  CompatiblePerm_1 m_4 (
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

  // Stage 5: cp [2,0] -> CTGate
  CTGate3QubitVector8bit m_5 (
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
    .io_out_QSV_0_0(_m_5_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_5_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_5_io_out_QSV_1_0),
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

  // Stage 6: Restore perm B -> Perm C
  CompatiblePerm_2 m_6 (
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
    .io_out_QSV_0_0(_m_6_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_6_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_6_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_6_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_6_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_6_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_6_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_6_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_6_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_6_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_6_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_6_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_6_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_6_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_6_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_6_io_out_QSV_7_1),
    .io_out_valid(_m_6_io_out_valid)
  );

  // Stage 7: Perm A for h [1]
  CompatiblePerm m_7 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_6_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_6_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_6_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_6_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_6_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_6_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_6_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_6_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_6_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_6_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_6_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_6_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_6_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_6_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_6_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_6_io_out_QSV_7_1),
    .io_in_valid(_m_6_io_out_valid),
    .io_out_QSV_0_0(_m_7_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_7_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_7_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_7_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_7_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_7_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_7_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_7_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_7_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_7_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_7_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_7_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_7_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_7_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_7_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_7_io_out_QSV_7_1),
    .io_out_valid(_m_7_io_out_valid)
  );

  // Stage 8: h [1]
  HGate3QubitVector8bit m_8 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_7_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_7_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_7_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_7_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_7_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_7_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_7_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_7_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_7_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_7_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_7_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_7_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_7_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_7_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_7_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_7_io_out_QSV_7_1),
    .io_in_valid(_m_7_io_out_valid),
    .io_out_QSV_0_0(_m_8_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_8_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_8_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_8_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_8_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_8_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_8_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_8_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_8_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_8_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_8_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_8_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_8_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_8_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_8_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_8_io_out_QSV_7_1),
    .io_out_valid(_m_8_io_out_valid)
  );

  // Stage 9: Restore perm A
  CompatiblePerm m_9 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_8_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_8_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_8_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_8_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_8_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_8_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_8_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_8_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_8_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_8_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_8_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_8_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_8_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_8_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_8_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_8_io_out_QSV_7_1),
    .io_in_valid(_m_8_io_out_valid),
    .io_out_QSV_0_0(_m_9_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_9_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_9_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_9_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_9_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_9_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_9_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_9_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_9_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_9_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_9_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_9_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_9_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_9_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_9_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_9_io_out_QSV_7_1),
    .io_out_valid(_m_9_io_out_valid)
  );

  // Stage 10: Perm D for cs [2,1]
  CompatiblePerm_3 m_10 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_9_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_9_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_9_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_9_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_9_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_9_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_9_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_9_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_9_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_9_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_9_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_9_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_9_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_9_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_9_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_9_io_out_QSV_7_1),
    .io_in_valid(_m_9_io_out_valid),
    .io_out_QSV_0_0(_m_10_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_10_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_10_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_10_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_10_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_10_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_10_io_out_QSV_3_0),
    .io_out_QSV_4_0(_m_10_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_10_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_10_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_10_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_10_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_10_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_10_io_out_QSV_7_0),
    .io_out_valid(_m_10_io_out_valid)
  );

  // Stage 11: cs [2,1]
  CSGate3QubitVector8bit m_11 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_10_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_10_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_10_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_10_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_10_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_10_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_10_io_out_QSV_3_0),
    .io_in_QSV_4_0(_m_10_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_10_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_10_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_10_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_10_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_10_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_10_io_out_QSV_7_0),
    .io_in_valid(_m_10_io_out_valid),
    .io_out_QSV_0_0(_m_11_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_11_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_11_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_11_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_11_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_11_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_11_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_11_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_11_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_11_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_11_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_11_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_11_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_11_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_11_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_11_io_out_QSV_7_1),
    .io_out_valid(_m_11_io_out_valid)
  );

  // Stage 12: Restore perm D
  CompatiblePerm_3 m_12 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_11_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_11_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_11_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_11_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_11_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_11_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_11_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_11_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_11_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_11_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_11_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_11_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_11_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_11_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_11_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_11_io_out_QSV_7_1),
    .io_in_valid(_m_11_io_out_valid),
    .io_out_QSV_0_0(_m_12_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_12_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_12_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_12_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_12_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_12_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_12_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_12_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_12_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_12_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_12_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_12_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_12_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_12_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_12_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_12_io_out_QSV_7_1),
    .io_out_valid(_m_12_io_out_valid)
  );

  // Stage 13: Perm D for h [2]
  CompatiblePerm_3 m_13 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_12_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_12_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_12_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_12_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_12_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_12_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_12_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_12_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_12_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_12_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_12_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_12_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_12_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_12_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_12_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_12_io_out_QSV_7_1),
    .io_in_valid(_m_12_io_out_valid),
    .io_out_QSV_0_0(_m_13_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_13_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_13_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_13_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_13_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_13_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_13_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_13_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_13_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_13_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_13_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_13_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_13_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_13_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_13_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_13_io_out_QSV_7_1),
    .io_out_valid(_m_13_io_out_valid)
  );

  // Stage 14: h [2]
  HGate3QubitVector8bit m_14 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_13_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_13_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_13_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_13_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_13_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_13_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_13_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_13_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_13_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_13_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_13_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_13_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_13_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_13_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_13_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_13_io_out_QSV_7_1),
    .io_in_valid(_m_13_io_out_valid),
    .io_out_QSV_0_0(_m_14_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_14_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_14_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_14_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_14_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_14_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_14_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_14_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_14_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_14_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_14_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_14_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_14_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_14_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_14_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_14_io_out_QSV_7_1),
    .io_out_valid(_m_14_io_out_valid)
  );

  // Stage 15: Restore perm D
  CompatiblePerm_3 m_15 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_14_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_14_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_14_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_14_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_14_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_14_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_14_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_14_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_14_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_14_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_14_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_14_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_14_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_14_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_14_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_14_io_out_QSV_7_1),
    .io_in_valid(_m_14_io_out_valid),
    .io_out_QSV_0_0(_m_15_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_15_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_15_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_15_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_15_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_15_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_15_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_15_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_15_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_15_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_15_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_15_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_15_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_15_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_15_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_15_io_out_QSV_7_1),
    .io_out_valid(_m_15_io_out_valid)
  );

  // Stage 16: Perm E for swap [0,2]
  CompatiblePerm_4 m_16 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_15_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_15_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_15_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_15_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_15_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_15_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_15_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_15_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_15_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_15_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_15_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_15_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_15_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_15_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_15_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_15_io_out_QSV_7_1),
    .io_in_valid(_m_15_io_out_valid),
    .io_out_QSV_0_0(_m_16_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_16_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_16_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_16_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_16_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_16_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_16_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_16_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_16_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_16_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_16_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_16_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_16_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_16_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_16_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_16_io_out_QSV_7_1),
    .io_out_valid(_m_16_io_out_valid)
  );

  // Stage 17: swap [0,2]
  SWGate3QubitVector8bit m_17 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_16_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_16_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_16_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_16_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_16_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_16_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_16_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_16_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_16_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_16_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_16_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_16_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_16_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_16_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_16_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_16_io_out_QSV_7_1),
    .io_in_valid(_m_16_io_out_valid),
    .io_out_QSV_0_0(_m_17_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_17_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_17_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_17_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_17_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_17_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_17_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_17_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_17_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_17_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_17_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_17_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_17_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_17_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_17_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_17_io_out_QSV_7_1),
    .io_out_valid(_m_17_io_out_valid)
  );

  // Stage 18: Restore perm E and output
  CompatiblePerm_4 m_18 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(_m_17_io_out_QSV_0_0),
    .io_in_QSV_0_1(_m_17_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_17_io_out_QSV_1_0),
    .io_in_QSV_1_1(_m_17_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_17_io_out_QSV_2_0),
    .io_in_QSV_2_1(_m_17_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_17_io_out_QSV_3_0),
    .io_in_QSV_3_1(_m_17_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_17_io_out_QSV_4_0),
    .io_in_QSV_4_1(_m_17_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_17_io_out_QSV_5_0),
    .io_in_QSV_5_1(_m_17_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_17_io_out_QSV_6_0),
    .io_in_QSV_6_1(_m_17_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_17_io_out_QSV_7_0),
    .io_in_QSV_7_1(_m_17_io_out_QSV_7_1),
    .io_in_valid(_m_17_io_out_valid),
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
