module QFT (
    input clock,
    input reset,
    input [7:0] io_in_QSV_0_0, io_in_QSV_0_1, io_in_QSV_1_0, io_in_QSV_1_1,
    input [7:0] io_in_QSV_2_0, io_in_QSV_2_1, io_in_QSV_3_0, io_in_QSV_3_1,
    input [7:0] io_in_QSV_4_0, io_in_QSV_4_1, io_in_QSV_5_0, io_in_QSV_5_1,
    input [7:0] io_in_QSV_6_0, io_in_QSV_6_1, io_in_QSV_7_0, io_in_QSV_7_1,
    input io_in_valid,
    output [7:0] io_out_QSV_0_0, io_out_QSV_0_1, io_out_QSV_1_0, io_out_QSV_1_1,
    output [7:0] io_out_QSV_2_0, io_out_QSV_2_1, io_out_QSV_3_0, io_out_QSV_3_1,
    output [7:0] io_out_QSV_4_0, io_out_QSV_4_1, io_out_QSV_5_0, io_out_QSV_5_1,
    output [7:0] io_out_QSV_6_0, io_out_QSV_6_1, io_out_QSV_7_0, io_out_QSV_7_1,
    output io_out_valid
);

wire [7:0] s0_0, s0_1, s1_0, s1_1, s2_0, s2_1, s3_0, s3_1, s4_0, s4_1, s5_0, s5_1, s6_0, s6_1, s7_0, s7_1;
wire v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12;

HGate3QubitVector8bit m (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1), .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
    .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1), .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
    .io_in_QSV_4_0(io_in_QSV_4_0), .io_in_QSV_4_1(io_in_QSV_4_1), .io_in_QSV_5_0(io_in_QSV_5_0), .io_in_QSV_5_1(io_in_QSV_5_1),
    .io_in_QSV_6_0(io_in_QSV_6_0), .io_in_QSV_6_1(io_in_QSV_6_1), .io_in_QSV_7_0(io_in_QSV_7_0), .io_in_QSV_7_1(io_in_QSV_7_1),
    .io_in_valid(io_in_valid),
    .io_out_QSV_0_0(s0_0), .io_out_QSV_0_1(s0_1), .io_out_QSV_1_0(s1_0), .io_out_QSV_1_1(s1_1),
    .io_out_QSV_2_0(s2_0), .io_out_QSV_2_1(s2_1), .io_out_QSV_3_0(s3_0), .io_out_QSV_3_1(s3_1),
    .io_out_QSV_4_0(s4_0), .io_out_QSV_4_1(s4_1), .io_out_QSV_5_0(s5_0), .io_out_QSV_5_1(s5_1),
    .io_out_QSV_6_0(s6_0), .io_out_QSV_6_1(s6_1), .io_out_QSV_7_0(s7_0), .io_out_QSV_7_1(s7_1),
    .io_out_valid(v0)
);

CSGate3QubitVector8bit m_1 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(s0_0), .io_in_QSV_0_1(s0_1), .io_in_QSV_1_0(s1_0), .io_in_QSV_1_1(s1_1),
    .io_in_QSV_2_0(s2_0), .io_in_QSV_2_1(s2_1), .io_in_QSV_3_0(s3_0), .io_in_QSV_4_0(s4_0),
    .io_in_QSV_4_1(s4_1), .io_in_QSV_5_0(s5_0), .io_in_QSV_5_1(s5_1), .io_in_QSV_6_0(s6_0),
    .io_in_QSV_6_1(s6_1), .io_in_QSV_7_0(s7_0), .io_in_valid(v0),
    .io_out_QSV_0_0(s0_0), .io_out_QSV_0_1(s0_1), .io_out_QSV_1_0(s1_0), .io_out_QSV_1_1(s1_1),
    .io_out_QSV_2_0(s2_0), .io_out_QSV_2_1(s2_1), .io_out_QSV_3_0(s3_0), .io_out_QSV_3_1(s3_1),
    .io_out_QSV_4_0(s4_0), .io_out_QSV_4_1(s4_1), .io_out_QSV_5_0(s5_0), .io_out_QSV_5_1(s5_1),
    .io_out_QSV_6_0(s6_0), .io_out_QSV_6_1(s6_1), .io_out_QSV_7_0(s7_0), .io_out_QSV_7_1(s7_1),
    .io_out_valid(v1)
);

