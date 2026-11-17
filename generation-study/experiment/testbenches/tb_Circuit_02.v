//*********************************************************************************************//
//----------------   Circuit_02 Testbench (Self-checking)  ----------------------------------////
//----------------   Author: Krishna Patel  -------------------------------------------------////
//----------------   LLM-Verilog Verification Framework  ------------------------------------////
//----------------   Date: 6/12/2026  -------------------------------------------------------////
//----- Version 1: Circuit_02 Quantum Circuit Verification Testbench  -----------------------////
//----- Date: 6/17/2026  --------------------------------------------------------------------////
//-------------------------------------------------------------------------------------------////
//*********************************************************************************************//
//----- This testbench verifies LLM-generated Verilog for Circuit_02.                          //
//----- TODO: set input state, golden output amplitudes, and latency.                          //
//*********************************************************************************************//
`timescale 1ns/1ps


module tb_Circuit_02;
  reg clock=0, reset=1, io_in_valid=0;
  reg  [15:0] in0_0,in0_1,in1_0,in1_1,in2_0,in2_1,in3_0,in3_1;
  wire [15:0] o0_0,o0_1,o1_0,o1_1,o2_0,o2_1,o3_0,o3_1;
  wire io_out_valid;
  integer errors=0;
 
  // ---- DUT: only the module name changes ----
  Circuit_02 dut(
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
    $dumpfile("Circuit_02.vcd"); $dumpvars(0, tb_Circuit_02);
 
    // input state |00> : QSV_0 = 1.0, everything else 0
    in0_0=16'h4000; in0_1=0; in1_0=0; in1_1=0;
    in2_0=0;        in2_1=0; in3_0=0; in3_1=0;
 
    repeat(4) @(negedge clock);
    reset = 0;
    io_in_valid = 1;            // sustained valid so the pipeline fills
 
    @(posedge io_out_valid);    // wait for the circuit to signal "output ready"
    @(posedge clock); #1;       // settle one cycle into the valid window
 
    $display("Circuit_02 verification (input |00>):");
 
    //==========================================================================
    // QSV_0 = 1FFF, 0000 
    // QSV_1 = 1FFF, 0000
    // QSV_2 = 1FFF, 0000
    // QSV_3 = 1FFF, 0000 
    // Order: QSV_0 real, QSV_0 imag, QSV_1 real, QSV_1 imag,
    //        QSV_2 real, QSV_2 imag, QSV_3 real, QSV_3 imag
    // Remember: imaginary (_1) values are NOT always 0000 (SX/SX-dagger circuits)
    //==========================================================================
    check("QSV_0_0", o0_0, 16'h1FFF);   // <- QSV_0 real
    check("QSV_0_1", o0_1, 16'h0000);   // <- QSV_0 imag
    check("QSV_1_0", o1_0, 16'h1FFF);   // <- QSV_1 real
    check("QSV_1_1", o1_1, 16'h0000);   // <- QSV_1 imag
    check("QSV_2_0", o2_0, 16'h1FFF);   // <- QSV_2 real
    check("QSV_2_1", o2_1, 16'h0000);   // <- QSV_2 imag
    check("QSV_3_0", o3_0, 16'h1FFF);   // <- QSV_3 real
    check("QSV_3_1", o3_1, 16'h0000);   // <- QSV_3 imag
    //==========================================================================
 
    if (errors==0) $display("RESULT: PASS  (Circuit_02 matches golden state)");
    else           $display("RESULT: FAIL  (%0d mismatches)", errors);
    $finish;
  end
 
  // safety timeout so a never-asserting valid doesn't hang forever
  initial begin #2000; $display("TIMEOUT: io_out_valid never asserted"); $finish; end
endmodule