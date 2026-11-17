module Shor (
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
  input  logic [7:0]  io_in_QSV_8_0,
  input  logic [7:0]  io_in_QSV_8_1,
  input  logic [7:0]  io_in_QSV_9_0,
  input  logic [7:0]  io_in_QSV_9_1,
  input  logic [7:0]  io_in_QSV_10_0,
  input  logic [7:0]  io_in_QSV_10_1,
  input  logic [7:0]  io_in_QSV_11_0,
  input  logic [7:0]  io_in_QSV_11_1,
  input  logic [7:0]  io_in_QSV_12_0,
  input  logic [7:0]  io_in_QSV_12_1,
  input  logic [7:0]  io_in_QSV_13_0,
  input  logic [7:0]  io_in_QSV_13_1,
  input  logic [7:0]  io_in_QSV_14_0,
  input  logic [7:0]  io_in_QSV_14_1,
  input  logic [7:0]  io_in_QSV_15_0,
  input  logic [7:0]  io_in_QSV_15_1,
  input  logic [7:0]  io_in_QSV_16_0,
  input  logic [7:0]  io_in_QSV_16_1,
  input  logic [7:0]  io_in_QSV_17_0,
  input  logic [7:0]  io_in_QSV_17_1,
  input  logic [7:0]  io_in_QSV_18_0,
  input  logic [7:0]  io_in_QSV_18_1,
  input  logic [7:0]  io_in_QSV_19_0,
  input  logic [7:0]  io_in_QSV_19_1,
  input  logic [7:0]  io_in_QSV_20_0,
  input  logic [7:0]  io_in_QSV_20_1,
  input  logic [7:0]  io_in_QSV_21_0,
  input  logic [7:0]  io_in_QSV_21_1,
  input  logic [7:0]  io_in_QSV_22_0,
  input  logic [7:0]  io_in_QSV_22_1,
  input  logic [7:0]  io_in_QSV_23_0,
  input  logic [7:0]  io_in_QSV_23_1,
  input  logic [7:0]  io_in_QSV_24_0,
  input  logic [7:0]  io_in_QSV_24_1,
  input  logic [7:0]  io_in_QSV_25_0,
  input  logic [7:0]  io_in_QSV_25_1,
  input  logic [7:0]  io_in_QSV_26_0,
  input  logic [7:0]  io_in_QSV_26_1,
  input  logic [7:0]  io_in_QSV_27_0,
  input  logic [7:0]  io_in_QSV_27_1,
  input  logic [7:0]  io_in_QSV_28_0,
  input  logic [7:0]  io_in_QSV_28_1,
  input  logic [7:0]  io_in_QSV_29_0,
  input  logic [7:0]  io_in_QSV_29_1,
  input  logic [7:0]  io_in_QSV_30_0,
  input  logic [7:0]  io_in_QSV_30_1,
  input  logic [7:0]  io_in_QSV_31_0,
  input  logic [7:0]  io_in_QSV_31_1,
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
  output logic [7:0]  io_out_QSV_8_0,
  output logic [7:0]  io_out_QSV_8_1,
  output logic [7:0]  io_out_QSV_9_0,
  output logic [7:0]  io_out_QSV_9_1,
  output logic [7:0]  io_out_QSV_10_0,
  output logic [7:0]  io_out_QSV_10_1,
  output logic [7:0]  io_out_QSV_11_0,
  output logic [7:0]  io_out_QSV_11_1,
  output logic [7:0]  io_out_QSV_12_0,
  output logic [7:0]  io_out_QSV_12_1,
  output logic [7:0]  io_out_QSV_13_0,
  output logic [7:0]  io_out_QSV_13_1,
  output logic [7:0]  io_out_QSV_14_0,
  output logic [7:0]  io_out_QSV_14_1,
  output logic [7:0]  io_out_QSV_15_0,
  output logic [7:0]  io_out_QSV_15_1,
  output logic [7:0]  io_out_QSV_16_0,
  output logic [7:0]  io_out_QSV_16_1,
  output logic [7:0]  io_out_QSV_17_0,
  output logic [7:0]  io_out_QSV_17_1,
  output logic [7:0]  io_out_QSV_18_0,
  output logic [7:0]  io_out_QSV_18_1,
  output logic [7:0]  io_out_QSV_19_0,
  output logic [7:0]  io_out_QSV_19_1,
  output logic [7:0]  io_out_QSV_20_0,
  output logic [7:0]  io_out_QSV_20_1,
  output logic [7:0]  io_out_QSV_21_0,
  output logic [7:0]  io_out_QSV_21_1,
  output logic [7:0]  io_out_QSV_22_0,
  output logic [7:0]  io_out_QSV_22_1,
  output logic [7:0]  io_out_QSV_23_0,
  output logic [7:0]  io_out_QSV_23_1,
  output logic [7:0]  io_out_QSV_24_0,
  output logic [7:0]  io_out_QSV_24_1,
  output logic [7:0]  io_out_QSV_25_0,
  output logic [7:0]  io_out_QSV_25_1,
  output logic [7:0]  io_out_QSV_26_0,
  output logic [7:0]  io_out_QSV_26_1,
  output logic [7:0]  io_out_QSV_27_0,
  output logic [7:0]  io_out_QSV_27_1,
  output logic [7:0]  io_out_QSV_28_0,
  output logic [7:0]  io_out_QSV_28_1,
  output logic [7:0]  io_out_QSV_29_0,
  output logic [7:0]  io_out_QSV_29_1,
  output logic [7:0]  io_out_QSV_30_0,
  output logic [7:0]  io_out_QSV_30_1,
  output logic [7:0]  io_out_QSV_31_0,
  output logic [7:0]  io_out_QSV_31_1,
  output logic        io_out_valid
);

  // Intermediate signals declaration helper macro/pattern
  `define DECLARE_STAGE_WIRES(prefix) \
    wire [7:0] prefix``QSV_0_0, prefix``QSV_0_1, prefix``QSV_1_0, prefix``QSV_1_1, \
               prefix``QSV_2_0, prefix``QSV_2_1, prefix``QSV_3_0, prefix``QSV_3_1, \
               prefix``QSV_4_0, prefix``QSV_4_1, prefix``QSV_5_0, prefix``QSV_5_1, \
               prefix``QSV_6_0, prefix``QSV_6_1, prefix``QSV_7_0, prefix``QSV_7_1, \
               prefix``QSV_8_0, prefix``QSV_8_1, prefix``QSV_9_0, prefix``QSV_9_1, \
               prefix``QSV_10_0, prefix``QSV_10_1, prefix``QSV_11_0, prefix``QSV_11_1, \
               prefix``QSV_12_0, prefix``QSV_12_1, prefix``QSV_13_0, prefix``QSV_13_1, \
               prefix``QSV_14_0, prefix``QSV_14_1, prefix``QSV_15_0, prefix``QSV_15_1, \
               prefix``QSV_16_0, prefix``QSV_16_1, prefix``QSV_17_0, prefix``QSV_17_1, \
               prefix``QSV_18_0, prefix``QSV_18_1, prefix``QSV_19_0, prefix``QSV_19_1, \
               prefix``QSV_20_0, prefix``QSV_20_1, prefix``QSV_21_0, prefix``QSV_21_1, \
               prefix``QSV_22_0, prefix``QSV_22_1, prefix``QSV_23_0, prefix``QSV_23_1, \
               prefix``QSV_24_0, prefix``QSV_24_1, prefix``QSV_25_0, prefix``QSV_25_1, \
               prefix``QSV_26_0, prefix``QSV_26_1, prefix``QSV_27_0, prefix``QSV_27_1, \
               prefix``QSV_28_0, prefix``QSV_28_1, prefix``QSV_29_0, prefix``QSV_29_1, \
               prefix``QSV_30_0, prefix``QSV_30_1, prefix``QSV_31_0, prefix``QSV_31_1; \
    wire       prefix``valid;

  `DECLARE_STAGE_WIRES(_m_io_out_)
  `DECLARE_STAGE_WIRES(_m_1_io_out_)
  `DECLARE_STAGE_WIRES(_m_2_io_out_)
  `DECLARE_STAGE_WIRES(_m_3_io_out_)
  `DECLARE_STAGE_WIRES(_m_4_io_out_)
  `DECLARE_STAGE_WIRES(_m_5_io_out_)
  `DECLARE_STAGE_WIRES(_m_6_io_out_)
  `DECLARE_STAGE_WIRES(_m_7_io_out_)
  `DECLARE_STAGE_WIRES(_m_8_io_out_)
  `DECLARE_STAGE_WIRES(_m_9_io_out_)
  `DECLARE_STAGE_WIRES(_m_10_io_out_)
  `DECLARE_STAGE_WIRES(_m_11_io_out_)
  `DECLARE_STAGE_WIRES(_m_12_io_out_)
  `DECLARE_STAGE_WIRES(_m_13_io_out_)
  `DECLARE_STAGE_WIRES(_m_14_io_out_)

  `undef DECLARE_STAGE_WIRES

  // Helper macro for module instantiations to reduce code verbosity while maintaining strict named mappings
  `define CONNECT_GATE_PORTS(in_pfx, out_pfx) \
    .clock(clock), \
    .reset(reset), \
    .io_in_valid(in_pfx``valid), \
    .io_in_QSV_0_0(in_pfx``QSV_0_0), .io_in_QSV_0_1(in_pfx``QSV_0_1), \
    .io_in_QSV_1_0(in_pfx``QSV_1_0), .io_in_QSV_1_1(in_pfx``QSV_1_1), \
    .io_in_QSV_2_0(in_pfx``QSV_2_0), .io_in_QSV_2_1(in_pfx``QSV_2_1), \
    .io_in_QSV_3_0(in_pfx``QSV_3_0), .io_in_QSV_3_1(in_pfx``QSV_3_1), \
    .io_in_QSV_4_0(in_pfx``QSV_4_0), .io_in_QSV_4_1(in_pfx``QSV_4_1), \
    .io_in_QSV_5_0(in_pfx``QSV_5_0), .io_in_QSV_5_1(in_pfx``QSV_5_1), \
    .io_in_QSV_6_0(in_pfx``QSV_6_0), .io_in_QSV_6_1(in_pfx``QSV_6_1), \
    .io_in_QSV_7_0(in_pfx``QSV_7_0), .io_in_QSV_7_1(in_pfx``QSV_7_1), \
    .io_in_QSV_8_0(in_pfx``QSV_8_0), .io_in_QSV_8_1(in_pfx``QSV_8_1), \
    .io_in_QSV_9_0(in_pfx``QSV_9_0), .io_in_QSV_9_1(in_pfx``QSV_9_1), \
    .io_in_QSV_10_0(in_pfx``QSV_10_0), .io_in_QSV_10_1(in_pfx``QSV_10_1), \
    .io_in_QSV_11_0(in_pfx``QSV_11_0), .io_in_QSV_11_1(in_pfx``QSV_11_1), \
    .io_in_QSV_12_0(in_pfx``QSV_12_0), .io_in_QSV_12_1(in_pfx``QSV_12_1), \
    .io_in_QSV_13_0(in_pfx``QSV_13_0), .io_in_QSV_13_1(in_pfx``QSV_13_1), \
    .io_in_QSV_14_0(in_pfx``QSV_14_0), .io_in_QSV_14_1(in_pfx``QSV_14_1), \
    .io_in_QSV_15_0(in_pfx``QSV_15_0), .io_in_QSV_15_1(in_pfx``QSV_15_1), \
    .io_in_QSV_16_0(in_pfx``QSV_16_0), .io_in_QSV_16_1(in_pfx``QSV_16_1), \
    .io_in_QSV_17_0(in_pfx``QSV_17_0), .io_in_QSV_17_1(in_pfx``QSV_17_1), \
    .io_in_QSV_18_0(in_pfx``QSV_18_0), .io_in_QSV_18_1(in_pfx``QSV_18_1), \
    .io_in_QSV_19_0(in_pfx``QSV_19_0), .io_in_QSV_19_1(in_pfx``QSV_19_1), \
    .io_in_QSV_20_0(in_pfx``QSV_20_0), .io_in_QSV_20_1(in_pfx``QSV_20_1), \
    .io_in_QSV_21_0(in_pfx``QSV_21_0), .io_in_QSV_21_1(in_pfx``QSV_21_1), \
    .io_in_QSV_22_0(in_pfx``QSV_22_0), .io_in_QSV_22_1(in_pfx``QSV_22_1), \
    .io_in_QSV_23_0(in_pfx``QSV_23_0), .io_in_QSV_23_1(in_pfx``QSV_23_1), \
    .io_in_QSV_24_0(in_pfx``QSV_24_0), .io_in_QSV_24_1(in_pfx``QSV_24_1), \
    .io_in_QSV_25_0(in_pfx``QSV_25_0), .io_in_QSV_25_1(in_pfx``QSV_25_1), \
    .io_in_QSV_26_0(in_pfx``QSV_26_0), .io_in_QSV_26_1(in_pfx``QSV_26_1), \
    .io_in_QSV_27_0(in_pfx``QSV_27_0), .io_in_QSV_27_1(in_pfx``QSV_27_1), \
    .io_in_QSV_28_0(in_pfx``QSV_28_0), .io_in_QSV_28_1(in_pfx``QSV_28_1), \
    .io_in_QSV_29_0(in_pfx``QSV_29_0), .io_in_QSV_29_1(in_pfx``QSV_29_1), \
    .io_in_QSV_30_0(in_pfx``QSV_30_0), .io_in_QSV_30_1(in_pfx``QSV_30_1), \
    .io_in_QSV_31_0(in_pfx``QSV_31_0), .io_in_QSV_31_1(in_pfx``QSV_31_1), \
    .io_out_valid(out_pfx``valid), \
    .io_out_QSV_0_0(out_pfx``QSV_0_0), .io_out_QSV_0_1(out_pfx``QSV_0_1), \
    .io_out_QSV_1_0(out_pfx``QSV_1_0), .io_out_QSV_1_1(out_pfx``QSV_1_1), \
    .io_out_QSV_2_0(out_pfx``QSV_2_0), .io_out_QSV_2_1(out_pfx``QSV_2_1), \
    .io_out_QSV_3_0(out_pfx``QSV_3_0), .io_out_QSV_3_1(out_pfx``QSV_3_1), \
    .io_out_QSV_4_0(out_pfx``QSV_4_0), .io_out_QSV_4_1(out_pfx``QSV_4_1), \
    .io_out_QSV_5_0(out_pfx``QSV_5_0), .io_out_QSV_5_1(out_pfx``QSV_5_1), \
    .io_out_QSV_6_0(out_pfx``QSV_6_0), .io_out_QSV_6_1(out_pfx``QSV_6_1), \
    .io_out_QSV_7_0(out_pfx``QSV_7_0), .io_out_QSV_7_1(out_pfx``QSV_7_1), \
    .io_out_QSV_8_0(out_pfx``QSV_8_0), .io_out_QSV_8_1(out_pfx``QSV_8_1), \
    .io_out_QSV_9_0(out_pfx``QSV_9_0), .io_out_QSV_9_1(out_pfx``QSV_9_1), \
    .io_out_QSV_10_0(out_pfx``QSV_10_0), .io_out_QSV_10_1(out_pfx``QSV_10_1), \
    .io_out_QSV_11_0(out_pfx``QSV_11_0), .io_out_QSV_11_1(out_pfx``QSV_11_1), \
    .io_out_QSV_12_0(out_pfx``QSV_12_0), .io_out_QSV_12_1(out_pfx``QSV_12_1), \
    .io_out_QSV_13_0(out_pfx``QSV_13_0), .io_out_QSV_13_1(out_pfx``QSV_13_1), \
    .io_out_QSV_14_0(out_pfx``QSV_14_0), .io_out_QSV_14_1(out_pfx``QSV_14_1), \
    .io_out_QSV_15_0(out_pfx``QSV_15_0), .io_out_QSV_15_1(out_pfx``QSV_15_1), \
    .io_out_QSV_16_0(out_pfx``QSV_16_0), .io_out_QSV_16_1(out_pfx``QSV_16_1), \
    .io_out_QSV_17_0(out_pfx``QSV_17_0), .io_out_QSV_17_1(out_pfx``QSV_17_1), \
    .io_out_QSV_18_0(out_pfx``QSV_18_0), .io_out_QSV_18_1(out_pfx``QSV_18_1), \
    .io_out_QSV_19_0(out_pfx``QSV_19_0), .io_out_QSV_19_1(out_pfx``QSV_19_1), \
    .io_out_QSV_20_0(out_pfx``QSV_20_0), .io_out_QSV_20_1(out_pfx``QSV_20_1), \
    .io_out_QSV_21_0(out_pfx``QSV_21_0), .io_out_QSV_21_1(out_pfx``QSV_21_1), \
    .io_out_QSV_22_0(out_pfx``QSV_22_0), .io_out_QSV_22_1(out_pfx``QSV_22_1), \
    .io_out_QSV_23_0(out_pfx``QSV_23_0), .io_out_QSV_23_1(out_pfx``QSV_23_1), \
    .io_out_QSV_24_0(out_pfx``QSV_24_0), .io_out_QSV_24_1(out_pfx``QSV_24_1), \
    .io_out_QSV_25_0(out_pfx``QSV_25_0), .io_out_QSV_25_1(out_pfx``QSV_25_1), \
    .io_out_QSV_26_0(out_pfx``QSV_26_0), .io_out_QSV_26_1(out_pfx``QSV_26_1), \
    .io_out_QSV_27_0(out_pfx``QSV_27_0), .io_out_QSV_27_1(out_pfx``QSV_27_1), \
    .io_out_QSV_28_0(out_pfx``QSV_28_0), .io_out_QSV_28_1(out_pfx``QSV_28_1), \
    .io_out_QSV_29_0(out_pfx``QSV_29_0), .io_out_QSV_29_1(out_pfx``QSV_29_1), \
    .io_out_QSV_30_0(out_pfx``QSV_30_0), .io_out_QSV_30_1(out_pfx``QSV_30_1), \
    .io_out_QSV_31_0(out_pfx``QSV_31_0), .io_out_QSV_31_1(out_pfx``QSV_31_1)

  // Stage 0: HGate5QubitVector8bit (instance m, cycles: 5)
  HGate5QubitVector8bit m (
    `CONNECT_GATE_PORTS(io_in_, _m_io_out_)
  );

  // Stage 1: CompatiblePerm (instance m_1, cycles: 1)
  CompatiblePerm m_1 (
    `CONNECT_GATE_PORTS(_m_io_out_, _m_1_io_out_)
  );

  // Stage 2: CNGate5QubitVector8bit (instance m_2, cycles: 1)
  CNGate5QubitVector8bit m_2 (
    `CONNECT_GATE_PORTS(_m_1_io_out_, _m_2_io_out_)
  );

  // Stage 3: CompatiblePerm_1 (instance m_3, cycles: 1)
  CompatiblePerm_1 m_3 (
    `CONNECT_GATE_PORTS(_m_2_io_out_, _m_3_io_out_)
  );

  // Stage 4: CompatiblePerm_2 (instance m_4, cycles: 1)
  CompatiblePerm_2 m_4 (
    `CONNECT_GATE_PORTS(_m_3_io_out_, _m_4_io_out_)
  );

  // Stage 5: CNGate5QubitVector8bit (instance m_5, cycles: 1)
  CNGate5QubitVector8bit m_5 (
    `CONNECT_GATE_PORTS(_m_4_io_out_, _m_5_io_out_)
  );

  // Stage 6: CompatiblePerm_3 (instance m_6, cycles: 1)
  CompatiblePerm_3 m_6 (
    `CONNECT_GATE_PORTS(_m_5_io_out_, _m_6_io_out_)
  );

  // Stage 7: CompatiblePerm_4 (instance m_7, cycles: 1)
  CompatiblePerm_4 m_7 (
    `CONNECT_GATE_PORTS(_m_6_io_out_, _m_7_io_out_)
  );

  // Stage 8: CNGate5QubitVector8bit (instance m_8, cycles: 1)
  CNGate5QubitVector8bit m_8 (
    `CONNECT_GATE_PORTS(_m_7_io_out_, _m_8_io_out_)
  );

  // Stage 9: CompatiblePerm_5 (instance m_9, cycles: 1)
  CompatiblePerm_5 m_9 (
    `CONNECT_GATE_PORTS(_m_8_io_out_, _m_9_io_out_)
  );

  // Stage 10: CompatiblePerm_6 (instance m_10, cycles: 1)
  CompatiblePerm_6 m_10 (
    `CONNECT_GATE_PORTS(_m_9_io_out_, _m_10_io_out_)
  );

  // Stage 11: CNGate5QubitVector8bit (instance m_11, cycles: 1)
  CNGate5QubitVector8bit m_11 (
    `CONNECT_GATE_PORTS(_m_10_io_out_, _m_11_io_out_)
  );

  // Stage 12: CompatiblePerm_1 (instance m_12, cycles: 1)
  CompatiblePerm_1 m_12 (
    `CONNECT_GATE_PORTS(_m_11_io_out_, _m_12_io_out_)
  );

  // Stage 13: CompatiblePerm_4 (instance m_13, cycles: 1)
  CompatiblePerm_4 m_13 (
    `CONNECT_GATE_PORTS(_m_12_io_out_, _m_13_io_out_)
  );

  // Stage 14: CompatiblePerm_9 (instance m_14, cycles: 1)
  CompatiblePerm_9 m_14 (
    `CONNECT_GATE_PORTS(_m_13_io_out_, _m_14_io_out_)
  );

  // Stage 15: CompatiblePerm_10 (instance m_15, cycles: 1)
  CompatiblePerm_10 m_15 (
    `CONNECT_GATE_PORTS(_m_14_io_out_, io_out_)
  );

  `undef CONNECT_GATE_PORTS

endmodule
