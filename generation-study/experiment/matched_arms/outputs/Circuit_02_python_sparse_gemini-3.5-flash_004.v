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

    // Cast inputs to signed for arithmetic safety
    wire signed [15:0] in_0_0 = io_in_QSV_0_0;
    wire signed [15:0] in_0_1 = io_in_QSV_0_1;
    wire signed [15:0] in_1_0 = io_in_QSV_1_0;
    wire signed [15:0] in_1_1 = io_in_QSV_1_1;
    wire signed [15:0] in_2_0 = io_in_QSV_2_0;
    wire signed [15:0] in_2_1 = io_in_QSV_2_1;
    wire signed [15:0] in_3_0 = io_in_QSV_3_0;
    wire signed [15:0] in_3_1 = io_in_QSV_3_1;

    // Stage 1 Registers
    logic signed [16:0] r1_sum_01_0;
    logic signed [16:0] r1_sum_01_1;
    logic signed [16:0] r1_diff_01_0;
    logic signed [16:0] r1_diff_01_1;
    
    logic signed [16:0] r1_sum_23_0;
    logic signed [16:0] r1_sum_23_1;
    logic signed [16:0] r1_diff_23_0;
    logic signed [16:0] r1_diff_23_1;
    
    logic r1_valid;

    // Intermediate calculations for Stage 2 (18-bit to prevent overflow before shift)
    wire signed [17:0] sum_0_0 = 18'(r1_sum_01_0) + 18'(r1_sum_23_0);
    wire signed [17:0] sum_0_1 = 18'(r1_sum_01_1) + 18'(r1_sum_23_1);
    
    wire signed [17:0] diff_1_0 = 18'(r1_sum_01_0) - 18'(r1_sum_23_0);
    wire signed [17:0] diff_1_1 = 18'(r1_sum_01_1) - 18'(r1_sum_23_1);
    
    wire signed [17:0] sum_2_0 = 18'(r1_diff_01_0) + 18'(r1_diff_23_0);
    wire signed [17:0] sum_2_1 = 18'(r1_diff_01_1) + 18'(r1_diff_23_1);
    
    wire signed [17:0] diff_3_0 = 18'(r1_diff_01_0) - 18'(r1_diff_23_0);
    wire signed [17:0] diff_3_1 = 18'(r1_diff_01_1) - 18'(r1_diff_23_1);

    // Stage 2 Registers
    logic signed [15:0] r2_out_0_0;
    logic signed [15:0] r2_out_0_1;
    logic signed [15:0] r2_out_1_0;
    logic signed [15:0] r2_out_1_1;
    logic signed [15:0] r2_out_2_0;
    logic signed [15:0] r2_out_2_1;
    logic signed [15:0] r2_out_3_0;
    logic signed [15:0] r2_out_3_1;
    
    logic r2_valid;

    // Sequential logic
    always_ff @(posedge clock) begin
        if (reset) begin
            r1_sum_01_0  <= '0;
            r1_sum_01_1  <= '0;
            r1_diff_01_0 <= '0;
            r1_diff_01_1 <= '0;
            r1_sum_23_0  <= '0;
            r1_sum_23_1  <= '0;
            r1_diff_23_0 <= '0;
            r1_diff_23_1 <= '0;
            r1_valid     <= 1'b0;

            r2_out_0_0   <= '0;
            r2_out_0_1   <= '0;
            r2_out_1_0   <= '0;
            r2_out_1_1   <= '0;
            r2_out_2_0   <= '0;
            r2_out_2_1   <= '0;
            r2_out_3_0   <= '0;
            r2_out_3_1   <= '0;
            r2_valid     <= 1'b0;
        end else begin
            // Stage 1
            r1_sum_01_0  <= in_0_0 + in_1_0;
            r1_sum_01_1  <= in_0_1 + in_1_1;
            r1_diff_01_0 <= in_0_0 - in_1_0;
            r1_diff_01_1 <= in_0_1 - in_1_1;
            
            r1_sum_23_0  <= in_2_0 + in_3_0;
            r1_sum_23_1  <= in_2_1 + in_3_1;
            r1_diff_23_0 <= in_2_0 - in_3_0;
            r1_diff_23_1 <= in_2_1 - in_3_1;
            
            r1_valid     <= io_in_valid;

            // Stage 2: Division by 2 (represented as shift / bit-slice [16:1])
            r2_out_0_0   <= sum_0_0[16:1];
            r2_out_0_1   <= sum_0_1[16:1];
            
            r2_out_1_0   <= diff_1_0[16:1];
            r2_out_1_1   <= diff_1_1[16:1];
            
            r2_out_2_0   <= sum_2_0[16:1];
            r2_out_2_1   <= sum_2_1[16:1];
            
            r2_out_3_0   <= diff_3_0[16:1];
            r2_out_3_1   <= diff_3_1[16:1];
            
            r2_valid     <= r1_valid;
        end
    end

    // Assign final outputs
    assign io_out_QSV_0_0 = r2_out_0_0;
    assign io_out_QSV_0_1 = r2_out_0_1;
    assign io_out_QSV_1_0 = r2_out_1_0;
    assign io_out_QSV_1_1 = r2_out_1_1;
    assign io_out_QSV_2_0 = r2_out_2_0;
    assign io_out_QSV_2_1 = r2_out_2_1;
    assign io_out_QSV_3_0 = r2_out_3_0;
    assign io_out_QSV_3_1 = r2_out_3_1;
    assign io_out_valid   = r2_valid;

endmodule
