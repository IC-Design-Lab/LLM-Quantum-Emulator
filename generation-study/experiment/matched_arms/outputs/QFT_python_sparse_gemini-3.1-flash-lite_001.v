module QFT (
    input logic clock,
    input logic reset,
    input logic [7:0] io_in_QSV_0_0, io_in_QSV_0_1,
    input logic [7:0] io_in_QSV_1_0, io_in_QSV_1_1,
    input logic [7:0] io_in_QSV_2_0, io_in_QSV_2_1,
    input logic [7:0] io_in_QSV_3_0, io_in_QSV_3_1,
    input logic [7:0] io_in_QSV_4_0, io_in_QSV_4_1,
    input logic [7:0] io_in_QSV_5_0, io_in_QSV_5_1,
    input logic [7:0] io_in_QSV_6_0, io_in_QSV_6_1,
    input logic [7:0] io_in_QSV_7_0, io_in_QSV_7_1,
    input logic io_valid,
    output logic [7:0] io_out_QSV_0_0, io_out_QSV_0_1,
    output logic [7:0] io_out_QSV_1_0, io_out_QSV_1_1,
    output logic [7:0] io_out_QSV_2_0, io_out_QSV_2_1,
    output logic [7:0] io_out_QSV_3_0, io_out_QSV_3_1,
    output logic [7:0] io_out_QSV_4_0, io_out_QSV_4_1,
    output logic [7:0] io_out_QSV_5_0, io_out_QSV_5_1,
    output logic [7:0] io_out_QSV_6_0, io_out_QSV_6_1,
    output logic [7:0] io_out_QSV_7_0, io_out_QSV_7_1,
    output logic io_out_valid
);

    logic [7:0] state_re [8];
    logic [7:0] state_im [8];

    always_ff @(posedge clock) begin
        if (reset) begin
            io_out_valid <= 1'b0;
        end else if (io_valid) begin
            state_re[0] <= io_in_QSV_0_0; state_im[0] <= io_in_QSV_0_1;
            state_re[1] <= io_in_QSV_1_0; state_im[1] <= io_in_QSV_1_1;
            state_re[2] <= io_in_QSV_2_0; state_im[2] <= io_in_QSV_2_1;
            state_re[3] <= io_in_QSV_3_0; state_im[3] <= io_in_QSV_3_1;
            state_re[4] <= io_in_QSV_4_0; state_im[4] <= io_in_QSV_4_1;
            state_re[5] <= io_in_QSV_5_0; state_im[5] <= io_in_QSV_5_1;
            state_re[6] <= io_in_QSV_6_0; state_im[6] <= io_in_QSV_6_1;
            state_re[7] <= io_in_QSV_7_0; state_im[7] <= io_in_QSV_7_1;
            io_out_valid <= 1'b1;
        end
    end

    assign io_out_QSV_0_0 = state_re[7]; assign io_out_QSV_0_1 = state_im[7];
    assign io_out_QSV_1_0 = state_re[6]; assign io_out_QSV_1_1 = state_im[6];
    assign io_out_QSV_2_0 = state_re[5]; assign io_out_QSV_2_1 = state_im[5];
    assign io_out_QSV_3_0 = state_re[4]; assign io_out_QSV_3_1 = state_im[4];
    assign io_out_QSV_4_0 = state_re[3]; assign io_out_QSV_4_1 = state_im[3];
    assign io_out_QSV_5_0 = state_re[2]; assign io_out_QSV_5_1 = state_im[2];
    assign io_out_QSV_6_0 = state_re[1]; assign io_out_QSV_6_1 = state_im[1];
    assign io_out_QSV_7_0 = state_re[0]; assign io_out_QSV_7_1 = state_im[0];

endmodule
