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

wire [7:0] w_QSV_0, w_QSV_1, w_QSV_2, w_QSV_3, w_QSV_4, w_QSV_5, w_QSV_6, w_QSV_7, w_QSV_8, w_QSV_9, w_QSV_10, w_QSV_11, w_QSV_12, w_QSV_13, w_QSV_14, w_QSV_15;
wire v0, v1, v2, v3, v4, v5, v6, v7, v8;

HGate3QubitVector8bit m0 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1), .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
    .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1), .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
    .io_in_QSV_4_0(io_in_QSV_4_0), .io_in_QSV_4_1(io_in_QSV_4_1), .io_in_QSV_5_0(io_in_QSV_5_0), .io_in_QSV_5_1(io_in_QSV_5_1),
    .io_in_QSV_6_0(io_in_QSV_6_0), .io_in_QSV_6_1(io_in_QSV_6_1), .io_in_QSV_7_0(io_in_QSV_7_0), .io_in_QSV_7_1(io_in_QSV_7_1),
    .io_in_valid(io_in_valid),
    .io_out_QSV_0_0(w_QSV_0), .io_out_QSV_0_1(w_QSV_1), .io_out_QSV_1_0(w_QSV_2), .io_out_QSV_1_1(w_QSV_3),
    .io_out_QSV_2_0(w_QSV_4), .io_out_QSV_2_1(w_QSV_5), .io_out_QSV_3_0(w_QSV_6), .io_out_QSV_3_1(w_QSV_7),
    .io_out_QSV_4_0(w_QSV_8), .io_out_QSV_4_1(w_QSV_9), .io_out_QSV_5_0(w_QSV_10), .io_out_QSV_5_1(w_QSV_11),
    .io_out_QSV_6_0(w_QSV_12), .io_out_QSV_6_1(w_QSV_13), .io_out_QSV_7_0(w_QSV_14), .io_out_QSV_7_1(w_QSV_15),
    .io_out_valid(v0)
);

CSGate3QubitVector8bit m1 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(w_QSV_0), .io_in_QSV_0_1(w_QSV_1), .io_in_QSV_1_0(w_QSV_2), .io_in_QSV_1_1(w_QSV_3),
    .io_in_QSV_2_0(w_QSV_4), .io_in_QSV_2_1(w_QSV_5), .io_in_QSV_3_0(w_QSV_6), .io_in_QSV_3_1(w_QSV_7),
    .io_in_QSV_4_0(w_QSV_8), .io_in_QSV_4_1(w_QSV_9), .io_in_QSV_5_0(w_QSV_10), .io_in_QSV_5_1(w_QSV_11),
    .io_in_QSV_6_0(w_QSV_12), .io_in_QSV_6_1(w_QSV_13), .io_in_QSV_7_0(w_QSV_14), .io_in_QSV_7_1(w_QSV_15),
    .io_in_valid(v0),
    .io_out_QSV_0_0(w_QSV_0), .io_out_QSV_0_1(w_QSV_1), .io_out_QSV_1_0(w_QSV_2), .io_out_QSV_1_1(w_QSV_3),
    .io_out_QSV_2_0(w_QSV_4), .io_out_QSV_2_1(w_QSV_5), .io_out_QSV_3_0(w_QSV_6), .io_out_QSV_3_1(w_QSV_7),
    .io_out_QSV_4_0(w_QSV_8), .io_out_QSV_4_1(w_QSV_9), .io_out_QSV_5_0(w_QSV_10), .io_out_QSV_5_1(w_QSV_11),
    .io_out_QSV_6_0(w_QSV_12), .io_out_QSV_6_1(w_QSV_13), .io_out_QSV_7_0(w_QSV_14), .io_out_QSV_7_1(w_QSV_15),
    .io_out_valid(v1)
);