CompatiblePerm m_2 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(s0_0), .io_in_QSV_0_1(s0_1), .io_in_QSV_1_0(s1_0), .io_in_QSV_1_1(s1_1),
    .io_in_QSV_2_0(s2_0), .io_in_QSV_2_1(s2_1), .io_in_QSV_3_0(s3_0), .io_in_QSV_3_1(s3_1),
    .io_in_QSV_4_0(s4_0), .io_in_QSV_4_1(s4_1), .io_in_QSV_5_0(s5_0), .io_in_QSV_5_1(s5_1),
    .io_in_QSV_6_0(s6_0), .io_in_QSV_6_1(s6_1), .io_in_QSV_7_0(s7_0), .io_in_QSV_7_1(s7_1),
    .io_in_valid(v1),
    .io_out_QSV_0_0(s0_0), .io_out_QSV_0_1(s0_1), .io_out_QSV_1_0(s1_0), .io_out_QSV_1_1(s1_1),
    .io_out_QSV_2_0(s2_0), .io_out_QSV_2_1(s2_1), .io_out_QSV_3_0(s3_0), .io_out_QSV_3_1(s3_1),
    .io_out_QSV_4_0(s4_0), .io_out_QSV_4_1(s4_1), .io_out_QSV_5_0(s5_0), .io_out_QSV_5_1(s5_1),
    .io_out_QSV_6_0(s6_0), .io_out_QSV_6_1(s6_1), .io_out_QSV_7_0(s7_0), .io_out_QSV_7_1(s7_1),
    .io_out_valid(v2)
);

CTGate3QubitVector8bit m_3 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(s0_0), .io_in_QSV_0_1(s0_1), .io_in_QSV_1_0(s1_0), .io_in_QSV_1_1(s1_1),
    .io_in_QSV_2_0(s2_0), .io_in_QSV_2_1(s2_1), .io_in_QSV_3_0(s3_0), .io_in_QSV_3_1(s3_1),
    .io_in_QSV_4_0(s4_0), .io_in_QSV_4_1(s4_1), .io_in_QSV_5_0(s5_0), .io_in_QSV_5_1(s5_1),
    .io_in_QSV_6_0(s6_0), .io_in_QSV_6_1(s6_1), .io_in_QSV_7_0(s7_0), .io_in_QSV_7_1(s7_1),
    .io_in_valid(v2),
    .io_out_QSV_0_0(s0_0), .io_out_QSV_0_1(s0_1), .io_out_QSV_1_0(s1_0), .io_out_QSV_1_1(s1_1),
    .io_out_QSV_2_0(s2_0), .io_out_QSV_2_1(s2_1), .io_out_QSV_3_0(s3_0), .io_out_QSV_3_1(s3_1),
    .io_out_QSV_4_0(s4_0), .io_out_QSV_4_1(s4_1), .io_out_QSV_5_0(s5_0), .io_out_QSV_5_1(s5_1),
    .io_out_QSV_6_0(s6_0), .io_out_QSV_6_1(s6_1), .io_out_QSV_7_0(s7_0), .io_out_QSV_7_1(s7_1),
    .io_out_valid(v3)
);

CompatiblePerm_1 m_4 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(s0_0), .io_in_QSV_0_1(s0_1), .io_in_QSV_1_0(s1_0), .io_in_QSV_1_1(s1_1),
    .io_in_QSV_2_0(s2_0), .io_in_QSV_2_1(s2_1), .io_in_QSV_3_0(s3_0), .io_in_QSV_3_1(s3_1),
    .io_in_QSV_4_0(s4_0), .io_in_QSV_4_1(s4_1), .io_in_QSV_5_0(s5_0), .io_in_QSV_5_1(s5_1),
    .io_in_QSV_6_0(s6_0), .io_in_QSV_6_1(s6_1), .io_in_QSV_7_0(s7_0), .io_in_QSV_7_1(s7_1),
    .io_in_valid(v3),
    .io_out_QSV_0_0(s0_0), .io_out_QSV_0_1(s0_1), .io_out_QSV_1_0(s1_0), .io_out_QSV_1_1(s1_1),
    .io_out_QSV_2_0(s2_0), .io_out_QSV_2_1(s2_1), .io_out_QSV_3_0(s3_0), .io_out_QSV_3_1(s3_1),
    .io_out_QSV_4_0(s4_0), .io_out_QSV_4_1(s4_1), .io_out_QSV_5_0(s5_0), .io_out_QSV_5_1(s5_1),
    .io_out_QSV_6_0(s6_0), .io_out_QSV_6_1(s6_1), .io_out_QSV_7_0(s7_0), .io_out_QSV_7_1(s7_1),
    .io_out_valid(v4)
);

