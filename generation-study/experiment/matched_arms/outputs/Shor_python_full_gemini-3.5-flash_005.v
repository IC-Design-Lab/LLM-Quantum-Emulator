`define DECL_WIRES(idx) \
logic [7:0] _m_``idx``_io_out_QSV_0_0, _m_``idx``_io_out_QSV_0_1, _m_``idx``_io_out_QSV_1_0, _m_``idx``_io_out_QSV_1_1; \
logic [7:0] _m_``idx``_io_out_QSV_2_0, _m_``idx``_io_out_QSV_2_1, _m_``idx``_io_out_QSV_3_0, _m_``idx``_io_out_QSV_3_1; \
logic [7:0] _m_``idx``_io_out_QSV_4_0, _m_``idx``_io_out_QSV_4_1, _m_``idx``_io_out_QSV_5_0, _m_``idx``_io_out_QSV_5_1; \
logic [7:0] _m_``idx``_io_out_QSV_6_0, _m_``idx``_io_out_QSV_6_1, _m_``idx``_io_out_QSV_7_0, _m_``idx``_io_out_QSV_7_1; \
logic [7:0] _m_``idx``_io_out_QSV_8_0, _m_``idx``_io_out_QSV_8_1, _m_``idx``_io_out_QSV_9_0, _m_``idx``_io_out_QSV_9_1; \
logic [7:0] _m_``idx``_io_out_QSV_10_0, _m_``idx``_io_out_QSV_10_1, _m_``idx``_io_out_QSV_11_0, _m_``idx``_io_out_QSV_11_1; \
logic [7:0] _m_``idx``_io_out_QSV_12_0, _m_``idx``_io_out_QSV_12_1, _m_``idx``_io_out_QSV_13_0, _m_``idx``_io_out_QSV_13_1; \
logic [7:0] _m_``idx``_io_out_QSV_14_0, _m_``idx``_io_out_QSV_14_1, _m_``idx``_io_out_QSV_15_0, _m_``idx``_io_out_QSV_15_1; \
logic [7:0] _m_``idx``_io_out_QSV_16_0, _m_``idx``_io_out_QSV_16_1, _m_``idx``_io_out_QSV_17_0, _m_``idx``_io_out_QSV_17_1; \
logic [7:0] _m_``idx``_io_out_QSV_18_0, _m_``idx``_io_out_QSV_18_1, _m_``idx``_io_out_QSV_19_0, _m_``idx``_io_out_QSV_19_1; \
logic [7:0] _m_``idx``_io_out_QSV_20_0, _m_``idx``_io_out_QSV_20_1, _m_``idx``_io_out_QSV_21_0, _m_``idx``_io_out_QSV_21_1; \
logic [7:0] _m_``idx``_io_out_QSV_22_0, _m_``idx``_io_out_QSV_22_1, _m_``idx``_io_out_QSV_23_0, _m_``idx``_io_out_QSV_23_1; \
logic [7:0] _m_``idx``_io_out_QSV_24_0, _m_``idx``_io_out_QSV_24_1, _m_``idx``_io_out_QSV_25_0, _m_``idx``_io_out_QSV_25_1; \
logic [7:0] _m_``idx``_io_out_QSV_26_0, _m_``idx``_io_out_QSV_26_1, _m_``idx``_io_out_QSV_27_0, _m_``idx``_io_out_QSV_27_1; \
logic [7:0] _m_``idx``_io_out_QSV_28_0, _m_``idx``_io_out_QSV_28_1, _m_``idx``_io_out_QSV_29_0, _m_``idx``_io_out_QSV_29_1; \
logic [7:0] _m_``idx``_io_out_QSV_30_0, _m_``idx``_io_out_QSV_30_1, _m_``idx``_io_out_QSV_31_0, _m_``idx``_io_out_QSV_31_1; \
logic _m_``idx``_io_out_valid;

`define CONNECT_PORTS(in_prefix, out_prefix, in_v, out_v) \
    .io_in_QSV_0_0(in_prefix``0_0), .io_in_QSV_0_1(in_prefix``0_1), \
    .io_in_QSV_1_0(in_prefix``1_0), .io_in_QSV_1_1(in_prefix``1_1), \
    .io_in_QSV_2_0(in_prefix``2_0), .io_in_QSV_2_1(in_prefix``2_1), \
    .io_in_QSV_3_0(in_prefix``3_0), .io_in_QSV_3_1(in_prefix``3_1), \
    .io_in_QSV_4_0(in_prefix``4_0), .io_in_QSV_4_1(in_prefix``4_1), \
    .io_in_QSV_5_0(in_prefix``5_0), .io_in_QSV_5_1(in_prefix``5_1), \
    .io_in_QSV_6_0(in_prefix``6_0), .io_in_QSV_6_1(in_prefix``6_1), \
    .io_in_QSV_7_0(in_prefix``7_0), .io_in_QSV_7_1(in_prefix``7_1), \
    .io_in_QSV_8_0(in_prefix``8_0), .io_in_QSV_8_1(in_prefix``8_1), \
    .io_in_QSV_9_0(in_prefix``9_0), .io_in_QSV_9_1(in_prefix``9_1), \
    .io_in_QSV_10_0(in_prefix``10_0), .io_in_QSV_10_1(in_prefix``10_1), \
    .io_in_QSV_11_0(in_prefix``11_0), .io_in_QSV_11_1(in_prefix``11_1), \
    .io_in_QSV_12_0(in_prefix``12_0), .io_in_QSV_12_1(in_prefix``12_1), \
    .io_in_QSV_13_0(in_prefix``13_0), .io_in_QSV_13_1(in_prefix``13_1), \
    .io_in_QSV_14_0(in_prefix``14_0), .io_in_QSV_14_1(in_prefix``14_1), \
    .io_in_QSV_15_0(in_prefix``15_0), .io_in_QSV_15_1(in_prefix``15_1), \
    .io_in_QSV_16_0(in_prefix``16_0), .io_in_QSV_16_1(in_prefix``16_1), \
    .io_in_QSV_17_0(in_prefix``17_0), .io_in_QSV_17_1(in_prefix``17_1), \
    .io_in_QSV_18_0(in_prefix``18_0), .io_in_QSV_18_1(in_prefix``18_1), \
    .io_in_QSV_19_0(in_prefix``19_0), .io_in_QSV_19_1(in_prefix``19_1), \
    .io_in_QSV_20_0(in_prefix``20_0), .io_in_QSV_20_1(in_prefix``20_1), \
    .io_in_QSV_21_0(in_prefix``21_0), .io_in_QSV_21_1(in_prefix``21_1), \
    .io_in_QSV_22_0(in_prefix``22_0), .io_in_QSV_22_1(in_prefix``22_1), \
    .io_in_QSV_23_0(in_prefix``23_0), .io_in_QSV_23_1(in_prefix``23_1), \
    .io_in_QSV_24_0(in_prefix``24_0), .io_in_QSV_24_1(in_prefix``24_1), \
    .io_in_QSV_25_0(in_prefix``25_0), .io_in_QSV_25_1(in_prefix``25_1), \
    .io_in_QSV_26_0(in_prefix``26_0), .io_in_QSV_26_1(in_prefix``26_1), \
    .io_in_QSV_27_0(in_prefix``27_0), .io_in_QSV_27_1(in_prefix``27_1), \
    .io_in_QSV_28_0(in_prefix``28_0), .io_in_QSV_28_1(in_prefix``28_1), \
    .io_in_QSV_29_0(in_prefix``29_0), .io_in_QSV_29_1(in_prefix``29_1), \
    .io_in_QSV_30_0(in_prefix``30_0), .io_in_QSV_30_1(in_prefix``30_1), \
    .io_in_QSV_31_0(in_prefix``31_0), .io_in_QSV_31_1(in_prefix``31_1), \
    .io_in_valid(in_v), \
    .io_out_QSV_0_0(out_prefix``0_0), .io_out_QSV_0_1(out_prefix``0_1), \
    .io_out_QSV_1_0(out_prefix``1_0), .io_out_QSV_1_1(out_prefix``1_1), \
    .io_out_QSV_2_0(out_prefix``2_0), .io_out_QSV_2_1(out_prefix``2_1), \
    .io_out_QSV_3_0(out_prefix``3_0), .io_out_QSV_3_1(out_prefix``3_1), \
    .io_out_QSV_4_0(out_prefix``4_0), .io_out_QSV_4_1(out_prefix``4_1), \
    .io_out_QSV_5_0(out_prefix``5_0), .io_out_QSV_5_1(out_prefix``5_1), \
    .io_out_QSV_6_0(out_prefix``6_0), .io_out_QSV_6_1(out_prefix``6_1), \
    .io_out_QSV_7_0(out_prefix``7_0), .io_out_QSV_7_1(out_prefix``7_1), \
    .io_out_QSV_8_0(out_prefix``8_0), .io_out_QSV_8_1(out_prefix``8_1), \
    .io_out_QSV_9_0(out_prefix``9_0), .io_out_QSV_9_1(out_prefix``9_1), \
    .io_out_QSV_10_0(out_prefix``10_0), .io_out_QSV_10_1(out_prefix``10_1), \
    .io_out_QSV_11_0(out_prefix``11_0), .io_out_QSV_11_1(out_prefix``11_1), \
    .io_out_QSV_12_0(out_prefix``12_0), .io_out_QSV_12_1(out_prefix``12_1), \
    .io_out_QSV_13_0(out_prefix``13_0), .io_out_QSV_13_1(out_prefix``13_1), \
    .io_out_QSV_14_0(out_prefix``14_0), .io_out_QSV_14_1(out_prefix``14_1), \
    .io_out_QSV_15_0(out_prefix``15_0), .io_out_QSV_15_1(out_prefix``15_1), \
    .io_out_QSV_16_0(out_prefix``16_0), .io_out_QSV_16_1(out_prefix``16_1), \
    .io_out_QSV_17_0(out_prefix``17_0), .io_out_QSV_17_1(out_prefix``17_1), \
    .io_out_QSV_18_0(out_prefix``18_0), .io_out_QSV_18_1(out_prefix``18_1), \
    .io_out_QSV_19_0(out_prefix``19_0), .io_out_QSV_19_1(out_prefix``19_1), \
    .io_out_QSV_20_0(out_prefix``20_0), .io_out_QSV_20_1(out_prefix``20_1), \
    .io_out_QSV_21_0(out_prefix``21_0), .io_out_QSV_21_1(out_prefix``21_1), \
    .io_out_QSV_22_0(out_prefix``22_0), .io_out_QSV_22_1(out_prefix``22_1), \
    .io_out_QSV_23_0(out_prefix``23_0), .io_out_QSV_23_1(out_prefix``23_1), \
    .io_out_QSV_24_0(out_prefix``24_0), .io_out_QSV_24_1(out_prefix``24_1), \
    .io_out_QSV_25_0(out_prefix``25_0), .io_out_QSV_25_1(out_prefix``25_1), \
    .io_out_QSV_26_0(out_prefix``26_0), .io_out_QSV_26_1(out_prefix``26_1), \
    .io_out_QSV_27_0(out_prefix``27_0), .io_out_QSV_27_1(out_prefix``27_1), \
    .io_out_QSV_28_0(out_prefix``28_0), .io_out_QSV_28_1(out_prefix``28_1), \
    .io_out_QSV_29_0(out_prefix``29_0), .io_out_QSV_29_1(out_prefix``29_1), \
    .io_out_QSV_30_0(out_prefix``30_0), .io_out_QSV_30_1(out_prefix``30_1), \
    .io_out_QSV_31_0(out_prefix``31_0), .io_out_QSV_31_1(out_prefix``31_1), \
    .io_out_valid(out_v)

