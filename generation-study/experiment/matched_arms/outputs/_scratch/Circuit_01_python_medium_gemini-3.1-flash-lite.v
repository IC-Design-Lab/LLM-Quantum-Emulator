module Circuit_01 (
    input  logic clock,
    input  logic reset,
    input  logic [15:0] io_in_QSV_0_0,
    input  logic [15:0] io_in_QSV_0_1,
    input  logic [15:0] io_in_QSV_1_0,
    input  logic [15:0] io_in_QSV_1_1,
    input  logic [15:0] io_in_QSV_2_0,
    input  logic [15:0] io_in_QSV_2_1,
    input  logic [15:0] io_in_QSV_3_0,
    input  logic [15:0] io_in_QSV_3_1,
    input  logic io_in_valid,
    output logic [15:0] io_out_QSV_0_0,
    output logic [15:0] io_out_QSV_0_1,
    output logic [15:0] io_out_QSV_1_0,
    output logic [15:0] io_out_QSV_1_1,
    output logic [15:0] io_out_QSV_2_0,
    output logic [15:0] io_out_QSV_2_1,
    output logic [15:0] io_out_QSV_3_0,
    output logic [15:0] io_out_QSV_3_1,
    output logic io_out_valid
);

    logic [15:0] w_h_o0_0, w_h_o0_1, w_h_o1_0, w_h_o1_1, w_h_o2_0, w_h_o2_1, w_h_o3_0, w_h_o3_1;
    logic w_h_valid;

    logic [15:0] w_p1_o0_0, w_p1_o0_1, w_p1_o1_0, w_p1_o1_1, w_p1_o2_0, w_p1_o2_1, w_p1_o3_0, w_p1_o3_1;
    logic w_p1_valid;

    logic [15:0] w_x_o0_0, w_x_o0_1, w_x_o1_0, w_x_o1_1, w_x_o2_0, w_x_o2_1, w_x_o3_0, w_x_o3_1;
    logic w_x_valid;

    logic [15:0] w_p2_o0_0, w_p2_o0_1, w_p2_o1_0, w_p2_o1_1, w_p2_o2_0, w_p2_o2_1, w_p2_o3_0, w_p2_o3_1;
    logic w_p2_valid;

    HGate2QubitVector16bit m (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(io_in_QSV_0_0),
        .io_in_QSV_0_1(io_in_QSV_0_1),
        .io_in_QSV_1_0(io_in_QSV_1_0),
        .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0),
        .io_in_QSV_2_1(io_in_QSV_2_1),
        .io_in_QSV_3_0(io_in_QSV_3_0),
        .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_in_valid(io_in_valid),
        .io_out_QSV_0_0(w_h_o0_0),
        .io_out_QSV_0_1(w_h_o0_1),
        .io_out_QSV_1_0(w_h_o1_0),
        .io_out_QSV_1_1(w_h_o1_1),
        .io_out_QSV_2_0(w_h_o2_0),
        .io_out_QSV_2_1(w_h_o2_1),
        .io_out_QSV_3_0(w_h_o3_0),
        .io_out_QSV_3_1(w_h_o3_1),
        .io_out_valid(w_h_valid)
    );

    CompatiblePerm m_1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w_h_o0_0), .io_in_QSV_0_1(w_h_o0_1),
        .io_in_QSV_1_0(w_h_o1_0), .io_in_QSV_1_1(w_h_o1_1),
        .io_in_QSV_2_0(w_h_o2_0), .io_in_QSV_2_1(w_h_o2_1),
        .io_in_QSV_3_0(w_h_o3_0), .io_in_QSV_3_1(w_h_o3_1),
        .io_in_valid(w_h_valid),
        .io_out_QSV_0_0(w_p1_o0_0), .io_out_QSV_0_1(w_p1_o0_1),
        .io_out_QSV_1_0(w_p1_o1_0), .io_out_QSV_1_1(w_p1_o1_1),
        .io_out_QSV_2_0(w_p1_o2_0), .io_out_QSV_2_1(w_p1_o2_1),
        .io_out_QSV_3_0(w_p1_o3_0), .io_out_QSV_3_1(w_p1_o3_1),
        .io_out_valid(w_p1_valid)
    );

    XGate2QubitVector16bit m_2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w_p1_o0_0), .io_in_QSV_0_1(w_p1_o0_1),
        .io_in_QSV_1_0(w_p1_o1_0), .io_in_QSV_1_1(w_p1_o1_1),
        .io_in_QSV_2_0(w_p1_o2_0), .io_in_QSV_2_1(w_p1_o2_1),
        .io_in_QSV_3_0(w_p1_o3_0), .io_in_QSV_3_1(w_p1_o3_1),
        .io_in_valid(w_p1_valid),
        .io_out_QSV_0_0(w_x_o0_0), .io_out_QSV_0_1(w_x_o0_1),
        .io_out_QSV_1_0(w_x_o1_0), .io_out_QSV_1_1(w_x_o1_1),
        .io_out_QSV_2_0(w_x_o2_0), .io_out_QSV_2_1(w_x_o2_1),
        .io_out_QSV_3_0(w_x_o3_0), .io_out_QSV_3_1(w_x_o3_1),
        .io_out_valid(w_x_valid)
    );

    CompatiblePerm m_3 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w_x_o0_0), .io_in_QSV_0_1(w_x_o0_1),
        .io_in_QSV_1_0(w_x_o1_0), .io_in_QSV_1_1(w_x_o1_1),
        .io_in_QSV_2_0(w_x_o2_0), .io_in_QSV_2_1(w_x_o2_1),
        .io_in_QSV_3_0(w_x_o3_0), .io_in_QSV_3_1(w_x_o3_1),
        .io_in_valid(w_x_valid),
        .io_out_QSV_0_0(w_p2_o0_0), .io_out_QSV_0_1(w_p2_o0_1),
        .io_out_QSV_1_0(w_p2_o1_0), .io_out_QSV_1_1(w_p2_o1_1),
        .io_out_QSV_2_0(w_p2_o2_0), .io_out_QSV_2_1(w_p2_o2_1),
        .io_out_QSV_3_0(w_p2_o3_0), .io_out_QSV_3_1(w_p2_o3_1),
        .io_out_valid(w_p2_valid)
    );

    SWGate2QubitVector16bit m_4 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w_p2_o0_0), .io_in_QSV_0_1(w_p2_o0_1),
        .io_in_QSV_1_0(w_p2_o1_0), .io_in_QSV_1_1(w_p2_o1_1),
        .io_in_QSV_2_0(w_p2_o2_0), .io_in_QSV_2_1(w_p2_o2_1),
        .io_in_QSV_3_0(w_p2_o3_0), .io_in_QSV_3_1(w_p2_o3_1),
        .io_in_valid(w_p2_valid),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_valid(io_out_valid)
    );

endmodule