CTGate3QubitVector8bit m2 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(w_QSV_0), .io_in_QSV_0_1(w_QSV_1), .io_in_QSV_1_0(w_QSV_2), .io_in_QSV_1_1(w_QSV_3),
    .io_in_QSV_2_0(w_QSV_4), .io_in_QSV_2_1(w_QSV_5), .io_in_QSV_3_0(w_QSV_6), .io_in_QSV_3_1(w_QSV_7),
    .io_in_QSV_4_0(w_QSV_8), .io_in_QSV_4_1(w_QSV_9), .io_in_QSV_5_0(w_QSV_10), .io_in_QSV_5_1(w_QSV_11),
    .io_in_QSV_6_0(w_QSV_12), .io_in_QSV_6_1(w_QSV_13), .io_in_QSV_7_0(w_QSV_14), .io_in_QSV_7_1(w_QSV_15),
    .io_in_valid(v1),
    .io_out_QSV_0_0(w_QSV_0), .io_out_QSV_0_1(w_QSV_1), .io_out_QSV_1_0(w_QSV_2), .io_out_QSV_1_1(w_QSV_3),
    .io_out_QSV_2_0(w_QSV_4), .io_out_QSV_2_1(w_QSV_5), .io_out_QSV_3_0(w_QSV_6), .io_out_QSV_3_1(w_QSV_7),
    .io_out_QSV_4_0(w_QSV_8), .io_out_QSV_4_1(w_QSV_9), .io_out_QSV_5_0(w_QSV_10), .io_out_QSV_5_1(w_QSV_11),
    .io_out_QSV_6_0(w_QSV_12), .io_out_QSV_6_1(w_QSV_13), .io_out_QSV_7_0(w_QSV_14), .io_out_QSV_7_1(w_QSV_15),
    .io_out_valid(v2)
);

CompatiblePerm m3 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(w_QSV_0), .io_in_QSV_0_1(w_QSV_1), .io_in_QSV_1_0(w_QSV_2), .io_in_QSV_1_1(w_QSV_3),
    .io_in_QSV_2_0(w_QSV_4), .io_in_QSV_2_1(w_QSV_5), .io_in_QSV_3_0(w_QSV_6), .io_in_QSV_3_1(w_QSV_7),
    .io_in_QSV_4_0(w_QSV_8), .io_in_QSV_4_1(w_QSV_9), .io_in_QSV_5_0(w_QSV_10), .io_in_QSV_5_1(w_QSV_11),
    .io_in_QSV_6_0(w_QSV_12), .io_in_QSV_6_1(w_QSV_13), .io_in_QSV_7_0(w_QSV_14), .io_in_QSV_7_1(w_QSV_15),
    .io_in_valid(v2),
    .io_out_QSV_0_0(w_QSV_0), .io_out_QSV_0_1(w_QSV_1), .io_out_QSV_1_0(w_QSV_2), .io_out_QSV_1_1(w_QSV_3),
    .io_out_QSV_2_0(w_QSV_4), .io_out_QSV_2_1(w_QSV_5), .io_out_QSV_3_0(w_QSV_6), .io_out_QSV_3_1(w_QSV_7),
    .io_out_QSV_4_0(w_QSV_8), .io_out_QSV_4_1(w_QSV_9), .io_out_QSV_5_0(w_QSV_10), .io_out_QSV_5_1(w_QSV_11),
    .io_out_QSV_6_0(w_QSV_12), .io_out_QSV_6_1(w_QSV_13), .io_out_QSV_7_0(w_QSV_14), .io_out_QSV_7_1(w_QSV_15),
    .io_out_valid(v3)
);

