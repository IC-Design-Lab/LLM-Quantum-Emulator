module QFT (
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
    output logic io_out_valid
);

    typedef struct packed {
        logic signed [7:0] r;
        logic signed [7:0] i;
    } complex_t;

    // Helper functions
    function automatic logic signed [7:0] safe_neg(input logic signed [7:0] val);
        if (val == -8'sd128) return 8'sd127;
        else return -val;
    endfunction

    function automatic logic signed [7:0] saturate_32_to_8(input logic signed [31:0] val);
        if (val > 32'sd127) return 8'sd127;
        else if (val < -32'sd128) return -8'sd128;
        else return val[7:0];
    endfunction

    function automatic void H_calc(
        input  complex_t in0,
        input  complex_t in1,
        output complex_t out0,
        output complex_t out1
    );
        logic signed [15:0] sum_r, diff_r, sum_i, diff_i;
        logic signed [31:0] prod_sum_r, prod_diff_r, prod_sum_i, prod_diff_i;
        logic signed [31:0] shift_sum_r, shift_diff_r, shift_sum_i, shift_diff_i;
        
        sum_r = $signed(in0.r) + $signed(in1.r);
        diff_r = $signed(in0.r) - $signed(in1.r);
        sum_i = $signed(in0.i) + $signed(in1.i);
        diff_i = $signed(in0.i) - $signed(in1.i);
        
        // 1/sqrt(2) approx 0.7071 * 32768 = 23170
        prod_sum_r = sum_r * 16'sd23170;
        prod_diff_r = diff_r * 16'sd23170;
        prod_sum_i = sum_i * 16'sd23170;
        prod_diff_i = diff_i * 16'sd23170;
        
        shift_sum_r = prod_sum_r >>> 15;
        shift_diff_r = prod_diff_r >>> 15;
        shift_sum_i = prod_sum_i >>> 15;
        shift_diff_i = prod_diff_i >>> 15;
        
        out0.r = saturate_32_to_8(shift_sum_r);
        out1.r = saturate_32_to_8(shift_diff_r);
        out0.i = saturate_32_to_8(shift_sum_i);
        out1.i = saturate_32_to_8(shift_diff_i);
    endfunction

    function automatic void CS_calc(
        input  complex_t in,
        output complex_t out
    );
        out.r = safe_neg(in.i);
        out.i = in.r;
    endfunction

    function automatic void CP_calc(
        input  complex_t in,
        output complex_t out
    );
        logic signed [15:0] diff, sum;
        logic signed [31:0] prod_r, prod_i;
        logic signed [31:0] shift_r, shift_i;
        
        diff = $signed(in.r) - $signed(in.i);
        sum  = $signed(in.r) + $signed(in.i);
        
        // 1/sqrt(2) approx 0.7071 * 32768 = 23170
        prod_r = diff * 16'sd23170;
        prod_i = sum * 16'sd23170;
        
        shift_r = prod_r >>> 15;
        shift_i = prod_i >>> 15;
        
        out.r = saturate_32_to_8(shift_r);
        out.i = saturate_32_to_8(shift_i);
    endfunction

    // Input state assignment
    complex_t state_in[8];
    assign state_in[0].r = $signed(io_in_QSV_0_0);
    assign state_in[0].i = $signed(io_in_QSV_0_1);
    assign state_in[1].r = $signed(io_in_QSV_1_0);
    assign state_in[1].i = $signed(io_in_QSV_1_1);
    assign state_in[2].r = $signed(io_in_QSV_2_0);
    assign state_in[2].i = $signed(io_in_QSV_2_1);
    assign state_in[3].r = $signed(io_in_QSV_3_0);
    assign state_in[3].i = $signed(io_in_QSV_3_1);
    assign state_in[4].r = $signed(io_in_QSV_4_0);
    assign state_in[4].i = $signed(io_in_QSV_4_1);
    assign state_in[5].r = $signed(io_in_QSV_5_0);
    assign state_in[5].i = $signed(io_in_QSV_5_1);
    assign state_in[6].r = $signed(io_in_QSV_6_0);
    assign state_in[6].i = $signed(io_in_QSV_6_1);
    assign state_in[7].r = $signed(io_in_QSV_7_0);
    assign state_in[7].i = $signed(io_in_QSV_7_1);

    // Register declarations for pipeline
    complex_t r_state_s1[8];
    complex_t r_state_s2[8];
    complex_t r_state_s3[8];
    complex_t r_state_s4[8];
    complex_t r_state_s5[8];
    complex_t r_state_s6[8];
    complex_t r_state_s7[8];

    logic r_valid_s1;
    logic r_valid_s2;
    logic r_valid_s3;
    logic r_valid_s4;
    logic r_valid_s5;
    logic r_valid_s6;
    logic r_valid_s7;

    // Stage 1: qc.h(0) (Hadamard on qubit 0)
    // Pairs: (0,1), (2,3), (4,5), (6,7)
    complex_t next_state_s1[8];
    always_comb begin
        H_calc(state_in[0], state_in[1], next_state_s1[0], next_state_s1[1]);
        H_calc(state_in[2], state_in[3], next_state_s1[2], next_state_s1[3]);
        H_calc(state_in[4], state_in[5], next_state_s1[4], next_state_s1[5]);
        H_calc(state_in[6], state_in[7], next_state_s1[6], next_state_s1[7]);
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                r_state_s1[i].r <= 8'sd0;
                r_state_s1[i].i <= 8'sd0;
            end
            r_valid_s1 <= 1'b0;
        end else begin
            r_state_s1 <= next_state_s1;
            r_valid_s1 <= io_in_valid;
        end
    end

    // Stage 2: qc.cs(1, 0) (Controlled-S: control=1, target=0)
    // States with b1=1 and b0=1 (indices 3 and 7) are multiplied by i
    complex_t next_state_s2[8];
    always_comb begin
        for (int i = 0; i < 8; i++) begin
            next_state_s2[i] = r_state_s1[i];
        end
        CS_calc(r_state_s1[3], next_state_s2[3]);
        CS_calc(r_state_s1[7], next_state_s2[7]);
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                r_state_s2[i].r <= 8'sd0;
                r_state_s2[i].i <= 8'sd0;
            end
            r_valid_s2 <= 1'b0;
        end else begin
            r_state_s2 <= next_state_s2;
            r_valid_s2 <= r_valid_s1;
        end
    end

    // Stage 3: qc.cp(pi / 4, 2, 0) (Controlled-Phase: control=2, target=0)
    // States with b2=1 and b0=1 (indices 5 and 7) are multiplied by exp(i*pi/4)
    complex_t next_state_s3[8];
    always_comb begin
        for (int i = 0; i < 8; i++) begin
            next_state_s3[i] = r_state_s2[i];
        end
        CP_calc(r_state_s2[5], next_state_s3[5]);
        CP_calc(r_state_s2[7], next_state_s3[7]);
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                r_state_s3[i].r <= 8'sd0;
                r_state_s3[i].i <= 8'sd0;
            end
            r_valid_s3 <= 1'b0;
        end else begin
            r_state_s3 <= next_state_s3;
            r_valid_s3 <= r_valid_s2;
        end
    end

    // Stage 4: qc.h(1) (Hadamard on qubit 1)
    // Pairs: (0,2), (1,3), (4,6), (5,7)
    complex_t next_state_s4[8];
    always_comb begin
        H_calc(r_state_s3[0], r_state_s3[2], next_state_s4[0], next_state_s4[2]);
        H_calc(r_state_s3[1], r_state_s3[3], next_state_s4[1], next_state_s4[3]);
        H_calc(r_state_s3[4], r_state_s3[6], next_state_s4[4], next_state_s4[6]);
        H_calc(r_state_s3[5], r_state_s3[7], next_state_s4[5], next_state_s4[7]);
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                r_state_s4[i].r <= 8'sd0;
                r_state_s4[i].i <= 8'sd0;
            end
            r_valid_s4 <= 1'b0;
        end else begin
            r_state_s4 <= next_state_s4;
            r_valid_s4 <= r_valid_s3;
        end
    end

    // Stage 5: qc.cs(2, 1) (Controlled-S: control=2, target=1)
    // States with b2=1 and b1=1 (indices 6 and 7) are multiplied by i
    complex_t next_state_s5[8];
    always_comb begin
        for (int i = 0; i < 8; i++) begin
            next_state_s5[i] = r_state_s4[i];
        end
        CS_calc(r_state_s4[6], next_state_s5[6]);
        CS_calc(r_state_s4[7], next_state_s5[7]);
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                r_state_s5[i].r <= 8'sd0;
                r_state_s5[i].i <= 8'sd0;
            end
            r_valid_s5 <= 1'b0;
        end else begin
            r_state_s5 <= next_state_s5;
            r_valid_s5 <= r_valid_s4;
        end
    end

    // Stage 6: qc.h(2) (Hadamard on qubit 2)
    // Pairs: (0,4), (1,5), (2,6), (3,7)
    complex_t next_state_s6[8];
    always_comb begin
        H_calc(r_state_s5[0], r_state_s5[4], next_state_s6[0], next_state_s6[4]);
        H_calc(r_state_s5[1], r_state_s5[5], next_state_s6[1], next_state_s6[5]);
        H_calc(r_state_s5[2], r_state_s5[6], next_state_s6[2], next_state_s6[6]);
        H_calc(r_state_s5[3], r_state_s5[7], next_state_s6[3], next_state_s6[7]);
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                r_state_s6[i].r <= 8'sd0;
                r_state_s6[i].i <= 8'sd0;
            end
            r_valid_s6 <= 1'b0;
        end else begin
            r_state_s6 <= next_state_s6;
            r_valid_s6 <= r_valid_s5;
        end
    end

    // Stage 7: qc.swap(0, 2) (Swap qubit 0 and qubit 2)
    // Swaps: (1, 4) and (3, 6)
    complex_t next_state_s7[8];
    always_comb begin
        next_state_s7[0] = r_state_s6[0];
        next_state_s7[1] = r_state_s6[4];
        next_state_s7[2] = r_state_s6[2];
        next_state_s7[3] = r_state_s6[6];
        next_state_s7[4] = r_state_s6[1];
        next_state_s7[5] = r_state_s6[5];
        next_state_s7[6] = r_state_s6[3];
        next_state_s7[7] = r_state_s6[7];
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                r_state_s7[i].r <= 8'sd0;
                r_state_s7[i].i <= 8'sd0;
            end
            r_valid_s7 <= 1'b0;
        end else begin
            r_state_s7 <= next_state_s7;
            r_valid_s7 <= r_valid_s6;
        end
    end

    // Output assignments
    assign io_out_QSV_0_0 = r_state_s7[0].r;
    assign io_out_QSV_0_1 = r_state_s7[0].i;
    assign io_out_QSV_1_0 = r_state_s7[1].r;
    assign io_out_QSV_1_1 = r_state_s7[1].i;
    assign io_out_QSV_2_0 = r_state_s7[2].r;
    assign io_out_QSV_2_1 = r_state_s7[2].i;
    assign io_out_QSV_3_0 = r_state_s7[3].r;
    assign io_out_QSV_3_1 = r_state_s7[3].i;
    assign io_out_QSV_4_0 = r_state_s7[4].r;
    assign io_out_QSV_4_1 = r_state_s7[4].i;
    assign io_out_QSV_5_0 = r_state_s7[5].r;
    assign io_out_QSV_5_1 = r_state_s7[5].i;
    assign io_out_QSV_6_0 = r_state_s7[6].r;
    assign io_out_QSV_6_1 = r_state_s7[6].i;
    assign io_out_QSV_7_0 = r_state_s7[7].r;
    assign io_out_QSV_7_1 = r_state_s7[7].i;
    assign io_out_valid   = r_valid_s7;

endmodule
