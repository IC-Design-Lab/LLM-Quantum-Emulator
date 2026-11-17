module Circuit_05 (
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

    wire [15:0] m_io_out_QSV_0_0, m_io_out_QSV_0_1, m_io_out_QSV_1_0, m_io_out_QSV_1_1;
    wire [15:0] m_io_out_QSV_2_0, m_io_out_QSV_2_1, m_io_out_QSV_3_0, m_io_out_QSV_3_1;
    wire m_io_out_valid;

    // qc.h(0)
    HGate2QubitVector16bit m (
        .clock(clock), .reset(reset),
        .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
        .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
        .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_in_valid(io_in_valid),
        .io_out_QSV_0_0(m_io_out_QSV_0_0), .io_out_QSV_0_1(m_io_out_QSV_0_1),
        .io_out_QSV_1_0(m_io_out_QSV_1_0), .io_out_QSV_1_1(m_io_out_QSV_1_1),
        .io_out_QSV_2_0(m_io_out_QSV_2_0), .io_out_QSV_2_1(m_io_out_QSV_2_1),
        .io_out_QSV_3_0(m_io_out_QSV_3_0), .io_out_QSV_3_1(m_io_out_QSV_3_1),
        .io_out_valid(m_io_out_valid)
    );

    // X and SXdg act on qubit 1 (requires perm)
    wire [15:0] m_1_io_out_QSV_0_0, m_1_io_out_QSV_0_1, m_1_io_out_QSV_1_0, m_1_io_out_QSV_1_1;
    wire [15:0] m_1_io_out_QSV_2_0, m_1_io_out_QSV_2_1, m_1_io_out_QSV_3_0, m_1_io_out_QSV_3_1;
    wire m_1_io_out_valid;

    CompatiblePerm p1 (
        .clock(clock), .reset(reset),
        .io_in_QSV_0_0(m_io_out_QSV_0_0), .io_in_QSV_0_1(m_io_out_QSV_0_1),
        .io_in_QSV_1_0(m_io_out_QSV_1_0), .io_in_QSV_1_1(m_io_out_QSV_1_1),
        .io_in_QSV_2_0(m_io_out_QSV_2_0), .io_in_QSV_2_1(m_io_out_QSV_2_1),
        .io_in_QSV_3_0(m_io_out_QSV_3_0), .io_in_QSV_3_1(m_io_out_QSV_3_1),
        .io_in_valid(m_io_out_valid),
        .io_out_QSV_0_0(m_1_io_out_QSV_0_0), .io_out_QSV_0_1(m_1_io_out_QSV_0_1),
        .io_out_QSV_1_0(m_1_io_out_QSV_1_0), .io_out_QSV_1_1(m_1_io_out_QSV_1_1),
        .io_out_QSV_2_0(m_1_io_out_QSV_2_0), .io_out_QSV_2_1(m_1_io_out_QSV_2_1),
        .io_out_QSV_3_0(m_1_io_out_QSV_3_0), .io_out_QSV_3_1(m_1_io_out_QSV_3_1),
        .io_out_valid(m_1_io_out_valid)
    );

    wire [15:0] m_2_io_out_QSV_0_0, m_2_io_out_QSV_0_1, m_2_io_out_QSV_1_0, m_2_io_out_QSV_1_1;
    wire [15:0] m_2_io_out_QSV_2_0, m_2_io_out_QSV_2_1, m_2_io_out_QSV_3_0, m_2_io_out_QSV_3_1;
    wire m_2_io_out_valid;

    // qc.x(1)
    XGate2QubitVector16bit m_2 (
        .clock(clock), .reset(reset),
        .io_in_QSV_0_0(m_1_io_out_QSV_0_0), .io_in_QSV_0_1(m_1_io_out_QSV_0_1),
        .io_in_QSV_1_0(m_1_io_out_QSV_1_0), .io_in_QSV_1_1(m_1_io_out_QSV_1_1),
        .io_in_QSV_2_0(m_1_io_out_QSV_2_0), .io_in_QSV_2_1(m_1_io_out_QSV_2_1),
        .io_in_QSV_3_0(m_1_io_out_QSV_3_0), .io_in_QSV_3_1(m_1_io_out_QSV_3_1),
        .io_in_valid(m_1_io_out_valid),
        .io_out_QSV_0_0(m_2_io_out_QSV_0_0), .io_out_QSV_0_1(m_2_io_out_QSV_0_1),
        .io_out_QSV_1_0(m_2_io_out_QSV_1_0), .io_out_QSV_1_1(m_2_io_out_QSV_1_1),
        .io_out_QSV_2_0(m_2_io_out_QSV_2_0), .io_out_QSV_2_1(m_2_io_out_QSV_2_1),
        .io_out_QSV_3_0(m_2_io_out_QSV_3_0), .io_out_QSV_3_1(m_2_io_out_QSV_3_1),
        .io_out_valid(m_2_io_out_valid)
    );

    // qc.sxdg(1)
    wire [15:0] m_3_io_out_QSV_0_0, m_3_io_out_QSV_0_1, m_3_io_out_QSV_1_0, m_3_io_out_QSV_1_1;
    wire [15:0] m_3_io_out_QSV_2_0, m_3_io_out_QSV_2_1, m_3_io_out_QSV_3_0, m_3_io_out_QSV_3_1;
    wire m_3_io_out_valid;

    SXDGate2QubitVector16bit m_3 (
        .clock(clock), .reset(reset),
        .io_in_QSV_0_0(m_2_io_out_QSV_0_0), .io_in_QSV_0_1(m_2_io_out_QSV_0_1),
        .io_in_QSV_1_0(m_2_io_out_QSV_1_0), .io_in_QSV_1_1(m_2_io_out_QSV_1_1),
        .io_in_QSV_2_0(m_2_io_out_QSV_2_0), .io_in_QSV_2_1(m_2_io_out_QSV_2_1),
        .io_in_QSV_3_0(m_2_io_out_QSV_3_0), .io_in_QSV_3_1(m_2_io_out_QSV_3_1),
        .io_in_valid(m_2_io_out_valid),
        .io_out_QSV_0_0(m_3_io_out_QSV_0_0), .io_out_QSV_0_1(m_3_io_out_QSV_0_1),
        .io_out_QSV_1_0(m_3_io_out_QSV_1_0), .io_out_QSV_1_1(m_3_io_out_QSV_1_1),
        .io_out_QSV_2_0(m_3_io_out_QSV_2_0), .io_out_QSV_2_1(m_3_io_out_QSV_2_1),
        .io_out_QSV_3_0(m_3_io_out_QSV_3_0), .io_out_QSV_3_1(m_3_io_out_QSV_3_1),
        .io_out_valid(m_3_io_out_valid)
    );

    wire [15:0] p2_io_out_QSV_0_0, p2_io_out_QSV_0_1, p2_io_out_QSV_1_0, p2_io_out_QSV_1_1;
    wire [15:0] p2_io_out_QSV_2_0, p2_io_out_QSV_2_1, p2_io_out_QSV_3_0, p2_io_out_QSV_3_1;
    wire p2_io_out_valid;

    CompatiblePerm p2 (
        .clock(clock), .reset(reset),
        .io_in_QSV_0_0(m_3_io_out_QSV_0_0), .io_in_QSV_0_1(m_3_io_out_QSV_0_1),
        .io_in_QSV_1_0(m_3_io_out_QSV_1_0), .io_in_QSV_1_1(m_3_io_out_QSV_1_1),
        .io_in_QSV_2_0(m_3_io_out_QSV_2_0), .io_in_QSV_2_1(m_3_io_out_QSV_2_1),
        .io_in_QSV_3_0(m_3_io_out_QSV_3_0), .io_in_QSV_3_1(m_3_io_out_QSV_3_1),
        .io_in_valid(m_3_io_out_valid),
        .io_out_QSV_0_0(p2_io_out_QSV_0_0), .io_out_QSV_0_1(p2_io_out_QSV_0_1),
        .io_out_QSV_1_0(p2_io_out_QSV_1_0), .io_out_QSV_1_1(p2_io_out_QSV_1_1),
        .io_out_QSV_2_0(p2_io_out_QSV_2_0), .io_out_QSV_2_1(p2_io_out_QSV_2_1),
        .io_out_QSV_3_0(p2_io_out_QSV_3_0), .io_out_QSV_3_1(p2_io_out_QSV_3_1),
        .io_out_valid(p2_io_out_valid)
    );

    // qc.swap(0, 1)
    SWGate2QubitVector16bit m_4 (
        .clock(clock), .reset(reset),
        .io_in_QSV_0_0(p2_io_out_QSV_0_0), .io_in_QSV_0_1(p2_io_out_QSV_0_1),
        .io_in_QSV_1_0(p2_io_out_QSV_1_0), .io_in_QSV_1_1(p2_io_out_QSV_1_1),
        .io_in_QSV_2_0(p2_io_out_QSV_2_0), .io_in_QSV_2_1(p2_io_out_QSV_2_1),
        .io_in_QSV_3_0(p2_io_out_QSV_3_0), .io_in_QSV_3_1(p2_io_out_QSV_3_1),
        .io_in_valid(p2_io_out_valid),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_valid(io_out_valid)
    );

endmodule
