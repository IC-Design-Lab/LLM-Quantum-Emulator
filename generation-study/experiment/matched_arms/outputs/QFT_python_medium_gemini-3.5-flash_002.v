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

  // Intermediate wire declarations
  logic [7:0] _m_io_out_QSV_0_0, _m_io_out_QSV_0_1, _m_io_out_QSV_1_0, _m_io_out_QSV_1_1;
  logic [7:0] _m_io_out_QSV_2_0, _m_io_out_QSV_2_1, _m_io_out_QSV_3_0, _m_io_out_QSV_3_1;
  logic [7:0] _m_io_out_QSV_4_0, _m_io_out_QSV_4_1, _m_io_out_QSV_5_0, _m_io_out_QSV_5_1;
  logic [7:0] _m_io_out_QSV_6_0, _m_io_out_QSV_6_1, _m_io_out_QSV_7_0, _m_io_out_QSV_7_1;
  logic       _m_io_out_valid;

  logic [7:0] _m_1_io_out_QSV_0_0, _m_1_io_out_QSV_0_1, _m_1_io_out_QSV_1_0, _m_1_io_out_QSV_1_1;
  logic [7:0] _m_1_io_out_QSV_2_0, _m_1_io_out_QSV_2_1, _m_1_io_out_QSV_3_0, _m_1_io_out_QSV_3_1;
  logic [7:0] _m_1_io_out_QSV_4_0, _m_1_io_out_QSV_4_1, _m_1_io_out_QSV_5_0, _m_1_io_out_QSV_5_1;
  logic [7:0] _m_1_io_out_QSV_6_0, _m_1_io_out_QSV_6_1, _m_1_io_out_QSV_7_0, _m_1_io_out_QSV_7_1;
  logic       _m_1_io_out_valid;

  logic [7:0] _m_2_io_out_QSV_0_0, _m_2_io_out_QSV_0_1, _m_2_io_out_QSV_1_0, _m_2_io_out_QSV_1_1;
  logic [7:0] _m_2_io_out_QSV_2_0, _m_2_io_out_QSV_2_1, _m_2_io_out_QSV_3_0, _m_2_io_out_QSV_3_1;
  logic [7:0] _m_2_io_out_QSV_4_0, _m_2_io_out_QSV_4_1, _m_2_io_out_QSV_5_0, _m_2_io_out_QSV_5_1;
  logic [7:0] _m_2_io_out_QSV_6_0, _m_2_io_out_QSV_6_1, _m_2_io_out_QSV_7_0, _m_2_io_out_QSV_7_1;
  logic       _m_2_io_out_valid;

  logic [7:0] _m_3_io_out_QSV_0_0, _m_3_io_out_QSV_0_1, _m_3_io_out_QSV_1_0, _m_3_io_out_QSV_1_1;
  logic [7:0] _m_3_io_out_QSV_2_0, _m_3_io_out_QSV_2_1, _m_3_io_out_QSV_3_0, _m_3_io_out_QSV_3_1;
  logic [7:0] _m_3_io_out_QSV_4_0, _m_3_io_out_QSV_4_1, _m_3_io_out_QSV_5_0, _m_3_io_out_QSV_5_1;
  logic [7:0] _m_3_io_out_QSV_6_0, _m_3_io_out_QSV_6_1, _m_3_io_out_QSV_7_0, _m_3_io_out_QSV_7_1;
  logic       _m_3_io_out_valid;

  logic [7:0] _m_4_io_out_QSV_0_0, _m_4_io_out_QSV_0_1, _m_4_io_out_QSV_1_0, _m_4_io_out_QSV_1_1;
  logic [7:0] _m_4_io_out_QSV_2_0, _m_4_io_out_QSV_2_1, _m_4_io_out_QSV_3_0, _m_4_io_out_QSV_3_1;
  logic [7:0] _m_4_io_out_QSV_4_0, _m_4_io_out_QSV_4_1, _m_4_io_out_QSV_5_0, _m_4_io_out_QSV_5_1;
  logic [7:0] _m_4_io_out_QSV_6_0, _m_4_io_out_QSV_6_1, _m_4_io_out_QSV_7_0, _m_4_io_out_QSV_7_1;
  logic       _m_4_io_out_valid;

  logic [7:0] _m_5_io_out_QSV_0_0, _m_5_io_out_QSV_0_1, _m_5_io_out_QSV_1_0, _m_5_io_out_QSV_1_1;
  logic [7:0] _m_5_io_out_QSV_2_0, _m_5_io_out_QSV_2_1, _m_5_io_out_QSV_3_0, _m_5_io_out_QSV_3_1;
  logic [7:0] _m_5_io_out_QSV_4_0, _m_5_io_out_QSV_4_1, _m_5_io_out_QSV_5_0, _m_5_io_out_QSV_5_1;
  logic [7:0] _m_5_io_out_QSV_6_0, _m_5_io_out_QSV_6_1, _m_5_io_out_QSV_7_0, _m_5_io_out_QSV_7_1;
  logic       _m_5_io_out_valid;

  logic [7:0] _m_6_io_out_QSV_0_0, _m_6_io_out_QSV_0_1, _m_6_io_out_QSV_1_0, _m_6_io_out_QSV_1_1;
  logic [7:0] _m_6_io_out_QSV_2_0, _m_6_io_out_QSV_2_1, _m_6_io_out_QSV_3_0, _m_6_io_out_QSV_3_1;
  logic [7:0] _m_6_io_out_QSV_4_0, _m_6_io_out_QSV_4_1, _m_6_io_out_QSV_5_0, _m_6_io_out_QSV_5_1;
  logic [7:0] _m_6_io_out_QSV_6_0, _m_6_io_out_QSV_6_1, _m_6_io_out_QSV_7_0, _m_6_io_out_QSV_7_1;
  logic       _m_6_io_out_valid;

  logic [7:0] _m_7_io_out_QSV_0_0, _m_7_io_out_QSV_0_1, _m_7_io_out_QSV_1_0, _m_7_io_out_QSV_1_1;
  logic [7:0] _m_7_io_out_QSV_2_0, _m_7_io_out_QSV_2_1, _m_7_io_out_QSV_3_0, _m_7_io_out_QSV_3_1;
  logic [7:0] _m_7_io_out_QSV_4_0, _m_7_io_out_QSV_4_1, _m_7_io_out_QSV_5_0, _m_7_io_out_QSV_5_1;
  logic [7:0] _m_7_io_out_QSV_6_0, _m_7_io_out_QSV_6_1, _m_7_io_out_QSV_7_0, _m_7_io_out_QSV_7_1;
  logic       _m_7_io_out_valid;

  logic [7:0] _m_8_io_out_QSV_0_0, _m_8_io_out_QSV_0_1, _m_8_io_out_QSV_1_0, _m_8_io_out_QSV_1_1;
  logic [7:0] _m_8_io_out_QSV_2_0, _m_8_io_out_QSV_2_1, _m_8_io_out_QSV_3_0, _m_8_io_out_QSV_3_1;
  logic [7:0] _m_8_io_out_QSV_4_0, _m_8_io_out_QSV_4_1, _m_8_io_out_QSV_5_0, _m_8_io_out_QSV_5_1;
  logic [7:0] _m_8_io_out_QSV_6_0, _m_8_io_out_QSV_6_1, _m_8_io_out_QSV_7_0, _m_8_io_out_QSV_7_1;
  logic       _m_8_io_out_valid;

  logic [7:0] _m_9_io_out_QSV_0_0, _m_9_io_out_QSV_0_1, _m_9_io_out_QSV_1_0, _m_9_io_out_QSV_1_1;
  logic [7:0] _m_9_io_out_QSV_2_0, _m_9_io_out_QSV_2_1, _m_9_io_out_QSV_3_0, _m_9_io_out_QSV_3_1;
  logic [7:0] _m_9_io_out_QSV_4_0, _m_9_io_out_QSV_4_1, _m_9_io_out_QSV_5_0, _m_9_io_out_QSV_5_1;
  logic [7:0] _m_9_io_out_QSV_6_0, _m_9_io_out_QSV_6_1, _m_9_io_out_QSV_7_0, _m_9_io_out_QSV_7_1;
  logic       _m_9_io_out_valid;

  logic [7:0] _m_10_io_out_QSV_0_0, _m_10_io_out_QSV_0_1, _m_10_io_out_QSV_1_0, _m_10_io_out_QSV_1_1;
  logic [7:0] _m_10_io_out_QSV_2_0, _m_10_io_out_QSV_2_1, _m_10_io_out_QSV_3_0, _m_10_io_out_QSV_3_1;
  logic [7:0] _m_10_io_out_QSV_4_0, _m_10_io_out_QSV_4_1, _m_10_io_out_QSV_5_0, _m_10_io_out_QSV_5_1;
  logic [7:0] _m_10_io_out_QSV_6_0, _m_10_io_out_QSV_6_1, _m_10_io_out_QSV_7_0, _m_10_io_out_QSV_7_1;
  logic       _m_10_io_out_valid;

  logic [7:0] _m_11_io_out_QSV_0_0, _m_11_io_out_QSV_0_1, _m_11_io_out_QSV_1_0, _m_11_io_out_QSV_1_1;
  logic [7:0] _m_11_io_out_QSV_2_0, _m_11_io_out_QSV_2_1, _m_11_io_out_QSV_3_0, _m_11_io_out_QSV_3_1;
  logic [7:0] _m_11_io_out_QSV_4_0, _m_11_io_out_QSV_4_1, _m_11_io_out_QSV_5_0, _m_11_io_out_QSV_5_1;
  logic [7:0] _m_11_io_out_QSV_6_0, _m_11_io_out_QSV_6_1, _m_11_io_out_QSV_7_0, _m_11_io_out_QSV_7_1;
  logic       _m_11_io_out_valid;

  logic [7:0] _m_12_io_out_QSV_0_0, _m_12_io_out_QSV_0_1, _m_12_io_out_QSV_1_0, _m_12_io_out_QSV_1_1;
  logic [7:0] _m_12_io_out_QSV_2_0, _m_12_io_out_QSV_2_1, _m_12_io_out_QSV_3_0, _m_12_io_out_QSV_3_1;
  logic [7:0] _m_12_io_out_QSV_4_0, _m_12_io_out_QSV_4_1, _m_12_io_out_QSV_5_0, _m_12_io_out_QSV_5_1;
  logic [7:0] _m_12_io_out_QSV_6_0, _m_12_io_out_QSV_6_1, _m_12_io_out_QSV_7_0, _m_12_io_out_QSV_7_1;
  logic       _m_12_io_out_valid;

  logic [7:0] _m_13_io_out_QSV_0_0, _m_13_io_out_QSV_0_1, _m_13_io_out_QSV_1_0, _m_13_io_out_QSV_1_1;
  logic [7:0] _m_13_io_out_QSV_2_0, _m_13_io_out_QSV_2_1, _m_13_io_out_QSV_3_0, _m_13_io_out_QSV_3_1;
  logic [7:0] _m_13_io_out_QSV_4_0, _m_13_io_out_QSV_4_1, _m_13_io_out_QSV_5_0, _m_13_io_out_QSV_5_1;
  logic [7:0] _m_13_io_out_QSV_6_0, _m_13_io_out_QSV_6_1, _m_13_io_out_QSV_7_0, _m_13_io_out_QSV_7_1;
  logic       _m_13_io_out_valid;

  logic [7:0] _m_14_io_out_QSV_0_0, _m_14_io_out_QSV_0_1, _m_14_io_out_QSV_1_0, _m_14_io_out_QSV_1_1;
  logic [7:0] _m_14_io_out_QSV_2_0, _m_14_io_out_QSV_2_1, _m_14_io_out_QSV_3_0, _m_14_io_out_QSV_3_1;
  logic [7:0] _m_14_io_out_QSV_4_0, _m_14_io_out_QSV_4_1, _m_14_io_out_QSV_5_0, _m_14_io_out_QSV_5_1;
  logic [7:0] _m_14_io_out_QSV_6_0, _m_14_io_out_QSV_6_1, _m_14_io_out_QSV_7_0, _m_14_io_out_QSV_7_1;
  logic       _m_14_io_out_valid;

  logic [7:0] _m_15_io_out_QSV_0_0, _m_15_io_out_QSV_0_1, _m_15_io_out_QSV_1_0, _m_15_io_out_QSV_1_1;
  logic [7:0] _m_15_io_out_QSV_2_0, _m_15_io_out_QSV_2_1, _m_15_io_out_QSV_3_0, _m_15_io_out_QSV_3_1;
  logic [7:0] _m_15_io_out_QSV_4_0, _m_15_io_out_QSV_4_1, _m_15_io_out_QSV_5_0, _m_15_io_out_QSV_5_1;
  logic [7:0] _m_15_io_out_QSV_6_0, _m_15_io_out_QSV_6_1, _m_15_io_out_QSV_7_0, _m_15_io_out_QSV_7_1;
  logic       _m_15_io_out_valid;

  logic [7:0] _m_16_io_out_QSV_0_0, _m_16_io_out_QSV_0_1, _m_16_io_out_QSV_1_0, _m_16_io_out_QSV_1_1;
  logic [7:0] _m_16_io_out_QSV_2_0, _m_16_io_out_QSV_2_1, _m_16_io_out_QSV_3_0, _m_16_io_out_QSV_3_1;
  logic [7:0] _m_16_io_out_QSV_4_0, _m_16_io_out_QSV_4_1, _m_16_io_out_QSV_5_0, _m_16_io_out_QSV_5_1;
  logic [7:0] _m_16_io_out_QSV_6_0, _m_16_io_out_QSV_6_1, _m_16_io_out_QSV_7_0, _m_16_io_out_QSV_7_1;
  logic       _m_16_io_out_valid;

  logic [7:0] _m_17_io_out_QSV_0_0, _m_17_io_out_QSV_0_1, _m_17_io_out_QSV_1_0, _m_17_io_out_QSV_1_1;
  logic [7:0] _m_17_io_out_QSV_2_0, _m_17_io_out_QSV_2_1, _m_17_io_out_QSV_3_0, _m_17_io_out_QSV_3_1;
  logic [7:0] _m_17_io_out_QSV_4_0, _m_17_io_out_QSV_4_1, _m_17_io_out_QSV_5_0, _m_17_io_out_QSV_5_1;
  logic [7:0] _m_17_io_out_QSV_6_0, _m_17_io_out_QSV_6_1, _m_17_io_out_QSV_7_0, _m_17_io_out_QSV_7_1;
  logic       _m_17_io_out_valid;

  logic [7:0] _m_18_io_out_QSV_0_0, _m_18_io_out_QSV_0_1, _m_18_io_out_QSV_1_0, _m_18_io_out_QSV_1_1;
  logic [7:0] _m_18_io_out_QSV_2_0, _m_18_io_out_QSV_2_1, _m_18_io_out_QSV_3_0, _m_18_io_out_QSV_3_1;
  logic [7:0] _m_18_io_out_QSV_4_0, _m_18_io_out_QSV_4_1, _m_18_io_out_QSV_5_0, _m_18_io_out_QSV_5_1;
  logic [7:0] _m_18_io_out_QSV_6_0, _m_18_io_out_QSV_6_1, _m_18_io_out_QSV_7_0, _m_18_io_out_QSV_7_1;
  logic       _m_18_io_out_valid;

  // Step 0: HGate on Qubit 0
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

  // Step 1: CS on Qubits 1,0 (Permutation Before)
  CompatiblePerm_2 m_1 (
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

  // Step 1: CS Gate (Pruned Ports: io_in_QSV_3_1 and io_in_QSV_7_1 are omitted)
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

  // Step 1: CS on Qubits 1,0 (Permutation After)
  CompatiblePerm_2 m_3 (
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

  // Step 2: CP on Qubits 2,0 (Permutation Before)
  CompatiblePerm_2 m_4 (
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

  // Step 2: CT Gate (CP pi/4)
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

  // Step 2: CP on Qubits 2,0 (Permutation After)
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

  // Step 3: HGate on Qubit 1 (Permutation Before)
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

  // Step 3: HGate
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

  // Step 3: HGate on Qubit 1 (Permutation After)
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

  // Step 4: CS on Qubits 2,1 (Permutation Before)
  CompatiblePerm m_10 (
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
    .io_out_QSV_3_1(_m_10_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_10_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_10_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_10_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_10_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_10_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_10_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_10_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_10_io_out_QSV_7_1),
    .io_out_valid(_m_10_io_out_valid)
  );

  // Step 4: CS Gate (Pruned Ports: io_in_QSV_3_1 and io_in_QSV_7_1 are omitted)
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

  // Step 4: CS on Qubits 2,1 (Permutation After)
  CompatiblePerm m_12 (
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

  // Step 5: HGate on Qubit 2 (Permutation Before)
  CompatiblePerm_1 m_13 (
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

  // Step 5: HGate
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

  // Step 5: HGate on Qubit 2 (Permutation After)
  CompatiblePerm_1 m_15 (
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

  // Step 6: SWAP on Qubits 0,2 (Permutation Before)
  CompatiblePerm_2 m_16 (
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

  // Step 6: SWAP Gate
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

  // Step 6: SWAP on Qubits 0,2 (Permutation After)
  CompatiblePerm_2 m_18 (
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
    .io_out_QSV_0_0(_m_18_io_out_QSV_0_0),
    .io_out_QSV_0_1(_m_18_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_18_io_out_QSV_1_0),
    .io_out_QSV_1_1(_m_18_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_18_io_out_QSV_2_0),
    .io_out_QSV_2_1(_m_18_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_18_io_out_QSV_3_0),
    .io_out_QSV_3_1(_m_18_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_18_io_out_QSV_4_0),
    .io_out_QSV_4_1(_m_18_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_18_io_out_QSV_5_0),
    .io_out_QSV_5_1(_m_18_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_18_io_out_QSV_6_0),
    .io_out_QSV_6_1(_m_18_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_18_io_out_QSV_7_0),
    .io_out_QSV_7_1(_m_18_io_out_QSV_7_1),
    .io_out_valid(_m_18_io_out_valid)
  );

  // Top-level output assignments
  assign io_out_QSV_0_0 = _m_18_io_out_QSV_0_0;
  assign io_out_QSV_0_1 = _m_18_io_out_QSV_0_1;
  assign io_out_QSV_1_0 = _m_18_io_out_QSV_1_0;
  assign io_out_QSV_1_1 = _m_18_io_out_QSV_1_1;
  assign io_out_QSV_2_0 = _m_18_io_out_QSV_2_0;
  assign io_out_QSV_2_1 = _m_18_io_out_QSV_2_1;
  assign io_out_QSV_3_0 = _m_18_io_out_QSV_3_0;
  assign io_out_QSV_3_1 = _m_18_io_out_QSV_3_1;
  assign io_out_QSV_4_0 = _m_18_io_out_QSV_4_0;
  assign io_out_QSV_4_1 = _m_18_io_out_QSV_4_1;
  assign io_out_QSV_5_0 = _m_18_io_out_QSV_5_0;
  assign io_out_QSV_5_1 = _m_18_io_out_QSV_5_1;
  assign io_out_QSV_6_0 = _m_18_io_out_QSV_6_0;
  assign io_out_QSV_6_1 = _m_18_io_out_QSV_6_1;
  assign io_out_QSV_7_0 = _m_18_io_out_QSV_7_0;
  assign io_out_QSV_7_1 = _m_18_io_out_QSV_7_1;
  assign io_out_valid   = _m_18_io_out_valid;

endmodule
