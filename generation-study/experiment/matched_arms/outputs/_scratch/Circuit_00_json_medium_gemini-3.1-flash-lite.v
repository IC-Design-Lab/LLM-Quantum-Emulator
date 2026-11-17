module Circuit_00 (
    input  logic        clock,
    input  logic        reset,
    input  logic [15:0] io_in_QSV_0_0,
    input  logic [15:0] io_in_QSV_0_1,
    input  logic [15:0] io_in_QSV_1_0,
    input  logic [15:0] io_in_QSV_1_1,
    input  logic [15:0] io_in_QSV_2_0,
    input  logic [15:0] io_in_QSV_2_1,
    input  logic [15:0] io_in_QSV_3_0,
    input  logic [15:0] io_in_QSV_3_1,
    input  logic        io_in_valid,
    output logic [15:0] io_out_QSV_0_0,
    output logic [15:0] io_out_QSV_0_1,
    output logic [15:0] io_out_QSV_1_0,
    output logic [15:0] io_out_QSV_1_1,
    output logic [15:0] io_out_QSV_2_0,
    output logic [15:0] io_out_QSV_2_1,
    output logic [15:0] io_out_QSV_3_0,
    output logic [15:0] io_out_QSV_3_1,
    output logic        io_out_valid
);

    logic [15:0] m_io_out_QSV_0_0, m_io_out_QSV_0_1;
    logic [15:0] m_io_out_QSV_1_0, m_io_out_QSV_1_1;
    logic [15:0] m_io_out_QSV_2_0, m_io_out_QSV_2_1;
    logic [15:0] m_io_out_QSV_3_0, m_io_out_QSV_3_1;
    logic        m_io_out_valid;

    // Step 0: H on Qubit 0
    // Wrapper note: H on qubit 0 maps to inputs 0/1 and 2/3 respectively in a 2-qubit vector
    // HGate2QubitVector16bit takes all 4 amplitudes.
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
        .io_out_QSV_0_0(m_io_out_QSV_0_0),
        .io_out_QSV_0_1(m_io_out_QSV_0_1),
        .io_out_QSV_1_0(m_io_out_QSV_1_0),
        .io_out_QSV_1_1(m_io_out_QSV_1_1),
        .io_out_QSV_2_0(m_io_out_QSV_2_0),
        .io_out_QSV_2_1(m_io_out_QSV_2_1),
        .io_out_QSV_3_0(m_io_out_QSV_3_0),
        .io_out_QSV_3_1(m_io_out_QSV_3_1),
        .io_out_valid(m_io_out_valid)
    );

    // Step 1: SWAP
    SWGate2QubitVector16bit m_1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m_io_out_QSV_0_0),
        .io_in_QSV_0_1(m_io_out_QSV_0_1),
        .io_in_QSV_1_0(m_io_out_QSV_1_0),
        .io_in_QSV_1_1(m_io_out_QSV_1_1),
        .io_in_QSV_2_0(m_io_out_QSV_2_0),
        .io_in_QSV_2_1(m_io_out_QSV_2_1),
        .io_in_QSV_3_0(m_io_out_QSV_3_0),
        .io_in_QSV_3_1(m_io_out_QSV_3_1),
        .io_in_valid(m_io_out_valid),
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
