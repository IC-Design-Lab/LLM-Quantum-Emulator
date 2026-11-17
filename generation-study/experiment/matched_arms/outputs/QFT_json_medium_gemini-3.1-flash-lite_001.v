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

    wire [7:0] m0_out_0_0, m0_out_0_1, m0_out_1_0, m0_out_1_1, m0_out_2_0, m0_out_2_1, m0_out_3_0, m0_out_3_1,
               m0_out_4_0, m0_out_4_1, m0_out_5_0, m0_out_5_1, m0_out_6_0, m0_out_6_1, m0_out_7_0, m0_out_7_1;
    wire m0_out_valid;

    // Step 0: H(0) - No perm
    HGate3QubitVector8bit m0 (
        .clock(clock), .reset(reset), .io_in_valid(io_in_valid),
        .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1), .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1), .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_in_QSV_4_0(io_in_QSV_4_0), .io_in_QSV_4_1(io_in_QSV_4_1), .io_in_QSV_5_0(io_in_QSV_5_0), .io_in_QSV_5_1(io_in_QSV_5_1),
        .io_in_QSV_6_0(io_in_QSV_6_0), .io_in_QSV_6_1(io_in_QSV_6_1), .io_in_QSV_7_0(io_in_QSV_7_0), .io_in_QSV_7_1(io_in_QSV_7_1),
        .io_out_QSV_0_0(m0_out_0_0), .io_out_QSV_0_1(m0_out_0_1), .io_out_QSV_1_0(m0_out_1_0), .io_out_QSV_1_1(m0_out_1_1),
        .io_out_QSV_2_0(m0_out_2_0), .io_out_QSV_2_1(m0_out_2_1), .io_out_QSV_3_0(m0_out_3_0), .io_out_QSV_3_1(m0_out_3_1),
        .io_out_QSV_4_0(m0_out_4_0), .io_out_QSV_4_1(m0_out_4_1), .io_out_QSV_5_0(m0_out_5_0), .io_out_QSV_5_1(m0_out_5_1),
        .io_out_QSV_6_0(m0_out_6_0), .io_out_QSV_6_1(m0_out_6_1), .io_out_QSV_7_0(m0_out_7_0), .io_out_QSV_7_1(m0_out_7_1),
        .io_out_valid(m0_out_valid)
    );

    // Step 1: Perm -> CS(1,0) -> Perm
    wire [7:0] m1_p1_out_0_0, m1_p1_out_0_1, m1_p1_out_1_0, m1_p1_out_1_1, m1_p1_out_2_0, m1_p1_out_2_1, m1_p1_out_3_0, m1_p1_out_3_1,
               m1_p1_out_4_0, m1_p1_out_4_1, m1_p1_out_5_0, m1_p1_out_5_1, m1_p1_out_6_0, m1_p1_out_6_1, m1_p1_out_7_0, m1_p1_out_7_1, m1_p1_v;
    CompatiblePerm m1_p1 (.clock(clock), .reset(reset), .io_in_valid(m0_out_valid),
        .io_in_QSV_0_0(m0_out_0_0), .io_in_QSV_0_1(m0_out_0_1), .io_in_QSV_1_0(m0_out_1_0), .io_in_QSV_1_1(m0_out_1_1),
        .io_in_QSV_2_0(m0_out_2_0), .io_in_QSV_2_1(m0_out_2_1), .io_in_QSV_3_0(m0_out_3_0), .io_in_QSV_3_1(m0_out_3_1),
        .io_in_QSV_4_0(m0_out_4_0), .io_in_QSV_4_1(m0_out_4_1), .io_in_QSV_5_0(m0_out_5_0), .io_in_QSV_5_1(m0_out_5_1),
        .io_in_QSV_6_0(m0_out_6_0), .io_in_QSV_6_1(m0_out_6_1), .io_in_QSV_7_0(m0_out_7_0), .io_in_QSV_7_1(m0_out_7_1),
        .io_out_QSV_0_0(m1_p1_out_0_0), .io_out_QSV_0_1(m1_p1_out_0_1), .io_out_QSV_1_0(m1_p1_out_1_0), .io_out_QSV_1_1(m1_p1_out_1_1),
        .io_out_QSV_2_0(m1_p1_out_2_0), .io_out_QSV_2_1(m1_p1_out_2_1), .io_out_QSV_3_0(m1_p1_out_3_0), .io_out_QSV_3_1(m1_p1_out_3_1),
        .io_out_QSV_4_0(m1_p1_out_4_0), .io_out_QSV_4_1(m1_p1_out_4_1), .io_out_QSV_5_0(m1_p1_out_5_0), .io_out_QSV_5_1(m1_p1_out_5_1),
        .io_out_QSV_6_0(m1_p1_out_6_0), .io_out_QSV_6_1(m1_p1_out_6_1), .io_out_QSV_7_0(m1_p1_out_7_0), .io_out_QSV_7_1(m1_p1_out_7_1),
        .io_out_valid(m1_p1_v));

    wire [7:0] m1_out_0_0, m1_out_0_1, m1_out_1_0, m1_out_1_1, m1_out_2_0, m1_out_2_1, m1_out_3_0, m1_out_3_1,
               m1_out_4_0, m1_out_4_1, m1_out_5_0, m1_out_5_1, m1_out_6_0, m1_out_6_1, m1_out_7_0, m1_out_7_1, m1_out_v;
    CSGate3QubitVector8bit m1 (.clock(clock), .reset(reset), .io_in_valid(m1_p1_v),
        .io_in_QSV_0_0(m1_p1_out_0_0), .io_in_QSV_0_1(m1_p1_out_0_1), .io_in_QSV_1_0(m1_p1_out_1_0), .io_in_QSV_1_1(m1_p1_out_1_1),
        .io_in_QSV_2_0(m1_p1_out_2_0), .io_in_QSV_2_1(m1_p1_out_2_1), .io_in_QSV_3_0(m1_p1_out_3_0), .io_in_QSV_3_1(m1_p1_out_3_1),
        .io_in_QSV_4_0(m1_p1_out_4_0), .io_in_QSV_4_1(m1_p1_out_4_1), .io_in_QSV_5_0(m1_p1_out_5_0), .io_in_QSV_5_1(m1_p1_out_5_1),
        .io_in_QSV_6_0(m1_p1_out_6_0), .io_in_QSV_6_1(m1_p1_out_6_1), .io_in_QSV_7_0(m1_p1_out_7_0), .io_in_QSV_7_1(m1_p1_out_7_1),
        .io_out_QSV_0_0(m1_out_0_0), .io_out_QSV_0_1(m1_out_0_1), .io_out_QSV_1_0(m1_out_1_0), .io_out_QSV_1_1(m1_out_1_1),
        .io_out_QSV_2_0(m1_out_2_0), .io_out_QSV_2_1(m1_out_2_1), .io_out_QSV_3_0(m1_out_3_0), .io_out_QSV_3_1(m1_out_3_1),
        .io_out_QSV_4_0(m1_out_4_0), .io_out_QSV_4_1(m1_out_4_1), .io_out_QSV_5_0(m1_out_5_0), .io_out_QSV_5_1(m1_out_5_1),
        .io_out_QSV_6_0(m1_out_6_0), .io_out_QSV_6_1(m1_out_6_1), .io_out_QSV_7_0(m1_out_7_0), .io_out_QSV_7_1(m1_out_7_1),
        .io_out_valid(m1_out_v));

    CompatiblePerm m1_p2 (.clock(clock), .reset(reset), .io_in_valid(m1_out_v),
        .io_in_QSV_0_0(m1_out_0_0), .io_in_QSV_0_1(m1_out_0_1), .io_in_QSV_1_0(m1_out_1_0), .io_in_QSV_1_1(m1_out_1_1),
        .io_in_QSV_2_0(m1_out_2_0), .io_in_QSV_2_1(m1_out_2_1), .io_in_QSV_3_0(m1_out_3_0), .io_in_QSV_3_1(m1_out_3_1),
        .io_in_QSV_4_0(m1_out_4_0), .io_in_QSV_4_1(m1_out_4_1), .io_in_QSV_5_0(m1_out_5_0), .io_in_QSV_5_1(m1_out_5_1),
        .io_in_QSV_6_0(m1_out_6_0), .io_in_QSV_6_1(m1_out_6_1), .io_in_QSV_7_0(m1_out_7_0), .io_in_QSV_7_1(m1_out_7_1),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1), .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1), .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_QSV_4_0(io_out_QSV_4_0), .io_out_QSV_4_1(io_out_QSV_4_1), .io_out_QSV_5_0(io_out_QSV_5_0), .io_out_QSV_5_1(io_out_QSV_5_1),
        .io_out_QSV_6_0(io_out_QSV_6_0), .io_out_QSV_6_1(io_out_QSV_6_1), .io_out_QSV_7_0(io_out_QSV_7_0), .io_out_QSV_7_1(io_out_QSV_7_1),
        .io_out_valid(io_out_valid));

endmodule
