`timescale 1ns / 1ps

module Circuit_01 (
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

    // Intermediate signals for stage 0 (HGate2QubitVector16bit)
    wire [15:0] m_io_out_QSV_0_0;
    wire [15:0] m_io_out_QSV_0_1;
    wire [15:0] m_io_out_QSV_1_0;
    wire [15:0] m_io_out_QSV_1_1;
    wire [15:0] m_io_out_QSV_2_0;
    wire [15:0] m_io_out_QSV_2_1;
    wire [15:0] m_io_out_QSV_3_0;
    wire [15:0] m_io_out_QSV_3_1;
    wire        m_io_out_valid;

    // Stage 0: Hadamard Gate on Qubit 0
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

    // Intermediate signals for stage 1 (CompatiblePerm)
    wire [15:0] m_1_io_out_QSV_0_0;
    wire [15:0] m_1_io_out_QSV_0_1;
    wire [15:0] m_1_io_out_QSV_1_0;
    wire [15:0] m_1_io_out_QSV_1_1;
    wire [15:0] m_1_io_out_QSV_2_0;
    wire [15:0] m_1_io_out_QSV_2_1;
    wire [15:0] m_1_io_out_QSV_3_0;
    wire [15:0] m_1_io_out_QSV_3_1;
    wire        m_1_io_out_valid;

    // Stage 1: CompatiblePerm before X gate on Qubit 1
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

    // Intermediate signals for stage 2 (XGate2QubitVector16bit)
    wire [15:0] m_2_io_out_QSV_0_0;
    wire [15:0] m_2_io_out_QSV_0_1;
    wire [15:0] m_2_io_out_QSV_1_0;
    wire [15:0] m_2_io_out_QSV_1_1;
    wire [15:0] m_2_io_out_QSV_2_0;
    wire [15:0] m_2_io_out_QSV_2_1;
    wire [15:0] m_2_io_out_QSV_3_0;
    wire [15:0] m_2_io_out_QSV_3_1;
    wire        m_2_io_out_valid;

    // Stage 2: Pauli-X Gate on Qubit 1
    XGate2QubitVector16bit m_2 (
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

    // Intermediate signals for stage 3 (CompatiblePerm)
    wire [15:0] m_3_io_out_QSV_0_0;
    wire [15:0] m_3_io_out_QSV_0_1;
    wire [15:0] m_3_io_out_QSV_1_0;
    wire [15:0] m_3_io_out_QSV_1_1;
    wire [15:0] m_3_io_out_QSV_2_0;
    wire [15:0] m_3_io_out_QSV_2_1;
    wire [15:0] m_3_io_out_QSV_3_0;
    wire [15:0] m_3_io_out_QSV_3_1;
    wire        m_3_io_out_valid;

    // Stage 3: CompatiblePerm after X gate on Qubit 1
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

    // Stage 4: Swap Gate on Qubits 0 and 1 (acting on full vector, drives outputs directly)
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
