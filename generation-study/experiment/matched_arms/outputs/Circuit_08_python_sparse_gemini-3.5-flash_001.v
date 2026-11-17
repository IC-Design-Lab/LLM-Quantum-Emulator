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

    // ==========================================
    // Stage 1: Hadamard Gate on Qubit 0 (H(0))
    // ==========================================
    logic signed [31:0] prod_0_0, prod_0_1, prod_1_0, prod_1_1;
    logic signed [31:0] prod_2_0, prod_2_1, prod_3_0, prod_3_1;

    assign prod_0_0 = ($signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0)) * 16'sd23170;
    assign prod_0_1 = ($signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1)) * 16'sd23170;
    assign prod_1_0 = ($signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0)) * 16'sd23170;
    assign prod_1_1 = ($signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1)) * 16'sd23170;

    assign prod_2_0 = ($signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0)) * 16'sd23170;
    assign prod_2_1 = ($signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1)) * 16'sd23170;
    assign prod_3_0 = ($signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0)) * 16'sd23170;
    assign prod_3_1 = ($signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1)) * 16'sd23170;

    logic signed [15:0] r1_QSV_0_0, r1_QSV_0_1, r1_QSV_1_0, r1_QSV_1_1;
    logic signed [15:0] r1_QSV_2_0, r1_QSV_2_1, r1_QSV_3_0, r1_QSV_3_1;
    logic r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_QSV_0_0 <= 16'sd0;
            r1_QSV_0_1 <= 16'sd0;
            r1_QSV_1_0 <= 16'sd0;
            r1_QSV_1_1 <= 16'sd0;
            r1_QSV_2_0 <= 16'sd0;
            r1_QSV_2_1 <= 16'sd0;
            r1_QSV_3_0 <= 16'sd0;
            r1_QSV_3_1 <= 16'sd0;
            r1_valid   <= 1'b0;
        end else begin
            r1_valid   <= io_in_valid;
            if (io_in_valid) begin
                r1_QSV_0_0 <= 16'($signed(prod_0_0) >>> 15);
                r1_QSV_0_1 <= 16'($signed(prod_0_1) >>> 15);
                r1_QSV_1_0 <= 16'($signed(prod_1_0) >>> 15);
                r1_QSV_1_1 <= 16'($signed(prod_1_1) >>> 15);
                r1_QSV_2_0 <= 16'($signed(prod_2_0) >>> 15);
                r1_QSV_2_1 <= 16'($signed(prod_2_1) >>> 15);
                r1_QSV_3_0 <= 16'($signed(prod_3_0) >>> 15);
                r1_QSV_3_1 <= 16'($signed(prod_3_1) >>> 15);
            end
        end
    end

    // ==========================================
    // Stage 2: Controlled-NOT (CX(0, 1))
    // ==========================================
    logic signed [15:0] r2_QSV_0_0, r2_QSV_0_1, r2_QSV_1_0, r2_QSV_1_1;
    logic signed [15:0] r2_QSV_2_0, r2_QSV_2_1, r2_QSV_3_0, r2_QSV_3_1;
    logic r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_QSV_0_0 <= 16'sd0;
            r2_QSV_0_1 <= 16'sd0;
            r2_QSV_1_0 <= 16'sd0;
            r2_QSV_1_1 <= 16'sd0;
            r2_QSV_2_0 <= 16'sd0;
            r2_QSV_2_1 <= 16'sd0;
            r2_QSV_3_0 <= 16'sd0;
            r2_QSV_3_1 <= 16'sd0;
            r2_valid   <= 1'b0;
        end else begin
            r2_valid   <= r1_valid;
            if (r1_valid) begin
                r2_QSV_0_0 <= r1_QSV_0_0;
                r2_QSV_0_1 <= r1_QSV_0_1;
                r2_QSV_1_0 <= r1_QSV_3_0;
                r2_QSV_1_1 <= r1_QSV_3_1;
                r2_QSV_2_0 <= r1_QSV_2_0;
                r2_QSV_2_1 <= r1_QSV_2_1;
                r2_QSV_3_0 <= r1_QSV_1_0;
                r2_QSV_3_1 <= r1_QSV_1_1;
            end
        end
    end

    // ==========================================
    // Stage 3: SX on Qubit 0 (SX(0))
    // ==========================================
    logic signed [17:0] sum_s0_R_a, sum_s0_I_a, sum_s0_R_b, sum_s0_I_b;
    logic signed [17:0] sum_s2_R_a, sum_s2_I_a, sum_s2_R_b, sum_s2_I_b;

    assign sum_s0_R_a = $signed(r2_QSV_0_0) - $signed(r2_QSV_0_1) + $signed(r2_QSV_1_0) + $signed(r2_QSV_1_1);
    assign sum_s0_I_a = $signed(r2_QSV_0_0) + $signed(r2_QSV_0_1) - $signed(r2_QSV_1_0) + $signed(r2_QSV_1_1);
    assign sum_s0_R_b = $signed(r2_QSV_0_0) + $signed(r2_QSV_0_1) + $signed(r2_QSV_1_0) - $signed(r2_QSV_1_1);
    assign sum_s0_I_b = - $signed(r2_QSV_0_0) + $signed(r2_QSV_0_1) + $signed(r2_QSV_1_0) + $signed(r2_QSV_1_1);

    assign sum_s2_R_a = $signed(r2_QSV_2_0) - $signed(r2_QSV_2_1) + $signed(r2_QSV_3_0) + $signed(r2_QSV_3_1);
    assign sum_s2_I_a = $signed(r2_QSV_2_0) + $signed(r2_QSV_2_1) - $signed(r2_QSV_3_0) + $signed(r2_QSV_3_1);
    assign sum_s2_R_b = $signed(r2_QSV_2_0) + $signed(r2_QSV_2_1) + $signed(r2_QSV_3_0) - $signed(r2_QSV_3_1);
    assign sum_s2_I_b = - $signed(r2_QSV_2_0) + $signed(r2_QSV_2_1) + $signed(r2_QSV_3_0) + $signed(r2_QSV_3_1);

    logic signed [15:0] r3_QSV_0_0, r3_QSV_0_1, r3_QSV_1_0, r3_QSV_1_1;
    logic signed [15:0] r3_QSV_2_0, r3_QSV_2_1, r3_QSV_3_0, r3_QSV_3_1;
    logic r3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_QSV_0_0 <= 16'sd0;
            r3_QSV_0_1 <= 16'sd0;
            r3_QSV_1_0 <= 16'sd0;
            r3_QSV_1_1 <= 16'sd0;
            r3_QSV_2_0 <= 16'sd0;
            r3_QSV_2_1 <= 16'sd0;
            r3_QSV_3_0 <= 16'sd0;
            r3_QSV_3_1 <= 16'sd0;
            r3_valid   <= 1'b0;
        end else begin
            r3_valid   <= r2_valid;
            if (r2_valid) begin
                r3_QSV_0_0 <= 16'($signed(sum_s0_R_a) >>> 1);
                r3_QSV_0_1 <= 16'($signed(sum_s0_I_a) >>> 1);
                r3_QSV_1_0 <= 16'($signed(sum_s0_R_b) >>> 1);
                r3_QSV_1_1 <= 16'($signed(sum_s0_I_b) >>> 1);
                r3_QSV_2_0 <= 16'($signed(sum_s2_R_a) >>> 1);
                r3_QSV_2_1 <= 16'($signed(sum_s2_I_a) >>> 1);
                r3_QSV_3_0 <= 16'($signed(sum_s2_R_b) >>> 1);
                r3_QSV_3_1 <= 16'($signed(sum_s2_I_b) >>> 1);
            end
        end
    end

    // ==========================================
    // Outputs
    // ==========================================
    assign io_out_QSV_0_0 = r3_QSV_0_0;
    assign io_out_QSV_0_1 = r3_QSV_0_1;
    assign io_out_QSV_1_0 = r3_QSV_1_0;
    assign io_out_QSV_1_1 = r3_QSV_1_1;
    assign io_out_QSV_2_0 = r3_QSV_2_0;
    assign io_out_QSV_2_1 = r3_QSV_2_1;
    assign io_out_QSV_3_0 = r3_QSV_3_0;
    assign io_out_QSV_3_1 = r3_QSV_3_1;
    assign io_out_valid   = r3_valid;

endmodule
