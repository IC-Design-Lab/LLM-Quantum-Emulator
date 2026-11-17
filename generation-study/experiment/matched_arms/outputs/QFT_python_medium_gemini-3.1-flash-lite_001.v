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

wire [7:0] w_QSV_0_0, w_QSV_0_1, w_QSV_1_0, w_QSV_1_1, w_QSV_2_0, w_QSV_2_1, w_QSV_3_0, w_QSV_3_1,
           w_QSV_4_0, w_QSV_4_1, w_QSV_5_0, w_QSV_5_1, w_QSV_6_0, w_QSV_6_1, w_QSV_7_0, w_QSV_7_1;
wire w_valid;

// Step 0: H(0)
HGate3QubitVector8bit m0 (
    .clock(clock), .reset(reset), .io_in_valid(io_in_valid),
    .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1), .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
    .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1), .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
    .io_in_QSV_4_0(io_in_QSV_4_0), .io_in_QSV_4_1(io_in_QSV_4_1), .io_in_QSV_5_0(io_in_QSV_5_0), .io_in_QSV_5_1(io_in_QSV_5_1),
    .io_in_QSV_6_0(io_in_QSV_6_0), .io_in_QSV_6_1(io_in_QSV_6_1), .io_in_QSV_7_0(io_in_QSV_7_0), .io_in_QSV_7_1(io_in_QSV_7_1),
    .io_out_QSV_0_0(w_QSV_0_0), .io_out_QSV_0_1(w_QSV_0_1), .io_out_QSV_1_0(w_QSV_1_0), .io_out_QSV_1_1(w_QSV_1_1),
    .io_out_QSV_2_0(w_QSV_2_0), .io_out_QSV_2_1(w_QSV_2_1), .io_out_QSV_3_0(w_QSV_3_0), .io_out_QSV_3_1(w_QSV_3_1),
    .io_out_QSV_4_0(w_QSV_4_0), .io_out_QSV_4_1(w_QSV_4_1), .io_out_QSV_5_0(w_QSV_5_0), .io_out_QSV_5_1(w_QSV_5_1),
    .io_out_QSV_6_0(w_QSV_6_0), .io_out_QSV_6_1(w_QSV_6_1), .io_out_QSV_7_0(w_QSV_7_0), .io_out_QSV_7_1(w_QSV_7_1),
    .io_out_valid(w_valid)
);

// Step 1: CS(1, 0) - Perm required
wire [7:0] p1_out_QSV [15:0]; wire p1_v;
CompatiblePerm p1 (.clock(clock), .reset(reset), .io_in_valid(w_valid), .io_in_QSV_0_0(w_QSV_0_0), .io_in_QSV_0_1(w_QSV_0_1), .io_in_QSV_1_0(w_QSV_1_0), .io_in_QSV_1_1(w_QSV_1_1), .io_in_QSV_2_0(w_QSV_2_0), .io_in_QSV_2_1(w_QSV_2_1), .io_in_QSV_3_0(w_QSV_3_0), .io_in_QSV_3_1(w_QSV_3_1), .io_in_QSV_4_0(w_QSV_4_0), .io_in_QSV_4_1(w_QSV_4_1), .io_in_QSV_5_0(w_QSV_5_0), .io_in_QSV_5_1(w_QSV_5_1), .io_in_QSV_6_0(w_QSV_6_0), .io_in_QSV_6_1(w_QSV_6_1), .io_in_QSV_7_0(w_QSV_7_0), .io_in_QSV_7_1(w_QSV_7_1),
                   .io_out_QSV_0_0(p1_out_QSV[0]), .io_out_QSV_0_1(p1_out_QSV[1]), .io_out_QSV_1_0(p1_out_QSV[2]), .io_out_QSV_1_1(p1_out_QSV[3]), .io_out_QSV_2_0(p1_out_QSV[4]), .io_out_QSV_2_1(p1_out_QSV[5]), .io_out_QSV_3_0(p1_out_QSV[6]), .io_out_QSV_3_1(p1_out_QSV[7]), .io_out_QSV_4_0(p1_out_QSV[8]), .io_out_QSV_4_1(p1_out_QSV[9]), .io_out_QSV_5_0(p1_out_QSV[10]), .io_out_QSV_5_1(p1_out_QSV[11]), .io_out_QSV_6_0(p1_out_QSV[12]), .io_out_QSV_6_1(p1_out_QSV[13]), .io_out_QSV_7_0(p1_out_QSV[14]), .io_out_QSV_7_1(p1_out_QSV[15]), .io_out_valid(p1_v));

CSGate3QubitVector8bit m1 (.clock(clock), .reset(reset), .io_in_valid(p1_v), .io_in_QSV_0_0(p1_out_QSV[0]), .io_in_QSV_0_1(p1_out_QSV[1]), .io_in_QSV_1_0(p1_out_QSV[2]), .io_in_QSV_1_1(p1_out_QSV[3]), .io_in_QSV_2_0(p1_out_QSV[4]), .io_in_QSV_2_1(p1_out_QSV[5]), .io_in_QSV_3_0(p1_out_QSV[6]), .io_in_QSV_3_1(p1_out_QSV[7]), .io_in_QSV_4_0(p1_out_QSV[8]), .io_in_QSV_4_1(p1_out_QSV[9]), .io_in_QSV_5_0(p1_out_QSV[10]), .io_in_QSV_5_1(p1_out_QSV[11]), .io_in_QSV_6_0(p1_out_QSV[12]), .io_in_QSV_6_1(p1_out_QSV[13]), .io_in_QSV_7_0(p1_out_QSV[14]), .io_in_QSV_7_1(p1_out_QSV[15]), 
                           .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1), .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1), .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1), .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1), .io_out_QSV_4_0(io_out_QSV_4_0), .io_out_QSV_4_1(io_out_QSV_4_1), .io_out_QSV_5_0(io_out_QSV_5_0), .io_out_QSV_5_1(io_out_QSV_5_1), .io_out_QSV_6_0(io_out_QSV_6_0), .io_out_QSV_6_1(io_out_QSV_6_1), .io_out_QSV_7_0(io_out_QSV_7_0), .io_out_QSV_7_1(io_out_QSV_7_1), .io_out_valid(io_out_valid));

endmodule
