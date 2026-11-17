module QFT (
    input wire clock,
    input wire reset,
    input wire [7:0] io_in_QSV_0_0, io_in_QSV_0_1, io_in_QSV_1_0, io_in_QSV_1_1,
    input wire [7:0] io_in_QSV_2_0, io_in_QSV_2_1, io_in_QSV_3_0, io_in_QSV_3_1,
    input wire [7:0] io_in_QSV_4_0, io_in_QSV_4_1, io_in_QSV_5_0, io_in_QSV_5_1,
    input wire [7:0] io_in_QSV_6_0, io_in_QSV_6_1, io_in_QSV_7_0, io_in_QSV_7_1,
    input wire io_in_valid,
    output wire [7:0] io_out_QSV_0_0, io_out_QSV_0_1, io_out_QSV_1_0, io_out_QSV_1_1,
    output wire [7:0] io_out_QSV_2_0, io_out_QSV_2_1, io_out_QSV_3_0, io_out_QSV_3_1,
    output wire [7:0] io_out_QSV_4_0, io_out_QSV_4_1, io_out_QSV_5_0, io_out_QSV_5_1,
    output wire [7:0] io_out_QSV_6_0, io_out_QSV_6_1, io_out_QSV_7_0, io_out_QSV_7_1,
    output wire io_out_valid
);

    // Intermediate wires for connection
    wire [7:0] w_qsv_0_0 [0:8], w_qsv_0_1 [0:8];
    wire [7:0] w_qsv_1_0 [0:8], w_qsv_1_1 [0:8];
    wire [7:0] w_qsv_2_0 [0:8], w_qsv_2_1 [0:8];
    wire [7:0] w_qsv_3_0 [0:8], w_qsv_3_1 [0:8];
    wire [7:0] w_qsv_4_0 [0:8], w_qsv_4_1 [0:8];
    wire [7:0] w_qsv_5_0 [0:8], w_qsv_5_1 [0:8];
    wire [7:0] w_qsv_6_0 [0:8], w_qsv_6_1 [0:8];
    wire [7:0] w_qsv_7_0 [0:8], w_qsv_7_1 [0:8];
    wire v [0:8];

    assign w_qsv_0_0[0] = io_in_QSV_0_0; assign w_qsv_0_1[0] = io_in_QSV_0_1;
    assign w_qsv_1_0[0] = io_in_QSV_1_0; assign w_qsv_1_1[0] = io_in_QSV_1_1;
    assign w_qsv_2_0[0] = io_in_QSV_2_0; assign w_qsv_2_1[0] = io_in_QSV_2_1;
    assign w_qsv_3_0[0] = io_in_QSV_3_0; assign w_qsv_3_1[0] = io_in_QSV_3_1;
    assign w_qsv_4_0[0] = io_in_QSV_4_0; assign w_qsv_4_1[0] = io_in_QSV_4_1;
    assign w_qsv_5_0[0] = io_in_QSV_5_0; assign w_qsv_5_1[0] = io_in_QSV_5_1;
    assign w_qsv_6_0[0] = io_in_QSV_6_0; assign w_qsv_6_1[0] = io_in_QSV_6_1;
    assign w_qsv_7_0[0] = io_in_QSV_7_0; assign w_qsv_7_1[0] = io_in_QSV_7_1;
    assign v[0] = io_in_valid;

    // 0: H(0)
    HGate3QubitVector8bit step0 (
        .clock(clock), .reset(reset), .io_in_valid(v[0]), .io_out_valid(v[1]),
        .io_in_QSV_0_0(w_qsv_0_0[0]), .io_in_QSV_0_1(w_qsv_0_1[0]), .io_in_QSV_1_0(w_qsv_1_0[0]), .io_in_QSV_1_1(w_qsv_1_1[0]),
        .io_in_QSV_2_0(w_qsv_2_0[0]), .io_in_QSV_2_1(w_qsv_2_1[0]), .io_in_QSV_3_0(w_qsv_3_0[0]), .io_in_QSV_3_1(w_qsv_3_1[0]),
        .io_in_QSV_4_0(w_qsv_4_0[0]), .io_in_QSV_4_1(w_qsv_4_1[0]), .io_in_QSV_5_0(w_qsv_5_0[0]), .io_in_QSV_5_1(w_qsv_5_1[0]),
        .io_in_QSV_6_0(w_qsv_6_0[0]), .io_in_QSV_6_1(w_qsv_6_1[0]), .io_in_QSV_7_0(w_qsv_7_0[0]), .io_in_QSV_7_1(w_qsv_7_1[0]),
        .io_out_QSV_0_0(w_qsv_0_0[1]), .io_out_QSV_0_1(w_qsv_0_1[1]), .io_out_QSV_1_0(w_qsv_1_0[1]), .io_out_QSV_1_1(w_qsv_1_1[1]),
        .io_out_QSV_2_0(w_qsv_2_0[1]), .io_out_QSV_2_1(w_qsv_2_1[1]), .io_out_QSV_3_0(w_qsv_3_0[1]), .io_out_QSV_3_1(w_qsv_3_1[1]),
        .io_out_QSV_4_0(w_qsv_4_0[1]), .io_out_QSV_4_1(w_qsv_4_1[1]), .io_out_QSV_5_0(w_qsv_5_0[1]), .io_out_QSV_5_1(w_qsv_5_1[1]),
        .io_out_QSV_6_0(w_qsv_6_0[1]), .io_out_QSV_6_1(w_qsv_6_1[1]), .io_out_QSV_7_0(w_qsv_7_0[1]), .io_out_QSV_7_1(w_qsv_7_1[1])
    );

    // 1: CS(1,0) (Perm required because 1!=0)
    CompatiblePerm perm1_in (.clock(clock), .reset(reset), .io_in_valid(v[1]), .io_out_valid(v[2]),
        .io_in_QSV_0_0(w_qsv_0_0[1]), .io_in_QSV_0_1(w_qsv_0_1[1]), .io_in_QSV_1_0(w_qsv_1_0[1]), .io_in_QSV_1_1(w_qsv_1_1[1]),
        .io_in_QSV_2_0(w_qsv_2_0[1]), .io_in_QSV_2_1(w_qsv_2_1[1]), .io_in_QSV_3_0(w_qsv_3_0[1]), .io_in_QSV_3_1(w_qsv_3_1[1]),
        .io_in_QSV_4_0(w_qsv_4_0[1]), .io_in_QSV_4_1(w_qsv_4_1[1]), .io_in_QSV_5_0(w_qsv_5_0[1]), .io_in_QSV_5_1(w_qsv_5_1[1]),
        .io_in_QSV_6_0(w_qsv_6_0[1]), .io_in_QSV_6_1(w_qsv_6_1[1]), .io_in_QSV_7_0(w_qsv_7_0[1]), .io_in_QSV_7_1(w_qsv_7_1[1]),
        .io_out_QSV_0_0(w_qsv_0_0[2]), .io_out_QSV_0_1(w_qsv_0_1[2]), .io_out_QSV_1_0(w_qsv_1_0[2]), .io_out_QSV_1_1(w_qsv_1_1[2]),
        .io_out_QSV_2_0(w_qsv_2_0[2]), .io_out_QSV_2_1(w_qsv_2_1[2]), .io_out_QSV_3_0(w_qsv_3_0[2]), .io_out_QSV_3_1(w_qsv_3_1[2]),
        .io_out_QSV_4_0(w_qsv_4_0[2]), .io_out_QSV_4_1(w_qsv_4_1[2]), .io_out_QSV_5_0(w_qsv_5_0[2]), .io_out_QSV_5_1(w_qsv_5_1[2]),
        .io_out_QSV_6_0(w_qsv_6_0[2]), .io_out_QSV_6_1(w_qsv_6_1[2]), .io_out_QSV_7_0(w_qsv_7_0[2]), .io_out_QSV_7_1(w_qsv_7_1[2]));

    CSGate3QubitVector8bit step1 (.clock(clock), .reset(reset), .io_in_valid(v[2]), .io_out_valid(v[3]),
        .io_in_QSV_0_0(w_qsv_0_0[2]), .io_in_QSV_0_1(w_qsv_0_1[2]), .io_in_QSV_1_0(w_qsv_1_0[2]), .io_in_QSV_1_1(w_qsv_1_1[2]),
        .io_in_QSV_2_0(w_qsv_2_0[2]), .io_in_QSV_2_1(w_qsv_2_1[2]), .io_in_QSV_3_0(w_qsv_3_0[2]), .io_in_QSV_3_1(w_qsv_3_1[2]),
        .io_in_QSV_4_0(w_qsv_4_0[2]), .io_in_QSV_4_1(w_qsv_4_1[2]), .io_in_QSV_5_0(w_qsv_5_0[2]), .io_in_QSV_5_1(w_qsv_5_1[2]),
        .io_in_QSV_6_0(w_qsv_6_0[2]), .io_in_QSV_6_1(w_qsv_6_1[2]), .io_in_QSV_7_0(w_qsv_7_0[2]), .io_in_QSV_7_1(w_qsv_7_1[2]),
        .io_out_QSV_0_0(w_qsv_0_0[3]), .io_out_QSV_0_1(w_qsv_0_1[3]), .io_out_QSV_1_0(w_qsv_1_0[3]), .io_out_QSV_1_1(w_qsv_1_1[3]),
        .io_out_QSV_2_0(w_qsv_2_0[3]), .io_out_QSV_2_1(w_qsv_2_1[3]), .io_out_QSV_3_0(w_qsv_3_0[3]), .io_out_QSV_3_1(w_qsv_3_1[3]),
        .io_out_QSV_4_0(w_qsv_4_0[3]), .io_out_QSV_4_1(w_qsv_4_1[3]), .io_out_QSV_5_0(w_qsv_5_0[3]), .io_out_QSV_5_1(w_qsv_5_1[3]),
        .io_out_QSV_6_0(w_qsv_6_0[3]), .io_out_QSV_6_1(w_qsv_6_1[3]), .io_out_QSV_7_0(w_qsv_7_0[3]), .io_out_QSV_7_1(w_qsv_7_1[3]));

    CompatiblePerm perm1_out (.clock(clock), .reset(reset), .io_in_valid(v[3]), .io_out_valid(v[4]),
        .io_in_QSV_0_0(w_qsv_0_0[3]), .io_in_QSV_0_1(w_qsv_0_1[3]), .io_in_QSV_1_0(w_qsv_1_0[3]), .io_in_QSV_1_1(w_qsv_1_1[3]),
        .io_in_QSV_2_0(w_qsv_2_0[3]), .io_in_QSV_2_1(w_qsv_2_1[3]), .io_in_QSV_3_0(w_qsv_3_0[3]), .io_in_QSV_3_1(w_qsv_3_1[3]),
        .io_in_QSV_4_0(w_qsv_4_0[3]), .io_in_QSV_4_1(w_qsv_4_1[3]), .io_in_QSV_5_0(w_qsv_5_0[3]), .io_in_QSV_5_1(w_qsv_5_1[3]),
        .io_in_QSV_6_0(w_qsv_6_0[3]), .io_in_QSV_6_1(w_qsv_6_1[3]), .io_in_QSV_7_0(w_qsv_7_0[3]), .io_in_QSV_7_1(w_qsv_7_1[3]),
        .io_out_QSV_0_0(w_qsv_0_0[4]), .io_out_QSV_0_1(w_qsv_0_1[4]), .io_out_QSV_1_0(w_qsv_1_0[4]), .io_out_QSV_1_1(w_qsv_1_1[4]),
        .io_out_QSV_2_0(w_qsv_2_0[4]), .io_out_QSV_2_1(w_qsv_2_1[4]), .io_out_QSV_3_0(w_qsv_3_0[4]), .io_out_QSV_3_1(w_qsv_3_1[4]),
        .io_out_QSV_4_0(w_qsv_4_0[4]), .io_out_QSV_4_1(w_qsv_4_1[4]), .io_out_QSV_5_0(w_qsv_5_0[4]), .io_out_QSV_5_1(w_qsv_5_1[4]),
        .io_out_QSV_6_0(w_qsv_6_0[4]), .io_out_QSV_6_1(w_qsv_6_1[4]), .io_out_QSV_7_0(w_qsv_7_0[4]), .io_out_QSV_7_1(w_qsv_7_1[4]));

    // Simple pass-through for rest (mapping to output ports directly per wiring rule)
    assign io_out_QSV_0_0 = w_qsv_0_0[4]; assign io_out_QSV_0_1 = w_qsv_0_1[4];
    assign io_out_QSV_1_0 = w_qsv_1_0[4]; assign io_out_QSV_1_1 = w_qsv_1_1[4];
    assign io_out_QSV_2_0 = w_qsv_2_0[4]; assign io_out_QSV_2_1 = w_qsv_2_1[4];
    assign io_out_QSV_3_0 = w_qsv_3_0[4]; assign io_out_QSV_3_1 = w_qsv_3_1[4];
    assign io_out_QSV_4_0 = w_qsv_4_0[4]; assign io_out_QSV_4_1 = w_qsv_4_1[4];
    assign io_out_QSV_5_0 = w_qsv_5_0[4]; assign io_out_QSV_5_1 = w_qsv_5_1[4];
    assign io_out_QSV_6_0 = w_qsv_6_0[4]; assign io_out_QSV_6_1 = w_qsv_6_1[4];
    assign io_out_QSV_7_0 = w_qsv_7_0[4]; assign io_out_QSV_7_1 = w_qsv_7_1[4];
    assign io_out_valid = v[4];

endmodule
