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

    // Intermediate wires for instance m (Stage 0: HGate3QubitVector8bit)
    wire [7:0] _m_io_out_QSV_0_0;
    wire [7:0] _m_io_out_QSV_0_1;
    wire [7:0] _m_io_out_QSV_1_0;
    wire [7:0] _m_io_out_QSV_1_1;
    wire [7:0] _m_io_out_QSV_2_0;
    wire [7:0] _m_io_out_QSV_2_1;
    wire [7:0] _m_io_out_QSV_3_0;
    // _m_io_out_QSV_3_1 omitted as CSGate3QubitVector8bit prunes this port
    wire [7:0] _m_io_out_QSV_4_0;
    wire [7:0] _m_io_out_QSV_4_1;
    wire [7:0] _m_io_out_QSV_5_0;
    wire [7:0] _m_io_out_QSV_5_1;
    wire [7:0] _m_io_out_QSV_6_0;
    wire [7:0] _m_io_out_QSV_6_1;
    wire [7:0] _m_io_out_QSV_7_0;
    // _m_io_out_QSV_7_1 omitted as CSGate3QubitVector8bit prunes this port
    wire       _m_io_out_valid;

    // Intermediate wires for instance m_1 (Stage 1: CSGate3QubitVector8bit)
    wire [7:0] _m_1_io_out_QSV_0_0, _m_1_io_out_QSV_0_1, _m_1_io_out_QSV_1_0, _m_1_io_out_QSV_1_1;
    wire [7:0] _m_1_io_out_QSV_2_0, _m_1_io_out_QSV_2_1, _m_1_io_out_QSV_3_0, _m_1_io_out_QSV_3_1;
    wire [7:0] _m_1_io_out_QSV_4_0, _m_1_io_out_QSV_4_1, _m_1_io_out_QSV_5_0, _m_1_io_out_QSV_5_1;
    wire [7:0] _m_1_io_out_QSV_6_0, _m_1_io_out_QSV_6_1, _m_1_io_out_QSV_7_0, _m_1_io_out_QSV_7_1;
    wire       _m_1_io_out_valid;

    // Intermediate wires for instance m_2 (Stage 2: CompatiblePerm_2)
    wire [7:0] _m_2_io_out_QSV_0_0, _m_2_io_out_QSV_0_1, _m_2_io_out_QSV_1_0, _m_2_io_out_QSV_1_1;
    wire [7:0] _m_2_io_out_QSV_2_0, _m_2_io_out_QSV_2_1, _m_2_io_out_QSV_3_0, _m_2_io_out_QSV_3_1;
    wire [7:0] _m_2_io_out_QSV_4_0, _m_2_io_out_QSV_4_1, _m_2_io_out_QSV_5_0, _m_2_io_out_QSV_5_1;
    wire [7:0] _m_2_io_out_QSV_6_0, _m_2_io_out_QSV_6_1, _m_2_io_out_QSV_7_0, _m_2_io_out_QSV_7_1;
    wire       _m_2_io_out_valid;

    // Intermediate wires for instance m_3 (Stage 3: CTGate3QubitVector8bit)
    wire [7:0] _m_3_io_out_QSV_0_0, _m_3_io_out_QSV_0_1, _m_3_io_out_QSV_1_0, _m_3_io_out_QSV_1_1;
    wire [7:0] _m_3_io_out_QSV_2_0, _m_3_io_out_QSV_2_1, _m_3_io_out_QSV_3_0, _m_3_io_out_QSV_3_1;
    wire [7:0] _m_3_io_out_QSV_4_0, _m_3_io_out_QSV_4_1, _m_3_io_out_QSV_5_0, _m_3_io_out_QSV_5_1;
    wire [7:0] _m_3_io_out_QSV_6_0, _m_3_io_out_QSV_6_1, _m_3_io_out_QSV_7_0, _m_3_io_out_QSV_7_1;
    wire       _m_3_io_out_valid;

    // Intermediate wires for instance m_4 (Stage 4: CompatiblePerm_2)
    wire [7:0] _m_4_io_out_QSV_0_0, _m_4_io_out_QSV_0_1, _m_4_io_out_QSV_1_0, _m_4_io_out_QSV_1_1;
    wire [7:0] _m_4_io_out_QSV_2_0, _m_4_io_out_QSV_2_1, _m_4_io_out_QSV_3_0, _m_4_io_out_QSV_3_1;
    wire [7:0] _m_4_io_out_QSV_4_0, _m_4_io_out_QSV_4_1, _m_4_io_out_QSV_5_0, _m_4_io_out_QSV_5_1;
    wire [7:0] _m_4_io_out_QSV_6_0, _m_4_io_out_QSV_6_1, _m_4_io_out_QSV_7_0, _m_4_io_out_QSV_7_1;
    wire       _m_4_io_out_valid;

    // Intermediate wires for instance m_5 (Stage 5: CompatiblePerm)
    wire [7:0] _m_5_io_out_QSV_0_0, _m_5_io_out_QSV_0_1, _m_5_io_out_QSV_1_0, _m_5_io_out_QSV_1_1;
    wire [7:0] _m_5_io_out_QSV_2_0, _m_5_io_out_QSV_2_1, _m_5_io_out_QSV_3_0, _m_5_io_out_QSV_3_1;
    wire [7:0] _m_5_io_out_QSV_4_0, _m_5_io_out_QSV_4_1, _m_5_io_out_QSV_5_0, _m_5_io_out_QSV_5_1;
    wire [7:0] _m_5_io_out_QSV_6_0, _m_5_io_out_QSV_6_1, _m_5_io_out_QSV_7_0, _m_5_io_out_QSV_7_1;
    wire       _m_5_io_out_valid;

    // Intermediate wires for instance m_6 (Stage 6: HGate3QubitVector8bit)
    wire [7:0] _m_6_io_out_QSV_0_0, _m_6_io_out_QSV_0_1, _m_6_io_out_QSV_1_0, _m_6_io_out_QSV_1_1;
    wire [7:0] _m_6_io_out_QSV_2_0, _m_6_io_out_QSV_2_1, _m_6_io_out_QSV_3_0, _m_6_io_out_QSV_3_1;
    wire [7:0] _m_6_io_out_QSV_4_0, _m_6_io_out_QSV_4_1, _m_6_io_out_QSV_5_0, _m_6_io_out_QSV_5_1;
    wire [7:0] _m_6_io_out_QSV_6_0, _m_6_io_out_QSV_6_1, _m_6_io_out_QSV_7_0, _m_6_io_out_QSV_7_1;
    wire       _m_6_io_out_valid;

    // Intermediate wires for instance m_7 (Stage 7: CompatiblePerm)
    wire [7:0] _m_7_io_out_QSV_0_0, _m_7_io_out_QSV_0_1, _m_7_io_out_QSV_1_0, _m_7_io_out_QSV_1_1;
    wire [7:0] _m_7_io_out_QSV_2_0, _m_7_io_out_QSV_2_1, _m_7_io_out_QSV_3_0, _m_7_io_out_QSV_3_1;
    wire [7:0] _m_7_io_out_QSV_4_0, _m_7_io_out_QSV_4_1, _m_7_io_out_QSV_5_0, _m_7_io_out_QSV_5_1;
    wire [7:0] _m_7_io_out_QSV_6_0, _m_7_io_out_QSV_6_1, _m_7_io_out_QSV_7_0, _m_7_io_out_QSV_7_1;
    wire       _m_7_io_out_valid;

    // Intermediate wires for instance m_8 (Stage 8: CompatiblePerm_1)
    wire [7:0] _m_8_io_out_QSV_0_0;
    wire [7:0] _m_8_io_out_QSV_0_1;
    wire [7:0] _m_8_io_out_QSV_1_0;
    wire [7:0] _m_8_io_out_QSV_1_1;
    wire [7:0] _m_8_io_out_QSV_2_0;
    wire [7:0] _m_8_io_out_QSV_2_1;
    wire [7:0] _m_8_io_out_QSV_3_0;
    // _m_8_io_out_QSV_3_1 omitted as CSGate3QubitVector8bit prunes this port
    wire [7:0] _m_8_io_out_QSV_4_0;
    wire [7:0] _m_8_io_out_QSV_4_1;
    wire [7:0] _m_8_io_out_QSV_5_0;
    wire [7:0] _m_8_io_out_QSV_5_1;
    wire [7:0] _m_8_io_out_QSV_6_0;
    wire [7:0] _m_8_io_out_QSV_6_1;
    wire [7:0] _m_8_io_out_QSV_7_0;
    // _m_8_io_out_QSV_7_1 omitted as CSGate3QubitVector8bit prunes this port
    wire       _m_8_io_out_valid;

    // Intermediate wires for instance m_9 (Stage 9: CSGate3QubitVector8bit)
    wire [7:0] _m_9_io_out_QSV_0_0, _m_9_io_out_QSV_0_1, _m_9_io_out_QSV_1_0, _m_9_io_out_QSV_1_1;
    wire [7:0] _m_9_io_out_QSV_2_0, _m_9_io_out_QSV_2_1, _m_9_io_out_QSV_3_0, _m_9_io_out_QSV_3_1;
    wire [7:0] _m_9_io_out_QSV_4_0, _m_9_io_out_QSV_4_1, _m_9_io_out_QSV_5_0, _m_9_io_out_QSV_5_1;
    wire [7:0] _m_9_io_out_QSV_6_0, _m_9_io_out_QSV_6_1, _m_9_io_out_QSV_7_0, _m_9_io_out_QSV_7_1;
    wire       _m_9_io_out_valid;

    // Intermediate wires for instance m_10 (Stage 10: HGate3QubitVector8bit)
    wire [7:0] _m_10_io_out_QSV_0_0, _m_10_io_out_QSV_0_1, _m_10_io_out_QSV_1_0, _m_10_io_out_QSV_1_1;
    wire [7:0] _m_10_io_out_QSV_2_0, _m_10_io_out_QSV_2_1, _m_10_io_out_QSV_3_0, _m_10_io_out_QSV_3_1;
    wire [7:0] _m_10_io_out_QSV_4_0, _m_10_io_out_QSV_4_1, _m_10_io_out_QSV_5_0, _m_10_io_out_QSV_5_1;
    wire [7:0] _m_10_io_out_QSV_6_0, _m_10_io_out_QSV_6_1, _m_10_io_out_QSV_7_0, _m_10_io_out_QSV_7_1;
    wire       _m_10_io_out_valid;

    // Intermediate wires for instance m_11 (Stage 11: CompatiblePerm_1)
    wire [7:0] _m_11_io_out_QSV_0_0, _m_11_io_out_QSV_0_1, _m_11_io_out_QSV_1_0, _m_11_io_out_QSV_1_1;
    wire [7:0] _m_11_io_out_QSV_2_0, _m_11_io_out_QSV_2_1, _m_11_io_out_QSV_3_0, _m_11_io_out_QSV_3_1;
    wire [7:0] _m_11_io_out_QSV_4_0, _m_11_io_out_QSV_4_1, _m_11_io_out_QSV_5_0, _m_11_io_out_QSV_5_1;
    wire [7:0] _m_11_io_out_QSV_6_0, _m_11_io_out_QSV_6_1, _m_11_io_out_QSV_7_0, _m_11_io_out_QSV_7_1;
    wire       _m_11_io_out_valid;

    // qc.h(0)
    HGate3QubitVector8bit m (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
        .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
        .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_in_QSV_4_0(io_in_QSV_4_0), .io_in_QSV_4_1(io_in_QSV_4_1),
        .io_in_QSV_5_0(io_in_QSV_5_0), .io_in_QSV_5_1(io_in_QSV_5_1),
        .io_in_QSV_6_0(io_in_QSV_6_0), .io_in_QSV_6_1(io_in_QSV_6_1),
        .io_in_QSV_7_0(io_in_QSV_7_0), .io_in_QSV_7_1(io_in_QSV_7_1),
        .io_in_valid(io_in_valid),
        .io_out_QSV_0_0(_m_io_out_QSV_0_0), .io_out_QSV_0_1(_m_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_io_out_QSV_1_0), .io_out_QSV_1_1(_m_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_io_out_QSV_2_0), .io_out_QSV_2_1(_m_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_io_out_QSV_3_0), .io_out_QSV_3_1(),
        .io_out_QSV_4_0(_m_io_out_QSV_4_0), .io_out_QSV_4_1(_m_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_io_out_QSV_5_0), .io_out_QSV_5_1(_m_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_io_out_QSV_6_0), .io_out_QSV_6_1(_m_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_io_out_QSV_7_0), .io_out_QSV_7_1(),
        .io_out_valid(_m_io_out_valid)
    );

    // qc.cs(1, 0)
    CSGate3QubitVector8bit m_1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_io_out_QSV_0_0), .io_in_QSV_0_1(_m_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_io_out_QSV_1_0), .io_in_QSV_1_1(_m_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_io_out_QSV_2_0), .io_in_QSV_2_1(_m_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_io_out_QSV_3_0),
        .io_in_QSV_4_0(_m_io_out_QSV_4_0), .io_in_QSV_4_1(_m_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_io_out_QSV_5_0), .io_in_QSV_5_1(_m_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_io_out_QSV_6_0), .io_in_QSV_6_1(_m_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_io_out_QSV_7_0),
        .io_in_valid(_m_io_out_valid),
        .io_out_QSV_0_0(_m_1_io_out_QSV_0_0), .io_out_QSV_0_1(_m_1_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_1_io_out_QSV_1_0), .io_out_QSV_1_1(_m_1_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_1_io_out_QSV_2_0), .io_out_QSV_2_1(_m_1_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_1_io_out_QSV_3_0), .io_out_QSV_3_1(_m_1_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_1_io_out_QSV_4_0), .io_out_QSV_4_1(_m_1_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_1_io_out_QSV_5_0), .io_out_QSV_5_1(_m_1_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_1_io_out_QSV_6_0), .io_out_QSV_6_1(_m_1_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_1_io_out_QSV_7_0), .io_out_QSV_7_1(_m_1_io_out_QSV_7_1),
        .io_out_valid(_m_1_io_out_valid)
    );

    // Permutation for cp(2, 0)
    CompatiblePerm_2 m_2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_1_io_out_QSV_0_0), .io_in_QSV_0_1(_m_1_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_1_io_out_QSV_1_0), .io_in_QSV_1_1(_m_1_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_1_io_out_QSV_2_0), .io_in_QSV_2_1(_m_1_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_1_io_out_QSV_3_0), .io_in_QSV_3_1(_m_1_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_1_io_out_QSV_4_0), .io_in_QSV_4_1(_m_1_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_1_io_out_QSV_5_0), .io_in_QSV_5_1(_m_1_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_1_io_out_QSV_6_0), .io_in_QSV_6_1(_m_1_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_1_io_out_QSV_7_0), .io_in_QSV_7_1(_m_1_io_out_QSV_7_1),
        .io_in_valid(_m_1_io_out_valid),
        .io_out_QSV_0_0(_m_2_io_out_QSV_0_0), .io_out_QSV_0_1(_m_2_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_2_io_out_QSV_1_0), .io_out_QSV_1_1(_m_2_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_2_io_out_QSV_2_0), .io_out_QSV_2_1(_m_2_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_2_io_out_QSV_3_0), .io_out_QSV_3_1(_m_2_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_2_io_out_QSV_4_0), .io_out_QSV_4_1(_m_2_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_2_io_out_QSV_5_0), .io_out_QSV_5_1(_m_2_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_2_io_out_QSV_6_0), .io_out_QSV_6_1(_m_2_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_2_io_out_QSV_7_0), .io_out_QSV_7_1(_m_2_io_out_QSV_7_1),
        .io_out_valid(_m_2_io_out_valid)
    );

    // qc.cp(math.pi / 4, 2, 0)
    CTGate3QubitVector8bit m_3 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_2_io_out_QSV_0_0), .io_in_QSV_0_1(_m_2_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_2_io_out_QSV_1_0), .io_in_QSV_1_1(_m_2_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_2_io_out_QSV_2_0), .io_in_QSV_2_1(_m_2_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_2_io_out_QSV_3_0), .io_in_QSV_3_1(_m_2_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_2_io_out_QSV_4_0), .io_in_QSV_4_1(_m_2_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_2_io_out_QSV_5_0), .io_in_QSV_5_1(_m_2_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_2_io_out_QSV_6_0), .io_in_QSV_6_1(_m_2_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_2_io_out_QSV_7_0), .io_in_QSV_7_1(_m_2_io_out_QSV_7_1),
        .io_in_valid(_m_2_io_out_valid),
        .io_out_QSV_0_0(_m_3_io_out_QSV_0_0), .io_out_QSV_0_1(_m_3_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_3_io_out_QSV_1_0), .io_out_QSV_1_1(_m_3_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_3_io_out_QSV_2_0), .io_out_QSV_2_1(_m_3_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_3_io_out_QSV_3_0), .io_out_QSV_3_1(_m_3_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_3_io_out_QSV_4_0), .io_out_QSV_4_1(_m_3_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_3_io_out_QSV_5_0), .io_out_QSV_5_1(_m_3_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_3_io_out_QSV_6_0), .io_out_QSV_6_1(_m_3_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_3_io_out_QSV_7_0), .io_out_QSV_7_1(_m_3_io_out_QSV_7_1),
        .io_out_valid(_m_3_io_out_valid)
    );

    // Restore perm for cp(2, 0)
    CompatiblePerm_2 m_4 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_3_io_out_QSV_0_0), .io_in_QSV_0_1(_m_3_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_3_io_out_QSV_1_0), .io_in_QSV_1_1(_m_3_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_3_io_out_QSV_2_0), .io_in_QSV_2_1(_m_3_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_3_io_out_QSV_3_0), .io_in_QSV_3_1(_m_3_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_3_io_out_QSV_4_0), .io_in_QSV_4_1(_m_3_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_3_io_out_QSV_5_0), .io_in_QSV_5_1(_m_3_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_3_io_out_QSV_6_0), .io_in_QSV_6_1(_m_3_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_3_io_out_QSV_7_0), .io_in_QSV_7_1(_m_3_io_out_QSV_7_1),
        .io_in_valid(_m_3_io_out_valid),
        .io_out_QSV_0_0(_m_4_io_out_QSV_0_0), .io_out_QSV_0_1(_m_4_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_4_io_out_QSV_1_0), .io_out_QSV_1_1(_m_4_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_4_io_out_QSV_2_0), .io_out_QSV_2_1(_m_4_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_4_io_out_QSV_3_0), .io_out_QSV_3_1(_m_4_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_4_io_out_QSV_4_0), .io_out_QSV_4_1(_m_4_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_4_io_out_QSV_5_0), .io_out_QSV_5_1(_m_4_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_4_io_out_QSV_6_0), .io_out_QSV_6_1(_m_4_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_4_io_out_QSV_7_0), .io_out_QSV_7_1(_m_4_io_out_QSV_7_1),
        .io_out_valid(_m_4_io_out_valid)
    );

    // Permutation for h(1)
    CompatiblePerm m_5 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_4_io_out_QSV_0_0), .io_in_QSV_0_1(_m_4_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_4_io_out_QSV_1_0), .io_in_QSV_1_1(_m_4_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_4_io_out_QSV_2_0), .io_in_QSV_2_1(_m_4_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_4_io_out_QSV_3_0), .io_in_QSV_3_1(_m_4_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_4_io_out_QSV_4_0), .io_in_QSV_4_1(_m_4_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_4_io_out_QSV_5_0), .io_in_QSV_5_1(_m_4_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_4_io_out_QSV_6_0), .io_in_QSV_6_1(_m_4_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_4_io_out_QSV_7_0), .io_in_QSV_7_1(_m_4_io_out_QSV_7_1),
        .io_in_valid(_m_4_io_out_valid),
        .io_out_QSV_0_0(_m_5_io_out_QSV_0_0), .io_out_QSV_0_1(_m_5_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_5_io_out_QSV_1_0), .io_out_QSV_1_1(_m_5_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_5_io_out_QSV_2_0), .io_out_QSV_2_1(_m_5_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_5_io_out_QSV_3_0), .io_out_QSV_3_1(_m_5_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_5_io_out_QSV_4_0), .io_out_QSV_4_1(_m_5_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_5_io_out_QSV_5_0), .io_out_QSV_5_1(_m_5_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_5_io_out_QSV_6_0), .io_out_QSV_6_1(_m_5_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_5_io_out_QSV_7_0), .io_out_QSV_7_1(_m_5_io_out_QSV_7_1),
        .io_out_valid(_m_5_io_out_valid)
    );

    // qc.h(1)
    HGate3QubitVector8bit m_6 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_5_io_out_QSV_0_0), .io_in_QSV_0_1(_m_5_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_5_io_out_QSV_1_0), .io_in_QSV_1_1(_m_5_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_5_io_out_QSV_2_0), .io_in_QSV_2_1(_m_5_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_5_io_out_QSV_3_0), .io_in_QSV_3_1(_m_5_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_5_io_out_QSV_4_0), .io_in_QSV_4_1(_m_5_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_5_io_out_QSV_5_0), .io_in_QSV_5_1(_m_5_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_5_io_out_QSV_6_0), .io_in_QSV_6_1(_m_5_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_5_io_out_QSV_7_0), .io_in_QSV_7_1(_m_5_io_out_QSV_7_1),
        .io_in_valid(_m_5_io_out_valid),
        .io_out_QSV_0_0(_m_6_io_out_QSV_0_0), .io_out_QSV_0_1(_m_6_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_6_io_out_QSV_1_0), .io_out_QSV_1_1(_m_6_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_6_io_out_QSV_2_0), .io_out_QSV_2_1(_m_6_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_6_io_out_QSV_3_0), .io_out_QSV_3_1(_m_6_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_6_io_out_QSV_4_0), .io_out_QSV_4_1(_m_6_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_6_io_out_QSV_5_0), .io_out_QSV_5_1(_m_6_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_6_io_out_QSV_6_0), .io_out_QSV_6_1(_m_6_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_6_io_out_QSV_7_0), .io_out_QSV_7_1(_m_6_io_out_QSV_7_1),
        .io_out_valid(_m_6_io_out_valid)
    );

    // Restore perm for h(1)
    CompatiblePerm m_7 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_6_io_out_QSV_0_0), .io_in_QSV_0_1(_m_6_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_6_io_out_QSV_1_0), .io_in_QSV_1_1(_m_6_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_6_io_out_QSV_2_0), .io_in_QSV_2_1(_m_6_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_6_io_out_QSV_3_0), .io_in_QSV_3_1(_m_6_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_6_io_out_QSV_4_0), .io_in_QSV_4_1(_m_6_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_6_io_out_QSV_5_0), .io_in_QSV_5_1(_m_6_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_6_io_out_QSV_6_0), .io_in_QSV_6_1(_m_6_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_6_io_out_QSV_7_0), .io_in_QSV_7_1(_m_6_io_out_QSV_7_1),
        .io_in_valid(_m_6_io_out_valid),
        .io_out_QSV_0_0(_m_7_io_out_QSV_0_0), .io_out_QSV_0_1(_m_7_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_7_io_out_QSV_1_0), .io_out_QSV_1_1(_m_7_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_7_io_out_QSV_2_0), .io_out_QSV_2_1(_m_7_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_7_io_out_QSV_3_0), .io_out_QSV_3_1(_m_7_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_7_io_out_QSV_4_0), .io_out_QSV_4_1(_m_7_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_7_io_out_QSV_5_0), .io_out_QSV_5_1(_m_7_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_7_io_out_QSV_6_0), .io_out_QSV_6_1(_m_7_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_7_io_out_QSV_7_0), .io_out_QSV_7_1(_m_7_io_out_QSV_7_1),
        .io_out_valid(_m_7_io_out_valid)
    );

    // Permutation for cs(2, 1) and h(2)
    CompatiblePerm_1 m_8 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_7_io_out_QSV_0_0), .io_in_QSV_0_1(_m_7_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_7_io_out_QSV_1_0), .io_in_QSV_1_1(_m_7_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_7_io_out_QSV_2_0), .io_in_QSV_2_1(_m_7_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_7_io_out_QSV_3_0), .io_in_QSV_3_1(_m_7_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_7_io_out_QSV_4_0), .io_in_QSV_4_1(_m_7_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_7_io_out_QSV_5_0), .io_in_QSV_5_1(_m_7_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_7_io_out_QSV_6_0), .io_in_QSV_6_1(_m_7_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_7_io_out_QSV_7_0), .io_in_QSV_7_1(_m_7_io_out_QSV_7_1),
        .io_in_valid(_m_7_io_out_valid),
        .io_out_QSV_0_0(_m_8_io_out_QSV_0_0), .io_out_QSV_0_1(_m_8_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_8_io_out_QSV_1_0), .io_out_QSV_1_1(_m_8_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_8_io_out_QSV_2_0), .io_out_QSV_2_1(_m_8_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_8_io_out_QSV_3_0), .io_out_QSV_3_1(),
        .io_out_QSV_4_0(_m_8_io_out_QSV_4_0), .io_out_QSV_4_1(_m_8_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_8_io_out_QSV_5_0), .io_out_QSV_5_1(_m_8_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_8_io_out_QSV_6_0), .io_out_QSV_6_1(_m_8_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_8_io_out_QSV_7_0), .io_out_QSV_7_1(),
        .io_out_valid(_m_8_io_out_valid)
    );

    // qc.cs(2, 1)
    CSGate3QubitVector8bit m_9 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_8_io_out_QSV_0_0), .io_in_QSV_0_1(_m_8_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_8_io_out_QSV_1_0), .io_in_QSV_1_1(_m_8_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_8_io_out_QSV_2_0), .io_in_QSV_2_1(_m_8_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_8_io_out_QSV_3_0),
        .io_in_QSV_4_0(_m_8_io_out_QSV_4_0), .io_in_QSV_4_1(_m_8_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_8_io_out_QSV_5_0), .io_in_QSV_5_1(_m_8_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_8_io_out_QSV_6_0), .io_in_QSV_6_1(_m_8_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_8_io_out_QSV_7_0),
        .io_in_valid(_m_8_io_out_valid),
        .io_out_QSV_0_0(_m_9_io_out_QSV_0_0), .io_out_QSV_0_1(_m_9_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_9_io_out_QSV_1_0), .io_out_QSV_1_1(_m_9_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_9_io_out_QSV_2_0), .io_out_QSV_2_1(_m_9_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_9_io_out_QSV_3_0), .io_out_QSV_3_1(_m_9_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_9_io_out_QSV_4_0), .io_out_QSV_4_1(_m_9_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_9_io_out_QSV_5_0), .io_out_QSV_5_1(_m_9_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_9_io_out_QSV_6_0), .io_out_QSV_6_1(_m_9_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_9_io_out_QSV_7_0), .io_out_QSV_7_1(_m_9_io_out_QSV_7_1),
        .io_out_valid(_m_9_io_out_valid)
    );

    // qc.h(2)
    HGate3QubitVector8bit m_10 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_9_io_out_QSV_0_0), .io_in_QSV_0_1(_m_9_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_9_io_out_QSV_1_0), .io_in_QSV_1_1(_m_9_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_9_io_out_QSV_2_0), .io_in_QSV_2_1(_m_9_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_9_io_out_QSV_3_0), .io_in_QSV_3_1(_m_9_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_9_io_out_QSV_4_0), .io_in_QSV_4_1(_m_9_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_9_io_out_QSV_5_0), .io_in_QSV_5_1(_m_9_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_9_io_out_QSV_6_0), .io_in_QSV_6_1(_m_9_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_9_io_out_QSV_7_0), .io_in_QSV_7_1(_m_9_io_out_QSV_7_1),
        .io_in_valid(_m_9_io_out_valid),
        .io_out_QSV_0_0(_m_10_io_out_QSV_0_0), .io_out_QSV_0_1(_m_10_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_10_io_out_QSV_1_0), .io_out_QSV_1_1(_m_10_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_10_io_out_QSV_2_0), .io_out_QSV_2_1(_m_10_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_10_io_out_QSV_3_0), .io_out_QSV_3_1(_m_10_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_10_io_out_QSV_4_0), .io_out_QSV_4_1(_m_10_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_10_io_out_QSV_5_0), .io_out_QSV_5_1(_m_10_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_10_io_out_QSV_6_0), .io_out_QSV_6_1(_m_10_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_10_io_out_QSV_7_0), .io_out_QSV_7_1(_m_10_io_out_QSV_7_1),
        .io_out_valid(_m_10_io_out_valid)
    );

    // Restore perm for cs(2, 1) and h(2)
    CompatiblePerm_1 m_11 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_10_io_out_QSV_0_0), .io_in_QSV_0_1(_m_10_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_10_io_out_QSV_1_0), .io_in_QSV_1_1(_m_10_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_10_io_out_QSV_2_0), .io_in_QSV_2_1(_m_10_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_10_io_out_QSV_3_0), .io_in_QSV_3_1(_m_10_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_10_io_out_QSV_4_0), .io_in_QSV_4_1(_m_10_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_10_io_out_QSV_5_0), .io_in_QSV_5_1(_m_10_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_10_io_out_QSV_6_0), .io_in_QSV_6_1(_m_10_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_10_io_out_QSV_7_0), .io_in_QSV_7_1(_m_10_io_out_QSV_7_1),
        .io_in_valid(_m_10_io_out_valid),
        .io_out_QSV_0_0(_m_11_io_out_QSV_0_0), .io_out_QSV_0_1(_m_11_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_11_io_out_QSV_1_0), .io_out_QSV_1_1(_m_11_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_11_io_out_QSV_2_0), .io_out_QSV_2_1(_m_11_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_11_io_out_QSV_3_0), .io_out_QSV_3_1(_m_11_io_out_QSV_3_1),
        .io_out_QSV_4_0(_m_11_io_out_QSV_4_0), .io_out_QSV_4_1(_m_11_io_out_QSV_4_1),
        .io_out_QSV_5_0(_m_11_io_out_QSV_5_0), .io_out_QSV_5_1(_m_11_io_out_QSV_5_1),
        .io_out_QSV_6_0(_m_11_io_out_QSV_6_0), .io_out_QSV_6_1(_m_11_io_out_QSV_6_1),
        .io_out_QSV_7_0(_m_11_io_out_QSV_7_0), .io_out_QSV_7_1(_m_11_io_out_QSV_7_1),
        .io_out_valid(_m_11_io_out_valid)
    );

    // qc.swap(0, 2)
    SWGate3QubitVector8bit m_12 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_11_io_out_QSV_0_0), .io_in_QSV_0_1(_m_11_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_11_io_out_QSV_1_0), .io_in_QSV_1_1(_m_11_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_11_io_out_QSV_2_0), .io_in_QSV_2_1(_m_11_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_11_io_out_QSV_3_0), .io_in_QSV_3_1(_m_11_io_out_QSV_3_1),
        .io_in_QSV_4_0(_m_11_io_out_QSV_4_0), .io_in_QSV_4_1(_m_11_io_out_QSV_4_1),
        .io_in_QSV_5_0(_m_11_io_out_QSV_5_0), .io_in_QSV_5_1(_m_11_io_out_QSV_5_1),
        .io_in_QSV_6_0(_m_11_io_out_QSV_6_0), .io_in_QSV_6_1(_m_11_io_out_QSV_6_1),
        .io_in_QSV_7_0(_m_11_io_out_QSV_7_0), .io_in_QSV_7_1(_m_11_io_out_QSV_7_1),
        .io_in_valid(_m_11_io_out_valid),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_QSV_4_0(io_out_QSV_4_0), .io_out_QSV_4_1(io_out_QSV_4_1),
        .io_out_QSV_5_0(io_out_QSV_5_0), .io_out_QSV_5_1(io_out_QSV_5_1),
        .io_out_QSV_6_0(io_out_QSV_6_0), .io_out_QSV_6_1(io_out_QSV_6_1),
        .io_out_QSV_7_0(io_out_QSV_7_0), .io_out_QSV_7_1(io_out_QSV_7_1),
        .io_out_valid(io_out_valid)
    );

endmodule
