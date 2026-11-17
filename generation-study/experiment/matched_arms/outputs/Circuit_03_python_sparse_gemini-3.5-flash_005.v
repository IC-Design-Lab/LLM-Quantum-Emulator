module H_gate (
    input  logic signed [15:0] in_a_r,
    input  logic signed [15:0] in_a_i,
    input  logic signed [15:0] in_b_r,
    input  logic signed [15:0] in_b_i,
    output logic signed [15:0] out_a_r,
    output logic signed [15:0] out_a_i,
    output logic signed [15:0] out_b_r,
    output logic signed [15:0] out_b_i
);
    localparam logic signed [15:0] INV_SQRT2 = 16'h5A82;

    logic signed [16:0] sum_r, diff_r;
    logic signed [16:0] sum_i, diff_i;

    assign sum_r  = in_a_r + in_b_r;
    assign diff_r = in_a_r - in_b_r;
    assign sum_i  = in_a_i + in_b_i;
    assign diff_i = in_a_i - in_b_i;

    logic signed [32:0] prod_sum_r, prod_diff_r;
    logic signed [32:0] prod_sum_i, prod_diff_i;

    assign prod_sum_r  = sum_r  * INV_SQRT2;
    assign prod_diff_r = diff_r * INV_SQRT2;
    assign prod_sum_i  = sum_i  * INV_SQRT2;
    assign prod_diff_i = diff_i * INV_SQRT2;

    assign out_a_r = prod_sum_r[30:15];
    assign out_b_r = prod_diff_r[30:15];
    assign out_a_i = prod_sum_i[30:15];
    assign out_b_i = prod_diff_i[30:15];
