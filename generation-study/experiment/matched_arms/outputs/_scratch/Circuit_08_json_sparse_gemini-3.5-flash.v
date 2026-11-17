module Circuit_08 (
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

    // Cast inputs to signed
    wire signed [15:0] s0_in_r [4];
    wire signed [15:0] s0_in_i [4];

    assign s0_in_r[0] = signed'(io_in_QSV_0_0);
    assign s0_in_i[0] = signed'(io_in_QSV_0_1);
    assign s0_in_r[1] = signed'(io_in_QSV_1_0);
    assign s0_in_i[1] = signed'(io_in_QSV_1_1);
    assign s0_in_r[2] = signed'(io_in_QSV_2_0);
    assign s0_in_i[2] = signed'(io_in_QSV_2_1);
    assign s0_in_r[3] = signed'(io_in_QSV_3_0);
    assign s0_in_i[3] = signed'(io_in_QSV_3_1);

    // Step 0: H gate on qubit 0 (pairs 0-1, 2-3)
    // COEFF_H = 1/\sqrt{2} \approx 23170 (Q1.15)
    wire signed [16:0] sum_01_r = s0_in_r[0] + s0_in_r[1];
    wire signed [16:0] sum_01_i = s0_in_i[0] + s0_in_i[1];
    wire signed [16:0] diff_01_r = s0_in_r[0] - s0_in_r[1];
    wire signed [16:0] diff_01_i = s0_in_i[0] - s0_in_i[1];

    wire signed [16:0] sum_23_r = s0_in_r[2] + s0_in_r[3];
    wire signed [16:0] sum_23_i = s0_in_i[2] + s0_in_i[3];
    wire signed [16:0] diff_23_r = s0_in_r[2] - s0_in_r[3];
    wire signed [16:0] diff_23_i = s0_in_i[2] - s0_in_i[3];

    wire signed [32:0] h_01_r_0 = sum_01_r * 16'sd23170;
    wire signed [32:0] h_01_i_0 = sum_01_i * 16'sd23170;
    wire signed [32:0] h_01_r_1 = diff_01_r * 16'sd23170;
    wire signed [32:0] h_01_i_1 = diff_01_i * 16'sd23170;

    wire signed [32:0] h_23_r_0 = sum_23_r * 16'sd23170;
    wire signed [32:0] h_23_i_0 = sum_23_i * 16'sd23170;
    wire signed [32:0] h_23_r_1 = diff_23_r * 16'sd23170;
    wire signed [32:0] h_23_i_1 = diff_23_i * 16'sd23170;

    logic signed [15:0] s1_r [4];
    logic signed [15:0] s1_i [4];
    logic s1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s1_valid <= 1'b0;
            s1_r[0]  <= 16'sd0;
            s1_i[0]  <= 16'sd0;
            s1_r[1]  <= 16'sd0;
            s1_i[1]  <= 16'sd0;
            s1_r[2]  <= 16'sd0;
            s1_i[2]  <= 16'sd0;
            s1_r[3]  <= 16'sd0;
            s1_i[3]  <= 16'sd0;
        end else begin
            s1_valid <= io_in_valid;
            if (io_in_valid) begin
                s1_r[0] <= s1_r[0]'(h_01_r_0 >>> 15);
                s1_i[0] <= s1_i[0]'(h_01_i_0 >>> 15);
                s1_r[1] <= s1_r[1]'(h_01_r_1 >>> 15);
                s1_i[1] <= s1_i[1]'(h_01_i_1 >>> 15);
                s1_r[2] <= s1_r[2]'(h_23_r_0 >>> 15);
                s1_i[2] <= s1_i[2]'(h_23_i_0 >>> 15);
                s1_r[3] <= s1_r[3]'(h_23_r_1 >>> 15);
                s1_i[3] <= s1_i[3]'(h_23_i_1 >>> 15);
            end
        end
    end

    // Step 1: CX gate on qubits [0, 1] (0 control, 1 target)
    logic signed [15:0] s2_r [4];
    logic signed [15:0] s2_i [4];
    logic s2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s2_valid <= 1'b0;
            s2_r[0]  <= 16'sd0;
            s2_i[0]  <= 16'sd0;
            s2_r[1]  <= 16'sd0;
            s2_i[1]  <= 16'sd0;
            s2_r[2]  <= 16'sd0;
            s2_i[2]  <= 16'sd0;
            s2_r[3]  <= 16'sd0;
            s2_i[3]  <= 16'sd0;
        end else begin
            s2_valid <= s1_valid;
            if (s1_valid) begin
                s2_r[0] <= s1_r[0];
                s2_i[0] <= s1_i[0];
                s2_r[1] <= s1_r[3];
                s2_i[1] <= s1_i[3];
                s2_r[2] <= s1_r[2];
                s2_i[2] <= s1_i[2];
                s2_r[3] <= s1_r[1];
                s2_i[3] <= s1_i[1];
            end
        end
    end

    // Step 2: SX gate on qubit 0 (pairs 0-1, 2-3)
    wire signed [17:0] tmp_01_r_0 = s2_r[0] - s2_i[0] + s2_r[1] + s2_i[1];
    wire signed [17:0] tmp_01_i_0 = s2_r[0] + s2_i[0] - s2_r[1] + s2_i[1];
    wire signed [17:0] tmp_01_r_1 = s2_r[0] + s2_i[0] + s2_r[1] - s2_i[1];
    wire signed [17:0] tmp_01_i_1 = -s2_r[0] + s2_i[0] + s2_r[1] + s2_i[1];

    wire signed [17:0] tmp_23_r_0 = s2_r[2] - s2_i[2] + s2_r[3] + s2_i[3];
    wire signed [17:0] tmp_23_i_0 = s2_r[2] + s2_i[2] - s2_r[3] + s2_i[3];
    wire signed [17:0] tmp_23_r_1 = s2_r[2] + s2_i[2] + s2_r[3] - s2_i[3];
    wire signed [17:0] tmp_23_i_1 = -s2_r[2] + s2_i[2] + s2_r[3] + s2_i[3];

    logic signed [15:0] s3_r [4];
    logic signed [15:0] s3_i [4];
    logic s3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s3_valid <= 1'b0;
            s3_r[0]  <= 16'sd0;
            s3_i[0]  <= 16'sd0;
            s3_r[1]  <= 16'sd0;
            s3_i[1]  <= 16'sd0;
            s3_r[2]  <= 16'sd0;
            s3_i[2]  <= 16'sd0;
            s3_r[3]  <= 16'sd0;
            s3_i[3]  <= 16'sd0;
        end else begin
            s3_valid <= s2_valid;
            if (s2_valid) begin
                s3_r[0] <= s3_r[0]'(tmp_01_r_0 >>> 1);
                s3_i[0] <= s3_i[0]'(tmp_01_i_0 >>> 1);
                s3_r[1] <= s3_r[1]'(tmp_01_r_1 >>> 1);
                s3_i[1] <= s3_i[1]'(tmp_01_i_1 >>> 1);
                s3_r[2] <= s3_r[2]'(tmp_23_r_0 >>> 1);
                s3_i[2] <= s3_i[2]'(tmp_23_i_0 >>> 1);
                s3_r[3] <= s3_r[3]'(tmp_23_r_1 >>> 1);
                s3_i[3] <= s3_i[3]'(tmp_23_i_1 >>> 1);
            end
        end
    end

    // Assign output ports
    assign io_out_QSV_0_0 = s3_r[0];
    assign io_out_QSV_0_1 = s3_i[0];
    assign io_out_QSV_1_0 = s3_r[1];
    assign io_out_QSV_1_1 = s3_i[1];
    assign io_out_QSV_2_0 = s3_r[2];
    assign io_out_QSV_2_1 = s3_i[2];
    assign io_out_QSV_3_0 = s3_r[3];
    assign io_out_QSV_3_1 = s3_i[3];
    assign io_out_valid   = s3_valid;

endmodule
