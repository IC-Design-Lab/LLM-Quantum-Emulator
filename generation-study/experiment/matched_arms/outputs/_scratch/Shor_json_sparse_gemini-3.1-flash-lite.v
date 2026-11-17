module Shor (
    input logic clock,
    input logic reset,
    input logic [7:0] io_in_QSV_0_0, io_in_QSV_0_1, io_in_QSV_1_0, io_in_QSV_1_1, io_in_QSV_2_0, io_in_QSV_2_1, io_in_QSV_3_0, io_in_QSV_3_1, io_in_QSV_4_0, io_in_QSV_4_1, io_in_QSV_5_0, io_in_QSV_5_1, io_in_QSV_6_0, io_in_QSV_6_1, io_in_QSV_7_0, io_in_QSV_7_1, io_in_QSV_8_0, io_in_QSV_8_1, io_in_QSV_9_0, io_in_QSV_9_1, io_in_QSV_10_0, io_in_QSV_10_1, io_in_QSV_11_0, io_in_QSV_11_1, io_in_QSV_12_0, io_in_QSV_12_1, io_in_QSV_13_0, io_in_QSV_13_1, io_in_QSV_14_0, io_in_QSV_14_1, io_in_QSV_15_0, io_in_QSV_15_1, io_in_QSV_16_0, io_in_QSV_16_1, io_in_QSV_17_0, io_in_QSV_17_1, io_in_QSV_18_0, io_in_QSV_18_1, io_in_QSV_19_0, io_in_QSV_19_1, io_in_QSV_20_0, io_in_QSV_20_1, io_in_QSV_21_0, io_in_QSV_21_1, io_in_QSV_22_0, io_in_QSV_22_1, io_in_QSV_23_0, io_in_QSV_23_1, io_in_QSV_24_0, io_in_QSV_24_1, io_in_QSV_25_0, io_in_QSV_25_1, io_in_QSV_26_0, io_in_QSV_26_1, io_in_QSV_27_0, io_in_QSV_27_1, io_in_QSV_28_0, io_in_QSV_28_1, io_in_QSV_29_0, io_in_QSV_29_1, io_in_QSV_30_0, io_in_QSV_30_1, io_in_QSV_31_0, io_in_QSV_31_1,
    input logic io_valid,
    output logic [7:0] io_out_QSV_0_0, io_out_QSV_0_1, io_out_QSV_1_0, io_out_QSV_1_1, io_out_QSV_2_0, io_out_QSV_2_1, io_out_QSV_3_0, io_out_QSV_3_1, io_out_QSV_4_0, io_out_QSV_4_1, io_out_QSV_5_0, io_out_QSV_5_1, io_out_QSV_6_0, io_out_QSV_6_1, io_out_QSV_7_0, io_out_QSV_7_1, io_out_QSV_8_0, io_out_QSV_8_1, io_out_QSV_9_0, io_out_QSV_9_1, io_out_QSV_10_0, io_out_QSV_10_1, io_out_QSV_11_0, io_out_QSV_11_1, io_out_QSV_12_0, io_out_QSV_12_1, io_out_QSV_13_0, io_out_QSV_13_1, io_out_QSV_14_0, io_out_QSV_14_1, io_out_QSV_15_0, io_out_QSV_15_1, io_out_QSV_16_0, io_out_QSV_16_1, io_out_QSV_17_0, io_out_QSV_17_1, io_out_QSV_18_0, io_out_QSV_18_1, io_out_QSV_19_0, io_out_QSV_19_1, io_out_QSV_20_0, io_out_QSV_20_1, io_out_QSV_21_0, io_out_QSV_21_1, io_out_QSV_22_0, io_out_QSV_22_1, io_out_QSV_23_0, io_out_QSV_23_1, io_out_QSV_24_0, io_out_QSV_24_1, io_out_QSV_25_0, io_out_QSV_25_1, io_out_QSV_26_0, io_out_QSV_26_1, io_out_QSV_27_0, io_out_QSV_27_1, io_out_QSV_28_0, io_out_QSV_28_1, io_out_QSV_29_0, io_out_QSV_29_1, io_out_QSV_30_0, io_out_QSV_30_1, io_out_QSV_31_0, io_out_QSV_31_1,
    output logic io_out_valid
);

    logic [7:0] qsv_real [0:31];
    logic [7:0] qsv_imag [0:31];
    logic [7:0] next_real [0:31];
    logic [7:0] next_imag [0:31];

    always_ff @(posedge clock) begin
        if (reset) begin
            io_out_valid <= 1'b0;
        end else begin
            io_out_valid <= io_valid;
            if (io_valid) begin
                for (int i = 0; i < 32; i++) begin
                    qsv_real[i] <= {io_in_QSV_0_0, io_in_QSV_1_0, io_in_QSV_2_0, io_in_QSV_3_0, io_in_QSV_4_0, io_in_QSV_5_0, io_in_QSV_6_0, io_in_QSV_7_0, io_in_QSV_8_0, io_in_QSV_9_0, io_in_QSV_10_0, io_in_QSV_11_0, io_in_QSV_12_0, io_in_QSV_13_0, io_in_QSV_14_0, io_in_QSV_15_0, io_in_QSV_16_0, io_in_QSV_17_0, io_in_QSV_18_0, io_in_QSV_19_0, io_in_QSV_20_0, io_in_QSV_21_0, io_in_QSV_22_0, io_in_QSV_23_0, io_in_QSV_24_0, io_in_QSV_25_0, io_in_QSV_26_0, io_in_QSV_27_0, io_in_QSV_28_0, io_in_QSV_29_0, io_in_QSV_30_0, io_in_QSV_31_0}[i];
                    qsv_imag[i] <= {io_in_QSV_0_1, io_in_QSV_1_1, io_in_QSV_2_1, io_in_QSV_3_1, io_in_QSV_4_1, io_in_QSV_5_1, io_in_QSV_6_1, io_in_QSV_7_1, io_in_QSV_8_1, io_in_QSV_9_1, io_in_QSV_10_1, io_in_QSV_11_1, io_in_QSV_12_1, io_in_QSV_13_1, io_in_QSV_14_1, io_in_QSV_15_1, io_in_QSV_16_1, io_in_QSV_17_1, io_in_QSV_18_1, io_in_QSV_19_1, io_in_QSV_20_1, io_in_QSV_21_1, io_in_QSV_22_1, io_in_QSV_23_1, io_in_QSV_24_1, io_in_QSV_25_1, io_in_QSV_26_1, io_in_QSV_27_1, io_in_QSV_28_1, io_in_QSV_29_1, io_in_QSV_30_1, io_in_QSV_31_1}[i];
                end
            end
        end
    end

    assign {io_out_QSV_0_0, io_out_QSV_1_0, io_out_QSV_2_0, io_out_QSV_3_0, io_out_QSV_4_0, io_out_QSV_5_0, io_out_QSV_6_0, io_out_QSV_7_0, io_out_QSV_8_0, io_out_QSV_9_0, io_out_QSV_10_0, io_out_QSV_11_0, io_out_QSV_12_0, io_out_QSV_13_0, io_out_QSV_14_0, io_out_QSV_15_0, io_out_QSV_16_0, io_out_QSV_17_0, io_out_QSV_18_0, io_out_QSV_19_0, io_out_QSV_20_0, io_out_QSV_21_0, io_out_QSV_22_0, io_out_QSV_23_0, io_out_QSV_24_0, io_out_QSV_25_0, io_out_QSV_26_0, io_out_QSV_27_0, io_out_QSV_28_0, io_out_QSV_29_0, io_out_QSV_30_0, io_out_QSV_31_0} = qsv_real;
    assign {io_out_QSV_0_1, io_out_QSV_1_1, io_out_QSV_2_1, io_out_QSV_3_1, io_out_QSV_4_1, io_out_QSV_5_1, io_out_QSV_6_1, io_out_QSV_7_1, io_out_QSV_8_1, io_out_QSV_9_1, io_out_QSV_10_1, io_out_QSV_11_1, io_out_QSV_12_1, io_out_QSV_13_1, io_out_QSV_14_1, io_out_QSV_15_1, io_out_QSV_16_1, io_out_QSV_17_1, io_out_QSV_18_1, io_out_QSV_19_1, io_out_QSV_20_1, io_out_QSV_21_1, io_out_QSV_22_1, io_out_QSV_23_1, io_out_QSV_24_1, io_out_QSV_25_1, io_out_QSV_26_1, io_out_QSV_27_1, io_out_QSV_28_1, io_out_QSV_29_1, io_out_QSV_30_1, io_out_QSV_31_1} = qsv_imag;

endmodule
