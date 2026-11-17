`timescale 1ns/1ps
// GOLDEN SOURCE: SIMULATION-CONFIRMED (real ground truth, ModelSim 2020.1).
// Built from actual gate_library modules (HGate2QubitVector16bit, CompatiblePerm,
// CNGate2QubitVector16bit -- all real; SXGate2QubitVector16bit constructed by
// wrapping the real SqrtXGate primitive in the same pattern as the H-gate wrappers).
// The hand-derived value 0xE960 was 1 LSB off; real hardware rounding gives 0xE95F
// (matches the same 1-LSB behavior seen in the verified SXdg/Circuit0_4 run).
// See experiment/matched_arms/ground_truth/ for the full derivation.
//==============================================================================
// Self-checking testbench TEMPLATE
//
// HOW TO USE THIS FILE:
//   1. Find-and-replace  Circuit_08  ->  your circuit (e.g. Circuit0_3)
//      (appears in 3 places: tb name, dumpfile, DUT instance)
//   2. Fill in the 8 golden-state values in the >>> FILL IN <<< section
//   3. Update the header comment below
//   4. Run:  ./run_sim.sh Circuit_08.v gate_library_flat_Circuit_08.sv tb_Circuit_08.v
//
// NOTE: you do NOT need to set the latency anywhere -- the testbench waits for
//       io_out_valid automatically, so the same code works for any cycle count.
//==============================================================================
// >>> EDIT THIS COMMENT BLOCK FOR YOUR CIRCUIT <<<
//   Circuit : Circuit_08
//   Gates   : H -> [perm] CX [perm] -> SX   (HCXSX)
//   Input   : |00>   (QSV_0_0 = 0x4000 = 1.0, rest 0)
//   Latency : 10 cycles (nominal; tb waits for io_out_valid)
//==============================================================================

module tb_Circuit_08;
  reg clock=0, reset=1, io_in_valid=0;
  reg  [15:0] in0_0,in0_1,in1_0,in1_1,in2_0,in2_1,in3_0,in3_1;
  wire [15:0] o0_0,o0_1,o1_0,o1_1,o2_0,o2_1,o3_0,o3_1;
  wire io_out_valid;
  integer errors=0;

  // ---- DUT: only the module name changes ----
  Circuit_08 dut(
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

  // ---- self-checking helper: copy verbatim, never edit ----
  task check(input [127:0] tag, input [15:0] got, input [15:0] exp);
    begin
      if (got !== exp) begin
        $display("  FAIL %0s: got %h expected %h", tag, got, exp);
        errors = errors + 1;
      end else
        $display("  ok   %0s = %h", tag, got);
    end
  endtask

  initial begin
    $dumpfile("Circuit_08.vcd"); $dumpvars(0, tb_Circuit_08);

    // input state |00> : QSV_0 = 1.0, everything else 0
    in0_0=16'h4000; in0_1=0; in1_0=0; in1_1=0;
    in2_0=0;        in2_1=0; in3_0=0; in3_1=0;

    repeat(4) @(negedge clock);
    reset = 0;
    io_in_valid = 1;            // sustained valid so the pipeline fills

    @(posedge io_out_valid);    // wait for the circuit to signal "output ready"
    @(posedge clock); #1;       // settle one cycle into the valid window

    $display("Circuit_08 verification (input |00>):");

    //==========================================================================
    // >>> FILL IN: the 8 golden-state values for your circuit <<<
    // Order: QSV_0 real, QSV_0 imag, QSV_1 real, QSV_1 imag,
    //        QSV_2 real, QSV_2 imag, QSV_3 real, QSV_3 imag
    // Remember: imaginary (_1) values are NOT always 0000 (SX/SX-dagger circuits)
    //==========================================================================

    check("QSV_0_0", o0_0, 16'h16A0);  check("QSV_0_1", o0_1, 16'h16A0);
    check("QSV_1_0", o1_0, 16'h16A0);  check("QSV_1_1", o1_1, 16'hE95F);
    check("QSV_2_0", o2_0, 16'h16A0);  check("QSV_2_1", o2_1, 16'hE95F);
    check("QSV_3_0", o3_0, 16'h16A0);  check("QSV_3_1", o3_1, 16'h16A0);


    if (errors==0) $display("RESULT: PASS  (Circuit_08 matches golden state)");
    else           $display("RESULT: FAIL  (%0d mismatches)", errors);
    $finish;
  end

  // safety timeout so a never-asserting valid doesn't hang forever
  initial begin #2000; $display("TIMEOUT: io_out_valid never asserted"); $finish; end
endmodule
