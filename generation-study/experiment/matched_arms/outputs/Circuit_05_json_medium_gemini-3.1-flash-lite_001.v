module Circuit_05 (
    input wire clock,
    input wire reset,
    input wire [15:0] io_in_QSV_0_0,
    input wire [15:0] io_in_QSV_0_1,
    input wire [15:0] io_in_QSV_1_0,
    input wire [15:0] io_in_QSV_1_1,
    input wire [15:0] io_in_QSV_2_0,
    input wire [15:0] io_in_QSV_2_1,
    input wire [15:0] io_in_QSV_3_0,
    input wire [15:0] io_in_QSV_3_1,
    input wire io_in_valid,
    output wire [15:0] io_out_QSV_0_0,
    output wire [15:0] io_out_QSV_0_1,
    output wire [15:0] io_out_QSV_1_0,
    output wire [15:0] io_out_QSV_1_1,
    output wire [15:0] io_out_QSV_2_0,
    output wire [15:0] io_out_QSV_2_1,
    output wire [15:0] io_out_QSV_3_0,
    output wire [15:0] io_out_QSV_3_1,
    output wire io_out_valid
);

    // Wires for inter-stage connections
    wire [15:0] w_h_0_0, w_h_0_1, w_h_1_0, w_h_1_1, w_h_2_0, w_h_2_1, w_h_3_0, w_h_3_1;
    wire w_h_valid;

    wire [15:0] w_perm1_0_0, w_perm1_0_1, w_perm1_1_0, w_perm1_1_1, w_perm1_2_0, w_perm1_2_1, w_perm1_3_0, w_perm1_3_1;
    wire w_perm1_valid;

    wire [15:0] w_x_0_0, w_x_0_1, w_x_1_0, w_x_1_1, w_x_2_0, w_x_2_1, w_x_3_0, w_x_3_1;
    wire w_x_valid;

    wire [15:0] w_sxdg_0_0, w_sxdg_0_1, w_sxdg_1_0, w_sxdg_1_1, w_sxdg_2_0, w_sxdg_2_1, w_sxdg_3_0, w_sxdg_3_1;
    wire w_sxdg_valid;

    wire [15:0] w_perm2_0_0, w_perm2_0_1, w_perm2_1_0, w_perm2_1_1, w_perm2_2_0, w_perm2_2_1, w_perm2_3_0, w_perm2_3_1;
    wire w_perm2_valid;

    // Step 0: H on 0
    HGate2QubitVector16bit m_0 (
        .clock(clock), .reset(reset), .io_in_valid(io_in_valid),
        .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
        .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
        .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_out_QSV_0_0(w_h_0_0), .io_out_QSV_0_1(w_h_0_1),
        .io_out_QSV_1_0(w_h_1_0), .io_out_QSV_1_1(w_h_1_1),
        .io_out_QSV_2_0(w_h_2_0), .io_out_QSV_2_1(w_h_2_1),
        .io_out_QSV_3_0(w_h_3_0), .io_out_QSV_3_1(w_h_3_1),
        .io_out_valid(w_h_valid)
    );

    // Permutation before qubit 1 operations
    CompatiblePerm m_perm1 (
        .clock(clock), .reset(reset), .io_in_valid(w_h_valid),
        .io_in_QSV_0_0(w_h_0_0), .io_in_QSV_0_1(w_h_0_1),
        .io_in_QSV_1_0(w_h_1_0), .io_in_QSV_1_1(w_h_1_1),
        .io_in_QSV_2_0(w_h_2_0), .io_in_QSV_2_1(w_h_2_1),
        .io_in_QSV_3_0(w_h_3_0), .io_in_QSV_3_1(w_h_3_1),
        .io_out_QSV_0_0(w_perm1_0_0), .io_out_QSV_0_1(w_perm1_0_1),
        .io_out_QSV_1_0(w_perm1_1_0), .io_out_QSV_1_1(w_perm1_1_1),
        .io_out_QSV_2_0(w_perm1_2_0), .io_out_QSV_2_1(w_perm1_2_1),
        .io_out_QSV_3_0(w_perm1_3_0), .io_out_QSV_3_1(w_perm1_3_1),
        .io_out_valid(w_perm1_valid)
    );

    // Step 1: X on 1
    XGate2QubitVector16bit m_1 (
        .clock(clock), .reset(reset), .io_in_valid(w_perm1_valid),
        .io_in_QSV_0_0(w_perm1_0_0), .io_in_QSV_0_1(w_perm1_0_1),
        .io_in_QSV_1_0(w_perm1_1_0), .io_in_QSV_1_1(w_perm1_1_1),
        .io_in_QSV_2_0(w_perm1_2_0), .io_in_QSV_2_1(w_perm1_2_1),
        .io_in_QSV_3_0(w_perm1_3_0), .io_in_QSV_3_1(w_perm1_3_1),
        .io_out_QSV_0_0(w_x_0_0), .io_out_QSV_0_1(w_x_0_1),
        .io_out_QSV_1_0(w_x_1_0), .io_out_QSV_1_1(w_x_1_1),
        .io_out_QSV_2_0(w_x_2_0), .io_out_QSV_2_1(w_x_2_1),
        .io_out_QSV_3_0(w_x_3_0), .io_out_QSV_3_1(w_x_3_1),
        .io_out_valid(w_x_valid)
    );

    // Step 2: SXdg on 1
    SXDGate2QubitVector16bit m_2 (
        .clock(clock), .reset(reset), .io_in_valid(w_x_valid),
        .io_in_QSV_0_0(w_x_0_0), .io_in_QSV_0_1(w_x_0_1),
        .io_in_QSV_1_0(w_x_1_0), .io_in_QSV_1_1(w_x_1_1),
        .io_in_QSV_2_0(w_x_2_0), .io_in_QSV_2_1(w_x_2_1),
        .io_in_QSV_3_0(w_x_3_0), .io_in_QSV_3_1(w_x_3_1),
        .io_out_QSV_0_0(w_sxdg_0_0), .io_out_QSV_0_1(w_sxdg_0_1),
        .io_out_QSV_1_0(w_sxdg_1_0), .io_out_QSV_1_1(w_sxdg_1_1),
        .io_out_QSV_2_0(w_sxdg_2_0), .io_out_QSV_2_1(w_sxdg_2_1),
        .io_out_QSV_3_0(w_sxdg_3_0), .io_out_QSV_3_1(w_sxdg_3_1),
        .io_out_valid(w_sxdg_valid)
    );

    // Permutation after qubit 1 operations
    CompatiblePerm m_perm2 (
        .clock(clock), .reset(reset), .io_in_valid(w_sxdg_valid),
        .io_in_QSV_0_0(w_sxdg_0_0), .io_in_QSV_0_1(w_sxdg_0_1),
        .io_in_QSV_1_0(w_sxdg_1_0), .io_in_QSV_1_1(w_sxdg_1_1),
        .io_in_QSV_2_0(w_sxdg_2_0), .io_in_QSV_2_1(w_sxdg_2_1),
        .io_in_QSV_3_0(w_sxdg_3_0), .io_in_QSV_3_1(w_sxdg_3_1),
        .io_out_QSV_0_0(w_perm2_0_0), .io_out_QSV_0_1(w_perm2_0_1),
        .io_out_QSV_1_0(w_perm2_1_0), .io_out_QSV_1_1(w_perm2_1_1),
        .io_out_QSV_2_0(w_perm2_2_0), .io_out_QSV_2_1(w_perm2_2_1),
        .io_out_QSV_3_0(w_perm2_3_0), .io_out_QSV_3_1(w_perm2_3_1),
        .io_out_valid(w_perm2_valid)
    );

    // Step 3: SWAP
    SWGate2QubitVector16bit m_3 (
        .clock(clock), .reset(reset), .io_in_valid(w_perm2_valid),
        .io_in_QSV_0_0(w_perm2_0_0), .io_in_QSV_0_1(w_perm2_0_1),
        .io_in_QSV_1_0(w_perm2_1_0), .io_in_QSV_1_1(w_perm2_1_1),
        .io_in_QSV_2_0(w_perm2_2_0), .io_in_QSV_2_1(w_perm2_2_1),
        .io_in_QSV_3_0(w_perm2_3_0), .io_in_QSV_3_1(w_perm2_3_1),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_valid(io_out_valid)
    );

endmodule
