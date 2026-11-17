module Circuit_02 (
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

    localparam logic signed [15:0] SCALE = 16'sd23170; // 1/sqrt(2) in Q1.15

    // ------------------------------------------------------------------------
    // Stage 1: Hadamard on Qubit 0
    // ------------------------------------------------------------------------
    logic signed [16:0] sum_r_0_1, diff_r_0_1;
    logic signed [16:0] sum_i_0_1, diff_i_0_1;
    logic signed [16:0] sum_r_2_3, diff_r_2_3;
    logic signed [16:0] sum_i_2_3, diff_i_2_3;

    assign sum_r_0_1  = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    assign diff_r_0_1 = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    assign sum_i_0_1  = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    assign diff_i_0_1 = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    assign sum_r_2_3  = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    assign diff_r_2_3 = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    assign sum_i_2_3  = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    assign diff_i_2_3 = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    logic signed [32:0] prod_sum_r_0_1, prod_diff_r_0_1;
    logic signed [32:0] prod_sum_i_0_1, prod_diff_i_0_1;
    logic signed [32:0] prod_sum_r_2_3, prod_diff_r_2_3;
    logic signed [32:0] prod_sum_i_2_3, prod_diff_i_2_3;

    assign prod_sum_r_0_1  = sum_r_0_1  * SCALE;
    assign prod_diff_r_0_1 = diff_r_0_1 * SCALE;
    assign prod_sum_i_0_1  = sum_i_0_1  * SCALE;
    assign prod_diff_i_0_1 = diff_i_0_1 * SCALE;

    assign prod_sum_r_2_3  = sum_r_2_3  * SCALE;
    assign prod_diff_r_2_3 = diff_r_2_3 * SCALE;
    assign prod_sum_i_2_3  = sum_i_2_3  * SCALE;
    assign prod_diff_i_2_3 = diff_i_2_3 * SCALE;

    logic signed [15:0] q0_QSV_0_0, q0_QSV_0_1;
    logic signed [15:0] q0_QSV_1_0, q0_QSV_1_1;
    logic signed [15:0] q0_QSV_2_0, q0_QSV_2_1;
    logic signed [15:0] q0_QSV_3_0, q0_QSV_3_1;
    logic               q0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            q0_QSV_0_0 <= '0;
            q0_QSV_0_1 <= '0;
            q0_QSV_1_0 <= '0;
            q0_QSV_1_1 <= '0;
            q0_QSV_2_0 <= '0;
            q0_QSV_2_1 <= '0;
            q0_QSV_3_0 <= '0;
            q0_QSV_3_1 <= '0;
            q0_valid   <= 1'b0;
        end else begin
            q0_valid <= io_in_valid;
            if (io_in_valid) begin
                q0_QSV_0_0 <= prod_sum_r_0_1[30:15];
                q0_QSV_0_1 <= prod_sum_i_0_1[30:15];
                q0_QSV_1_0 <= prod_diff_r_0_1[30:15];
                q0_QSV_1_1 <= prod_diff_i_0_1[30:15];
                q0_QSV_2_0 <= prod_sum_r_2_3[30:15];
                q0_QSV_2_1 <= prod_sum_i_2_3[30:15];
                q0_QSV_3_0 <= prod_diff_r_2_3[30:15];
                q0_QSV_3_1 <= prod_diff_i_2_3[30:15];
            end
        end
    end

    // ------------------------------------------------------------------------
    // Stage 2: Hadamard on Qubit 1
    // ------------------------------------------------------------------------
    logic signed [16:0] sum_r_0_2, diff_r_0_2;
    logic signed [16:0] sum_i_0_2, diff_i_0_2;
    logic signed [16:0] sum_r_1_3, diff_r_1_3;
    logic signed [16:0] sum_i_1_3, diff_i_1_3;

    assign sum_r_0_2  = $signed(q0_QSV_0_0) + $signed(q0_QSV_2_0);
    assign diff_r_0_2 = $signed(q0_QSV_0_0) - $signed(q0_QSV_2_0);
    assign sum_i_0_2  = $signed(q0_QSV_0_1) + $signed(q0_QSV_2_1);
    assign diff_i_0_2 = $signed(q0_QSV_0_1) - $signed(q0_QSV_2_1);

    assign sum_r_1_3  = $signed(q0_QSV_1_0) + $signed(q0_QSV_3_0);
    assign diff_r_1_3 = $signed(q0_QSV_1_0) - $signed(q0_QSV_3_0);
    assign sum_i_1_3  = $signed(q0_QSV_1_1) + $signed(q0_QSV_3_1);
    assign diff_i_1_3 = $signed(q0_QSV_1_1) - $signed(q0_QSV_3_1);

    logic signed [32:0] prod_sum_r_0_2, prod_diff_r_0_2;
    logic signed [32:0] prod_sum_i_0_2, prod_diff_i_0_2;
    logic signed [32:0] prod_sum_r_1_3, prod_diff_r_1_3;
    logic signed [32:0] prod_sum_i_1_3, prod_diff_i_1_3;

    assign prod_sum_r_0_2  = sum_r_0_2  * SCALE;
    assign prod_diff_r_0_2 = diff_r_0_2 * SCALE;
    assign prod_sum_i_0_2  = sum_i_0_2  * SCALE;
    assign prod_diff_i_0_2 = diff_i_0_2 * SCALE;

    assign prod_sum_r_1_3  = sum_r_1_3  * SCALE;
    assign prod_diff_r_1_3 = diff_r_1_3 * SCALE;
    assign prod_sum_i_1_3  = sum_i_1_3  * SCALE;
    assign prod_diff_i_1_3 = diff_i_1_3 * SCALE;

    logic signed [15:0] q1_QSV_0_0, q1_QSV_0_1;
    logic signed [15:0] q1_QSV_1_0, q1_QSV_1_1;
    logic signed [15:0] q1_QSV_2_0, q1_QSV_2_1;
    logic signed [15:0] q1_QSV_3_0, q1_QSV_3_1;
    logic               q1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            q1_QSV_0_0 <= '0;
            q1_QSV_0_1 <= '0;
            q1_QSV_1_0 <= '0;
            q1_QSV_1_1 <= '0;
            q1_QSV_2_0 <= '0;
            q1_QSV_2_1 <= '0;
            q1_QSV_3_0 <= '0;
            q1_QSV_3_1 <= '0;
            q1_valid   <= 1'b0;
        end else begin
            q1_valid <= q0_valid;
            if (q0_valid) begin
                q1_QSV_0_0 <= prod_sum_r_0_2[30:15];
                q1_QSV_0_1 <= prod_sum_i_0_2[30:15];
                q1_QSV_2_0 <= prod_diff_r_0_2[30:15];
                q1_QSV_2_1 <= prod_diff_i_0_2[30:15];
                q1_QSV_1_0 <= prod_sum_r_1_3[30:15];
                q1_QSV_1_1 <= prod_sum_i_1_3[30:15];
                q1_QSV_3_0 <= prod_diff_r_1_3[30:15];
                q1_QSV_3_1 <= prod_diff_i_1_3[30:15];
            end
        end
    end

    // ------------------------------------------------------------------------
    // Stage 3: SWAP Qubits 0 and 1
    // ------------------------------------------------------------------------
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_QSV_0_0 <= '0;
            io_out_QSV_0_1 <= '0;
            io_out_QSV_1_0 <= '0;
            io_out_QSV_1_1 <= '0;
            io_out_QSV_2_0 <= '0;
            io_out_QSV_2_1 <= '0;
            io_out_QSV_3_0 <= '0;
            io_out_QSV_3_1 <= '0;
            io_out_valid   <= 1'b0;
        end else begin
            io_out_valid <= q1_valid;
            if (q1_valid) begin
                io_out_QSV_0_0 <= q1_QSV_0_0;
                io_out_QSV_0_1 <= q1_QSV_0_1;
                io_out_QSV_1_0 <= q1_QSV_2_0; // State 1 <- State 2
                io_out_QSV_1_1 <= q1_QSV_2_1;
                io_out_QSV_2_0 <= q1_QSV_1_0; // State 2 <- State 1
                io_out_QSV_2_1 <= q1_QSV_1_1;
                io_out_QSV_3_0 <= q1_QSV_3_0;
                io_out_QSV_3_1 <= q1_QSV_3_1;
            end
        end
    end

endmodule
