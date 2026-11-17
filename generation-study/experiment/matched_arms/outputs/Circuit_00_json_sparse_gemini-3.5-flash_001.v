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

    // Stage 1: Hadamard Gate on Qubit 0
    // H_COEFF = 1/sqrt(2) approx 0.70710678 * 32768 = 23170
    localparam signed [16:0] H_COEFF = 17'sd23170;

    reg signed [15:0] r1_QSV_0_0, r1_QSV_0_1;
    reg signed [15:0] r1_QSV_1_0, r1_QSV_1_1;
    reg signed [15:0] r1_QSV_2_0, r1_QSV_2_1;
    reg signed [15:0] r1_QSV_3_0, r1_QSV_3_1;
    reg               r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_QSV_0_0 <= '0;
            r1_QSV_0_1 <= '0;
            r1_QSV_1_0 <= '0;
            r1_QSV_1_1 <= '0;
            r1_QSV_2_0 <= '0;
            r1_QSV_2_1 <= '0;
            r1_QSV_3_0 <= '0;
            r1_QSV_3_1 <= '0;
            r1_valid   <= 1'b0;
        end else begin
            r1_valid <= io_in_valid;
            if (io_in_valid) begin
                r1_QSV_0_0 <= 16'((($signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0)) * H_COEFF) >>> 15);
                r1_QSV_0_1 <= 16'((($signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1)) * H_COEFF) >>> 15);
                
                r1_QSV_1_0 <= 16'((($signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0)) * H_COEFF) >>> 15);
                r1_QSV_1_1 <= 16'((($signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1)) * H_COEFF) >>> 15);
                
                r1_QSV_2_0 <= 16'((($signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0)) * H_COEFF) >>> 15);
                r1_QSV_2_1 <= 16'((($signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1)) * H_COEFF) >>> 15);
                
                r1_QSV_3_0 <= 16'((($signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0)) * H_COEFF) >>> 15);
                r1_QSV_3_1 <= 16'((($signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1)) * H_COEFF) >>> 15);
            end
        end
    end

    // Stage 2: Swap Gate on Qubits 0 and 1
    // (Swaps State 1 and State 2)
    reg signed [15:0] r2_QSV_0_0, r2_QSV_0_1;
    reg signed [15:0] r2_QSV_1_0, r2_QSV_1_1;
    reg signed [15:0] r2_QSV_2_0, r2_QSV_2_1;
    reg signed [15:0] r2_QSV_3_0, r2_QSV_3_1;
    reg               r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_QSV_0_0 <= '0;
            r2_QSV_0_1 <= '0;
            r2_QSV_1_0 <= '0;
            r2_QSV_1_1 <= '0;
            r2_QSV_2_0 <= '0;
            r2_QSV_2_1 <= '0;
            r2_QSV_3_0 <= '0;
            r2_QSV_3_1 <= '0;
            r2_valid   <= 1'b0;
        end else begin
            r2_valid <= r1_valid;
            if (r1_valid) begin
                r2_QSV_0_0 <= r1_QSV_0_0;
                r2_QSV_0_1 <= r1_QSV_0_1;
                
                r2_QSV_1_0 <= r1_QSV_2_0;
                r2_QSV_1_1 <= r1_QSV_2_1;
                
                r2_QSV_2_0 <= r1_QSV_1_0;
                r2_QSV_2_1 <= r1_QSV_1_1;
                
                r2_QSV_3_0 <= r1_QSV_3_0;
                r2_QSV_3_1 <= r1_QSV_3_1;
            end
        end
    end

    // Output Assignment
    assign io_out_QSV_0_0 = r2_QSV_0_0;
    assign io_out_QSV_0_1 = r2_QSV_0_1;
    assign io_out_QSV_1_0 = r2_QSV_1_0;
    assign io_out_QSV_1_1 = r2_QSV_1_1;
    assign io_out_QSV_2_0 = r2_QSV_2_0;
    assign io_out_QSV_2_1 = r2_QSV_2_1;
    assign io_out_QSV_3_0 = r2_QSV_3_0;
    assign io_out_QSV_3_1 = r2_QSV_3_1;
    assign io_out_valid   = r2_valid;

endmodule
