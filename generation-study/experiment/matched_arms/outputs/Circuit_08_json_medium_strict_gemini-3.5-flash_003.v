module Circuit_08 (
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

  // Stage 0: HGate2QubitVector16bit
  wire [15:0] h_out_QSV_0_0;
  wire [15:0] h_out_QSV_0_1;
  wire [15:0] h_out_QSV_1_0;
  wire [15:0] h_out_QSV_1_1;
  wire [15:0] h_out_QSV_2_0;
  wire [15:0] h_out_QSV_2_1;
  wire [15:0] h_out_QSV_3_0;
  wire [15:0] h_out_QSV_3_1;
  wire        h_out_valid;

  HGate2QubitVector16bit h_inst (
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
    .io_out_QSV_0_0(h_out_QSV_0_0),
    .io_out_QSV_0_1(h_out_QSV_0_1),
    .io_out_QSV_1_0(h_out_QSV_1_0),
    .io_out_QSV_1_1(h_out_QSV_1_1),
    .io_out_QSV_2_0(h_out_QSV_2_0),
    .io_out_QSV_2_1(h_out_QSV_2_1),
    .io_out_QSV_3_0(h_out_QSV_3_0),
    .io_out_QSV_3_1(h_out_QSV_3_1),
    .io_out_valid(h_out_valid)
  );

  // Stage 1: CompatiblePerm (Before CX)
  wire [15:0] perm1_out_QSV_0_0;
  wire [15:0] perm1_out_QSV_0_1;
  wire [15:0] perm1_out_QSV_1_0;
  wire [15:0] perm1_out_QSV_1_1;
  wire [15:0] perm1_out_QSV_2_0;
  wire [15:0] perm1_out_QSV_2_1;
  wire [15:0] perm1_out_QSV_3_0;
  wire [15:0] perm1_out_QSV_3_1;
  wire        perm1_out_valid;

  CompatiblePerm perm1_inst (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(h_out_QSV_0_0),
    .io_in_QSV_0_1(h_out_QSV_0_1),
    .io_in_QSV_1_0(h_out_QSV_1_0),
    .io_in_QSV_1_1(h_out_QSV_1_1),
    .io_in_QSV_2_0(h_out_QSV_2_0),
    .io_in_QSV_2_1(h_out_QSV_2_1),
    .io_in_QSV_3_0(h_out_QSV_3_0),
    .io_in_QSV_3_1(h_out_QSV_3_1),
    .io_in_valid(h_out_valid),
    .io_out_QSV_0_0(perm1_out_QSV_0_0),
    .io_out_QSV_0_1(perm1_out_QSV_0_1),
    .io_out_QSV_1_0(perm1_out_QSV_1_0),
    .io_out_QSV_1_1(perm1_out_QSV_1_1),
    .io_out_QSV_2_0(perm1_out_QSV_2_0),
    .io_out_QSV_2_1(perm1_out_QSV_2_1),
    .io_out_QSV_3_0(perm1_out_QSV_3_0),
    .io_out_QSV_3_1(perm1_out_QSV_3_1),
    .io_out_valid(perm1_out_valid)
  );

  // Stage 2: CNGate2QubitVector16bit
  wire [15:0] cx_out_QSV_0_0;
  wire [15:0] cx_out_QSV_0_1;
  wire [15:0] cx_out_QSV_1_0;
  wire [15:0] cx_out_QSV_1_1;
  wire [15:0] cx_out_QSV_2_0;
  wire [15:0] cx_out_QSV_2_1;
  wire [15:0] cx_out_QSV_3_0;
  wire [15:0] cx_out_QSV_3_1;
  wire        cx_out_valid;

  CNGate2QubitVector16bit cx_inst (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(perm1_out_QSV_0_0),
    .io_in_QSV_0_1(perm1_out_QSV_0_1),
    .io_in_QSV_1_0(perm1_out_QSV_1_0),
    .io_in_QSV_1_1(perm1_out_QSV_1_1),
    .io_in_QSV_2_0(perm1_out_QSV_2_0),
    .io_in_QSV_2_1(perm1_out_QSV_2_1),
    .io_in_QSV_3_0(perm1_out_QSV_3_0),
    .io_in_QSV_3_1(perm1_out_QSV_3_1),
    .io_in_valid(perm1_out_valid),
    .io_out_QSV_0_0(cx_out_QSV_0_0),
    .io_out_QSV_0_1(cx_out_QSV_0_1),
    .io_out_QSV_1_0(cx_out_QSV_1_0),
    .io_out_QSV_1_1(cx_out_QSV_1_1),
    .io_out_QSV_2_0(cx_out_QSV_2_0),
    .io_out_QSV_2_1(cx_out_QSV_2_1),
    .io_out_QSV_3_0(cx_out_QSV_3_0),
    .io_out_QSV_3_1(cx_out_QSV_3_1),
    .io_out_valid(cx_out_valid)
  );

  // Stage 3: CompatiblePerm (After CX)
  wire [15:0] perm2_out_QSV_0_0;
  wire [15:0] perm2_out_QSV_0_1;
  wire [15:0] perm2_out_QSV_1_0;
  wire [15:0] perm2_out_QSV_1_1;
  wire [15:0] perm2_out_QSV_2_0;
  wire [15:0] perm2_out_QSV_2_1;
  wire [15:0] perm2_out_QSV_3_0;
  wire [15:0] perm2_out_QSV_3_1;
  wire        perm2_out_valid;

  CompatiblePerm perm2_inst (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(cx_out_QSV_0_0),
    .io_in_QSV_0_1(cx_out_QSV_0_1),
    .io_in_QSV_1_0(cx_out_QSV_1_0),
    .io_in_QSV_1_1(cx_out_QSV_1_1),
    .io_in_QSV_2_0(cx_out_QSV_2_0),
    .io_in_QSV_2_1(cx_out_QSV_2_1),
    .io_in_QSV_3_0(cx_out_QSV_3_0),
    .io_in_QSV_3_1(cx_out_QSV_3_1),
    .io_in_valid(cx_out_valid),
    .io_out_QSV_0_0(perm2_out_QSV_0_0),
    .io_out_QSV_0_1(perm2_out_QSV_0_1),
    .io_out_QSV_1_0(perm2_out_QSV_1_0),
    .io_out_QSV_1_1(perm2_out_QSV_1_1),
    .io_out_QSV_2_0(perm2_out_QSV_2_0),
    .io_out_QSV_2_1(perm2_out_QSV_2_1),
    .io_out_QSV_3_0(perm2_out_QSV_3_0),
    .io_out_QSV_3_1(perm2_out_QSV_3_1),
    .io_out_valid(perm2_out_valid)
  );

  // Stage 4: SXGate2QubitVector16bit
  SXGate2QubitVector16bit sx_inst (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(perm2_out_QSV_0_0),
    .io_in_QSV_0_1(perm2_out_QSV_0_1),
    .io_in_QSV_1_0(perm2_out_QSV_1_0),
    .io_in_QSV_1_1(perm2_out_QSV_1_1),
    .io_in_QSV_2_0(perm2_out_QSV_2_0),
    .io_in_QSV_2_1(perm2_out_QSV_2_1),
    .io_in_QSV_3_0(perm2_out_QSV_3_0),
    .io_in_QSV_3_1(perm2_out_QSV_3_1),
    .io_in_valid(perm2_out_valid),
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
