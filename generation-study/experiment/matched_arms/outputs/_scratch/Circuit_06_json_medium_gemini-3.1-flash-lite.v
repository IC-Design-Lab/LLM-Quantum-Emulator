module Circuit_06(
    input  clock,
    input  reset,
    input  [15:0] io_in_QSV_0_0,
    input  [15:0] io_in_QSV_0_1,
    input  [15:0] io_in_QSV_1_0,
    input  [15:0] io_in_QSV_1_1,
    input  [15:0] io_in_QSV_2_0,
    input  [15:0] io_in_QSV_2_1,
    input  [15:0] io_in_QSV_3_0,
    input  [15:0] io_in_QSV_3_1,
    input  io_in_valid,
    output [15:0] io_out_QSV_0_0,
    output [15:0] io_out_QSV_0_1,
    output [15:0] io_out_QSV_1_0,
    output [15:0] io_out_QSV_1_1,
    output [15:0] io_out_QSV_2_0,
    output [15:0] io_out_QSV_2_1,
    output [15:0] io_out_QSV_3_0,
    output [15:0] io_out_QSV_3_1,
    output io_out_valid
);

    // Intermediate wires for step 0 (HGate)
    wire [15:0] m_0_out_0_0, m_0_out_0_1, m_0_out_1_0, m_0_out_1_1, m_0_out_2_0, m_0_out_2_1, m_0_out_3_0, m_0_out_3_1;
    wire m_0_out_valid;

    // Step 0: H on qubit 0 (No Permutation)
    HGate2QubitVector16bit m_0 (
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
        .io_out_QSV_0_0(m_0_out_0_0),
        .io_out_QSV_0_1(m_0_out_0_1),
        .io_out_QSV_1_0(m_0_out_1_0),
        .io_out_QSV_1_1(m_0_out_1_1),
        .io_out_QSV_2_0(m_0_out_2_0),
        .io_out_QSV_2_1(m_0_out_2_1),
        .io_out_QSV_3_0(m_0_out_3_0),
        .io_out_QSV_3_1(m_0_out_3_1),
        .io_out_valid(m_0_out_valid)
    );

    // Intermediate wires for Permutation
    wire [15:0] p1_out_0_0, p1_out_0_1, p1_out_1_0, p1_out_1_1, p1_out_2_0, p1_out_2_1, p1_out_3_0, p1_out_3_1;
    wire p1_out_valid;

    CompatiblePerm m_perm1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m_0_out_0_0), .io_in_QSV_0_1(m_0_out_0_1),
        .io_in_QSV_1_0(m_0_out_1_0), .io_in_QSV_1_1(m_0_out_1_1),
        .io_in_QSV_2_0(m_0_out_2_0), .io_in_QSV_2_1(m_0_out_2_1),
        .io_in_QSV_3_0(m_0_out_3_0), .io_in_QSV_3_1(m_0_out_3_1),
        .io_in_valid(m_0_out_valid),
        .io_out_QSV_0_0(p1_out_0_0), .io_out_QSV_0_1(p1_out_0_1),
        .io_out_QSV_1_0(p1_out_1_0), .io_out_QSV_1_1(p1_out_1_1),
        .io_out_QSV_2_0(p1_out_2_0), .io_out_QSV_2_1(p1_out_2_1),
        .io_out_QSV_3_0(p1_out_3_0), .io_out_QSV_3_1(p1_out_3_1),
        .io_out_valid(p1_out_valid)
    );

    // Step 1: CX on qubits 0, 1
    wire [15:0] m_1_out_0_0, m_1_out_0_1, m_1_out_1_0, m_1_out_1_1, m_1_out_2_0, m_1_out_2_1, m_1_out_3_0, m_1_out_3_1;
    wire m_1_out_valid;

    CNGate2QubitVector16bit m_1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(p1_out_0_0), .io_in_QSV_0_1(p1_out_0_1),
        .io_in_QSV_1_0(p1_out_1_0), .io_in_QSV_1_1(p1_out_1_1),
        .io_in_QSV_2_0(p1_out_2_0), .io_in_QSV_2_1(p1_out_2_1),
        .io_in_QSV_3_0(p1_out_3_0), .io_in_QSV_3_1(p1_out_3_1),
        .io_in_valid(p1_out_valid),
        .io_out_QSV_0_0(m_1_out_0_0), .io_out_QSV_0_1(m_1_out_0_1),
        .io_out_QSV_1_0(m_1_out_1_0), .io_out_QSV_1_1(m_1_out_1_1),
        .io_out_QSV_2_0(m_1_out_2_0), .io_out_QSV_2_1(m_1_out_2_1),
        .io_out_QSV_3_0(m_1_out_3_0), .io_out_QSV_3_1(m_1_out_3_1),
        .io_out_valid(m_1_out_valid)
    );

    // Post-CX Permutation
    CompatiblePerm m_perm2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m_1_out_0_0), .io_in_QSV_0_1(m_1_out_0_1),
        .io_in_QSV_1_0(m_1_out_1_0), .io_in_QSV_1_1(m_1_out_1_1),
        .io_in_QSV_2_0(m_1_out_2_0), .io_in_QSV_2_1(m_1_out_2_1),
        .io_in_QSV_3_0(m_1_out_3_0), .io_in_QSV_3_1(m_1_out_3_1),
        .io_in_valid(m_1_out_valid),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_valid(io_out_valid)
    );

endmodule
