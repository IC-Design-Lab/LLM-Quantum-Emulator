module Circuit_00 (
    input  wire        clock,
    input  wire        reset,
    input  wire [15:0] io_in_QSV_0_0,
    input  wire [15:0] io_in_QSV_0_1,
    input  wire [15:0] io_in_QSV_1_0,
    input  wire [15:0] io_in_QSV_1_1,
    input  wire [15:0] io_in_QSV_2_0,
    input  wire [15:0] io_in_QSV_2_1,
    input  wire [15:0] io_in_QSV_3_0,
    input  wire [15:0] io_in_QSV_3_1,
    input  wire        io_in_valid,
    output wire [15:0] io_out_QSV_0_0,
    output wire [15:0] io_out_QSV_0_1,
    output wire [15:0] io_out_QSV_1_0,
    output wire [15:0] io_out_QSV_1_1,
    output wire [15:0] io_out_QSV_2_0,
    output wire [15:0] io_out_QSV_2_1,
    output wire [15:0] io_out_QSV_3_0,
    output wire [15:0] io_out_QSV_3_1,
    output wire        io_out_valid
);

    localparam signed [15:0] INV_SQRT2 = 16'sd23170;

    // Stage 1: Hadamard Gate Calculations
    wire signed [16:0] sum_0_0 = $signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0);
    wire signed [16:0] diff_0_0 = $signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0);
    wire signed [16:0] sum_0_1 = $signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1);
    wire signed [16:0] diff_0_1 = $signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1);

    wire signed [16:0] sum_2_0 = $signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0);
    wire signed [16:0] diff_2_0 = $signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0);
    wire signed [16:0] sum_2_1 = $signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1);
    wire signed [16:0] diff_2_1 = $signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1);

    wire signed [32:0] prod_sum_0_0  = sum_0_0 * INV_SQRT2;
    wire signed [32:0] prod_diff_0_0 = diff_0_0 * INV_SQRT2;
    wire signed [32:0] prod_sum_0_1  = sum_0_1 * INV_SQRT2;
    wire signed [32:0] prod_diff_0_1 = diff_0_1 * INV_SQRT2;

    wire signed [32:0] prod_sum_2_0  = sum_2_0 * INV_SQRT2;
    wire signed [32:0] prod_diff_2_0 = diff_2_0 * INV_SQRT2;
    wire signed [32:0] prod_sum_2_1  = sum_2_1 * INV_SQRT2;
    wire signed [32:0] prod_diff_2_1 = diff_2_1 * INV_SQRT2;

    wire [15:0] next_r1_QSV_0_0 = prod_sum_0_0[30:15];
    wire [15:0] next_r1_QSV_1_0 = prod_diff_0_0[30:15];
    wire [15:0] next_r1_QSV_0_1 = prod_sum_0_1[30:15];
    wire [15:0] next_r1_QSV_1_1 = prod_diff_0_1[30:15];

    wire [15:0] next_r1_QSV_2_0 = prod_sum_2_0[30:15];
    wire [15:0] next_r1_QSV_3_0 = prod_diff_2_0[30:15];
    wire [15:0] next_r1_QSV_2_1 = prod_sum_2_1[30:15];
    wire [15:0] next_r1_QSV_3_1 = prod_diff_2_1[30:15];

    reg [15:0] r1_QSV_0_0, r1_QSV_0_1;
    reg [15:0] r1_QSV_1_0, r1_QSV_1_1;
    reg [15:0] r1_QSV_2_0, r1_QSV_2_1;
    reg [15:0] r1_QSV_3_0, r1_QSV_3_1;
    reg        r1_valid;

    always @(posedge clock) begin
        if (reset) begin
            r1_QSV_0_0 <= 16'd0;
            r1_QSV_0_1 <= 16'd0;
            r1_QSV_1_0 <= 16'd0;
            r1_QSV_1_1 <= 16'd0;
            r1_QSV_2_0 <= 16'd0;
            r1_QSV_2_1 <= 16'd0;
            r1_QSV_3_0 <= 16'd0;
            r1_QSV_3_1 <= 16'd0;
            r1_valid   <= 1'b0;
        end else begin
            r1_valid <= io_in_valid;
            if (io_in_valid) begin
                r1_QSV_0_0 <= next_r1_QSV_0_0;
                r1_QSV_0_1 <= next_r1_QSV_0_1;
                r1_QSV_1_0 <= next_r1_QSV_1_0;
                r1_QSV_1_1 <= next_r1_QSV_1_1;
                r1_QSV_2_0 <= next_r1_QSV_2_0;
                r1_QSV_2_1 <= next_r1_QSV_2_1;
                r1_QSV_3_0 <= next_r1_QSV_3_0;
                r1_QSV_3_1 <= next_r1_QSV_3_1;
            end
        end
    end

    // Stage 2: Swap Gate Registering
    reg [15:0] r2_QSV_0_0, r2_QSV_0_1;
    reg [15:0] r2_QSV_1_0, r2_QSV_1_1;
    reg [15:0] r2_QSV_2_0, r2_QSV_2_1;
    reg [15:0] r2_QSV_3_0, r2_QSV_3_1;
    reg        r2_valid;

    always @(posedge clock) begin
        if (reset) begin
            r2_QSV_0_0 <= 16'd0;
            r2_QSV_0_1 <= 16'd0;
            r2_QSV_1_0 <= 16'd0;
            r2_QSV_1_1 <= 16'd0;
            r2_QSV_2_0 <= 16'd0;
            r2_QSV_2_1 <= 16'd0;
            r2_QSV_3_0 <= 16'd0;
            r2_QSV_3_1 <= 16'd0;
            r2_valid   <= 1'b0;
        end else begin
            r2_valid <= r1_valid;
            if (r1_valid) begin
                r2_QSV_0_0 <= r1_QSV_0_0;
                r2_QSV_0_1 <= r1_QSV_0_1;
                r2_QSV_1_0 <= r1_QSV_2_0; // Swapped (1 <-> 2)
                r2_QSV_1_1 <= r1_QSV_2_1; // Swapped (1 <-> 2)
                r2_QSV_2_0 <= r1_QSV_1_0; // Swapped (1 <-> 2)
                r2_QSV_2_1 <= r1_QSV_1_1; // Swapped (1 <-> 2)
                r2_QSV_3_0 <= r1_QSV_3_0;
                r2_QSV_3_1 <= r1_QSV_3_1;
            end
        end
    end

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
