`timescale 1ns / 1ps

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
  output logic [7:0] io_out_QSV_8_0,
  output logic [7:0] io_out_QSV_8_1,
  output logic [7:0] io_out_QSV_9_0,
  output logic [7:0] io_out_QSV_9_1,
  output logic [7:0] io_out_QSV_10_0,
  output logic [7:0] io_out_QSV_10_1,
  output logic [7:0] io_out_QSV_11_0,
  output logic [7:0] io_out_QSV_11_1,
  output logic [7:0] io_out_QSV_12_0,
  output logic [7:0] io_out_QSV_12_1,
  output logic [7:0] io_out_QSV_13_0,
  output logic [7:0] io_out_QSV_13_1,
  output logic [7:0] io_out_QSV_14_0,
  output logic [7:0] io_out_QSV_14_1,
  output logic [7:0] io_out_QSV_15_0,
  output logic [7:0] io_out_QSV_15_1,
  output logic [7:0] io_out_QSV_16_0,
  output logic [7:0] io_out_QSV_16_1,
  output logic [7:0] io_out_QSV_17_0,
  output logic [7:0] io_out_QSV_17_1,
  output logic [7:0] io_out_QSV_18_0,
  output logic [7:0] io_out_QSV_18_1,
  output logic [7:0] io_out_QSV_19_0,
  output logic [7:0] io_out_QSV_19_1,
  output logic [7:0] io_out_QSV_20_0,
  output logic [7:0] io_out_QSV_20_1,
  output logic [7:0] io_out_QSV_21_0,
  output logic [7:0] io_out_QSV_21_1,
  output logic [7:0] io_out_QSV_22_0,
  output logic [7:0] io_out_QSV_22_1,
  output logic [7:0] io_out_QSV_23_0,
  output logic [7:0] io_out_QSV_23_1,
  output logic [7:0] io_out_QSV_24_0,
  output logic [7:0] io_out_QSV_24_1,
  output logic [7:0] io_out_QSV_25_0,
  output logic [7:0] io_out_QSV_25_1,
  output logic [7:0] io_out_QSV_26_0,
  output logic [7:0] io_out_QSV_26_1,
  output logic [7:0] io_out_QSV_27_0,
  output logic [7:0] io_out_QSV_27_1,
  output logic [7:0] io_out_QSV_28_0,
  output logic [7:0] io_out_QSV_28_1,
  output logic [7:0] io_out_QSV_29_0,
  output logic [7:0] io_out_QSV_29_1,
  output logic [7:0] io_out_QSV_30_0,
  output logic [7:0] io_out_QSV_30_1,
  output logic [7:0] io_out_QSV_31_0,
  output logic [7:0] io_out_QSV_31_1,
  output logic        io_out_valid
);

  // Intermediate signals generator
  `define INTERMEDIATE_SIGNALS(inst) \
    wire [7:0] _``inst``_io_out_QSV_0_0, _``inst``_io_out_QSV_0_1, _``inst``_io_out_QSV_1_0, _``inst``_io_out_QSV_1_1, \
               _``inst``_io_out_QSV_2_0, _``inst``_io_out_QSV_2_1, _``inst``_io_out_QSV_3_0, _``inst``_io_out_QSV_3_1, \
               _``inst``_io_out_QSV_4_0, _``inst``_io_out_QSV_4_1, _``inst``_io_out_QSV_5_0, _``inst``_io_out_QSV_5_1, \
               _``inst``_io_out_QSV_6_0, _``inst``_io_out_QSV_6_1, _``inst``_io_out_QSV_7_0, _``inst``_io_out_QSV_7_1, \
               _``inst``_io_out_QSV_8_0, _``inst``_io_out_QSV_8_1, _``inst``_io_out_QSV_9_0, _``inst``_io_out_QSV_9_1, \
               _``inst``_io_out_QSV_10_0, _``inst``_io_out_QSV_10_1, _``inst``_io_out_QSV_11_0, _``inst``_io_out_QSV_11_1, \
               _``inst``_io_out_QSV_12_0, _``inst``_io_out_QSV_12_1, _``inst``_io_out_QSV_13_0, _``inst``_io_out_QSV_13_1, \
               _``inst``_io_out_QSV_14_0, _``inst``_io_out_QSV_14_1, _``inst``_io_out_QSV_15_0, _``inst``_io_out_QSV_15_1, \
               _``inst``_io_out_QSV_16_0, _``inst``_io_out_QSV_16_1, _``inst``_io_out_QSV_17_0, _``inst``_io_out_QSV_17_1, \
               _``inst``_io_out_QSV_18_0, _``inst``_io_out_QSV_18_1, _``inst``_io_out_QSV_19_0, _``inst``_io_out_QSV_19_1, \
               _``inst``_io_out_QSV_20_0, _``inst``_io_out_QSV_20_1, _``inst``_io_out_QSV_21_0, _``inst``_io_out_QSV_21_1, \
               _``inst``_io_out_QSV_22_0, _``inst``_io_out_QSV_22_1, _``inst``_io_out_QSV_23_0, _``inst``_io_out_QSV_23_1, \
               _``inst``_io_out_QSV_24_0, _``inst``_io_out_QSV_24_1, _``inst``_io_out_QSV_25_0, _``inst``_io_out_QSV_25_1, \
               _``inst``_io_out_QSV_26_0, _``inst``_io_out_QSV_26_1, _``inst``_io_out_QSV_27_0, _``inst``_io_out_QSV_27_1, \
               _``inst``_io_out_QSV_28_0, _``inst``_io_out_QSV_28_1, _``inst``_io_out_QSV_29_0, _``inst``_io_out_QSV_29_1, \
               _``inst``_io_out_QSV_30_0, _``inst``_io_out_QSV_30_1, _``inst``_io_out_QSV_31_0, _``inst``_io_out_QSV_31_1; \
    wire _``inst``_io_out_valid;

  `INTERMEDIATE_SIGNALS(m)
  `INTERMEDIATE_SIGNALS(m_1)
  `INTERMEDIATE_SIGNALS(m_2)
  `INTERMEDIATE_SIGNALS(m_3)
  `INTERMEDIATE_SIGNALS(m_4)
  `INTERMEDIATE_SIGNALS(m_5)
  `INTERMEDIATE_SIGNALS(m_6)
  `INTERMEDIATE_SIGNALS(m_7)
  `INTERMEDIATE_SIGNALS(m_8)
  `INTERMEDIATE_SIGNALS(m_9)
  `INTERMEDIATE_SIGNALS(m_10)
  `INTERMEDIATE_SIGNALS(m_11)
  `INTERMEDIATE_SIGNALS(m_12)
  `INTERMEDIATE_SIGNALS(m_13)
  `INTERMEDIATE_SIGNALS(m_14)

  `undef INTERMEDIATE_SIGNALS

  `define CONNECT_STAGE(module_name, inst, prev_out, next_in) \
    module_name inst ( \
      .clock(clock), .reset(reset), \
      .io_in_QSV_0_0(prev_out``_io_out_QSV_0_0), .io_in_QSV_0_1(prev_out``_io_out_QSV_0_1), \
      .io_in_QSV_1_0(prev_out``_io_out_QSV_1_0), .io_in_QSV_1_1(prev_out``_io_out_QSV_1_1), \
      .io_in_QSV_2_0(prev_out``_io_out_QSV_2_0), .io_in_QSV_2_1(prev_out``_io_out_QSV_2_1), \
      .io_in_QSV_3_0(prev_out``_io_out_QSV_3_0), .io_in_QSV_3_1(prev_out``_io_out_QSV_3_1), \
      .io_in_QSV_4_0(prev_out``_io_out_QSV_4_0), .io_in_QSV_4_1(prev_out``_io_out_QSV_4_1), \
      .io_in_QSV_5_0(prev_out``_io_out_QSV_5_0), .io_in_QSV_5_1(prev_out``_io_out_QSV_5_1), \
      .io_in_QSV_6_0(prev_out``_io_out_QSV_6_0), .io_in_QSV_6_1(prev_out``_io_out_QSV_6_1), \
      .io_in_QSV_7_0(prev_out``_io_out_QSV_7_0), .io_in_QSV_7_1(prev_out``_io_out_QSV_7_1), \
      .io_in_QSV_8_0(prev_out``_io_out_QSV_8_0), .io_in_QSV_8_1(prev_out``_io_out_QSV_8_1), \
      .io_in_QSV_9_0(prev_out``_io_out_QSV_9_0), .io_in_QSV_9_1(prev_out``_io_out_QSV_9_1), \
      .io_in_QSV_10_0(prev_out``_io_out_QSV_10_0), .io_in_QSV_10_1(prev_out``_io_out_QSV_10_1), \
      .io_in_QSV_11_0(prev_out``_io_out_QSV_11_0), .io_in_QSV_11_1(prev_out``_io_out_QSV_11_1), \
      .io_in_QSV_12_0(prev_out``_io_out_QSV_12_0), .io_in_QSV_12_1(prev_out``_io_out_QSV_12_1), \
      .io_in_QSV_13_0(prev_out``_io_out_QSV_13_0), .io_in_QSV_13_1(prev_out``_io_out_QSV_13_1), \
      .io_in_QSV_14_0(prev_out``_io_out_QSV_14_0), .io_in_QSV_14_1(prev_out``_io_out_QSV_14_1), \
      .io_in_QSV_15_0(prev_out``_io_out_QSV_15_0), .io_in_QSV_15_1(prev_out``_io_out_QSV_15_1), \
      .io_in_QSV_16_0(prev_out``_io_out_QSV_16_0), .io_in_QSV_16_1(prev_out``_io_out_QSV_16_1), \
      .io_in_QSV_17_0(prev_out``_io_out_QSV_17_0), .io_in_QSV_17_1(prev_out``_io_out_QSV_17_1), \
      .io_in_QSV_18_0(prev_out``_io_out_QSV_18_0), .io_in_QSV_18_1(prev_out``_io_out_QSV_18_1), \
      .io_in_QSV_19_0(prev_out``_io_out_QSV_19_0), .io_in_QSV_19_1(prev_out``_io_out_QSV_19_1), \
      .io_in_QSV_20_0(prev_out``_io_out_QSV_20_0), .io_in_QSV_20_1(prev_out``_io_out_QSV_20_1), \
      .io_in_QSV_21_0(prev_out``_io_out_QSV_21_0), .io_in_QSV_21_1(prev_out``_io_out_QSV_21_1), \
      .io_in_QSV_22_0(prev_out``_io_out_QSV_22_0), .io_in_QSV_22_1(prev_out``_io_out_QSV_22_1), \
      .io_in_QSV_23_0(prev_out``_io_out_QSV_23_0), .io_in_QSV_23_1(prev_out``_io_out_QSV_23_1), \
      .io_in_QSV_24_0(prev_out``_io_out_QSV_24_0), .io_in_QSV_24_1(prev_out``_io_out_QSV_24_1), \
      .io_in_QSV_25_0(prev_out``_io_out_QSV_25_0), .io_in_QSV_25_1(prev_out``_io_out_QSV_25_1), \
      .io_in_QSV_26_0(prev_out``_io_out_QSV_26_0), .io_in_QSV_26_1(prev_out``_io_out_QSV_26_1), \
      .io_in_QSV_27_0(prev_out``_io_out_QSV_27_0), .io_in_QSV_27_1(prev_out``_io_out_QSV_27_1), \
      .io_in_QSV_28_0(prev_out``_io_out_QSV_28_0), .io_in_QSV_28_1(prev_out``_io_out_QSV_28_1), \
      .io_in_QSV_29_0(prev_out``_io_out_QSV_29_0), .io_in_QSV_29_1(prev_out``_io_out_QSV_29_1), \
      .io_in_QSV_30_0(prev_out``_io_out_QSV_30_0), .io_in_QSV_30_1(prev_out``_io_out_QSV_30_1), \
      .io_in_QSV_31_0(prev_out``_io_out_QSV_31_0), .io_in_QSV_31_1(prev_out``_io_out_QSV_31_1), \
      .io_in_valid(prev_out``_io_out_valid), \
      .io_out_QSV_0_0(_``next_in``_io_out_QSV_0_0), .io_out_QSV_0_1(_``next_in``_io_out_QSV_0_1), \
      .io_out_QSV_1_0(_``next_in``_io_out_QSV_1_0), .io_out_QSV_1_1(_``next_in``_io_out_QSV_1_1), \
      .io_out_QSV_2_0(_``next_in``_io_out_QSV_2_0), .io_out_QSV_2_1(_``next_in``_io_out_QSV_2_1), \
      .io_out_QSV_3_0(_``next_in``_io_out_QSV_3_0), .io_out_QSV_3_1(_``next_in``_io_out_QSV_3_1), \
      .io_out_QSV_4_0(_``next_in``_io_out_QSV_4_0), .io_out_QSV_4_1(_``next_in``_io_out_QSV_4_1), \
      .io_out_QSV_5_0(_``next_in``_io_out_QSV_5_0), .io_out_QSV_5_1(_``next_in``_io_out_QSV_5_1), \
      .io_out_QSV_6_0(_``next_in``_io_out_QSV_6_0), .io_out_QSV_6_1(_``next_in``_io_out_QSV_6_1), \
      .io_out_QSV_7_0(_``next_in``_io_out_QSV_7_0), .io_out_QSV_7_1(_``next_in``_io_out_QSV_7_1), \
      .io_out_QSV_8_0(_``next_in``_io_out_QSV_8_0), .io_out_QSV_8_1(_``next_in``_io_out_QSV_8_1), \
      .io_out_QSV_9_0(_``next_in``_io_out_QSV_9_0), .io_out_QSV_9_1(_``next_in``_io_out_QSV_9_1), \
      .io_out_QSV_10_0(_``next_in``_io_out_QSV_10_0), .io_out_QSV_10_1(_``next_in``_io_out_QSV_10_1), \
      .io_out_QSV_11_0(_``next_in``_io_out_QSV_11_0), .io_out_QSV_11_1(_``next_in``_io_out_QSV_11_1), \
      .io_out_QSV_12_0(_``next_in``_io_out_QSV_12_0), .io_out_QSV_12_1(_``next_in``_io_out_QSV_12_1), \
      .io_out_QSV_13_0(_``next_in``_io_out_QSV_13_0), .io_out_QSV_13_1(_``next_in``_io_out_QSV_13_1), \
      .io_out_QSV_14_0(_``next_in``_io_out_QSV_14_0), .io_out_QSV_14_1(_``next_in``_io_out_QSV_14_1), \
      .io_out_QSV_15_0(_``next_in``_io_out_QSV_15_0), .io_out_QSV_15_1(_``next_in``_io_out_QSV_15_1), \
      .io_out_QSV_16_0(_``next_in``_io_out_QSV_16_0), .io_out_QSV_16_1(_``next_in``_io_out_QSV_16_1), \
      .io_out_QSV_17_0(_``next_in``_io_out_QSV_17_0), .io_out_QSV_17_1(_``next_in``_io_out_QSV_17_1), \
      .io_out_QSV_18_0(_``next_in``_io_out_QSV_18_0), .io_out_QSV_18_1(_``next_in``_io_out_QSV_18_1), \
      .io_out_QSV_19_0(_``next_in``_io_out_QSV_19_0), .io_out_QSV_19_1(_``next_in``_io_out_QSV_19_1), \
      .io_out_QSV_20_0(_``next_in``_io_out_QSV_20_0), .io_out_QSV_20_1(_``next_in``_io_out_QSV_20_1), \
      .io_out_QSV_21_0(_``next_in``_io_out_QSV_21_0), .io_out_QSV_21_1(_``next_in``_io_out_QSV_21_1), \
      .io_out_QSV_22_0(_``next_in``_io_out_QSV_22_0), .io_out_QSV_22_1(_``next_in``_io_out_QSV_22_1), \
      .io_out_QSV_23_0(_``next_in``_io_out_QSV_23_0), .io_out_QSV_23_1(_``next_in``_io_out_QSV_23_1), \
      .io_out_QSV_24_0(_``next_in``_io_out_QSV_24_0), .io_out_QSV_24_1(_``next_in``_io_out_QSV_24_1), \
      .io_out_QSV_25_0(_``next_in``_io_out_QSV_25_0), .io_out_QSV_25_1(_``next_in``_io_out_QSV_25_1), \
      .io_out_QSV_26_0(_``next_in``_io_out_QSV_26_0), .io_out_QSV_26_1(_``next_in``_io_out_QSV_26_1), \
      .io_out_QSV_27_0(_``next_in``_io_out_QSV_27_0), .io_out_QSV_27_1(_``next_in``_io_out_QSV_27_1), \
      .io_out_QSV_28_0(_``next_in``_io_out_QSV_28_0), .io_out_QSV_28_1(_``next_in``_io_out_QSV_28_1), \
      .io_out_QSV_29_0(_``next_in``_io_out_QSV_29_0), .io_out_QSV_29_1(_``next_in``_io_out_QSV_29_1), \
      .io_out_QSV_30_0(_``next_in``_io_out_QSV_30_0), .io_out_QSV_30_1(_``next_in``_io_out_QSV_30_1), \
      .io_out_QSV_31_0(_``next_in``_io_out_QSV_31_0), .io_out_QSV_31_1(_``next_in``_io_out_QSV_31_1), \
      .io_out_valid(_``next_in``_io_out_valid) \
    );

  // Stage 0: HGate5QubitVector8bit (instance m)
  HGate5QubitVector8bit m (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
    .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
    .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
    .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
    .io_in_QSV_4_0(io_in_QSV_4_0), .io_in_QSV_4_1(io_in_QSV_4_1),
    .io_in_QSV_5_0(io_in_QSV_5_0), .io_in_QSV_5_1(io_in_QSV_5_1),
    .io_in_QSV_6_0(io_in_QSV_6_0), .io_in_QSV_6_1(io_in_QSV_6_1),
    .io_in_QSV_7_0(io_in_QSV_7_0), .io_in_QSV_7_1(io_in_QSV_7_1),
    .io_in_QSV_8_0(io_in_QSV_8_0), .io_in_QSV_8_1(io_in_QSV_8_1),
    .io_in_QSV_9_0(io_in_QSV_9_0), .io_in_QSV_9_1(io_in_QSV_9_1),
    .io_in_QSV_10_0(io_in_QSV_10_0), .io_in_QSV_10_1(io_in_QSV_10_1),
    .io_in_QSV_11_0(io_in_QSV_11_0), .io_in_QSV_11_1(io_in_QSV_11_1),
    .io_in_QSV_12_0(io_in_QSV_12_0), .io_in_QSV_12_1(io_in_QSV_12_1),
    .io_in_QSV_13_0(io_in_QSV_13_0), .io_in_QSV_13_1(io_in_QSV_13_1),
    .io_in_QSV_14_0(io_in_QSV_14_0), .io_in_QSV_14_1(io_in_QSV_14_1),
    .io_in_QSV_15_0(io_in_QSV_15_0), .io_in_QSV_15_1(io_in_QSV_15_1),
    .io_in_QSV_16_0(io_in_QSV_16_0), .io_in_QSV_16_1(io_in_QSV_16_1),
    .io_in_QSV_17_0(io_in_QSV_17_0), .io_in_QSV_17_1(io_in_QSV_17_1),
    .io_in_QSV_18_0(io_in_QSV_18_0), .io_in_QSV_18_1(io_in_QSV_18_1),
    .io_in_QSV_19_0(io_in_QSV_19_0), .io_in_QSV_19_1(io_in_QSV_19_1),
    .io_in_QSV_20_0(io_in_QSV_20_0), .io_in_QSV_20_1(io_in_QSV_20_1),
    .io_in_QSV_21_0(io_in_QSV_21_0), .io_in_QSV_21_1(io_in_QSV_21_1),
    .io_in_QSV_22_0(io_in_QSV_22_0), .io_in_QSV_22_1(io_in_QSV_22_1),
    .io_in_QSV_23_0(io_in_QSV_23_0), .io_in_QSV_23_1(io_in_QSV_23_1),
    .io_in_QSV_24_0(io_in_QSV_24_0), .io_in_QSV_24_1(io_in_QSV_24_1),
    .io_in_QSV_25_0(io_in_QSV_25_0), .io_in_QSV_25_1(io_in_QSV_25_1),
    .io_in_QSV_26_0(io_in_QSV_26_0), .io_in_QSV_26_1(io_in_QSV_26_1),
    .io_in_QSV_27_0(io_in_QSV_27_0), .io_in_QSV_27_1(io_in_QSV_27_1),
    .io_in_QSV_28_0(io_in_QSV_28_0), .io_in_QSV_28_1(io_in_QSV_28_1),
    .io_in_QSV_29_0(io_in_QSV_29_0), .io_in_QSV_29_1(io_in_QSV_29_1),
    .io_in_QSV_30_0(io_in_QSV_30_0), .io_in_QSV_30_1(io_in_QSV_30_1),
    .io_in_QSV_31_0(io_in_QSV_31_0), .io_in_QSV_31_1(io_in_QSV_31_1),
    .io_in_valid(io_in_valid),
    .io_out_QSV_0_0(_m_io_out_QSV_0_0), .io_out_QSV_0_1(_m_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_io_out_QSV_1_0), .io_out_QSV_1_1(_m_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_io_out_QSV_2_0), .io_out_QSV_2_1(_m_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_io_out_QSV_3_0), .io_out_QSV_3_1(_m_io_out_QSV_3_1),
    .io_out_QSV_4_0(_m_io_out_QSV_4_0), .io_out_QSV_4_1(_m_io_out_QSV_4_1),
    .io_out_QSV_5_0(_m_io_out_QSV_5_0), .io_out_QSV_5_1(_m_io_out_QSV_5_1),
    .io_out_QSV_6_0(_m_io_out_QSV_6_0), .io_out_QSV_6_1(_m_io_out_QSV_6_1),
    .io_out_QSV_7_0(_m_io_out_QSV_7_0), .io_out_QSV_7_1(_m_io_out_QSV_7_1),
    .io_out_QSV_8_0(_m_io_out_QSV_8_0), .io_out_QSV_8_1(_m_io_out_QSV_8_1),
    .io_out_QSV_9_0(_m_io_out_QSV_9_0), .io_out_QSV_9_1(_m_io_out_QSV_9_1),
    .io_out_QSV_10_0(_m_io_out_QSV_10_0), .io_out_QSV_10_1(_m_io_out_QSV_10_1),
    .io_out_QSV_11_0(_m_io_out_QSV_11_0), .io_out_QSV_11_1(_m_io_out_QSV_11_1),
    .io_out_QSV_12_0(_m_io_out_QSV_12_0), .io_out_QSV_12_1(_m_io_out_QSV_12_1),
    .io_out_QSV_13_0(_m_io_out_QSV_13_0), .io_out_QSV_13_1(_m_io_out_QSV_13_1),
    .io_out_QSV_14_0(_m_io_out_QSV_14_0), .io_out_QSV_14_1(_m_io_out_QSV_14_1),
    .io_out_QSV_15_0(_m_io_out_QSV_15_0), .io_out_QSV_15_1(_m_io_out_QSV_15_1),
    .io_out_QSV_16_0(_m_io_out_QSV_16_0), .io_out_QSV_16_1(_m_io_out_QSV_16_1),
    .io_out_QSV_17_0(_m_io_out_QSV_17_0), .io_out_QSV_17_1(_m_io_out_QSV_17_1),
    .io_out_QSV_18_0(_m_io_out_QSV_18_0), .io_out_QSV_18_1(_m_io_out_QSV_18_1),
    .io_out_QSV_19_0(_m_io_out_QSV_19_0), .io_out_QSV_19_1(_m_io_out_QSV_19_1),
    .io_out_QSV_20_0(_m_io_out_QSV_20_0), .io_out_QSV_20_1(_m_io_out_QSV_20_1),
    .io_out_QSV_21_0(_m_io_out_QSV_21_0), .io_out_QSV_21_1(_m_io_out_QSV_21_1),
    .io_out_QSV_22_0(_m_io_out_QSV_22_0), .io_out_QSV_22_1(_m_io_out_QSV_22_1),
    .io_out_QSV_23_0(_m_io_out_QSV_23_0), .io_out_QSV_23_1(_m_io_out_QSV_23_1),
    .io_out_QSV_24_0(_m_io_out_QSV_24_0), .io_out_QSV_24_1(_m_io_out_QSV_24_1),
    .io_out_QSV_25_0(_m_io_out_QSV_25_0), .io_out_QSV_25_1(_m_io_out_QSV_25_1),
    .io_out_QSV_26_0(_m_io_out_QSV_26_0), .io_out_QSV_26_1(_m_io_out_QSV_26_1),
    .io_out_QSV_27_0(_m_io_out_QSV_27_0), .io_out_QSV_27_1(_m_io_out_QSV_27_1),
    .io_out_QSV_28_0(_m_io_out_QSV_28_0), .io_out_QSV_28_1(_m_io_out_QSV_28_1),
    .io_out_QSV_29_0(_m_io_out_QSV_29_0), .io_out_QSV_29_1(_m_io_out_QSV_29_1),
    .io_out_QSV_30_0(_m_io_out_QSV_30_0), .io_out_QSV_30_1(_m_io_out_QSV_30_1),
    .io_out_QSV_31_0(_m_io_out_QSV_31_0), .io_out_QSV_31_1(_m_io_out_QSV_31_1),
    .io_out_valid(_m_io_out_valid)
  );

  // Intermediate stages
  `CONNECT_STAGE(CompatiblePerm, m_1, _m, m_1)
  `CONNECT_STAGE(CNGate5QubitVector8bit, m_2, _m_1, m_2)
  `CONNECT_STAGE(CompatiblePerm_1, m_3, _m_2, m_3)
  `CONNECT_STAGE(CompatiblePerm_2, m_4, _m_3, m_4)
  `CONNECT_STAGE(CNGate5QubitVector8bit, m_5, _m_4, m_5)
  `CONNECT_STAGE(CompatiblePerm_3, m_6, _m_5, m_6)
  `CONNECT_STAGE(CompatiblePerm_4, m_7, _m_6, m_7)
  `CONNECT_STAGE(CNGate5QubitVector8bit, m_8, _m_7, m_8)
  `CONNECT_STAGE(CompatiblePerm_5, m_9, _m_8, m_9)
  `CONNECT_STAGE(CompatiblePerm_6, m_10, _m_9, m_10)
  `CONNECT_STAGE(CNGate5QubitVector8bit, m_11, _m_10, m_11)
  `CONNECT_STAGE(CompatiblePerm_1, m_12, _m_11, m_12)
  `CONNECT_STAGE(CompatiblePerm_4, m_13, _m_12, m_13)
  `CONNECT_STAGE(CompatiblePerm_9, m_14, _m_13, m_14)

  `undef CONNECT_STAGE

  // Stage 15: CompatiblePerm_10 (instance m_15) -> Top-Level Outputs
  CompatiblePerm_10 m_15 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_14_io_out_QSV_0_0), .io_in_QSV_0_1(_m_14_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_14_io_out_QSV_1_0), .io_in_QSV_1_1(_m_14_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_14_io_out_QSV_2_0), .io_in_QSV_2_1(_m_14_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_14_io_out_QSV_3_0), .io_in_QSV_3_1(_m_14_io_out_QSV_3_1),
    .io_in_QSV_4_0(_m_14_io_out_QSV_4_0), .io_in_QSV_4_1(_m_14_io_out_QSV_4_1),
    .io_in_QSV_5_0(_m_14_io_out_QSV_5_0), .io_in_QSV_5_1(_m_14_io_out_QSV_5_1),
    .io_in_QSV_6_0(_m_14_io_out_QSV_6_0), .io_in_QSV_6_1(_m_14_io_out_QSV_6_1),
    .io_in_QSV_7_0(_m_14_io_out_QSV_7_0), .io_in_QSV_7_1(_m_14_io_out_QSV_7_1),
    .io_in_QSV_8_0(_m_14_io_out_QSV_8_0), .io_in_QSV_8_1(_m_14_io_out_QSV_8_1),
    .io_in_QSV_9_0(_m_14_io_out_QSV_9_0), .io_in_QSV_9_1(_m_14_io_out_QSV_9_1),
    .io_in_QSV_10_0(_m_14_io_out_QSV_10_0), .io_in_QSV_10_1(_m_14_io_out_QSV_10_1),
    .io_in_QSV_11_0(_m_14_io_out_QSV_11_0), .io_in_QSV_11_1(_m_14_io_out_QSV_11_1),
    .io_in_QSV_12_0(_m_14_io_out_QSV_12_0), .io_in_QSV_12_1(_m_14_io_out_QSV_12_1),
    .io_in_QSV_13_0(_m_14_io_out_QSV_13_0), .io_in_QSV_13_1(_m_14_io_out_QSV_13_1),
    .io_in_QSV_14_0(_m_14_io_out_QSV_14_0), .io_in_QSV_14_1(_m_14_io_out_QSV_14_1),
    .io_in_QSV_15_0(_m_14_io_out_QSV_15_0), .io_in_QSV_15_1(_m_14_io_out_QSV_15_1),
    .io_in_QSV_16_0(_m_14_io_out_QSV_16_0), .io_in_QSV_16_1(_m_14_io_out_QSV_16_1),
    .io_in_QSV_17_0(_m_14_io_out_QSV_17_0), .io_in_QSV_17_1(_m_14_io_out_QSV_17_1),
    .io_in_QSV_18_0(_m_14_io_out_QSV_18_0), .io_in_QSV_18_1(_m_14_io_out_QSV_18_1),
    .io_in_QSV_19_0(_m_14_io_out_QSV_19_0), .io_in_QSV_19_1(_m_14_io_out_QSV_19_1),
    .io_in_QSV_20_0(_m_14_io_out_QSV_20_0), .io_in_QSV_20_1(_m_14_io_out_QSV_20_1),
    .io_in_QSV_21_0(_m_14_io_out_QSV_21_0), .io_in_QSV_21_1(_m_14_io_out_QSV_21_1),
    .io_in_QSV_22_0(_m_14_io_out_QSV_22_0), .io_in_QSV_22_1(_m_14_io_out_QSV_22_1),
    .io_in_QSV_23_0(_m_14_io_out_QSV_23_0), .io_in_QSV_23_1(_m_14_io_out_QSV_23_1),
    .io_in_QSV_24_0(_m_14_io_out_QSV_24_0), .io_in_QSV_24_1(_m_14_io_out_QSV_24_1),
    .io_in_QSV_25_0(_m_14_io_out_QSV_25_0), .io_in_QSV_25_1(_m_14_io_out_QSV_25_1),
    .io_in_QSV_26_0(_m_14_io_out_QSV_26_0), .io_in_QSV_26_1(_m_14_io_out_QSV_26_1),
    .io_in_QSV_27_0(_m_14_io_out_QSV_27_0), .io_in_QSV_27_1(_m_14_io_out_QSV_27_1),
    .io_in_QSV_28_0(_m_14_io_out_QSV_28_0), .io_in_QSV_28_1(_m_14_io_out_QSV_28_1),
    .io_in_QSV_29_0(_m_14_io_out_QSV_29_0), .io_in_QSV_29_1(_m_14_io_out_QSV_29_1),
    .io_in_QSV_30_0(_m_14_io_out_QSV_30_0), .io_in_QSV_30_1(_m_14_io_out_QSV_30_1),
    .io_in_QSV_31_0(_m_14_io_out_QSV_31_0), .io_in_QSV_31_1(_m_14_io_out_QSV_31_1),
    .io_in_valid(_m_14_io_out_valid),
    .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
    .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
    .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
    .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
    .io_out_QSV_4_0(io_out_QSV_4_0), .io_out_QSV_4_1(io_out_QSV_4_1),
    .io_out_QSV_5_0(io_out_QSV_5_0), .io_out_QSV_5_1(io_out_QSV_5_1),
    .io_out_QSV_6_0(io_out_QSV_6_0), .io_out_QSV_6_1(io_out_QSV_6_1),
    .io_out_QSV_7_0(io_out_QSV_7_0), .io_out_QSV_7_1(io_out_QSV_7_1),
    .io_out_QSV_8_0(io_out_QSV_8_0), .io_out_QSV_8_1(io_out_QSV_8_1),
    .io_out_QSV_9_0(io_out_QSV_9_0), .io_out_QSV_9_1(io_out_QSV_9_1),
    .io_out_QSV_10_0(io_out_QSV_10_0), .io_out_QSV_10_1(io_out_QSV_10_1),
    .io_out_QSV_11_0(io_out_QSV_11_0), .io_out_QSV_11_1(io_out_QSV_11_1),
    .io_out_QSV_12_0(io_out_QSV_12_0), .io_out_QSV_12_1(io_out_QSV_12_1),
    .io_out_QSV_13_0(io_out_QSV_13_0), .io_out_QSV_13_1(io_out_QSV_13_1),
    .io_out_QSV_14_0(io_out_QSV_14_0), .io_out_QSV_14_1(io_out_QSV_14_1),
    .io_out_QSV_15_0(io_out_QSV_15_0), .io_out_QSV_15_1(io_out_QSV_15_1),
    .io_out_QSV_16_0(io_out_QSV_16_0), .io_out_QSV_16_1(io_out_QSV_16_1),
    .io_out_QSV_17_0(io_out_QSV_17_0), .io_out_QSV_17_1(io_out_QSV_17_1),
    .io_out_QSV_18_0(io_out_QSV_18_0), .io_out_QSV_18_1(io_out_QSV_18_1),
    .io_out_QSV_19_0(io_out_QSV_19_0), .io_out_QSV_19_1(io_out_QSV_19_1),
    .io_out_QSV_20_0(io_out_QSV_20_0), .io_out_QSV_20_1(io_out_QSV_20_1),
    .io_out_QSV_21_0(io_out_QSV_21_0), .io_out_QSV_21_1(io_out_QSV_21_1),
    .io_out_QSV_22_0(io_out_QSV_22_0), .io_out_QSV_22_1(io_out_QSV_22_1),
    .io_out_QSV_23_0(io_out_QSV_23_0), .io_out_QSV_23_1(io_out_QSV_23_1),
    .io_out_QSV_24_0(io_out_QSV_24_0), .io_out_QSV_24_1(io_out_QSV_24_1),
    .io_out_QSV_25_0(io_out_QSV_25_0), .io_out_QSV_25_1(io_out_QSV_25_1),
    .io_out_QSV_26_0(io_out_QSV_26_0), .io_out_QSV_26_1(io_out_QSV_26_1),
    .io_out_QSV_27_0(io_out_QSV_27_0), .io_out_QSV_27_1(io_out_QSV_27_1),
    .io_out_QSV_28_0(io_out_QSV_28_0), .io_out_QSV_28_1(io_out_QSV_28_1),
    .io_out_QSV_29_0(io_out_QSV_29_0), .io_out_QSV_29_1(io_out_QSV_29_1),
    .io_out_QSV_30_0(io_out_QSV_30_0), .io_out_QSV_30_1(io_out_QSV_30_1),
    .io_out_QSV_31_0(io_out_QSV_31_0), .io_out_QSV_31_1(io_out_QSV_31_1),
    .io_out_valid(io_out_valid)
  );

endmodule
