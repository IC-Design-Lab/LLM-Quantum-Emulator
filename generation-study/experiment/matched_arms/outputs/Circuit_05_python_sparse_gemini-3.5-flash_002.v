module Circuit_05 (
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

    // ==========================================
    // STAGE 1: Hadamard on Q0 (LSB)
    // ==========================================
    localparam logic signed [15:0] H_FACTOR = 16'sd11585; // 1/sqrt(2) in Q14

    logic signed [16:0] sum_0_0, diff_0_0;
    logic signed [16:0] sum_0_1, diff_0_1;
    logic signed [16:0] sum_2_0, diff_2_0;
    logic signed [16:0] sum_2_1, diff_2_1;

    assign sum_0_0  = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    assign diff_0_0 = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    assign sum_0_1  = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    assign diff_0_1 = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    assign sum_2_0  = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    assign diff_2_0 = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    assign sum_2_1  = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    assign diff_2_1 = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    logic signed [32:0] prod_0_0, prod_1_0, prod_0_1, prod_1_1;
    logic signed [32:0] prod_2_0, prod_3_0, prod_2_1, prod_3_1;

    assign prod_0_0 = sum_0_0  * H_FACTOR;
    assign prod_1_0 = diff_0_0 * H_FACTOR;
    assign prod_0_1 = sum_0_1  * H_FACTOR;
    assign prod_1_1 = diff_0_1 * H_FACTOR;

    assign prod_2_0 = sum_2_0  * H_FACTOR;
    assign prod_3_0 = diff_2_0 * H_FACTOR;
    assign prod_2_1 = sum_2_1  * H_FACTOR;
    assign prod_3_1 = diff_2_1 * H_FACTOR;

    logic [15:0] qsv_0_0_s1_next, qsv_0_1_s1_next, qsv_1_0_s1_next, qsv_1_1_s1_next;
    logic [15:0] qsv_2_0_s1_next, qsv_2_1_s1_next, qsv_3_0_s1_next, qsv_3_1_s1_next;

    assign qsv_0_0_s1_next = 16'($signed(prod_0_0) >>> 14);
    assign qsv_1_0_s1_next = 16'($signed(prod_1_0) >>> 14);
    assign qsv_0_1_s1_next = 16'($signed(prod_0_1) >>> 14);
    assign qsv_1_1_s1_next = 16'($signed(prod_1_1) >>> 14);

    assign qsv_2_0_s1_next = 16'($signed(prod_2_0) >>> 14);
    assign qsv_3_0_s1_next = 16'($signed(prod_3_0) >>> 14);
    assign qsv_2_1_s1_next = 16'($signed(prod_2_1) >>> 14);
    assign qsv_3_1_s1_next = 16'($signed(prod_3_1) >>> 14);

    logic [15:0] r_qsv_0_0_s1, r_qsv_0_1_s1, r_qsv_1_0_s1, r_qsv_1_1_s1;
    logic [15:0] r_qsv_2_0_s1, r_qsv_2_1_s1, r_qsv_3_0_s1, r_qsv_3_1_s1;
    logic        r_valid_s1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_valid_s1   <= 1'b0;
            r_qsv_0_0_s1 <= '0;
            r_qsv_0_1_s1 <= '0;
            r_qsv_1_0_s1 <= '0;
            r_qsv_1_1_s1 <= '0;
            r_qsv_2_0_s1 <= '0;
            r_qsv_2_1_s1 <= '0;
            r_qsv_3_0_s1 <= '0;
            r_qsv_3_1_s1 <= '0;
        end else begin
            r_valid_s1 <= io_in_valid;
            if (io_in_valid) begin
                r_qsv_0_0_s1 <= qsv_0_0_s1_next;
                r_qsv_0_1_s1 <= qsv_0_1_s1_next;
                r_qsv_1_0_s1 <= qsv_1_0_s1_next;
                r_qsv_1_1_s1 <= qsv_1_1_s1_next;
                r_qsv_2_0_s1 <= qsv_2_0_s1_next;
                r_qsv_2_1_s1 <= qsv_2_1_s1_next;
                r_qsv_3_0_s1 <= qsv_3_0_s1_next;
                r_qsv_3_1_s1 <= qsv_3_1_s1_next;
            end
        end
    end

    // ==========================================
    // STAGE 2: X on Q1 (MSB)
    // ==========================================
    logic [15:0] r_qsv_0_0_s2, r_qsv_0_1_s2, r_qsv_1_0_s2, r_qsv_1_1_s2;
    logic [15:0] r_qsv_2_0_s2, r_qsv_2_1_s2, r_qsv_3_0_s2, r_qsv_3_1_s2;
    logic        r_valid_s2;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_valid_s2   <= 1'b0;
            r_qsv_0_0_s2 <= '0;
            r_qsv_0_1_s2 <= '0;
            r_qsv_1_0_s2 <= '0;
            r_qsv_1_1_s2 <= '0;
            r_qsv_2_0_s2 <= '0;
            r_qsv_2_1_s2 <= '0;
            r_qsv_3_0_s2 <= '0;
            r_qsv_3_1_s2 <= '0;
        end else begin
            r_valid_s2 <= r_valid_s1;
            if (r_valid_s1) begin
                r_qsv_0_0_s2 <= r_qsv_2_0_s1;
                r_qsv_0_1_s2 <= r_qsv_2_1_s1;
                r_qsv_1_0_s2 <= r_qsv_3_0_s1;
                r_qsv_1_1_s2 <= r_qsv_3_1_s1;
                r_qsv_2_0_s2 <= r_qsv_0_0_s1;
                r_qsv_2_1_s2 <= r_qsv_0_1_s1;
                r_qsv_3_0_s2 <= r_qsv_1_0_s1;
                r_qsv_3_1_s2 <= r_qsv_1_1_s1;
            end
        end
    end

    // ==========================================
    // STAGE 3: SXdg on Q1 (MSB)
    // ==========================================
    logic signed [17:0] sum_sxdg_0r, sum_sxdg_0i, sum_sxdg_2r, sum_sxdg_2i;
    logic signed [17:0] sum_sxdg_1r, sum_sxdg_1i, sum_sxdg_3r, sum_sxdg_3i;

    assign sum_sxdg_0r = $signed(r_qsv_0_0_s2) + $signed(r_qsv_0_1_s2) + $signed(r_qsv_2_0_s2) - $signed(r_qsv_2_1_s2);
    assign sum_sxdg_0i = $signed(r_qsv_0_1_s2) - $signed(r_qsv_0_0_s2) + $signed(r_qsv_2_1_s2) + $signed(r_qsv_2_0_s2);
    assign sum_sxdg_2r = $signed(r_qsv_0_0_s2) - $signed(r_qsv_0_1_s2) + $signed(r_qsv_2_0_s2) + $signed(r_qsv_2_1_s2);
    assign sum_sxdg_2i = $signed(r_qsv_0_1_s2) + $signed(r_qsv_0_0_s2) + $signed(r_qsv_2_1_s2) - $signed(r_qsv_2_0_s2);

    assign sum_sxdg_1r = $signed(r_qsv_1_0_s2) + $signed(r_qsv_1_1_s2) + $signed(r_qsv_3_0_s2) - $signed(r_qsv_3_1_s2);
    assign sum_sxdg_1i = $signed(r_qsv_1_1_s2) - $signed(r_qsv_1_0_s2) + $signed(r_qsv_3_1_s2) + $signed(r_qsv_3_0_s2);
    assign sum_sxdg_3r = $signed(r_qsv_1_0_s2) - $signed(r_qsv_1_1_s2) + $signed(r_qsv_3_0_s2) + $signed(r_qsv_3_1_s2);
    assign sum_sxdg_3i = $signed(r_qsv_1_1_s2) + $signed(r_qsv_1_0_s2) + $signed(r_qsv_3_1_s2) - $signed(r_qsv_3_0_s2);

    logic [15:0] qsv_0_0_s3_next, qsv_0_1_s3_next, qsv_1_0_s3_next, qsv_1_1_s3_next;
    logic [15:0] qsv_2_0_s3_next, qsv_2_1_s3_next, qsv_3_0_s3_next, qsv_3_1_s3_next;

    assign qsv_0_0_s3_next = 16'($signed(sum_sxdg_0r) >>> 1);
    assign qsv_0_1_s3_next = 16'($signed(sum_sxdg_0i) >>> 1);
    assign qsv_2_0_s3_next = 16'($signed(sum_sxdg_2r) >>> 1);
    assign qsv_2_1_s3_next = 16'($signed(sum_sxdg_2i) >>> 1);

    assign qsv_1_0_s3_next = 16'($signed(sum_sxdg_1r) >>> 1);
    assign qsv_1_1_s3_next = 16'($signed(sum_sxdg_1i) >>> 1);
    assign qsv_3_0_s3_next = 16'($signed(sum_sxdg_3r) >>> 1);
    assign qsv_3_1_s3_next = 16'($signed(sum_sxdg_3i) >>> 1);

    logic [15:0] r_qsv_0_0_s3, r_qsv_0_1_s3, r_qsv_1_0_s3, r_qsv_1_1_s3;
    logic [15:0] r_qsv_2_0_s3, r_qsv_2_1_s3, r_qsv_3_0_s3, r_qsv_3_1_s3;
    logic        r_valid_s3;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_valid_s3   <= 1'b0;
            r_qsv_0_0_s3 <= '0;
            r_qsv_0_1_s3 <= '0;
            r_qsv_1_0_s3 <= '0;
            r_qsv_1_1_s3 <= '0;
            r_qsv_2_0_s3 <= '0;
            r_qsv_2_1_s3 <= '0;
            r_qsv_3_0_s3 <= '0;
            r_qsv_3_1_s3 <= '0;
        end else begin
            r_valid_s3 <= r_valid_s2;
            if (r_valid_s2) begin
                r_qsv_0_0_s3 <= qsv_0_0_s3_next;
                r_qsv_0_1_s3 <= qsv_0_1_s3_next;
                r_qsv_1_0_s3 <= qsv_1_0_s3_next;
                r_qsv_1_1_s3 <= qsv_1_1_s3_next;
                r_qsv_2_0_s3 <= qsv_2_0_s3_next;
                r_qsv_2_1_s3 <= qsv_2_1_s3_next;
                r_qsv_3_0_s3 <= qsv_3_0_s3_next;
                r_qsv_3_1_s3 <= qsv_3_1_s3_next;
            end
        end
    end

    // ==========================================
    // STAGE 4: Swap Q0, Q1
    // ==========================================
    logic [15:0] r_qsv_0_0_s4, r_qsv_0_1_s4, r_qsv_1_0_s4, r_qsv_1_1_s4;
    logic [15:0] r_qsv_2_0_s4, r_qsv_2_1_s4, r_qsv_3_0_s4, r_qsv_3_1_s4;
    logic        r_valid_s4;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_valid_s4   <= 1'b0;
            r_qsv_0_0_s4 <= '0;
            r_qsv_0_1_s4 <= '0;
            r_qsv_1_0_s4 <= '0;
            r_qsv_1_1_s4 <= '0;
            r_qsv_2_0_s4 <= '0;
            r_qsv_2_1_s4 <= '0;
            r_qsv_3_0_s4 <= '0;
            r_qsv_3_1_s4 <= '0;
        end else begin
            r_valid_s4 <= r_valid_s3;
            if (r_valid_s3) begin
                r_qsv_0_0_s4 <= r_qsv_0_0_s3;
                r_qsv_0_1_s4 <= r_qsv_0_1_s3;
                // Swap Q0 and Q1 corresponds to swapping state 1 (|01>) and state 2 (|10>)
                r_qsv_1_0_s4 <= r_qsv_2_0_s3;
                r_qsv_1_1_s4 <= r_qsv_2_1_s3;
                r_qsv_2_0_s4 <= r_qsv_1_0_s3;
                r_qsv_2_1_s4 <= r_qsv_1_1_s3;
                
                r_qsv_3_0_s4 <= r_qsv_3_0_s3;
                r_qsv_3_1_s4 <= r_qsv_3_1_s3;
            end
        end
    end

    // ==========================================
    // Outputs
    // ==========================================
    assign io_out_QSV_0_0 = r_qsv_0_0_s4;
    assign io_out_QSV_0_1 = r_qsv_0_1_s4;
    assign io_out_QSV_1_0 = r_qsv_1_0_s4;
    assign io_out_QSV_1_1 = r_qsv_1_1_s4;
    assign io_out_QSV_2_0 = r_qsv_2_0_s4;
    assign io_out_QSV_2_1 = r_qsv_2_1_s4;
    assign io_out_QSV_3_0 = r_qsv_3_0_s4;
    assign io_out_QSV_3_1 = r_qsv_3_1_s4;
    assign io_out_valid   = r_valid_s4;

endmodule
