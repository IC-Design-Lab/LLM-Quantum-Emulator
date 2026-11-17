module QFT (
  input  logic       clock,
  input  logic       reset,
  input  logic [7:0] io_in_QSV_0_0,
  input  logic [7:0] io_in_QSV_0_1,
  input  logic [7:0] io_in_QSV_1_0,
  input  logic [7:0] io_in_QSV_1_1,
  input  logic [7:0] io_in_QSV_2_0,
  input  logic [7:0] io_in_QSV_2_1,
  input  logic [7:0] io_in_QSV_3_0,
  input  logic [7:0] io_in_QSV_3_1,
  input  logic [7:0] io_in_QSV_4_0,
  input  logic [7:0] io_in_QSV_4_1,
  input  logic [7:0] io_in_QSV_5_0,
  input  logic [7:0] io_in_QSV_5_1,
  input  logic [7:0] io_in_QSV_6_0,
  input  logic [7:0] io_in_QSV_6_1,
  input  logic [7:0] io_in_QSV_7_0,
  input  logic [7:0] io_in_QSV_7_1,
  input  logic       io_in_valid,
  
  output logic [7:0] io_out_QSV_0_0,
  output logic [7:0] io_out_QSV_0_1,
  output logic [7:0] io_out_QSV_1_0,
  output logic [7:0] io_out_QSV_1_1,
  output logic [7:0] io_out_QSV_2_0,
  output logic [7:0] io_out_QSV_2_1,
  output logic [7:0] io_out_QSV_3_0,
  output logic [7:0] io_out_QSV_3_1,
  output logic [7:0] io_out_QSV_4_0,
  output logic [7:0] io_out_QSV_4_1,
  output logic [7:0] io_out_QSV_5_0,
  output logic [7:0] io_out_QSV_5_1,
  output logic [7:0] io_out_QSV_6_0,
  output logic [7:0] io_out_QSV_6_1,
  output logic [7:0] io_out_QSV_7_0,
  output logic [7:0] io_out_QSV_7_1,
  output logic       io_out_valid
);

  // Wires for Step 0 outputs
  wire [7:0] step0_QSV_0_0, step0_QSV_0_1, step0_QSV_1_0, step0_QSV_1_1;
  wire [7:0] step0_QSV_2_0, step0_QSV_2_1, step0_QSV_3_0, step0_QSV_3_1;
  wire [7:0] step0_QSV_4_0, step0_QSV_4_1, step0_QSV_5_0, step0_QSV_5_1;
  wire [7:0] step0_QSV_6_0, step0_QSV_6_1, step0_QSV_7_0, step0_QSV_7_1;
  wire step0_valid;

  // Wires for Step 1 perm_in outputs (Note: io_out_QSV_3_1 and 7_1 are pruned by CSGate)
  wire [7:0] step1_perm_in_QSV_0_0, step1_perm_in_QSV_0_1, step1_perm_in_QSV_1_0, step1_perm_in_QSV_1_1;
  wire [7:0] step1_perm_in_QSV_2_0, step1_perm_in_QSV_2_1, step1_perm_in_QSV_3_0;
  wire [7:0] step1_perm_in_QSV_4_0, step1_perm_in_QSV_4_1, step1_perm_in_QSV_5_0, step1_perm_in_QSV_5_1;
  wire [7:0] step1_perm_in_QSV_6_0, step1_perm_in_QSV_6_1, step1_perm_in_QSV_7_0;
  wire step1_perm_in_valid;

  // Wires for Step 1 cs outputs
  wire [7:0] step1_cs_QSV_0_0, step1_cs_QSV_0_1, step1_cs_QSV_1_0, step1_cs_QSV_1_1;
  wire [7:0] step1_cs_QSV_2_0, step1_cs_QSV_2_1, step1_cs_QSV_3_0, step1_cs_QSV_3_1;
  wire [7:0] step1_cs_QSV_4_0, step1_cs_QSV_4_1, step1_cs_QSV_5_0, step1_cs_QSV_5_1;
  wire [7:0] step1_cs_QSV_6_0, step1_cs_QSV_6_1, step1_cs_QSV_7_0, step1_cs_QSV_7_1;
  wire step1_cs_valid;

  // Wires for Step 1 perm_out outputs
  wire [7:0] step1_QSV_0_0, step1_QSV_0_1, step1_QSV_1_0, step1_QSV_1_1;
  wire [7:0] step1_QSV_2_0, step1_QSV_2_1, step1_QSV_3_0, step1_QSV_3_1;
  wire [7:0] step1_QSV_4_0, step1_QSV_4_1, step1_QSV_5_0, step1_QSV_5_1;
  wire [7:0] step1_QSV_6_0, step1_QSV_6_1, step1_QSV_7_0, step1_QSV_7_1;
  wire step1_valid;

  // Wires for Step 2 perm_in outputs
  wire [7:0] step2_perm_in_QSV_0_0, step2_perm_in_QSV_0_1, step2_perm_in_QSV_1_0, step2_perm_in_QSV_1_1;
  wire [7:0] step2_perm_in_QSV_2_0, step2_perm_in_QSV_2_1, step2_perm_in_QSV_3_0, step2_perm_in_QSV_3_1;
  wire [7:0] step2_perm_in_QSV_4_0, step2_perm_in_QSV_4_1, step2_perm_in_QSV_5_0, step2_perm_in_QSV_5_1;
  wire [7:0] step2_perm_in_QSV_6_0, step2_perm_in_QSV_6_1, step2_perm_in_QSV_7_0, step2_perm_in_QSV_7_1;
  wire step2_perm_in_valid;

  // Wires for Step 2 ct outputs
  wire [7:0] step2_ct_QSV_0_0, step2_ct_QSV_0_1, step2_ct_QSV_1_0, step2_ct_QSV_1_1;
  wire [7:0] step2_ct_QSV_2_0, step2_ct_QSV_2_1, step2_ct_QSV_3_0, step2_ct_QSV_3_1;
  wire [7:0] step2_ct_QSV_4_0, step2_ct_QSV_4_1, step2_ct_QSV_5_0, step2_ct_QSV_5_1;
  wire [7:0] step2_ct_QSV_6_0, step2_ct_QSV_6_1, step2_ct_QSV_7_0, step2_ct_QSV_7_1;
  wire step2_ct_valid;

  // Wires for Step 2 perm_out outputs
  wire [7:0] step2_QSV_0_0, step2_QSV_0_1, step2_QSV_1_0, step2_QSV_1_1;
  wire [7:0] step2_QSV_2_0, step2_QSV_2_1, step2_QSV_3_0, step2_QSV_3_1;
  wire [7:0] step2_QSV_4_0, step2_QSV_4_1, step2_QSV_5_0, step2_QSV_5_1;
  wire [7:0] step2_QSV_6_0, step2_QSV_6_1, step2_QSV_7_0, step2_QSV_7_1;
  wire step2_valid;

  // Wires for Step 3 perm_in outputs
  wire [7:0] step3_perm_in_QSV_0_0, step3_perm_in_QSV_0_1, step3_perm_in_QSV_1_0, step3_perm_in_QSV_1_1;
  wire [7:0] step3_perm_in_QSV_2_0, step3_perm_in_QSV_2_1, step3_perm_in_QSV_3_0, step3_perm_in_QSV_3_1;
  wire [7:0] step3_perm_in_QSV_4_0, step3_perm_in_QSV_4_1, step3_perm_in_QSV_5_0, step3_perm_in_QSV_5_1;
  wire [7:0] step3_perm_in_QSV_6_0, step3_perm_in_QSV_6_1, step3_perm_in_QSV_7_0, step3_perm_in_QSV_7_1;
  wire step3_perm_in_valid;

  // Wires for Step 3 h outputs
  wire [7:0] step3_h_QSV_0_0, step3_h_QSV_0_1, step3_h_QSV_1_0, step3_h_QSV_1_1;
  wire [7:0] step3_h_QSV_2_0, step3_h_QSV_2_1, step3_h_QSV_3_0, step3_h_QSV_3_1;
  wire [7:0] step3_h_QSV_4_0, step3_h_QSV_4_1, step3_h_QSV_5_0, step3_h_QSV_5_1;
  wire [7:0] step3_h_QSV_6_0, step3_h_QSV_6_1, step3_h_QSV_7_0, step3_h_QSV_7_1;
  wire step3_h_valid;

  // Wires for Step 3 perm_out outputs
  wire [7:0] step3_QSV_0_0, step3_QSV_0_1, step3_QSV_1_0, step3_QSV_1_1;
  wire [7:0] step3_QSV_2_0, step3_QSV_2_1, step3_QSV_3_0, step3_QSV_3_1;
  wire [7:0] step3_QSV_4_0, step3_QSV_4_1, step3_QSV_5_0, step3_QSV_5_1;
  wire [7:0] step3_QSV_6_0, step3_QSV_6_1, step3_QSV_7_0, step3_QSV_7_1;
  wire step3_valid;

  // Wires for Step 4 perm_in outputs (Note: io_out_QSV_3_1 and 7_1 are pruned by CSGate)
  wire [7:0] step4_perm_in_QSV_0_0, step4_perm_in_QSV_0_1, step4_perm_in_QSV_1_0, step4_perm_in_QSV_1_1;
  wire [7:0] step4_perm_in_QSV_2_0, step4_perm_in_QSV_2_1, step4_perm_in_QSV_3_0;
  wire [7:0] step4_perm_in_QSV_4_0, step4_perm_in_QSV_4_1, step4_perm_in_QSV_5_0, step4_perm_in_QSV_5_1;
  wire [7:0] step4_perm_in_QSV_6_0, step4_perm_in_QSV_6_1, step4_perm_in_QSV_7_0;
  wire step4_perm_in_valid;

  // Wires for Step 4 cs outputs
  wire [7:0] step4_cs_QSV_0_0, step4_cs_QSV_0_1, step4_cs_QSV_1_0, step4_cs_QSV_1_1;
  wire [7:0] step4_cs_QSV_2_0, step4_cs_QSV_2_1, step4_cs_QSV_3_0, step4_cs_QSV_3_1;
  wire [7:0] step4_cs_QSV_4_0, step4_cs_QSV_4_1, step4_cs_QSV_5_0, step4_cs_QSV_5_1;
  wire [7:0] step4_cs_QSV_6_0, step4_cs_QSV_6_1, step4_cs_QSV_7_0, step4_cs_QSV_7_1;
  wire step4_cs_valid;

  // Wires for Step 4 perm_out outputs
  wire [7:0] step4_QSV_0_0, step4_QSV_0_1, step4_QSV_1_0, step4_QSV_1_1;
  wire [7:0] step4_QSV_2_0, step4_QSV_2_1, step4_QSV_3_0, step4_QSV_3_1;
  wire [7:0] step4_QSV_4_0, step4_QSV_4_1, step4_QSV_5_0, step4_QSV_5_1;
  wire [7:0] step4_QSV_6_0, step4_QSV_6_1, step4_QSV_7_0, step4_QSV_7_1;
  wire step4_valid;

  // Wires for Step 5 perm_in outputs
  wire [7:0] step5_perm_in_QSV_0_0, step5_perm_in_QSV_0_1, step5_perm_in_QSV_1_0, step5_perm_in_QSV_1_1;
  wire [7:0] step5_perm_in_QSV_2_0, step5_perm_in_QSV_2_1, step5_perm_in_QSV_3_0, step5_perm_in_QSV_3_1;
  wire [7:0] step5_perm_in_QSV_4_0, step5_perm_in_QSV_4_1, step5_perm_in_QSV_5_0, step5_perm_in_QSV_5_1;
  wire [7:0] step5_perm_in_QSV_6_0, step5_perm_in_QSV_6_1, step5_perm_in_QSV_7_0, step5_perm_in_QSV_7_1;
  wire step5_perm_in_valid;

  // Wires for Step 5 h outputs
  wire [7:0] step5_h_QSV_0_0, step5_h_QSV_0_1, step5_h_QSV_1_0, step5_h_QSV_1_1;
  wire [7:0] step5_h_QSV_2_0, step5_h_QSV_2_1, step5_h_QSV_3_0, step5_h_QSV_3_1;
  wire [7:0] step5_h_QSV_4_0, step5_h_QSV_4_1, step5_h_QSV_5_0, step5_h_QSV_5_1;
  wire [7:0] step5_h_QSV_6_0, step5_h_QSV_6_1, step5_h_QSV_7_0, step5_h_QSV_7_1;
  wire step5_h_valid;

  // Wires for Step 5 perm_out outputs
  wire [7:0] step5_QSV_0_0, step5_QSV_0_1, step5_QSV_1_0, step5_QSV_1_1;
  wire [7:0] step5_QSV_2_0, step5_QSV_2_1, step5_QSV_3_0, step5_QSV_3_1;
  wire [7:0] step5_QSV_4_0, step5_QSV_4_1, step5_QSV_5_0, step5_QSV_5_1;
  wire [7:0] step5_QSV_6_0, step5_QSV_6_1, step5_QSV_7_0, step5_QSV_7_1;
  wire step5_valid;

  // Wires for Step 6 perm_in outputs
  wire [7:0] step6_perm_in_QSV_0_0, step6_perm_in_QSV_0_1, step6_perm_in_QSV_1_0, step6_perm_in_QSV_1_1;
  wire [7:0] step6_perm_in_QSV_2_0, step6_perm_in_QSV_2_1, step6_perm_in_QSV_3_0, step6_perm_in_QSV_3_1;
  wire [7:0] step6_perm_in_QSV_4_0, step6_perm_in_QSV_4_1, step6_perm_in_QSV_5_0, step6_perm_in_QSV_5_1;
  wire [7:0] step6_perm_in_QSV_6_0, step6_perm_in_QSV_6_1, step6_perm_in_QSV_7_0, step6_perm_in_QSV_7_1;
  wire step6_perm_in_valid;

  // Wires for Step 6 swap outputs
  wire [7:0] step6_swap_QSV_0_0, step6_swap_QSV_0_1, step6_swap_QSV_1_0, step6_swap_QSV_1_1;
  wire [7:0] step6_swap_QSV_2_0, step6_swap_QSV_2_1, step6_swap_QSV_3_0, step6_swap_QSV_3_1;
  wire [7:0] step6_swap_QSV_4_0, step6_swap_QSV_4_1, step6_swap_QSV_5_0, step6_swap_QSV_5_1;
  wire [7:0] step6_swap_QSV_6_0, step6_swap_QSV_6_1, step6_swap_QSV_7_0, step6_swap_QSV_7_1;
  wire step6_swap_valid;

  // ---------------------------------------------------------------------------
  // Step 0: H on qubit 0 (Default position, no perms)
  // ---------------------------------------------------------------------------
  HGate3QubitVector8bit step0_h_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1),
    .io_in_QSV_1_0(io_in_QSV_1_0), .io_in_QSV_1_1(io_in_QSV_1_1),
    .io_in_QSV_2_0(io_in_QSV_2_0), .io_in_QSV_2_1(io_in_QSV_2_1),
    .io_in_QSV_3_0(io_in_QSV_3_0), .io_in_QSV_3_1(io_in_QSV_3_1),
    .io_in_QSV_4_0(io_in_QSV_4_0), .io_in_QSV_4_1(io_in_QSV_4_1),
    .io_in_QSV_5_0(io_in_QSV_5_0), .io_in_QSV_5_1(io_in_QSV_5_1),
    .io_in_QSV_6_0(io_in_QSV_6_0), .io_in_QSV_6_1(io_in_QSV_6_1),
    .io_in_QSV_7_0(io_in_QSV_7_0), .io_in_QSV_7_1(io_in_QSV_7_1),
    .io_in_valid(io_in_valid),
    .io_out_QSV_0_0(step0_QSV_0_0), .io_out_QSV_0_1(step0_QSV_0_1),
    .io_out_QSV_1_0(step0_QSV_1_0), .io_out_QSV_1_1(step0_QSV_1_1),
    .io_out_QSV_2_0(step0_QSV_2_0), .io_out_QSV_2_1(step0_QSV_2_1),
    .io_out_QSV_3_0(step0_QSV_3_0), .io_out_QSV_3_1(step0_QSV_3_1),
    .io_out_QSV_4_0(step0_QSV_4_0), .io_out_QSV_4_1(step0_QSV_4_1),
    .io_out_QSV_5_0(step0_QSV_5_0), .io_out_QSV_5_1(step0_QSV_5_1),
    .io_out_QSV_6_0(step0_QSV_6_0), .io_out_QSV_6_1(step0_QSV_6_1),
    .io_out_QSV_7_0(step0_QSV_7_0), .io_out_QSV_7_1(step0_QSV_7_1),
    .io_out_valid(step0_valid)
  );

  // ---------------------------------------------------------------------------
  // Step 1: CS on qubits 1 (control) and 0 (target)
  // ---------------------------------------------------------------------------
  CompatiblePerm step1_perm_in_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step0_QSV_0_0), .io_in_QSV_0_1(step0_QSV_0_1),
    .io_in_QSV_1_0(step0_QSV_1_0), .io_in_QSV_1_1(step0_QSV_1_1),
    .io_in_QSV_2_0(step0_QSV_2_0), .io_in_QSV_2_1(step0_QSV_2_1),
    .io_in_QSV_3_0(step0_QSV_3_0), .io_in_QSV_3_1(step0_QSV_3_1),
    .io_in_QSV_4_0(step0_QSV_4_0), .io_in_QSV_4_1(step0_QSV_4_1),
    .io_in_QSV_5_0(step0_QSV_5_0), .io_in_QSV_5_1(step0_QSV_5_1),
    .io_in_QSV_6_0(step0_QSV_6_0), .io_in_QSV_6_1(step0_QSV_6_1),
    .io_in_QSV_7_0(step0_QSV_7_0), .io_in_QSV_7_1(step0_QSV_7_1),
    .io_in_valid(step0_valid),
    .io_out_QSV_0_0(step1_perm_in_QSV_0_0), .io_out_QSV_0_1(step1_perm_in_QSV_0_1),
    .io_out_QSV_1_0(step1_perm_in_QSV_1_0), .io_out_QSV_1_1(step1_perm_in_QSV_1_1),
    .io_out_QSV_2_0(step1_perm_in_QSV_2_0), .io_out_QSV_2_1(step1_perm_in_QSV_2_1),
    .io_out_QSV_3_0(step1_perm_in_QSV_3_0), // 3_1 pruned
    .io_out_QSV_4_0(step1_perm_in_QSV_4_0), .io_out_QSV_4_1(step1_perm_in_QSV_4_1),
    .io_out_QSV_5_0(step1_perm_in_QSV_5_0), .io_out_QSV_5_1(step1_perm_in_QSV_5_1),
    .io_out_QSV_6_0(step1_perm_in_QSV_6_0), .io_out_QSV_6_1(step1_perm_in_QSV_6_1),
    .io_out_QSV_7_0(step1_perm_in_QSV_7_0), // 7_1 pruned
    .io_out_valid(step1_perm_in_valid)
  );

  CSGate3QubitVector8bit step1_cs_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step1_perm_in_QSV_0_0), .io_in_QSV_0_1(step1_perm_in_QSV_0_1),
    .io_in_QSV_1_0(step1_perm_in_QSV_1_0), .io_in_QSV_1_1(step1_perm_in_QSV_1_1),
    .io_in_QSV_2_0(step1_perm_in_QSV_2_0), .io_in_QSV_2_1(step1_perm_in_QSV_2_1),
    .io_in_QSV_3_0(step1_perm_in_QSV_3_0),
    .io_in_QSV_4_0(step1_perm_in_QSV_4_0), .io_in_QSV_4_1(step1_perm_in_QSV_4_1),
    .io_in_QSV_5_0(step1_perm_in_QSV_5_0), .io_in_QSV_5_1(step1_perm_in_QSV_5_1),
    .io_in_QSV_6_0(step1_perm_in_QSV_6_0), .io_in_QSV_6_1(step1_perm_in_QSV_6_1),
    .io_in_QSV_7_0(step1_perm_in_QSV_7_0),
    .io_in_valid(step1_perm_in_valid),
    .io_out_QSV_0_0(step1_cs_QSV_0_0), .io_out_QSV_0_1(step1_cs_QSV_0_1),
    .io_out_QSV_1_0(step1_cs_QSV_1_0), .io_out_QSV_1_1(step1_cs_QSV_1_1),
    .io_out_QSV_2_0(step1_cs_QSV_2_0), .io_out_QSV_2_1(step1_cs_QSV_2_1),
    .io_out_QSV_3_0(step1_cs_QSV_3_0), .io_out_QSV_3_1(step1_cs_QSV_3_1),
    .io_out_QSV_4_0(step1_cs_QSV_4_0), .io_out_QSV_4_1(step1_cs_QSV_4_1),
    .io_out_QSV_5_0(step1_cs_QSV_5_0), .io_out_QSV_5_1(step1_cs_QSV_5_1),
    .io_out_QSV_6_0(step1_cs_QSV_6_0), .io_out_QSV_6_1(step1_cs_QSV_6_1),
    .io_out_QSV_7_0(step1_cs_QSV_7_0), .io_out_QSV_7_1(step1_cs_QSV_7_1),
    .io_out_valid(step1_cs_valid)
  );

  CompatiblePerm step1_perm_out_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step1_cs_QSV_0_0), .io_in_QSV_0_1(step1_cs_QSV_0_1),
    .io_in_QSV_1_0(step1_cs_QSV_1_0), .io_in_QSV_1_1(step1_cs_QSV_1_1),
    .io_in_QSV_2_0(step1_cs_QSV_2_0), .io_in_QSV_2_1(step1_cs_QSV_2_1),
    .io_in_QSV_3_0(step1_cs_QSV_3_0), .io_in_QSV_3_1(step1_cs_QSV_3_1),
    .io_in_QSV_4_0(step1_cs_QSV_4_0), .io_in_QSV_4_1(step1_cs_QSV_4_1),
    .io_in_QSV_5_0(step1_cs_QSV_5_0), .io_in_QSV_5_1(step1_cs_QSV_5_1),
    .io_in_QSV_6_0(step1_cs_QSV_6_0), .io_in_QSV_6_1(step1_cs_QSV_6_1),
    .io_in_QSV_7_0(step1_cs_QSV_7_0), .io_in_QSV_7_1(step1_cs_QSV_7_1),
    .io_in_valid(step1_cs_valid),
    .io_out_QSV_0_0(step1_QSV_0_0), .io_out_QSV_0_1(step1_QSV_0_1),
    .io_out_QSV_1_0(step1_QSV_1_0), .io_out_QSV_1_1(step1_QSV_1_1),
    .io_out_QSV_2_0(step1_QSV_2_0), .io_out_QSV_2_1(step1_QSV_2_1),
    .io_out_QSV_3_0(step1_QSV_3_0), .io_out_QSV_3_1(step1_QSV_3_1),
    .io_out_QSV_4_0(step1_QSV_4_0), .io_out_QSV_4_1(step1_QSV_4_1),
    .io_out_QSV_5_0(step1_QSV_5_0), .io_out_QSV_5_1(step1_QSV_5_1),
    .io_out_QSV_6_0(step1_QSV_6_0), .io_out_QSV_6_1(step1_QSV_6_1),
    .io_out_QSV_7_0(step1_QSV_7_0), .io_out_QSV_7_1(step1_QSV_7_1),
    .io_out_valid(step1_valid)
  );

  // ---------------------------------------------------------------------------
  // Step 2: CT on qubits 2 (control) and 0 (target)
  // ---------------------------------------------------------------------------
  CompatiblePerm_1 step2_perm_in_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step1_QSV_0_0), .io_in_QSV_0_1(step1_QSV_0_1),
    .io_in_QSV_1_0(step1_QSV_1_0), .io_in_QSV_1_1(step1_QSV_1_1),
    .io_in_QSV_2_0(step1_QSV_2_0), .io_in_QSV_2_1(step1_QSV_2_1),
    .io_in_QSV_3_0(step1_QSV_3_0), .io_in_QSV_3_1(step1_QSV_3_1),
    .io_in_QSV_4_0(step1_QSV_4_0), .io_in_QSV_4_1(step1_QSV_4_1),
    .io_in_QSV_5_0(step1_QSV_5_0), .io_in_QSV_5_1(step1_QSV_5_1),
    .io_in_QSV_6_0(step1_QSV_6_0), .io_in_QSV_6_1(step1_QSV_6_1),
    .io_in_QSV_7_0(step1_QSV_7_0), .io_in_QSV_7_1(step1_QSV_7_1),
    .io_in_valid(step1_valid),
    .io_out_QSV_0_0(step2_perm_in_QSV_0_0), .io_out_QSV_0_1(step2_perm_in_QSV_0_1),
    .io_out_QSV_1_0(step2_perm_in_QSV_1_0), .io_out_QSV_1_1(step2_perm_in_QSV_1_1),
    .io_out_QSV_2_0(step2_perm_in_QSV_2_0), .io_out_QSV_2_1(step2_perm_in_QSV_2_1),
    .io_out_QSV_3_0(step2_perm_in_QSV_3_0), .io_out_QSV_3_1(step2_perm_in_QSV_3_1),
    .io_out_QSV_4_0(step2_perm_in_QSV_4_0), .io_out_QSV_4_1(step2_perm_in_QSV_4_1),
    .io_out_QSV_5_0(step2_perm_in_QSV_5_0), .io_out_QSV_5_1(step2_perm_in_QSV_5_1),
    .io_out_QSV_6_0(step2_perm_in_QSV_6_0), .io_out_QSV_6_1(step2_perm_in_QSV_6_1),
    .io_out_QSV_7_0(step2_perm_in_QSV_7_0), .io_out_QSV_7_1(step2_perm_in_QSV_7_1),
    .io_out_valid(step2_perm_in_valid)
  );

  CTGate3QubitVector8bit step2_ct_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step2_perm_in_QSV_0_0), .io_in_QSV_0_1(step2_perm_in_QSV_0_1),
    .io_in_QSV_1_0(step2_perm_in_QSV_1_0), .io_in_QSV_1_1(step2_perm_in_QSV_1_1),
    .io_in_QSV_2_0(step2_perm_in_QSV_2_0), .io_in_QSV_2_1(step2_perm_in_QSV_2_1),
    .io_in_QSV_3_0(step2_perm_in_QSV_3_0), .io_in_QSV_3_1(step2_perm_in_QSV_3_1),
    .io_in_QSV_4_0(step2_perm_in_QSV_4_0), .io_in_QSV_4_1(step2_perm_in_QSV_4_1),
    .io_in_QSV_5_0(step2_perm_in_QSV_5_0), .io_in_QSV_5_1(step2_perm_in_QSV_5_1),
    .io_in_QSV_6_0(step2_perm_in_QSV_6_0), .io_in_QSV_6_1(step2_perm_in_QSV_6_1),
    .io_in_QSV_7_0(step2_perm_in_QSV_7_0), .io_in_QSV_7_1(step2_perm_in_QSV_7_1),
    .io_in_valid(step2_perm_in_valid),
    .io_out_QSV_0_0(step2_ct_QSV_0_0), .io_out_QSV_0_1(step2_ct_QSV_0_1),
    .io_out_QSV_1_0(step2_ct_QSV_1_0), .io_out_QSV_1_1(step2_ct_QSV_1_1),
    .io_out_QSV_2_0(step2_ct_QSV_2_0), .io_out_QSV_2_1(step2_ct_QSV_2_1),
    .io_out_QSV_3_0(step2_ct_QSV_3_0), .io_out_QSV_3_1(step2_ct_QSV_3_1),
    .io_out_QSV_4_0(step2_ct_QSV_4_0), .io_out_QSV_4_1(step2_ct_QSV_4_1),
    .io_out_QSV_5_0(step2_ct_QSV_5_0), .io_out_QSV_5_1(step2_ct_QSV_5_1),
    .io_out_QSV_6_0(step2_ct_QSV_6_0), .io_out_QSV_6_1(step2_ct_QSV_6_1),
    .io_out_QSV_7_0(step2_ct_QSV_7_0), .io_out_QSV_7_1(step2_ct_QSV_7_1),
    .io_out_valid(step2_ct_valid)
  );

  CompatiblePerm_1 step2_perm_out_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step2_ct_QSV_0_0), .io_in_QSV_0_1(step2_ct_QSV_0_1),
    .io_in_QSV_1_0(step2_ct_QSV_1_0), .io_in_QSV_1_1(step2_ct_QSV_1_1),
    .io_in_QSV_2_0(step2_ct_QSV_2_0), .io_in_QSV_2_1(step2_ct_QSV_2_1),
    .io_in_QSV_3_0(step2_ct_QSV_3_0), .io_in_QSV_3_1(step2_ct_QSV_3_1),
    .io_in_QSV_4_0(step2_ct_QSV_4_0), .io_in_QSV_4_1(step2_ct_QSV_4_1),
    .io_in_QSV_5_0(step2_ct_QSV_5_0), .io_in_QSV_5_1(step2_ct_QSV_5_1),
    .io_in_QSV_6_0(step2_ct_QSV_6_0), .io_in_QSV_6_1(step2_ct_QSV_6_1),
    .io_in_QSV_7_0(step2_ct_QSV_7_0), .io_in_QSV_7_1(step2_ct_QSV_7_1),
    .io_in_valid(step2_ct_valid),
    .io_out_QSV_0_0(step2_QSV_0_0), .io_out_QSV_0_1(step2_QSV_0_1),
    .io_out_QSV_1_0(step2_QSV_1_0), .io_out_QSV_1_1(step2_QSV_1_1),
    .io_out_QSV_2_0(step2_QSV_2_0), .io_out_QSV_2_1(step2_QSV_2_1),
    .io_out_QSV_3_0(step2_QSV_3_0), .io_out_QSV_3_1(step2_QSV_3_1),
    .io_out_QSV_4_0(step2_QSV_4_0), .io_out_QSV_4_1(step2_QSV_4_1),
    .io_out_QSV_5_0(step2_QSV_5_0), .io_out_QSV_5_1(step2_QSV_5_1),
    .io_out_QSV_6_0(step2_QSV_6_0), .io_out_QSV_6_1(step2_QSV_6_1),
    .io_out_QSV_7_0(step2_QSV_7_0), .io_out_QSV_7_1(step2_QSV_7_1),
    .io_out_valid(step2_valid)
  );

  // ---------------------------------------------------------------------------
  // Step 3: H on qubit 1
  // ---------------------------------------------------------------------------
  CompatiblePerm step3_perm_in_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step2_QSV_0_0), .io_in_QSV_0_1(step2_QSV_0_1),
    .io_in_QSV_1_0(step2_QSV_1_0), .io_in_QSV_1_1(step2_QSV_1_1),
    .io_in_QSV_2_0(step2_QSV_2_0), .io_in_QSV_2_1(step2_QSV_2_1),
    .io_in_QSV_3_0(step2_QSV_3_0), .io_in_QSV_3_1(step2_QSV_3_1),
    .io_in_QSV_4_0(step2_QSV_4_0), .io_in_QSV_4_1(step2_QSV_4_1),
    .io_in_QSV_5_0(step2_QSV_5_0), .io_in_QSV_5_1(step2_QSV_5_1),
    .io_in_QSV_6_0(step2_QSV_6_0), .io_in_QSV_6_1(step2_QSV_6_1),
    .io_in_QSV_7_0(step2_QSV_7_0), .io_in_QSV_7_1(step2_QSV_7_1),
    .io_in_valid(step2_valid),
    .io_out_QSV_0_0(step3_perm_in_QSV_0_0), .io_out_QSV_0_1(step3_perm_in_QSV_0_1),
    .io_out_QSV_1_0(step3_perm_in_QSV_1_0), .io_out_QSV_1_1(step3_perm_in_QSV_1_1),
    .io_out_QSV_2_0(step3_perm_in_QSV_2_0), .io_out_QSV_2_1(step3_perm_in_QSV_2_1),
    .io_out_QSV_3_0(step3_perm_in_QSV_3_0), .io_out_QSV_3_1(step3_perm_in_QSV_3_1),
    .io_out_QSV_4_0(step3_perm_in_QSV_4_0), .io_out_QSV_4_1(step3_perm_in_QSV_4_1),
    .io_out_QSV_5_0(step3_perm_in_QSV_5_0), .io_out_QSV_5_1(step3_perm_in_QSV_5_1),
    .io_out_QSV_6_0(step3_perm_in_QSV_6_0), .io_out_QSV_6_1(step3_perm_in_QSV_6_1),
    .io_out_QSV_7_0(step3_perm_in_QSV_7_0), .io_out_QSV_7_1(step3_perm_in_QSV_7_1),
    .io_out_valid(step3_perm_in_valid)
  );

  HGate3QubitVector8bit step3_h_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step3_perm_in_QSV_0_0), .io_in_QSV_0_1(step3_perm_in_QSV_0_1),
    .io_in_QSV_1_0(step3_perm_in_QSV_1_0), .io_in_QSV_1_1(step3_perm_in_QSV_1_1),
    .io_in_QSV_2_0(step3_perm_in_QSV_2_0), .io_in_QSV_2_1(step3_perm_in_QSV_2_1),
    .io_in_QSV_3_0(step3_perm_in_QSV_3_0), .io_in_QSV_3_1(step3_perm_in_QSV_3_1),
    .io_in_QSV_4_0(step3_perm_in_QSV_4_0), .io_in_QSV_4_1(step3_perm_in_QSV_4_1),
    .io_in_QSV_5_0(step3_perm_in_QSV_5_0), .io_in_QSV_5_1(step3_perm_in_QSV_5_1),
    .io_in_QSV_6_0(step3_perm_in_QSV_6_0), .io_in_QSV_6_1(step3_perm_in_QSV_6_1),
    .io_in_QSV_7_0(step3_perm_in_QSV_7_0), .io_in_QSV_7_1(step3_perm_in_QSV_7_1),
    .io_in_valid(step3_perm_in_valid),
    .io_out_QSV_0_0(step3_h_QSV_0_0), .io_out_QSV_0_1(step3_h_QSV_0_1),
    .io_out_QSV_1_0(step3_h_QSV_1_0), .io_out_QSV_1_1(step3_h_QSV_1_1),
    .io_out_QSV_2_0(step3_h_QSV_2_0), .io_out_QSV_2_1(step3_h_QSV_2_1),
    .io_out_QSV_3_0(step3_h_QSV_3_0), .io_out_QSV_3_1(step3_h_QSV_3_1),
    .io_out_QSV_4_0(step3_h_QSV_4_0), .io_out_QSV_4_1(step3_h_QSV_4_1),
    .io_out_QSV_5_0(step3_h_QSV_5_0), .io_out_QSV_5_1(step3_h_QSV_5_1),
    .io_out_QSV_6_0(step3_h_QSV_6_0), .io_out_QSV_6_1(step3_h_QSV_6_1),
    .io_out_QSV_7_0(step3_h_QSV_7_0), .io_out_QSV_7_1(step3_h_QSV_7_1),
    .io_out_valid(step3_h_valid)
  );

  CompatiblePerm step3_perm_out_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step3_h_QSV_0_0), .io_in_QSV_0_1(step3_h_QSV_0_1),
    .io_in_QSV_1_0(step3_h_QSV_1_0), .io_in_QSV_1_1(step3_h_QSV_1_1),
    .io_in_QSV_2_0(step3_h_QSV_2_0), .io_in_QSV_2_1(step3_h_QSV_2_1),
    .io_in_QSV_3_0(step3_h_QSV_3_0), .io_in_QSV_3_1(step3_h_QSV_3_1),
    .io_in_QSV_4_0(step3_h_QSV_4_0), .io_in_QSV_4_1(step3_h_QSV_4_1),
    .io_in_QSV_5_0(step3_h_QSV_5_0), .io_in_QSV_5_1(step3_h_QSV_5_1),
    .io_in_QSV_6_0(step3_h_QSV_6_0), .io_in_QSV_6_1(step3_h_QSV_6_1),
    .io_in_QSV_7_0(step3_h_QSV_7_0), .io_in_QSV_7_1(step3_h_QSV_7_1),
    .io_in_valid(step3_h_valid),
    .io_out_QSV_0_0(step3_QSV_0_0), .io_out_QSV_0_1(step3_QSV_0_1),
    .io_out_QSV_1_0(step3_QSV_1_0), .io_out_QSV_1_1(step3_QSV_1_1),
    .io_out_QSV_2_0(step3_QSV_2_0), .io_out_QSV_2_1(step3_QSV_2_1),
    .io_out_QSV_3_0(step3_QSV_3_0), .io_out_QSV_3_1(step3_QSV_3_1),
    .io_out_QSV_4_0(step3_QSV_4_0), .io_out_QSV_4_1(step3_QSV_4_1),
    .io_out_QSV_5_0(step3_QSV_5_0), .io_out_QSV_5_1(step3_QSV_5_1),
    .io_out_QSV_6_0(step3_QSV_6_0), .io_out_QSV_6_1(step3_QSV_6_1),
    .io_out_QSV_7_0(step3_QSV_7_0), .io_out_QSV_7_1(step3_QSV_7_1),
    .io_out_valid(step3_valid)
  );

  // ---------------------------------------------------------------------------
  // Step 4: CS on qubits 2 (control) and 1 (target)
  // ---------------------------------------------------------------------------
  CompatiblePerm_2 step4_perm_in_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step3_QSV_0_0), .io_in_QSV_0_1(step3_QSV_0_1),
    .io_in_QSV_1_0(step3_QSV_1_0), .io_in_QSV_1_1(step3_QSV_1_1),
    .io_in_QSV_2_0(step3_QSV_2_0), .io_in_QSV_2_1(step3_QSV_2_1),
    .io_in_QSV_3_0(step3_QSV_3_0), .io_in_QSV_3_1(step3_QSV_3_1),
    .io_in_QSV_4_0(step3_QSV_4_0), .io_in_QSV_4_1(step3_QSV_4_1),
    .io_in_QSV_5_0(step3_QSV_5_0), .io_in_QSV_5_1(step3_QSV_5_1),
    .io_in_QSV_6_0(step3_QSV_6_0), .io_in_QSV_6_1(step3_QSV_6_1),
    .io_in_QSV_7_0(step3_QSV_7_0), .io_in_QSV_7_1(step3_QSV_7_1),
    .io_in_valid(step3_valid),
    .io_out_QSV_0_0(step4_perm_in_QSV_0_0), .io_out_QSV_0_1(step4_perm_in_QSV_0_1),
    .io_out_QSV_1_0(step4_perm_in_QSV_1_0), .io_out_QSV_1_1(step4_perm_in_QSV_1_1),
    .io_out_QSV_2_0(step4_perm_in_QSV_2_0), .io_out_QSV_2_1(step4_perm_in_QSV_2_1),
    .io_out_QSV_3_0(step4_perm_in_QSV_3_0), // 3_1 pruned
    .io_out_QSV_4_0(step4_perm_in_QSV_4_0), .io_out_QSV_4_1(step4_perm_in_QSV_4_1),
    .io_out_QSV_5_0(step4_perm_in_QSV_5_0), .io_out_QSV_5_1(step4_perm_in_QSV_5_1),
    .io_out_QSV_6_0(step4_perm_in_QSV_6_0), .io_out_QSV_6_1(step4_perm_in_QSV_6_1),
    .io_out_QSV_7_0(step4_perm_in_QSV_7_0), // 7_1 pruned
    .io_out_valid(step4_perm_in_valid)
  );

  CSGate3QubitVector8bit step4_cs_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step4_perm_in_QSV_0_0), .io_in_QSV_0_1(step4_perm_in_QSV_0_1),
    .io_in_QSV_1_0(step4_perm_in_QSV_1_0), .io_in_QSV_1_1(step4_perm_in_QSV_1_1),
    .io_in_QSV_2_0(step4_perm_in_QSV_2_0), .io_in_QSV_2_1(step4_perm_in_QSV_2_1),
    .io_in_QSV_3_0(step4_perm_in_QSV_3_0),
    .io_in_QSV_4_0(step4_perm_in_QSV_4_0), .io_in_QSV_4_1(step4_perm_in_QSV_4_1),
    .io_in_QSV_5_0(step4_perm_in_QSV_5_0), .io_in_QSV_5_1(step4_perm_in_QSV_5_1),
    .io_in_QSV_6_0(step4_perm_in_QSV_6_0), .io_in_QSV_6_1(step4_perm_in_QSV_6_1),
    .io_in_QSV_7_0(step4_perm_in_QSV_7_0),
    .io_in_valid(step4_perm_in_valid),
    .io_out_QSV_0_0(step4_cs_QSV_0_0), .io_out_QSV_0_1(step4_cs_QSV_0_1),
    .io_out_QSV_1_0(step4_cs_QSV_1_0), .io_out_QSV_1_1(step4_cs_QSV_1_1),
    .io_out_QSV_2_0(step4_cs_QSV_2_0), .io_out_QSV_2_1(step4_cs_QSV_2_1),
    .io_out_QSV_3_0(step4_cs_QSV_3_0), .io_out_QSV_3_1(step4_cs_QSV_3_1),
    .io_out_QSV_4_0(step4_cs_QSV_4_0), .io_out_QSV_4_1(step4_cs_QSV_4_1),
    .io_out_QSV_5_0(step4_cs_QSV_5_0), .io_out_QSV_5_1(step4_cs_QSV_5_1),
    .io_out_QSV_6_0(step4_cs_QSV_6_0), .io_out_QSV_6_1(step4_cs_QSV_6_1),
    .io_out_QSV_7_0(step4_cs_QSV_7_0), .io_out_QSV_7_1(step4_cs_QSV_7_1),
    .io_out_valid(step4_cs_valid)
  );

  CompatiblePerm_2 step4_perm_out_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step4_cs_QSV_0_0), .io_in_QSV_0_1(step4_cs_QSV_0_1),
    .io_in_QSV_1_0(step4_cs_QSV_1_0), .io_in_QSV_1_1(step4_cs_QSV_1_1),
    .io_in_QSV_2_0(step4_cs_QSV_2_0), .io_in_QSV_2_1(step4_cs_QSV_2_1),
    .io_in_QSV_3_0(step4_cs_QSV_3_0), .io_in_QSV_3_1(step4_cs_QSV_3_1),
    .io_in_QSV_4_0(step4_cs_QSV_4_0), .io_in_QSV_4_1(step4_cs_QSV_4_1),
    .io_in_QSV_5_0(step4_cs_QSV_5_0), .io_in_QSV_5_1(step4_cs_QSV_5_1),
    .io_in_QSV_6_0(step4_cs_QSV_6_0), .io_in_QSV_6_1(step4_cs_QSV_6_1),
    .io_in_QSV_7_0(step4_cs_QSV_7_0), .io_in_QSV_7_1(step4_cs_QSV_7_1),
    .io_in_valid(step4_cs_valid),
    .io_out_QSV_0_0(step4_QSV_0_0), .io_out_QSV_0_1(step4_QSV_0_1),
    .io_out_QSV_1_0(step4_QSV_1_0), .io_out_QSV_1_1(step4_QSV_1_1),
    .io_out_QSV_2_0(step4_QSV_2_0), .io_out_QSV_2_1(step4_QSV_2_1),
    .io_out_QSV_3_0(step4_QSV_3_0), .io_out_QSV_3_1(step4_QSV_3_1),
    .io_out_QSV_4_0(step4_QSV_4_0), .io_out_QSV_4_1(step4_QSV_4_1),
    .io_out_QSV_5_0(step4_QSV_5_0), .io_out_QSV_5_1(step4_QSV_5_1),
    .io_out_QSV_6_0(step4_QSV_6_0), .io_out_QSV_6_1(step4_QSV_6_1),
    .io_out_QSV_7_0(step4_QSV_7_0), .io_out_QSV_7_1(step4_QSV_7_1),
    .io_out_valid(step4_valid)
  );

  // ---------------------------------------------------------------------------
  // Step 5: H on qubit 2
  // ---------------------------------------------------------------------------
  CompatiblePerm_2 step5_perm_in_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step4_QSV_0_0), .io_in_QSV_0_1(step4_QSV_0_1),
    .io_in_QSV_1_0(step4_QSV_1_0), .io_in_QSV_1_1(step4_QSV_1_1),
    .io_in_QSV_2_0(step4_QSV_2_0), .io_in_QSV_2_1(step4_QSV_2_1),
    .io_in_QSV_3_0(step4_QSV_3_0), .io_in_QSV_3_1(step4_QSV_3_1),
    .io_in_QSV_4_0(step4_QSV_4_0), .io_in_QSV_4_1(step4_QSV_4_1),
    .io_in_QSV_5_0(step4_QSV_5_0), .io_in_QSV_5_1(step4_QSV_5_1),
    .io_in_QSV_6_0(step4_QSV_6_0), .io_in_QSV_6_1(step4_QSV_6_1),
    .io_in_QSV_7_0(step4_QSV_7_0), .io_in_QSV_7_1(step4_QSV_7_1),
    .io_in_valid(step4_valid),
    .io_out_QSV_0_0(step5_perm_in_QSV_0_0), .io_out_QSV_0_1(step5_perm_in_QSV_0_1),
    .io_out_QSV_1_0(step5_perm_in_QSV_1_0), .io_out_QSV_1_1(step5_perm_in_QSV_1_1),
    .io_out_QSV_2_0(step5_perm_in_QSV_2_0), .io_out_QSV_2_1(step5_perm_in_QSV_2_1),
    .io_out_QSV_3_0(step5_perm_in_QSV_3_0), .io_out_QSV_3_1(step5_perm_in_QSV_3_1),
    .io_out_QSV_4_0(step5_perm_in_QSV_4_0), .io_out_QSV_4_1(step5_perm_in_QSV_4_1),
    .io_out_QSV_5_0(step5_perm_in_QSV_5_0), .io_out_QSV_5_1(step5_perm_in_QSV_5_1),
    .io_out_QSV_6_0(step5_perm_in_QSV_6_0), .io_out_QSV_6_1(step5_perm_in_QSV_6_1),
    .io_out_QSV_7_0(step5_perm_in_QSV_7_0), .io_out_QSV_7_1(step5_perm_in_QSV_7_1),
    .io_out_valid(step5_perm_in_valid)
  );

  HGate3QubitVector8bit step5_h_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step5_perm_in_QSV_0_0), .io_in_QSV_0_1(step5_perm_in_QSV_0_1),
    .io_in_QSV_1_0(step5_perm_in_QSV_1_0), .io_in_QSV_1_1(step5_perm_in_QSV_1_1),
    .io_in_QSV_2_0(step5_perm_in_QSV_2_0), .io_in_QSV_2_1(step5_perm_in_QSV_2_1),
    .io_in_QSV_3_0(step5_perm_in_QSV_3_0), .io_in_QSV_3_1(step5_perm_in_QSV_3_1),
    .io_in_QSV_4_0(step5_perm_in_QSV_4_0), .io_in_QSV_4_1(step5_perm_in_QSV_4_1),
    .io_in_QSV_5_0(step5_perm_in_QSV_5_0), .io_in_QSV_5_1(step5_perm_in_QSV_5_1),
    .io_in_QSV_6_0(step5_perm_in_QSV_6_0), .io_in_QSV_6_1(step5_perm_in_QSV_6_1),
    .io_in_QSV_7_0(step5_perm_in_QSV_7_0), .io_in_QSV_7_1(step5_perm_in_QSV_7_1),
    .io_in_valid(step5_perm_in_valid),
    .io_out_QSV_0_0(step5_h_QSV_0_0), .io_out_QSV_0_1(step5_h_QSV_0_1),
    .io_out_QSV_1_0(step5_h_QSV_1_0), .io_out_QSV_1_1(step5_h_QSV_1_1),
    .io_out_QSV_2_0(step5_h_QSV_2_0), .io_out_QSV_2_1(step5_h_QSV_2_1),
    .io_out_QSV_3_0(step5_h_QSV_3_0), .io_out_QSV_3_1(step5_h_QSV_3_1),
    .io_out_QSV_4_0(step5_h_QSV_4_0), .io_out_QSV_4_1(step5_h_QSV_4_1),
    .io_out_QSV_5_0(step5_h_QSV_5_0), .io_out_QSV_5_1(step5_h_QSV_5_1),
    .io_out_QSV_6_0(step5_h_QSV_6_0), .io_out_QSV_6_1(step5_h_QSV_6_1),
    .io_out_QSV_7_0(step5_h_QSV_7_0), .io_out_QSV_7_1(step5_h_QSV_7_1),
    .io_out_valid(step5_h_valid)
  );

  CompatiblePerm_2 step5_perm_out_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step5_h_QSV_0_0), .io_in_QSV_0_1(step5_h_QSV_0_1),
    .io_in_QSV_1_0(step5_h_QSV_1_0), .io_in_QSV_1_1(step5_h_QSV_1_1),
    .io_in_QSV_2_0(step5_h_QSV_2_0), .io_in_QSV_2_1(step5_h_QSV_2_1),
    .io_in_QSV_3_0(step5_h_QSV_3_0), .io_in_QSV_3_1(step5_h_QSV_3_1),
    .io_in_QSV_4_0(step5_h_QSV_4_0), .io_in_QSV_4_1(step5_h_QSV_4_1),
    .io_in_QSV_5_0(step5_h_QSV_5_0), .io_in_QSV_5_1(step5_h_QSV_5_1),
    .io_in_QSV_6_0(step5_h_QSV_6_0), .io_in_QSV_6_1(step5_h_QSV_6_1),
    .io_in_QSV_7_0(step5_h_QSV_7_0), .io_in_QSV_7_1(step5_h_QSV_7_1),
    .io_in_valid(step5_h_valid),
    .io_out_QSV_0_0(step5_QSV_0_0), .io_out_QSV_0_1(step5_QSV_0_1),
    .io_out_QSV_1_0(step5_QSV_1_0), .io_out_QSV_1_1(step5_QSV_1_1),
    .io_out_QSV_2_0(step5_QSV_2_0), .io_out_QSV_2_1(step5_QSV_2_1),
    .io_out_QSV_3_0(step5_QSV_3_0), .io_out_QSV_3_1(step5_QSV_3_1),
    .io_out_QSV_4_0(step5_QSV_4_0), .io_out_QSV_4_1(step5_QSV_4_1),
    .io_out_QSV_5_0(step5_QSV_5_0), .io_out_QSV_5_1(step5_QSV_5_1),
    .io_out_QSV_6_0(step5_QSV_6_0), .io_out_QSV_6_1(step5_QSV_6_1),
    .io_out_QSV_7_0(step5_QSV_7_0), .io_out_QSV_7_1(step5_QSV_7_1),
    .io_out_valid(step5_valid)
  );

  // ---------------------------------------------------------------------------
  // Step 6: SWAP on qubits 0 and 2
  // ---------------------------------------------------------------------------
  CompatiblePerm_1 step6_perm_in_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step5_QSV_0_0), .io_in_QSV_0_1(step5_QSV_0_1),
    .io_in_QSV_1_0(step5_QSV_1_0), .io_in_QSV_1_1(step5_QSV_1_1),
    .io_in_QSV_2_0(step5_QSV_2_0), .io_in_QSV_2_1(step5_QSV_2_1),
    .io_in_QSV_3_0(step5_QSV_3_0), .io_in_QSV_3_1(step5_QSV_3_1),
    .io_in_QSV_4_0(step5_QSV_4_0), .io_in_QSV_4_1(step5_QSV_4_1),
    .io_in_QSV_5_0(step5_QSV_5_0), .io_in_QSV_5_1(step5_QSV_5_1),
    .io_in_QSV_6_0(step5_QSV_6_0), .io_in_QSV_6_1(step5_QSV_6_1),
    .io_in_QSV_7_0(step5_QSV_7_0), .io_in_QSV_7_1(step5_QSV_7_1),
    .io_in_valid(step5_valid),
    .io_out_QSV_0_0(step6_perm_in_QSV_0_0), .io_out_QSV_0_1(step6_perm_in_QSV_0_1),
    .io_out_QSV_1_0(step6_perm_in_QSV_1_0), .io_out_QSV_1_1(step6_perm_in_QSV_1_1),
    .io_out_QSV_2_0(step6_perm_in_QSV_2_0), .io_out_QSV_2_1(step6_perm_in_QSV_2_1),
    .io_out_QSV_3_0(step6_perm_in_QSV_3_0), .io_out_QSV_3_1(step6_perm_in_QSV_3_1),
    .io_out_QSV_4_0(step6_perm_in_QSV_4_0), .io_out_QSV_4_1(step6_perm_in_QSV_4_1),
    .io_out_QSV_5_0(step6_perm_in_QSV_5_0), .io_out_QSV_5_1(step6_perm_in_QSV_5_1),
    .io_out_QSV_6_0(step6_perm_in_QSV_6_0), .io_out_QSV_6_1(step6_perm_in_QSV_6_1),
    .io_out_QSV_7_0(step6_perm_in_QSV_7_0), .io_out_QSV_7_1(step6_perm_in_QSV_7_1),
    .io_out_valid(step6_perm_in_valid)
  );

  SWGate3QubitVector8bit step6_swap_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step6_perm_in_QSV_0_0), .io_in_QSV_0_1(step6_perm_in_QSV_0_1),
    .io_in_QSV_1_0(step6_perm_in_QSV_1_0), .io_in_QSV_1_1(step6_perm_in_QSV_1_1),
    .io_in_QSV_2_0(step6_perm_in_QSV_2_0), .io_in_QSV_2_1(step6_perm_in_QSV_2_1),
    .io_in_QSV_3_0(step6_perm_in_QSV_3_0), .io_in_QSV_3_1(step6_perm_in_QSV_3_1),
    .io_in_QSV_4_0(step6_perm_in_QSV_4_0), .io_in_QSV_4_1(step6_perm_in_QSV_4_1),
    .io_in_QSV_5_0(step6_perm_in_QSV_5_0), .io_in_QSV_5_1(step6_perm_in_QSV_5_1),
    .io_in_QSV_6_0(step6_perm_in_QSV_6_0), .io_in_QSV_6_1(step6_perm_in_QSV_6_1),
    .io_in_QSV_7_0(step6_perm_in_QSV_7_0), .io_in_QSV_7_1(step6_perm_in_QSV_7_1),
    .io_in_valid(step6_perm_in_valid),
    .io_out_QSV_0_0(step6_swap_QSV_0_0), .io_out_QSV_0_1(step6_swap_QSV_0_1),
    .io_out_QSV_1_0(step6_swap_QSV_1_0), .io_out_QSV_1_1(step6_swap_QSV_1_1),
    .io_out_QSV_2_0(step6_swap_QSV_2_0), .io_out_QSV_2_1(step6_swap_QSV_2_1),
    .io_out_QSV_3_0(step6_swap_QSV_3_0), .io_out_QSV_3_1(step6_swap_QSV_3_1),
    .io_out_QSV_4_0(step6_swap_QSV_4_0), .io_out_QSV_4_1(step6_swap_QSV_4_1),
    .io_out_QSV_5_0(step6_swap_QSV_5_0), .io_out_QSV_5_1(step6_swap_QSV_5_1),
    .io_out_QSV_6_0(step6_swap_QSV_6_0), .io_out_QSV_6_1(step6_swap_QSV_6_1),
    .io_out_QSV_7_0(step6_swap_QSV_7_0), .io_out_QSV_7_1(step6_swap_QSV_7_1),
    .io_out_valid(step6_swap_valid)
  );

  CompatiblePerm_1 step6_perm_out_inst (
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(step6_swap_QSV_0_0), .io_in_QSV_0_1(step6_swap_QSV_0_1),
    .io_in_QSV_1_0(step6_swap_QSV_1_0), .io_in_QSV_1_1(step6_swap_QSV_1_1),
    .io_in_QSV_2_0(step6_swap_QSV_2_0), .io_in_QSV_2_1(step6_swap_QSV_2_1),
    .io_in_QSV_3_0(step6_swap_QSV_3_0), .io_in_QSV_3_1(step6_swap_QSV_3_1),
    .io_in_QSV_4_0(step6_swap_QSV_4_0), .io_in_QSV_4_1(step6_swap_QSV_4_1),
    .io_in_QSV_5_0(step6_swap_QSV_5_0), .io_in_QSV_5_1(step6_swap_QSV_5_1),
    .io_in_QSV_6_0(step6_swap_QSV_6_0), .io_in_QSV_6_1(step6_swap_QSV_6_1),
    .io_in_QSV_7_0(step6_swap_QSV_7_0), .io_in_QSV_7_1(step6_swap_QSV_7_1),
    .io_in_valid(step6_swap_valid),
    .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1),
    .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1),
    .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1),
    .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1),
    .io_out_QSV_4_0(io_out_QSV_4_0), .io_out_QSV_4_1(io_out_QSV_4_1),
    .io_out_QSV_5_0(io_out_QSV_5_0), .io_out_QSV_5_1(io_out_QSV_5_1),
    .io_out_QSV_6_0(io_out_QSV_6_0), .io_out_QSV_6_1(io_out_QSV_6_1),
    .io_out_QSV_7_0(io_out_QSV_7_0), .io_out_QSV_7_1(io_out_QSV_7_1),
    .io_out_valid(io_out_valid)
  );

endmodule