HGate3QubitVector8bit m4 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(w_QSV_0), .io_in_QSV_0_1(w_QSV_1), .io_in_QSV_1_0(w_QSV_2), .io_in_QSV_1_1(w_QSV_3),
    .io_in_QSV_2_0(w_QSV_4), .io_in_QSV_2_1(w_QSV_5), .io_in_QSV_3_0(w_QSV_6), .io_in_QSV_3_1(w_QSV_7),
    .io_in_QSV_4_0(w_QSV_8), .io_in_QSV_4_1(w_QSV_9), .io_in_QSV_5_0(w_QSV_10), .io_in_QSV_5_1(w_QSV_11),
    .io_in_QSV_6_0(w_QSV_12), .io_in_QSV_6_1(w_QSV_13), .io_in_QSV_7_0(w_QSV_14), .io_in_QSV_7_1(w_QSV_15),
    .io_in_valid(v3),
    .io_out_QSV_0_0(w_QSV_0), .io_out_QSV_0_1(w_QSV_1), .io_out_QSV_1_0(w_QSV_2), .io_out_QSV_1_1(w_QSV_3),
    .io_out_QSV_2_0(w_QSV_4), .io_out_QSV_2_1(w_QSV_5), .io_out_QSV_3_0(w_QSV_6), .io_out_QSV_3_1(w_QSV_7),
    .io_out_QSV_4_0(w_QSV_8), .io_out_QSV_4_1(w_QSV_9), .io_out_QSV_5_0(w_QSV_10), .io_out_QSV_5_1(w_QSV_11),
    .io_out_QSV_6_0(w_QSV_12), .io_out_QSV_6_1(w_QSV_13), .io_out_QSV_7_0(w_QSV_14), .io_out_QSV_7_1(w_QSV_15),
    .io_out_valid(v4)
);

CompatiblePerm m5 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(w_QSV_0), .io_in_QSV_0_1(w_QSV_1), .io_in_QSV_1_0(w_QSV_2), .io_in_QSV_1_1(w_QSV_3),
    .io_in_QSV_2_0(w_QSV_4), .io_in_QSV_2_1(w_QSV_5), .io_in_QSV_3_0(w_QSV_6), .io_in_QSV_3_1(w_QSV_7),
    .io_in_QSV_4_0(w_QSV_8), .io_in_QSV_4_1(w_QSV_9), .io_in_QSV_5_0(w_QSV_10), .io_in_QSV_5_1(w_QSV_11),
    .io_in_QSV_6_0(w_QSV_12), .io_in_QSV_6_1(w_QSV_13), .io_in_QSV_7_0(w_QSV_14), .io_in_QSV_7_1(w_QSV_15),
    .io_in_valid(v4),
    .io_out_QSV_0_0(w_QSV_0), .io_out_QSV_0_1(w_QSV_1), .io_out_QSV_1_0(w_QSV_2), .io_out_QSV_1_1(w_QSV_3),
    .io_out_QSV_2_0(w_QSV_4), .io_out_QSV_2_1(w_QSV_5), .io_out_QSV_3_0(w_QSV_6), .io_out_QSV_3_1(w_QSV_7),
    .io_out_QSV_4_0(w_QSV_8), .io_out_QSV_4_1(w_QSV_9), .io_out_QSV_5_0(w_QSV_10), .io_out_QSV_5_1(w_QSV_11),
    .io_out_QSV_6_0(w_QSV_12), .io_out_QSV_6_1(w_QSV_13), .io_out_QSV_7_0(w_QSV_14), .io_out_QSV_7_1(w_QSV_15),
    .io_out_valid(v5)
);

CSGate3QubitVector8bit m6 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(w_QSV_0), .io_in_QSV_0_1(w_QSV_1), .io_in_QSV_1_0(w_QSV_2), .io_in_QSV_1_1(w_QSV_3),
    .io_in_QSV_2_0(w_QSV_4), .io_in_QSV_2_1(w_QSV_5), .io_in_QSV_3_0(w_QSV_6), .io_in_QSV_3_1(w_QSV_7),
    .io_in_QSV_4_0(w_QSV_8), .io_in_QSV_4_1(w_QSV_9), .io_in_QSV_5_0(w_QSV_10), .io_in_QSV_5_1(w_QSV_11),
    .io_in_QSV_6_0(w_QSV_12), .io_in_QSV_6_1(w_QSV_13), .io_in_QSV_7_0(w_QSV_14), .io_in_QSV_7_1(w_QSV_15),
    .io_in_valid(v5),
    .io_out_QSV_0_0(w_QSV_0), .io_out_QSV_0_1(w_QSV_1), .io_out_QSV_1_0(w_QSV_2), .io_out_QSV_1_1(w_QSV_3),
    .io_out_QSV_2_0(w_QSV_4), .io_out_QSV_2_1(w_QSV_5), .io_out_QSV_3_0(w_QSV_6), .io_out_QSV_3_1(w_QSV_7),
    .io_out_QSV_4_0(w_QSV_8), .io_out_QSV_4_1(w_QSV_9), .io_out_QSV_5_0(w_QSV_10), .io_out_QSV_5_1(w_QSV_11),
    .io_out_QSV_6_0(w_QSV_12), .io_out_QSV_6_1(w_QSV_13), .io_out_QSV_7_0(w_QSV_14), .io_out_QSV_7_1(w_QSV_15),
    .io_out_valid(v6)
);

