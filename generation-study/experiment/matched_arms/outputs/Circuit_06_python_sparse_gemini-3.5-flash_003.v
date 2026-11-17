module Circuit_06 (
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

    // Scaling functions for Hadamard gate (1/sqrt(2) approx 23170 / 32768)
    function automatic logic [15:0] scale_add(logic [15:0] a, logic [15:0] b);
        logic signed [16:0] sum;
        logic signed [32:0] prod;
        logic signed [32:0] prod_shifted;
        sum = $signed(a) + $signed(b);
        prod = sum * 17'sd23170;
        prod_shifted = prod >>> 15;
        return prod_shifted[15:0];
    endfunction

    function automatic logic [15:0] scale_sub(logic [15:0] a, logic [15:0] b);
        logic signed [16:0] diff;
        logic signed [32:0] prod;
        logic signed [32:0] prod_shifted;
        diff = $signed(a) - $signed(b);
        prod = diff * 17'sd23170;
        prod_shifted = prod >>> 15;
        return prod_shifted[15:0];
    endfunction

    // Stage 1 Registers: H(0)
    logic [15:0] h_0_0, h_0_1, h_1_0, h_1_1, h_2_0, h_2_1, h_3_0, h_3_1;
    logic        r_valid_1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            h_0_0     <= 16'd0;
            h_0_1     <= 16'd0;
            h_1_0     <= 16'd0;
            h_1_1     <= 16'd0;
            h_2_0     <= 16'd0;
            h_2_1     <= 16'd0;
            h_3_0     <= 16'd0;
            h_3_1     <= 16'd0;
            r_valid_1 <= 1'b0;
        end begin
            r_valid_1 <= io_in_valid;
            if (io_in_valid) begin
                h_0_0 <= scale_add(io_in_QSV_0_0, io_in_QSV_1_0);
                h_0_1 <= scale_add(io_in_QSV_0_1, io_in_QSV_1_1);
                h_1_0 <= scale_sub(io_in_QSV_0_0, io_in_QSV_1_0);
                h_1_1 <= scale_sub(io_in_QSV_0_1, io_in_QSV_1_1);
                
                h_2_0 <= scale_add(io_in_QSV_2_0, io_in_QSV_3_0);
                h_2_1 <= scale_add(io_in_QSV_2_1, io_in_QSV_3_1);
                h_3_0 <= scale_sub(io_in_QSV_2_0, io_in_QSV_3_0);
                h_3_1 <= scale_sub(io_in_QSV_2_1, io_in_QSV_3_1);
            end
        end
    end

    // Stage 2 Registers: CX(0, 1) -> Swaps states 1 and 3
    logic [15:0] r_out_0_0, r_out_0_1, r_out_1_0, r_out_1_1, r_out_2_0, r_out_2_1, r_out_3_0, r_out_3_1;
    logic        r_valid_2;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r_out_0_0 <= 16'd0;
            r_out_0_1 <= 16'd0;
            r_out_1_0 <= 16'd0;
            r_out_1_1 <= 16'd0;
            r_out_2_0 <= 16'd0;
            r_out_2_1 <= 16'd0;
            r_out_3_0 <= 16'd0;
            r_out_3_1 <= 16'd0;
            r_valid_2 <= 1'b0;
        end else begin
            r_valid_2 <= r_valid_1;
            if (r_valid_1) begin
                r_out_0_0 <= h_0_0;
                r_out_0_1 <= h_0_1;
                r_out_1_0 <= h_3_0; // CX swap
                r_out_1_1 <= h_3_1; // CX swap
                r_out_2_0 <= h_2_0;
                r_out_2_1 <= h_2_1;
                r_out_3_0 <= h_1_0; // CX swap
                r_out_3_1 <= h_1_1; // CX swap
            end
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
    assign io_out_valid   = r_valid_2;

endmodule
