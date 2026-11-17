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

    // Stage 0: HGate on Qubit 0
    wire [15:0] hgate_0_out_QSV_0_0;
    wire [15:0] hgate_0_out_QSV_0_1;
    wire [15:0] hgate_0_out_QSV_1_0;
    wire [15:0] hgate_0_out_QSV_1_1;
    wire [15:0] hgate_0_out_QSV_2_0;
    wire [15:0] hgate_0_out_QSV_2_1;
    wire [15:0] hgate_0_out_QSV_3_0;
    wire [15:0] hgate_0_out_QSV_3_1;
    wire        hgate_0_out_valid;

    HGate2QubitVector16bit hgate_0 (
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
        .io_out_QSV_0_0(hgate_0_out_QSV_0_0),
        .io_out_QSV_0_1(hgate_0_out_QSV_0_1),
        .io_out_QSV_1_0(hgate_0_out_QSV_1_0),
        .io_out_QSV_1_1(hgate_0_out_QSV_1_1),
        .io_out_QSV_2_0(hgate_0_out_QSV_2_0),
        .io_out_QSV_2_1(hgate_0_out_QSV_2_1),
        .io_out_QSV_3_0(hgate_0_out_QSV_3_0),
        .io_out_QSV_3_1(hgate_0_out_QSV_3_1),
        .io_out_valid(hgate_0_out_valid)
    );

    // Permutation before gates on Qubit 1
    wire [15:0] perm_1_out_QSV_0_0;
    wire [15:0] perm_1_out_QSV_0_1;
    wire [15:0] perm_1_out_QSV_1_0;
    wire [15:0] perm_1_out_QSV_1_1;
    wire [15:0] perm_1_out_QSV_2_0;
    wire [15:0] perm_1_out_QSV_2_1;
    wire [15:0] perm_1_out_QSV_3_0;
    wire [15:0] perm_1_out_QSV_3_1;
    wire        perm_1_out_valid;

    CompatiblePerm perm_1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(hgate_0_out_QSV_0_0),
        .io_in_QSV_0_1(hgate_0_out_QSV_0_1),
        .io_in_QSV_1_0(hgate_0_out_QSV_1_0),
        .io_in_QSV_1_1(hgate_0_out_QSV_1_1),
        .io_in_QSV_2_0(hgate_0_out_QSV_2_0),
        .io_in_QSV_2_1(hgate_0_out_QSV_2_1),
        .io_in_QSV_3_0(hgate_0_out_QSV_3_0),
        .io_in_QSV_3_1(hgate_0_out_QSV_3_1),
        .io_in_valid(hgate_0_out_valid),
        .io_out_QSV_0_0(perm_1_out_QSV_0_0),
        .io_out_QSV_0_1(perm_1_out_QSV_0_1),
        .io_out_QSV_1_0(perm_1_out_QSV_1_0),
        .io_out_QSV_1_1(perm_1_out_QSV_1_1),
        .io_out_QSV_2_0(perm_1_out_QSV_2_0),
        .io_out_QSV_2_1(perm_1_out_QSV_2_1),
        .io_out_QSV_3_0(perm_1_out_QSV_3_0),
        .io_out_QSV_3_1(perm_1_out_QSV_3_1),
        .io_out_valid(perm_1_out_valid)
    );

    // Stage 1: XGate on Qubit 1 (permuted to Qubit 0)
    wire [15:0] xgate_1_out_QSV_0_0;
    wire [15:0] xgate_1_out_QSV_0_1;
    wire [15:0] xgate_1_out_QSV_1_0;
    wire [15:0] xgate_1_out_QSV_1_1;
    wire [15:0] xgate_1_out_QSV_2_0;
    wire [15:0] xgate_1_out_QSV_2_1;
    wire [15:0] xgate_1_out_QSV_3_0;
    wire [15:0] xgate_1_out_QSV_3_1;
    wire        xgate_1_out_valid;

    XGate2QubitVector16bit xgate_1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(perm_1_out_QSV_0_0),
        .io_in_QSV_0_1(perm_1_out_QSV_0_1),
        .io_in_QSV_1_0(perm_1_out_QSV_1_0),
        .io_in_QSV_1_1(perm_1_out_QSV_1_1),
        .io_in_QSV_2_0(perm_1_out_QSV_2_0),
        .io_in_QSV_2_1(perm_1_out_QSV_2_1),
        .io_in_QSV_3_0(perm_1_out_QSV_3_0),
        .io_in_QSV_3_1(perm_1_out_QSV_3_1),
        .io_in_valid(perm_1_out_valid),
        .io_out_QSV_0_0(xgate_1_out_QSV_0_0),
        .io_out_QSV_0_1(xgate_1_out_QSV_0_1),
        .io_out_QSV_1_0(xgate_1_out_QSV_1_0),
        .io_out_QSV_1_1(xgate_1_out_QSV_1_1),
        .io_out_QSV_2_0(xgate_1_out_QSV_2_0),
        .io_out_QSV_2_1(xgate_1_out_QSV_2_1),
        .io_out_QSV_3_0(xgate_1_out_QSV_3_0),
        .io_out_QSV_3_1(xgate_1_out_QSV_3_1),
        .io_out_valid(xgate_1_out_valid)
    );

    // Stage 2: HGate on Qubit 1 (permuted to Qubit 0)
    wire [15:0] hgate_2_out_QSV_0_0;
    wire [15:0] hgate_2_out_QSV_0_1;
    wire [15:0] hgate_2_out_QSV_1_0;
    wire [15:0] hgate_2_out_QSV_1_1;
    wire [15:0] hgate_2_out_QSV_2_0;
    wire [15:0] hgate_2_out_QSV_2_1;
    wire [15:0] hgate_2_out_QSV_3_0;
    wire [15:0] hgate_2_out_QSV_3_1;
    wire        hgate_2_out_valid;

    HGate2QubitVector16bit hgate_2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(xgate_1_out_QSV_0_0),
        .io_in_QSV_0_1(xgate_1_out_QSV_0_1),
        .io_in_QSV_1_0(xgate_1_out_QSV_1_0),
        .io_in_QSV_1_1(xgate_1_out_QSV_1_1),
        .io_in_QSV_2_0(xgate_1_out_QSV_2_0),
        .io_in_QSV_2_1(xgate_1_out_QSV_2_1),
        .io_in_QSV_3_0(xgate_1_out_QSV_3_0),
        .io_in_QSV_3_1(xgate_1_out_QSV_3_1),
        .io_in_valid(xgate_1_out_valid),
        .io_out_QSV_0_0(hgate_2_out_QSV_0_0),
        .io_out_QSV_0_1(hgate_2_out_QSV_0_1),
        .io_out_QSV_1_0(hgate_2_out_QSV_1_0),
        .io_out_QSV_1_1(hgate_2_out_QSV_1_1),
        .io_out_QSV_2_0(hgate_2_out_QSV_2_0),
        .io_out_QSV_2_1(hgate_2_out_QSV_2_1),
        .io_out_QSV_3_0(hgate_2_out_QSV_3_0),
        .io_out_QSV_3_1(hgate_2_out_QSV_3_1),
        .io_out_valid(hgate_2_out_valid)
    );

    // Permutation after gates on Qubit 1
    wire [15:0] perm_2_out_QSV_0_0;
    wire [15:0] perm_2_out_QSV_0_1;
    wire [15:0] perm_2_out_QSV_1_0;
    wire [15:0] perm_2_out_QSV_1_1;
    wire [15:0] perm_2_out_QSV_2_0;
    wire [15:0] perm_2_out_QSV_2_1;
    wire [15:0] perm_2_out_QSV_3_0;
    wire [15:0] perm_2_out_QSV_3_1;
    wire        perm_2_out_valid;

    CompatiblePerm perm_2 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(hgate_2_out_QSV_0_0),
        .io_in_QSV_0_1(hgate_2_out_QSV_0_1),
        .io_in_QSV_1_0(hgate_2_out_QSV_1_0),
        .io_in_QSV_1_1(hgate_2_out_QSV_1_1),
        .io_in_QSV_2_0(hgate_2_out_QSV_2_0),
        .io_in_QSV_2_1(hgate_2_out_QSV_2_1),
        .io_in_QSV_3_0(hgate_2_out_QSV_3_0),
        .io_in_QSV_3_1(hgate_2_out_QSV_3_1),
        .io_in_valid(hgate_2_out_valid),
        .io_out_QSV_0_0(perm_2_out_QSV_0_0),
        .io_out_QSV_0_1(perm_2_out_QSV_0_1),
        .io_out_QSV_1_0(perm_2_out_QSV_1_0),
        .io_out_QSV_1_1(perm_2_out_QSV_1_1),
        .io_out_QSV_2_0(perm_2_out_QSV_2_0),
        .io_out_QSV_2_1(perm_2_out_QSV_2_1),
        .io_out_QSV_3_0(perm_2_out_QSV_3_0),
        .io_out_QSV_3_1(perm_2_out_QSV_3_1),
        .io_out_valid(perm_2_out_valid)
    );

    // Stage 3: SWAP gate on Qubits 0 and 1
    SWGate2QubitVector16bit swgate_3 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(perm_2_out_QSV_0_0),
        .io_in_QSV_0_1(perm_2_out_QSV_0_1),
        .io_in_QSV_1_0(perm_2_out_QSV_1_0),
        .io_in_QSV_1_1(perm_2_out_QSV_1_1),
        .io_in_QSV_2_0(perm_2_out_QSV_2_0),
        .io_in_QSV_2_1(perm_2_out_QSV_2_1),
        .io_in_QSV_3_0(perm_2_out_QSV_3_0),
        .io_in_QSV_3_1(perm_2_out_QSV_3_1),
        .io_in_valid(perm_2_out_valid),
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