endmodule

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

    // Stage 0 Signals
    logic signed [15:0] s0_r [0:3];
    logic signed [15:0] s0_i [0:3];
    logic s0_valid;

    assign s0_r[0] = $signed(io_in_QSV_0_0);
    assign s0_i[0] = $signed(io_in_QSV_0_1);
    assign s0_r[1] = $signed(io_in_QSV_1_0);
    assign s0_i[1] = $signed(io_in_QSV_1_1);
    assign s0_r[2] = $signed(io_in_QSV_2_0);
    assign s0_i[2] = $signed(io_in_QSV_2_1);
    assign s0_r[3] = $signed(io_in_QSV_3_0);
    assign s0_i[3] = $signed(io_in_QSV_3_1);
    assign s0_valid = io_in_valid;

    // Stage 1: qc.h(0) (acts on (0, 1) and (2, 3))
    logic signed [15:0] h0_out_r [0:3];
    logic signed [15:0] h0_out_i [0:3];

    H_gate inst_h0_pair0 (
        .in_a_r(s0_r[0]), .in_a_i(s0_i[0]),
        .in_b_r(s0_r[1]), .in_b_i(s0_i[1]),
        .out_a_r(h0_out_r[0]), .out_a_i(h0_out_i[0]),
        .out_b_r(h0_out_r[1]), .out_b_i(h0_out_i[1])
    );

    H_gate inst_h0_pair1 (
        .in_a_r(s0_r[2]), .in_a_i(s0_i[2]),
        .in_b_r(s0_r[3]), .in_b_i(s0_i[3]),
        .out_a_r(h0_out_r[2]), .out_a_i(h0_out_i[2]),
        .out_b_r(h0_out_r[3]), .out_b_i(h0_out_i[3])
    );

    logic signed [15:0] s1_r [0:3];
    logic signed [15:0] s1_i [0:3];
    logic s1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s1_valid <= 1'b0;
            s1_r[0]  <= '0; s1_i[0] <= '0;
            s1_r[1]  <= '0; s1_i[1] <= '0;
            s1_r[2]  <= '0; s1_i[2] <= '0;
            s1_r[3]  <= '0; s1_i[3] <= '0;
        end else begin
            s1_valid <= s0_valid;
            if (s0_valid) begin
                s1_r[0] <= h0_out_r[0]; s1_i[0] <= h0_out_i[0];
                s1_r[1] <= h0_out_r[1]; s1_i[1] <= h0_out_i[1];
                s1_r[2] <= h0_out_r[2]; s1_i[2] <= h0_out_i[2];
                s1_r[3] <= h0_out_r[3]; s1_i[3] <= h0_out_i[3];
            end
        end
    end

    // Stage 2: qc.x(1) (permutation swapping 0<->2 and 1<->3)
    logic signed [15:0] x1_out_r [0:3];
    logic signed [15:0] x1_out_i [0:3];

    assign x1_out_r[0] = s1_r[2];
    assign x1_out_i[0] = s1_i[2];
    assign x1_out_r[2] = s1_r[0];
    assign x1_out_i[2] = s1_i[0];

    assign x1_out_r[1] = s1_r[3];
    assign x1_out_i[1] = s1_i[3];
    assign x1_out_r[3] = s1_r[1];
    assign x1_out_i[3] = s1_i[1];

    logic signed [15:0] s2_r [0:3];
    logic signed [15:0] s2_i [0:3];
    logic s2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s2_valid <= 1'b0;
            s2_r[0]  <= '0; s2_i[0] <= '0;
            s2_r[1]  <= '0; s2_i[1] <= '0;
            s2_r[2]  <= '0; s2_i[2] <= '0;
            s2_r[3]  <= '0; s2_i[3] <= '0;
        end else begin
            s2_valid <= s1_valid;
            if (s1_valid) begin
                s2_r[0] <= x1_out_r[0]; s2_i[0] <= x1_out_i[0];
                s2_r[1] <= x1_out_r[1]; s2_i[1] <= x1_out_i[1];
                s2_r[2] <= x1_out_r[2]; s2_i[2] <= x1_out_i[2];
                s2_r[3] <= x1_out_r[3]; s2_i[3] <= x1_out_i[3];
            end
        end
    end

    // Stage 3: qc.h(1) (acts on (0, 2) and (1, 3))
    logic signed [15:0] h1_out_r [0:3];
    logic signed [15:0] h1_out_i [0:3];

    H_gate inst_h1_pair0 (
        .in_a_r(s2_r[0]), .in_a_i(s2_i[0]),
        .in_b_r(s2_r[2]), .in_b_i(s2_i[2]),
        .out_a_r(h1_out_r[0]), .out_a_i(h1_out_i[0]),
        .out_b_r(h1_out_r[2]), .out_b_i(h1_out_i[2])
    );

    H_gate inst_h1_pair1 (
        .in_a_r(s2_r[1]), .in_a_i(s2_i[1]),
        .in_b_r(s2_r[3]), .in_b_i(s2_i[3]),
        .out_a_r(h1_out_r[1]), .out_a_i(h1_out_i[1]),
        .out_b_r(h1_out_r[3]), .out_b_i(h1_out_i[3])
    );

    logic signed [15:0] s3_r [0:3];
    logic signed [15:0] s3_i [0:3];
    logic s3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s3_valid <= 1'b0;
            s3_r[0]  <= '0; s3_i[0] <= '0;
            s3_r[1]  <= '0; s3_i[1] <= '0;
            s3_r[2]  <= '0; s3_i[2] <= '0;
            s3_r[3]  <= '0; s3_i[3] <= '0;
        end else begin
            s3_valid <= s2_valid;
            if (s2_valid) begin
                s3_r[0] <= h1_out_r[0]; s3_i[0] <= h1_out_i[0];
                s3_r[1] <= h1_out_r[1]; s3_i[1] <= h1_out_i[1];
                s3_r[2] <= h1_out_r[2]; s3_i[2] <= h1_out_i[2];
                s3_r[3] <= h1_out_r[3]; s3_i[3] <= h1_out_i[3];
            end
        end
    end

    // Stage 4: qc.swap(0, 1) (permutation swapping 1<->2)
    logic signed [15:0] swap_out_r [0:3];
    logic signed [15:0] swap_out_i [0:3];

    assign swap_out_r[0] = s3_r[0];
    assign swap_out_i[0] = s3_i[0];
    assign swap_out_r[1] = s3_r[2];
    assign swap_out_i[1] = s3_i[2];
    assign swap_out_r[2] = s3_r[1];
    assign swap_out_i[2] = s3_i[1];
    assign swap_out_r[3] = s3_r[3];
    assign swap_out_i[3] = s3_i[3];

    logic signed [15:0] s4_r [0:3];
    logic signed [15:0] s4_i [0:3];
    logic s4_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s4_valid <= 1'b0;
            s4_r[0]  <= '0; s4_i[0] <= '0;
            s4_r[1]  <= '0; s4_i[1] <= '0;
            s4_r[2]  <= '0; s4_i[2] <= '0;
            s4_r[3]  <= '0; s4_i[3] <= '0;
        end else begin
            s4_valid <= s3_valid;
            if (s3_valid) begin
                s4_r[0] <= swap_out_r[0]; s4_i[0] <= swap_out_i[0];
                s4_r[1] <= swap_out_r[1]; s4_i[1] <= swap_out_i[1];
                s4_r[2] <= swap_out_r[2]; s4_i[2] <= swap_out_i[2];
                s4_r[3] <= swap_out_r[3]; s4_i[3] <= swap_out_i[3];
            end
        end
    end

    // Output Assignments
    assign io_out_QSV_0_0 = s4_r[0];
    assign io_out_QSV_0_1 = s4_i[0];
    assign io_out_QSV_1_0 = s4_r[1];
    assign io_out_QSV_1_1 = s4_i[1];
    assign io_out_QSV_2_0 = s4_r[2];
    assign io_out_QSV_2_1 = s4_i[2];
    assign io_out_QSV_3_0 = s4_r[3];
    assign io_out_QSV_3_1 = s4_i[3];
    assign io_out_valid   = s4_valid;

endmodule