HGate3QubitVector8bit m_5 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(s0_0), .io_in_QSV_0_1(s0_1), .io_in_QSV_1_0(s1_0), .io_in_QSV_1_1(s1_1),
    .io_in_QSV_2_0(s2_0), .io_in_QSV_2_1(s2_1), .io_in_QSV_3_0(s3_0), .io_in_QSV_3_1(s3_1),
    .io_in_QSV_4_0(s4_0), .io_in_QSV_4_1(s4_1), .io_in_QSV_5_0(s5_0), .io_in_QSV_5_1(s5_1),
    .io_in_QSV_6_0(s6_0), .io_in_QSV_6_1(s6_1), .io_in_QSV_7_0(s7_0), .io_in_QSV_7_1(s7_1),
    .io_in_valid(v4),
    .io_out_QSV_0_0(s0_0), .io_out_QSV_0_1(s0_1), .io_out_QSV_1_0(s1_0), .io_out_QSV_1_1(s1_1),
    .io_out_QSV_2_0(s2_0), .io_out_QSV_2_1(s2_1), .io_out_QSV_3_0(s3_0), .io_out_QSV_3_1(s3_1),
    .io_out_QSV_4_0(s4_0), .io_out_QSV_4_1(s4_1), .io_out_QSV_5_0(s5_0), .io_out_QSV_5_1(s5_1),
    .io_out_QSV_6_0(s6_0), .io_out_QSV_6_1(s6_1), .io_out_QSV_7_0(s7_0), .io_out_QSV_7_1(s7_1),
    .io_out_valid(v5)
);

CSGate3QubitVector8bit m_6 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(s0_0), .io_in_QSV_0_1(s0_1), .io_in_QSV_1_0(s1_0), .io_in_QSV_1_1(s1_1),
    .io_in_QSV_2_0(s2_0), .io_in_QSV_2_1(s2_1), .io_in_QSV_3_0(s3_0), .io_in_QSV_4_0(s4_0),
    .io_in_QSV_4_1(s4_1), .io_in_QSV_5_0(s5_0), .io_in_QSV_5_1(s5_1), .io_in_QSV_6_0(s6_0),
    .io_in_QSV_6_1(s6_1), .io_in_QSV_7_0(s7_0), .io_in_valid(v5),
    .io_out_QSV_0_0(s0_0), .io_out_QSV_0_1(s0_1), .io_out_QSV_1_0(s1_0), .io_out_QSV_1_1(s1_1),
    .io_out_QSV_2_0(s2_0), .io_out_QSV_2_1(s2_1), .io_out_QSV_3_0(s3_0), .io_out_QSV_3_1(s3_1),
    .io_out_QSV_4_0(s4_0), .io_out_QSV_4_1(s4_1), .io_out_QSV_5_0(s5_0), .io_out_QSV_5_1(s5_1),
    .io_out_QSV_6_0(s6_0), .io_out_QSV_6_1(s6_1), .io_out_QSV_7_0(s7_0), .io_out_QSV_7_1(s7_1),
    .io_out_valid(v6)
);

