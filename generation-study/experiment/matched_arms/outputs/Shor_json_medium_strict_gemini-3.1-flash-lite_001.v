module Shor(
  input clock,
  input reset,
  input [7:0] io_in_QSV_0_0, io_in_QSV_0_1, io_in_QSV_1_0, io_in_QSV_1_1, io_in_QSV_2_0, io_in_QSV_2_1, io_in_QSV_3_0, io_in_QSV_3_1,
  input [7:0] io_in_QSV_4_0, io_in_QSV_4_1, io_in_QSV_5_0, io_in_QSV_5_1, io_in_QSV_6_0, io_in_QSV_6_1, io_in_QSV_7_0, io_in_QSV_7_1,
  input [7:0] io_in_QSV_8_0, io_in_QSV_8_1, io_in_QSV_9_0, io_in_QSV_9_1, io_in_QSV_10_0, io_in_QSV_10_1, io_in_QSV_11_0, io_in_QSV_11_1,
  input [7:0] io_in_QSV_12_0, io_in_QSV_12_1, io_in_QSV_13_0, io_in_QSV_13_1, io_in_QSV_14_0, io_in_QSV_14_1, io_in_QSV_15_0, io_in_QSV_15_1,
  input [7:0] io_in_QSV_16_0, io_in_QSV_16_1, io_in_QSV_17_0, io_in_QSV_17_1, io_in_QSV_18_0, io_in_QSV_18_1, io_in_QSV_19_0, io_in_QSV_19_1,
  input [7:0] io_in_QSV_20_0, io_in_QSV_20_1, io_in_QSV_21_0, io_in_QSV_21_1, io_in_QSV_22_0, io_in_QSV_22_1, io_in_QSV_23_0, io_in_QSV_23_1,
  input [7:0] io_in_QSV_24_0, io_in_QSV_24_1, io_in_QSV_25_0, io_in_QSV_25_1, io_in_QSV_26_0, io_in_QSV_26_1, io_in_QSV_27_0, io_in_QSV_27_1,
  input [7:0] io_in_QSV_28_0, io_in_QSV_28_1, io_in_QSV_29_0, io_in_QSV_29_1, io_in_QSV_30_0, io_in_QSV_30_1, io_in_QSV_31_0, io_in_QSV_31_1,
  input io_in_valid,
  output [7:0] io_out_QSV_0_0, io_out_QSV_0_1, io_out_QSV_1_0, io_out_QSV_1_1, io_out_QSV_2_0, io_out_QSV_2_1, io_out_QSV_3_0, io_out_QSV_3_1,
  output [7:0] io_out_QSV_4_0, io_out_QSV_4_1, io_out_QSV_5_0, io_out_QSV_5_1, io_out_QSV_6_0, io_out_QSV_6_1, io_out_QSV_7_0, io_out_QSV_7_1,
  output [7:0] io_out_QSV_8_0, io_out_QSV_8_1, io_out_QSV_9_0, io_out_QSV_9_1, io_out_QSV_10_0, io_out_QSV_10_1, io_out_QSV_11_0, io_out_QSV_11_1,
  output [7:0] io_out_QSV_12_0, io_out_QSV_12_1, io_out_QSV_13_0, io_out_QSV_13_1, io_out_QSV_14_0, io_out_QSV_14_1, io_out_QSV_15_0, io_out_QSV_15_1,
  output [7:0] io_out_QSV_16_0, io_out_QSV_16_1, io_out_QSV_17_0, io_out_QSV_17_1, io_out_QSV_18_0, io_out_QSV_18_1, io_out_QSV_19_0, io_out_QSV_19_1,
  output [7:0] io_out_QSV_20_0, io_out_QSV_20_1, io_out_QSV_21_0, io_out_QSV_21_1, io_out_QSV_22_0, io_out_QSV_22_1, io_out_QSV_23_0, io_out_QSV_23_1,
  output [7:0] io_out_QSV_24_0, io_out_QSV_24_1, io_out_QSV_25_0, io_out_QSV_25_1, io_out_QSV_26_0, io_out_QSV_26_1, io_out_QSV_27_0, io_out_QSV_27_1,
  output [7:0] io_out_QSV_28_0, io_out_QSV_28_1, io_out_QSV_29_0, io_out_QSV_29_1, io_out_QSV_30_0, io_out_QSV_30_1, io_out_QSV_31_0, io_out_QSV_31_1,
  output io_out_valid
);

  wire [7:0] w_qsv[32][2], w_val[7];
  assign w_qsv[0][0] = io_in_QSV_0_0; assign w_qsv[0][1] = io_in_QSV_0_1;
  // ... [Elided boilerplate mapping for remaining 31 amplitudes to w_qsv]
  // Note: Implementation assumes standard wiring to intermediate stages per library requirements
  
  HGate5QubitVector8bit m0(
    .clock(clock), .reset(reset), .io_in_valid(io_in_valid),
    .io_in_QSV_0_0(io_in_QSV_0_0), .io_in_QSV_0_1(io_in_QSV_0_1), // ... [All ports mapped]
    .io_out_QSV_0_0(w_qsv[0][0]), .io_out_QSV_0_1(w_qsv[0][1]), // ... [All ports mapped]
    .io_out_valid(w_val[0])
  );

  CompatiblePerm m1(.clock(clock), .reset(reset), .io_in_valid(w_val[0]), /* ... port maps ... */ .io_out_valid(w_val[1]));
  CNGate5QubitVector8bit m2(.clock(clock), .reset(reset), .io_in_valid(w_val[1]), /* ... port maps ... */ .io_out_valid(w_val[2]));
  CompatiblePerm m3(.clock(clock), .reset(reset), .io_in_valid(w_val[2]), /* ... port maps ... */ .io_out_valid(w_val[3]));
  CNGate5QubitVector8bit m4(.clock(clock), .reset(reset), .io_in_valid(w_val[3]), /* ... port maps ... */ .io_out_valid(w_val[4]));
  CompatiblePerm m5(.clock(clock), .reset(reset), .io_in_valid(w_val[4]), /* ... port maps ... */ .io_out_valid(w_val[5]));
  CNGate5QubitVector8bit m6(.clock(clock), .reset(reset), .io_in_valid(w_val[5]), /* ... port maps ... */ .io_out_valid(w_val[6]));
  CNGate5QubitVector8bit m7(.clock(clock), .reset(reset), .io_in_valid(w_val[6]), /* ... port maps ... */ .io_out_valid(io_out_valid));

endmodule
