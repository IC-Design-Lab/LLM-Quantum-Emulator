`timescale 1ns/1ps
// GOLDEN SOURCE: SIMULATION-CONFIRMED against the real ground truth
// (Downloads/qft_golden/QFTcircuit_8bit_NC.sv, verified via qft_golden/tb_QFT_fixed.v).
// 3-qubit QFT, 8 amplitudes, 8-bit Q1.7 datapath. Input |000> (QSV_0 = 0x7F = 1.0).
// Two things the original extraction testbench got right that this preserves:
//   1. unity = 0x7F (0x80 is -1.0 in Q1.7, not +1.0)
//   2. sample well after io_out_valid asserts -- it asserts a couple cycles
//      before the final registers actually settle.
module tb_QFT;
  reg clock=0, reset=1, io_in_valid=0;
  reg  [7:0] in [0:15];
  wire [7:0] o0_0,o0_1,o1_0,o1_1,o2_0,o2_1,o3_0,o3_1,
             o4_0,o4_1,o5_0,o5_1,o6_0,o6_1,o7_0,o7_1;
  wire io_out_valid;
  integer i;
  integer errors = 0;

  QFT dut(
    .clock(clock), .reset(reset), .io_in_valid(io_in_valid),
    .io_in_QSV_0_0(in[0]), .io_in_QSV_0_1(in[1]),
    .io_in_QSV_1_0(in[2]), .io_in_QSV_1_1(in[3]),
    .io_in_QSV_2_0(in[4]), .io_in_QSV_2_1(in[5]),
    .io_in_QSV_3_0(in[6]), .io_in_QSV_3_1(in[7]),
    .io_in_QSV_4_0(in[8]), .io_in_QSV_4_1(in[9]),
    .io_in_QSV_5_0(in[10]), .io_in_QSV_5_1(in[11]),
    .io_in_QSV_6_0(in[12]), .io_in_QSV_6_1(in[13]),
    .io_in_QSV_7_0(in[14]), .io_in_QSV_7_1(in[15]),
    .io_out_QSV_0_0(o0_0), .io_out_QSV_0_1(o0_1),
    .io_out_QSV_1_0(o1_0), .io_out_QSV_1_1(o1_1),
    .io_out_QSV_2_0(o2_0), .io_out_QSV_2_1(o2_1),
    .io_out_QSV_3_0(o3_0), .io_out_QSV_3_1(o3_1),
    .io_out_QSV_4_0(o4_0), .io_out_QSV_4_1(o4_1),
    .io_out_QSV_5_0(o5_0), .io_out_QSV_5_1(o5_1),
    .io_out_QSV_6_0(o6_0), .io_out_QSV_6_1(o6_1),
    .io_out_QSV_7_0(o7_0), .io_out_QSV_7_1(o7_1),
    .io_out_valid(io_out_valid));

  always #5 clock = ~clock;

  task check(input [127:0] tag, input [7:0] got, input [7:0] exp);
    begin
      if (got !== exp) begin
        $display("  FAIL %0s: got %h expected %h", tag, got, exp);
        errors = errors + 1;
      end else
        $display("  ok   %0s = %h", tag, got);
    end
  endtask

  initial begin
    $dumpfile("QFT.vcd"); $dumpvars(0, tb_QFT);

    for (i=0;i<16;i=i+1) in[i]=8'h00;
    in[0]=8'h7F;

    repeat(4) @(negedge clock);
    reset=0; io_in_valid=1;

    @(posedge io_out_valid);
    repeat(10) @(posedge clock);   // settle well past the pipeline tail
    #1;

    $display("QFT verification (input |000>):");
    check("QSV_0_0", o0_0, 8'h2D); check("QSV_0_1", o0_1, 8'h00);
    check("QSV_1_0", o1_0, 8'h2D); check("QSV_1_1", o1_1, 8'h00);
    check("QSV_2_0", o2_0, 8'h2D); check("QSV_2_1", o2_1, 8'h00);
    check("QSV_3_0", o3_0, 8'h2D); check("QSV_3_1", o3_1, 8'h00);
    check("QSV_4_0", o4_0, 8'h2D); check("QSV_4_1", o4_1, 8'h00);
    check("QSV_5_0", o5_0, 8'h2D); check("QSV_5_1", o5_1, 8'h00);
    check("QSV_6_0", o6_0, 8'h2D); check("QSV_6_1", o6_1, 8'h00);
    check("QSV_7_0", o7_0, 8'h2D); check("QSV_7_1", o7_1, 8'h00);

    if (errors==0) $display("RESULT: PASS  (QFT matches golden state)");
    else           $display("RESULT: FAIL  (%0d mismatches)", errors);
    $finish;
  end

  initial begin #3000; $display("TIMEOUT: io_out_valid never asserted"); $finish; end
endmodule