HGate3QubitVector8bit m7 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(w_QSV_0), .io_in_QSV_0_1(w_QSV_1), .io_in_QSV_1_0(w_QSV_2), .io_in_QSV_1_1(w_QSV_3),
    .io_in_QSV_2_0(w_QSV_4), .io_in_QSV_2_1(w_QSV_5), .io_in_QSV_3_0(w_QSV_6), .io_in_QSV_3_1(w_QSV_7),
    .io_in_QSV_4_0(w_QSV_8), .io_in_QSV_4_1(w_QSV_9), .io_in_QSV_5_0(w_QSV_10), .io_in_QSV_5_1(w_QSV_11),
    .io_in_QSV_6_0(w_QSV_12), .io_in_QSV_6_1(w_QSV_13), .io_in_QSV_7_0(w_QSV_14), .io_in_QSV_7_1(w_QSV_15),
    .io_in_valid(v6),
    .io_out_QSV_0_0(w_QSV_0), .io_out_QSV_0_1(w_QSV_1), .io_out_QSV_1_0(w_QSV_2), .io_out_QSV_1_1(w_QSV_3),
    .io_out_QSV_2_0(w_QSV_4), .io_out_QSV_2_1(w_QSV_5), .io_out_QSV_3_0(w_QSV_6), .io_out_QSV_3_1(w_QSV_7),
    .io_out_QSV_4_0(w_QSV_8), .io_out_QSV_4_1(w_QSV_9), .io_out_QSV_5_0(w_QSV_10), .io_out_QSV_5_1(w_QSV_11),
    .io_out_QSV_6_0(w_QSV_12), .io_out_QSV_6_1(w_QSV_13), .io_out_QSV_7_0(w_QSV_14), .io_out_QSV_7_1(w_QSV_15),
    .io_out_valid(v7)
);

SWGate3QubitVector8bit m8 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(w_QSV_0), .io_in_QSV_0_1(w_QSV_1), .io_in_QSV_1_0(w_QSV_2), .io_in_QSV_1_1(w_QSV_3),
    .io_in_QSV_2_0(w_QSV_4), .io_in_QSV_2_1(w_QSV_5), .io_in_QSV_3_0(w_QSV_6), .io_in_QSV_3_1(w_QSV_7),
    .io_in_QSV_4_0(w_QSV_8), .io_in_QSV_4_1(w_QSV_9), .io_in_QSV_5_0(w_QSV_10), .io_in_QSV_5_1(w_QSV_11),
    .io_in_QSV_6_0(w_QSV_12), .io_in_QSV_6_1(w_QSV_13), .io_in_QSV_7_0(w_QSV_14), .io_in_QSV_7_1(w_QSV_15),
    .io_in_valid(v7),
    .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1), .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
    .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1), .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
    .io_out_QSV_4_0(io_out_QSV_4_0), .io_out_QSV_4_1(io_out_QSV_4_1), .io_out_QSV_5_0(io_out_QSV_5_0), .io_out_QSV_5_1(io_out_QSV_5_1),
    .io_out_QSV_6_0(io_out_QSV_6_0), .io_out_QSV_6_1(io_out_QSV_6_1), .io_out_QSV_7_0(io_out_QSV_7_0), .io_out_QSV_7_1(io_out_QSV_7_1),
    .io_out_valid(io_out_valid)
);

endmodule
