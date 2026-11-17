module Shor (
    input  logic clock,
    input  logic reset,
    input  logic [7:0] io_in_QSV_0_0,
    input  logic [7:0] io_in_QSV_0_1,
    input  logic [7:0] io_in_QSV_1_0,
    input  logic [7:0] io_in_QSV_1_1,
    input  logic [7:0] io_in_QSV_2_0,
    input  logic [7:0] io_in_QSV_2_1,
    input  logic [7:0] io_in_QSV_3_0,
    input  logic [7:0] io_in_QSV_3_1,
    input  logic [7:0] io_in_QSV_4_0,
    input  logic [7:0] io_in_QSV_4_1,
    input  logic [7:0] io_in_QSV_5_0,
    input  logic [7:0] io_in_QSV_5_1,
    input  logic [7:0] io_in_QSV_6_0,
    input  logic [7:0] io_in_QSV_6_1,
    input  logic [7:0] io_in_QSV_7_0,
    input  logic [7:0] io_in_QSV_7_1,
    input  logic [7:0] io_in_QSV_8_0,
    input  logic [7:0] io_in_QSV_8_1,
    input  logic [7:0] io_in_QSV_9_0,
    input  logic [7:0] io_in_QSV_9_1,
    input  logic [7:0] io_in_QSV_10_0,
    input  logic [7:0] io_in_QSV_10_1,
    input  logic [7:0] io_in_QSV_11_0,
    input  logic [7:0] io_in_QSV_11_1,
    input  logic [7:0] io_in_QSV_12_0,
    input  logic [7:0] io_in_QSV_12_1,
    input  logic [7:0] io_in_QSV_13_0,
    input  logic [7:0] io_in_QSV_13_1,
    input  logic [7:0] io_in_QSV_14_0,
    input  logic [7:0] io_in_QSV_14_1,
    input  logic [7:0] io_in_QSV_15_0,
    input  logic [7:0] io_in_QSV_15_1,
    input  logic [7:0] io_in_QSV_16_0,
    input  logic [7:0] io_in_QSV_16_1,
    input  logic [7:0] io_in_QSV_17_0,
    input  logic [7:0] io_in_QSV_17_1,
    input  logic [7:0] io_in_QSV_18_0,
    input  logic [7:0] io_in_QSV_18_1,
    input  logic [7:0] io_in_QSV_19_0,
    input  logic [7:0] io_in_QSV_19_1,
    input  logic [7:0] io_in_QSV_20_0,
    input  logic [7:0] io_in_QSV_20_1,
    input  logic [7:0] io_in_QSV_21_0,
    input  logic [7:0] io_in_QSV_21_1,
    input  logic [7:0] io_in_QSV_22_0,
    input  logic [7:0] io_in_QSV_22_1,
    input  logic [7:0] io_in_QSV_23_0,
    input  logic [7:0] io_in_QSV_23_1,
    input  logic [7:0] io_in_QSV_24_0,
    input  logic [7:0] io_in_QSV_24_1,
    input  logic [7:0] io_in_QSV_25_0,
    input  logic [7:0] io_in_QSV_25_1,
    input  logic [7:0] io_in_QSV_26_0,
    input  logic [7:0] io_in_QSV_26_1,
    input  logic [7:0] io_in_QSV_27_0,
    input  logic [7:0] io_in_QSV_27_1,
    input  logic [7:0] io_in_QSV_28_0,
    input  logic [7:0] io_in_QSV_28_1,
    input  logic [7:0] io_in_QSV_29_0,
    input  logic [7:0] io_in_QSV_29_1,
    input  logic [7:0] io_in_QSV_30_0,
    input  logic [7:0] io_in_QSV_30_1,
    input  logic [7:0] io_in_QSV_31_0,
    input  logic [7:0] io_in_QSV_31_1,
    input  logic io_in_valid,
    
    output logic [7:0] io_out_QSV_0_0,
    output logic [7:0] io_out_QSV_0_1,
    output logic [7:0] io_out_QSV_1_0,
    output logic [7:0] io_out_QSV_1_1,
    output logic [7:0] io_out_QSV_2_0,
    output logic [7:0] io_out_QSV_2_1,
    output logic [7:0] io_out_QSV_3_0,
    output logic [7:0] io_out_QSV_3_1,
    output logic [7:0] io_out_QSV_4_0,
    output logic [7:0] io_out_QSV_4_1,
    output logic [7:0] io_out_QSV_5_0,
    output logic [7:0] io_out_QSV_5_1,
    output logic [7:0] io_out_QSV_6_0,
    output logic [7:0] io_out_QSV_6_1,
    output logic [7:0] io_out_QSV_7_0,
    output logic [7:0] io_out_QSV_7_1,
    output logic [7:0] io_out_QSV_8_0,
    output logic [7:0] io_out_QSV_8_1,
    output logic [7:0] io_out_QSV_9_0,
    output logic [7:0] io_out_QSV_9_1,
    output logic [7:0] io_out_QSV_10_0,
    output logic [7:0] io_out_QSV_10_1,
    output logic [7:0] io_out_QSV_11_0,
    output logic [7:0] io_out_QSV_11_1,
    output logic [7:0] io_out_QSV_12_0,
    output logic [7:0] io_out_QSV_12_1,
    output logic [7:0] io_out_QSV_13_0,
    output logic [7:0] io_out_QSV_13_1,
    output logic [7:0] io_out_QSV_14_0,
    output logic [7:0] io_out_QSV_14_1,
    output logic [7:0] io_out_QSV_15_0,
    output logic [7:0] io_out_QSV_15_1,
    output logic [7:0] io_out_QSV_16_0,
    output logic [7:0] io_out_QSV_16_1,
    output logic [7:0] io_out_QSV_17_0,
    output logic [7:0] io_out_QSV_17_1,
    output logic [7:0] io_out_QSV_18_0,
    output logic [7:0] io_out_QSV_18_1,
    output logic [7:0] io_out_QSV_19_0,
    output logic [7:0] io_out_QSV_19_1,
    output logic [7:0] io_out_QSV_20_0,
    output logic [7:0] io_out_QSV_20_1,
    output logic [7:0] io_out_QSV_21_0,
    output logic [7:0] io_out_QSV_21_1,
    output logic [7:0] io_out_QSV_22_0,
    output logic [7:0] io_out_QSV_22_1,
    output logic [7:0] io_out_QSV_23_0,
    output logic [7:0] io_out_QSV_23_1,
    output logic [7:0] io_out_QSV_24_0,
    output logic [7:0] io_out_QSV_24_1,
    output logic [7:0] io_out_QSV_25_0,
    output logic [7:0] io_out_QSV_25_1,
    output logic [7:0] io_out_QSV_26_0,
    output logic [7:0] io_out_QSV_26_1,
    output logic [7:0] io_out_QSV_27_0,
    output logic [7:0] io_out_QSV_27_1,
    output logic [7:0] io_out_QSV_28_0,
    output logic [7:0] io_out_QSV_28_1,
    output logic [7:0] io_out_QSV_29_0,
    output logic [7:0] io_out_QSV_29_1,
    output logic [7:0] io_out_QSV_30_0,
    output logic [7:0] io_out_QSV_30_1,
    output logic [7:0] io_out_QSV_31_0,
    output logic [7:0] io_out_QSV_31_1,
    output logic io_out_valid
);

    typedef struct packed {
        logic signed [7:0] re;
        logic signed [7:0] im;
    } complex_t;

    // --- STAGE 0: Register Inputs ---
    complex_t r_state_0[32];
    logic reg_valid_0;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_valid_0 <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                r_state_0[i].re <= 8'sb0;
                r_state_0[i].im <= 8'sb0;
            end
        end else begin
            reg_valid_0 <= io_in_valid;
            if (io_in_valid) begin
                r_state_0[0].re  <= $signed(io_in_QSV_0_0);  r_state_0[0].im  <= $signed(io_in_QSV_0_1);
                r_state_0[1].re  <= $signed(io_in_QSV_1_0);  r_state_0[1].im  <= $signed(io_in_QSV_1_1);
                r_state_0[2].re  <= $signed(io_in_QSV_2_0);  r_state_0[2].im  <= $signed(io_in_QSV_2_1);
                r_state_0[3].re  <= $signed(io_in_QSV_3_0);  r_state_0[3].im  <= $signed(io_in_QSV_3_1);
                r_state_0[4].re  <= $signed(io_in_QSV_4_0);  r_state_0[4].im  <= $signed(io_in_QSV_4_1);
                r_state_0[5].re  <= $signed(io_in_QSV_5_0);  r_state_0[5].im  <= $signed(io_in_QSV_5_1);
                r_state_0[6].re  <= $signed(io_in_QSV_6_0);  r_state_0[6].im  <= $signed(io_in_QSV_6_1);
                r_state_0[7].re  <= $signed(io_in_QSV_7_0);  r_state_0[7].im  <= $signed(io_in_QSV_7_1);
                r_state_0[8].re  <= $signed(io_in_QSV_8_0);  r_state_0[8].im  <= $signed(io_in_QSV_8_1);
                r_state_0[9].re  <= $signed(io_in_QSV_9_0);  r_state_0[9].im  <= $signed(io_in_QSV_9_1);
                r_state_0[10].re <= $signed(io_in_QSV_10_0); r_state_0[10].im <= $signed(io_in_QSV_10_1);
                r_state_0[11].re <= $signed(io_in_QSV_11_0); r_state_0[11].im <= $signed(io_in_QSV_11_1);
                r_state_0[12].re <= $signed(io_in_QSV_12_0); r_state_0[12].im <= $signed(io_in_QSV_12_1);
                r_state_0[13].re <= $signed(io_in_QSV_13_0); r_state_0[13].im <= $signed(io_in_QSV_13_1);
                r_state_0[14].re <= $signed(io_in_QSV_14_0); r_state_0[14].im <= $signed(io_in_QSV_14_1);
                r_state_0[15].re <= $signed(io_in_QSV_15_0); r_state_0[15].im <= $signed(io_in_QSV_15_1);
                r_state_0[16].re <= $signed(io_in_QSV_16_0); r_state_0[16].im <= $signed(io_in_QSV_16_1);
                r_state_0[17].re <= $signed(io_in_QSV_17_0); r_state_0[17].im <= $signed(io_in_QSV_17_1);
                r_state_0[18].re <= $signed(io_in_QSV_18_0); r_state_0[18].im <= $signed(io_in_QSV_18_1);
                r_state_0[19].re <= $signed(io_in_QSV_19_0); r_state_0[19].im <= $signed(io_in_QSV_19_1);
                r_state_0[20].re <= $signed(io_in_QSV_20_0); r_state_0[20].im <= $signed(io_in_QSV_20_1);
                r_state_0[21].re <= $signed(io_in_QSV_21_0); r_state_0[21].im <= $signed(io_in_QSV_21_1);
                r_state_0[22].re <= $signed(io_in_QSV_22_0); r_state_0[22].im <= $signed(io_in_QSV_22_1);
                r_state_0[23].re <= $signed(io_in_QSV_23_0); r_state_0[23].im <= $signed(io_in_QSV_23_1);
                r_state_0[24].re <= $signed(io_in_QSV_24_0); r_state_0[24].im <= $signed(io_in_QSV_24_1);
                r_state_0[25].re <= $signed(io_in_QSV_25_0); r_state_0[25].im <= $signed(io_in_QSV_25_1);
                r_state_0[26].re <= $signed(io_in_QSV_26_0); r_state_0[26].im <= $signed(io_in_QSV_26_1);
                r_state_0[27].re <= $signed(io_in_QSV_27_0); r_state_0[27].im <= $signed(io_in_QSV_27_1);
                r_state_0[28].re <= $signed(io_in_QSV_28_0); r_state_0[28].im <= $signed(io_in_QSV_28_1);
                r_state_0[29].re <= $signed(io_in_QSV_29_0); r_state_0[29].im <= $signed(io_in_QSV_29_1);
                r_state_0[30].re <= $signed(io_in_QSV_30_0); r_state_0[30].im <= $signed(io_in_QSV_30_1);
                r_state_0[31].re <= $signed(io_in_QSV_31_0); r_state_0[31].im <= $signed(io_in_QSV_31_1);
            end
        end
    end

    // --- STAGE 1: Hadamard on Qubit 0 ---
    complex_t next_state_1[32];
    always_comb begin
        for (int k = 0; k < 16; k++) begin
            logic signed [17:0] prod_re_0;
            logic signed [17:0] prod_im_0;
            logic signed [17:0] prod_re_1;
            logic signed [17:0] prod_im_1;
            
            prod_re_0 = ($signed(r_state_0[2*k].re) + $signed(r_state_0[2*k+1].re)) * 18'sd181;
            prod_im_0 = ($signed(r_state_0[2*k].im) + $signed(r_state_0[2*k+1].im)) * 18'sd181;
            prod_re_1 = ($signed(r_state_0[2*k].re) - $signed(r_state_0[2*k+1].re)) * 18'sd181;
            prod_im_1 = ($signed(r_state_0[2*k].im) - $signed(r_state_0[2*k+1].im)) * 18'sd181;
            
            next_state_1[2*k].re   = prod_re_0 >>> 8;
            next_state_1[2*k].im   = prod_im_0 >>> 8;
            next_state_1[2*k+1].re = prod_re_1 >>> 8;
            next_state_1[2*k+1].im = prod_im_1 >>> 8;
        end
    end

    complex_t r_state_1[32];
    logic reg_valid_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_valid_1 <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                r_state_1[i].re <= 8'sb0;
                r_state_1[i].im <= 8'sb0;
            end
        end else begin
            reg_valid_1 <= reg_valid_0;
            if (reg_valid_0) begin
                r_state_1 <= next_state_1;
            end
        end
    end

    // --- STAGE 2: CX 0 -> 1 ---
    complex_t next_state_2[32];
    always_comb begin
        for (int k = 0; k < 8; k++) begin
            next_state_2[4*k]   = r_state_1[4*k];
            next_state_2[4*k+2] = r_state_1[4*k+2];
            
            next_state_2[4*k+1] = r_state_1[4*k+3];
            next_state_2[4*k+3] = r_state_1[4*k+1];
        end
    end

    complex_t r_state_2[32];
    logic reg_valid_2;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_valid_2 <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                r_state_2[i].re <= 8'sb0;
                r_state_2[i].im <= 8'sb0;
            end
        end else begin
            reg_valid_2 <= reg_valid_1;
            if (reg_valid_1) begin
                r_state_2 <= next_state_2;
            end
        end
    end

    // --- STAGE 3: CX 1 -> 2 ---
    complex_t next_state_3[32];
    always_comb begin
        for (int k = 0; k < 4; k++) begin
            for (int b0 = 0; b0 < 2; b0++) begin
                next_state_3[8*k + b0]     = r_state_2[8*k + b0];
                next_state_3[8*k + 4 + b0] = r_state_2[8*k + 4 + b0];
                
                next_state_3[8*k + 2 + b0] = r_state_2[8*k + 6 + b0];
                next_state_3[8*k + 6 + b0] = r_state_2[8*k + 2 + b0];
            end
        end
    end

    complex_t r_state_3[32];
    logic reg_valid_3;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_valid_3 <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                r_state_3[i].re <= 8'sb0;
                r_state_3[i].im <= 8'sb0;
            end
        end else begin
            reg_valid_3 <= reg_valid_2;
            if (reg_valid_2) begin
                r_state_3 <= next_state_3;
            end
        end
    end

    // --- STAGE 4: CX 2 -> 3 ---
    complex_t next_state_4[32];
    always_comb begin
        for (int k = 0; k < 2; k++) begin
            for (int j = 0; j < 4; j++) begin
                next_state_4[16*k + j]     = r_state_3[16*k + j];
                next_state_4[16*k + 8 + j] = r_state_3[16*k + 8 + j];
                
                next_state_4[16*k + 4 + j]  = r_state_3[16*k + 12 + j];
                next_state_4[16*k + 12 + j] = r_state_3[16*k + 4 + j];
            end
        end
    end

    complex_t r_state_4[32];
    logic reg_valid_4;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_valid_4 <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                r_state_4[i].re <= 8'sb0;
                r_state_4[i].im <= 8'sb0;
            end
        end else begin
            reg_valid_4 <= reg_valid_3;
            if (reg_valid_3) begin
                r_state_4 <= next_state_4;
            end
        end
    end

    // --- STAGE 5: CX 3 -> 4 ---
    complex_t next_state_5[32];
    always_comb begin
        for (int j = 0; j < 8; j++) begin
            next_state_5[j]      = r_state_4[j];
            next_state_5[16 + j] = r_state_4[16 + j];
            
            next_state_5[8 + j]  = r_state_4[24 + j];
            next_state_5[24 + j] = r_state_4[8 + j];
        end
    end

    complex_t r_state_5[32];
    logic reg_valid_5;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            reg_valid_5 <= 1'b0;
            for (int i = 0; i < 32; i++) begin
                r_state_5[i].re <= 8'sb0;
                r_state_5[i].im <= 8'sb0;
            end
        end else begin
            reg_valid_5 <= reg_valid_4;
            if (reg_valid_4) begin
                r_state_5 <= next_state_5;
            end
        end
    end

    // --- Output Assignments ---
    assign io_out_QSV_0_0  = r_state_5[0].re;  assign io_out_QSV_0_1  = r_state_5[0].im;
    assign io_out_QSV_1_0  = r_state_5[1].re;  assign io_out_QSV_1_1  = r_state_5[1].im;
    assign io_out_QSV_2_0  = r_state_5[2].re;  assign io_out_QSV_2_1  = r_state_5[2].im;
    assign io_out_QSV_3_0  = r_state_5[3].re;  assign io_out_QSV_3_1  = r_state_5[3].im;
    assign io_out_QSV_4_0  = r_state_5[4].re;  assign io_out_QSV_4_1  = r_state_5[4].im;
    assign io_out_QSV_5_0  = r_state_5[5].re;  assign io_out_QSV_5_1  = r_state_5[5].im;
    assign io_out_QSV_6_0  = r_state_5[6].re;  assign io_out_QSV_6_1  = r_state_5[6].im;
    assign io_out_QSV_7_0  = r_state_5[7].re;  assign io_out_QSV_7_1  = r_state_5[7].im;
    assign io_out_QSV_8_0  = r_state_5[8].re;  assign io_out_QSV_8_1  = r_state_5[8].im;
    assign io_out_QSV_9_0  = r_state_5[9].re;  assign io_out_QSV_9_1  = r_state_5[9].im;
    assign io_out_QSV_10_0 = r_state_5[10].re; assign io_out_QSV_10_1 = r_state_5[10].im;
    assign io_out_QSV_11_0 = r_state_5[11].re; assign io_out_QSV_11_1 = r_state_5[11].im;
    assign io_out_QSV_12_0 = r_state_5[12].re; assign io_out_QSV_12_1 = r_state_5[12].im;
    assign io_out_QSV_13_0 = r_state_5[13].re; assign io_out_QSV_13_1 = r_state_5[13].im;
    assign io_out_QSV_14_0 = r_state_5[14].re; assign io_out_QSV_14_1 = r_state_5[14].im;
    assign io_out_QSV_15_0 = r_state_5[15].re; assign io_out_QSV_15_1 = r_state_5[15].im;
    assign io_out_QSV_16_0 = r_state_5[16].re; assign io_out_QSV_16_1 = r_state_5[16].im;
    assign io_out_QSV_17_0 = r_state_5[17].re; assign io_out_QSV_17_1 = r_state_5[17].im;
    assign io_out_QSV_18_0 = r_state_5[18].re; assign io_out_QSV_18_1 = r_state_5[18].im;
    assign io_out_QSV_19_0 = r_state_5[19].re; assign io_out_QSV_19_1 = r_state_5[19].im;
    assign io_out_QSV_20_0 = r_state_5[20].re; assign io_out_QSV_20_1 = r_state_5[20].im;
    assign io_out_QSV_21_0 = r_state_5[21].re; assign io_out_QSV_21_1 = r_state_5[21].im;
    assign io_out_QSV_22_0 = r_state_5[22].re; assign io_out_QSV_22_1 = r_state_5[22].im;
    assign io_out_QSV_23_0 = r_state_5[23].re; assign io_out_QSV_23_1 = r_state_5[23].im;
    assign io_out_QSV_24_0 = r_state_5[24].re; assign io_out_QSV_24_1 = r_state_5[24].im;
    assign io_out_QSV_25_0 = r_state_5[25].re; assign io_out_QSV_25_1 = r_state_5[25].im;
    assign io_out_QSV_26_0 = r_state_5[26].re; assign io_out_QSV_26_1 = r_state_5[26].im;
    assign io_out_QSV_27_0 = r_state_5[27].re; assign io_out_QSV_27_1 = r_state_5[27].im;
    assign io_out_QSV_28_0 = r_state_5[28].re; assign io_out_QSV_28_1 = r_state_5[28].im;
    assign io_out_QSV_29_0 = r_state_5[29].re; assign io_out_QSV_29_1 = r_state_5[29].im;
    assign io_out_QSV_30_0 = r_state_5[30].re; assign io_out_QSV_30_1 = r_state_5[30].im;
    assign io_out_QSV_31_0 = r_state_5[31].re; assign io_out_QSV_31_1 = r_state_5[31].im;
    assign io_out_valid = reg_valid_5;

endmodule
