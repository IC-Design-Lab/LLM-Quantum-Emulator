// Circuit_08 (HCXH): H(q0) -> [perm] CX [perm] -> SX(q0)
// Ground truth built by extending the VERIFIED Circuit1_0167 (Bell) pipeline
// (stages m..m_3 below are byte-for-byte the same instantiation pattern as
// experiment/ground_truth/Circuit1_0167.sv) with one more real gate wrapper
// (m_4 = SXGate2QubitVector16bit) wired straight from the second perm's output.
// No perm after m_4: SX targets qubit 0, which per architecture_rules.md needs
// no permutation bracket.
module Circuit_08(
  input         clock,
                reset,
  input  [15:0] io_in_QSV_0_0,
                io_in_QSV_0_1,
                io_in_QSV_1_0,
                io_in_QSV_1_1,
                io_in_QSV_2_0,
                io_in_QSV_2_1,
                io_in_QSV_3_0,
                io_in_QSV_3_1,
  input         io_in_valid,
  output [15:0] io_out_QSV_0_0,
                io_out_QSV_0_1,
                io_out_QSV_1_0,
                io_out_QSV_1_1,
                io_out_QSV_2_0,
                io_out_QSV_2_1,
                io_out_QSV_3_0,
                io_out_QSV_3_1,
  output        io_out_valid
);

  wire [15:0] _m_io_out_QSV_0_0, _m_io_out_QSV_0_1, _m_io_out_QSV_1_0, _m_io_out_QSV_1_1;
  wire [15:0] _m_io_out_QSV_2_0, _m_io_out_QSV_2_1, _m_io_out_QSV_3_0, _m_io_out_QSV_3_1;
  wire        _m_io_out_valid;

  wire [15:0] _m_1_io_out_QSV_0_0, _m_1_io_out_QSV_0_1, _m_1_io_out_QSV_1_0, _m_1_io_out_QSV_1_1;
  wire [15:0] _m_1_io_out_QSV_2_0, _m_1_io_out_QSV_2_1, _m_1_io_out_QSV_3_0, _m_1_io_out_QSV_3_1;
  wire        _m_1_io_out_valid;

  wire [15:0] _m_2_io_out_QSV_0_0, _m_2_io_out_QSV_0_1, _m_2_io_out_QSV_1_0, _m_2_io_out_QSV_1_1;
  wire [15:0] _m_2_io_out_QSV_2_0, _m_2_io_out_QSV_2_1, _m_2_io_out_QSV_3_0, _m_2_io_out_QSV_3_1;
  wire        _m_2_io_out_valid;

  wire [15:0] _m_3_io_out_QSV_0_0, _m_3_io_out_QSV_0_1, _m_3_io_out_QSV_1_0, _m_3_io_out_QSV_1_1;
  wire [15:0] _m_3_io_out_QSV_2_0, _m_3_io_out_QSV_2_1, _m_3_io_out_QSV_3_0, _m_3_io_out_QSV_3_1;
  wire        _m_3_io_out_valid;

  HGate2QubitVector16bit m (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
    .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
    .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
    .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
    .io_in_valid(io_in_valid),
    .io_out_QSV_0_0(_m_io_out_QSV_0_0), .io_out_QSV_0_1(_m_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_io_out_QSV_1_0), .io_out_QSV_1_1(_m_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_io_out_QSV_2_0), .io_out_QSV_2_1(_m_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_io_out_QSV_3_0), .io_out_QSV_3_1(_m_io_out_QSV_3_1),
    .io_out_valid(_m_io_out_valid)
  );
  CompatiblePerm m_1 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_io_out_QSV_0_0), .io_in_QSV_0_1(_m_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_io_out_QSV_1_0), .io_in_QSV_1_1(_m_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_io_out_QSV_2_0), .io_in_QSV_2_1(_m_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_io_out_QSV_3_0), .io_in_QSV_3_1(_m_io_out_QSV_3_1),
    .io_in_valid(_m_io_out_valid),
    .io_out_QSV_0_0(_m_1_io_out_QSV_0_0), .io_out_QSV_0_1(_m_1_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_1_io_out_QSV_1_0), .io_out_QSV_1_1(_m_1_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_1_io_out_QSV_2_0), .io_out_QSV_2_1(_m_1_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_1_io_out_QSV_3_0), .io_out_QSV_3_1(_m_1_io_out_QSV_3_1),
    .io_out_valid(_m_1_io_out_valid)
  );
  CNGate2QubitVector16bit m_2 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_1_io_out_QSV_0_0), .io_in_QSV_0_1(_m_1_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_1_io_out_QSV_1_0), .io_in_QSV_1_1(_m_1_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_1_io_out_QSV_2_0), .io_in_QSV_2_1(_m_1_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_1_io_out_QSV_3_0), .io_in_QSV_3_1(_m_1_io_out_QSV_3_1),
    .io_in_valid(_m_1_io_out_valid),
    .io_out_QSV_0_0(_m_2_io_out_QSV_0_0), .io_out_QSV_0_1(_m_2_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_2_io_out_QSV_1_0), .io_out_QSV_1_1(_m_2_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_2_io_out_QSV_2_0), .io_out_QSV_2_1(_m_2_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_2_io_out_QSV_3_0), .io_out_QSV_3_1(_m_2_io_out_QSV_3_1),
    .io_out_valid(_m_2_io_out_valid)
  );
  CompatiblePerm m_3 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_2_io_out_QSV_0_0), .io_in_QSV_0_1(_m_2_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_2_io_out_QSV_1_0), .io_in_QSV_1_1(_m_2_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_2_io_out_QSV_2_0), .io_in_QSV_2_1(_m_2_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_2_io_out_QSV_3_0), .io_in_QSV_3_1(_m_2_io_out_QSV_3_1),
    .io_in_valid(_m_2_io_out_valid),
    .io_out_QSV_0_0(_m_3_io_out_QSV_0_0), .io_out_QSV_0_1(_m_3_io_out_QSV_0_1),
    .io_out_QSV_1_0(_m_3_io_out_QSV_1_0), .io_out_QSV_1_1(_m_3_io_out_QSV_1_1),
    .io_out_QSV_2_0(_m_3_io_out_QSV_2_0), .io_out_QSV_2_1(_m_3_io_out_QSV_2_1),
    .io_out_QSV_3_0(_m_3_io_out_QSV_3_0), .io_out_QSV_3_1(_m_3_io_out_QSV_3_1),
    .io_out_valid(_m_3_io_out_valid)
  );
  SXGate2QubitVector16bit m_4 (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(_m_3_io_out_QSV_0_0), .io_in_QSV_0_1(_m_3_io_out_QSV_0_1),
    .io_in_QSV_1_0(_m_3_io_out_QSV_1_0), .io_in_QSV_1_1(_m_3_io_out_QSV_1_1),
    .io_in_QSV_2_0(_m_3_io_out_QSV_2_0), .io_in_QSV_2_1(_m_3_io_out_QSV_2_1),
    .io_in_QSV_3_0(_m_3_io_out_QSV_3_0), .io_in_QSV_3_1(_m_3_io_out_QSV_3_1),
    .io_in_valid(_m_3_io_out_valid),
    .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
    .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
    .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
    .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
    .io_out_valid(io_out_valid)
  );
endmodule
