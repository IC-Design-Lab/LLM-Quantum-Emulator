module Circuit_04 (
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

    // Intermediate signals for Stage 0 (m)
    wire [15:0] m_io_out_QSV_0_0;
    wire [15:0] m_io_out_QSV_0_1;
    wire [15:0] m_io_out_QSV_1_0;
    wire [15:0] m_io_out_QSV_1_1;
    wire [15:0] m_io_out_QSV_2_0;
    wire [15:0] m_io_out_QSV_2_1;
    wire [15:0] m_io_out_QSV_3_0;
    wire [15:0] m_io_out_QSV_3_1;
    wire        m_io_out_valid;

    // Intermediate signals for Stage 1 (m_1)
    wire [15:0] m_1_io_out_QSV_0_0;
    wire [15:0] m_1_io_out_QSV_0_1;
    wire [15:0] m_1_io_out_QSV_1_0;
    wire [15:0] m_1_io_out_QSV_1_1;
    wire [15:0] m_1_io_out_QSV_2_0;
    wire [15:0] m_1_io_out_QSV_2_1;
    wire [15:0] m_1_io_out_QSV_3_0;
    wire [15:0] m_1_io_out_QSV_3_1;
    wire        m_1_io_out_valid;

    // Intermediate signals for Stage 2 (m_2)
    wire [15:0] m_2_io_out_QSV_0_0;
    wire [15:0] m_2_io_out_QSV_0_1;
    wire [15:0] m_2_io_out_QSV_1_0;
    wire [15:0] m_2_io_out_QSV_1_1;
    wire [15:0] m_2_io_out_QSV_2_0;
    wire [15:0] m_2_io_out_QSV_2_1;
    wire [15:0] m_2_io_out_QSV_3_0;
    wire [15:0] m_2_io_out_QSV_3_1;
    wire        m_2_io_out_valid;

    // Intermediate signals for Stage 3 (m_3)
    wire [15:0] m_3_io_out_QSV_0_0;
    wire [15:0] m_3_io_out_QSV_0_1;
    wire [15:0] m_3_io_out_QSV_1_0;
    wire [15:0] m_3_io_out_QSV_1_1;
    wire [15:0] m_3_io_out_QSV_2_0;
    wire [15:0] m_3_io_out_QSV_2_1;
    wire [15:0] m_3_io_out_QSV_3_0;
    wire [15:0] m_3_io_out_QSV_3_1;
    wire        m_3_io_out_valid;

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

    // Stage 1: CompatiblePerm (Before qubit 1 gate)
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

    // Stage 2: SXDGate2QubitVector16bit
    SXDGate2QubitVector16bit m_2 (
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

    // Stage 3: CompatiblePerm (After qubit 1 gate)
    CompatiblePerm m_3 (
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

    // Stage 4: SWGate2QubitVector16bit
    SWGate2QubitVector16bit m_4 (
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
