module QFT (
    input wire clock,
    input wire reset,
    input wire [7:0] io_in_QSV_0_0, io_in_QSV_0_1, io_in_QSV_1_0, io_in_QSV_1_1,
    input wire [7:0] io_in_QSV_2_0, io_in_QSV_2_1, io_in_QSV_3_0, io_in_QSV_3_1,
    input wire [7:0] io_in_QSV_4_0, io_in_QSV_4_1, io_in_QSV_5_0, io_in_QSV_5_1,
    input wire [7:0] io_in_QSV_6_0, io_in_QSV_6_1, io_in_QSV_7_0, io_in_QSV_7_1,
    input wire io_in_valid,
    output wire [7:0] io_out_QSV_0_0, io_out_QSV_0_1, io_out_QSV_1_0, io_out_QSV_1_1,
    output wire [7:0] io_out_QSV_2_0, io_out_QSV_2_1, io_out_QSV_3_0, io_out_QSV_3_1,
    output wire [7:0] io_out_QSV_4_0, io_out_QSV_4_1, io_out_QSV_5_0, io_out_QSV_5_1,
    output wire [7:0] io_out_QSV_6_0, io_out_QSV_6_1, io_out_QSV_7_0, io_out_QSV_7_1,
    output wire io_out_valid
);

wire [7:0] w_q0, w_q1, w_q2, w_q3, w_q4, w_q5, w_q6, w_q7, w_q8, w_q9, w_q10, w_q11;
wire [7:0] w_i0, w_i1, w_i2, w_i3, w_i4, w_i5, w_i6, w_i7, w_i8, w_i9, w_i10, w_i11;
wire [7:0] w_q0_real [0:7], w_q0_imag [0:7];
wire [7:0] w_q1_real [0:7], w_q1_imag [0:7];
wire [7:0] w_q2_real [0:7], w_q2_imag [0:7];
wire [7:0] w_q3_real [0:7], w_q3_imag [0:7];
wire [7:0] w_q4_real [0:7], w_q4_imag [0:7];
wire [7:0] w_q5_real [0:7], w_q5_imag [0:7];
wire [7:0] w_q6_real [0:7], w_q6_imag [0:7];
wire [7:0] w_q7_real [0:7], w_q7_imag [0:7];
wire [7:0] w_q8_real [0:7], w_q8_imag [0:7];
wire [7:0] w_q9_real [0:7], w_q9_imag [0:7];
wire [7:0] w_q10_real [0:7], w_q10_imag [0:7];
wire [7:0] w_q11_real [0:7], w_q11_imag [0:7];

`define GATE_PORTS(q_real, q_imag, valid) \
    .io_in_QSV_0_0(q_real[0]), .io_in_QSV_0_1(q_imag[0]), .io_in_QSV_1_0(q_real[1]), .io_in_QSV_1_1(q_imag[1]), \
    .io_in_QSV_2_0(q_real[2]), .io_in_QSV_2_1(q_imag[2]), .io_in_QSV_3_0(q_real[3]), .io_in_QSV_3_1(q_imag[3]), \
    .io_in_QSV_4_0(q_real[4]), .io_in_QSV_4_1(q_imag[4]), .io_in_QSV_5_0(q_real[5]), .io_in_QSV_5_1(q_imag[5]), \
    .io_in_QSV_6_0(q_real[6]), .io_in_QSV_6_1(q_imag[6]), .io_in_QSV_7_0(q_real[7]), .io_in_QSV_7_1(q_imag[7]), \
    .io_in_valid(valid)

`define GATE_OUTPUTS(q_real, q_imag, valid) \
    .io_out_QSV_0_0(q_real[0]), .io_out_QSV_0_1(q_imag[0]), .io_out_QSV_1_0(q_real[1]), .io_out_QSV_1_1(q_imag[1]), \
    .io_out_QSV_2_0(q_real[2]), .io_out_QSV_2_1(q_imag[2]), .io_out_QSV_3_0(q_real[3]), .io_out_QSV_3_1(q_imag[3]), \
    .io_out_QSV_4_0(q_real[4]), .io_out_QSV_4_1(q_imag[4]), .io_out_QSV_5_0(q_real[5]), .io_out_QSV_5_1(q_imag[5]), \
    .io_out_QSV_6_0(q_real[6]), .io_out_QSV_6_1(q_imag[6]), .io_out_QSV_7_0(q_real[7]), .io_out_QSV_7_1(q_imag[7]), \
    .io_out_valid(valid)

