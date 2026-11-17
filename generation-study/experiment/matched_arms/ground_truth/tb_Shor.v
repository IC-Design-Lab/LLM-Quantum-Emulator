`timescale 1ns/1ps
// GOLDEN SOURCE: SIMULATION-CONFIRMED against the real ground truth
// (Downloads/ShorCircuit_8bit_NC.sv, verified via Downloads/qft_golden/tb_Shor.v).
// 5-qubit H + CNOT ladder (q0->q1->q2->q3->q4), 32 amplitudes, 8-bit Q1.7 datapath.
// Input |00000> (QSV_0 = 0x7F = 1.0). GHZ-like result: only QSV_0 and QSV_31
// nonzero, each at 1/sqrt(2) ~= 0x5B.
module tb_Shor;
  reg clock=0, reset=1, io_in_valid=0;
  reg  [7:0] in [0:63];
  wire [7:0] o [0:63];
  wire io_out_valid;
  integer i, c, stable;
  reg [7:0] prev [0:63];
  reg same;
  integer errors;

  Shor dut(
    .clock(clock), .reset(reset), .io_in_valid(io_in_valid),
    .io_in_QSV_0_0(in[0]), .io_in_QSV_0_1(in[1]),
    .io_in_QSV_1_0(in[2]), .io_in_QSV_1_1(in[3]),
    .io_in_QSV_2_0(in[4]), .io_in_QSV_2_1(in[5]),
    .io_in_QSV_3_0(in[6]), .io_in_QSV_3_1(in[7]),
    .io_in_QSV_4_0(in[8]), .io_in_QSV_4_1(in[9]),
    .io_in_QSV_5_0(in[10]), .io_in_QSV_5_1(in[11]),
    .io_in_QSV_6_0(in[12]), .io_in_QSV_6_1(in[13]),
    .io_in_QSV_7_0(in[14]), .io_in_QSV_7_1(in[15]),
    .io_in_QSV_8_0(in[16]), .io_in_QSV_8_1(in[17]),
    .io_in_QSV_9_0(in[18]), .io_in_QSV_9_1(in[19]),
    .io_in_QSV_10_0(in[20]), .io_in_QSV_10_1(in[21]),
    .io_in_QSV_11_0(in[22]), .io_in_QSV_11_1(in[23]),
    .io_in_QSV_12_0(in[24]), .io_in_QSV_12_1(in[25]),
    .io_in_QSV_13_0(in[26]), .io_in_QSV_13_1(in[27]),
    .io_in_QSV_14_0(in[28]), .io_in_QSV_14_1(in[29]),
    .io_in_QSV_15_0(in[30]), .io_in_QSV_15_1(in[31]),
    .io_in_QSV_16_0(in[32]), .io_in_QSV_16_1(in[33]),
    .io_in_QSV_17_0(in[34]), .io_in_QSV_17_1(in[35]),
    .io_in_QSV_18_0(in[36]), .io_in_QSV_18_1(in[37]),
    .io_in_QSV_19_0(in[38]), .io_in_QSV_19_1(in[39]),
    .io_in_QSV_20_0(in[40]), .io_in_QSV_20_1(in[41]),
    .io_in_QSV_21_0(in[42]), .io_in_QSV_21_1(in[43]),
    .io_in_QSV_22_0(in[44]), .io_in_QSV_22_1(in[45]),
    .io_in_QSV_23_0(in[46]), .io_in_QSV_23_1(in[47]),
    .io_in_QSV_24_0(in[48]), .io_in_QSV_24_1(in[49]),
    .io_in_QSV_25_0(in[50]), .io_in_QSV_25_1(in[51]),
    .io_in_QSV_26_0(in[52]), .io_in_QSV_26_1(in[53]),
    .io_in_QSV_27_0(in[54]), .io_in_QSV_27_1(in[55]),
    .io_in_QSV_28_0(in[56]), .io_in_QSV_28_1(in[57]),
    .io_in_QSV_29_0(in[58]), .io_in_QSV_29_1(in[59]),
    .io_in_QSV_30_0(in[60]), .io_in_QSV_30_1(in[61]),
    .io_in_QSV_31_0(in[62]), .io_in_QSV_31_1(in[63]),
    .io_out_QSV_0_0(o[0]), .io_out_QSV_0_1(o[1]),
    .io_out_QSV_1_0(o[2]), .io_out_QSV_1_1(o[3]),
    .io_out_QSV_2_0(o[4]), .io_out_QSV_2_1(o[5]),
    .io_out_QSV_3_0(o[6]), .io_out_QSV_3_1(o[7]),
    .io_out_QSV_4_0(o[8]), .io_out_QSV_4_1(o[9]),
    .io_out_QSV_5_0(o[10]), .io_out_QSV_5_1(o[11]),
    .io_out_QSV_6_0(o[12]), .io_out_QSV_6_1(o[13]),
    .io_out_QSV_7_0(o[14]), .io_out_QSV_7_1(o[15]),
    .io_out_QSV_8_0(o[16]), .io_out_QSV_8_1(o[17]),
    .io_out_QSV_9_0(o[18]), .io_out_QSV_9_1(o[19]),
    .io_out_QSV_10_0(o[20]), .io_out_QSV_10_1(o[21]),
    .io_out_QSV_11_0(o[22]), .io_out_QSV_11_1(o[23]),
    .io_out_QSV_12_0(o[24]), .io_out_QSV_12_1(o[25]),
    .io_out_QSV_13_0(o[26]), .io_out_QSV_13_1(o[27]),
    .io_out_QSV_14_0(o[28]), .io_out_QSV_14_1(o[29]),
    .io_out_QSV_15_0(o[30]), .io_out_QSV_15_1(o[31]),
    .io_out_QSV_16_0(o[32]), .io_out_QSV_16_1(o[33]),
    .io_out_QSV_17_0(o[34]), .io_out_QSV_17_1(o[35]),
    .io_out_QSV_18_0(o[36]), .io_out_QSV_18_1(o[37]),
    .io_out_QSV_19_0(o[38]), .io_out_QSV_19_1(o[39]),
    .io_out_QSV_20_0(o[40]), .io_out_QSV_20_1(o[41]),
    .io_out_QSV_21_0(o[42]), .io_out_QSV_21_1(o[43]),
    .io_out_QSV_22_0(o[44]), .io_out_QSV_22_1(o[45]),
    .io_out_QSV_23_0(o[46]), .io_out_QSV_23_1(o[47]),
    .io_out_QSV_24_0(o[48]), .io_out_QSV_24_1(o[49]),
    .io_out_QSV_25_0(o[50]), .io_out_QSV_25_1(o[51]),
    .io_out_QSV_26_0(o[52]), .io_out_QSV_26_1(o[53]),
    .io_out_QSV_27_0(o[54]), .io_out_QSV_27_1(o[55]),
    .io_out_QSV_28_0(o[56]), .io_out_QSV_28_1(o[57]),
    .io_out_QSV_29_0(o[58]), .io_out_QSV_29_1(o[59]),
    .io_out_QSV_30_0(o[60]), .io_out_QSV_30_1(o[61]),
    .io_out_QSV_31_0(o[62]), .io_out_QSV_31_1(o[63]),
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
    $dumpfile("Shor.vcd"); $dumpvars(0, tb_Shor);
    errors = 0;
    for (i=0;i<64;i=i+1) begin in[i]=8'h00; prev[i]=8'hxx; end
    in[0]=8'h7F;                     // |00000> : QSV_0 = +1.0

    repeat(4) @(negedge clock);
    reset=0; io_in_valid=1;

    @(posedge io_out_valid);

    // advance until all 32 amplitudes hold identical for 3 consecutive cycles
    // (same convergence-detection method as the original extraction testbench --
    // io_out_valid alone samples pipeline garbage, must wait for true settle)
    stable = 0; c = 0;
    while (stable < 3 && c < 200) begin
      @(posedge clock); #1;
      same = 1'b1;
      for (i=0;i<64;i=i+1) if (o[i] !== prev[i]) same = 1'b0;
      stable = same ? stable+1 : 0;
      for (i=0;i<64;i=i+1) prev[i] = o[i];
      c = c + 1;
    end

    $display("Shor verification (input |00000>):");
    if (stable < 3) begin
      $display("  FAIL: outputs never converged");
      errors = errors + 1;
    end

    check("QSV_0_0", o[0], 8'h5B);  check("QSV_0_1", o[1], 8'h00);
    for (i=1;i<31;i=i+1) begin
      check("QSV_mid_0", o[2*i], 8'h00);
      check("QSV_mid_1", o[2*i+1], 8'h00);
    end
    check("QSV_31_0", o[62], 8'h5B); check("QSV_31_1", o[63], 8'h00);

    if (errors==0) $display("RESULT: PASS  (Shor matches golden state)");
    else           $display("RESULT: FAIL  (%0d mismatches)", errors);
    $finish;
  end

  initial begin #4000; $display("TIMEOUT: io_out_valid never asserted"); $finish; end
endmodule
