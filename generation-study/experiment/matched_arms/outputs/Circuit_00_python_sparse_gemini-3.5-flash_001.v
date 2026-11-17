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

    // 1/sqrt(2) in Q1.15 format (0.70710678 * 32768 = 23170)
    localparam logic signed [15:0] H_COEFF = 16'sd23170;

    // Stage 1 Registers
    logic signed [16:0] sum_0_0_reg, sum_0_1_reg, sum_1_0_reg, sum_1_1_reg;
    logic signed [16:0] diff_0_0_reg, diff_0_1_reg, diff_1_0_reg, diff_1_1_reg;
    logic r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            sum_0_0_reg  <= 17'd0;
            sum_0_1_reg  <= 17'd0;
            sum_1_0_reg  <= 17'd0;
            sum_1_1_reg  <= 17'd0;
            diff_0_0_reg <= 17'd0;
            diff_0_1_reg <= 17'd0;
            diff_1_0_reg <= 17'd0;
            diff_1_1_reg <= 17'd0;
            r1_valid     <= 1'b0;
        end else begin
            r1_valid     <= io_in_valid;
            if (io_in_valid) begin
                sum_0_0_reg  <= $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
                sum_0_1_reg  <= $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
                sum_1_0_reg  <= $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
                sum_1_1_reg  <= $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
                diff_0_0_reg <= $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
                diff_0_1_reg <= $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);
                diff_1_0_reg <= $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
                diff_1_1_reg <= $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);
            end
        end
    end

    // Stage 2 Multiplications
    logic signed [32:0] prod_0_0, prod_0_1, prod_1_0, prod_1_1;
    logic signed [32:0] prod_2_0, prod_2_1, prod_3_0, prod_3_1;

    assign prod_0_0 = sum_0_0_reg * H_COEFF;
    assign prod_0_1 = sum_0_1_reg * H_COEFF;
    assign prod_1_0 = sum_1_0_reg * H_COEFF;
    assign prod_1_1 = sum_1_1_reg * H_COEFF;
    assign prod_2_0 = diff_0_0_reg * H_COEFF;
    assign prod_2_1 = diff_0_1_reg * H_COEFF;
    assign prod_3_0 = diff_1_0_reg * H_COEFF;
    assign prod_3_1 = diff_1_1_reg * H_COEFF;

    // Shift to align to Q1.15
    logic signed [17:0] shift_0_0, shift_0_1, shift_1_0, shift_1_1;
    logic signed [17:0] shift_2_0, shift_2_1, shift_3_0, shift_3_1;

    assign shift_0_0 = prod_0_0 >>> 15;
    assign shift_0_1 = prod_0_1 >>> 15;
    assign shift_1_0 = prod_1_0 >>> 15;
    assign shift_1_1 = prod_1_1 >>> 15;
    assign shift_2_0 = prod_2_0 >>> 15;
    assign shift_2_1 = prod_2_1 >>> 15;
    assign shift_3_0 = prod_3_0 >>> 15;
    assign shift_3_1 = prod_3_1 >>> 15;

    // Saturation logic
    function automatic logic [15:0] saturate(logic signed [17:0] val);
        if (val[17:15] == 3'b000 || val[17:15] == 3'b111) begin
            return val[15:0];
        end else if (val[17]) begin
            return 16'h8000;
        end else begin
            return 16'h7FFF;
        end
    endfunction

    logic [15:0] sat_0_0, sat_0_1, sat_1_0, sat_1_1;
    logic [15:0] sat_2_0, sat_2_1, sat_3_0, sat_3_1;

    assign sat_0_0 = saturate(shift_0_0);
    assign sat_0_1 = saturate(shift_0_1);
    assign sat_1_0 = saturate(shift_1_0);
    assign sat_1_1 = saturate(shift_1_1);
    assign sat_2_0 = saturate(shift_2_0);
    assign sat_2_1 = saturate(shift_2_1);
    assign sat_3_0 = saturate(shift_3_0);
    assign sat_3_1 = saturate(shift_3_1);

    // Final Output Registers (incorporating the SWAP of qubits 0 and 1)
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_QSV_0_0 <= 16'd0;
            io_out_QSV_0_1 <= 16'd0;
            io_out_QSV_1_0 <= 16'd0;
            io_out_QSV_1_1 <= 16'd0;
            io_out_QSV_2_0 <= 16'd0;
            io_out_QSV_2_1 <= 16'd0;
            io_out_QSV_3_0 <= 16'd0;
            io_out_QSV_3_1 <= 16'd0;
            io_out_valid   <= 1'b0;
        end else begin
            io_out_valid   <= r1_valid;
            if (r1_valid) begin
                io_out_QSV_0_0 <= sat_0_0;
                io_out_QSV_0_1 <= sat_0_1;
                io_out_QSV_1_0 <= sat_1_0;
                io_out_QSV_1_1 <= sat_1_1;
                io_out_QSV_2_0 <= sat_2_0;
                io_out_QSV_2_1 <= sat_2_1;
                io_out_QSV_3_0 <= sat_3_0;
                io_out_QSV_3_1 <= sat_3_1;
            end
        end
    end

endmodule
