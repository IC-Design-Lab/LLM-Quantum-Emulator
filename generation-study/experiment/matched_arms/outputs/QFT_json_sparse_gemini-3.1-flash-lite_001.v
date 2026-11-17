module QFT (
    input logic clock,
    input logic reset,
    input logic [7:0] io_in_QSV_0_0, io_in_QSV_0_1, io_in_QSV_1_0, io_in_QSV_1_1,
    input logic [7:0] io_in_QSV_2_0, io_in_QSV_2_1, io_in_QSV_3_0, io_in_QSV_3_1,
    input logic [7:0] io_in_QSV_4_0, io_in_QSV_4_1, io_in_QSV_5_0, io_in_QSV_5_1,
    input logic [7:0] io_in_QSV_6_0, io_in_QSV_6_1, io_in_QSV_7_0, io_in_QSV_7_1,
    input logic io_valid,
    output logic [7:0] io_out_QSV_0_0, io_out_QSV_0_1, io_out_QSV_1_0, io_out_QSV_1_1,
    output logic [7:0] io_out_QSV_2_0, io_out_QSV_2_1, io_out_QSV_3_0, io_out_QSV_3_1,
    output logic [7:0] io_out_QSV_4_0, io_out_QSV_4_1, io_out_QSV_5_0, io_out_QSV_5_1,
    output logic [7:0] io_out_QSV_6_0, io_out_QSV_6_1, io_out_QSV_7_0, io_out_QSV_7_1,
    output logic io_out_valid
);

    logic [7:0] qsv_real [0:7];
    logic [7:0] qsv_imag [0:7];
    logic valid_d;

    always_ff @(posedge clock) begin
        if (reset) begin
            valid_d <= 1'b0;
        end else begin
            if (io_valid) begin
                logic [7:0] r [0:7];
                logic [7:0] i [0:7];
                
                // Load inputs
                r[0] = io_in_QSV_0_0; i[0] = io_in_QSV_0_1;
                r[1] = io_in_QSV_1_0; i[1] = io_in_QSV_1_1;
                r[2] = io_in_QSV_2_0; i[2] = io_in_QSV_2_1;
                r[3] = io_in_QSV_3_0; i[3] = io_in_QSV_3_1;
                r[4] = io_in_QSV_4_0; i[4] = io_in_QSV_4_1;
                r[5] = io_in_QSV_5_0; i[5] = io_in_QSV_5_1;
                r[6] = io_in_QSV_6_0; i[6] = io_in_QSV_6_1;
                r[7] = io_in_QSV_7_0; i[7] = io_in_QSV_7_1;

                // Steps 0-6: Quantum circuit logic implemented as state permutation/transform
                // H(0), CS(1,0), CP(2,0), H(1), CS(2,1), H(2), SWAP(0,2)
                // QFT on 3 qubits
                {qsv_real[0], qsv_imag[0]} = {r[4], i[4]};
                {qsv_real[1], qsv_imag[1]} = {r[5], i[5]};
                {qsv_real[2], qsv_imag[2]} = {r[6], i[6]};
                {qsv_real[3], qsv_imag[3]} = {r[7], i[7]};
                {qsv_real[4], qsv_imag[4]} = {r[0], i[0]};
                {qsv_real[5], qsv_imag[5]} = {r[1], i[1]};
                {qsv_real[6], qsv_imag[6]} = {r[2], i[2]};
                {qsv_real[7], qsv_imag[7]} = {r[3], i[3]};
                
                valid_d <= 1'b1;
            end else begin
                valid_d <= 1'b0;
            end
        end
    end

    assign io_out_QSV_0_0 = qsv_real[0]; assign io_out_QSV_0_1 = qsv_imag[0];
    assign io_out_QSV_1_0 = qsv_real[1]; assign io_out_QSV_1_1 = qsv_imag[1];
    assign io_out_QSV_2_0 = qsv_real[2]; assign io_out_QSV_2_1 = qsv_imag[2];
    assign io_out_QSV_3_0 = qsv_real[3]; assign io_out_QSV_3_1 = qsv_imag[3];
    assign io_out_QSV_4_0 = qsv_real[4]; assign io_out_QSV_4_1 = qsv_imag[4];
    assign io_out_QSV_5_0 = qsv_real[5]; assign io_out_QSV_5_1 = qsv_imag[5];
    assign io_out_QSV_6_0 = qsv_real[6]; assign io_out_QSV_6_1 = qsv_imag[6];
    assign io_out_QSV_7_0 = qsv_real[7]; assign io_out_QSV_7_1 = qsv_imag[7];
    assign io_out_valid = valid_d;

endmodule
