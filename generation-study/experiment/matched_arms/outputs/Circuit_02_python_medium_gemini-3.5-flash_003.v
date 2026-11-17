module Circuit_02 (
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

    // Intermediate signals
    wire [15:0] m1_out_0_0, m1_out_0_1, m1_out_1_0, m1_out_1_1, m1_out_2_0, m1_out_2_1, m1_out_3_0, m1_out_3_1;
    wire m1_out_valid;

    wire [15:0] m2_out_0_0, m2_out_0_1, m2_out_1_0, m2_out_1_1, m2_out_2_0, m2_out_2_1, m2_out_3_0, m2_out_3_1;
    wire m2_out_valid;

    wire [15:0] m3_out_0_0, m3_out_0_1, m3_out_1_0, m3_out_1_1, m3_out_2_0, m3_out_2_1, m3_out_3_0, m3_out_3_1;
    wire m3_out_valid;

    wire [15:0] m4_out_0_0, m4_out_0_1, m4_out_1_0, m4_out_1_1, m4_out_2_0, m4_out_2_1, m4_out_3_0, m4_out_3_1;
    wire m4_out_valid;

    // m_1: HadamardGate (H on qubit 0)
    HGate2QubitVector16bit m_1 (
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
        .io_out_QSV_0_0(m1_out_0_0),
        .io_out_QSV_0_1(m1_out_0_1),
        .io_out_QSV_1_0(m1_out_1_0),
        .io_out_QSV_1_1(m1_out_1_1),
        .io_out_QSV_2_0(m1_out_2_0),
        .io_out_QSV_2_1(m1_out_2_1),
        .io_out_QSV_3_0(m1_out_3_0),
        .io_out_QSV_3_1(m1_out_3_1),
        .io_out_valid(m1_out_valid)
    );

    // m_2: CompatiblePerm (Permutation before H on qubit 1)
    CompatiblePerm m_2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m1_out_0_0),
        .io_in_QSV_0_1(m1_out_0_1),
        .io_in_QSV_1_0(m1_out_1_0),
        .io_in_QSV_1_1(m1_out_1_1),
        .io_in_QSV_2_0(m1_out_2_0),
        .io_in_QSV_2_1(m1_out_2_1),
        .io_in_QSV_3_0(m1_out_3_0),
        .io_in_QSV_3_1(m1_out_3_1),
        .io_in_valid(m1_out_valid),
        .io_out_QSV_0_0(m2_out_0_0),
        .io_out_QSV_0_1(m2_out_0_1),
        .io_out_QSV_1_0(m2_out_1_0),
        .io_out_QSV_1_1(m2_out_1_1),
        .io_out_QSV_2_0(m2_out_2_0),
        .io_out_QSV_2_1(m2_out_2_1),
        .io_out_QSV_3_0(m2_out_3_0),
        .io_out_QSV_3_1(m2_out_3_1),
        .io_out_valid(m2_out_valid)
    );

    // m_3: HadamardGate (H on qubit 1)
    HGate2QubitVector16bit m_3 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m2_out_0_0),
        .io_in_QSV_0_1(m2_out_0_1),
        .io_in_QSV_1_0(m2_out_1_0),
        .io_in_QSV_1_1(m2_out_1_1),
        .io_in_QSV_2_0(m2_out_2_0),
        .io_in_QSV_2_1(m2_out_2_1),
        .io_in_QSV_3_0(m2_out_3_0),
        .io_in_QSV_3_1(m2_out_3_1),
        .io_in_valid(m2_out_valid),
        .io_out_QSV_0_0(m3_out_0_0),
        .io_out_QSV_0_1(m3_out_0_1),
        .io_out_QSV_1_0(m3_out_1_0),
        .io_out_QSV_1_1(m3_out_1_1),
        .io_out_QSV_2_0(m3_out_2_0),
        .io_out_QSV_2_1(m3_out_2_1),
        .io_out_QSV_3_0(m3_out_3_0),
        .io_out_QSV_3_1(m3_out_3_1),
        .io_out_valid(m3_out_valid)
    );

    // m_4: CompatiblePerm (Permutation after H on qubit 1)
    CompatiblePerm m_4 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m3_out_0_0),
        .io_in_QSV_0_1(m3_out_0_1),
        .io_in_QSV_1_0(m3_out_1_0),
        .io_in_QSV_1_1(m3_out_1_1),
        .io_in_QSV_2_0(m3_out_2_0),
        .io_in_QSV_2_1(m3_out_2_1),
        .io_in_QSV_3_0(m3_out_3_0),
        .io_in_QSV_3_1(m3_out_3_1),
        .io_in_valid(m3_out_valid),
        .io_out_QSV_0_0(m4_out_0_0),
        .io_out_QSV_0_1(m4_out_0_1),
        .io_out_QSV_1_0(m4_out_1_0),
        .io_out_QSV_1_1(m4_out_1_1),
        .io_out_QSV_2_0(m4_out_2_0),
        .io_out_QSV_2_1(m4_out_2_1),
        .io_out_QSV_3_0(m4_out_3_0),
        .io_out_QSV_3_1(m4_out_3_1),
        .io_out_valid(m4_out_valid)
    );

    // m_5: SwapGate (SWAP)
    SWGate2QubitVector16bit m_5 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m4_out_0_0),
        .io_in_QSV_0_1(m4_out_0_1),
        .io_in_QSV_1_0(m4_out_1_0),
        .io_in_QSV_1_1(m4_out_1_1),
        .io_in_QSV_2_0(m4_out_2_0),
        .io_in_QSV_2_1(m4_out_2_1),
        .io_in_QSV_3_0(m4_out_3_0),
        .io_in_QSV_3_1(m4_out_3_1),
        .io_in_valid(m4_out_valid),
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
