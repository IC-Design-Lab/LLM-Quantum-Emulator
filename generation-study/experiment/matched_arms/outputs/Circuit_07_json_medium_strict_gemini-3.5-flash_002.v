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

  // Intermediate signals for m_0 (HGate2QubitVector16bit)
  logic [15:0] m_0_io_out_QSV_0_0;
  logic [15:0] m_0_io_out_QSV_0_1;
  logic [15:0] m_0_io_out_QSV_1_0;
  logic [15:0] m_0_io_out_QSV_1_1;
  logic [15:0] m_0_io_out_QSV_2_0;
  logic [15:0] m_0_io_out_QSV_2_1;
  logic [15:0] m_0_io_out_QSV_3_0;
  logic [15:0] m_0_io_out_QSV_3_1;
  logic        m_0_io_out_valid;

  // Intermediate signals for m_1 (CompatiblePerm)
  logic [15:0] m_1_io_out_QSV_0_0;
  logic [15:0] m_1_io_out_QSV_0_1;
  logic [15:0] m_1_io_out_QSV_1_0;
  logic [15:0] m_1_io_out_QSV_1_1;
  logic [15:0] m_1_io_out_QSV_2_0;
  logic [15:0] m_1_io_out_QSV_2_1;
  logic [15:0] m_1_io_out_QSV_3_0;
  logic [15:0] m_1_io_out_QSV_3_1;
  logic        m_1_io_out_valid;

  // Intermediate signals for m_2 (CNGate2QubitVector16bit)
  logic [15:0] m_2_io_out_QSV_0_0;
  logic [15:0] m_2_io_out_QSV_0_1;
  logic [15:0] m_2_io_out_QSV_1_0;
  logic [15:0] m_2_io_out_QSV_1_1;
  logic [15:0] m_2_io_out_QSV_2_0;
  logic [15:0] m_2_io_out_QSV_2_1;
  logic [15:0] m_2_io_out_QSV_3_0;
  logic [15:0] m_2_io_out_QSV_3_1;
  logic        m_2_io_out_valid;

  // Intermediate signals for m_3 (CompatiblePerm)
  logic [15:0] m_3_io_out_QSV_0_0;
  logic [15:0] m_3_io_out_QSV_0_1;
  logic [15:0] m_3_io_out_QSV_1_0;
  logic [15:0] m_3_io_out_QSV_1_1;
  logic [15:0] m_3_io_out_QSV_2_0;
  logic [15:0] m_3_io_out_QSV_2_1;
  logic [15:0] m_3_io_out_QSV_3_0;
  logic [15:0] m_3_io_out_QSV_3_1;
  logic        m_3_io_out_valid;

  // Stage 0: H on qubit 0
  HGate2QubitVector16bit m_0 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (io_in_QSV_0_0),
    .io_in_QSV_0_1  (io_in_QSV_0_1),
    .io_in_QSV_1_0  (io_in_QSV_1_0),
    .io_in_QSV_1_1  (io_in_QSV_1_1),
    .io_in_QSV_2_0  (io_in_QSV_2_0),
    .io_in_QSV_2_1  (io_in_QSV_2_1),
    .io_in_QSV_3_0  (io_in_QSV_3_0),
    .io_in_QSV_3_1  (io_in_QSV_3_1),
    .io_in_valid    (io_in_valid),
    .io_out_QSV_0_0 (m_0_io_out_QSV_0_0),
    .io_out_QSV_0_1 (m_0_io_out_QSV_0_1),
    .io_out_QSV_1_0 (m_0_io_out_QSV_1_0),
    .io_out_QSV_1_1 (m_0_io_out_QSV_1_1),
    .io_out_QSV_2_0 (m_0_io_out_QSV_2_0),
    .io_out_QSV_2_1 (m_0_io_out_QSV_2_1),
    .io_out_QSV_3_0 (m_0_io_out_QSV_3_0),
    .io_out_QSV_3_1 (m_0_io_out_QSV_3_1),
    .io_out_valid   (m_0_io_out_valid)
  );

  // Stage 1: CompatiblePerm before CX (target is qubit 1)
  CompatiblePerm m_1 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (m_0_io_out_QSV_0_0),
    .io_in_QSV_0_1  (m_0_io_out_QSV_0_1),
    .io_in_QSV_1_0  (m_0_io_out_QSV_1_0),
    .io_in_QSV_1_1  (m_0_io_out_QSV_1_1),
    .io_in_QSV_2_0  (m_0_io_out_QSV_2_0),
    .io_in_QSV_2_1  (m_0_io_out_QSV_2_1),
    .io_in_QSV_3_0  (m_0_io_out_QSV_3_0),
    .io_in_QSV_3_1  (m_0_io_out_QSV_3_1),
    .io_in_valid    (m_0_io_out_valid),
    .io_out_QSV_0_0 (m_1_io_out_QSV_0_0),
    .io_out_QSV_0_1 (m_1_io_out_QSV_0_1),
    .io_out_QSV_1_0 (m_1_io_out_QSV_1_0),
    .io_out_QSV_1_1 (m_1_io_out_QSV_1_1),
    .io_out_QSV_2_0 (m_1_io_out_QSV_2_0),
    .io_out_QSV_2_1 (m_1_io_out_QSV_2_1),
    .io_out_QSV_3_0 (m_1_io_out_QSV_3_0),
    .io_out_QSV_3_1 (m_1_io_out_QSV_3_1),
    .io_out_valid   (m_1_io_out_valid)
  );

  // Stage 2: CX on qubits 0, 1
  CNGate2QubitVector16bit m_2 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (m_1_io_out_QSV_0_0),
    .io_in_QSV_0_1  (m_1_io_out_QSV_0_1),
    .io_in_QSV_1_0  (m_1_io_out_QSV_1_0),
    .io_in_QSV_1_1  (m_1_io_out_QSV_1_1),
    .io_in_QSV_2_0  (m_1_io_out_QSV_2_0),
    .io_in_QSV_2_1  (m_1_io_out_QSV_2_1),
    .io_in_QSV_3_0  (m_1_io_out_QSV_3_0),
    .io_in_QSV_3_1  (m_1_io_out_QSV_3_1),
    .io_in_valid    (m_1_io_out_valid),
    .io_out_QSV_0_0 (m_2_io_out_QSV_0_0),
    .io_out_QSV_0_1 (m_2_io_out_QSV_0_1),
    .io_out_QSV_1_0 (m_2_io_out_QSV_1_0),
    .io_out_QSV_1_1 (m_2_io_out_QSV_1_1),
    .io_out_QSV_2_0 (m_2_io_out_QSV_2_0),
    .io_out_QSV_2_1 (m_2_io_out_QSV_2_1),
    .io_out_QSV_3_0 (m_2_io_out_QSV_3_0),
    .io_out_QSV_3_1 (m_2_io_out_QSV_3_1),
    .io_out_valid   (m_2_io_out_valid)
  );

  // Stage 3: CompatiblePerm after CX
  CompatiblePerm m_3 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (m_2_io_out_QSV_0_0),
    .io_in_QSV_0_1  (m_2_io_out_QSV_0_1),
    .io_in_QSV_1_0  (m_2_io_out_QSV_1_0),
    .io_in_QSV_1_1  (m_2_io_out_QSV_1_1),
    .io_in_QSV_2_0  (m_2_io_out_QSV_2_0),
    .io_in_QSV_2_1  (m_2_io_out_QSV_2_1),
    .io_in_QSV_3_0  (m_2_io_out_QSV_3_0),
    .io_in_QSV_3_1  (m_2_io_out_QSV_3_1),
    .io_in_valid    (m_2_io_out_valid),
    .io_out_QSV_0_0 (m_3_io_out_QSV_0_0),
    .io_out_QSV_0_1 (m_3_io_out_QSV_0_1),
    .io_out_QSV_1_0 (m_3_io_out_QSV_1_0),
    .io_out_QSV_1_1 (m_3_io_out_QSV_1_1),
    .io_out_QSV_2_0 (m_3_io_out_QSV_2_0),
    .io_out_QSV_2_1 (m_3_io_out_QSV_2_1),
    .io_out_QSV_3_0 (m_3_io_out_QSV_3_0),
    .io_out_QSV_3_1 (m_3_io_out_QSV_3_1),
    .io_out_valid   (m_3_io_out_valid)
  );

  // Stage 4: H on qubit 0
  HGate2QubitVector16bit m_4 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (m_3_io_out_QSV_0_0),
    .io_in_QSV_0_1  (m_3_io_out_QSV_0_1),
    .io_in_QSV_1_0  (m_3_io_out_QSV_1_0),
    .io_in_QSV_1_1  (m_3_io_out_QSV_1_1),
    .io_in_QSV_2_0  (m_3_io_out_QSV_2_0),
    .io_in_QSV_2_1  (m_3_io_out_QSV_2_1),
    .io_in_QSV_3_0  (m_3_io_out_QSV_3_0),
    .io_in_QSV_3_1  (m_3_io_out_QSV_3_1),
    .io_in_valid    (m_3_io_out_valid),
    .io_out_QSV_0_0 (io_out_QSV_0_0),
    .io_out_QSV_0_1 (io_out_QSV_0_1),
    .io_out_QSV_1_0 (io_out_QSV_1_0),
    .io_out_QSV_1_1 (io_out_QSV_1_1),
    .io_out_QSV_2_0 (io_out_QSV_2_0),
    .io_out_QSV_2_1 (io_out_QSV_2_1),
    .io_out_QSV_3_0 (io_out_QSV_3_0),
    .io_out_QSV_3_1 (io_out_QSV_3_1),
    .io_out_valid   (io_out_valid)
  );

endmodule
