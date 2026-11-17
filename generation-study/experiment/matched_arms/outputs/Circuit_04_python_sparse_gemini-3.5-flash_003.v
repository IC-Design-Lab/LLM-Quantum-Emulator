module Circuit_04 (
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

    // Constant for 1/sqrt(2) in Q15 format (0.70710678 * 32768 = 23170)
    localparam logic signed [15:0] COS_45 = 16'h5A82;

    // Stage 0 registers
    logic signed [15:0] r0_0_r, r0_1_r;
    logic signed [15:0] r1_0_r, r1_1_r;
    logic signed [15:0] r2_0_r, r2_1_r;
    logic signed [15:0] r3_0_r, r3_1_r;
    logic r0_valid;

    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            r0_0_r   <= '0;
            r0_1_r   <= '0;
            r1_0_r   <= '0;
            r1_1_r   <= '0;
            r2_0_r   <= '0;
            r2_1_r   <= '0;
            r3_0_r   <= '0;
            r3_1_r   <= '0;
            r0_valid <= 1'b0;
        end else begin
            r0_valid <= io_in_valid;
            if (io_in_valid) begin
                r0_0_r <= $signed(io_in_QSV_0_0);
                r0_1_r <= $signed(io_in_QSV_0_1);
                r1_0_r <= $signed(io_in_QSV_1_0);
                r1_1_r <= $signed(io_in_QSV_1_1);
                r2_0_r <= $signed(io_in_QSV_2_0);
                r2_1_r <= $signed(io_in_QSV_2_1);
                r3_0_r <= $signed(io_in_QSV_3_0);
                r3_1_r <= $signed(io_in_QSV_3_1);
            end
        end
    end

    // Stage 1 calculations: Hadamard on Qubit 0
    logic signed [16:0] sum_01_r, diff_01_r, sum_01_i, diff_01_i;
    logic signed [16:0] sum_23_r, diff_23_r, sum_23_i, diff_23_i;

    assign sum_01_r  = r0_0_r + r1_0_r;
    assign diff_01_r = r0_0_r - r1_0_r;
    assign sum_01_i  = r0_1_r + r1_1_r;
    assign diff_01_i = r0_1_r - r1_1_r;

    assign sum_23_r  = r2_0_r + r3_0_r;
    assign diff_23_r = r2_0_r - r3_0_r;
    assign sum_23_i  = r2_1_r + r3_1_r;
    assign diff_23_i = r2_1_r - r3_1_r;

    logic signed [32:0] prod_01_r, prod_01_dr, prod_01_i, prod_01_di;
    logic signed [32:0] prod_23_r, prod_23_dr, prod_23_i, prod_23_di;

    assign prod_01_r  = sum_01_r * COS_45;
    assign prod_01_dr = diff_01_r * COS_45;
    assign prod_01_i  = sum_01_i * COS_45;
    assign prod_01_di = diff_01_i * COS_45;

    assign prod_23_r  = sum_23_r * COS_45;
    assign prod_23_dr = diff_23_r * COS_45;
    assign prod_23_i  = sum_23_i * COS_45;
    assign prod_23_di = diff_23_i * COS_45;

    // Stage 1 registers
    logic signed [15:0] r1_0_0, r1_0_1, r1_1_0, r1_1_1;
    logic signed [15:0] r1_2_0, r1_2_1, r1_3_0, r1_3_1;
    logic r1_valid;

    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            r1_0_0   <= '0;
            r1_0_1   <= '0;
            r1_1_0   <= '0;
            r1_1_1   <= '0;
            r1_2_0   <= '0;
            r1_2_1   <= '0;
            r1_3_0   <= '0;
            r1_3_1   <= '0;
            r1_valid <= 1'b0;
        end else begin
            r1_valid <= r0_valid;
            if (r0_valid) begin
                r1_0_0 <= 16'(prod_01_r  >>> 15);
                r1_0_1 <= 16'(prod_01_i  >>> 15);
                r1_1_0 <= 16'(prod_01_dr >>> 15);
                r1_1_1 <= 16'(prod_01_di >>> 15);

                r1_2_0 <= 16'(prod_23_r  >>> 15);
                r1_2_1 <= 16'(prod_23_i  >>> 15);
                r1_3_0 <= 16'(prod_23_dr >>> 15);
                r1_3_1 <= 16'(prod_23_di >>> 15);
            end
        end
    end

    // Stage 2 calculations: SXdg on Qubit 1
    logic signed [17:0] sum_0_0, sum_0_1, sum_2_0, sum_2_1;
    logic signed [17:0] sum_1_0, sum_1_1, sum_3_0, sum_3_1;

    assign sum_0_0 = 18'(r1_0_0) + 18'(r1_0_1) + 18'(r1_2_0) - 18'(r1_2_1);
    assign sum_0_1 = -18'(r1_0_0) + 18'(r1_0_1) + 18'(r1_2_0) + 18'(r1_2_1);
    assign sum_2_0 = 18'(r1_0_0) - 18'(r1_0_1) + 18'(r1_2_0) + 18'(r1_2_1);
    assign sum_2_1 = 18'(r1_0_0) + 18'(r1_0_1) - 18'(r1_2_0) + 18'(r1_2_1);

    assign sum_1_0 = 18'(r1_1_0) + 18'(r1_1_1) + 18'(r1_3_0) - 18'(r1_3_1);
    assign sum_1_1 = -18'(r1_1_0) + 18'(r1_1_1) + 18'(r1_3_0) + 18'(r1_3_1);
    assign sum_3_0 = 18'(r1_1_0) - 18'(r1_1_1) + 18'(r1_3_0) + 18'(r1_3_1);
    assign sum_3_1 = 18'(r1_1_0) + 18'(r1_1_1) - 18'(r1_3_0) + 18'(r1_3_1);

    logic signed [15:0] val_0_0, val_0_1, val_2_0, val_2_1;
    logic signed [15:0] val_1_0, val_1_1, val_3_0, val_3_1;

    assign val_0_0 = 16'(sum_0_0 >>> 1);
    assign val_0_1 = 16'(sum_0_1 >>> 1);
    assign val_2_0 = 16'(sum_2_0 >>> 1);
    assign val_2_1 = 16'(sum_2_1 >>> 1);

    assign val_1_0 = 16'(sum_1_0 >>> 1);
    assign val_1_1 = 16'(sum_1_1 >>> 1);
    assign val_3_0 = 16'(sum_3_0 >>> 1);
    assign val_3_1 = 16'(sum_3_1 >>> 1);

    // Stage 2 registers
    logic signed [15:0] r2_0_0, r2_0_1, r2_1_0, r2_1_1;
    logic signed [15:0] r2_2_0, r2_2_1, r2_3_0, r2_3_1;
    logic r2_valid;

    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            r2_0_0   <= '0;
            r2_0_1   <= '0;
            r2_1_0   <= '0;
            r2_1_1   <= '0;
            r2_2_0   <= '0;
            r2_2_1   <= '0;
            r2_3_0   <= '0;
            r2_3_1   <= '0;
            r2_valid <= 1'b0;
        end else begin
            r2_valid <= r1_valid;
            if (r1_valid) begin
                r2_0_0 <= val_0_0;
                r2_0_1 <= val_0_1;
                r2_1_0 <= val_1_0;
                r2_1_1 <= val_1_1;
                r2_2_0 <= val_2_0;
                r2_2_1 <= val_2_1;
                r2_3_0 <= val_3_0;
                r2_3_1 <= val_3_1;
            end
        end
    end

    // Stage 3 registers: SWAP(0, 1) and output mapping
    // State 0 -> State 0
    // State 1 -> State 2
    // State 2 -> State 1
    // State 3 -> State 3
    always_ff @(posedg clock or posedge reset) begin
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
            io_out_valid <= r2_valid;
            if (r2_valid) begin
                io_out_QSV_0_0 <= r2_0_0;
                io_out_QSV_0_1 <= r2_0_1;
                io_out_QSV_1_0 <= r2_2_0; // swapped
                io_out_QSV_1_1 <= r2_2_1; // swapped
                io_out_QSV_2_0 <= r2_1_0; // swapped
                io_out_QSV_2_1 <= r2_1_1; // swapped
                io_out_QSV_3_0 <= r2_3_0;
                io_out_QSV_3_1 <= r2_3_1;
            end
        end
    end

endmodule
