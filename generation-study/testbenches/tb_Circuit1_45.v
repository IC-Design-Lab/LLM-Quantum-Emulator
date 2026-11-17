//*********************************************************************************************//
//----------------   Circuit1_45 Testbench (Self-checking, hypothesis-discriminating)  ------////
//----------------   LLM-Verilog Verification Framework  ------------------------------------////
//----------------   Purpose: settle the Circuit1_45 bracket-rule anomaly  ------------------////
//-------------------------------------------------------------------------------------------////
//*********************************************************************************************//
//----- Spec (experiment/matched_arms/python_specs/Circuit_08.py): h(0), cx(0,1), sx(0).      //
//----- Ground-truth pipeline: H -> Perm -> CN -> Perm -> SX (SX un-bracketed).               //
//-----                                                                                       //
//----- INPUT IS |01>, NOT |00>: for |00> the golden state is invariant under                 //
//----- CompatiblePerm (idx1==idx2 amplitudes), so |00> cannot distinguish a correct          //
//----- SX from one applied to the wrong qubit. |01> discriminates:                           //
//-----   CORRECT (sx on qiskit q0): QSV1 = +0.35-0.35i, QSV2 = -0.35+0.35i                   //
//-----   BUGGY   (sx on qiskit q1): QSV1 = -0.35+0.35i, QSV2 = +0.35-0.35i                   //
//----- Golden values from Qiskit Statevector (independent of any Verilog/Chisel).            //
//----- Q2.14: +0.353553 -> 0x16A1, -0.353553 -> 0xE95F. Tolerance +/-16 LSB for              //
//----- fixed-point truncation (family gold like 0x1FFF vs 0x2000 shows 1-LSB drift).         //
//*********************************************************************************************//
`timescale 1ns/1ps

module tb_Circuit1_45;
  reg clock=0, reset=1, io_in_valid=0;
  reg  [15:0] in0_0,in0_1,in1_0,in1_1,in2_0,in2_1,in3_0,in3_1;
  wire [15:0] o0_0,o0_1,o1_0,o1_1,o2_0,o2_1,o3_0,o3_1;
  wire io_out_valid;
  integer err_correct=0, err_buggy=0;

  // ---- DUT: only the module name changes ----
  Circuit1_45 dut(
    .clock(clock), .reset(reset),
    .io_in_QSV_0_0(in0_0), .io_in_QSV_0_1(in0_1),
    .io_in_QSV_1_0(in1_0), .io_in_QSV_1_1(in1_1),
    .io_in_QSV_2_0(in2_0), .io_in_QSV_2_1(in2_1),
    .io_in_QSV_3_0(in3_0), .io_in_QSV_3_1(in3_1),
    .io_in_valid(io_in_valid),
    .io_out_QSV_0_0(o0_0), .io_out_QSV_0_1(o0_1),
    .io_out_QSV_1_0(o1_0), .io_out_QSV_1_1(o1_1),
    .io_out_QSV_2_0(o2_0), .io_out_QSV_2_1(o2_1),
    .io_out_QSV_3_0(o3_0), .io_out_QSV_3_1(o3_1),
    .io_out_valid(io_out_valid));

  always #5 clock = ~clock;

  // ---- tolerance compare: |got - exp| <= 16 LSB (signed) ----
  function within_tol(input [15:0] got, input [15:0] exp);
    reg signed [16:0] d;
    begin
      d = $signed({got[15],got}) - $signed({exp[15],exp});
      within_tol = (d <= 17'sd16) && (d >= -17'sd16);
    end
  endfunction

  // check against BOTH hypotheses; count mismatches separately
  task check2(input [127:0] tag, input [15:0] got,
              input [15:0] exp_correct, input [15:0] exp_buggy);
    begin
      $display("  %0s: got %h  (spec expects %h, buggy expects %h)",
               tag, got, exp_correct, exp_buggy);
      if (!within_tol(got, exp_correct)) err_correct = err_correct + 1;
      if (!within_tol(got, exp_buggy))   err_buggy   = err_buggy   + 1;
    end
  endtask

  initial begin
    $dumpfile("Circuit1_45.vcd"); $dumpvars(0, tb_Circuit1_45);

    // input state |01> : QSV_1 = 1.0 (0x4000), everything else 0
    in0_0=0;        in0_1=0; in1_0=16'h4000; in1_1=0;
    in2_0=0;        in2_1=0; in3_0=0;        in3_1=0;

    repeat(4) @(negedge clock);
    reset = 0;
    io_in_valid = 1;            // sustained valid so the pipeline fills

    @(posedge io_out_valid);    // wait for the circuit to signal "output ready"
    @(posedge clock); #1;       // settle one cycle into the valid window

    $display("Circuit1_45 hypothesis test (input |01>):");

    //==========================================================================
    // Qiskit golden states, Q2.14 (+0.3536 = 16A1, -0.3536 = E95F):
    //             CORRECT h,cx,sx(q0)      BUGGY sx(q1)
    // QSV_0:      +0.35 +0.35i             +0.35 +0.35i     (same)
    // QSV_1:      +0.35 -0.35i             -0.35 +0.35i     (DISCRIMINATES)
    // QSV_2:      -0.35 +0.35i             +0.35 -0.35i     (DISCRIMINATES)
    // QSV_3:      -0.35 -0.35i             -0.35 -0.35i     (same)
    //==========================================================================
    check2("QSV_0_0", o0_0, 16'h16A1, 16'h16A1);
    check2("QSV_0_1", o0_1, 16'h16A1, 16'h16A1);
    check2("QSV_1_0", o1_0, 16'h16A1, 16'hE95F);
    check2("QSV_1_1", o1_1, 16'hE95F, 16'h16A1);
    check2("QSV_2_0", o2_0, 16'hE95F, 16'h16A1);
    check2("QSV_2_1", o2_1, 16'h16A1, 16'hE95F);
    check2("QSV_3_0", o3_0, 16'hE95F, 16'hE95F);
    check2("QSV_3_1", o3_1, 16'hE95F, 16'hE95F);
    //==========================================================================

    if (err_correct==0 && err_buggy!=0)
      $display("VERDICT: MATCHES SPEC  -- ground truth is CORRECT; un-bracketed final SX implements sx(q0); bracket rule has a genuine exception");
    else if (err_buggy==0 && err_correct!=0)
      $display("VERDICT: MATCHES BUGGY -- ground truth is DEFECTIVE (SX acts on wrong qubit / missing closing perm); bracket rule clean at 9/9");
    else if (err_correct==0 && err_buggy==0)
      $display("VERDICT: INCONCLUSIVE  -- output matches both (should not happen for |01>)");
    else
      $display("VERDICT: NEITHER       -- %0d vs spec, %0d vs buggy: harness or latency issue, or unexpected gate variant (e.g. SXdg)", err_correct, err_buggy);
    $finish;
  end

  // safety timeout so a never-asserting valid doesn't hang forever
  initial begin #2000; $display("TIMEOUT: io_out_valid never asserted"); $finish; end
endmodule