CompatiblePerm_2 m_7 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(s0_0), .io_in_QSV_0_1(s0_1), .io_in_QSV_1_0(s1_0), .io_in_QSV_1_1(s1_1),
    .io_in_QSV_2_0(s2_0), .io_in_QSV_2_1(s2_1), .io_in_QSV_3_0(s3_0), .io_in_QSV_3_1(s3_1),
    .io_in_QSV_4_0(s4_0), .io_in_QSV_4_1(s4_1), .io_in_QSV_5_0(s5_0), .io_in_QSV_5_1(s5_1),
    .io_in_QSV_6_0(s6_0), .io_in_QSV_6_1(s6_1), .io_in_QSV_7_0(s7_0), .io_in_QSV_7_1(s7_1),
    .io_in_valid(v6),
    .io_out_QSV_0_0(s0_0), .io_out_QSV_0_1(s0_1), .io_out_QSV_1_0(s1_0), .io_out_QSV_1_1(s1_1),
    .io_out_QSV_2_0(s2_0), .io_out_QSV_2_1(s2_1), .io_out_QSV_3_0(s3_0), .io_out_QSV_3_1(s3_1),
    .io_out_QSV_4_0(s4_0), .io_out_QSV_4_1(s4_1), .io_out_QSV_5_0(s5_0), .io_out_QSV_5_1(s5_1),
    .io_out_QSV_6_0(s6_0), .io_out_QSV_6_1(s6_1), .io_out_QSV_7_0(s7_0), .io_out_QSV_7_1(s7_1),
    .io_out_valid(v7)
);

HGate3QubitVector8bit m_8 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(s0_0), .io_in_QSV_0_1(s0_1), .io_in_QSV_1_0(s1_0), .io_in_QSV_1_1(s1_1),
    .io_in_QSV_2_0(s2_0), .io_in_QSV_2_1(s2_1), .io_in_QSV_3_0(s3_0), .io_in_QSV_3_1(s3_1),
    .io_in_QSV_4_0(s4_0), .io_in_QSV_4_1(s4_1), .io_in_QSV_5_0(s5_0), .io_in_QSV_5_1(s5_1),
    .io_in_QSV_6_0(s6_0), .io_in_QSV_6_1(s6_1), .io_in_QSV_7_0(s7_0), .io_in_QSV_7_1(s7_1),
    .io_in_valid(v7),
    .io_out_QSV_0_0(s0_0), .io_out_QSV_0_1(s0_1), .io_out_QSV_1_0(s1_0), .io_out_QSV_1_1(s1_1),
    .io_out_QSV_2_0(s2_0), .io_out_QSV_2_1(s2_1), .io_out_QSV_3_0(s3_0), .io_out_QSV_3_1(s3_1),
    .io_out_QSV_4_0(s4_0), .io_out_QSV_4_1(s4_1), .io_out_QSV_5_0(s5_0), .io_out_QSV_5_1(s5_1),
    .io_out_QSV_6_0(s6_0), .io_out_QSV_6_1(s6_1), .io_out_QSV_7_0(s7_0), .io_out_QSV_7_1(s7_1),
    .io_out_valid(v8)
);

CompatiblePerm m_9 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(s0_0), .io_in_QSV_0_1(s0_1), .io_in_QSV_1_0(s1_0), .io_in_QSV_1_1(s1_1),
    .io_in_QSV_2_0(s2_0), .io_in_QSV_2_1(s2_1), .io_in_QSV_3_0(s3_0), .io_in_QSV_3_1(s3_1),
    .io_in_QSV_4_0(s4_0), .io_in_QSV_4_1(s4_1), .io_in_QSV_5_0(s5_0), .io_in_QSV_5_1(s5_1),
    .io_in_QSV_6_0(s6_0), .io_in_QSV_6_1(s6_1), .io_in_QSV_7_0(s7_0), .io_in_QSV_7_1(s7_1),
    .io_in_valid(v8),
    .io_out_QSV_0_0(s0_0), .io_out_QSV_0_1(s0_1), .io_out_QSV_1_0(s1_0), .io_out_QSV_1_1(s1_1),
    .io_out_QSV_2_0(s2_0), .io_out_QSV_2_1(s2_1), .io_out_QSV_3_0(s3_0), .io_out_QSV_3_1(s3_1),
    .io_out_QSV_4_0(s4_0), .io_out_QSV_4_1(s4_1), .io_out_QSV_5_0(s5_0), .io_out_QSV_5_1(s5_1),
    .io_out_QSV_6_0(s6_0), .io_out_QSV_6_1(s6_1), .io_out_QSV_7_0(s7_0), .io_out_QSV_7_1(s7_1),
    .io_out_valid(v9)
);

