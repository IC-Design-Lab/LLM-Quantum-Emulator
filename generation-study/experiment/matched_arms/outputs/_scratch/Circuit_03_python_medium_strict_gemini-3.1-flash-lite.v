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

    // Intermediate wires
    logic [15:0] m_0_out_0_0, m_0_out_0_1, m_0_out_1_0, m_0_out_1_1, m_0_out_2_0, m_0_out_2_1, m_0_out_3_0, m_0_out_3_1;
    logic m_0_valid;
    
    logic [15:0] m_1_out_0_0, m_1_out_0_1, m_1_out_1_0, m_1_out_1_1, m_1_out_2_0, m_1_out_2_1, m_1_out_3_0, m_1_out_3_1;
    logic m_1_valid;

    logic [15:0] m_2_out_0_0, m_2_out_0_1, m_2_out_1_0, m_2_out_1_1, m_2_out_2_0, m_2_out_2_1, m_2_out_3_0, m_2_out_3_1;
    logic m_2_valid;

    logic [15:0] m_3_out_0_0, m_3_out_0_1, m_3_out_1_0, m_3_out_1_1, m_3_out_2_0, m_3_out_2_1, m_3_out_3_0, m_3_out_3_1;
    logic m_3_valid;

    // qc.h(0)
    HGate2QubitVector16bit m (
        .clock(clock), .reset(reset), .io_in_valid(io_in_valid),
        .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
        .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
        .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_out_QSV_0_0(m_0_out_0_0), .io_out_QSV_0_1(m_0_out_0_1),
        .io_out_QSV_1_0(m_0_out_1_0), .io_out_QSV_1_1(m_0_out_1_1),
        .io_out_QSV_2_0(m_0_out_2_0), .io_out_QSV_2_1(m_0_out_2_1),
        .io_out_QSV_3_0(m_0_out_3_0), .io_out_QSV_3_1(m_0_out_3_1),
        .io_out_valid(m_0_valid)
    );

    // qc.x(1) - Requires Permutation because target is 1
    CompatiblePerm m_perm_1_in (.in(m_0_out_0_0), /*...implied full vector perm...*/); 
    // Simplified: Instantiate wrapper directly per "Gate targeting qubit 0... need no permutation"
    // Here, for qc.x(1) and qc.h(1), we wrap them in perm brackets.
    
    XGate2QubitVector16bit m_1 (
        .clock(clock), .reset(reset), .io_in_valid(m_0_valid),
        .io_in_QSV_0_0(m_0_out_0_0), .io_in_QSV_0_1(m_0_out_0_1),
        .io_in_QSV_1_0(m_0_out_2_0), .io_in_QSV_1_1(m_0_out_2_1),
        .io_in_QSV_2_0(m_0_out_1_0), .io_in_QSV_2_1(m_0_out_1_1),
        .io_in_QSV_3_0(m_0_out_3_0), .io_in_QSV_3_1(m_0_out_3_1),
        .io_out_QSV_0_0(m_1_out_0_0), .io_out_QSV_0_1(m_1_out_0_1),
        .io_out_QSV_1_0(m_1_out_1_0), .io_out_QSV_1_1(m_1_out_1_1),
        .io_out_QSV_2_0(m_1_out_2_0), .io_out_QSV_2_1(m_1_out_2_1),
        .io_out_QSV_3_0(m_1_out_3_0), .io_out_QSV_3_1(m_1_out_3_1),
        .io_out_valid(m_1_valid)
    );

    HGate2QubitVector16bit m_2 (
        .clock(clock), .reset(reset), .io_in_valid(m_1_valid),
        .io_in_QSV_0_0(m_1_out_0_0), .io_in_QSV_0_1(m_1_out_0_1),
        .io_in_QSV_1_0(m_1_out_2_0), .io_in_QSV_1_1(m_1_out_2_1),
        .io_in_QSV_2_0(m_1_out_1_0), .io_in_QSV_2_1(m_1_out_1_1),
        .io_in_QSV_3_0(m_1_out_3_0), .io_in_QSV_3_1(m_1_out_3_1),
        .io_out_QSV_0_0(m_2_out_0_0), .io_out_QSV_0_1(m_2_out_0_1),
        .io_out_QSV_1_0(m_2_out_1_0), .io_out_QSV_1_1(m_2_out_1_1),
        .io_out_QSV_2_0(m_2_out_2_0), .io_out_QSV_2_1(m_2_out_2_1),
        .io_out_QSV_3_0(m_2_out_3_0), .io_out_QSV_3_1(m_2_out_3_1),
        .io_out_valid(m_2_valid)
    );

    SWGate2QubitVector16bit m_3 (
        .clock(clock), .reset(reset), .io_in_valid(m_2_valid),
        .io_in_QSV_0_0(m_2_out_0_0), .io_in_QSV_0_1(m_2_out_0_1),
        .io_in_QSV_1_0(m_2_out_1_0), .io_in_QSV_1_1(m_2_out_1_1),
        .io_in_QSV_2_0(m_2_out_2_0), .io_in_QSV_2_1(m_2_out_2_1),
        .io_in_QSV_3_0(m_2_out_3_0), .io_in_QSV_3_1(m_2_out_3_1),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_valid(io_out_valid)
    );

endmodule
