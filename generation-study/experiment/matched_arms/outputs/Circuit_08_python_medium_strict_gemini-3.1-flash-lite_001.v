module Circuit_08 (
    input wire clock,
    input wire reset,
    input wire [15:0] io_in_QSV_0_0,
    input wire [15:0] io_in_QSV_0_1,
    input wire [15:0] io_in_QSV_1_0,
    input wire [15:0] io_in_QSV_1_1,
    input wire [15:0] io_in_QSV_2_0,
    input wire [15:0] io_in_QSV_2_1,
    input wire [15:0] io_in_QSV_3_0,
    input wire [15:0] io_in_QSV_3_1,
    input wire io_in_valid,
    output wire [15:0] io_out_QSV_0_0,
    output wire [15:0] io_out_QSV_0_1,
    output wire [15:0] io_out_QSV_1_0,
    output wire [15:0] io_out_QSV_1_1,
    output wire [15:0] io_out_QSV_2_0,
    output wire [15:0] io_out_QSV_2_1,
    output wire [15:0] io_out_QSV_3_0,
    output wire [15:0] io_out_QSV_3_1,
    output wire io_out_valid
);

    // Intermediate wires for pipeline
    wire [15:0] m_io_out_QSV_0_0, m_io_out_QSV_0_1, m_io_out_QSV_1_0, m_io_out_QSV_1_1;
    wire [15:0] m_io_out_QSV_2_0, m_io_out_QSV_2_1, m_io_out_QSV_3_0, m_io_out_QSV_3_1;
    wire m_io_out_valid;

    wire [15:0] m1_io_out_QSV_0_0, m1_io_out_QSV_0_1, m1_io_out_QSV_1_0, m1_io_out_QSV_1_1;
    wire [15:0] m1_io_out_QSV_2_0, m1_io_out_QSV_2_1, m1_io_out_QSV_3_0, m1_io_out_QSV_3_1;
    wire m1_io_out_valid;

    // Stage 0: H(0) - Targeting qubit 0, no permutation needed
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

    // Stage 1: CX(0, 1) - CNOT on qubits 0 and 1, no permutation needed
    CNGate2QubitVector16bit m1 (
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
        .io_out_QSV_0_0(m1_io_out_QSV_0_0),
        .io_out_QSV_0_1(m1_io_out_QSV_0_1),
        .io_out_QSV_1_0(m1_io_out_QSV_1_0),
        .io_out_QSV_1_1(m1_io_out_QSV_1_1),
        .io_out_QSV_2_0(m1_io_out_QSV_2_0),
        .io_out_QSV_2_1(m1_io_out_QSV_2_1),
        .io_out_QSV_3_0(m1_io_out_QSV_3_0),
        .io_out_QSV_3_1(m1_io_out_QSV_3_1),
        .io_out_valid(m1_io_out_valid)
    );

    // Stage 2: SX(0) - Targeting qubit 0, no permutation needed
    SXGate2QubitVector16bit m2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m1_io_out_QSV_0_0),
        .io_in_QSV_0_1(m1_io_out_QSV_0_1),
        .io_in_QSV_1_0(m1_io_out_QSV_1_0),
        .io_in_QSV_1_1(m1_io_out_QSV_1_1),
        .io_in_QSV_2_0(m1_io_out_QSV_2_0),
        .io_in_QSV_2_1(m1_io_out_QSV_2_1),
        .io_in_QSV_3_0(m1_io_out_QSV_3_0),
        .io_in_QSV_3_1(m1_io_out_QSV_3_1),
        .io_in_valid(m1_io_out_valid),
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
