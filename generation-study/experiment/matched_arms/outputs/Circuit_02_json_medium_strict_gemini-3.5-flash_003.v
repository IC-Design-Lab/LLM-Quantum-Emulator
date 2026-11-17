module Circuit_02 (
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

  // Step 0: Hadamard Gate on Qubit 0
  wire [15:0] w0_QSV_0_0;
  wire [15:0] w0_QSV_0_1;
  wire [15:0] w0_QSV_1_0;
  wire [15:0] w0_QSV_1_1;
  wire [15:0] w0_QSV_2_0;
  wire [15:0] w0_QSV_2_1;
  wire [15:0] w0_QSV_3_0;
  wire [15:0] w0_QSV_3_1;
  wire        w0_valid;

  HGate2QubitVector16bit step0_h0 (
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
    .io_out_QSV_0_0(w0_QSV_0_0),
    .io_out_QSV_0_1(w0_QSV_0_1),
    .io_out_QSV_1_0(w0_QSV_1_0),
    .io_out_QSV_1_1(w0_QSV_1_1),
    .io_out_QSV_2_0(w0_QSV_2_0),
    .io_out_QSV_2_1(w0_QSV_2_1),
    .io_out_QSV_3_0(w0_QSV_3_0),
    .io_out_QSV_3_1(w0_QSV_3_1),
    .io_out_valid(w0_valid)
  );

  // Step 1: Hadamard Gate on Qubit 1 (Requires permutation before and after)
  wire [15:0] w1_pre_QSV_0_0;
  wire [15:0] w1_pre_QSV_0_1;
  wire [15:0] w1_pre_QSV_1_0;
  wire [15:0] w1_pre_QSV_1_1;
  wire [15:0] w1_pre_QSV_2_0;
  wire [15:0] w1_pre_QSV_2_1;
  wire [15:0] w1_pre_QSV_3_0;
  wire [15:0] w1_pre_QSV_3_1;
  wire        w1_pre_valid;

  CompatiblePerm step1_perm_pre (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(w0_QSV_0_0),
    .io_in_QSV_0_1(w0_QSV_0_1),
    .io_in_QSV_1_0(w0_QSV_1_0),
    .io_in_QSV_1_1(w0_QSV_1_1),
    .io_in_QSV_2_0(w0_QSV_2_0),
    .io_in_QSV_2_1(w0_QSV_2_1),
    .io_in_QSV_3_0(w0_QSV_3_0),
    .io_in_QSV_3_1(w0_QSV_3_1),
    .io_in_valid(w0_valid),
    .io_out_QSV_0_0(w1_pre_QSV_0_0),
    .io_out_QSV_0_1(w1_pre_QSV_0_1),
    .io_out_QSV_1_0(w1_pre_QSV_1_0),
    .io_out_QSV_1_1(w1_pre_QSV_1_1),
    .io_out_QSV_2_0(w1_pre_QSV_2_0),
    .io_out_QSV_2_1(w1_pre_QSV_2_1),
    .io_out_QSV_3_0(w1_pre_QSV_3_0),
    .io_out_QSV_3_1(w1_pre_QSV_3_1),
    .io_out_valid(w1_pre_valid)
  );

  wire [15:0] w1_gate_QSV_0_0;
  wire [15:0] w1_gate_QSV_0_1;
  wire [15:0] w1_gate_QSV_1_0;
  wire [15:0] w1_gate_QSV_1_1;
  wire [15:0] w1_gate_QSV_2_0;
  wire [15:0] w1_gate_QSV_2_1;
  wire [15:0] w1_gate_QSV_3_0;
  wire [15:0] w1_gate_QSV_3_1;
  wire        w1_gate_valid;

  HGate2QubitVector16bit step1_h1 (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(w1_pre_QSV_0_0),
    .io_in_QSV_0_1(w1_pre_QSV_0_1),
    .io_in_QSV_1_0(w1_pre_QSV_1_0),
    .io_in_QSV_1_1(w1_pre_QSV_1_1),
    .io_in_QSV_2_0(w1_pre_QSV_2_0),
    .io_in_QSV_2_1(w1_pre_QSV_2_1),
    .io_in_QSV_3_0(w1_pre_QSV_3_0),
    .io_in_QSV_3_1(w1_pre_QSV_3_1),
    .io_in_valid(w1_pre_valid),
    .io_out_QSV_0_0(w1_gate_QSV_0_0),
    .io_out_QSV_0_1(w1_gate_QSV_0_1),
    .io_out_QSV_1_0(w1_gate_QSV_1_0),
    .io_out_QSV_1_1(w1_gate_QSV_1_1),
    .io_out_QSV_2_0(w1_gate_QSV_2_0),
    .io_out_QSV_2_1(w1_gate_QSV_2_1),
    .io_out_QSV_3_0(w1_gate_QSV_3_0),
    .io_out_QSV_3_1(w1_gate_QSV_3_1),
    .io_out_valid(w1_gate_valid)
  );

  wire [15:0] w1_post_QSV_0_0;
  wire [15:0] w1_post_QSV_0_1;
  wire [15:0] w1_post_QSV_1_0;
  wire [15:0] w1_post_QSV_1_1;
  wire [15:0] w1_post_QSV_2_0;
  wire [15:0] w1_post_QSV_2_1;
  wire [15:0] w1_post_QSV_3_0;
  wire [15:0] w1_post_QSV_3_1;
  wire        w1_post_valid;

  CompatiblePerm step1_perm_post (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(w1_gate_QSV_0_0),
    .io_in_QSV_0_1(w1_gate_QSV_0_1),
    .io_in_QSV_1_0(w1_gate_QSV_1_0),
    .io_in_QSV_1_1(w1_gate_QSV_1_1),
    .io_in_QSV_2_0(w1_gate_QSV_2_0),
    .io_in_QSV_2_1(w1_gate_QSV_2_1),
    .io_in_QSV_3_0(w1_gate_QSV_3_0),
    .io_in_QSV_3_1(w1_gate_QSV_3_1),
    .io_in_valid(w1_gate_valid),
    .io_out_QSV_0_0(w1_post_QSV_0_0),
    .io_out_QSV_0_1(w1_post_QSV_0_1),
    .io_out_QSV_1_0(w1_post_QSV_1_0),
    .io_out_QSV_1_1(w1_post_QSV_1_1),
    .io_out_QSV_2_0(w1_post_QSV_2_0),
    .io_out_QSV_2_1(w1_post_QSV_2_1),
    .io_out_QSV_3_0(w1_post_QSV_3_0),
    .io_out_QSV_3_1(w1_post_QSV_3_1),
    .io_out_valid(w1_post_valid)
  );

  // Step 2: Swap Gate on Qubits 0 and 1 (No permutation needed for full vector swap)
  SWGate2QubitVector16bit step2_swap (
    .clock(clock),
    .reset(reset),
    .io_in_QSV_0_0(w1_post_QSV_0_0),
    .io_in_QSV_0_1(w1_post_QSV_0_1),
    .io_in_QSV_1_0(w1_post_QSV_1_0),
    .io_in_QSV_1_1(w1_post_QSV_1_1),
    .io_in_QSV_2_0(w1_post_QSV_2_0),
    .io_in_QSV_2_1(w1_post_QSV_2_1),
    .io_in_QSV_3_0(w1_post_QSV_3_0),
    .io_in_QSV_3_1(w1_post_QSV_3_1),
    .io_in_valid(w1_post_valid),
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
