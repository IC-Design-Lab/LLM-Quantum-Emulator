module Circuit_05 (
    input  logic        clock,
    input  logic        reset,
    input  logic signed [15:0] io_in_QSV_0_0,
    input  logic signed [15:0] io_in_QSV_0_1,
    input  logic signed [15:0] io_in_QSV_1_0,
    input  logic signed [15:0] io_in_QSV_1_1,
    input  logic signed [15:0] io_in_QSV_2_0,
    input  logic signed [15:0] io_in_QSV_2_1,
    input  logic signed [15:0] io_in_QSV_3_0,
    input  logic signed [15:0] io_in_QSV_3_1,
    input  logic        io_in_valid,
    output logic signed [15:0] io_out_QSV_0_0,
    output logic signed [15:0] io_out_QSV_0_1,
    output logic signed [15:0] io_out_QSV_1_0,
    output logic signed [15:0] io_out_QSV_1_1,
    output logic signed [15:0] io_out_QSV_2_0,
    output logic signed [15:0] io_out_QSV_2_1,
    output logic signed [15:0] io_out_QSV_3_0,
    output logic signed [15:0] io_out_QSV_3_1,
    output logic        io_out_valid
);

    // ==========================================
    // STEP 0: H gate on Qubit 0
    // ==========================================
    wire signed [16:0] sum_0_0 = io_in_QSV_0_0 + io_in_QSV_1_0;
    wire signed [16:0] diff_0_0 = io_in_QSV_0_0 - io_in_QSV_1_0;
    wire signed [16:0] sum_0_1 = io_in_QSV_0_1 + io_in_QSV_1_1;
    wire signed [16:0] diff_0_1 = io_in_QSV_0_1 - io_in_QSV_1_1;

    wire signed [16:0] sum_2_0 = io_in_QSV_2_0 + io_in_QSV_3_0;
    wire signed [16:0] diff_2_0 = io_in_QSV_2_0 - io_in_QSV_3_0;
    wire signed [16:0] sum_2_1 = io_in_QSV_2_1 + io_in_QSV_3_1;
    wire signed [16:0] diff_2_1 = io_in_QSV_2_1 - io_in_QSV_3_1;

    wire signed [32:0] prod_sum_0_0 = sum_0_0 * 16'sh5A82;
    wire signed [32:0] prod_diff_0_0 = diff_0_0 * 16'sh5A82;
    wire signed [32:0] prod_sum_0_1 = sum_0_1 * 16'sh5A82;
    wire signed [32:0] prod_diff_0_1 = diff_0_1 * 16'sh5A82;

    wire signed [32:0] prod_sum_2_0 = sum_2_0 * 16'sh5A82;
    wire signed [32:0] prod_diff_2_0 = diff_2_0 * 16'sh5A82;
    wire signed [32:0] prod_sum_2_1 = sum_2_1 * 16'sh5A82;
    wire signed [32:0] prod_diff_2_1 = diff_2_1 * 16'sh5A82;

    reg signed [15:0] st0_QSV_0_0, st0_QSV_0_1;
    reg signed [15:0] st0_QSV_1_0, st0_QSV_1_1;
    reg signed [15:0] st0_QSV_2_0, st0_QSV_2_1;
    reg signed [15:0] st0_QSV_3_0, st0_QSV_3_1;
    reg st0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            st0_QSV_0_0 <= '0; st0_QSV_0_1 <= '0;
            st0_QSV_1_0 <= '0; st0_QSV_1_1 <= '0;
            st0_QSV_2_0 <= '0; st0_QSV_2_1 <= '0;
            st0_QSV_3_0 <= '0; st0_QSV_3_1 <= '0;
            st0_valid   <= 1'b0;
        end else begin
            st0_QSV_0_0 <= prod_sum_0_0[30:15];
            st0_QSV_0_1 <= prod_sum_0_1[30:15];
            st0_QSV_1_0 <= prod_diff_0_0[30:15];
            st0_QSV_1_1 <= prod_diff_0_1[30:15];
            st0_QSV_2_0 <= prod_sum_2_0[30:15];
            st0_QSV_2_1 <= prod_sum_2_1[30:15];
            st0_QSV_3_0 <= prod_diff_2_0[30:15];
            st0_QSV_3_1 <= prod_diff_2_1[30:15];
            st0_valid   <= io_in_valid;
        end
    end

    // ==========================================
    // STEP 1: X gate on Qubit 1 (Permute states)
    // ==========================================
    reg signed [15:0] st1_QSV_0_0, st1_QSV_0_1;
    reg signed [15:0] st1_QSV_1_0, st1_QSV_1_1;
    reg signed [15:0] st1_QSV_2_0, st1_QSV_2_1;
    reg signed [15:0] st1_QSV_3_0, st1_QSV_3_1;
    reg st1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            st1_QSV_0_0 <= '0; st1_QSV_0_1 <= '0;
            st1_QSV_1_0 <= '0; st1_QSV_1_1 <= '0;
            st1_QSV_2_0 <= '0; st1_QSV_2_1 <= '0;
            st1_QSV_3_0 <= '0; st1_QSV_3_1 <= '0;
            st1_valid   <= 1'b0;
        end else begin
            st1_QSV_0_0 <= st0_QSV_2_0;
            st1_QSV_0_1 <= st0_QSV_2_1;
            st1_QSV_1_0 <= st0_QSV_3_0;
            st1_QSV_1_1 <= st0_QSV_3_1;
            st1_QSV_2_0 <= st0_QSV_0_0;
            st1_QSV_2_1 <= st0_QSV_0_1;
            st1_QSV_3_0 <= st0_QSV_1_0;
            st1_QSV_3_1 <= st0_QSV_1_1;
            st1_valid   <= st0_valid;
        end
    end

    // ==========================================
    // STEP 2: sxdg gate on Qubit 1
    // ==========================================
    wire signed [17:0] sum_st2_0_0 = $signed(st1_QSV_0_0) + $signed(st1_QSV_0_1) + $signed(st1_QSV_2_0) - $signed(st1_QSV_2_1);
    wire signed [17:0] sum_st2_0_1 = -$signed(st1_QSV_0_0) + $signed(st1_QSV_0_1) + $signed(st1_QSV_2_0) + $signed(st1_QSV_2_1);
    wire signed [17:0] sum_st2_2_0 = $signed(st1_QSV_0_0) - $signed(st1_QSV_0_1) + $signed(st1_QSV_2_0) + $signed(st1_QSV_2_1);
    wire signed [17:0] sum_st2_2_1 = $signed(st1_QSV_0_0) + $signed(st1_QSV_0_1) - $signed(st1_QSV_2_0) + $signed(st1_QSV_2_1);

    wire signed [17:0] sum_st2_1_0 = $signed(st1_QSV_1_0) + $signed(st1_QSV_1_1) + $signed(st1_QSV_3_0) - $signed(st1_QSV_3_1);
    wire signed [17:0] sum_st2_1_1 = -$signed(st1_QSV_1_0) + $signed(st1_QSV_1_1) + $signed(st1_QSV_3_0) + $signed(st1_QSV_3_1);
    wire signed [17:0] sum_st2_3_0 = $signed(st1_QSV_1_0) - $signed(st1_QSV_1_1) + $signed(st1_QSV_3_0) + $signed(st1_QSV_3_1);
    wire signed [17:0] sum_st2_3_1 = $signed(st1_QSV_1_0) + $signed(st1_QSV_1_1) - $signed(st1_QSV_3_0) + $signed(st1_QSV_3_1);

    reg signed [15:0] st2_QSV_0_0, st2_QSV_0_1;
    reg signed [15:0] st2_QSV_1_0, st2_QSV_1_1;
    reg signed [15:0] st2_QSV_2_0, st2_QSV_2_1;
    reg signed [15:0] st2_QSV_3_0, st2_QSV_3_1;
    reg st2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            st2_QSV_0_0 <= '0; st2_QSV_0_1 <= '0;
            st2_QSV_1_0 <= '0; st2_QSV_1_1 <= '0;
            st2_QSV_2_0 <= '0; st2_QSV_2_1 <= '0;
            st2_QSV_3_0 <= '0; st2_QSV_3_1 <= '0;
            st2_valid   <= 1'b0;
        end else begin
            st2_QSV_0_0 <= sum_st2_0_0[16:1];
            st2_QSV_0_1 <= sum_st2_0_1[16:1];
            st2_QSV_2_0 <= sum_st2_2_0[16:1];
            st2_QSV_2_1 <= sum_st2_2_1[16:1];
            st2_QSV_1_0 <= sum_st2_1_0[16:1];
            st2_QSV_1_1 <= sum_st2_1_1[16:1];
            st2_QSV_3_0 <= sum_st2_3_0[16:1];
            st2_QSV_3_1 <= sum_st2_3_1[16:1];
            st2_valid   <= st1_valid;
        end
    end

    // ==========================================
    // STEP 3: SWAP gate on Qubits 0 and 1
    // ==========================================
    reg signed [15:0] st3_QSV_0_0, st3_QSV_0_1;
    reg signed [15:0] st3_QSV_1_0, st3_QSV_1_1;
    reg signed [15:0] st3_QSV_2_0, st3_QSV_2_1;
    reg signed [15:0] st3_QSV_3_0, st3_QSV_3_1;
    reg st3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            st3_QSV_0_0 <= '0; st3_QSV_0_1 <= '0;
            st3_QSV_1_0 <= '0; st3_QSV_1_1 <= '0;
            st3_QSV_2_0 <= '0; st3_QSV_2_1 <= '0;
            st3_QSV_3_0 <= '0; st3_QSV_3_1 <= '0;
            st3_valid   <= 1'b0;
        end else begin
            st3_QSV_0_0 <= st2_QSV_0_0;
            st3_QSV_0_1 <= st2_QSV_0_1;
            st3_QSV_1_0 <= st2_QSV_2_0;
            st3_QSV_1_1 <= st2_QSV_2_1;
            st3_QSV_2_0 <= st2_QSV_1_0;
            st3_QSV_2_1 <= st2_QSV_1_1;
            st3_QSV_3_0 <= st2_QSV_3_0;
            st3_QSV_3_1 <= st2_QSV_3_1;
            st3_valid   <= st2_valid;
        end
    end

    // ==========================================
    // Outputs Assignment
    // ==========================================
    assign io_out_QSV_0_0 = st3_QSV_0_0;
    assign io_out_QSV_0_1 = st3_QSV_0_1;
    assign io_out_QSV_1_0 = st3_QSV_1_0;
    assign io_out_QSV_1_1 = st3_QSV_1_1;
    assign io_out_QSV_2_0 = st3_QSV_2_0;
    assign io_out_QSV_2_1 = st3_QSV_2_1;
    assign io_out_QSV_3_0 = st3_QSV_3_0;
    assign io_out_QSV_3_1 = st3_QSV_3_1;
    assign io_out_valid   = st3_valid;

endmodule
