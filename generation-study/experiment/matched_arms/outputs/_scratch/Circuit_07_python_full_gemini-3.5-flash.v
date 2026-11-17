module Circuit_07 (
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

  // Stage 0: m
  wire [15:0] m_io_out_QSV_0_0;
  wire [15:0] m_io_out_QSV_0_1;
  wire [15:0] m_io_out_QSV_1_0;
  wire [15:0] m_io_out_QSV_1_1;
  wire [15:0] m_io_out_QSV_2_0;
  wire [15:0] m_io_out_QSV_2_1;
  wire [15:0] m_io_out_QSV_3_0;
  wire [15:0] m_io_out_QSV_3_1;
  wire        m_io_out_valid;

  // Stage 1: m_1
  wire [15:0] m_1_io_out_QSV_0_0;
  wire [15:0] m_1_io_out_QSV_0_1;
  wire [15:0] m_1_io_out_QSV_1_0;
  wire [15:0] m_1_io_out_QSV_1_1;
  wire [15:0] m_1_io_out_QSV_2_0;
  wire [15:0] m_1_io_out_QSV_2_1;
  wire [15:0] m_1_io_out_QSV_3_0;
  wire [15:0] m_1_io_out_QSV_3_1;
  wire        m_1_io_out_valid;

  // Stage 2: m_2
  wire [15:0] m_2_io_out_QSV_0_0;
  wire [15:0] m_2_io_out_QSV_0_1;
  wire [15:0] m_2_io_out_QSV_1_0;
  wire [15:0] m_2_io_out_QSV_1_1;
  wire [15:0] m_2_io_out_QSV_2_0;
  wire [15:0] m_2_io_out_QSV_2_1;
  wire [15:0] m_2_io_out_QSV_3_0;
  wire [15:0] m_2_io_out_QSV_3_1;
  wire        m_2_io_out_valid;

  // Stage 3: m_3
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

  // Stage 1: CompatiblePerm (Permutation before CNOT target on qubit 1)
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

  // Stage 2: CNGate2QubitVector16bit
  CNGate2QubitVector16bit m_2 (
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

  // Stage 3: CompatiblePerm (Permutation after CNOT target on qubit 1)
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

  // Stage 4: HGate2QubitVector16bit
  HGate2QubitVector16bit m_4 (
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
