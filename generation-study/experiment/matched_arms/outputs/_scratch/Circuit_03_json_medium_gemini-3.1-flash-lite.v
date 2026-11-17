module Circuit_03 (
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

    logic [15:0] m_0_out_QSV_0_0, m_0_out_QSV_0_1, m_0_out_QSV_1_0, m_0_out_QSV_1_1, m_0_out_QSV_2_0, m_0_out_QSV_2_1, m_0_out_QSV_3_0, m_0_out_QSV_3_1;
    logic m_0_valid;
    logic [15:0] p_1_out_QSV_0_0, p_1_out_QSV_0_1, p_1_out_QSV_1_0, p_1_out_QSV_1_1, p_1_out_QSV_2_0, p_1_out_QSV_2_1, p_1_out_QSV_3_0, p_1_out_QSV_3_1;
    logic p_1_valid;
    logic [15:0] m_1_out_QSV_0_0, m_1_out_QSV_0_1, m_1_out_QSV_1_0, m_1_out_QSV_1_1, m_1_out_QSV_2_0, m_1_out_QSV_2_1, m_1_out_QSV_3_0, m_1_out_QSV_3_1;
    logic m_1_valid;
    logic [15:0] m_2_out_QSV_0_0, m_2_out_QSV_0_1, m_2_out_QSV_1_0, m_2_out_QSV_1_1, m_2_out_QSV_2_0, m_2_out_QSV_2_1, m_2_out_QSV_3_0, m_2_out_QSV_3_1;
    logic m_2_valid;
    logic [15:0] p_2_out_QSV_0_0, p_2_out_QSV_0_1, p_2_out_QSV_1_0, p_2_out_QSV_1_1, p_2_out_QSV_2_0, p_2_out_QSV_2_1, p_2_out_QSV_3_0, p_2_out_QSV_3_1;
    logic p_2_valid;
    logic [15:0] m_3_out_QSV_0_0, m_3_out_QSV_0_1, m_3_out_QSV_1_0, m_3_out_QSV_1_1, m_3_out_QSV_2_0, m_3_out_QSV_2_1, m_3_out_QSV_3_0, m_3_out_QSV_3_1;
    logic m_3_valid;

    HGate2QubitVector16bit m_0 (
        .clock(clock), .reset(reset), .io_in_valid(io_in_valid),
        .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
        .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
        .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_out_QSV_0_0(m_0_out_QSV_0_0), .io_out_QSV_0_1(m_0_out_QSV_0_1),
        .io_out_QSV_1_0(m_0_out_QSV_1_0), .io_out_QSV_1_1(m_0_out_QSV_1_1),
        .io_out_QSV_2_0(m_0_out_QSV_2_0), .io_out_QSV_2_1(m_0_out_QSV_2_1),
        .io_out_QSV_3_0(m_0_out_QSV_3_0), .io_out_QSV_3_1(m_0_out_QSV_3_1),
        .io_out_valid(m_0_valid)
    );

    CompatiblePerm p_1 (
        .clock(clock), .reset(reset), .io_in_valid(m_0_valid),
        .io_in_QSV_0_0(m_0_out_QSV_0_0), .io_in_QSV_0_1(m_0_out_QSV_0_1),
        .io_in_QSV_1_0(m_0_out_QSV_1_0), .io_in_QSV_1_1(m_0_out_QSV_1_1),
        .io_in_QSV_2_0(m_0_out_QSV_2_0), .io_in_QSV_2_1(m_0_out_QSV_2_1),
        .io_in_QSV_3_0(m_0_out_QSV_3_0), .io_in_QSV_3_1(m_0_out_QSV_3_1),
        .io_out_QSV_0_0(p_1_out_QSV_0_0), .io_out_QSV_0_1(p_1_out_QSV_0_1),
        .io_out_QSV_1_0(p_1_out_QSV_1_0), .io_out_QSV_1_1(p_1_out_QSV_1_1),
        .io_out_QSV_2_0(p_1_out_QSV_2_0), .io_out_QSV_2_1(p_1_out_QSV_2_1),
        .io_out_QSV_3_0(p_1_out_QSV_3_0), .io_out_QSV_3_1(p_1_out_QSV_3_1),
        .io_out_valid(p_1_valid)
    );

    XGate2QubitVector16bit m_1 (
        .clock(clock), .reset(reset), .io_in_valid(p_1_valid),
        .io_in_QSV_0_0(p_1_out_QSV_0_0), .io_in_QSV_0_1(p_1_out_QSV_0_1),
        .io_in_QSV_1_0(p_1_out_QSV_1_0), .io_in_QSV_1_1(p_1_out_QSV_1_1),
        .io_in_QSV_2_0(p_1_out_QSV_2_0), .io_in_QSV_2_1(p_1_out_QSV_2_1),
        .io_in_QSV_3_0(p_1_out_QSV_3_0), .io_in_QSV_3_1(p_1_out_QSV_3_1),
        .io_out_QSV_0_0(m_1_out_QSV_0_0), .io_out_QSV_0_1(m_1_out_QSV_0_1),
        .io_out_QSV_1_0(m_1_out_QSV_1_0), .io_out_QSV_1_1(m_1_out_QSV_1_1),
        .io_out_QSV_2_0(m_1_out_QSV_2_0), .io_out_QSV_2_1(m_1_out_QSV_2_1),
        .io_out_QSV_3_0(m_1_out_QSV_3_0), .io_out_QSV_3_1(m_1_out_QSV_3_1),
        .io_out_valid(m_1_valid)
    );

    HGate2QubitVector16bit m_2 (
        .clock(clock), .reset(reset), .io_in_valid(m_1_valid),
        .io_in_QSV_0_0(m_1_out_QSV_0_0), .io_in_QSV_0_1(m_1_out_QSV_0_1),
        .io_in_QSV_1_0(m_1_out_QSV_1_0), .io_in_QSV_1_1(m_1_out_QSV_1_1),
        .io_in_QSV_2_0(m_1_out_QSV_2_0), .io_in_QSV_2_1(m_1_out_QSV_2_1),
        .io_in_QSV_3_0(m_1_out_QSV_3_0), .io_in_QSV_3_1(m_1_out_QSV_3_1),
        .io_out_QSV_0_0(m_2_out_QSV_0_0), .io_out_QSV_0_1(m_2_out_QSV_0_1),
        .io_out_QSV_1_0(m_2_out_QSV_1_0), .io_out_QSV_1_1(m_2_out_QSV_1_1),
        .io_out_QSV_2_0(m_2_out_QSV_2_0), .io_out_QSV_2_1(m_2_out_QSV_2_1),
        .io_out_QSV_3_0(m_2_out_QSV_3_0), .io_out_QSV_3_1(m_2_out_QSV_3_1),
        .io_out_valid(m_2_valid)
    );

    CompatiblePerm p_2 (
        .clock(clock), .reset(reset), .io_in_valid(m_2_valid),
        .io_in_QSV_0_0(m_2_out_QSV_0_0), .io_in_QSV_0_1(m_2_out_QSV_0_1),
        .io_in_QSV_1_0(m_2_out_QSV_1_0), .io_in_QSV_1_1(m_2_out_QSV_1_1),
        .io_in_QSV_2_0(m_2_out_QSV_2_0), .io_in_QSV_2_1(m_2_out_QSV_2_1),
        .io_in_QSV_3_0(m_2_out_QSV_3_0), .io_in_QSV_3_1(m_2_out_QSV_3_1),
        .io_out_QSV_0_0(p_2_out_QSV_0_0), .io_out_QSV_0_1(p_2_out_QSV_0_1),
        .io_out_QSV_1_0(p_2_out_QSV_1_0), .io_out_QSV_1_1(p_2_out_QSV_1_1),
        .io_out_QSV_2_0(p_2_out_QSV_2_0), .io_out_QSV_2_1(p_2_out_QSV_2_1),
        .io_out_QSV_3_0(p_2_out_QSV_3_0), .io_out_QSV_3_1(p_2_out_QSV_3_1),
        .io_out_valid(p_2_valid)
    );

    SWGate2QubitVector16bit m_3 (
        .clock(clock), .reset(reset), .io_in_valid(p_2_valid),
        .io_in_QSV_0_0(p_2_out_QSV_0_0), .io_in_QSV_0_1(p_2_out_QSV_0_1),
        .io_in_QSV_1_0(p_2_out_QSV_1_0), .io_in_QSV_1_1(p_2_out_QSV_1_1),
        .io_in_QSV_2_0(p_2_out_QSV_2_0), .io_in_QSV_2_1(p_2_out_QSV_2_1),
        .io_in_QSV_3_0(p_2_out_QSV_3_0), .io_in_QSV_3_1(p_2_out_QSV_3_1),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_valid(io_out_valid)
    );

endmodule
