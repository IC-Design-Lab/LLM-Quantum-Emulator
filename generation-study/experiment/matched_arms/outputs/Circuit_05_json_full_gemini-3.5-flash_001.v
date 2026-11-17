module Circuit_05 (
    input  wire         clock,
    input  wire         reset,
    input  wire [15:0]  io_in_QSV_0_0,
    input  wire [15:0]  io_in_QSV_0_1,
    input  wire [15:0]  io_in_QSV_1_0,
    input  wire [15:0]  io_in_QSV_1_1,
    input  wire [15:0]  io_in_QSV_2_0,
    input  wire [15:0]  io_in_QSV_2_1,
    input  wire [15:0]  io_in_QSV_3_0,
    input  wire [15:0]  io_in_QSV_3_1,
    input  wire         io_in_valid,
    output wire [15:0]  io_out_QSV_0_0,
    output wire [15:0]  io_out_QSV_0_1,
    output wire [15:0]  io_out_QSV_1_0,
    output wire [15:0]  io_out_QSV_1_1,
    output wire [15:0]  io_out_QSV_2_0,
    output wire [15:0]  io_out_QSV_2_1,
    output wire [15:0]  io_out_QSV_3_0,
    output wire [15:0]  io_out_QSV_3_1,
    output wire         io_out_valid
);

    // Intermediate Wires
    wire [15:0] m_io_out_QSV_0_0, m_io_out_QSV_0_1, m_io_out_QSV_1_0, m_io_out_QSV_1_1, m_io_out_QSV_2_0, m_io_out_QSV_2_1, m_io_out_QSV_3_0, m_io_out_QSV_3_1;
    wire        m_io_out_valid;

    wire [15:0] m_1_io_out_QSV_0_0, m_1_io_out_QSV_0_1, m_1_io_out_QSV_1_0, m_1_io_out_QSV_1_1, m_1_io_out_QSV_2_0, m_1_io_out_QSV_2_1, m_1_io_out_QSV_3_0, m_1_io_out_QSV_3_1;
    wire        m_1_io_out_valid;

    wire [15:0] m_2_io_out_QSV_0_0, m_2_io_out_QSV_0_1, m_2_io_out_QSV_1_0, m_2_io_out_QSV_1_1, m_2_io_out_QSV_2_0, m_2_io_out_QSV_2_1, m_2_io_out_QSV_3_0, m_2_io_out_QSV_3_1;
    wire        m_2_io_out_valid;

    wire [15:0] m_3_io_out_QSV_0_0, m_3_io_out_QSV_0_1, m_3_io_out_QSV_1_0, m_3_io_out_QSV_1_1, m_3_io_out_QSV_2_0, m_3_io_out_QSV_2_1, m_3_io_out_QSV_3_0, m_3_io_out_QSV_3_1;
    wire        m_3_io_out_valid;

    wire [15:0] m_4_io_out_QSV_0_0, m_4_io_out_QSV_0_1, m_4_io_out_QSV_1_0, m_4_io_out_QSV_1_1, m_4_io_out_QSV_2_0, m_4_io_out_QSV_2_1, m_4_io_out_QSV_3_0, m_4_io_out_QSV_3_1;
    wire        m_4_io_out_valid;

    // Stage 0: Hadamard Gate (q0)
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

    // Stage 1: CompatiblePerm (Permutation before target-q1 gate)
    CompatiblePerm m_1 (
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
        .io_out_QSV_0_0(m_1_io_out_QSV_0_0),
        .io_out_QSV_0_1(m_1_io_out_QSV_0_1),
        .io_out_QSV_1_0(m_1_io_out_QSV_1_0),
        .io_out_QSV_1_1(m_1_io_out_QSV_1_1),
        .io_out_QSV_2_0(m_1_io_out_QSV_2_0),
        .io_out_QSV_2_1(m_1_io_out_QSV_2_1),
        .io_out_QSV_3_0(m_1_io_out_QSV_3_0),
        .io_out_QSV_3_1(m_1_io_out_QSV_3_1),
        .io_out_valid(m_1_io_out_valid)
    );

    // Stage 2: Pauli-X Gate (q1)
    XGate2QubitVector16bit m_2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m_1_io_out_QSV_0_0),
        .io_in_QSV_0_1(m_1_io_out_QSV_0_1),
        .io_in_QSV_1_0(m_1_io_out_QSV_1_0),
        .io_in_QSV_1_1(m_1_io_out_QSV_1_1),
        .io_in_QSV_2_0(m_1_io_out_QSV_2_0),
        .io_in_QSV_2_1(m_1_io_out_QSV_2_1),
        .io_in_QSV_3_0(m_1_io_out_QSV_3_0),
        .io_in_QSV_3_1(m_1_io_out_QSV_3_1),
        .io_in_valid(m_1_io_out_valid),
        .io_out_QSV_0_0(m_2_io_out_QSV_0_0),
        .io_out_QSV_0_1(m_2_io_out_QSV_0_1),
        .io_out_QSV_1_0(m_2_io_out_QSV_1_0),
        .io_out_QSV_1_1(m_2_io_out_QSV_1_1),
        .io_out_QSV_2_0(m_2_io_out_QSV_2_0),
        .io_out_QSV_2_1(m_2_io_out_QSV_2_1),
        .io_out_QSV_3_0(m_2_io_out_QSV_3_0),
        .io_out_QSV_3_1(m_2_io_out_QSV_3_1),
        .io_out_valid(m_2_io_out_valid)
    );

    // Stage 3: SXDGate (q1)
    SXDGate2QubitVector16bit m_3 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m_2_io_out_QSV_0_0),
        .io_in_QSV_0_1(m_2_io_out_QSV_0_1),
        .io_in_QSV_1_0(m_2_io_out_QSV_1_0),
        .io_in_QSV_1_1(m_2_io_out_QSV_1_1),
        .io_in_QSV_2_0(m_2_io_out_QSV_2_0),
        .io_in_QSV_2_1(m_2_io_out_QSV_2_1),
        .io_in_QSV_3_0(m_2_io_out_QSV_3_0),
        .io_in_QSV_3_1(m_2_io_out_QSV_3_1),
        .io_in_valid(m_2_io_out_valid),
        .io_out_QSV_0_0(m_3_io_out_QSV_0_0),
        .io_out_QSV_0_1(m_3_io_out_QSV_0_1),
        .io_out_QSV_1_0(m_3_io_out_QSV_1_0),
        .io_out_QSV_1_1(m_3_io_out_QSV_1_1),
        .io_out_QSV_2_0(m_3_io_out_QSV_2_0),
        .io_out_QSV_2_1(m_3_io_out_QSV_2_1),
        .io_out_QSV_3_0(m_3_io_out_QSV_3_0),
        .io_out_QSV_3_1(m_3_io_out_QSV_3_1),
        .io_out_valid(m_3_io_out_valid)
    );

    // Stage 4: CompatiblePerm (Permutation after target-q1 gate)
    CompatiblePerm m_4 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m_3_io_out_QSV_0_0),
        .io_in_QSV_0_1(m_3_io_out_QSV_0_1),
        .io_in_QSV_1_0(m_3_io_out_QSV_1_0),
        .io_in_QSV_1_1(m_3_io_out_QSV_1_1),
        .io_in_QSV_2_0(m_3_io_out_QSV_2_0),
        .io_in_QSV_2_1(m_3_io_out_QSV_2_1),
        .io_in_QSV_3_0(m_3_io_out_QSV_3_0),
        .io_in_QSV_3_1(m_3_io_out_QSV_3_1),
        .io_in_valid(m_3_io_out_valid),
        .io_out_QSV_0_0(m_4_io_out_QSV_0_0),
        .io_out_QSV_0_1(m_4_io_out_QSV_0_1),
        .io_out_QSV_1_0(m_4_io_out_QSV_1_0),
        .io_out_QSV_1_1(m_4_io_out_QSV_1_1),
        .io_out_QSV_2_0(m_4_io_out_QSV_2_0),
        .io_out_QSV_2_1(m_4_io_out_QSV_2_1),
        .io_out_QSV_3_0(m_4_io_out_QSV_3_0),
        .io_out_QSV_3_1(m_4_io_out_QSV_3_1),
        .io_out_valid(m_4_io_out_valid)
    );

    // Stage 5: SWAP Gate (q0, q1)
    SWGate2QubitVector16bit m_5 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m_4_io_out_QSV_0_0),
        .io_in_QSV_0_1(m_4_io_out_QSV_0_1),
        .io_in_QSV_1_0(m_4_io_out_QSV_1_0),
        .io_in_QSV_1_1(m_4_io_out_QSV_1_1),
        .io_in_QSV_2_0(m_4_io_out_QSV_2_0),
        .io_in_QSV_2_1(m_4_io_out_QSV_2_1),
        .io_in_QSV_3_0(m_4_io_out_QSV_3_0),
        .io_in_QSV_3_1(m_4_io_out_QSV_3_1),
        .io_in_valid(m_4_io_out_valid),
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