HGate3QubitVector8bit m (.clock(clock), .reset(reset), `GATE_PORTS({io_in_QSV_0_0,io_in_QSV_1_0,io_in_QSV_2_0,io_in_QSV_3_0,io_in_QSV_4_0,io_in_QSV_5_0,io_in_QSV_6_0,io_in_QSV_7_0}, {io_in_QSV_0_1,io_in_QSV_1_1,io_in_QSV_2_1,io_in_QSV_3_1,io_in_QSV_4_1,io_in_QSV_5_1,io_in_QSV_6_1,io_in_QSV_7_1}, io_in_valid), `GATE_OUTPUTS(w_q0_real, w_q0_imag, w_q0));
CSGate3QubitVector8bit m_1 (.clock(clock), .reset(reset), `GATE_PORTS(w_q0_real, w_q0_imag, w_q0), `GATE_OUTPUTS(w_q1_real, w_q1_imag, w_q1));
CompatiblePerm m_2 (.clock(clock), .reset(reset), `GATE_PORTS(w_q1_real, w_q1_imag, w_q1), `GATE_OUTPUTS(w_q2_real, w_q2_imag, w_q2));
CTGate3QubitVector8bit m_3 (.clock(clock), .reset(reset), `GATE_PORTS(w_q2_real, w_q2_imag, w_q2), `GATE_OUTPUTS(w_q3_real, w_q3_imag, w_q3));
CompatiblePerm_1 m_4 (.clock(clock), .reset(reset), `GATE_PORTS(w_q3_real, w_q3_imag, w_q3), `GATE_OUTPUTS(w_q4_real, w_q4_imag, w_q4));
HGate3QubitVector8bit m_5 (.clock(clock), .reset(reset), `GATE_PORTS(w_q4_real, w_q4_imag, w_q4), `GATE_OUTPUTS(w_q5_real, w_q5_imag, w_q5));
CSGate3QubitVector8bit m_6 (.clock(clock), .reset(reset), `GATE_PORTS(w_q5_real, w_q5_imag, w_q5), `GATE_OUTPUTS(w_q6_real, w_q6_imag, w_q6));
CompatiblePerm_2 m_7 (.clock(clock), .reset(reset), `GATE_PORTS(w_q6_real, w_q6_imag, w_q6), `GATE_OUTPUTS(w_q7_real, w_q7_imag, w_q7));
HGate3QubitVector8bit m_8 (.clock(clock), .reset(reset), `GATE_PORTS(w_q7_real, w_q7_imag, w_q7), `GATE_OUTPUTS(w_q8_real, w_q8_imag, w_q8));
CompatiblePerm m_9 (.clock(clock), .reset(reset), `GATE_PORTS(w_q8_real, w_q8_imag, w_q8), `GATE_OUTPUTS(w_q9_real, w_q9_imag, w_q9));
SWGate3QubitVector8bit m_10 (.clock(clock), .reset(reset), `GATE_PORTS(w_q9_real, w_q9_imag, w_q9), `GATE_OUTPUTS(w_q10_real, w_q10_imag, w_q10));
CompatiblePerm_2 m_11 (.clock(clock), .reset(reset), `GATE_PORTS(w_q10_real, w_q10_imag, w_q10), `GATE_OUTPUTS(w_q11_real, w_q11_imag, w_q11));
CompatiblePerm m_12 (.clock(clock), .reset(reset), `GATE_PORTS(w_q11_real, w_q11_imag, w_q11), .io_out_QSV_0_0(io_out_QSV_0_0), .io_out_QSV_0_1(io_out_QSV_0_1), .io_out_QSV_1_0(io_out_QSV_1_0), .io_out_QSV_1_1(io_out_QSV_1_1), .io_out_QSV_2_0(io_out_QSV_2_0), .io_out_QSV_2_1(io_out_QSV_2_1), .io_out_QSV_3_0(io_out_QSV_3_0), .io_out_QSV_3_1(io_out_QSV_3_1), .io_out_QSV_4_0(io_out_QSV_4_0), .io_out_QSV_4_1(io_out_QSV_4_1), .io_out_QSV_5_0(io_out_QSV_5_0), .io_out_QSV_5_1(io_out_QSV_5_1), .io_out_QSV_6_0(io_out_QSV_6_0), .io_out_QSV_6_1(io_out_QSV_6_1), .io_out_QSV_7_0(io_out_QSV_7_0), .io_out_QSV_7_1(io_out_QSV_7_1), .io_out_valid(io_out_valid));

endmodule
