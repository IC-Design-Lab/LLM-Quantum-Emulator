module Circuit_03 (
    input  wire        clock,
    input  wire        reset,
    input  wire [15:0] io_in_QSV_0_0,
    input  wire [15:0] io_in_QSV_0_1,
    input  wire [15:0] io_in_QSV_1_0,
    input  wire [15:0] io_in_QSV_1_1,
    input  wire [15:0] io_in_QSV_2_0,
    input  wire [15:0] io_in_QSV_2_1,
    input  wire [15:0] io_in_QSV_3_0,
    input  wire [15:0] io_in_QSV_3_1,
    input  wire        io_in_valid,
    output wire [15:0] io_out_QSV_0_0,
    output wire [15:0] io_out_QSV_0_1,
    output wire [15:0] io_out_QSV_1_0,
    output wire [15:0] io_out_QSV_1_1,
    output wire [15:0] io_out_QSV_2_0,
    output wire [15:0] io_out_QSV_2_1,
    output wire [15:0] io_out_QSV_3_0,
    output wire [15:0] io_out_QSV_3_1,
    output wire        io_out_valid
);

    // Intermediate wires for instance m
    wire [15:0] _m_io_out_QSV_0_0;
    wire [15:0] _m_io_out_QSV_0_1;
    wire [15:0] _m_io_out_QSV_1_0;
    wire [15:0] _m_io_out_QSV_1_1;
    wire [15:0] _m_io_out_QSV_2_0;
    wire [15:0] _m_io_out_QSV_2_1;
    wire [15:0] _m_io_out_QSV_3_0;
    wire [15:0] _m_io_out_QSV_3_1;
    wire        _m_io_out_valid;

    // Intermediate wires for instance m_1
    wire [15:0] _m_1_io_out_QSV_0_0;
    wire [15:0] _m_1_io_out_QSV_0_1;
    wire [15:0] _m_1_io_out_QSV_1_0;
    wire [15:0] _m_1_io_out_QSV_1_1;
    wire [15:0] _m_1_io_out_QSV_2_0;
    wire [15:0] _m_1_io_out_QSV_2_1;
    wire [15:0] _m_1_io_out_QSV_3_0;
    wire [15:0] _m_1_io_out_QSV_3_1;
    wire        _m_1_io_out_valid;

    // Intermediate wires for instance m_2
    wire [15:0] _m_2_io_out_QSV_0_0;
    wire [15:0] _m_2_io_out_QSV_0_1;
    wire [15:0] _m_2_io_out_QSV_1_0;
    wire [15:0] _m_2_io_out_QSV_1_1;
    wire [15:0] _m_2_io_out_QSV_2_0;
    wire [15:0] _m_2_io_out_QSV_2_1;
    wire [15:0] _m_2_io_out_QSV_3_0;
    wire [15:0] _m_2_io_out_QSV_3_1;
    wire        _m_2_io_out_valid;

    // Intermediate wires for instance m_3
    wire [15:0] _m_3_io_out_QSV_0_0;
    wire [15:0] _m_3_io_out_QSV_0_1;
    wire [15:0] _m_3_io_out_QSV_1_0;
    wire [15:0] _m_3_io_out_QSV_1_1;
    wire [15:0] _m_3_io_out_QSV_2_0;
    wire [15:0] _m_3_io_out_QSV_2_1;
    wire [15:0] _m_3_io_out_QSV_3_0;
    wire [15:0] _m_3_io_out_QSV_3_1;
    wire        _m_3_io_out_valid;

    // Intermediate wires for instance m_4
    wire [15:0] _m_4_io_out_QSV_0_0;
    wire [15:0] _m_4_io_out_QSV_0_1;
    wire [15:0] _m_4_io_out_QSV_1_0;
    wire [15:0] _m_4_io_out_QSV_1_1;
    wire [15:0] _m_4_io_out_QSV_2_0;
    wire [15:0] _m_4_io_out_QSV_2_1;
    wire [15:0] _m_4_io_out_QSV_3_0;
    wire [15:0] _m_4_io_out_QSV_3_1;
    wire        _m_4_io_out_valid;

    // Stage 0: H gate on Qubit 0
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
        .io_out_QSV_0_0(_m_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_io_out_QSV_3_1),
        .io_out_valid(_m_io_out_valid)
    );

    // Stage 1: Pre-permutation for Qubit 1 operations
    CompatiblePerm m_1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_io_out_QSV_3_1),
        .io_in_valid(_m_io_out_valid),
        .io_out_QSV_0_0(_m_1_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_1_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_1_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_1_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_1_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_1_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_1_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_1_io_out_QSV_3_1),
        .io_out_valid(_m_1_io_out_valid)
    );

    // Stage 2: X gate on Qubit 1 (permuted to target 0)
    XGate2QubitVector16bit m_2 (
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
        .io_in_valid(_m_1_io_out_valid),
        .io_out_QSV_0_0(_m_2_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_2_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_2_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_2_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_2_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_2_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_2_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_2_io_out_QSV_3_1),
        .io_out_valid(_m_2_io_out_valid)
    );

    // Stage 3: H gate on Qubit 1 (permuted to target 0)
    HGate2QubitVector16bit m_3 (
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
        .io_in_valid(_m_2_io_out_valid),
        .io_out_QSV_0_0(_m_3_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_3_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_3_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_3_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_3_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_3_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_3_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_3_io_out_QSV_3_1),
        .io_out_valid(_m_3_io_out_valid)
    );

    // Stage 4: Post-permutation for Qubit 1 operations
    CompatiblePerm m_4 (
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
        .io_in_valid(_m_3_io_out_valid),
        .io_out_QSV_0_0(_m_4_io_out_QSV_0_0),
        .io_out_QSV_0_1(_m_4_io_out_QSV_0_1),
        .io_out_QSV_1_0(_m_4_io_out_QSV_1_0),
        .io_out_QSV_1_1(_m_4_io_out_QSV_1_1),
        .io_out_QSV_2_0(_m_4_io_out_QSV_2_0),
        .io_out_QSV_2_1(_m_4_io_out_QSV_2_1),
        .io_out_QSV_3_0(_m_4_io_out_QSV_3_0),
        .io_out_QSV_3_1(_m_4_io_out_QSV_3_1),
        .io_out_valid(_m_4_io_out_valid)
    );

    // Stage 5: SWAP gate on Qubits 0 and 1
    SWGate2QubitVector16bit m_5 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(_m_4_io_out_QSV_0_0),
        .io_in_QSV_0_1(_m_4_io_out_QSV_0_1),
        .io_in_QSV_1_0(_m_4_io_out_QSV_1_0),
        .io_in_QSV_1_1(_m_4_io_out_QSV_1_1),
        .io_in_QSV_2_0(_m_4_io_out_QSV_2_0),
        .io_in_QSV_2_1(_m_4_io_out_QSV_2_1),
        .io_in_QSV_3_0(_m_4_io_out_QSV_3_0),
        .io_in_QSV_3_1(_m_4_io_out_QSV_3_1),
        .io_in_valid(_m_4_io_out_valid),
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
