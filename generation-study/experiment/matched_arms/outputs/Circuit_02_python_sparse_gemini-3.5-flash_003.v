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

    // Stage 1 Registers: H(0)
    logic signed [15:0] r1_qsv_0_0, r1_qsv_0_1;
    logic signed [15:0] r1_qsv_1_0, r1_qsv_1_1;
    logic signed [15:0] r1_qsv_2_0, r1_qsv_2_1;
    logic signed [15:0] r1_qsv_3_0, r1_qsv_3_1;
    logic               r1_valid;

    // Stage 2 Registers: H(1)
    logic signed [15:0] r2_qsv_0_0, r2_qsv_0_1;
    logic signed [15:0] r2_qsv_1_0, r2_qsv_1_1;
    logic signed [15:0] r2_qsv_2_0, r2_qsv_2_1;
    logic signed [15:0] r2_qsv_3_0, r2_qsv_3_1;
    logic               r2_valid;

    // Stage 3 Registers: SWAP(0, 1)
    logic signed [15:0] r3_qsv_0_0, r3_qsv_0_1;
    logic signed [15:0] r3_qsv_1_0, r3_qsv_1_1;
    logic signed [15:0] r3_qsv_2_0, r3_qsv_2_1;
    logic signed [15:0] r3_qsv_3_0, r3_qsv_3_1;
    logic               r3_valid;

    // Constant for 1/sqrt(2) in signed 16-bit fixed point (Q1.15)
    localparam bit signed [16:0] FACTOR = 17'sd23170;

    // Stage 1 logic
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_qsv_0_0 <= '0; r1_qsv_0_1 <= '0;
            r1_qsv_1_0 <= '0; r1_qsv_1_1 <= '0;
            r1_qsv_2_0 <= '0; r1_qsv_2_1 <= '0;
            r1_qsv_3_0 <= '0; r1_qsv_3_1 <= '0;
            r1_valid   <= 1'b0;
        end else begin
            r1_valid   <= io_in_valid;
            
            // H(0) on State 0 and State 1
            r1_qsv_0_0 <= 16'((signed'(io_in_QSV_0_0) + signed'(io_in_QSV_1_0)) * FACTOR >>> 15);
            r1_qsv_0_1 <= 16'((signed'(io_in_QSV_0_1) + signed'(io_in_QSV_1_1)) * FACTOR >>> 15);
            r1_qsv_1_0 <= 16'((signed'(io_in_QSV_0_0) - signed'(io_in_QSV_1_0)) * FACTOR >>> 15);
            r1_qsv_1_1 <= 16'((signed'(io_in_QSV_0_1) - signed'(io_in_QSV_1_1)) * FACTOR >>> 15);

            // H(0) on State 2 and State 3
            r1_qsv_2_0 <= 16'((signed'(io_in_QSV_2_0) + signed'(io_in_QSV_3_0)) * FACTOR >>> 15);
            r1_qsv_2_1 <= 16'((signed'(io_in_QSV_2_1) + signed'(io_in_QSV_3_1)) * FACTOR >>> 15);
            r1_qsv_3_0 <= 16'((signed'(io_in_QSV_2_0) - signed'(io_in_QSV_3_0)) * FACTOR >>> 15);
            r1_qsv_3_1 <= 16'((signed'(io_in_QSV_2_1) - signed'(io_in_QSV_3_1)) * FACTOR >>> 15);
        end
    end

    // Stage 2 logic
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_qsv_0_0 <= '0; r2_qsv_0_1 <= '0;
            r2_qsv_1_0 <= '0; r2_qsv_1_1 <= '0;
            r2_qsv_2_0 <= '0; r2_qsv_2_1 <= '0;
            r2_qsv_3_0 <= '0; r2_qsv_3_1 <= '0;
            r2_valid   <= 1'b0;
        end else begin
            r2_valid   <= r1_valid;

            // H(1) on State 0 and State 2
            r2_qsv_0_0 <= 16'((r1_qsv_0_0 + r1_qsv_2_0) * FACTOR >>> 15);
            r2_qsv_0_1 <= 16'((r1_qsv_0_1 + r1_qsv_2_1) * FACTOR >>> 15);
            r2_qsv_2_0 <= 16'((r1_qsv_0_0 - r1_qsv_2_0) * FACTOR >>> 15);
            r2_qsv_2_1 <= 16'((r1_qsv_0_1 - r1_qsv_2_1) * FACTOR >>> 15);

            // H(1) on State 1 and State 3
            r2_qsv_1_0 <= 16'((r1_qsv_1_0 + r1_qsv_3_0) * FACTOR >>> 15);
            r2_qsv_1_1 <= 16'((r1_qsv_1_1 + r1_qsv_3_1) * FACTOR >>> 15);
            r2_qsv_3_0 <= 16'((r1_qsv_1_0 - r1_qsv_3_0) * FACTOR >>> 15);
            r2_qsv_3_1 <= 16'((r1_qsv_1_1 - r1_qsv_3_1) * FACTOR >>> 15);
        end
    end

    // Stage 3 logic
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_qsv_0_0 <= '0; r3_qsv_0_1 <= '0;
            r3_qsv_1_0 <= '0; r3_qsv_1_1 <= '0;
            r3_qsv_2_0 <= '0; r3_qsv_2_1 <= '0;
            r3_qsv_3_0 <= '0; r3_qsv_3_1 <= '0;
            r3_valid   <= 1'b0;
        end else begin
            r3_valid   <= r2_valid;

            // State 0 and State 3 remain unchanged
            r3_qsv_0_0 <= r2_qsv_0_0;
            r3_qsv_0_1 <= r2_qsv_0_1;
            r3_qsv_3_0 <= r2_qsv_3_0;
            r3_qsv_3_1 <= r2_qsv_3_1;

            // Swap State 1 and State 2
            r3_qsv_1_0 <= r2_qsv_2_0;
            r3_qsv_1_1 <= r2_qsv_2_1;
            r3_qsv_2_0 <= r2_qsv_1_0;
            r3_qsv_2_1 <= r2_qsv_1_1;
        end
    end

    // Outputs assignment
    assign io_out_QSV_0_0 = logic'(r3_qsv_0_0);
    assign io_out_QSV_0_1 = logic'(r3_qsv_0_1);
    assign io_out_QSV_1_0 = logic'(r3_qsv_1_0);
    assign io_out_QSV_1_1 = logic'(r3_qsv_1_1);
    assign io_out_QSV_2_0 = logic'(r3_qsv_2_0);
    assign io_out_QSV_2_1 = logic'(r3_qsv_2_1);
    assign io_out_QSV_3_0 = logic'(r3_qsv_3_0);
    assign io_out_QSV_3_1 = logic'(r3_qsv_3_1);
    assign io_out_valid   = r3_valid;

endmodule
