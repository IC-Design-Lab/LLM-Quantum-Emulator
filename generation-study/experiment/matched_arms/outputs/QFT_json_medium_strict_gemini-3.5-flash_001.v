module QFT (
    input  wire       clock,
    input  wire       reset,
    input  wire [7:0] io_in_QSV_0_0,
    input  wire [7:0] io_in_QSV_0_1,
    input  wire [7:0] io_in_QSV_1_0,
    input  wire [7:0] io_in_QSV_1_1,
    input  wire [7:0] io_in_QSV_2_0,
    input  wire [7:0] io_in_QSV_2_1,
    input  wire [7:0] io_in_QSV_3_0,
    input  wire [7:0] io_in_QSV_3_1,
    input  wire [7:0] io_in_QSV_4_0,
    input  wire [7:0] io_in_QSV_4_1,
    input  wire [7:0] io_in_QSV_5_0,
    input  wire [7:0] io_in_QSV_5_1,
    input  wire [7:0] io_in_QSV_6_0,
    input  wire [7:0] io_in_QSV_6_1,
    input  wire [7:0] io_in_QSV_7_0,
    input  wire [7:0] io_in_QSV_7_1,
    input  wire       io_in_valid,
    output wire [7:0] io_out_QSV_0_0,
    output wire [7:0] io_out_QSV_0_1,
    output wire [7:0] io_out_QSV_1_0,
    output wire [7:0] io_out_QSV_1_1,
    output wire [7:0] io_out_QSV_2_0,
    output wire [7:0] io_out_QSV_2_1,
    output wire [7:0] io_out_QSV_3_0,
    output wire [7:0] io_out_QSV_3_1,
    output wire [7:0] io_out_QSV_4_0,
    output wire [7:0] io_out_QSV_4_1,
    output wire [7:0] io_out_QSV_5_0,
    output wire [7:0] io_out_QSV_5_1,
    output wire [7:0] io_out_QSV_6_0,
    output wire [7:0] io_out_QSV_6_1,
    output wire [7:0] io_out_QSV_7_0,
    output wire [7:0] io_out_QSV_7_1,
    output wire       io_out_valid
);

    // Intermediate wires for m
    wire [7:0] _m_io_out_QSV_0_0;
    wire [7:0] _m_io_out_QSV_0_1;
    wire [7:0] _m_io_out_QSV_1_0;
    wire [7:0] _m_io_out_QSV_1_1;
    wire [7:0] _m_io_out_QSV_2_0;
    wire [7:0] _m_io_out_QSV_2_1;
    wire [7:0] _m_io_out_QSV_3_0;
    wire [7:0] _m_io_out_QSV_3_1;
    wire [7:0] _m_io_out_QSV_4_0;
    wire [7:0] _m_io_out_QSV_4_1;
    wire [7:0] _m_io_out_QSV_5_0;
    wire [7:0] _m_io_out_QSV_5_1;
    wire [7:0] _m_io_out_QSV_6_0;
    wire [7:0] _m_io_out_QSV_6_1;
    wire [7:0] _m_io_out_QSV_7_0;
    wire [7:0] _m_io_out_QSV_7_1;
    wire       _m_io_out_valid;

    // Intermediate wires for m_1
    wire [7:0] _m_1_io_out_QSV_0_0;
    wire [7:0] _m_1_io_out_QSV_0_1;
    wire [7:0] _m_1_io_out_QSV_1_0;
    wire [7:0] _m_1_io_out_QSV_1_1;
    wire [7:0] _m_1_io_out_QSV_2_0;
    wire [7:0] _m_1_io_out_QSV_2_1;
    wire [7:0] _m_1_io_out_QSV_3_0;
    wire [7:0] _m_1_io_out_QSV_3_1;
    wire [7:0] _m_1_io_out_QSV_4_0;
    wire [7:0] _m_1_io_out_QSV_4_1;
    wire [7:0] _m_1_io_out_QSV_5_0;
    wire [7:0] _m_1_io_out_QSV_5_1;
    wire [7:0] _m_1_io_out_QSV_6_0;
    wire [7:0] _m_1_io_out_QSV_6_1;
    wire [7:0] _m_1_io_out_QSV_7_0;
    wire [7:0] _m_1_io_out_QSV_7_1;
    wire       _m_1_io_out_valid;

    // Intermediate wires for m_2
    wire [7:0] _m_2_io_out_QSV_0_0;
    wire [7:0] _m_2_io_out_QSV_0_1;
    wire [7:0] _m_2_io_out_QSV_1_0;
    wire [7:0] _m_2_io_out_QSV_1_1;
    wire [7:0] _m_2_io_out_QSV_2_0;
    wire [7:0] _m_2_io_out_QSV_2_1;
    wire [7:0] _m_2_io_out_QSV_3_0;
    wire [7:0] _m_2_io_out_QSV_3_1;
    wire [7:0] _m_2_io_out_QSV_4_0;
    wire [7:0] _m_2_io_out_QSV_4_1;
    wire [7:0] _m_2_io_out_QSV_5_0;
    wire [7:0] _m_2_io_out_QSV_5_1;
    wire [7:0] _m_2_io_out_QSV_6_0;
    wire [7:0] _m_2_io_out_QSV_6_1;
    wire [7:0] _m_2_io_out_QSV_7_0;
    wire [7:0] _m_2_io_out_QSV_7_1;
    wire       _m_2_io_out_valid;

    // Intermediate wires for m_3
    wire [7:0] _m_3_io_out_QSV_0_0;
    wire [7:0] _m_3_io_out_QSV_0_1;
    wire [7:0] _m_3_io_out_QSV_1_0;
    wire [7:0] _m_3_io_out_QSV_1_1;
    wire [7:0] _m_3_io_out_QSV_2_0;
    wire [7:0] _m_3_io_out_QSV_2_1;
    wire [7:0] _m_3_io_out_QSV_3_0;
    wire [7:0] _m_3_io_out_QSV_3_1;
    wire [7:0] _m_3_io_out_QSV_4_0;
    wire [7:0] _m_3_io_out_QSV_4_1;
    wire [7:0] _m_3_io_out_QSV_5_0;
    wire [7:0] _m_3_io_out_QSV_5_1;
    wire [7:0] _m_3_io_out_QSV_6_0;
    wire [7:0] _m_3_io_out_QSV_6_1;
    wire [7:0] _m_3_io_out_QSV_7_0;
    wire [7:0] _m_3_io_out_QSV_7_1;
    wire       _m_3_io_out_valid;

    // Intermediate wires for m_4
    wire [7:0] _m_4_io_out_QSV_0_0;
    wire [7:0] _m_4_io_out_QSV_0_1;
    wire [7:0] _m_4_io_out_QSV_1_0;
    wire [7:0] _m_4_io_out_QSV_1_1;
    wire [7:0] _m_4_io_out_QSV_2_0;
    wire [7:0] _m_4_io_out_QSV_2_1;
    wire [7:0] _m_4_io_out_QSV_3_0;
    wire [7:0] _m_4_io_out_QSV_3_1;
    wire [7:0] _m_4_io_out_QSV_4_0;
    wire [7:0] _m_4_io_out_QSV_4_1;
    wire [7:0] _m_4_io_out_QSV_5_0;
    wire [7:0] _m_4_io_out_QSV_5_1;
    wire [7:0] _m_4_io_out_QSV_6_0;
    wire [7:0] _m_4_io_out_QSV_6_1;
    wire [7:0] _m_4_io_out_QSV_7_0;
    wire [7:0] _m_4_io_out_QSV_7_1;
    wire       _m_4_io_out_valid;

    // Intermediate wires for m_5
    wire [7:0] _m_5_io_out_QSV_0_0;
    wire [7:0] _m_5_io_out_QSV_0_1;
    wire [7:0] _m_5_io_out_QSV_1_0;
    wire [7:0] _m_5_io_out_QSV_1_1;
    wire [7:0] _m_5_io_out_QSV_2_0;
    wire [7:0] _m_5_io_out_QSV_2_1;
    wire [7:0] _m_5_io_out_QSV_3_0;
    wire [7:0] _m_5_io_out_QSV_3_1;
    wire [7:0] _m_5_io_out_QSV_4_0;
    wire [7:0] _m_5_io_out_QSV_4_1;
    wire [7:0] _m_5_io_out_QSV_5_0;
    wire [7:0] _m_5_io_out_QSV_5_1;
    wire [7:0] _m_5_io_out_QSV_6_0;
    wire [7:0] _m_5_io_out_QSV_6_1;
    wire [7:0] _m_5_io_out_QSV_7_0;
    wire [7:0] _m_5_io_out_QSV_7_1;
    wire       _m_5_io_out_valid;

    // Intermediate wires for m_6
    wire [7:0] _m_6_io_out_QSV_0_0;
    wire [7:0] _m_6_io_out_QSV_0_1;
    wire [7:0] _m_6_io_out_QSV_1_0;
    wire [7:0] _m_6_io_out_QSV_1_1;
    wire [7:0] _m_6_io_out_QSV_2_0;
    wire [7:0] _m_6_io_out_QSV_2_1;
    wire [7:0] _m_6_io_out_QSV_3_0;
    wire [7:0] _m_6_io_out_QSV_3_1;
    wire [7:0] _m_6_io_out_QSV_4_0;
    wire [7:0] _m_6_io_out_QSV_4_1;
    wire [7:0] _m_6_io_out_QSV_5_0;
    wire [7:0] _m_6_io_out_QSV_5_1;
    wire [7:0] _m_6_io_out_QSV_6_0;
    wire [7:0] _m_6_io_out_QSV_6_1;
    wire [7:0] _m_6_io_out_QSV_7_0;
    wire [7:0] _m_6_io_out_QSV_7_1;
    wire       _m_6_io_out_valid;

    // Intermediate wires for m_7
    wire [7:0] _m_7_io_out_QSV_0_0;
    wire [7:0] _m_7_io_out_QSV_0_1;
    wire [7:0] _m_7_io_out_QSV_1_0;
    wire [7:0] _m_7_io_out_QSV_1_1;
    wire [7:0] _m_7_io_out_QSV_2_0;
    wire [7:0] _m_7_io_out_QSV_2_1;
    wire [7:0] _m_7_io_out_QSV_3_0;
    wire [7:0] _m_7_io_out_QSV_3_1;
    wire [7:0] _m_7_io_out_QSV_4_0;
    wire [7:0] _m_7_io_out_QSV_4_1;
    wire [7:0] _m_7_io_out_QSV_5_0;
    wire [7:0] _m_7_io_out_QSV_5_1;
    wire [7:0] _m_7_io_out_QSV_6_0;
    wire [7:0] _m_7_io_out_QSV_6_1;
    wire [7:0] _m_7_io_out_QSV_7_0;
    wire [7:0] _m_7_io_out_QSV_7_1;
    wire       _m_7_io_out_valid;

    // Intermediate wires for m_8
    wire [7:0] _m_8_io_out_QSV_0_0;
    wire [7:0] _m_8_io_out_QSV_0_1;
    wire [7:0] _m_8_io_out_QSV_1_0;
    wire [7:0] _m_8_io_out_QSV_1_1;
    wire [7:0] _m_8_io_out_QSV_2_0;
    wire [7:0] _m_8_io_out_QSV_2_1;
    wire [7:0] _m_8_io_out_QSV_3_0;
    wire [7:0] _m_8_io_out_QSV_3_1;
    wire [7:0] _m_8_io_out_QSV_4_0;
    wire [7:0] _m_8_io_out_QSV_4_1;
    wire [7:0] _m_8_io_out_QSV_5_0;
    wire [7:0] _m_8_io_out_QSV_5_1;
    wire [7:0] _m_8_io_out_QSV_6_0;
    wire [7:0] _m_8_io_out_QSV_6_1;
    wire [7:0] _m_8_io_out_QSV_7_0;
    wire [7:0] _m_8_io_out_QSV_7_1;
    wire       _m_8_io_out_valid;

    // Intermediate wires for m_9
    wire [7:0] _m_9_io_out_QSV_0_0;
    wire [7:0] _m_9_io_out_QSV_0_1;
    wire [7:0] _m_9_io_out_QSV_1_0;
    wire [7:0] _m_9_io_out_QSV_1_1;
    wire [7:0] _m_9_io_out_QSV_2_0;
    wire [7:0] _m_9_io_out_QSV_2_1;
    wire [7:0] _m_9_io_out_QSV_3_0;
    wire [7:0] _m_9_io_out_QSV_3_1;
    wire [7:0] _m_9_io_out_QSV_4_0;
    wire [7:0] _m_9_io_out_QSV_4_1;
    wire [7:0] _m_9_io_out_QSV_5_0;
    wire [7:0] _m_9_io_out_QSV_5_1;
    wire [7:0] _m_9_io_out_QSV_6_0;
    wire [7:0] _m_9_io_out_QSV_6_1;
    wire [7:0] _m_9_io_out_QSV_7_0;
    wire [7:0] _m_9_io_out_QSV_7_1;
    wire       _m_9_io_out_valid;

    // Step 0: H on qubit 0 (Default position, no permutation)
    HGate3QubitVector8bit m (
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
        .io_in_QSV_4_0(io_in_QSV_4_0),
        .io_in_QSV_4_1(io_in_QSV_4_1),
        .io_in_QSV_5_0(io_in_QSV_5_0),
        .io_in_QSV_5_1(io_in_QSV_5_1),
        .io_in_QSV_6_0(io_in_QSV_6_0),
        .io_in_QSV_6_1(io_in_QSV_6_1),
        .io_in_QSV_7_0(io_in_QSV_7_0),
        .io_in_QSV_7_1(io_in_QSV_7_1),
        .io_in_valid(io_in_valid),
        .io_out_QSV_0_0(_m_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_io_out_QSV_7_1),
        .io_out_valid(_m_io_out_valid)
    );

    // Step 1: CS on qubits [1, 0] (Target is qubit 0, no permutation)
    CSGate3QubitVector8bit m_1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_io_out_QSV_3_0),
        .io_in_QSV_4_0(_m_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_io_out_QSV_7_0),
        .io_in_valid(_m_io_out_valid),
        .io_out_QSV_0_0(_m_1_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_1_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_1_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_1_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_1_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_1_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_1_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_1_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_1_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_1_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_1_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_1_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_1_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_1_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_1_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_1_io_out_QSV_7_1),
        .io_out_valid(_m_1_io_out_valid)
    );

    // Step 2: CP on qubits [2, 0] -> CTGate (Target is qubit 0, no permutation)
    CTGate3QubitVector8bit m_2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_1_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_1_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_1_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_1_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_1_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_1_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_1_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_1_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_1_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_1_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_1_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_1_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_1_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_1_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_1_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_1_io_out_QSV_7_1),
        .io_in_valid(_m_1_io_out_valid),
        .io_out_QSV_0_0(_m_2_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_2_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_2_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_2_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_2_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_2_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_2_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_2_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_2_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_2_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_2_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_2_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_2_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_2_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_2_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_2_io_out_QSV_7_1),
        .io_out_valid(_m_2_io_out_valid)
    );

    // Step 3 & 4: Both target qubit 1 (non-zero). Bracket with CompatiblePerm_2
    CompatiblePerm_2 m_3 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_2_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_2_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_2_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_2_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_2_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_2_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_2_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_2_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_2_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_2_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_2_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_2_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_2_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_2_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_2_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_2_io_out_QSV_7_1),
        .io_in_valid(_m_2_io_out_valid),
        .io_out_QSV_0_0(_m_3_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_3_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_3_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_3_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_3_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_3_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_3_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_3_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_3_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_3_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_3_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_3_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_3_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_3_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_3_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_3_io_out_QSV_7_1),
        .io_out_valid(_m_3_io_out_valid)
    );

    // Step 3: H on qubit 1 (Mapped to qubit 0)
    HGate3QubitVector8bit m_4 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_3_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_3_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_3_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_3_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_3_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_3_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_3_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_3_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_3_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_3_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_3_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_3_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_3_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_3_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_3_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_3_io_out_QSV_7_1),
        .io_in_valid(_m_3_io_out_valid),
        .io_out_QSV_0_0(_m_4_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_4_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_4_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_4_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_4_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_4_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_4_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_4_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_4_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_4_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_4_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_4_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_4_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_4_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_4_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_4_io_out_QSV_7_1),
        .io_out_valid(_m_4_io_out_valid)
    );

    // Step 4: CS on qubits [2, 1] (Mapped to qubits [2, 0])
    CSGate3QubitVector8bit m_5 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_4_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_4_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_4_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_4_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_4_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_4_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_4_io_out_QSV_3_0),
        .io_in_QSV_4_0(_m_4_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_4_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_4_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_4_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_4_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_4_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_4_io_out_QSV_7_0),
        .io_in_valid(_m_4_io_out_valid),
        .io_out_QSV_0_0(_m_5_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_5_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_5_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_5_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_5_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_5_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_5_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_5_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_5_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_5_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_5_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_5_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_5_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_5_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_5_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_5_io_out_QSV_7_1),
        .io_out_valid(_m_5_io_out_valid)
    );

    // Restore permutation after Step 3 & 4
    CompatiblePerm_2 m_6 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_5_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_5_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_5_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_5_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_5_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_5_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_5_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_5_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_5_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_5_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_5_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_5_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_5_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_5_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_5_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_5_io_out_QSV_7_1),
        .io_in_valid(_m_5_io_out_valid),
        .io_out_QSV_0_0(_m_6_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_6_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_6_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_6_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_6_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_6_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_6_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_6_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_6_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_6_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_6_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_6_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_6_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_6_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_6_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_6_io_out_QSV_7_1),
        .io_out_valid(_m_6_io_out_valid)
    );

    // Step 5: H on qubit 2 (non-zero target). Map qubit 2 to qubit 0 using CompatiblePerm_1
    CompatiblePerm_1 m_7 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_6_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_6_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_6_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_6_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_6_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_6_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_6_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_6_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_6_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_6_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_6_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_6_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_6_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_6_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_6_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_6_io_out_QSV_7_1),
        .io_in_valid(_m_6_io_out_valid),
        .io_out_QSV_0_0(_m_7_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_7_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_7_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_7_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_7_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_7_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_7_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_7_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_7_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_7_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_7_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_7_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_7_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_7_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_7_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_7_io_out_QSV_7_1),
        .io_out_valid(_m_7_io_out_valid)
    );

    // Step 5: H on qubit 2 (Mapped to qubit 0)
    HGate3QubitVector8bit m_8 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_7_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_7_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_7_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_7_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_7_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_7_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_7_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_7_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_7_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_7_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_7_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_7_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_7_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_7_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_7_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_7_io_out_QSV_7_1),
        .io_in_valid(_m_7_io_out_valid),
        .io_out_QSV_0_0(_m_8_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_8_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_8_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_8_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_8_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_8_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_8_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_8_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_8_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_8_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_8_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_8_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_8_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_8_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_8_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_8_io_out_QSV_7_1),
        .io_out_valid(_m_8_io_out_valid)
    );

    // Restore permutation after Step 5
    CompatiblePerm_1 m_9 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_8_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_8_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_8_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_8_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_8_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_8_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_8_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_8_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_8_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_8_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_8_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_8_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_8_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_8_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_8_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_8_io_out_QSV_7_1),
        .io_in_valid(_m_8_io_out_valid),
        .io_out_QSV_0_0(_m_9_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_9_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_9_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_9_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_9_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_9_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_9_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_9_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_9_io_out_QSV_4_0),
        .io_out_QSV_4_1(_m_9_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_9_io_out_QSV_5_0),
        .io_out_QSV_5_1(_m_9_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_9_io_out_QSV_6_0),
        .io_out_QSV_6_1(_m_9_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_9_io_out_QSV_7_0),
        .io_out_QSV_7_1(_m_9_io_out_QSV_7_1),
        .io_out_valid(_m_9_io_out_valid)
    );

    // Step 6: SWAP on qubits [0, 2] (Full vector gate, no permutation)
    SWGate3QubitVector8bit m_10 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_9_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_9_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_9_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_9_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_9_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_9_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_9_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_9_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_9_io_out_QSV_4_0),
        .io_in_QSV_4_1(_m_9_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_9_io_out_QSV_5_0),
        .io_in_QSV_5_1(_m_9_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_9_io_out_QSV_6_0),
        .io_in_QSV_6_1(_m_9_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_9_io_out_QSV_7_0),
        .io_in_QSV_7_1(_m_9_io_out_QSV_7_1),
        .io_in_valid(_m_9_io_out_valid),
        .io_out_QSV_0_0(io_out_QSV_0_0),
        .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0),
        .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0),
        .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0),
        .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_QSV_4_0(io_out_QSV_4_0),
        .io_out_QSV_4_1(io_out_QSV_4_1),
        .io_out_QSV_5_0(io_out_QSV_5_0),
        .io_out_QSV_5_1(io_out_QSV_5_1),
        .io_out_QSV_6_0(io_out_QSV_6_0),
        .io_out_QSV_6_1(io_out_QSV_6_1),
        .io_out_QSV_7_0(io_out_QSV_7_0),
        .io_out_QSV_7_1(io_out_QSV_7_1),
        .io_out_valid(io_out_valid)
    );

endmodule
