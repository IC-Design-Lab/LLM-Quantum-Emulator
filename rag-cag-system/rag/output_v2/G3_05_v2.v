module QuantumCircuit (
  input          clock,
  input          reset,
  input  [7:0]   io_in_QSV_0_0,
  input  [7:0]   io_in_QSV_0_1,
  input  [7:0]   io_in_QSV_1_0,
  input  [7:0]   io_in_QSV_1_1,
  input  [7:0]   io_in_QSV_2_0,
  input  [7:0]   io_in_QSV_2_1,
  input  [7:0]   io_in_QSV_3_0,
  input  [7:0]   io_in_QSV_3_1,
  input  [7:0]   io_in_QSV_4_0,
  input  [7:0]   io_in_QSV_4_1,
  input  [7:0]   io_in_QSV_5_0,
  input  [7:0]   io_in_QSV_5_1,
  input  [7:0]   io_in_QSV_6_0,
  input  [7:0]   io_in_QSV_6_1,
  input  [7:0]   io_in_QSV_7_0,
  input  [7:0]   io_in_QSV_7_1,
  input          io_in_valid,
  output [7:0]   io_out_QSV_0_0,
  output [7:0]   io_out_QSV_0_1,
  output [7:0]   io_out_QSV_1_0,
  output [7:0]   io_out_QSV_1_1,
  output [7:0]   io_out_QSV_2_0,
  output [7:0]   io_out_QSV_2_1,
  output [7:0]   io_out_QSV_3_0,
  output [7:0]   io_out_QSV_3_1,
  output [7:0]   io_out_QSV_4_0,
  output [7:0]   io_out_QSV_4_1,
  output [7:0]   io_out_QSV_5_0,
  output [7:0]   io_out_QSV_5_1,
  output [7:0]   io_out_QSV_6_0,
  output [7:0]   io_out_QSV_6_1,
  output [7:0]   io_out_QSV_7_0,
  output [7:0]   io_out_QSV_7_1,
  output         io_out_valid
);

  wire [7:0] _m_io_out_QSV_0_0;
  wire [7:0] _m_io_out_QSV_0_1;
  wire [7:0] _m_io_out_QSV_1_0;
  wire [7:0] _m_io_out_QSV_1_1;
  wire [7:0] _m_io_out_QSV_2_0;
  wire [7:0] _m_io_out_QSV_2_1;
  wire [7:0] _m_io_out_QSV_3_0;
  wire [7:0] _m_io_out_QSV_3_1;
  wire [7:0] _m_io_out_QSV_4_0;
  wire [7:0] _m_io_out_QSV_4_1;
  wire [7:0] _m_io_out_QSV_5_0;
  wire [7:0] _m_io_out_QSV_5_1;
  wire [7:0] _m_io_out_QSV_6_0;
  wire [7:0] _m_io_out_QSV_6_1;
  wire [7:0] _m_io_out_QSV_7_0;
  wire [7:0] _m_io_out_QSV_7_1;
  wire       _m_io_out_valid;

  wire [7:0] _m_1_io_out_QSV_0_0;
  wire [7:0] _m_1_io_out_QSV_0_1;
  wire [7:0] _m_1_io_out_QSV_1_0;
  wire [7:0] _m_1_io_out_QSV_1_1;
  wire [7:0] _m_1_io_out_QSV_2_0;
  wire [7:0] _m_1_io_out_QSV_2_1;
  wire [7:0] _m_1_io_out_QSV_3_0;
  wire [7:0] _m_1_io_out_QSV_3_1;
  wire [7:0] _m_1_io_out_QSV_4_0;
  wire [7:0] _m_1_io_out_QSV_4_1;
  wire [7:0] _m_1_io_out_QSV_5_0;
  wire [7:0] _m_1_io_out_QSV_5_1;
  wire [7:0] _m_1_io_out_QSV_6_0;
  wire [7:0] _m_1_io_out_QSV_6_1;
  wire [7:0] _m_1_io_out_QSV_7_0;
  wire [7:0] _m_1_io_out_QSV_7_1;
  wire       _m_1_io_out_valid;

  wire [7:0] _m_2_io_out_QSV_0_0;
  wire [7:0] _m_2_io_out_QSV_0_1;
  wire [7:0] _m_2_io_out_QSV_1_0;
  wire [7:0] _m_2_io_out_QSV_1_1;
  wire [7:0] _m_2_io_out_QSV_2_0;
  wire [7:0] _m_2_io_out_QSV_2_1;
  wire [7:0] _m_2_io_out_QSV_3_0;
  wire [7:0] _m_2_io_out_QSV_3_1;
  wire [7:0] _m_2_io_out_QSV_4_0;
  wire [7:0] _m_2_io_out_QSV_4_1;
  wire [7:0] _m_2_io_out_QSV_5_0;
  wire [7:0] _m_2_io_out_QSV_5_1;
  wire [7:0] _m_2_io_out_QSV_6_0;
  wire [7:0] _m_2_io_out_QSV_6_1;
  wire [7:0] _m_2_io_out_QSV_7_0;
  wire [7:0] _m_2_io_out_QSV_7_1;
  wire       _m_2_io_out_valid;

  HGate3QubitVector8bit m (
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
    .io_in_QSV_4_0  (io_in_QSV_4_0),
    .io_in_QSV_4_1  (io_in_QSV_4_1),
    .io_in_QSV_5_0  (io_in_QSV_5_0),
    .io_in_QSV_5_1  (io_in_QSV_5_1),
    .io_in_QSV_6_0  (io_in_QSV_6_0),
    .io_in_QSV_6_1  (io_in_QSV_6_1),
    .io_in_QSV_7_0  (io_in_QSV_7_0),
    .io_in_QSV_7_1  (io_in_QSV_7_1),
    .io_in_valid    (io_in_valid),
    .io_out_QSV_0_0 (_m_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_io_out_QSV_3_1),
    .io_out_QSV_4_0 (_m_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_io_out_QSV_7_0),
    .io_out_QSV_7_1 (_m_io_out_QSV_7_1),
    .io_out_valid   (_m_io_out_valid)
  );

  CompatiblePerm m_1 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_io_out_QSV_3_1),
    .io_in_QSV_4_0  (_m_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_io_out_QSV_7_0),
    .io_in_QSV_7_1  (_m_io_out_QSV_7_1),
    .io_in_valid    (_m_io_out_valid),
    .io_out_QSV_0_0 (_m_1_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_1_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_1_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_1_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_1_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_1_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_1_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_1_io_out_QSV_3_1),
    .io_out_QSV_4_0 (_m_1_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_1_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_1_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_1_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_1_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_1_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_1_io_out_QSV_7_0),
    .io_out_QSV_7_1 (_m_1_io_out_QSV_7_1),
    .io_out_valid   (_m_1_io_out_valid)
  );

  CTGate3QubitVector8bit m_2 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_1_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_1_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_1_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_1_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_1_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_1_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_1_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_1_io_out_QSV_3_1),
    .io_in_QSV_4_0  (_m_1_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_1_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_1_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_1_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_1_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_1_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_1_io_out_QSV_7_0),
    .io_in_QSV_7_1  (_m_1_io_out_QSV_7_1),
    .io_in_valid    (_m_1_io_out_valid),
    .io_out_QSV_0_0 (_m_2_io_out_QSV_0_0),
    .io_out_QSV_0_1 (_m_2_io_out_QSV_0_1),
    .io_out_QSV_1_0 (_m_2_io_out_QSV_1_0),
    .io_out_QSV_1_1 (_m_2_io_out_QSV_1_1),
    .io_out_QSV_2_0 (_m_2_io_out_QSV_2_0),
    .io_out_QSV_2_1 (_m_2_io_out_QSV_2_1),
    .io_out_QSV_3_0 (_m_2_io_out_QSV_3_0),
    .io_out_QSV_3_1 (_m_2_io_out_QSV_3_1),
    .io_out_QSV_4_0 (_m_2_io_out_QSV_4_0),
    .io_out_QSV_4_1 (_m_2_io_out_QSV_4_1),
    .io_out_QSV_5_0 (_m_2_io_out_QSV_5_0),
    .io_out_QSV_5_1 (_m_2_io_out_QSV_5_1),
    .io_out_QSV_6_0 (_m_2_io_out_QSV_6_0),
    .io_out_QSV_6_1 (_m_2_io_out_QSV_6_1),
    .io_out_QSV_7_0 (_m_2_io_out_QSV_7_0),
    .io_out_QSV_7_1 (_m_2_io_out_QSV_7_1),
    .io_out_valid   (_m_2_io_out_valid)
  );

  CompatiblePerm m_3 (
    .clock          (clock),
    .reset          (reset),
    .io_in_QSV_0_0  (_m_2_io_out_QSV_0_0),
    .io_in_QSV_0_1  (_m_2_io_out_QSV_0_1),
    .io_in_QSV_1_0  (_m_2_io_out_QSV_1_0),
    .io_in_QSV_1_1  (_m_2_io_out_QSV_1_1),
    .io_in_QSV_2_0  (_m_2_io_out_QSV_2_0),
    .io_in_QSV_2_1  (_m_2_io_out_QSV_2_1),
    .io_in_QSV_3_0  (_m_2_io_out_QSV_3_0),
    .io_in_QSV_3_1  (_m_2_io_out_QSV_3_1),
    .io_in_QSV_4_0  (_m_2_io_out_QSV_4_0),
    .io_in_QSV_4_1  (_m_2_io_out_QSV_4_1),
    .io_in_QSV_5_0  (_m_2_io_out_QSV_5_0),
    .io_in_QSV_5_1  (_m_2_io_out_QSV_5_1),
    .io_in_QSV_6_0  (_m_2_io_out_QSV_6_0),
    .io_in_QSV_6_1  (_m_2_io_out_QSV_6_1),
    .io_in_QSV_7_0  (_m_2_io_out_QSV_7_0),
    .io_in_QSV_7_1  (_m_2_io_out_QSV_7_1),
    .io_in_valid    (_m_2_io_out_valid),
    .io_out_QSV_0_0 (io_out_QSV_0_0),
    .io_out_QSV_0_1 (io_out_QSV_0_1),
    .io_out_QSV_1_0 (io_out_QSV_1_0),
    .io_out_QSV_1_1 (io_out_QSV_1_1),
    .io_out_QSV_2_0 (io_out_QSV_2_0),
    .io_out_QSV_2_1 (io_out_QSV_2_1),
    .io_out_QSV_3_0 (io_out_QSV_3_0),
    .io_out_QSV_3_1 (io_out_QSV_3_1),
    .io_out_QSV_4_0 (io_out_QSV_4_0),
    .io_out_QSV_4_1 (io_out_QSV_4_1),
    .io_out_QSV_5_0 (io_out_QSV_5_0),
    .io_out_QSV_5_1 (io_out_QSV_5_1),
    .io_out_QSV_6_0 (io_out_QSV_6_0),
    .io_out_QSV_6_1 (io_out_QSV_6_1),
    .io_out_QSV_7_0 (io_out_QSV_7_0),
    .io_out_QSV_7_1 (io_out_QSV_7_1),
    .io_out_valid   (io_out_valid)
  );

endmodule
