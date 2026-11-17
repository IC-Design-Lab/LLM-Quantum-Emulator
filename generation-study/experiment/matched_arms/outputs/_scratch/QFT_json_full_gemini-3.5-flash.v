module QFT (
  input  logic        clock,
  input  logic        reset,
  input  logic [7:0]  io_in_QSV_0_0,
  input  logic [7:0]  io_in_QSV_0_1,
  input  logic [7:0]  io_in_QSV_1_0,
  input  logic [7:0]  io_in_QSV_1_1,
  input  logic [7:0]  io_in_QSV_2_0,
  input  logic [7:0]  io_in_QSV_2_1,
  input  logic [7:0]  io_in_QSV_3_0,
  input  logic [7:0]  io_in_QSV_3_1,
  input  logic [7:0]  io_in_QSV_4_0,
  input  logic [7:0]  io_in_QSV_4_1,
  input  logic [7:0]  io_in_QSV_5_0,
  input  logic [7:0]  io_in_QSV_5_1,
  input  logic [7:0]  io_in_QSV_6_0,
  input  logic [7:0]  io_in_QSV_6_1,
  input  logic [7:0]  io_in_QSV_7_0,
  input  logic [7:0]  io_in_QSV_7_1,
  input  logic        io_in_valid,
  output logic [7:0]  io_out_QSV_0_0,
  output logic [7:0]  io_out_QSV_0_1,
  output logic [7:0]  io_out_QSV_1_0,
  output logic [7:0]  io_out_QSV_1_1,
  output logic [7:0]  io_out_QSV_2_0,
  output logic [7:0]  io_out_QSV_2_1,
  output logic [7:0]  io_out_QSV_3_0,
  output logic [7:0]  io_out_QSV_3_1,
  output logic [7:0]  io_out_QSV_4_0,
  output logic [7:0]  io_out_QSV_4_1,
  output logic [7:0]  io_out_QSV_5_0,
  output logic [7:0]  io_out_QSV_5_1,
  output logic [7:0]  io_out_QSV_6_0,
  output logic [7:0]  io_out_QSV_6_1,
  output logic [7:0]  io_out_QSV_7_0,
  output logic [7:0]  io_out_QSV_7_1,
  output logic        io_out_valid
);

  // Stage 0 Output Wires
  logic [7:0] m_io_out_QSV_0_0;
  logic [7:0] m_io_out_QSV_0_1;
  logic [7:0] m_io_out_QSV_1_0;
  logic [7:0] m_io_out_QSV_1_1;
  logic [7:0] m_io_out_QSV_2_0;
  logic [7:0] m_io_out_QSV_2_1;
  logic [7:0] m_io_out_QSV_3_0;
  logic [7:0] m_io_out_QSV_3_1;
  logic [7:0] m_io_out_QSV_4_0;
  logic [7:0] m_io_out_QSV_4_1;
  logic [7:0] m_io_out_QSV_5_0;
  logic [7:0] m_io_out_QSV_5_1;
  logic [7:0] m_io_out_QSV_6_0;
  logic [7:0] m_io_out_QSV_6_1;
  logic [7:0] m_io_out_QSV_7_0;
  logic [7:0] m_io_out_QSV_7_1;
  logic       m_io_out_valid;

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
    .io_out_QSV_0_0(m_io_out_QSV_0_0),
    .io_out_QSV_0_1(m_io_out_QSV_0_1),
    .io_out_QSV_1_0(m_io_out_QSV_1_0),
    .io_out_QSV_1_1(m_io_out_QSV_1_1),
    .io_out_QSV_2_0(m_io_out_QSV_2_0),
    .io_out_QSV_2_1(m_io_out_QSV_2_1),
    .io_out_QSV_3_0(m_io_out_QSV_3_0),
    .io_out_QSV_3_1(m_io_out_QSV_3_1),
    .io_out_QSV_4_0(m_io_out_QSV_4_0),
    .io_out_QSV_4_1(m_io_out_QSV_4_1),
    .io_out_QSV_5_0(m_io_out_QSV_5_0),
    .io_out_QSV_5_1(m_io_out_QSV_5_1),
    .io_out_QSV_6_0(m_io_out_QSV_6_0),
    .io_out_QSV_6_1(m_io_out_QSV_6_1),
    .io_out_QSV_7_0(m_io_out_QSV_7_0),
    .io_out_QSV_7_1(m_io_out_QSV_7_1),
    .io_out_valid(m_io_out_valid)
  );

  // Stage 1 Output Wires
  logic [7:0] m_1_io_out_QSV_0_0;
  logic [7:0] m_1_io_out_QSV_0_1;
  logic [7:0] m_1_io_out_QSV_1_0;
  logic [7:0] m_1_io_out_QSV_1_1;
  logic [7:0] m_1_io_out_QSV_2_0;
  logic [7:0] m_1_io_out_QSV_2_1;
  logic [7:0] m_1_io_out_QSV_3_0;
  logic [7:0] m_1_io_out_QSV_3_1;
  logic [7:0] m_1_io_out_QSV_4_0;
  logic [7:0] m_1_io_out_QSV_4_1;
  logic [7:0] m_1_io_out_QSV_5_0;
  logic [7:0] m_1_io_out_QSV_5_1;
  logic [7:0] m_1_io_out_QSV_6_0;
  logic [7:0] m_1_io_out_QSV_6_1;
  logic [7:0] m_1_io_out_QSV_7_0;
  logic [7:0] m_1_io_out_QSV_7_1;
  logic       m_1_io_out_valid;

  CSGate3QubitVector8bit m_1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m_io_out_QSV_0_0),
    .io_in_QSV_0_1(m_io_out_QSV_0_1),
    .io_in_QSV_1_0(m_io_out_QSV_1_0),
    .io_in_QSV_1_1(m_io_out_QSV_1_1),
    .io_in_QSV_2_0(m_io_out_QSV_2_0),
    .io_in_QSV_2_1(m_io_out_QSV_2_1),
    .io_in_QSV_3_0(m_io_out_QSV_3_0),
    .io_in_QSV_4_0(m_io_out_QSV_4_0),
    .io_in_QSV_4_1(m_io_out_QSV_4_1),
    .io_in_QSV_5_0(m_io_out_QSV_5_0),
    .io_in_QSV_5_1(m_io_out_QSV_5_1),
    .io_in_QSV_6_0(m_io_out_QSV_6_0),
    .io_in_QSV_6_1(m_io_out_QSV_6_1),
    .io_in_QSV_7_0(m_io_out_QSV_7_0),
    .io_in_valid(m_io_out_valid),
    .io_out_QSV_0_0(m_1_io_out_QSV_0_0),
    .io_out_QSV_0_1(m_1_io_out_QSV_0_1),
    .io_out_QSV_1_0(m_1_io_out_QSV_1_0),
    .io_out_QSV_1_1(m_1_io_out_QSV_1_1),
    .io_out_QSV_2_0(m_1_io_out_QSV_2_0),
    .io_out_QSV_2_1(m_1_io_out_QSV_2_1),
    .io_out_QSV_3_0(m_1_io_out_QSV_3_0),
    .io_out_QSV_3_1(m_1_io_out_QSV_3_1),
    .io_out_QSV_4_0(m_1_io_out_QSV_4_0),
    .io_out_QSV_4_1(m_1_io_out_QSV_4_1),
    .io_out_QSV_5_0(m_1_io_out_QSV_5_0),
    .io_out_QSV_5_1(m_1_io_out_QSV_5_1),
    .io_out_QSV_6_0(m_1_io_out_QSV_6_0),
    .io_out_QSV_6_1(m_1_io_out_QSV_6_1),
    .io_out_QSV_7_0(m_1_io_out_QSV_7_0),
    .io_out_QSV_7_1(m_1_io_out_QSV_7_1),
    .io_out_valid(m_1_io_out_valid)
  );

  // Stage 2 Output Wires
  logic [7:0] m_2_io_out_QSV_0_0;
  logic [7:0] m_2_io_out_QSV_0_1;
  logic [7:0] m_2_io_out_QSV_1_0;
  logic [7:0] m_2_io_out_QSV_1_1;
  logic [7:0] m_2_io_out_QSV_2_0;
  logic [7:0] m_2_io_out_QSV_2_1;
  logic [7:0] m_2_io_out_QSV_3_0;
  logic [7:0] m_2_io_out_QSV_3_1;
  logic [7:0] m_2_io_out_QSV_4_0;
  logic [7:0] m_2_io_out_QSV_4_1;
  logic [7:0] m_2_io_out_QSV_5_0;
  logic [7:0] m_2_io_out_QSV_5_1;
  logic [7:0] m_2_io_out_QSV_6_0;
  logic [7:0] m_2_io_out_QSV_6_1;
  logic [7:0] m_2_io_out_QSV_7_0;
  logic [7:0] m_2_io_out_QSV_7_1;
  logic       m_2_io_out_valid;

  CompatiblePerm m_2 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m_1_io_out_QSV_0_0),
    .io_in_QSV_0_1(m_1_io_out_QSV_0_1),
    .io_in_QSV_1_0(m_1_io_out_QSV_1_0),
    .io_in_QSV_1_1(m_1_io_out_QSV_1_1),
    .io_in_QSV_2_0(m_1_io_out_QSV_2_0),
    .io_in_QSV_2_1(m_1_io_out_QSV_2_1),
    .io_in_QSV_3_0(m_1_io_out_QSV_3_0),
    .io_in_QSV_3_1(m_1_io_out_QSV_3_1),
    .io_in_QSV_4_0(m_1_io_out_QSV_4_0),
    .io_in_QSV_4_1(m_1_io_out_QSV_4_1),
    .io_in_QSV_5_0(m_1_io_out_QSV_5_0),
    .io_in_QSV_5_1(m_1_io_out_QSV_5_1),
    .io_in_QSV_6_0(m_1_io_out_QSV_6_0),
    .io_in_QSV_6_1(m_1_io_out_QSV_6_1),
    .io_in_QSV_7_0(m_1_io_out_QSV_7_0),
    .io_in_QSV_7_1(m_1_io_out_QSV_7_1),
    .io_in_valid(m_1_io_out_valid),
    .io_out_QSV_0_0(m_2_io_out_QSV_0_0),
    .io_out_QSV_0_1(m_2_io_out_QSV_0_1),
    .io_out_QSV_1_0(m_2_io_out_QSV_1_0),
    .io_out_QSV_1_1(m_2_io_out_QSV_1_1),
    .io_out_QSV_2_0(m_2_io_out_QSV_2_0),
    .io_out_QSV_2_1(m_2_io_out_QSV_2_1),
    .io_out_QSV_3_0(m_2_io_out_QSV_3_0),
    .io_out_QSV_3_1(m_2_io_out_QSV_3_1),
    .io_out_QSV_4_0(m_2_io_out_QSV_4_0),
    .io_out_QSV_4_1(m_2_io_out_QSV_4_1),
    .io_out_QSV_5_0(m_2_io_out_QSV_5_0),
    .io_out_QSV_5_1(m_2_io_out_QSV_5_1),
    .io_out_QSV_6_0(m_2_io_out_QSV_6_0),
    .io_out_QSV_6_1(m_2_io_out_QSV_6_1),
    .io_out_QSV_7_0(m_2_io_out_QSV_7_0),
    .io_out_QSV_7_1(m_2_io_out_QSV_7_1),
    .io_out_valid(m_2_io_out_valid)
  );

  // Stage 3 Output Wires
  logic [7:0] m_3_io_out_QSV_0_0;
  logic [7:0] m_3_io_out_QSV_0_1;
  logic [7:0] m_3_io_out_QSV_1_0;
  logic [7:0] m_3_io_out_QSV_1_1;
  logic [7:0] m_3_io_out_QSV_2_0;
  logic [7:0] m_3_io_out_QSV_2_1;
  logic [7:0] m_3_io_out_QSV_3_0;
  logic [7:0] m_3_io_out_QSV_3_1;
  logic [7:0] m_3_io_out_QSV_4_0;
  logic [7:0] m_3_io_out_QSV_4_1;
  logic [7:0] m_3_io_out_QSV_5_0;
  logic [7:0] m_3_io_out_QSV_5_1;
  logic [7:0] m_3_io_out_QSV_6_0;
  logic [7:0] m_3_io_out_QSV_6_1;
  logic [7:0] m_3_io_out_QSV_7_0;
  logic [7:0] m_3_io_out_QSV_7_1;
  logic       m_3_io_out_valid;

  CTGate3QubitVector8bit m_3 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m_2_io_out_QSV_0_0),
    .io_in_QSV_0_1(m_2_io_out_QSV_0_1),
    .io_in_QSV_1_0(m_2_io_out_QSV_1_0),
    .io_in_QSV_1_1(m_2_io_out_QSV_1_1),
    .io_in_QSV_2_0(m_2_io_out_QSV_2_0),
    .io_in_QSV_2_1(m_2_io_out_QSV_2_1),
    .io_in_QSV_3_0(m_2_io_out_QSV_3_0),
    .io_in_QSV_3_1(m_2_io_out_QSV_3_1),
    .io_in_QSV_4_0(m_2_io_out_QSV_4_0),
    .io_in_QSV_4_1(m_2_io_out_QSV_4_1),
    .io_in_QSV_5_0(m_2_io_out_QSV_5_0),
    .io_in_QSV_5_1(m_2_io_out_QSV_5_1),
    .io_in_QSV_6_0(m_2_io_out_QSV_6_0),
    .io_in_QSV_6_1(m_2_io_out_QSV_6_1),
    .io_in_QSV_7_0(m_2_io_out_QSV_7_0),
    .io_in_QSV_7_1(m_2_io_out_QSV_7_1),
    .io_in_valid(m_2_io_out_valid),
    .io_out_QSV_0_0(m_3_io_out_QSV_0_0),
    .io_out_QSV_0_1(m_3_io_out_QSV_0_1),
    .io_out_QSV_1_0(m_3_io_out_QSV_1_0),
    .io_out_QSV_1_1(m_3_io_out_QSV_1_1),
    .io_out_QSV_2_0(m_3_io_out_QSV_2_0),
    .io_out_QSV_2_1(m_3_io_out_QSV_2_1),
    .io_out_QSV_3_0(m_3_io_out_QSV_3_0),
    .io_out_QSV_3_1(m_3_io_out_QSV_3_1),
    .io_out_QSV_4_0(m_3_io_out_QSV_4_0),
    .io_out_QSV_4_1(m_3_io_out_QSV_4_1),
    .io_out_QSV_5_0(m_3_io_out_QSV_5_0),
    .io_out_QSV_5_1(m_3_io_out_QSV_5_1),
    .io_out_QSV_6_0(m_3_io_out_QSV_6_0),
    .io_out_QSV_6_1(m_3_io_out_QSV_6_1),
    .io_out_QSV_7_0(m_3_io_out_QSV_7_0),
    .io_out_QSV_7_1(m_3_io_out_QSV_7_1),
    .io_out_valid(m_3_io_out_valid)
  );

  // Stage 4 Output Wires
  logic [7:0] m_4_io_out_QSV_0_0;
  logic [7:0] m_4_io_out_QSV_0_1;
  logic [7:0] m_4_io_out_QSV_1_0;
  logic [7:0] m_4_io_out_QSV_1_1;
  logic [7:0] m_4_io_out_QSV_2_0;
  logic [7:0] m_4_io_out_QSV_2_1;
  logic [7:0] m_4_io_out_QSV_3_0;
  logic [7:0] m_4_io_out_QSV_3_1;
  logic [7:0] m_4_io_out_QSV_4_0;
  logic [7:0] m_4_io_out_QSV_4_1;
  logic [7:0] m_4_io_out_QSV_5_0;
  logic [7:0] m_4_io_out_QSV_5_1;
  logic [7:0] m_4_io_out_QSV_6_0;
  logic [7:0] m_4_io_out_QSV_6_1;
  logic [7:0] m_4_io_out_QSV_7_0;
  logic [7:0] m_4_io_out_QSV_7_1;
  logic       m_4_io_out_valid;

  CompatiblePerm_1 m_4 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m_3_io_out_QSV_0_0),
    .io_in_QSV_0_1(m_3_io_out_QSV_0_1),
    .io_in_QSV_1_0(m_3_io_out_QSV_1_0),
    .io_in_QSV_1_1(m_3_io_out_QSV_1_1),
    .io_in_QSV_2_0(m_3_io_out_QSV_2_0),
    .io_in_QSV_2_1(m_3_io_out_QSV_2_1),
    .io_in_QSV_3_0(m_3_io_out_QSV_3_0),
    .io_in_QSV_3_1(m_3_io_out_QSV_3_1),
    .io_in_QSV_4_0(m_3_io_out_QSV_4_0),
    .io_in_QSV_4_1(m_3_io_out_QSV_4_1),
    .io_in_QSV_5_0(m_3_io_out_QSV_5_0),
    .io_in_QSV_5_1(m_3_io_out_QSV_5_1),
    .io_in_QSV_6_0(m_3_io_out_QSV_6_0),
    .io_in_QSV_6_1(m_3_io_out_QSV_6_1),
    .io_in_QSV_7_0(m_3_io_out_QSV_7_0),
    .io_in_QSV_7_1(m_3_io_out_QSV_7_1),
    .io_in_valid(m_3_io_out_valid),
    .io_out_QSV_0_0(m_4_io_out_QSV_0_0),
    .io_out_QSV_0_1(m_4_io_out_QSV_0_1),
    .io_out_QSV_1_0(m_4_io_out_QSV_1_0),
    .io_out_QSV_1_1(m_4_io_out_QSV_1_1),
    .io_out_QSV_2_0(m_4_io_out_QSV_2_0),
    .io_out_QSV_2_1(m_4_io_out_QSV_2_1),
    .io_out_QSV_3_0(m_4_io_out_QSV_3_0),
    .io_out_QSV_3_1(m_4_io_out_QSV_3_1),
    .io_out_QSV_4_0(m_4_io_out_QSV_4_0),
    .io_out_QSV_4_1(m_4_io_out_QSV_4_1),
    .io_out_QSV_5_0(m_4_io_out_QSV_5_0),
    .io_out_QSV_5_1(m_4_io_out_QSV_5_1),
    .io_out_QSV_6_0(m_4_io_out_QSV_6_0),
    .io_out_QSV_6_1(m_4_io_out_QSV_6_1),
    .io_out_QSV_7_0(m_4_io_out_QSV_7_0),
    .io_out_QSV_7_1(m_4_io_out_QSV_7_1),
    .io_out_valid(m_4_io_out_valid)
  );

  // Stage 5 Output Wires
  logic [7:0] m_5_io_out_QSV_0_0;
  logic [7:0] m_5_io_out_QSV_0_1;
  logic [7:0] m_5_io_out_QSV_1_0;
  logic [7:0] m_5_io_out_QSV_1_1;
  logic [7:0] m_5_io_out_QSV_2_0;
  logic [7:0] m_5_io_out_QSV_2_1;
  logic [7:0] m_5_io_out_QSV_3_0;
  logic [7:0] m_5_io_out_QSV_3_1;
  logic [7:0] m_5_io_out_QSV_4_0;
  logic [7:0] m_5_io_out_QSV_4_1;
  logic [7:0] m_5_io_out_QSV_5_0;
  logic [7:0] m_5_io_out_QSV_5_1;
  logic [7:0] m_5_io_out_QSV_6_0;
  logic [7:0] m_5_io_out_QSV_6_1;
  logic [7:0] m_5_io_out_QSV_7_0;
  logic [7:0] m_5_io_out_QSV_7_1;
  logic       m_5_io_out_valid;

  HGate3QubitVector8bit m_5 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m_4_io_out_QSV_0_0),
    .io_in_QSV_0_1(m_4_io_out_QSV_0_1),
    .io_in_QSV_1_0(m_4_io_out_QSV_1_0),
    .io_in_QSV_1_1(m_4_io_out_QSV_1_1),
    .io_in_QSV_2_0(m_4_io_out_QSV_2_0),
    .io_in_QSV_2_1(m_4_io_out_QSV_2_1),
    .io_in_QSV_3_0(m_4_io_out_QSV_3_0),
    .io_in_QSV_3_1(m_4_io_out_QSV_3_1),
    .io_in_QSV_4_0(m_4_io_out_QSV_4_0),
    .io_in_QSV_4_1(m_4_io_out_QSV_4_1),
    .io_in_QSV_5_0(m_4_io_out_QSV_5_0),
    .io_in_QSV_5_1(m_4_io_out_QSV_5_1),
    .io_in_QSV_6_0(m_4_io_out_QSV_6_0),
    .io_in_QSV_6_1(m_4_io_out_QSV_6_1),
    .io_in_QSV_7_0(m_4_io_out_QSV_7_0),
    .io_in_QSV_7_1(m_4_io_out_QSV_7_1),
    .io_in_valid(m_4_io_out_valid),
    .io_out_QSV_0_0(m_5_io_out_QSV_0_0),
    .io_out_QSV_0_1(m_5_io_out_QSV_0_1),
    .io_out_QSV_1_0(m_5_io_out_QSV_1_0),
    .io_out_QSV_1_1(m_5_io_out_QSV_1_1),
    .io_out_QSV_2_0(m_5_io_out_QSV_2_0),
    .io_out_QSV_2_1(m_5_io_out_QSV_2_1),
    .io_out_QSV_3_0(m_5_io_out_QSV_3_0),
    .io_out_QSV_3_1(m_5_io_out_QSV_3_1),
    .io_out_QSV_4_0(m_5_io_out_QSV_4_0),
    .io_out_QSV_4_1(m_5_io_out_QSV_4_1),
    .io_out_QSV_5_0(m_5_io_out_QSV_5_0),
    .io_out_QSV_5_1(m_5_io_out_QSV_5_1),
    .io_out_QSV_6_0(m_5_io_out_QSV_6_0),
    .io_out_QSV_6_1(m_5_io_out_QSV_6_1),
    .io_out_QSV_7_0(m_5_io_out_QSV_7_0),
    .io_out_QSV_7_1(m_5_io_out_QSV_7_1),
    .io_out_valid(m_5_io_out_valid)
  );

  // Stage 6 Output Wires
  logic [7:0] m_6_io_out_QSV_0_0;
  logic [7:0] m_6_io_out_QSV_0_1;
  logic [7:0] m_6_io_out_QSV_1_0;
  logic [7:0] m_6_io_out_QSV_1_1;
  logic [7:0] m_6_io_out_QSV_2_0;
  logic [7:0] m_6_io_out_QSV_2_1;
  logic [7:0] m_6_io_out_QSV_3_0;
  logic [7:0] m_6_io_out_QSV_3_1;
  logic [7:0] m_6_io_out_QSV_4_0;
  logic [7:0] m_6_io_out_QSV_4_1;
  logic [7:0] m_6_io_out_QSV_5_0;
  logic [7:0] m_6_io_out_QSV_5_1;
  logic [7:0] m_6_io_out_QSV_6_0;
  logic [7:0] m_6_io_out_QSV_6_1;
  logic [7:0] m_6_io_out_QSV_7_0;
  logic [7:0] m_6_io_out_QSV_7_1;
  logic       m_6_io_out_valid;

  CSGate3QubitVector8bit m_6 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m_5_io_out_QSV_0_0),
    .io_in_QSV_0_1(m_5_io_out_QSV_0_1),
    .io_in_QSV_1_0(m_5_io_out_QSV_1_0),
    .io_in_QSV_1_1(m_5_io_out_QSV_1_1),
    .io_in_QSV_2_0(m_5_io_out_QSV_2_0),
    .io_in_QSV_2_1(m_5_io_out_QSV_2_1),
    .io_in_QSV_3_0(m_5_io_out_QSV_3_0),
    .io_in_QSV_4_0(m_5_io_out_QSV_4_0),
    .io_in_QSV_4_1(m_5_io_out_QSV_4_1),
    .io_in_QSV_5_0(m_5_io_out_QSV_5_0),
    .io_in_QSV_5_1(m_5_io_out_QSV_5_1),
    .io_in_QSV_6_0(m_5_io_out_QSV_6_0),
    .io_in_QSV_6_1(m_5_io_out_QSV_6_1),
    .io_in_QSV_7_0(m_5_io_out_QSV_7_0),
    .io_in_valid(m_5_io_out_valid),
    .io_out_QSV_0_0(m_6_io_out_QSV_0_0),
    .io_out_QSV_0_1(m_6_io_out_QSV_0_1),
    .io_out_QSV_1_0(m_6_io_out_QSV_1_0),
    .io_out_QSV_1_1(m_6_io_out_QSV_1_1),
    .io_out_QSV_2_0(m_6_io_out_QSV_2_0),
    .io_out_QSV_2_1(m_6_io_out_QSV_2_1),
    .io_out_QSV_3_0(m_6_io_out_QSV_3_0),
    .io_out_QSV_3_1(m_6_io_out_QSV_3_1),
    .io_out_QSV_4_0(m_6_io_out_QSV_4_0),
    .io_out_QSV_4_1(m_6_io_out_QSV_4_1),
    .io_out_QSV_5_0(m_6_io_out_QSV_5_0),
    .io_out_QSV_5_1(m_6_io_out_QSV_5_1),
    .io_out_QSV_6_0(m_6_io_out_QSV_6_0),
    .io_out_QSV_6_1(m_6_io_out_QSV_6_1),
    .io_out_QSV_7_0(m_6_io_out_QSV_7_0),
    .io_out_QSV_7_1(m_6_io_out_QSV_7_1),
    .io_out_valid(m_6_io_out_valid)
  );

  // Stage 7 Output Wires
  logic [7:0] m_7_io_out_QSV_0_0;
  logic [7:0] m_7_io_out_QSV_0_1;
  logic [7:0] m_7_io_out_QSV_1_0;
  logic [7:0] m_7_io_out_QSV_1_1;
  logic [7:0] m_7_io_out_QSV_2_0;
  logic [7:0] m_7_io_out_QSV_2_1;
  logic [7:0] m_7_io_out_QSV_3_0;
  logic [7:0] m_7_io_out_QSV_3_1;
  logic [7:0] m_7_io_out_QSV_4_0;
  logic [7:0] m_7_io_out_QSV_4_1;
  logic [7:0] m_7_io_out_QSV_5_0;
  logic [7:0] m_7_io_out_QSV_5_1;
  logic [7:0] m_7_io_out_QSV_6_0;
  logic [7:0] m_7_io_out_QSV_6_1;
  logic [7:0] m_7_io_out_QSV_7_0;
  logic [7:0] m_7_io_out_QSV_7_1;
  logic       m_7_io_out_valid;

  CompatiblePerm_2 m_7 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m_6_io_out_QSV_0_0),
    .io_in_QSV_0_1(m_6_io_out_QSV_0_1),
    .io_in_QSV_1_0(m_6_io_out_QSV_1_0),
    .io_in_QSV_1_1(m_6_io_out_QSV_1_1),
    .io_in_QSV_2_0(m_6_io_out_QSV_2_0),
    .io_in_QSV_2_1(m_6_io_out_QSV_2_1),
    .io_in_QSV_3_0(m_6_io_out_QSV_3_0),
    .io_in_QSV_3_1(m_6_io_out_QSV_3_1),
    .io_in_QSV_4_0(m_6_io_out_QSV_4_0),
    .io_in_QSV_4_1(m_6_io_out_QSV_4_1),
    .io_in_QSV_5_0(m_6_io_out_QSV_5_0),
    .io_in_QSV_5_1(m_6_io_out_QSV_5_1),
    .io_in_QSV_6_0(m_6_io_out_QSV_6_0),
    .io_in_QSV_6_1(m_6_io_out_QSV_6_1),
    .io_in_QSV_7_0(m_6_io_out_QSV_7_0),
    .io_in_QSV_7_1(m_6_io_out_QSV_7_1),
    .io_in_valid(m_6_io_out_valid),
    .io_out_QSV_0_0(m_7_io_out_QSV_0_0),
    .io_out_QSV_0_1(m_7_io_out_QSV_0_1),
    .io_out_QSV_1_0(m_7_io_out_QSV_1_0),
    .io_out_QSV_1_1(m_7_io_out_QSV_1_1),
    .io_out_QSV_2_0(m_7_io_out_QSV_2_0),
    .io_out_QSV_2_1(m_7_io_out_QSV_2_1),
    .io_out_QSV_3_0(m_7_io_out_QSV_3_0),
    .io_out_QSV_3_1(m_7_io_out_QSV_3_1),
    .io_out_QSV_4_0(m_7_io_out_QSV_4_0),
    .io_out_QSV_4_1(m_7_io_out_QSV_4_1),
    .io_out_QSV_5_0(m_7_io_out_QSV_5_0),
    .io_out_QSV_5_1(m_7_io_out_QSV_5_1),
    .io_out_QSV_6_0(m_7_io_out_QSV_6_0),
    .io_out_QSV_6_1(m_7_io_out_QSV_6_1),
    .io_out_QSV_7_0(m_7_io_out_QSV_7_0),
    .io_out_QSV_7_1(m_7_io_out_QSV_7_1),
    .io_out_valid(m_7_io_out_valid)
  );

  // Stage 8 Output Wires
  logic [7:0] m_8_io_out_QSV_0_0;
  logic [7:0] m_8_io_out_QSV_0_1;
  logic [7:0] m_8_io_out_QSV_1_0;
  logic [7:0] m_8_io_out_QSV_1_1;
  logic [7:0] m_8_io_out_QSV_2_0;
  logic [7:0] m_8_io_out_QSV_2_1;
  logic [7:0] m_8_io_out_QSV_3_0;
  logic [7:0] m_8_io_out_QSV_3_1;
  logic [7:0] m_8_io_out_QSV_4_0;
  logic [7:0] m_8_io_out_QSV_4_1;
  logic [7:0] m_8_io_out_QSV_5_0;
  logic [7:0] m_8_io_out_QSV_5_1;
  logic [7:0] m_8_io_out_QSV_6_0;
  logic [7:0] m_8_io_out_QSV_6_1;
  logic [7:0] m_8_io_out_QSV_7_0;
  logic [7:0] m_8_io_out_QSV_7_1;
  logic       m_8_io_out_valid;

  HGate3QubitVector8bit m_8 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m_7_io_out_QSV_0_0),
    .io_in_QSV_0_1(m_7_io_out_QSV_0_1),
    .io_in_QSV_1_0(m_7_io_out_QSV_1_0),
    .io_in_QSV_1_1(m_7_io_out_QSV_1_1),
    .io_in_QSV_2_0(m_7_io_out_QSV_2_0),
    .io_in_QSV_2_1(m_7_io_out_QSV_2_1),
    .io_in_QSV_3_0(m_7_io_out_QSV_3_0),
    .io_in_QSV_3_1(m_7_io_out_QSV_3_1),
    .io_in_QSV_4_0(m_7_io_out_QSV_4_0),
    .io_in_QSV_4_1(m_7_io_out_QSV_4_1),
    .io_in_QSV_5_0(m_7_io_out_QSV_5_0),
    .io_in_QSV_5_1(m_7_io_out_QSV_5_1),
    .io_in_QSV_6_0(m_7_io_out_QSV_6_0),
    .io_in_QSV_6_1(m_7_io_out_QSV_6_1),
    .io_in_QSV_7_0(m_7_io_out_QSV_7_0),
    .io_in_QSV_7_1(m_7_io_out_QSV_7_1),
    .io_in_valid(m_7_io_out_valid),
    .io_out_QSV_0_0(m_8_io_out_QSV_0_0),
    .io_out_QSV_0_1(m_8_io_out_QSV_0_1),
    .io_out_QSV_1_0(m_8_io_out_QSV_1_0),
    .io_out_QSV_1_1(m_8_io_out_QSV_1_1),
    .io_out_QSV_2_0(m_8_io_out_QSV_2_0),
    .io_out_QSV_2_1(m_8_io_out_QSV_2_1),
    .io_out_QSV_3_0(m_8_io_out_QSV_3_0),
    .io_out_QSV_3_1(m_8_io_out_QSV_3_1),
    .io_out_QSV_4_0(m_8_io_out_QSV_4_0),
    .io_out_QSV_4_1(m_8_io_out_QSV_4_1),
    .io_out_QSV_5_0(m_8_io_out_QSV_5_0),
    .io_out_QSV_5_1(m_8_io_out_QSV_5_1),
    .io_out_QSV_6_0(m_8_io_out_QSV_6_0),
    .io_out_QSV_6_1(m_8_io_out_QSV_6_1),
    .io_out_QSV_7_0(m_8_io_out_QSV_7_0),
    .io_out_QSV_7_1(m_8_io_out_QSV_7_1),
    .io_out_valid(m_8_io_out_valid)
  );

  // Stage 9 Output Wires
  logic [7:0] m_9_io_out_QSV_0_0;
  logic [7:0] m_9_io_out_QSV_0_1;
  logic [7:0] m_9_io_out_QSV_1_0;
  logic [7:0] m_9_io_out_QSV_1_1;
  logic [7:0] m_9_io_out_QSV_2_0;
  logic [7:0] m_9_io_out_QSV_2_1;
  logic [7:0] m_9_io_out_QSV_3_0;
  logic [7:0] m_9_io_out_QSV_3_1;
  logic [7:0] m_9_io_out_QSV_4_0;
  logic [7:0] m_9_io_out_QSV_4_1;
  logic [7:0] m_9_io_out_QSV_5_0;
  logic [7:0] m_9_io_out_QSV_5_1;
  logic [7:0] m_9_io_out_QSV_6_0;
  logic [7:0] m_9_io_out_QSV_6_1;
  logic [7:0] m_9_io_out_QSV_7_0;
  logic [7:0] m_9_io_out_QSV_7_1;
  logic       m_9_io_out_valid;

  CompatiblePerm m_9 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m_8_io_out_QSV_0_0),
    .io_in_QSV_0_1(m_8_io_out_QSV_0_1),
    .io_in_QSV_1_0(m_8_io_out_QSV_1_0),
    .io_in_QSV_1_1(m_8_io_out_QSV_1_1),
    .io_in_QSV_2_0(m_8_io_out_QSV_2_0),
    .io_in_QSV_2_1(m_8_io_out_QSV_2_1),
    .io_in_QSV_3_0(m_8_io_out_QSV_3_0),
    .io_in_QSV_3_1(m_8_io_out_QSV_3_1),
    .io_in_QSV_4_0(m_8_io_out_QSV_4_0),
    .io_in_QSV_4_1(m_8_io_out_QSV_4_1),
    .io_in_QSV_5_0(m_8_io_out_QSV_5_0),
    .io_in_QSV_5_1(m_8_io_out_QSV_5_1),
    .io_in_QSV_6_0(m_8_io_out_QSV_6_0),
    .io_in_QSV_6_1(m_8_io_out_QSV_6_1),
    .io_in_QSV_7_0(m_8_io_out_QSV_7_0),
    .io_in_QSV_7_1(m_8_io_out_QSV_7_1),
    .io_in_valid(m_8_io_out_valid),
    .io_out_QSV_0_0(m_9_io_out_QSV_0_0),
    .io_out_QSV_0_1(m_9_io_out_QSV_0_1),
    .io_out_QSV_1_0(m_9_io_out_QSV_1_0),
    .io_out_QSV_1_1(m_9_io_out_QSV_1_1),
    .io_out_QSV_2_0(m_9_io_out_QSV_2_0),
    .io_out_QSV_2_1(m_9_io_out_QSV_2_1),
    .io_out_QSV_3_0(m_9_io_out_QSV_3_0),
    .io_out_QSV_3_1(m_9_io_out_QSV_3_1),
    .io_out_QSV_4_0(m_9_io_out_QSV_4_0),
    .io_out_QSV_4_1(m_9_io_out_QSV_4_1),
    .io_out_QSV_5_0(m_9_io_out_QSV_5_0),
    .io_out_QSV_5_1(m_9_io_out_QSV_5_1),
    .io_out_QSV_6_0(m_9_io_out_QSV_6_0),
    .io_out_QSV_6_1(m_9_io_out_QSV_6_1),
    .io_out_QSV_7_0(m_9_io_out_QSV_7_0),
    .io_out_QSV_7_1(m_9_io_out_QSV_7_1),
    .io_out_valid(m_9_io_out_valid)
  );

  // Stage 10 Output Wires
  logic [7:0] m_10_io_out_QSV_0_0;
  logic [7:0] m_10_io_out_QSV_0_1;
  logic [7:0] m_10_io_out_QSV_1_0;
  logic [7:0] m_10_io_out_QSV_1_1;
  logic [7:0] m_10_io_out_QSV_2_0;
  logic [7:0] m_10_io_out_QSV_2_1;
  logic [7:0] m_10_io_out_QSV_3_0;
  logic [7:0] m_10_io_out_QSV_3_1;
  logic [7:0] m_10_io_out_QSV_4_0;
  logic [7:0] m_10_io_out_QSV_4_1;
  logic [7:0] m_10_io_out_QSV_5_0;
  logic [7:0] m_10_io_out_QSV_5_1;
  logic [7:0] m_10_io_out_QSV_6_0;
  logic [7:0] m_10_io_out_QSV_6_1;
  logic [7:0] m_10_io_out_QSV_7_0;
  logic [7:0] m_10_io_out_QSV_7_1;
  logic       m_10_io_out_valid;

  SWGate3QubitVector8bit m_10 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m_9_io_out_QSV_0_0),
    .io_in_QSV_0_1(m_9_io_out_QSV_0_1),
    .io_in_QSV_1_0(m_9_io_out_QSV_1_0),
    .io_in_QSV_1_1(m_9_io_out_QSV_1_1),
    .io_in_QSV_2_0(m_9_io_out_QSV_2_0),
    .io_in_QSV_2_1(m_9_io_out_QSV_2_1),
    .io_in_QSV_3_0(m_9_io_out_QSV_3_0),
    .io_in_QSV_3_1(m_9_io_out_QSV_3_1),
    .io_in_QSV_4_0(m_9_io_out_QSV_4_0),
    .io_in_QSV_4_1(m_9_io_out_QSV_4_1),
    .io_in_QSV_5_0(m_9_io_out_QSV_5_0),
    .io_in_QSV_5_1(m_9_io_out_QSV_5_1),
    .io_in_QSV_6_0(m_9_io_out_QSV_6_0),
    .io_in_QSV_6_1(m_9_io_out_QSV_6_1),
    .io_in_QSV_7_0(m_9_io_out_QSV_7_0),
    .io_in_QSV_7_1(m_9_io_out_QSV_7_1),
    .io_in_valid(m_9_io_out_valid),
    .io_out_QSV_0_0(m_10_io_out_QSV_0_0),
    .io_out_QSV_0_1(m_10_io_out_QSV_0_1),
    .io_out_QSV_1_0(m_10_io_out_QSV_1_0),
    .io_out_QSV_1_1(m_10_io_out_QSV_1_1),
    .io_out_QSV_2_0(m_10_io_out_QSV_2_0),
    .io_out_QSV_2_1(m_10_io_out_QSV_2_1),
    .io_out_QSV_3_0(m_10_io_out_QSV_3_0),
    .io_out_QSV_3_1(m_10_io_out_QSV_3_1),
    .io_out_QSV_4_0(m_10_io_out_QSV_4_0),
    .io_out_QSV_4_1(m_10_io_out_QSV_4_1),
    .io_out_QSV_5_0(m_10_io_out_QSV_5_0),
    .io_out_QSV_5_1(m_10_io_out_QSV_5_1),
    .io_out_QSV_6_0(m_10_io_out_QSV_6_0),
    .io_out_QSV_6_1(m_10_io_out_QSV_6_1),
    .io_out_QSV_7_0(m_10_io_out_QSV_7_0),
    .io_out_QSV_7_1(m_10_io_out_QSV_7_1),
    .io_out_valid(m_10_io_out_valid)
  );

  // Stage 11 Output Wires
  logic [7:0] m_11_io_out_QSV_0_0;
  logic [7:0] m_11_io_out_QSV_0_1;
  logic [7:0] m_11_io_out_QSV_1_0;
  logic [7:0] m_11_io_out_QSV_1_1;
  logic [7:0] m_11_io_out_QSV_2_0;
  logic [7:0] m_11_io_out_QSV_2_1;
  logic [7:0] m_11_io_out_QSV_3_0;
  logic [7:0] m_11_io_out_QSV_3_1;
  logic [7:0] m_11_io_out_QSV_4_0;
  logic [7:0] m_11_io_out_QSV_4_1;
  logic [7:0] m_11_io_out_QSV_5_0;
  logic [7:0] m_11_io_out_QSV_5_1;
  logic [7:0] m_11_io_out_QSV_6_0;
  logic [7:0] m_11_io_out_QSV_6_1;
  logic [7:0] m_11_io_out_QSV_7_0;
  logic [7:0] m_11_io_out_QSV_7_1;
  logic       m_11_io_out_valid;

  CompatiblePerm_2 m_11 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m_10_io_out_QSV_0_0),
    .io_in_QSV_0_1(m_10_io_out_QSV_0_1),
    .io_in_QSV_1_0(m_10_io_out_QSV_1_0),
    .io_in_QSV_1_1(m_10_io_out_QSV_1_1),
    .io_in_QSV_2_0(m_10_io_out_QSV_2_0),
    .io_in_QSV_2_1(m_10_io_out_QSV_2_1),
    .io_in_QSV_3_0(m_10_io_out_QSV_3_0),
    .io_in_QSV_3_1(m_10_io_out_QSV_3_1),
    .io_in_QSV_4_0(m_10_io_out_QSV_4_0),
    .io_in_QSV_4_1(m_10_io_out_QSV_4_1),
    .io_in_QSV_5_0(m_10_io_out_QSV_5_0),
    .io_in_QSV_5_1(m_10_io_out_QSV_5_1),
    .io_in_QSV_6_0(m_10_io_out_QSV_6_0),
    .io_in_QSV_6_1(m_10_io_out_QSV_6_1),
    .io_in_QSV_7_0(m_10_io_out_QSV_7_0),
    .io_in_QSV_7_1(m_10_io_out_QSV_7_1),
    .io_in_valid(m_10_io_out_valid),
    .io_out_QSV_0_0(m_11_io_out_QSV_0_0),
    .io_out_QSV_0_1(m_11_io_out_QSV_0_1),
    .io_out_QSV_1_0(m_11_io_out_QSV_1_0),
    .io_out_QSV_1_1(m_11_io_out_QSV_1_1),
    .io_out_QSV_2_0(m_11_io_out_QSV_2_0),
    .io_out_QSV_2_1(m_11_io_out_QSV_2_1),
    .io_out_QSV_3_0(m_11_io_out_QSV_3_0),
    .io_out_QSV_3_1(m_11_io_out_QSV_3_1),
    .io_out_QSV_4_0(m_11_io_out_QSV_4_0),
    .io_out_QSV_4_1(m_11_io_out_QSV_4_1),
    .io_out_QSV_5_0(m_11_io_out_QSV_5_0),
    .io_out_QSV_5_1(m_11_io_out_QSV_5_1),
    .io_out_QSV_6_0(m_11_io_out_QSV_6_0),
    .io_out_QSV_6_1(m_11_io_out_QSV_6_1),
    .io_out_QSV_7_0(m_11_io_out_QSV_7_0),
    .io_out_QSV_7_1(m_11_io_out_QSV_7_1),
    .io_out_valid(m_11_io_out_valid)
  );

  CompatiblePerm m_12 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m_11_io_out_QSV_0_0),
    .io_in_QSV_0_1(m_11_io_out_QSV_0_1),
    .io_in_QSV_1_0(m_11_io_out_QSV_1_0),
    .io_in_QSV_1_1(m_11_io_out_QSV_1_1),
    .io_in_QSV_2_0(m_11_io_out_QSV_2_0),
    .io_in_QSV_2_1(m_11_io_out_QSV_2_1),
    .io_in_QSV_3_0(m_11_io_out_QSV_3_0),
    .io_in_QSV_3_1(m_11_io_out_QSV_3_1),
    .io_in_QSV_4_0(m_11_io_out_QSV_4_0),
    .io_in_QSV_4_1(m_11_io_out_QSV_4_1),
    .io_in_QSV_5_0(m_11_io_out_QSV_5_0),
    .io_in_QSV_5_1(m_11_io_out_QSV_5_1),
    .io_in_QSV_6_0(m_11_io_out_QSV_6_0),
    .io_in_QSV_6_1(m_11_io_out_QSV_6_1),
    .io_in_QSV_7_0(m_11_io_out_QSV_7_0),
    .io_in_QSV_7_1(m_11_io_out_QSV_7_1),
    .io_in_valid(m_11_io_out_valid),
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
