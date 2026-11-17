module Circuit_03 (
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

    // Wires for inter-stage connectivity
    wire [15:0] w0_0_0, w0_0_1, w0_1_0, w0_1_1, w0_2_0, w0_2_1, w0_3_0, w0_3_1, w0_v;
    wire [15:0] w1_0_0, w1_0_1, w1_1_0, w1_1_1, w1_2_0, w1_2_1, w1_3_0, w1_3_1, w1_v;
    wire [15:0] w2_0_0, w2_0_1, w2_1_0, w2_1_1, w2_2_0, w2_2_1, w2_3_0, w2_3_1, w2_v;
    wire [15:0] w3_0_0, w3_0_1, w3_1_0, w3_1_1, w3_2_0, w3_2_1, w3_3_0, w3_3_1, w3_v;

    // Step 0: H on qubit 0 (No perm needed)
    HGate2QubitVector16bit m0 (
        .clock(clock), .reset(reset), .io_in_valid(io_in_valid),
        .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
        .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
        .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
        .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
        .io_out_QSV_0_0(w0_0_0), .io_out_QSV_0_1(w0_0_1),
        .io_out_QSV_1_0(w0_1_0), .io_out_QSV_1_1(w0_1_1),
        .io_out_QSV_2_0(w0_2_0), .io_out_QSV_2_1(w0_2_1),
        .io_out_QSV_3_0(w0_3_0), .io_out_QSV_3_1(w0_3_1),
        .io_out_valid(w0_v)
    );

    // Step 1 & 2: X, H on qubit 1 (Requires permutation bracket)
    // Permutation rule: insert before and after
    wire [15:0] p1_in_0_0, p1_in_0_1, p1_in_1_0, p1_in_1_1, p1_in_2_0, p1_in_2_1, p1_in_3_0, p1_in_3_1;
    CompatiblePerm perm1_in (.in_0(w0_0_0), .in_1(w0_1_0), .in_2(w0_2_0), .in_3(w0_3_0), 
                             .out_0(p1_in_0_0), .out_1(p1_in_1_0), .out_2(p1_in_2_0), .out_3(p1_in_3_0));
    // Complex part perm
    wire [15:0] p1_in_0_1_r, p1_in_1_1_r, p1_in_2_1_r, p1_in_3_1_r;
    CompatiblePerm perm1_in_i (.in_0(w0_0_1), .in_1(w0_1_1), .in_2(w0_2_1), .in_3(w0_3_1), 
                               .out_0(p1_in_0_1_r), .out_1(p1_in_1_1_r), .out_2(p1_in_2_1_r), .out_3(p1_in_3_1_r));

    XGate2QubitVector16bit m1 (
        .clock(clock), .reset(reset), .io_in_valid(w0_v),
        .io_in_QSV_0_0(p1_in_0_0), .io_in_QSV_0_1(p1_in_0_1_r),
        .io_in_QSV_1_0(p1_in_1_0), .io_in_QSV_1_1(p1_in_1_1_r),
        .io_in_QSV_2_0(p1_in_2_0), .io_in_QSV_2_1(p1_in_2_1_r),
        .io_in_QSV_3_0(p1_in_3_0), .io_in_QSV_3_1(p1_in_3_1_r),
        .io_out_QSV_0_0(w1_0_0), .io_out_QSV_0_1(w1_0_1),
        .io_out_QSV_1_0(w1_1_0), .io_out_QSV_1_1(w1_1_1),
        .io_out_QSV_2_0(w1_2_0), .io_out_QSV_2_1(w1_2_1),
        .io_out_QSV_3_0(w1_3_0), .io_out_QSV_3_1(w1_3_1),
        .io_out_valid(w1_v)
    );

    HGate2QubitVector16bit m2 (
        .clock(clock), .reset(reset), .io_in_valid(w1_v),
        .io_in_QSV_0_0(w1_0_0), .io_in_QSV_0_1(w1_0_1),
        .io_in_QSV_1_0(w1_1_0), .io_in_QSV_1_1(w1_1_1),
        .io_in_QSV_2_0(w1_2_0), .io_in_QSV_2_1(w1_2_1),
        .io_in_QSV_3_0(w1_3_0), .io_in_QSV_3_1(w1_3_1),
        .io_out_QSV_0_0(w2_0_0), .io_out_QSV_0_1(w2_0_1),
        .io_out_QSV_1_0(w2_1_0), .io_out_QSV_1_1(w2_1_1),
        .io_out_QSV_2_0(w2_2_0), .io_out_QSV_2_1(w2_2_1),
        .io_out_QSV_3_0(w2_3_0), .io_out_QSV_3_1(w2_3_1),
        .io_out_valid(w2_v)
    );

    CompatiblePerm perm1_out (.in_0(w2_0_0), .in_1(w2_1_0), .in_2(w2_2_0), .in_3(w2_3_0),
                              .out_0(w3_0_0), .out_1(w3_1_0), .out_2(w3_2_0), .out_3(w3_3_0));
    CompatiblePerm perm1_out_i (.in_0(w2_0_1), .in_1(w2_1_1), .in_2(w2_2_1), .in_3(w2_3_1),
                                .out_0(w3_0_1), .out_1(w3_1_1), .out_2(w3_2_1), .out_3(w3_3_1));
    assign w3_v = w2_v;

    // Step 3: Swap (No perm needed)
    SWGate2QubitVector16bit m3 (
        .clock(clock), .reset(reset), .io_in_valid(w3_v),
        .io_in_QSV_0_0(w3_0_0), .io_in_QSV_0_1(w3_0_1),
        .io_in_QSV_1_0(w3_1_0), .io_in_QSV_1_1(w3_1_1),
        .io_in_QSV_2_0(w3_2_0), .io_in_QSV_2_1(w3_2_1),
        .io_in_QSV_3_0(w3_3_0), .io_in_QSV_3_1(w3_3_1),
        .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
        .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
        .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
        .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
        .io_out_valid(io_out_valid)
    );

endmodule
