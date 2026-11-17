module Circuit_06 (
    input  logic clock,
    input  logic reset,
    input  logic [15:0] io_in_QSV_0_0,
    input  logic [15:0] io_in_QSV_0_1,
    input  logic [15:0] io_in_QSV_1_0,
    input  logic [15:0] io_in_QSV_1_1,
    input  logic [15:0] io_in_QSV_2_0,
    input  logic [15:0] io_in_QSV_2_1,
    input  logic [15:0] io_in_QSV_3_0,
    input  logic [15:0] io_in_QSV_3_1,
    input  logic io_in_valid,
    output logic [15:0] io_out_QSV_0_0,
    output logic [15:0] io_out_QSV_0_1,
    output logic [15:0] io_out_QSV_1_0,
    output logic [15:0] io_out_QSV_1_1,
    output logic [15:0] io_out_QSV_2_0,
    output logic [15:0] io_out_QSV_2_1,
    output logic [15:0] io_out_QSV_3_0,
    output logic [15:0] io_out_QSV_3_1,
    output logic io_out_valid
);

    logic [15:0] m0_out_QSV_0_0, m0_out_QSV_0_1, m0_out_QSV_1_0, m0_out_QSV_1_1;
    logic [15:0] m0_out_QSV_2_0, m0_out_QSV_2_1, m0_out_QSV_3_0, m0_out_QSV_3_1;
    logic m0_out_valid;

    // Step 0: H on qubit 0
    HGate2QubitVector16bit m0 (
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
        .io_out_QSV_0_0(m0_out_QSV_0_0),
        .io_out_QSV_0_1(m0_out_QSV_0_1),
        .io_out_QSV_1_0(m0_out_QSV_1_0),
        .io_out_QSV_1_1(m0_out_QSV_1_1),
        .io_out_QSV_2_0(m0_out_QSV_2_0),
        .io_out_QSV_2_1(m0_out_QSV_2_1),
        .io_out_QSV_3_0(m0_out_QSV_3_0),
        .io_out_QSV_3_1(m0_out_QSV_3_1),
        .io_out_valid(m0_out_valid)
    );

    // Step 1: CX on qubit 0 (control), qubit 1 (target)
    // Target is non-zero, so use CompatiblePerm before and after
    logic [15:0] perm1_QSV_0_0, perm1_QSV_0_1, perm1_QSV_1_0, perm1_QSV_1_1;
    logic [15:0] perm1_QSV_2_0, perm1_QSV_2_1, perm1_QSV_3_0, perm1_QSV_3_1;
    
    CompatiblePerm perm1 (
        .io_in_QSV_0_0(m0_out_QSV_0_0), .io_in_QSV_0_1(m0_out_QSV_0_1),
        .io_in_QSV_1_0(m0_out_QSV_1_0), .io_in_QSV_1_1(m0_out_QSV_1_1),
        .io_in_QSV_2_0(m0_out_QSV_2_0), .io_in_QSV_2_1(m0_out_QSV_2_1),
        .io_in_QSV_3_0(m0_out_QSV_3_0), .io_in_QSV_3_1(m0_out_QSV_3_1),
        .io_out_QSV_0_0(perm1_QSV_0_0), .io_out_QSV_0_1(perm1_QSV_0_1),
        .io_out_QSV_1_0(perm1_QSV_2_0), .io_out_QSV_1_1(perm1_QSV_2_1),
        .io_out_QSV_2_0(perm1_QSV_1_0), .io_out_QSV_2_1(perm1_QSV_1_1),
        .io_out_QSV_3_0(perm1_QSV_3_0), .io_out_QSV_3_1(perm1_QSV_3_1)
    );

    CNGate2QubitVector16bit m1 (
        .clock(clock),
        .reset(reset),
        .io_in_QSV_0_0(perm1_QSV_0_0),
        .io_in_QSV_0_1(perm1_QSV_0_1),
        .io_in_QSV_1_0(perm1_QSV_1_0),
        .io_in_QSV_1_1(perm1_QSV_1_1),
        .io_in_QSV_2_0(perm1_QSV_2_0),
        .io_in_QSV_2_1(perm1_QSV_2_1),
        .io_in_QSV_3_0(perm1_QSV_3_0),
        .io_in_QSV_3_1(perm1_QSV_3_1),
        .io_in_valid(m0_out_valid),
        .io_out_QSV_0_0(perm1_QSV_0_0),
        .io_out_QSV_0_1(perm1_QSV_0_1),
        .io_out_QSV_1_0(perm1_QSV_2_0),
        .io_out_QSV_1_1(perm1_QSV_2_1),
        .io_out_QSV_2_0(perm1_QSV_1_0),
        .io_out_QSV_2_1(perm1_QSV_1_1),
        .io_out_QSV_3_0(perm1_QSV_3_0),
        .io_out_QSV_3_1(perm1_QSV_3_1),
        .io_out_valid(io_out_valid)
    );

    // Permutation rule: apply final permutation after non-zero target gate
    CompatiblePerm perm2 (
        .io_in_QSV_0_0(perm1_QSV_0_0), .io_in_QSV_0_1(perm1_QSV_0_1),
        .io_in_QSV_1_0(perm1_QSV_1_0), .io_in_QSV_1_1(perm1_QSV_1_1),
        .io_in_QSV_2_0(perm1_QSV_2_0), .io_in_QSV_2_1(perm1_QSV_2_1),
        .io_in_QSV_3_0(perm1_QSV_3_0), .io_in_QSV_3_1(perm1_QSV_3_1),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_2_0), .io_out_QSV_1_1(io_out_QSV_2_1),
        .io_out_QSV_2_0(io_out_QSV_1_0), .io_out_QSV_2_1(io_out_QSV_1_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1)
    );

endmodule
