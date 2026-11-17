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

    // Stage 1: Input Registers
    logic [15:0] r_in_0_0, r_in_0_1, r_in_1_0, r_in_1_1;
    logic [15:0] r_in_2_0, r_in_2_1, r_in_3_0, r_in_3_1;
    logic        r_in_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_in_0_0   <= 16'b0;
            r_in_0_1   <= 16'b0;
            r_in_1_0   <= 16'b0;
            r_in_1_1   <= 16'b0;
            r_in_2_0   <= 16'b0;
            r_in_2_1   <= 16'b0;
            r_in_3_0   <= 16'b0;
            r_in_3_1   <= 16'b0;
            r_in_valid <= 1'b0;
        end else begin
            r_in_0_0   <= io_in_QSV_0_0;
            r_in_0_1   <= io_in_QSV_0_1;
            r_in_1_0   <= io_in_QSV_1_0;
            r_in_1_1   <= io_in_QSV_1_1;
            r_in_2_0   <= io_in_QSV_2_0;
            r_in_2_1   <= io_in_QSV_2_1;
            r_in_3_0   <= io_in_QSV_3_0;
            r_in_3_1   <= io_in_QSV_3_1;
            r_in_valid <= io_in_valid;
        end
    end

    // Hadamard Combinational Logic (Q1.15 fixed-point arithmetic)
    localparam bit signed [16:0] INV_SQRT2 = 17'sd23170; // 1/sqrt(2) approx 0.7071

    wire signed [16:0] sum_0_1_re  = $signed(r_in_0_0) + $signed(r_in_1_0);
    wire signed [16:0] sum_0_1_im  = $signed(r_in_0_1) + $signed(r_in_1_1);
    wire signed [16:0] diff_0_1_re = $signed(r_in_0_0) - $signed(r_in_1_0);
    wire signed [16:0] diff_0_1_im = $signed(r_in_0_1) - $signed(r_in_1_1);

    wire signed [16:0] sum_2_3_re  = $signed(r_in_2_0) + $signed(r_in_3_0);
    wire signed [16:0] sum_2_3_im  = $signed(r_in_2_1) + $signed(r_in_3_1);
    wire signed [16:0] diff_2_3_re = $signed(r_in_2_0) - $signed(r_in_3_0);
    wire signed [16:0] diff_2_3_im = $signed(r_in_2_1) - $signed(r_in_3_1);

    wire signed [33:0] prod_0_0 = sum_0_1_re * INV_SQRT2;
    wire signed [33:0] prod_0_1 = sum_0_1_im * INV_SQRT2;
    wire signed [33:0] prod_1_0 = diff_0_1_re * INV_SQRT2;
    wire signed [33:0] prod_1_1 = diff_0_1_im * INV_SQRT2;

    wire signed [33:0] prod_2_0 = sum_2_3_re * INV_SQRT2;
    wire signed [33:0] prod_2_1 = sum_2_3_im * INV_SQRT2;
    wire signed [33:0] prod_3_0 = diff_2_3_re * INV_SQRT2;
    wire signed [33:0] prod_3_1 = diff_2_3_im * INV_SQRT2;

    // Stage 2: Hadamard Register Stage
    logic [15:0] r_h_0_0, r_h_0_1, r_h_1_0, r_h_1_1;
    logic [15:0] r_h_2_0, r_h_2_1, r_h_3_0, r_h_3_1;
    logic        r_h_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_h_0_0   <= 16'b0;
            r_h_0_1   <= 16'b0;
            r_h_1_0   <= 16'b0;
            r_h_1_1   <= 16'b0;
            r_h_2_0   <= 16'b0;
            r_h_2_1   <= 16'b0;
            r_h_3_0   <= 16'b0;
            r_h_3_1   <= 16'b0;
            r_h_valid <= 1'b0;
        end else begin
            r_h_0_0   <= prod_0_0[30:15];
            r_h_0_1   <= prod_0_1[30:15];
            r_h_1_0   <= prod_1_0[30:15];
            r_h_1_1   <= prod_1_1[30:15];
            r_h_2_0   <= prod_2_0[30:15];
            r_h_2_1   <= prod_2_1[30:15];
            r_h_3_0   <= prod_3_0[30:15];
            r_h_3_1   <= prod_3_1[30:15];
            r_h_valid <= r_in_valid;
        end
    end

    // Stage 3: SWAP Stage and Output Registers
    logic [15:0] r_out_0_0, r_out_0_1, r_out_1_0, r_out_1_1;
    logic [15:0] r_out_2_0, r_out_2_1, r_out_3_0, r_out_3_1;
    logic        r_out_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_out_0_0   <= 16'b0;
            r_out_0_1   <= 16'b0;
            r_out_1_0   <= 16'b0;
            r_out_1_1   <= 16'b0;
            r_out_2_0   <= 16'b0;
            r_out_2_1   <= 16'b0;
            r_out_3_0   <= 16'b0;
            r_out_3_1   <= 16'b0;
            r_out_valid <= 1'b0;
        end else begin
            // SWAP gate exchanges state indices |01> and |10> (indices 1 and 2)
            r_out_0_0   <= r_h_0_0;
            r_out_0_1   <= r_h_0_1;
            
            r_out_1_0   <= r_h_2_0;
            r_out_1_1   <= r_h_2_1;
            
            r_out_2_0   <= r_h_1_0;
            r_out_2_1   <= r_h_1_1;
            
            r_out_3_0   <= r_h_3_0;
            r_out_3_1   <= r_h_3_1;
            
            r_out_valid <= r_h_valid;
        end
    end

    // Output assignments
    assign io_out_QSV_0_0 = r_out_0_0;
    assign io_out_QSV_0_1 = r_out_0_1;
    assign io_out_QSV_1_0 = r_out_1_0;
    assign io_out_QSV_1_1 = r_out_1_1;
    assign io_out_QSV_2_0 = r_out_2_0;
    assign io_out_QSV_2_1 = r_out_2_1;
    assign io_out_QSV_3_0 = r_out_3_0;
    assign io_out_QSV_3_1 = r_out_3_1;
    assign io_out_valid   = r_out_valid;

endmodule
