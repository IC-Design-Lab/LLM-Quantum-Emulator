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

    wire [7:0] w_v_0, w_v_1, w_v_2, w_v_3, w_v_4, w_v_5, w_v_6;
    wire [7:0] w_0_0, w_0_1, w_1_0, w_1_1, w_2_0, w_2_1, w_3_0, w_3_1, w_4_0, w_4_1, w_5_0, w_5_1, w_6_0, w_6_1, w_7_0, w_7_1;
    wire [7:0] w0_0_0, w0_0_1, w0_1_0, w0_1_1, w0_2_0, w0_2_1, w0_3_0, w0_3_1, w0_4_0, w0_4_1, w0_5_0, w0_5_1, w0_6_0, w0_6_1, w0_7_0, w0_7_1;
    wire [7:0] w1_0_0, w1_0_1, w1_1_0, w1_1_1, w1_2_0, w1_2_1, w1_3_0, w1_4_0, w1_4_1, w1_5_0, w1_5_1, w1_6_0, w1_6_1, w1_7_0;
    wire [7:0] w2_0_0, w2_0_1, w2_1_0, w2_1_1, w2_2_0, w2_2_1, w2_3_0, w2_3_1, w2_4_0, w2_4_1, w2_5_0, w2_5_1, w2_6_0, w2_6_1, w2_7_0, w2_7_1;
    wire [7:0] w3_0_0, w3_0_1, w3_1_0, w3_1_1, w3_2_0, w3_2_1, w3_3_0, w3_3_1, w3_4_0, w3_4_1, w3_5_0, w3_5_1, w3_6_0, w3_6_1, w3_7_0, w3_7_1;
    wire [7:0] w4_0_0, w4_0_1, w4_1_0, w4_1_1, w4_2_0, w4_2_1, w4_3_0, w4_4_0, w4_4_1, w4_5_0, w4_5_1, w4_6_0, w4_6_1, w4_7_0;
    wire [7:0] w5_0_0, w5_0_1, w5_1_0, w5_1_1, w5_2_0, w5_2_1, w5_3_0, w5_3_1, w5_4_0, w5_4_1, w5_5_0, w5_5_1, w5_6_0, w5_6_1, w5_7_0, w5_7_1;

    HGate3QubitVector8bit m0 (.clock(clock), .reset(reset), .io_in_valid(io_in_valid),
        .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1), .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1), .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_in_QSV_4_0(io_in_QSV_4_0), .io_in_QSV_4_1(io_in_QSV_4_1), .io_in_QSV_5_0(io_in_QSV_5_0), .io_in_QSV_5_1(io_in_QSV_5_1),
        .io_in_QSV_6_0(io_in_QSV_6_0), .io_in_QSV_6_1(io_in_QSV_6_1), .io_in_QSV_7_0(io_in_QSV_7_0), .io_in_QSV_7_1(io_in_QSV_7_1),
        .io_out_QSV_0_0(w0_0_0), .io_out_QSV_0_1(w0_0_1), .io_out_QSV_1_0(w0_1_0), .io_out_QSV_1_1(w0_1_1),
        .io_out_QSV_2_0(w0_2_0), .io_out_QSV_2_1(w0_2_1), .io_out_QSV_3_0(w0_3_0), .io_out_QSV_3_1(w0_3_1),
        .io_out_QSV_4_0(w0_4_0), .io_out_QSV_4_1(w0_4_1), .io_out_QSV_5_0(w0_5_0), .io_out_QSV_5_1(w0_5_1),
        .io_out_QSV_6_0(w0_6_0), .io_out_QSV_6_1(w0_6_1), .io_out_QSV_7_0(w0_7_0), .io_out_QSV_7_1(w0_7_1), .io_out_valid(w_v_0));

    CSGate3QubitVector8bit m1 (.clock(clock), .reset(reset), .io_in_valid(w_v_0),
        .io_in_QSV_0_0(w0_0_0), .io_in_QSV_0_1(w0_0_1), .io_in_QSV_1_0(w0_1_0), .io_in_QSV_1_1(w0_1_1),
        .io_in_QSV_2_0(w0_2_0), .io_in_QSV_2_1(w0_2_1), .io_in_QSV_3_0(w0_3_0),
        .io_in_QSV_4_0(w0_4_0), .io_in_QSV_4_1(w0_4_1), .io_in_QSV_5_0(w0_5_0), .io_in_QSV_5_1(w0_5_1),
        .io_in_QSV_6_0(w0_6_0), .io_in_QSV_6_1(w0_6_1), .io_in_QSV_7_0(w0_7_0),
        .io_out_QSV_0_0(w1_0_0), .io_out_QSV_0_1(w1_0_1), .io_out_QSV_1_0(w1_1_0), .io_out_QSV_1_1(w1_1_1),
        .io_out_QSV_2_0(w1_2_0), .io_out_QSV_2_1(w1_2_1), .io_out_QSV_3_0(w1_3_0),
        .io_out_QSV_4_0(w1_4_0), .io_out_QSV_4_1(w1_4_1), .io_out_QSV_5_0(w1_5_0), .io_out_QSV_5_1(w1_5_1),
        .io_out_QSV_6_0(w1_6_0), .io_out_QSV_6_1(w1_6_1), .io_out_QSV_7_0(w1_7_0), .io_out_valid(w_v_1));

    CTGate3QubitVector8bit m2 (.clock(clock), .reset(reset), .io_in_valid(w_v_1),
        .io_in_QSV_0_0(w1_0_0), .io_in_QSV_0_1(w1_0_1), .io_in_QSV_1_0(w1_1_0), .io_in_QSV_1_1(w1_1_1),
        .io_in_QSV_2_0(w1_2_0), .io_in_QSV_2_1(w1_2_1), .io_in_QSV_3_0(w1_3_0), .io_in_QSV_3_1(8'h00),
        .io_in_QSV_4_0(w1_4_0), .io_in_QSV_4_1(w1_4_1), .io_in_QSV_5_0(w1_5_0), .io_in_QSV_5_1(w1_5_1),
        .io_in_QSV_6_0(w1_6_0), .io_in_QSV_6_1(w1_6_1), .io_in_QSV_7_0(w1_7_0), .io_in_QSV_7_1(8'h00),
        .io_out_QSV_0_0(w2_0_0), .io_out_QSV_0_1(w2_0_1), .io_out_QSV_1_0(w2_1_0), .io_out_QSV_1_1(w2_1_1),
        .io_out_QSV_2_0(w2_2_0), .io_out_QSV_2_1(w2_2_1), .io_out_QSV_3_0(w2_3_0), .io_out_QSV_3_1(w2_3_1),
        .io_out_QSV_4_0(w2_4_0), .io_out_QSV_4_1(w2_4_1), .io_out_QSV_5_0(w2_5_0), .io_out_QSV_5_1(w2_5_1),
        .io_out_QSV_6_0(w2_6_0), .io_out_QSV_6_1(w2_6_1), .io_out_QSV_7_0(w2_7_0), .io_out_QSV_7_1(w2_7_1), .io_out_valid(w_v_2));

    HGate3QubitVector8bit m3 (.clock(clock), .reset(reset), .io_in_valid(w_v_2),
        .io_in_QSV_0_0(w2_0_0), .io_in_QSV_0_1(w2_0_1), .io_in_QSV_1_0(w2_1_0), .io_in_QSV_1_1(w2_1_1),
        .io_in_QSV_2_0(w2_2_0), .io_in_QSV_2_1(w2_2_1), .io_in_QSV_3_0(w2_3_0), .io_in_QSV_3_1(w2_3_1),
        .io_in_QSV_4_0(w2_4_0), .io_in_QSV_4_1(w2_4_1), .io_in_QSV_5_0(w2_5_0), .io_in_QSV_5_1(w2_5_1),
        .io_in_QSV_6_0(w2_6_0), .io_in_QSV_6_1(w2_6_1), .io_in_QSV_7_0(w2_7_0), .io_in_QSV_7_1(w2_7_1),
        .io_out_QSV_0_0(w3_0_0), .io_out_QSV_0_1(w3_0_1), .io_out_QSV_1_0(w3_1_0), .io_out_QSV_1_1(w3_1_1),
        .io_out_QSV_2_0(w3_2_0), .io_out_QSV_2_1(w3_2_1), .io_out_QSV_3_0(w3_3_0), .io_out_QSV_3_1(w3_3_1),
        .io_out_QSV_4_0(w3_4_0), .io_out_QSV_4_1(w3_4_1), .io_out_QSV_5_0(w3_5_0), .io_out_QSV_5_1(w3_5_1),
        .io_out_QSV_6_0(w3_6_0), .io_out_QSV_6_1(w3_6_1), .io_out_QSV_7_0(w3_7_0), .io_out_QSV_7_1(w3_7_1), .io_out_valid(w_v_3));

    CSGate3QubitVector8bit m4 (.clock(clock), .reset(reset), .io_in_valid(w_v_3),
        .io_in_QSV_0_0(w3_0_0), .io_in_QSV_0_1(w3_0_1), .io_in_QSV_1_0(w3_1_0), .io_in_QSV_1_1(w3_1_1),
        .io_in_QSV_2_0(w3_2_0), .io_in_QSV_2_1(w3_2_1), .io_in_QSV_3_0(w3_3_0),
        .io_in_QSV_4_0(w3_4_0), .io_in_QSV_4_1(w3_4_1), .io_in_QSV_5_0(w3_5_0), .io_in_QSV_5_1(w3_5_1),
        .io_in_QSV_6_0(w3_6_0), .io_in_QSV_6_1(w3_6_1), .io_in_QSV_7_0(w3_7_0),
        .io_out_QSV_0_0(w4_0_0), .io_out_QSV_0_1(w4_0_1), .io_out_QSV_1_0(w4_1_0), .io_out_QSV_1_1(w4_1_1),
        .io_out_QSV_2_0(w4_2_0), .io_out_QSV_2_1(w4_2_1), .io_out_QSV_3_0(w4_3_0),
        .io_out_QSV_4_0(w4_4_0), .io_out_QSV_4_1(w4_4_1), .io_out_QSV_5_0(w4_5_0), .io_out_QSV_5_1(w4_5_1),
        .io_out_QSV_6_0(w4_6_0), .io_out_QSV_6_1(w4_6_1), .io_out_QSV_7_0(w4_7_0), .io_out_valid(w_v_4));

    HGate3QubitVector8bit m5 (.clock(clock), .reset(reset), .io_in_valid(w_v_4),
        .io_in_QSV_0_0(w4_0_0), .io_in_QSV_0_1(w4_0_1), .io_in_QSV_1_0(w4_1_0), .io_in_QSV_1_1(w4_1_1),
        .io_in_QSV_2_0(w4_2_0), .io_in_QSV_2_1(w4_2_1), .io_in_QSV_3_0(w4_3_0), .io_in_QSV_3_1(8'h00),
        .io_in_QSV_4_0(w4_4_0), .io_in_QSV_4_1(w4_4_1), .io_in_QSV_5_0(w4_5_0), .io_in_QSV_5_1(w4_5_1),
        .io_in_QSV_6_0(w4_6_0), .io_in_QSV_6_1(w4_6_1), .io_in_QSV_7_0(w4_7_0), .io_in_QSV_7_1(8'h00),
        .io_out_QSV_0_0(w5_0_0), .io_out_QSV_0_1(w5_0_1), .io_out_QSV_1_0(w5_1_0), .io_out_QSV_1_1(w5_1_1),
        .io_out_QSV_2_0(w5_2_0), .io_out_QSV_2_1(w5_2_1), .io_out_QSV_3_0(w5_3_0), .io_out_QSV_3_1(w5_3_1),
        .io_out_QSV_4_0(w5_4_0), .io_out_QSV_4_1(w5_4_1), .io_out_QSV_5_0(w5_5_0), .io_out_QSV_5_1(w5_5_1),
        .io_out_QSV_6_0(w5_6_0), .io_out_QSV_6_1(w5_6_1), .io_out_QSV_7_0(w5_7_0), .io_out_QSV_7_1(w5_7_1), .io_out_valid(w_v_5));

    SWGate3QubitVector8bit m6 (.clock(clock), .reset(reset), .io_in_valid(w_v_5),
        .io_in_QSV_0_0(w5_0_0), .io_in_QSV_0_1(w5_0_1), .io_in_QSV_1_0(w5_1_0), .io_in_QSV_1_1(w5_1_1),
        .io_in_QSV_2_0(w5_2_0), .io_in_QSV_2_1(w5_2_1), .io_in_QSV_3_0(w5_3_0), .io_in_QSV_3_1(w5_3_1),
        .io_in_QSV_4_0(w5_4_0), .io_in_QSV_4_1(w5_4_1), .io_in_QSV_5_0(w5_5_0), .io_in_QSV_5_1(w5_5_1),
        .io_in_QSV_6_0(w5_6_0), .io_in_QSV_6_1(w5_6_1), .io_in_QSV_7_0(w5_7_0), .io_in_QSV_7_1(w5_7_1),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1), .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1), .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_QSV_4_0(io_out_QSV_4_0), .io_out_QSV_4_1(io_out_QSV_4_1), .io_out_QSV_5_0(io_out_QSV_5_0), .io_out_QSV_5_1(io_out_QSV_5_1),
        .io_out_QSV_6_0(io_out_QSV_6_0), .io_out_QSV_6_1(io_out_QSV_6_1), .io_out_QSV_7_0(io_out_QSV_7_0), .io_out_QSV_7_1(io_out_QSV_7_1), .io_out_valid(io_out_valid));

endmodule
