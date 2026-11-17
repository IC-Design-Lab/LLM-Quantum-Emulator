module Circuit_07 (
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

    wire [15:0] m_0_out_0_0, m_0_out_0_1, m_0_out_1_0, m_0_out_1_1;
    wire [15:0] m_0_out_2_0, m_0_out_2_1, m_0_out_3_0, m_0_out_3_1;
    wire m_0_valid;

    // Step 0: H on qubit 0 (needs no permutation)
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
        .io_out_QSV_0_0(m_0_out_0_0),
        .io_out_QSV_0_1(m_0_out_0_1),
        .io_out_QSV_1_0(m_0_out_1_0),
        .io_out_QSV_1_1(m_0_out_1_1),
        .io_out_QSV_2_0(m_0_out_2_0),
        .io_out_QSV_2_1(m_0_out_2_1),
        .io_out_QSV_3_0(m_0_out_3_0),
        .io_out_QSV_3_1(m_0_out_3_1),
        .io_out_valid(m_0_valid)
    );

    wire [15:0] m_1_out_0_0, m_1_out_0_1, m_1_out_1_0, m_1_out_1_1;
    wire [15:0] m_1_out_2_0, m_1_out_2_1, m_1_out_3_0, m_1_out_3_1;
    wire m_1_valid;

    // Step 1: CX (targets qubit 1, so needs permutation)
    // Note: CX is a 2-qubit gate, wrapper handles it. 
    CNGate2QubitVector16bit m_1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m_0_out_0_0),
        .io_in_QSV_0_1(m_0_out_0_1),
        .io_in_QSV_1_0(m_0_out_1_0),
        .io_in_QSV_1_1(m_0_out_1_1),
        .io_in_QSV_2_0(m_0_out_2_0),
        .io_in_QSV_2_1(m_0_out_2_1),
        .io_in_QSV_3_0(m_0_out_3_0),
        .io_in_QSV_3_1(m_0_out_3_1),
        .io_in_valid(m_0_valid),
        .io_out_QSV_0_0(m_1_out_0_0),
        .io_out_QSV_0_1(m_1_out_0_1),
        .io_out_QSV_1_0(m_1_out_1_0),
        .io_out_QSV_1_1(m_1_out_1_1),
        .io_out_QSV_2_0(m_1_out_2_0),
        .io_out_QSV_2_1(m_1_out_2_1),
        .io_out_QSV_3_0(m_1_out_3_0),
        .io_out_QSV_3_1(m_1_out_3_1),
        .io_out_valid(m_1_valid)
    );

    // Step 2: H on qubit 0 (needs no permutation)
    HGate2QubitVector16bit m_2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(m_1_out_0_0),
        .io_in_QSV_0_1(m_1_out_0_1),
        .io_in_QSV_1_0(m_1_out_1_0),
        .io_in_QSV_1_1(m_1_out_1_1),
        .io_in_QSV_2_0(m_1_out_2_0),
        .io_in_QSV_2_1(m_1_out_2_1),
        .io_in_QSV_3_0(m_1_out_3_0),
        .io_in_QSV_3_1(m_1_out_3_1),
        .io_in_valid(m_1_valid),
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