SWGate3QubitVector8bit m_10 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(s0_0), .io_in_QSV_0_1(s0_1), .io_in_QSV_1_0(s1_0), .io_in_QSV_1_1(s1_1),
    .io_in_QSV_2_0(s2_0), .io_in_QSV_2_1(s2_1), .io_in_QSV_3_0(s3_0), .io_in_QSV_3_1(s3_1),
    .io_in_QSV_4_0(s4_0), .io_in_QSV_4_1(s4_1), .io_in_QSV_5_0(s5_0), .io_in_QSV_5_1(s5_1),
    .io_in_QSV_6_0(s6_0), .io_in_QSV_6_1(s6_1), .io_in_QSV_7_0(s7_0), .io_in_QSV_7_1(s7_1),
    .io_in_valid(v9),
    .io_out_QSV_0_0(s0_0), .io_out_QSV_0_1(s0_1), .io_out_QSV_1_0(s1_0), .io_out_QSV_1_1(s1_1),
    .io_out_QSV_2_0(s2_0), .io_out_QSV_2_1(s2_1), .io_out_QSV_3_0(s3_0), .io_out_QSV_3_1(s3_1),
    .io_out_QSV_4_0(s4_0), .io_out_QSV_4_1(s4_1), .io_out_QSV_5_0(s5_0), .io_out_QSV_5_1(s5_1),
    .io_out_QSV_6_0(s6_0), .io_out_QSV_6_1(s6_1), .io_out_QSV_7_0(s7_0), .io_out_QSV_7_1(s7_1),
    .io_out_valid(v10)
);

CompatiblePerm_2 m_11 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(s0_0), .io_in_QSV_0_1(s0_1), .io_in_QSV_1_0(s1_0), .io_in_QSV_1_1(s1_1),
    .io_in_QSV_2_0(s2_0), .io_in_QSV_2_1(s2_1), .io_in_QSV_3_0(s3_0), .io_in_QSV_3_1(s3_1),
    .io_in_QSV_4_0(s4_0), .io_in_QSV_4_1(s4_1), .io_in_QSV_5_0(s5_0), .io_in_QSV_5_1(s5_1),
    .io_in_QSV_6_0(s6_0), .io_in_QSV_6_1(s6_1), .io_in_QSV_7_0(s7_0), .io_in_QSV_7_1(s7_1),
    .io_in_valid(v10),
    .io_out_QSV_0_0(s0_0), .io_out_QSV_0_1(s0_1), .io_out_QSV_1_0(s1_0), .io_out_QSV_1_1(s1_1),
    .io_out_QSV_2_0(s2_0), .io_out_QSV_2_1(s2_1), .io_out_QSV_3_0(s3_0), .io_out_QSV_3_1(s3_1),
    .io_out_QSV_4_0(s4_0), .io_out_QSV_4_1(s4_1), .io_out_QSV_5_0(s5_0), .io_out_QSV_5_1(s5_1),
    .io_out_QSV_6_0(s6_0), .io_out_QSV_6_1(s6_1), .io_out_QSV_7_0(s7_0), .io_out_QSV_7_1(s7_1),
    .io_out_valid(v11)
);

CompatiblePerm m_12 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(s0_0), .io_in_QSV_0_1(s0_1), .io_in_QSV_1_0(s1_0), .io_in_QSV_1_1(s1_1),
    .io_in_QSV_2_0(s2_0), .io_in_QSV_2_1(s2_1), .io_in_QSV_3_0(s3_0), .io_in_QSV_3_1(s3_1),
    .io_in_QSV_4_0(s4_0), .io_in_QSV_4_1(s4_1), .io_in_QSV_5_0(s5_0), .io_in_QSV_5_1(s5_1),
    .io_in_QSV_6_0(s6_0), .io_in_QSV_6_1(s6_1), .io_in_QSV_7_0(s7_0), .io_in_QSV_7_1(s7_1),
    .io_in_valid(v11),
    .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1), .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
    .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1), .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
    .io_out_QSV_4_0(io_out_QSV_4_0), .io_out_QSV_4_1(io_out_QSV_4_1), .io_out_QSV_5_0(io_out_QSV_5_0), .io_out_QSV_5_1(io_out_QSV_5_1),
    .io_out_QSV_6_0(io_out_QSV_6_0), .io_out_QSV_6_1(io_out_QSV_6_1), .io_out_QSV_7_0(io_out_QSV_7_0), .io_out_QSV_7_1(io_out_QSV_7_1),
    .io_out_valid(io_out_valid)
);

endmodule
