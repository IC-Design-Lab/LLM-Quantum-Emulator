module QFT (
    input clock,
    input reset,
    input [7:0] io_in_QSV_0_0, io_in_QSV_0_1,
    input [7:0] io_in_QSV_1_0, io_in_QSV_1_1,
    input [7:0] io_in_QSV_2_0, io_in_QSV_2_1,
    input [7:0] io_in_QSV_3_0, io_in_QSV_3_1,
    input [7:0] io_in_QSV_4_0, io_in_QSV_4_1,
    input [7:0] io_in_QSV_5_0, io_in_QSV_5_1,
    input [7:0] io_in_QSV_6_0, io_in_QSV_6_1,
    input [7:0] io_in_QSV_7_0, io_in_QSV_7_1,
    input io_in_valid,
    output [7:0] io_out_QSV_0_0, io_out_QSV_0_1,
    output [7:0] io_out_QSV_1_0, io_out_QSV_1_1,
    output [7:0] io_out_QSV_2_0, io_out_QSV_2_1,
    output [7:0] io_out_QSV_3_0, io_out_QSV_3_1,
    output [7:0] io_out_QSV_4_0, io_out_QSV_4_1,
    output [7:0] io_out_QSV_5_0, io_out_QSV_5_1,
    output [7:0] io_out_QSV_6_0, io_out_QSV_6_1,
    output [7:0] io_out_QSV_7_0, io_out_QSV_7_1,
    output io_out_valid
);

    wire [7:0] w_QSV_0_0 [13], w_QSV_0_1 [13];
    wire [7:0] w_QSV_1_0 [13], w_QSV_1_1 [13];
    wire [7:0] w_QSV_2_0 [13], w_QSV_2_1 [13];
    wire [7:0] w_QSV_3_0 [13], w_QSV_3_1 [13];
    wire [7:0] w_QSV_4_0 [13], w_QSV_4_1 [13];
    wire [7:0] w_QSV_5_0 [13], w_QSV_5_1 [13];
    wire [7:0] w_QSV_6_0 [13], w_QSV_6_1 [13];
    wire [7:0] w_QSV_7_0 [13], w_QSV_7_1 [13];
    wire w_valid [13];

    assign w_QSV_0_0[0] = io_in_QSV_0_0; assign w_QSV_0_1[0] = io_in_QSV_0_1;
    assign w_QSV_1_0[0] = io_in_QSV_1_0; assign w_QSV_1_1[0] = io_in_QSV_1_1;
    assign w_QSV_2_0[0] = io_in_QSV_2_0; assign w_QSV_2_1[0] = io_in_QSV_2_1;
    assign w_QSV_3_0[0] = io_in_QSV_3_0; assign w_QSV_3_1[0] = io_in_QSV_3_1;
    assign w_QSV_4_0[0] = io_in_QSV_4_0; assign w_QSV_4_1[0] = io_in_QSV_4_1;
    assign w_QSV_5_0[0] = io_in_QSV_5_0; assign w_QSV_5_1[0] = io_in_QSV_5_1;
    assign w_QSV_6_0[0] = io_in_QSV_6_0; assign w_QSV_6_1[0] = io_in_QSV_6_1;
    assign w_QSV_7_0[0] = io_in_QSV_7_0; assign w_QSV_7_1[0] = io_in_QSV_7_1;
    assign w_valid[0] = io_in_valid;

    `define GATE_INST(mod, inst, idx) \
    mod inst (.clock(clock), .reset(reset), \
    .io_in_QSV_0_0(w_QSV_0_0[idx]), .io_in_QSV_0_1(w_QSV_0_1[idx]), \
    .io_in_QSV_1_0(w_QSV_1_0[idx]), .io_in_QSV_1_1(w_QSV_1_1[idx]), \
    .io_in_QSV_2_0(w_QSV_2_0[idx]), .io_in_QSV_2_1(w_QSV_2_1[idx]), \
    .io_in_QSV_3_0(w_QSV_3_0[idx]), .io_in_QSV_3_1(w_QSV_3_1[idx]), \
    .io_in_QSV_4_0(w_QSV_4_0[idx]), .io_in_QSV_4_1(w_QSV_4_1[idx]), \
    .io_in_QSV_5_0(w_QSV_5_0[idx]), .io_in_QSV_5_1(w_QSV_5_1[idx]), \
    .io_in_QSV_6_0(w_QSV_6_0[idx]), .io_in_QSV_6_1(w_QSV_6_1[idx]), \
    .io_in_QSV_7_0(w_QSV_7_0[idx]), .io_in_QSV_7_1(w_QSV_7_1[idx]), \
    .io_in_valid(w_valid[idx]), \
    .io_out_QSV_0_0(w_QSV_0_0[idx+1]), .io_out_QSV_0_1(w_QSV_0_1[idx+1]), \
    .io_out_QSV_1_0(w_QSV_1_0[idx+1]), .io_out_QSV_1_1(w_QSV_1_1[idx+1]), \
    .io_out_QSV_2_0(w_QSV_2_0[idx+1]), .io_out_QSV_2_1(w_QSV_2_1[idx+1]), \
    .io_out_QSV_3_0(w_QSV_3_0[idx+1]), .io_out_QSV_3_1(w_QSV_3_1[idx+1]), \
    .io_out_QSV_4_0(w_QSV_4_0[idx+1]), .io_out_QSV_4_1(w_QSV_4_1[idx+1]), \
    .io_out_QSV_5_0(w_QSV_5_0[idx+1]), .io_out_QSV_5_1(w_QSV_5_1[idx+1]), \
    .io_out_QSV_6_0(w_QSV_6_0[idx+1]), .io_out_QSV_6_1(w_QSV_6_1[idx+1]), \
    .io_out_QSV_7_0(w_QSV_7_0[idx+1]), .io_out_QSV_7_1(w_QSV_7_1[idx+1]), \
    .io_out_valid(w_valid[idx+1]))

    `GATE_INST(HGate3QubitVector8bit, m, 0);
    `GATE_INST(CSGate3QubitVector8bit, m_1, 1);
    `GATE_INST(CompatiblePerm, m_2, 2);
    `GATE_INST(CTGate3QubitVector8bit, m_3, 3);
    `GATE_INST(CompatiblePerm_1, m_4, 4);
    `GATE_INST(HGate3QubitVector8bit, m_5, 5);
    `GATE_INST(CSGate3QubitVector8bit, m_6, 6);
    `GATE_INST(CompatiblePerm_2, m_7, 7);
    `GATE_INST(HGate3QubitVector8bit, m_8, 8);
    `GATE_INST(CompatiblePerm, m_9, 9);
    `GATE_INST(SWGate3QubitVector8bit, m_10, 10);
    `GATE_INST(CompatiblePerm_2, m_11, 11);
    `GATE_INST(CompatiblePerm, m_12, 12);

    assign io_out_QSV_0_0 = w_QSV_0_0[13]; assign io_out_QSV_0_1 = w_QSV_0_1[13];
    assign io_out_QSV_1_0 = w_QSV_1_0[13]; assign io_out_QSV_1_1 = w_QSV_1_1[13];
    assign io_out_QSV_2_0 = w_QSV_2_0[13]; assign io_out_QSV_2_1 = w_QSV_2_1[13];
    assign io_out_QSV_3_0 = w_QSV_3_0[13]; assign io_out_QSV_3_1 = w_QSV_3_1[13];
    assign io_out_QSV_4_0 = w_QSV_4_0[13]; assign io_out_QSV_4_1 = w_QSV_4_1[13];
    assign io_out_QSV_5_0 = w_QSV_5_0[13]; assign io_out_QSV_5_1 = w_QSV_5_1[13];
    assign io_out_QSV_6_0 = w_QSV_6_0[13]; assign io_out_QSV_6_1 = w_QSV_6_1[13];
    assign io_out_QSV_7_0 = w_QSV_7_0[13]; assign io_out_QSV_7_1 = w_QSV_7_1[13];
    assign io_out_valid = w_valid[13];

endmodule
