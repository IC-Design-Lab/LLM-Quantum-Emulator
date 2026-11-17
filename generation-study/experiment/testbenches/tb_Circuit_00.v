//*********************************************************************************************//
//----------------   Circuit_00 Testbench (Self-checking)  ---------------------------------////
//----------------   Author: Krishna Patel  -------------------------------------------------////
//----------------   LLM-Verilog Verification Framework  ------------------------------------////
//----------------   Date: 6/12/2026  -------------------------------------------------------////
//----- Version 1: Circuit_00 Quantum Circuit Verification Testbench  ----------------------////
//----- Date: 6/13/2026  --------------------------------------------------------------------////
//-------------------------------------------------------------------------------------------////
//*********************************************************************************************//
//----- This testbench verifies LLM-generated Verilog for Circuit_00                          //
//----- (H gate on q0 of each half, then SWAP). Input |00> is applied and                      //
//----- outputs are compared against the golden quantum state vector.                          //
//*********************************************************************************************//
`timescale 1ns/1ps
//==============================================================================
// Self-checking testbench: Circuit_00  (H on q0 of each half, then SWAP)
// Input  : |00>  -> QSV_0 = 0x4000 (1.0), rest 0
// Golden : QSV_0 = QSV_2 = 0x2D41 (+1/sqrt2), QSV_1 = QSV_3 = 0
// Latency: io_out_valid asserts 6 cycles after io_in_valid (H=5 + SWAP=1)
//==============================================================================
module tb_Circuit_00;
  reg clock=0, reset=1, io_in_valid=0;
  reg  [15:0] in0_0,in0_1,in1_0,in1_1,in2_0,in2_1,in3_0,in3_1;
  wire [15:0] o0_0,o0_1,o1_0,o1_1,o2_0,o2_1,o3_0,o3_1;
  wire io_out_valid;
  integer errors=0;

  Circuit_00 dut(
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
    $dumpfile("Circuit_00.vcd"); $dumpvars(0, tb_Circuit_00);
    // input state |00>
    in0_0=16'h4000; in0_1=0; in1_0=0; in1_1=0;
    in2_0=0; in2_1=0; in3_0=0; in3_1=0;

    repeat(4) @(negedge clock);
    reset = 0;
    io_in_valid = 1;            // sustained valid so pipeline fills

    // wait for io_out_valid to assert, then sample
    @(posedge io_out_valid);
    @(posedge clock); #1;       // settle one cycle into valid window

    $display("Circuit_00 verification (input |00>):");
    check("QSV_0_0", o0_0, 16'h2D41);
    check("QSV_0_1", o0_1, 16'h0000);
    check("QSV_1_0", o1_0, 16'h0000);
    check("QSV_1_1", o1_1, 16'h0000);
    check("QSV_2_0", o2_0, 16'h2D41);
    check("QSV_2_1", o2_1, 16'h0000);
    check("QSV_3_0", o3_0, 16'h0000);
    check("QSV_3_1", o3_1, 16'h0000);

    if (errors==0) $display("RESULT: PASS  (Circuit_00 matches golden state)");
    else           $display("RESULT: FAIL  (%0d mismatches)", errors);
    $finish;
  end

  // safety timeout
  initial begin #1000; $display("TIMEOUT: io_out_valid never asserted"); $finish; end
endmodule
