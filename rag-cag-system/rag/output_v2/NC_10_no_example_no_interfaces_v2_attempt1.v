module QuantumCircuit (
    input  logic        clock,
    input  logic        reset,
    input  logic        io_in_valid,
    input  logic [15:0] io_in_QSV_0_real,
    input  logic [15:0] io_in_QSV_0_imag,
    input  logic [15:0] io_in_QSV_1_real,
    input  logic [15:0] io_in_QSV_1_imag,
    input  logic [15:0] io_in_QSV_2_real,
    input  logic [15:0] io_in_QSV_2_imag,
    input  logic [15:0] io_in_QSV_3_real,
    input  logic [15:0] io_in_QSV_3_imag,
    output logic        io_out_valid,
    output logic [15:0] io_out_QSV_0_real,
    output logic [15:0] io_out_QSV_0_imag,
    output logic [15:0] io_out_QSV_1_real,
    output logic [15:0] io_out_QSV_1_imag,
    output logic [15:0] io_out_QSV_2_real,
    output logic [15:0] io_out_QSV_2_imag,
    output logic [15:0] io_out_QSV_3_real,
    output logic [15:0] io_out_QSV_3_imag
);

    wire        _m_3_io_out_valid;
    wire [15:0] _m_3_io_out_QSV_0_real;
    wire [15:0] _m_3_io_out_QSV_0_imag;
    wire [15:0] _m_3_io_out_QSV_1_real;
    wire [15:0] _m_3_io_out_QSV_1_imag;
    wire [15:0] _m_3_io_out_QSV_2_real;
    wire [15:0] _m_3_io_out_QSV_2_imag;
    wire [15:0] _m_3_io_out_QSV_3_real;
    wire [15:0] _m_3_io_out_QSV_3_imag;

    wire        _m_2_io_out_valid;
    wire [15:0] _m_2_io_out_QSV_0_real;
    wire [15:0] _m_2_io_out_QSV_0_imag;
    wire [15:0] _m_2_io_out_QSV_1_real;
    wire [15:0] _m_2_io_out_QSV_1_imag;
    wire [15:0] _m_2_io_out_QSV_2_real;
    wire [15:0] _m_2_io_out_QSV_2_imag;
    wire [15:0] _m_2_io_out_QSV_3_real;
    wire [15:0] _m_2_io_out_QSV_3_imag;

    wire        _m_1_io_out_valid;
    wire [15:0] _m_1_io_out_QSV_0_real;
    wire [15:0] _m_1_io_out_QSV_0_imag;
    wire [15:0] _m_1_io_out_QSV_1_real;
    wire [15:0] _m_1_io_out_QSV_1_imag;
    wire [15:0] _m_1_io_out_QSV_2_real;
    wire [15:0] _m_1_io_out_QSV_2_imag;
    wire [15:0] _m_1_io_out_QSV_3_real;
    wire [15:0] _m_1_io_out_QSV_3_imag;

    wire        _m_io_out_valid;
    wire [15:0] _m_io_out_QSV_0_real;
    wire [15:0] _m_io_out_QSV_0_imag;
    wire [15:0] _m_io_out_QSV_1_real;
    wire [15:0] _m_io_out_QSV_1_imag;
    wire [15:0] _m_io_out_QSV_2_real;
    wire [15:0] _m_io_out_QSV_2_imag;
    wire [15:0] _m_io_out_QSV_3_real;
    wire [15:0] _m_io_out_QSV_3_imag;

    HGate2QubitVector16bit m (
        .clock(clock),
        .reset(reset),
        .io_in_valid(io_in_valid),
        .io_in_QSV_0_real(io_in_QSV_0_real),
        .io_in_QSV_0_imag(io_in_QSV_0_imag),
        .io_in_QSV_1_real(io_in_QSV_1_real),
        .io_in_QSV_1_imag(io_in_QSV_1_imag),
        .io_in_QSV_2_real(io_in_QSV_2_real),
        .io_in_QSV_2_imag(io_in_QSV_2_imag),
        .io_in_QSV_3_real(io_in_QSV_3_real),
        .io_in_QSV_3_imag(io_in_QSV_3_imag),
        .io_out_valid(_m_io_out_valid),
        .io_out_QSV_0_real(_m_io_out_QSV_0_real),
        .io_out_QSV_0_imag(_m_io_out_QSV_0_imag),
        .io_out_QSV_1_real(_m_io_out_QSV_1_real),
        .io_out_QSV_1_imag(_m_io_out_QSV_1_imag),
        .io_out_QSV_2_real(_m_io_out_QSV_2_real),
        .io_out_QSV_2_imag(_m_io_out_QSV_2_imag),
        .io_out_QSV_3_real(_m_io_out_QSV_3_real),
        .io_out_QSV_3_imag(_m_io_out_QSV_3_imag)
    );

    CompatiblePerm m_1 (
        .clock(clock),
        .reset(reset),
        .io_in_valid(_m_io_out_valid),
        .io_in_QSV_0_real(_m_io_out_QSV_0_real),
        .io_in_QSV_0_imag(_m_io_out_QSV_0_imag),
        .io_in_QSV_1_real(_m_io_out_QSV_1_real),
        .io_in_QSV_1_imag(_m_io_out_QSV_1_imag),
        .io_in_QSV_2_real(_m_io_out_QSV_2_real),
        .io_in_QSV_2_imag(_m_io_out_QSV_2_imag),
        .io_in_QSV_3_real(_m_io_out_QSV_3_real),
        .io_in_QSV_3_imag(_m_io_out_QSV_3_imag),
        .io_out_valid(_m_1_io_out_valid),
        .io_out_QSV_0_real(_m_1_io_out_QSV_0_real),
        .io_out_QSV_0_imag(_m_1_io_out_QSV_0_imag),
        .io_out_QSV_1_real(_m_1_io_out_QSV_1_real),
        .io_out_QSV_1_imag(_m_1_io_out_QSV_1_imag),
        .io_out_QSV_2_real(_m_1_io_out_QSV_2_real),
        .io_out_QSV_2_imag(_m_1_io_out_QSV_2_imag),
        .io_out_QSV_3_real(_m_1_io_out_QSV_3_real),
        .io_out_QSV_3_imag(_m_1_io_out_QSV_3_imag)
    );

    CNGate2QubitVector16bit m_2 (
        .clock(clock),
        .reset(reset),
        .io_in_valid(_m_1_io_out_valid),
        .io_in_QSV_0_real(_m_1_io_out_QSV_0_real),
        .io_in_QSV_0_imag(_m_1_io_out_QSV_0_imag),
        .io_in_QSV_1_real(_m_1_io_out_QSV_1_real),
        .io_in_QSV_1_imag(_m_1_io_out_QSV_1_imag),
        .io_in_QSV_2_real(_m_1_io_out_QSV_2_real),
        .io_in_QSV_2_imag(_m_1_io_out_QSV_2_imag),
        .io_in_QSV_3_real(_m_1_io_out_QSV_3_real),
        .io_in_QSV_3_imag(_m_1_io_out_QSV_3_imag),
        .io_out_valid(_m_2_io_out_valid),
        .io_out_QSV_0_real(_m_2_io_out_QSV_0_real),
        .io_out_QSV_0_imag(_m_2_io_out_QSV_0_imag),
        .io_out_QSV_1_real(_m_2_io_out_QSV_1_real),
        .io_out_QSV_1_imag(_m_2_io_out_QSV_1_imag),
        .io_out_QSV_2_real(_m_2_io_out_QSV_2_real),
        .io_out_QSV_2_imag(_m_2_io_out_QSV_2_imag),
        .io_out_QSV_3_real(_m_2_io_out_QSV_3_real),
        .io_out_QSV_3_imag(_m_2_io_out_QSV_3_imag)
    );

    CNGate2QubitVector16bit m_3 (
        .clock(clock),
        .reset(reset),
        .io_in_valid(_m_2_io_out_valid),
        .io_in_QSV_0_real(_m_2_io_out_QSV_0_real),
        .io_in_QSV_0_imag(_m_2_io_out_QSV_0_imag),
        .io_in_QSV_1_real(_m_2_io_out_QSV_1_real),
        .io_in_QSV_1_imag(_m_2_io_out_QSV_1_imag),
        .io_in_QSV_2_real(_m_2_io_out_QSV_2_real),
        .io_in_QSV_2_imag(_m_2_io_out_QSV_2_imag),
        .io_in_QSV_3_real(_m_2_io_out_QSV_3_real),
        .io_in_QSV_3_imag(_m_2_io_out_QSV_3_imag),
        .io_out_valid(_m_3_io_out_valid),
        .io_out_QSV_0_real(_m_3_io_out_QSV_0_real),
        .io_out_QSV_0_imag(_m_3_io_out_QSV_0_imag),
        .io_out_QSV_1_real(_m_3_io_out_QSV_1_real),
        .io_out_QSV_1_imag(_m_3_io_out_QSV_1_imag),
        .io_out_QSV_2_real(_m_3_io_out_QSV_2_real),
        .io_out_QSV_2_imag(_m_3_io_out_QSV_2_imag),
        .io_out_QSV_3_real(_m_3_io_out_QSV_3_real),
        .io_out_QSV_3_imag(_m_3_io_out_QSV_3_imag)
    );

    CompatiblePerm m_4 (
        .clock(clock),
        .reset(reset),
        .io_in_valid(_m_3_io_out_valid),
        .io_in_QSV_0_real(_m_3_io_out_QSV_0_real),
        .io_in_QSV_0_imag(_m_3_io_out_QSV_0_imag),
        .io_in_QSV_1_real(_m_3_io_out_QSV_1_real),
        .io_in_QSV_1_imag(_m_3_io_out_QSV_1_imag),
        .io_in_QSV_2_real(_m_3_io_out_QSV_2_real),
        .io_in_QSV_2_imag(_m_3_io_out_QSV_2_imag),
        .io_in_QSV_3_real(_m_3_io_out_QSV_3_real),
        .io_in_QSV_3_imag(_m_3_io_out_QSV_3_imag),
        .io_out_valid(io_out_valid),
        .io_out_QSV_0_real(io_out_QSV_0_real),
        .io_out_QSV_0_imag(io_out_QSV_0_imag),
        .io_out_QSV_1_real(io_out_QSV_1_real),
        .io_out_QSV_1_imag(io_out_QSV_1_imag),
        .io_out_QSV_2_real(io_out_QSV_2_real),
        .io_out_QSV_2_imag(io_out_QSV_2_imag),
        .io_out_QSV_3_real(io_out_QSV_3_real),
        .io_out_QSV_3_imag(io_out_QSV_3_imag)
    );

endmodule