module Shor (
    input  logic clock,
    input  logic reset,
    
    // Input state vector (32 amplitudes, 8-bit real/imaginary)
    input  logic [7:0] io_in_QSV_0_0,   input  logic [7:0] io_in_QSV_0_1,
    input  logic [7:0] io_in_QSV_1_0,   input  logic [7:0] io_in_QSV_1_1,
    input  logic [7:0] io_in_QSV_2_0,   input  logic [7:0] io_in_QSV_2_1,
    input  logic [7:0] io_in_QSV_3_0,   input  logic [7:0] io_in_QSV_3_1,
    input  logic [7:0] io_in_QSV_4_0,   input  logic [7:0] io_in_QSV_4_1,
    input  logic [7:0] io_in_QSV_5_0,   input  logic [7:0] io_in_QSV_5_1,
    input  logic [7:0] io_in_QSV_6_0,   input  logic [7:0] io_in_QSV_6_1,
    input  logic [7:0] io_in_QSV_7_0,   input  logic [7:0] io_in_QSV_7_1,
    input  logic [7:0] io_in_QSV_8_0,   input  logic [7:0] io_in_QSV_8_1,
    input  logic [7:0] io_in_QSV_9_0,   input  logic [7:0] io_in_QSV_9_1,
    input  logic [7:0] io_in_QSV_10_0,  input  logic [7:0] io_in_QSV_10_1,
    input  logic [7:0] io_in_QSV_11_0,  input  logic [7:0] io_in_QSV_11_1,
    input  logic [7:0] io_in_QSV_12_0,  input  logic [7:0] io_in_QSV_12_1,
    input  logic [7:0] io_in_QSV_13_0,  input  logic [7:0] io_in_QSV_13_1,
    input  logic [7:0] io_in_QSV_14_0,  input  logic [7:0] io_in_QSV_14_1,
    input  logic [7:0] io_in_QSV_15_0,  input  logic [7:0] io_in_QSV_15_1,
    input  logic [7:0] io_in_QSV_16_0,  input  logic [7:0] io_in_QSV_16_1,
    input  logic [7:0] io_in_QSV_17_0,  input  logic [7:0] io_in_QSV_17_1,
    input  logic [7:0] io_in_QSV_18_0,  input  logic [7:0] io_in_QSV_18_1,
    input  logic [7:0] io_in_QSV_19_0,  input  logic [7:0] io_in_QSV_19_1,
    input  logic [7:0] io_in_QSV_20_0,  input  logic [7:0] io_in_QSV_20_1,
    input  logic [7:0] io_in_QSV_21_0,  input  logic [7:0] io_in_QSV_21_1,
    input  logic [7:0] io_in_QSV_22_0,  input  logic [7:0] io_in_QSV_22_1,
    input  logic [7:0] io_in_QSV_23_0,  input  logic [7:0] io_in_QSV_23_1,
    input  logic [7:0] io_in_QSV_24_0,  input  logic [7:0] io_in_QSV_24_1,
    input  logic [7:0] io_in_QSV_25_0,  input  logic [7:0] io_in_QSV_25_1,
    input  logic [7:0] io_in_QSV_26_0,  input  logic [7:0] io_in_QSV_26_1,
    input  logic [7:0] io_in_QSV_27_0,  input  logic [7:0] io_in_QSV_27_1,
    input  logic [7:0] io_in_QSV_28_0,  input  logic [7:0] io_in_QSV_28_1,
    input  logic [7:0] io_in_QSV_29_0,  input  logic [7:0] io_in_QSV_29_1,
    input  logic [7:0] io_in_QSV_30_0,  input  logic [7:0] io_in_QSV_30_1,
    input  logic [7:0] io_in_QSV_31_0,  input  logic [7:0] io_in_QSV_31_1,
    input  logic io_in_valid,

    // Output state vector (32 amplitudes, 8-bit real/imaginary)
    output logic [7:0] io_out_QSV_0_0,  output logic [7:0] io_out_QSV_0_1,
    output logic [7:0] io_out_QSV_1_0,  output logic [7:0] io_out_QSV_1_1,
    output logic [7:0] io_out_QSV_2_0,  output logic [7:0] io_out_QSV_2_1,
    output logic [7:0] io_out_QSV_3_0,  output logic [7:0] io_out_QSV_3_1,
    output logic [7:0] io_out_QSV_4_0,  output logic [7:0] io_out_QSV_4_1,
    output logic [7:0] io_out_QSV_5_0,  output logic [7:0] io_out_QSV_5_1,
    output logic [7:0] io_out_QSV_6_0,  output logic [7:0] io_out_QSV_6_1,
    output logic [7:0] io_out_QSV_7_0,  output logic [7:0] io_out_QSV_7_1,
    output logic [7:0] io_out_QSV_8_0,  output logic [7:0] io_out_QSV_8_1,
    output logic [7:0] io_out_QSV_9_0,  output logic [7:0] io_out_QSV_9_1,
    output logic [7:0] io_out_QSV_10_0, output logic [7:0] io_out_QSV_10_1,
    output logic [7:0] io_out_QSV_11_0, output logic [7:0] io_out_QSV_11_1,
    output logic [7:0] io_out_QSV_12_0, output logic [7:0] io_out_QSV_12_1,
    output logic [7:0] io_out_QSV_13_0, output logic [7:0] io_out_QSV_13_1,
    output logic [7:0] io_out_QSV_14_0, output logic [7:0] io_out_QSV_14_1,
    output logic [7:0] io_out_QSV_15_0, output logic [7:0] io_out_QSV_15_1,
    output logic [7:0] io_out_QSV_16_0, output logic [7:0] io_out_QSV_16_1,
    output logic [7:0] io_out_QSV_17_0, output logic [7:0] io_out_QSV_17_1,
    output logic [7:0] io_out_QSV_18_0, output logic [7:0] io_out_QSV_18_1,
    output logic [7:0] io_out_QSV_19_0, output logic [7:0] io_out_QSV_19_1,
    output logic [7:0] io_out_QSV_20_0, output logic [7:0] io_out_QSV_20_1,
    output logic [7:0] io_out_QSV_21_0, output logic [7:0] io_out_QSV_21_1,
    output logic [7:0] io_out_QSV_22_0, output logic [7:0] io_out_QSV_22_1,
    output logic [7:0] io_out_QSV_23_0, output logic [7:0] io_out_QSV_23_1,
    output logic [7:0] io_out_QSV_24_0, output logic [7:0] io_out_QSV_24_1,
    output logic [7:0] io_out_QSV_25_0, output logic [7:0] io_out_QSV_25_1,
    output logic [7:0] io_out_QSV_26_0, output logic [7:0] io_out_QSV_26_1,
    output logic [7:0] io_out_QSV_27_0, output logic [7:0] io_out_QSV_27_1,
    output logic [7:0] io_out_QSV_28_0, output logic [7:0] io_out_QSV_28_1,
    output logic [7:0] io_out_QSV_29_0, output logic [7:0] io_out_QSV_29_1,
    output logic [7:0] io_out_QSV_30_0, output logic [7:0] io_out_QSV_30_1,
    output logic [7:0] io_out_QSV_31_0, output logic [7:0] io_out_QSV_31_1,
    output logic io_out_valid
);

    // Stage 0 (m) intermediate wire declarations
    logic [7:0] _m_io_out_QSV_0_0, _m_io_out_QSV_0_1, _m_io_out_QSV_1_0, _m_io_out_QSV_1_1;
    logic [7:0] _m_io_out_QSV_2_0, _m_io_out_QSV_2_1, _m_io_out_QSV_3_0, _m_io_out_QSV_3_1;
    logic [7:0] _m_io_out_QSV_4_0, _m_io_out_QSV_4_1, _m_io_out_QSV_5_0, _m_io_out_QSV_5_1;
    logic [7:0] _m_io_out_QSV_6_0, _m_io_out_QSV_6_1, _m_io_out_QSV_7_0, _m_io_out_QSV_7_1;
    logic [7:0] _m_io_out_QSV_8_0, _m_io_out_QSV_8_1, _m_io_out_QSV_9_0, _m_io_out_QSV_9_1;
    logic [7:0] _m_io_out_QSV_10_0, _m_io_out_QSV_10_1, _m_io_out_QSV_11_0, _m_io_out_QSV_11_1;
    logic [7:0] _m_io_out_QSV_12_0, _m_io_out_QSV_12_1, _m_io_out_QSV_13_0, _m_io_out_QSV_13_1;
    logic [7:0] _m_io_out_QSV_14_0, _m_io_out_QSV_14_1, _m_io_out_QSV_15_0, _m_io_out_QSV_15_1;
    logic [7:0] _m_io_out_QSV_16_0, _m_io_out_QSV_16_1, _m_io_out_QSV_17_0, _m_io_out_QSV_17_1;
    logic [7:0] _m_io_out_QSV_18_0, _m_io_out_QSV_18_1, _m_io_out_QSV_19_0, _m_io_out_QSV_19_1;
    logic [7:0] _m_io_out_QSV_20_0, _m_io_out_QSV_20_1, _m_io_out_QSV_21_0, _m_io_out_QSV_21_1;
    logic [7:0] _m_io_out_QSV_22_0, _m_io_out_QSV_22_1, _m_io_out_QSV_23_0, _m_io_out_QSV_23_1;
    logic [7:0] _m_io_out_QSV_24_0, _m_io_out_QSV_24_1, _m_io_out_QSV_25_0, _m_io_out_QSV_25_1;
    logic [7:0] _m_io_out_QSV_26_0, _m_io_out_QSV_26_1, _m_io_out_QSV_27_0, _m_io_out_QSV_27_1;
    logic [7:0] _m_io_out_QSV_28_0, _m_io_out_QSV_28_1, _m_io_out_QSV_29_0, _m_io_out_QSV_29_1;
    logic [7:0] _m_io_out_QSV_30_0, _m_io_out_QSV_30_1, _m_io_out_QSV_31_0, _m_io_out_QSV_31_1;
    logic _m_io_out_valid;

    // Intermediate wire declarations for stage 1 to 14
    `DECL_WIRES(1)
    `DECL_WIRES(2)
    `DECL_WIRES(3)
    `DECL_WIRES(4)
    `DECL_WIRES(5)
    `DECL_WIRES(6)
    `DECL_WIRES(7)
    `DECL_WIRES(8)
    `DECL_WIRES(9)
    `DECL_WIRES(10)
    `DECL_WIRES(11)
    `DECL_WIRES(12)
    `DECL_WIRES(13)
    `DECL_WIRES(14)

    // Pipeline Stage 0: H on Q0
    HGate5QubitVector8bit m (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(io_in_QSV_, _m_io_out_QSV_, io_in_valid, _m_io_out_valid)
    );

    // Pipeline Stage 1: Permutation
    CompatiblePerm m_1 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_io_out_QSV_, _m_1_io_out_QSV_, _m_io_out_valid, _m_1_io_out_valid)
    );

    // Pipeline Stage 2: CX(0, 1)
    CNGate5QubitVector8bit m_2 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_1_io_out_QSV_, _m_2_io_out_QSV_, _m_1_io_out_valid, _m_2_io_out_valid)
    );

    // Pipeline Stage 3: Permutation
    CompatiblePerm_1 m_3 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_2_io_out_QSV_, _m_3_io_out_QSV_, _m_2_io_out_valid, _m_3_io_out_valid)
    );

    // Pipeline Stage 4: Permutation
    CompatiblePerm_2 m_4 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_3_io_out_QSV_, _m_4_io_out_QSV_, _m_3_io_out_valid, _m_4_io_out_valid)
    );

    // Pipeline Stage 5: CX(1, 2)
    CNGate5QubitVector8bit m_5 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_4_io_out_QSV_, _m_5_io_out_QSV_, _m_4_io_out_valid, _m_5_io_out_valid)
    );

    // Pipeline Stage 6: Permutation
    CompatiblePerm_3 m_6 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_5_io_out_QSV_, _m_6_io_out_QSV_, _m_5_io_out_valid, _m_6_io_out_valid)
    );

    // Pipeline Stage 7: Permutation
    CompatiblePerm_4 m_7 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_6_io_out_QSV_, _m_7_io_out_QSV_, _m_6_io_out_valid, _m_7_io_out_valid)
    );

    // Pipeline Stage 8: CX(2, 3)
    CNGate5QubitVector8bit m_8 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_7_io_out_QSV_, _m_8_io_out_QSV_, _m_7_io_out_valid, _m_8_io_out_valid)
    );

    // Pipeline Stage 9: Permutation
    CompatiblePerm_5 m_9 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_8_io_out_QSV_, _m_9_io_out_QSV_, _m_8_io_out_valid, _m_9_io_out_valid)
    );

    // Pipeline Stage 10: Permutation
    CompatiblePerm_6 m_10 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_9_io_out_QSV_, _m_10_io_out_QSV_, _m_9_io_out_valid, _m_10_io_out_valid)
    );

    // Pipeline Stage 11: CX(3, 4)
    CNGate5QubitVector8bit m_11 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_10_io_out_QSV_, _m_11_io_out_QSV_, _m_10_io_out_valid, _m_11_io_out_valid)
    );

    // Pipeline Stage 12: Permutation
    CompatiblePerm_1 m_12 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_11_io_out_QSV_, _m_12_io_out_QSV_, _m_11_io_out_valid, _m_12_io_out_valid)
    );

    // Pipeline Stage 13: Permutation
    CompatiblePerm_4 m_13 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_12_io_out_QSV_, _m_13_io_out_QSV_, _m_12_io_out_valid, _m_13_io_out_valid)
    );

    // Pipeline Stage 14: Permutation
    CompatiblePerm_9 m_14 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_13_io_out_QSV_, _m_14_io_out_QSV_, _m_13_io_out_valid, _m_14_io_out_valid)
    );

    // Pipeline Stage 15: Permutation
    CompatiblePerm_10 m_15 (
        .clock(clock),
        .reset(reset),
        `CONNECT_PORTS(_m_14_io_out_QSV_, io_out_QSV_, _m_14_io_out_valid, io_out_valid)
    );

endmodule

`undef DECL_WIRES
`undef CONNECT_PORTS
