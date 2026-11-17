module Shor (
    input clock,
    input reset,
    input [7:0] io_in_QSV_0_0, io_in_QSV_0_1, io_in_QSV_1_0, io_in_QSV_1_1,
    input [7:0] io_in_QSV_2_0, io_in_QSV_2_1, io_in_QSV_3_0, io_in_QSV_3_1,
    input [7:0] io_in_QSV_4_0, io_in_QSV_4_1, io_in_QSV_5_0, io_in_QSV_5_1,
    input [7:0] io_in_QSV_6_0, io_in_QSV_6_1, io_in_QSV_7_0, io_in_QSV_7_1,
    input [7:0] io_in_QSV_8_0, io_in_QSV_8_1, io_in_QSV_9_0, io_in_QSV_9_1,
    input [7:0] io_in_QSV_10_0, io_in_QSV_10_1, io_in_QSV_11_0, io_in_QSV_11_1,
    input [7:0] io_in_QSV_12_0, io_in_QSV_12_1, io_in_QSV_13_0, io_in_QSV_13_1,
    input [7:0] io_in_QSV_14_0, io_in_QSV_14_1, io_in_QSV_15_0, io_in_QSV_15_1,
    input [7:0] io_in_QSV_16_0, io_in_QSV_16_1, io_in_QSV_17_0, io_in_QSV_17_1,
    input [7:0] io_in_QSV_18_0, io_in_QSV_18_1, io_in_QSV_19_0, io_in_QSV_19_1,
    input [7:0] io_in_QSV_20_0, io_in_QSV_20_1, io_in_QSV_21_0, io_in_QSV_21_1,
    input [7:0] io_in_QSV_22_0, io_in_QSV_22_1, io_in_QSV_23_0, io_in_QSV_23_1,
    input [7:0] io_in_QSV_24_0, io_in_QSV_24_1, io_in_QSV_25_0, io_in_QSV_25_1,
    input [7:0] io_in_QSV_26_0, io_in_QSV_26_1, io_in_QSV_27_0, io_in_QSV_27_1,
    input [7:0] io_in_QSV_28_0, io_in_QSV_28_1, io_in_QSV_29_0, io_in_QSV_29_1,
    input [7:0] io_in_QSV_30_0, io_in_QSV_30_1, io_in_QSV_31_0, io_in_QSV_31_1,
    input io_in_valid,
    output [7:0] io_out_QSV_0_0, io_out_QSV_0_1, io_out_QSV_1_0, io_out_QSV_1_1,
    output [7:0] io_out_QSV_2_0, io_out_QSV_2_1, io_out_QSV_3_0, io_out_QSV_3_1,
    output [7:0] io_out_QSV_4_0, io_out_QSV_4_1, io_out_QSV_5_0, io_out_QSV_5_1,
    output [7:0] io_out_QSV_6_0, io_out_QSV_6_1, io_out_QSV_7_0, io_out_QSV_7_1,
    output [7:0] io_out_QSV_8_0, io_out_QSV_8_1, io_out_QSV_9_0, io_out_QSV_9_1,
    output [7:0] io_out_QSV_10_0, io_out_QSV_10_1, io_out_QSV_11_0, io_out_QSV_11_1,
    output [7:0] io_out_QSV_12_0, io_out_QSV_12_1, io_out_QSV_13_0, io_out_QSV_13_1,
    output [7:0] io_out_QSV_14_0, io_out_QSV_14_1, io_out_QSV_15_0, io_out_QSV_15_1,
    output [7:0] io_out_QSV_16_0, io_out_QSV_16_1, io_out_QSV_17_0, io_out_QSV_17_1,
    output [7:0] io_out_QSV_18_0, io_out_QSV_18_1, io_out_QSV_19_0, io_out_QSV_19_1,
    output [7:0] io_out_QSV_20_0, io_out_QSV_20_1, io_out_QSV_21_0, io_out_QSV_21_1,
    output [7:0] io_out_QSV_22_0, io_out_QSV_22_1, io_out_QSV_23_0, io_out_QSV_23_1,
    output [7:0] io_out_QSV_24_0, io_out_QSV_24_1, io_out_QSV_25_0, io_out_QSV_25_1,
    output [7:0] io_out_QSV_26_0, io_out_QSV_26_1, io_out_QSV_27_0, io_out_QSV_27_1,
    output [7:0] io_out_QSV_28_0, io_out_QSV_28_1, io_out_QSV_29_0, io_out_QSV_29_1,
    output [7:0] io_out_QSV_30_0, io_out_QSV_30_1, io_out_QSV_31_0, io_out_QSV_31_1,
    output io_out_valid
);

