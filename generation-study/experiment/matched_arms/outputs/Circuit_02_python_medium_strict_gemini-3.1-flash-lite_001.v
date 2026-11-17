module Circuit_02 (
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

    logic [15:0] w_h0_QSV_0_0, w_h0_QSV_0_1, w_h0_QSV_1_0, w_h0_QSV_1_1;
    logic [15:0] w_h0_QSV_2_0, w_h0_QSV_2_1, w_h0_QSV_3_0, w_h0_QSV_3_1;
    logic w_h0_valid;

    logic [15:0] w_perm_QSV_0_0, w_perm_QSV_0_1, w_perm_QSV_1_0, w_perm_QSV_1_1;
    logic [15:0] w_perm_QSV_2_0, w_perm_QSV_2_1, w_perm_QSV_3_0, w_perm_QSV_3_1;
    logic w_perm_valid;

    logic [15:0] w_h1_QSV_0_0, w_h1_QSV_0_1, w_h1_QSV_1_0, w_h1_QSV_1_1;
    logic [15:0] w_h1_QSV_2_0, w_h1_QSV_2_1, w_h1_QSV_3_0, w_h1_QSV_3_1;
    logic w_h1_valid;

    logic [15:0] w_perm2_QSV_0_0, w_perm2_QSV_0_1, w_perm2_QSV_1_0, w_perm2_QSV_1_1;
    logic [15:0] w_perm2_QSV_2_0, w_perm2_QSV_2_1, w_perm2_QSV_3_0, w_perm2_QSV_3_1;
    logic w_perm2_valid;

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
        .io_out_QSV_0_0(w_h0_QSV_0_0),
        .io_out_QSV_0_1(w_h0_QSV_0_1),
        .io_out_QSV_1_0(w_h0_QSV_1_0),
        .io_out_QSV_1_1(w_h0_QSV_1_1),
        .io_out_QSV_2_0(w_h0_QSV_2_0),
        .io_out_QSV_2_1(w_h0_QSV_2_1),
        .io_out_QSV_3_0(w_h0_QSV_3_0),
        .io_out_QSV_3_1(w_h0_QSV_3_1),
        .io_out_valid(w_h0_valid)
    );

    CompatiblePerm m_1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w_h0_QSV_0_0),
        .io_in_QSV_0_1(w_h0_QSV_0_1),
        .io_in_QSV_1_0(w_h0_QSV_1_0),
        .io_in_QSV_1_1(w_h0_QSV_1_1),
        .io_in_QSV_2_0(w_h0_QSV_2_0),
        .io_in_QSV_2_1(w_h0_QSV_2_1),
        .io_in_QSV_3_0(w_h0_QSV_3_0),
        .io_in_QSV_3_1(w_h0_QSV_3_1),
        .io_in_valid(w_h0_valid),
        .io_out_QSV_0_0(w_perm_QSV_0_0),
        .io_out_QSV_0_1(w_perm_QSV_0_1),
        .io_out_QSV_1_0(w_perm_QSV_1_0),
        .io_out_QSV_1_1(w_perm_QSV_1_1),
        .io_out_QSV_2_0(w_perm_QSV_2_0),
        .io_out_QSV_2_1(w_perm_QSV_2_1),
        .io_out_QSV_3_0(w_perm_QSV_3_0),
        .io_out_QSV_3_1(w_perm_QSV_3_1),
        .io_out_valid(w_perm_valid)
    );

    HGate2QubitVector16bit m_2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w_perm_QSV_0_0),
        .io_in_QSV_0_1(w_perm_QSV_0_1),
        .io_in_QSV_1_0(w_perm_QSV_1_0),
        .io_in_QSV_1_1(w_perm_QSV_1_1),
        .io_in_QSV_2_0(w_perm_QSV_2_0),
        .io_in_QSV_2_1(w_perm_QSV_2_1),
        .io_in_QSV_3_0(w_perm_QSV_3_0),
        .io_in_QSV_3_1(w_perm_QSV_3_1),
        .io_in_valid(w_perm_valid),
        .io_out_QSV_0_0(w_h1_QSV_0_0),
        .io_out_QSV_0_1(w_h1_QSV_0_1),
        .io_out_QSV_1_0(w_h1_QSV_1_0),
        .io_out_QSV_1_1(w_h1_QSV_1_1),
        .io_out_QSV_2_0(w_h1_QSV_2_0),
        .io_out_QSV_2_1(w_h1_QSV_2_1),
        .io_out_QSV_3_0(w_h1_QSV_3_0),
        .io_out_QSV_3_1(w_h1_QSV_3_1),
        .io_out_valid(w_h1_valid)
    );

    CompatiblePerm m_3 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w_h1_QSV_0_0),
        .io_in_QSV_0_1(w_h1_QSV_0_1),
        .io_in_QSV_1_0(w_h1_QSV_1_0),
        .io_in_QSV_1_1(w_h1_QSV_1_1),
        .io_in_QSV_2_0(w_h1_QSV_2_0),
        .io_in_QSV_2_1(w_h1_QSV_2_1),
        .io_in_QSV_3_0(w_h1_QSV_3_0),
        .io_in_QSV_3_1(w_h1_QSV_3_1),
        .io_in_valid(w_h1_valid),
        .io_out_QSV_0_0(w_perm2_QSV_0_0),
        .io_out_QSV_0_1(w_perm2_QSV_0_1),
        .io_out_QSV_1_0(w_perm2_QSV_1_0),
        .io_out_QSV_1_1(w_perm2_QSV_1_1),
        .io_out_QSV_2_0(w_perm2_QSV_2_0),
        .io_out_QSV_2_1(w_perm2_QSV_2_1),
        .io_out_QSV_3_0(w_perm2_QSV_3_0),
        .io_out_QSV_3_1(w_perm2_QSV_3_1),
        .io_out_valid(w_perm2_valid)
    );

    SWGate2QubitVector16bit m_4 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(w_perm2_QSV_0_0),
        .io_in_QSV_0_1(w_perm2_QSV_0_1),
        .io_in_QSV_1_0(w_perm2_QSV_1_0),
        .io_in_QSV_1_1(w_perm2_QSV_1_1),
        .io_in_QSV_2_0(w_perm2_QSV_2_0),
        .io_in_QSV_2_1(w_perm2_QSV_2_1),
        .io_in_QSV_3_0(w_perm2_QSV_3_0),
        .io_in_QSV_3_1(w_perm2_QSV_3_1),
        .io_in_valid(w_perm2_valid),
        .io_out_QSV_0_0(io_out_QSV_0_0),
        .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0),
        .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0),
        .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0),
        .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_valid(io_out_valid)
    );

endmodule
