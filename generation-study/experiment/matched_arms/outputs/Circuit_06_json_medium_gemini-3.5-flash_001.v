module Circuit_06 (
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

  // Step 0: HGate2QubitVector16bit outputs
  wire [15:0] m_0_io_out_QSV_0_0;
  wire [15:0] m_0_io_out_QSV_0_1;
  wire [15:0] m_0_io_out_QSV_1_0;
  wire [15:0] m_0_io_out_QSV_1_1;
  wire [15:0] m_0_io_out_QSV_2_0;
  wire [15:0] m_0_io_out_QSV_2_1;
  wire [15:0] m_0_io_out_QSV_3_0;
  wire [15:0] m_0_io_out_QSV_3_1;
  wire        m_0_io_out_valid;

  // Step 1: Permutation before CX outputs
  wire [15:0] m_1_perm_in_io_out_QSV_0_0;
  wire [15:0] m_1_perm_in_io_out_QSV_0_1;
  wire [15:0] m_1_perm_in_io_out_QSV_1_0;
  wire [15:0] m_1_perm_in_io_out_QSV_1_1;
  wire [15:0] m_1_perm_in_io_out_QSV_2_0;
  wire [15:0] m_1_perm_in_io_out_QSV_2_1;
  wire [15:0] m_1_perm_in_io_out_QSV_3_0;
  wire [15:0] m_1_perm_in_io_out_QSV_3_1;
  wire        m_1_perm_in_io_out_valid;

  // Step 1: CNGate2QubitVector16bit outputs
  wire [15:0] m_1_io_out_QSV_0_0;
  wire [15:0] m_1_io_out_QSV_0_1;
  wire [15:0] m_1_io_out_QSV_1_0;
  wire [15:0] m_1_io_out_QSV_1_1;
  wire [15:0] m_1_io_out_QSV_2_0;
  wire [15:0] m_1_io_out_QSV_2_1;
  wire [15:0] m_1_io_out_QSV_3_0;
  wire [15:0] m_1_io_out_QSV_3_1;
  wire        m_1_io_out_valid;

  // Step 0: H on Qubit 0
  HGate2QubitVector16bit m_0 (
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
    .io_out_QSV_0_0(m_0_io_out_QSV_0_0),
    .io_out_QSV_0_1(m_0_io_out_QSV_0_1),
    .io_out_QSV_1_0(m_0_io_out_QSV_1_0),
    .io_out_QSV_1_1(m_0_io_out_QSV_1_1),
    .io_out_QSV_2_0(m_0_io_out_QSV_2_0),
    .io_out_QSV_2_1(m_0_io_out_QSV_2_1),
    .io_out_QSV_3_0(m_0_io_out_QSV_3_0),
    .io_out_QSV_3_1(m_0_io_out_QSV_3_1),
    .io_out_valid(m_0_io_out_valid)
  );

  // Step 1: Pre-CX Permutation (Target Qubit 1 is not Qubit 0)
  CompatiblePerm m_1_perm_in (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m_0_io_out_QSV_0_0),
    .io_in_QSV_0_1(m_0_io_out_QSV_0_1),
    .io_in_QSV_1_0(m_0_io_out_QSV_1_0),
    .io_in_QSV_1_1(m_0_io_out_QSV_1_1),
    .io_in_QSV_2_0(m_0_io_out_QSV_2_0),
    .io_in_QSV_2_1(m_0_io_out_QSV_2_1),
    .io_in_QSV_3_0(m_0_io_out_QSV_3_0),
    .io_in_QSV_3_1(m_0_io_out_QSV_3_1),
    .io_in_valid(m_0_io_out_valid),
    .io_out_QSV_0_0(m_1_perm_in_io_out_QSV_0_0),
    .io_out_QSV_0_1(m_1_perm_in_io_out_QSV_0_1),
    .io_out_QSV_1_0(m_1_perm_in_io_out_QSV_1_0),
    .io_out_QSV_1_1(m_1_perm_in_io_out_QSV_1_1),
    .io_out_QSV_2_0(m_1_perm_in_io_out_QSV_2_0),
    .io_out_QSV_2_1(m_1_perm_in_io_out_QSV_2_1),
    .io_out_QSV_3_0(m_1_perm_in_io_out_QSV_3_0),
    .io_out_QSV_3_1(m_1_perm_in_io_out_QSV_3_1),
    .io_out_valid(m_1_perm_in_io_out_valid)
  );

  // Step 1: CNGate (CX)
  CNGate2QubitVector16bit m_1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(m_1_perm_in_io_out_QSV_0_0),
    .io_in_QSV_0_1(m_1_perm_in_io_out_QSV_0_1),
    .io_in_QSV_1_0(m_1_perm_in_io_out_QSV_1_0),
    .io_in_QSV_1_1(m_1_perm_in_io_out_QSV_1_1),
    .io_in_QSV_2_0(m_1_perm_in_io_out_QSV_2_0),
    .io_in_QSV_2_1(m_1_perm_in_io_out_QSV_2_1),
    .io_in_QSV_3_0(m_1_perm_in_io_out_QSV_3_0),
    .io_in_QSV_3_1(m_1_perm_in_io_out_QSV_3_1),
    .io_in_valid(m_1_perm_in_io_out_valid),
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

  // Step 1: Post-CX Permutation
  CompatiblePerm m_1_perm_out (
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
