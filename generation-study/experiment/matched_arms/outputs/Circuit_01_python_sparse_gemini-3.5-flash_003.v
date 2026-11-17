module Circuit_01 (
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

    localparam logic signed [15:0] INV_SQRT_2 = 16'sd23170;

    // --- Stage 1: Hadamard on Qubit 0 ---
    logic signed [16:0] sum_0_0, diff_0_0;
    logic signed [16:0] sum_0_1, diff_0_1;
    logic signed [16:0] sum_2_0, diff_2_0;
    logic signed [16:0] sum_2_1, diff_2_1;

    logic signed [32:0] prod_sum_0_0, prod_diff_0_0;
    logic signed [32:0] prod_sum_0_1, prod_diff_0_1;
    logic signed [32:0] prod_sum_2_0, prod_diff_2_0;
    logic signed [32:0] prod_sum_2_1, prod_diff_2_1;

    always_comb begin
        sum_0_0  = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
        diff_0_0 = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
        sum_0_1  = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
        diff_0_1 = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);
        
        sum_2_0  = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
        diff_2_0 = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
        sum_2_1  = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
        diff_2_1 = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

        prod_sum_0_0  = sum_0_0  * INV_SQRT_2;
        prod_diff_0_0 = diff_0_0 * INV_SQRT_2;
        prod_sum_0_1  = sum_0_1  * INV_SQRT_2;
        prod_diff_0_1 = diff_0_1 * INV_SQRT_2;
        
        prod_sum_2_0  = sum_2_0  * INV_SQRT_2;
        prod_diff_2_0 = diff_2_0 * INV_SQRT_2;
        prod_sum_2_1  = sum_2_1  * INV_SQRT_2;
        prod_diff_2_1 = diff_2_1 * INV_SQRT_2;
    end

    logic signed [15:0] r1_qsv_0_0, r1_qsv_0_1;
    logic signed [15:0] r1_qsv_1_0, r1_qsv_1_1;
    logic signed [15:0] r1_qsv_2_0, r1_qsv_2_1;
    logic signed [15:0] r1_qsv_3_0, r1_qsv_3_1;
    logic               r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_qsv_0_0 <= '0;
            r1_qsv_0_1 <= '0;
            r1_qsv_1_0 <= '0;
            r1_qsv_1_1 <= '0;
            r1_qsv_2_0 <= '0;
            r1_qsv_2_1 <= '0;
            r1_qsv_3_0 <= '0;
            r1_qsv_3_1 <= '0;
            r1_valid   <= 1'b0;
        end else begin
            r1_valid   <= io_in_valid;
            if (io_in_valid) begin
                r1_qsv_0_0 <= 16'(prod_sum_0_0  >>> 15);
                r1_qsv_1_0 <= 16'(prod_diff_0_0 >>> 15);
                r1_qsv_0_1 <= 16'(prod_sum_0_1  >>> 15);
                r1_qsv_1_1 <= 16'(prod_diff_0_1 >>> 15);
                
                r1_qsv_2_0 <= 16'(prod_sum_2_0  >>> 15);
                r1_qsv_3_0 <= 16'(prod_diff_2_0 >>> 15);
                r1_qsv_2_1 <= 16'(prod_sum_2_1  >>> 15);
                r1_qsv_3_1 <= 16'(prod_diff_2_1 >>> 15);
            end
        end
    end

    // --- Stage 2: Pauli-X on Qubit 1 & SWAP ---
    // Combined logic:
    // After X(1):
    // temp_0 = r1_qsv_2, temp_1 = r1_qsv_3, temp_2 = r1_qsv_0, temp_3 = r1_qsv_1
    // After SWAP(0,1):
    // out_0 = temp_0 = r1_qsv_2
    // out_1 = temp_2 = r1_qsv_0
    // out_2 = temp_1 = r1_qsv_3
    // out_3 = temp_3 = r1_qsv_1

    logic signed [15:0] r2_qsv_0_0, r2_qsv_0_1;
    logic signed [15:0] r2_qsv_1_0, r2_qsv_1_1;
    logic signed [15:0] r2_qsv_2_0, r2_qsv_2_1;
    logic signed [15:0] r2_qsv_3_0, r2_qsv_3_1;
    logic               r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_qsv_0_0 <= '0;
            r2_qsv_0_1 <= '0;
            r2_qsv_1_0 <= '0;
            r2_qsv_1_1 <= '0;
            r2_qsv_2_0 <= '0;
            r2_qsv_2_1 <= '0;
            r2_qsv_3_0 <= '0;
            r2_qsv_3_1 <= '0;
            r2_valid   <= 1'b0;
        end else begin
            r2_valid   <= r1_valid;
            if (r1_valid) begin
                r2_qsv_0_0 <= r1_qsv_2_0;
                r2_qsv_0_1 <= r1_qsv_2_1;
                
                r2_qsv_1_0 <= r1_qsv_0_0;
                r2_qsv_1_1 <= r1_qsv_0_1;
                
                r2_qsv_2_0 <= r1_qsv_3_0;
                r2_qsv_2_1 <= r1_qsv_3_1;
                
                r2_qsv_3_0 <= r1_qsv_1_0;
                r2_qsv_3_1 <= r1_qsv_1_1;
            end
        end
    end

    // --- Output Assignments ---
    assign io_out_QSV_0_0 = r2_qsv_0_0;
    assign io_out_QSV_0_1 = r2_qsv_0_1;
    assign io_out_QSV_1_0 = r2_qsv_1_0;
    assign io_out_QSV_1_1 = r2_qsv_1_1;
    assign io_out_QSV_2_0 = r2_qsv_2_0;
    assign io_out_QSV_2_1 = r2_qsv_2_1;
    assign io_out_QSV_3_0 = r2_qsv_3_0;
    assign io_out_QSV_3_1 = r2_qsv_3_1;
    assign io_out_valid   = r2_valid;

endmodule
