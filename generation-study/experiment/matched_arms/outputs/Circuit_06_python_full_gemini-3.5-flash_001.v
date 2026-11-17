module Circuit_06 (
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

    // Intermediate signals for stage 0 (HGate2QubitVector16bit - instance m)
    logic [15:0] _m_io_out_QSV_0_0;
    logic [15:0] _m_io_out_QSV_0_1;
    logic [15:0] _m_io_out_QSV_1_0;
    logic [15:0] _m_io_out_QSV_1_1;
    logic [15:0] _m_io_out_QSV_2_0;
    logic [15:0] _m_io_out_QSV_2_1;
    logic [15:0] _m_io_out_QSV_3_0;
    logic [15:0] _m_io_out_QSV_3_1;
    logic        _m_io_out_valid;

    // Intermediate signals for stage 1 (CompatiblePerm - instance m_1)
    logic [15:0] _m_1_io_out_QSV_0_0;
    logic [15:0] _m_1_io_out_QSV_0_1;
    logic [15:0] _m_1_io_out_QSV_1_0;
    logic [15:0] _m_1_io_out_QSV_1_1;
    logic [15:0] _m_1_io_out_QSV_2_0;
    logic [15:0] _m_1_io_out_QSV_2_1;
    logic [15:0] _m_1_io_out_QSV_3_0;
    logic [15:0] _m_1_io_out_QSV_3_1;
    logic        _m_1_io_out_valid;

    // Intermediate signals for stage 2 (CNGate2QubitVector16bit - instance m_2)
    logic [15:0] _m_2_io_out_QSV_0_0;
    logic [15:0] _m_2_io_out_QSV_0_1;
    logic [15:0] _m_2_io_out_QSV_1_0;
    logic [15:0] _m_2_io_out_QSV_1_1;
    logic [15:0] _m_2_io_out_QSV_2_0;
    logic [15:0] _m_2_io_out_QSV_2_1;
    logic [15:0] _m_2_io_out_QSV_3_0;
    logic [15:0] _m_2_io_out_QSV_3_1;
    logic        _m_2_io_out_valid;

    // Stage 0: HGate2QubitVector16bit
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

    // Stage 1: CompatiblePerm
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

    // Stage 2: CNGate2QubitVector16bit
    CNGate2QubitVector16bit m_2 (
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

    // Stage 3: CompatiblePerm
    CompatiblePerm m_3 (
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