`include "Shor_wires.vh"

HGate5QubitVector8bit m (.clock(clock), .reset(reset), .io_in_valid(io_in_valid),
    .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1), ... .io_out_valid(v0),
    .io_out_QSV_0_0(o0_0_0), ...);
CompatiblePerm m_1 (.clock(clock), .reset(reset), .io_in_valid(v0),
    .io_in_QSV_0_0(o0_0_0), ... .io_out_valid(v1), .io_out_QSV_0_0(o1_0_0), ...);
CNGate5QubitVector8bit m_2 (.clock(clock), .reset(reset), .io_in_valid(v1),
    .io_in_QSV_0_0(o1_0_0), ... .io_out_valid(v2), .io_out_QSV_0_0(o2_0_0), ...);
CompatiblePerm_1 m_3 (.clock(clock), .reset(reset), .io_in_valid(v2),
    .io_in_QSV_0_0(o2_0_0), ... .io_out_valid(v3), .io_out_QSV_0_0(o3_0_0), ...);
CompatiblePerm_2 m_4 (.clock(clock), .reset(reset), .io_in_valid(v3),
    .io_in_QSV_0_0(o3_0_0), ... .io_out_valid(v4), .io_out_QSV_0_0(o4_0_0), ...);
CNGate5QubitVector8bit m_5 (.clock(clock), .reset(reset), .io_in_valid(v4),
    .io_in_QSV_0_0(o4_0_0), ... .io_out_valid(v5), .io_out_QSV_0_0(o5_0_0), ...);
CompatiblePerm_3 m_6 (.clock(clock), .reset(reset), .io_in_valid(v5),
    .io_in_QSV_0_0(o5_0_0), ... .io_out_valid(v6), .io_out_QSV_0_0(o6_0_0), ...);
CompatiblePerm_4 m_7 (.clock(clock), .reset(reset), .io_in_valid(v6),
    .io_in_QSV_0_0(o6_0_0), ... .io_out_valid(v7), .io_out_QSV_0_0(o7_0_0), ...);
CNGate5QubitVector8bit m_8 (.clock(clock), .reset(reset), .io_in_valid(v7),
    .io_in_QSV_0_0(o7_0_0), ... .io_out_valid(v8), .io_out_QSV_0_0(o8_0_0), ...);
CompatiblePerm_5 m_9 (.clock(clock), .reset(reset), .io_in_valid(v8),
    .io_in_QSV_0_0(o8_0_0), ... .io_out_valid(v9), .io_out_QSV_0_0(o9_0_0), ...);
CompatiblePerm_6 m_10 (.clock(clock), .reset(reset), .io_in_valid(v9),
    .io_in_QSV_0_0(o9_0_0), ... .io_out_valid(v10), .io_out_QSV_0_0(o10_0_0), ...);
CNGate5QubitVector8bit m_11 (.clock(clock), .reset(reset), .io_in_valid(v10),
    .io_in_QSV_0_0(o10_0_0), ... .io_out_valid(v11), .io_out_QSV_0_0(o11_0_0), ...);
CompatiblePerm_1 m_12 (.clock(clock), .reset(reset), .io_in_valid(v11),
    .io_in_QSV_0_0(o11_0_0), ... .io_out_valid(v12), .io_out_QSV_0_0(o12_0_0), ...);
CompatiblePerm_4 m_13 (.clock(clock), .reset(reset), .io_in_valid(v12),
    .io_in_QSV_0_0(o12_0_0), ... .io_out_valid(v13), .io_out_QSV_0_0(o13_0_0), ...);
CompatiblePerm_9 m_14 (.clock(clock), .reset(reset), .io_in_valid(v13),
    .io_in_QSV_0_0(o13_0_0), ... .io_out_valid(v14), .io_out_QSV_0_0(o14_0_0), ...);
CompatiblePerm_10 m_15 (.clock(clock), .reset(reset), .io_in_valid(v14),
    .io_in_QSV_0_0(o14_0_0), ... .io_out_valid(io_out_valid),
    .io_out_QSV_0_0(io_out_QSV_0_0), ... .io_out_QSV_31_1(io_out_QSV_31_1));

endmodule
