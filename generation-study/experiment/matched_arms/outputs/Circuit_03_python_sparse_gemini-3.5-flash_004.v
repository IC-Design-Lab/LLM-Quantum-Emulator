module Circuit_03 (
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

    function automatic logic [15:0] h_sum(input logic [15:0] a, input logic [15:0] b);
        logic signed [16:0] s;
        logic signed [16:0] coeff;
        logic signed [33:0] prod;
        s = $signed({a[15], a}) + $signed({b[15], b});
        coeff = 17'sd23170;
        prod = s * coeff;
        return prod[30:15];
    endfunction

    function automatic logic [15:0] h_diff(input logic [15:0] a, input logic [15:0] b);
        logic signed [16:0] d;
        logic signed [16:0] coeff;
        logic signed [33:0] prod;
        d = $signed({a[15], a}) - $signed({b[15], b});
        coeff = 17'sd23170;
        prod = d * coeff;
        return prod[30:15];
    endfunction

    // Pipeline Registers
    logic [15:0] r1_0_0, r1_0_1, r1_1_0, r1_1_1, r1_2_0, r1_2_1, r1_3_0, r1_3_1;
    logic        r1_valid;

    logic [15:0] r2_0_0, r2_0_1, r2_1_0, r2_1_1, r2_2_0, r2_2_1, r2_3_0, r2_3_1;
    logic        r2_valid;

    logic [15:0] r3_0_0, r3_0_1, r3_1_0, r3_1_1, r3_2_0, r3_2_1, r3_3_0, r3_3_1;
    logic        r3_valid;

    logic [15:0] r4_0_0, r4_0_1, r4_1_0, r4_1_1, r4_2_0, r4_2_1, r4_3_0, r4_3_1;
    logic        r4_valid;

    // Stage 1: qc.h(0)
    always_ff @(posedge clock) begin
        if (reset) begin
            r1_0_0   <= 16'h0;
            r1_0_1   <= 16'h0;
            r1_1_0   <= 16'h0;
            r1_1_1   <= 16'h0;
            r1_2_0   <= 16'h0;
            r1_2_1   <= 16'h0;
            r1_3_0   <= 16'h0;
            r1_3_1   <= 16'h0;
            r1_valid <= 1'b0;
        end else begin
            r1_valid <= io_in_valid;
            if (io_in_valid) begin
                r1_0_0 <= h_sum(io_in_QSV_0_0, io_in_QSV_1_0);
                r1_0_1 <= h_sum(io_in_QSV_0_1, io_in_QSV_1_1);
                r1_1_0 <= h_diff(io_in_QSV_0_0, io_in_QSV_1_0);
                r1_1_1 <= h_diff(io_in_QSV_0_1, io_in_QSV_1_1);
                r1_2_0 <= h_sum(io_in_QSV_2_0, io_in_QSV_3_0);
                r1_2_1 <= h_sum(io_in_QSV_2_1, io_in_QSV_3_1);
                r1_3_0 <= h_diff(io_in_QSV_2_0, io_in_QSV_3_0);
                r1_3_1 <= h_diff(io_in_QSV_2_1, io_in_QSV_3_1);
            end
        end
    end

    // Stage 2: qc.x(1)
    always_ff @(posedge clock) begin
        if (reset) begin
            r2_0_0   <= 16'h0;
            r2_0_1   <= 16'h0;
            r2_1_0   <= 16'h0;
            r2_1_1   <= 16'h0;
            r2_2_0   <= 16'h0;
            r2_2_1   <= 16'h0;
            r2_3_0   <= 16'h0;
            r2_3_1   <= 16'h0;
            r2_valid <= 1'b0;
        end else begin
            r2_valid <= r1_valid;
            if (r1_valid) begin
                r2_0_0 <= r1_2_0;
                r2_0_1 <= r1_2_1;
                r2_1_0 <= r1_3_0;
                r2_1_1 <= r1_3_1;
                r2_2_0 <= r1_0_0;
                r2_2_1 <= r1_0_1;
                r2_3_0 <= r1_1_0;
                r2_3_1 <= r1_1_1;
            end
        end
    end

    // Stage 3: qc.h(1)
    always_ff @(posedge clock) begin
        if (reset) begin
            r3_0_0   <= 16'h0;
            r3_0_1   <= 16'h0;
            r3_1_0   <= 16'h0;
            r3_1_1   <= 16'h0;
            r3_2_0   <= 16'h0;
            r3_2_1   <= 16'h0;
            r3_3_0   <= 16'h0;
            r3_3_1   <= 16'h0;
            r3_valid <= 1'b0;
        end else begin
            r3_valid <= r2_valid;
            if (r2_valid) begin
                r3_0_0 <= h_sum(r2_0_0, r2_2_0);
                r3_0_1 <= h_sum(r2_0_1, r2_2_1);
                r3_2_0 <= h_diff(r2_0_0, r2_2_0);
                r3_2_1 <= h_diff(r2_0_1, r2_2_1);
                r3_1_0 <= h_sum(r2_1_0, r2_3_0);
                r3_1_1 <= h_sum(r2_1_1, r2_3_1);
                r3_3_0 <= h_diff(r2_1_0, r2_3_0);
                r3_3_1 <= h_diff(r2_1_1, r2_3_1);
            end
        end
    end

    // Stage 4: qc.swap(0, 1)
    always_ff @(posedge clock) begin
        if (reset) begin
            r4_0_0   <= 16'h0;
            r4_0_1   <= 16'h0;
            r4_1_0   <= 16'h0;
            r4_1_1   <= 16'h0;
            r4_2_0   <= 16'h0;
            r4_2_1   <= 16'h0;
            r4_3_0   <= 16'h0;
            r4_3_1   <= 16'h0;
            r4_valid <= 1'b0;
        end else begin
            r4_valid <= r3_valid;
            if (r3_valid) begin
                r4_0_0 <= r3_0_0;
                r4_0_1 <= r3_0_1;
                r4_1_0 <= r3_2_0;
                r4_1_1 <= r3_2_1;
                r4_2_0 <= r3_1_0;
                r4_2_1 <= r3_1_1;
                r4_3_0 <= r3_3_0;
                r4_3_1 <= r3_3_1;
            end
        end
    end

    // Output assignments
    assign io_out_QSV_0_0 = r4_0_0;
    assign io_out_QSV_0_1 = r4_0_1;
    assign io_out_QSV_1_0 = r4_1_0;
    assign io_out_QSV_1_1 = r4_1_1;
    assign io_out_QSV_2_0 = r4_2_0;
    assign io_out_QSV_2_1 = r4_2_1;
    assign io_out_QSV_3_0 = r4_3_0;
    assign io_out_QSV_3_1 = r4_3_1;
    assign io_out_valid   = r4_valid;

endmodule
