module Circuit_00 (
    input  logic        clock,
    input  logic        reset,
    input  logic [15:0] io_in_QSV_0_0,
    input  logic [15:0] io_in_QSV_0_1,
    input  logic [15:0] io_in_QSV_1_0,
    input  logic [15:0] io_in_QSV_1_1,
    input  logic [15:0] io_in_QSV_2_0,
    input  logic [15:0] io_in_QSV_2_1,
    input  logic [15:0] io_in_QSV_3_0,
    input  logic [15:0] io_in_QSV_3_1,
    input  logic        io_in_valid,
    output logic [15:0] io_out_QSV_0_0,
    output logic [15:0] io_out_QSV_0_1,
    output logic [15:0] io_out_QSV_1_0,
    output logic [15:0] io_out_QSV_1_1,
    output logic [15:0] io_out_QSV_2_0,
    output logic [15:0] io_out_QSV_2_1,
    output logic [15:0] io_out_QSV_3_0,
    output logic [15:0] io_out_QSV_3_1,
    output logic        io_out_valid
);

    // Cast inputs to signed wires
    wire signed [15:0] r_in_0 = $signed(io_in_QSV_0_0);
    wire signed [15:0] i_in_0 = $signed(io_in_QSV_0_1);
    wire signed [15:0] r_in_1 = $signed(io_in_QSV_1_0);
    wire signed [15:0] i_in_1 = $signed(io_in_QSV_1_1);
    wire signed [15:0] r_in_2 = $signed(io_in_QSV_2_0);
    wire signed [15:0] i_in_2 = $signed(io_in_QSV_2_1);
    wire signed [15:0] r_in_3 = $signed(io_in_QSV_3_0);
    wire signed [15:0] i_in_3 = $signed(io_in_QSV_3_1);

    // Stage 1 registers: Sum and Difference for Hadamard on qubit 0
    logic signed [16:0] r_sum_01, r_diff_01;
    logic signed [16:0] i_sum_01, i_diff_01;
    logic signed [16:0] r_sum_23, r_diff_23;
    logic signed [16:0] i_sum_23, i_diff_23;
    logic               v_stage1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_sum_01  <= 17'sd0;
            r_diff_01 <= 17'sd0;
            i_sum_01  <= 17'sd0;
            i_diff_01 <= 17'sd0;
            r_sum_23  <= 17'sd0;
            r_diff_23 <= 17'sd0;
            i_sum_23  <= 17'sd0;
            i_diff_23 <= 17'sd0;
            v_stage1  <= 1'b0;
        end else begin
            r_sum_01  <= r_in_0 + r_in_1;
            r_diff_01 <= r_in_0 - r_in_1;
            i_sum_01  <= i_in_0 + i_in_1;
            i_diff_01 <= i_in_0 - i_in_1;
            r_sum_23  <= r_in_2 + r_in_3;
            r_diff_23 <= r_in_2 - r_in_3;
            i_sum_23  <= i_in_2 + i_in_3;
            i_diff_23 <= i_in_2 - i_in_3;
            v_stage1  <= io_in_valid;
        end
    end

    // Stage 2 registers: Multiplication by 1/sqrt(2) (represented by 23170 in Q1.15)
    logic signed [32:0] r_prod_01_sum, r_prod_01_diff;
    logic signed [32:0] i_prod_01_sum, i_prod_01_diff;
    logic signed [32:0] r_prod_23_sum, r_prod_23_diff;
    logic signed [32:0] i_prod_23_sum, i_prod_23_diff;
    logic               v_stage2;

    localparam logic signed [15:0] COEFF = 16'sd23170;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_prod_01_sum  <= 33'sd0;
            r_prod_01_diff <= 33'sd0;
            i_prod_01_sum  <= 33'sd0;
            i_prod_01_diff <= 33'sd0;
            r_prod_23_sum  <= 33'sd0;
            r_prod_23_diff <= 33'sd0;
            i_prod_23_sum  <= 33'sd0;
            i_prod_23_diff <= 33'sd0;
            v_stage2       <= 1'b0;
        end else begin
            r_prod_01_sum  <= r_sum_01  * COEFF;
            r_prod_01_diff <= r_diff_01 * COEFF;
            i_prod_01_sum  <= i_sum_01  * COEFF;
            i_prod_01_diff <= i_diff_01 * COEFF;
            r_prod_23_sum  <= r_sum_23  * COEFF;
            r_prod_23_diff <= r_diff_23 * COEFF;
            i_prod_23_sum  <= i_sum_23  * COEFF;
            i_prod_23_diff <= i_diff_23 * COEFF;
            v_stage2       <= v_stage1;
        end
    end

    // Stage 3 rounding and shifting (and applying SWAP on qubits 0 and 1)
    // SWAP mapping:
    // Output Index 0 (00) <= Stage 2 Index 0 (00)
    // Output Index 1 (01) <= Stage 2 Index 2 (10)
    // Output Index 2 (10) <= Stage 2 Index 1 (01)
    // Output Index 3 (11) <= Stage 2 Index 3 (11)

    logic signed [32:0] r_res_00, i_res_00;
    logic signed [32:0] r_res_01, i_res_01;
    logic signed [32:0] r_res_10, i_res_10;
    logic signed [32:0] r_res_11, i_res_11;

    assign r_res_00 = (r_prod_01_sum  + 33'sd16384) >>> 15;
    assign i_res_00 = (i_prod_01_sum  + 33'sd16384) >>> 15;
    
    assign r_res_01 = (r_prod_01_diff + 33'sd16384) >>> 15;
    assign i_res_01 = (i_prod_01_diff + 33'sd16384) >>> 15;
    
    assign r_res_10 = (r_prod_23_sum  + 33'sd16384) >>> 15;
    assign i_res_10 = (i_prod_23_sum  + 33'sd16384) >>> 15;
    
    assign r_res_11 = (r_prod_23_diff + 33'sd16384) >>> 15;
    assign i_res_11 = (i_prod_23_diff + 33'sd16384) >>> 15;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_QSV_0_0 <= 16'h0;
            io_out_QSV_0_1 <= 16'h0;
            io_out_QSV_1_0 <= 16'h0;
            io_out_QSV_1_1 <= 16'h0;
            io_out_QSV_2_0 <= 16'h0;
            io_out_QSV_2_1 <= 16'h0;
            io_out_QSV_3_0 <= 16'h0;
            io_out_QSV_3_1 <= 16'h0;
            io_out_valid   <= 1'b0;
        end else begin
            io_out_QSV_0_0 <= r_res_00[15:0];
            io_out_QSV_0_1 <= i_res_00[15:0];
            
            io_out_QSV_1_0 <= r_res_10[15:0];
            io_out_QSV_1_1 <= i_res_10[15:0];
            
            io_out_QSV_2_0 <= r_res_01[15:0];
            io_out_QSV_2_1 <= i_res_01[15:0];
            
            io_out_QSV_3_0 <= r_res_11[15:0];
            io_out_QSV_3_1 <= i_res_11[15:0];
            
            io_out_valid   <= v_stage2;
        end
    end

endmodule
