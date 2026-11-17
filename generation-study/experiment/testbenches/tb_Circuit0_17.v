//*********************************************************************************************//
//----------------   Circuit0_17 Testbench (Self-checking)  ---------------------------------////
//----------------   Author: Krishna Patel  -------------------------------------------------////
//----------------   LLM-Verilog Verification Framework  ------------------------------------////
//----------------   Date: 6/12/2026  -------------------------------------------------------////
//----- Version 1: Circuit0_17 Quantum Circuit Verification Testbench  ----------------------////
//----- Date: 6/16/2026  --------------------------------------------------------------------////
//-------------------------------------------------------------------------------------------////
//*********************************************************************************************//
//----- This testbench verifies LLM-generated Verilog for Circuit0_17                          //
//----- (H -> [perm] X [perm] -> SWAP). Input |00> is applied and outputs                      //
//----- are compared against the golden quantum state vector.                                  //
//*********************************************************************************************//
`timescale 1ns/1ps
//==============================================================================
// Self-checking testbench: Circuit0_17  (H -> [perm] X [perm] -> SWAP)
// Input  : |00>  -> QSV_0 = 0x4000 (1.0), rest 0
// Golden : QSV_1 = QSV_3 = 0x2D41 (+1/sqrt2), QSV_0 = QSV_2 = 0
// Latency: io_out_valid asserts 9 cycles after io_in_valid
//          (H=5, perm=1, X=1, perm=1, SWAP=1)
//==============================================================================
module tb_Circuit0_17;
  reg clock=0, reset=1, io_in_valid=0;
  reg  [15:0] in0_0,in0_1,in1_0,in1_1,in2_0,in2_1,in3_0,in3_1;
  wire [15:0] o0_0,o0_1,o1_0,o1_1,o2_0,o2_1,o3_0,o3_1;
  wire io_out_valid;
  integer errors=0;

  Circuit0_17 dut(
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
    $dumpfile("Circuit0_17.vcd"); $dumpvars(0, tb_Circuit0_17);
    in0_0=16'h4000; in0_1=0; in1_0=0; in1_1=0;
    in2_0=0; in2_1=0; in3_0=0; in3_1=0;

    repeat(4) @(negedge clock);
    reset = 0;
    io_in_valid = 1;

    @(posedge io_out_valid);
    @(posedge clock); #1;

    $display("Circuit0_17 verification (input |00>):");
    check("QSV_0_0", o0_0, 16'h0000);
    check("QSV_0_1", o0_1, 16'h0000);
    check("QSV_1_0", o1_0, 16'h2D41);
    check("QSV_1_1", o1_1, 16'h0000);
    check("QSV_2_0", o2_0, 16'h0000);
    check("QSV_2_1", o2_1, 16'h0000);
    check("QSV_3_0", o3_0, 16'h2D41);
    check("QSV_3_1", o3_1, 16'h0000);

    if (errors==0) $display("RESULT: PASS  (Circuit0_17 matches golden state)");
    else           $display("RESULT: FAIL  (%0d mismatches)", errors);
    $finish;
  end

  initial begin #1500; $display("TIMEOUT: io_out_valid never asserted"); $finish; end
endmodule
