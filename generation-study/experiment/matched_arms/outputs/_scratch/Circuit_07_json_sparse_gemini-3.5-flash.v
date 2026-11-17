module Circuit_07 (
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

    function automatic logic [15:0] qmul_h(logic [15:0] a, logic [15:0] b, logic sub);
        logic signed [16:0] sum;
        logic signed [32:0] prod;
        begin
            if (sub)
                sum = $signed(a) - $signed(b);
            else
                sum = $signed(a) + $signed(b);
            prod = sum * 17'sd23170;
            qmul_h = prod[30:15];
        end
    endfunction

    // Stage 1 registers (Step 0: H on Qubit 0)
    logic signed [15:0] q00_r_r1, q00_i_r1;
    logic signed [15:0] q01_r_r1, q01_i_r1;
    logic signed [15:0] q10_r_r1, q10_i_r1;
    logic signed [15:0] q11_r_r1, q11_i_r1;
    logic valid_r1;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            q00_r_r1 <= '0; q00_i_r1 <= '0;
            q01_r_r1 <= '0; q01_i_r1 <= '0;
            q10_r_r1 <= '0; q10_i_r1 <= '0;
            q11_r_r1 <= '0; q11_i_r1 <= '0;
            valid_r1 <= 1'b0;
        end else begin
            valid_r1 <= io_in_valid;
            if (io_in_valid) begin
                q00_r_r1 <= qmul_h(io_in_QSV_0_0, io_in_QSV_1_0, 1'b0);
                q00_i_r1 <= qmul_h(io_in_QSV_0_1, io_in_QSV_1_1, 1'b0);
                q01_r_r1 <= qmul_h(io_in_QSV_0_0, io_in_QSV_1_0, 1'b1);
                q01_i_r1 <= qmul_h(io_in_QSV_0_1, io_in_QSV_1_1, 1'b1);

                q10_r_r1 <= qmul_h(io_in_QSV_2_0, io_in_QSV_3_0, 1'b0);
                q10_i_r1 <= qmul_h(io_in_QSV_2_1, io_in_QSV_3_1, 1'b0);
                q11_r_r1 <= qmul_h(io_in_QSV_2_0, io_in_QSV_3_0, 1'b1);
                q11_i_r1 <= qmul_h(io_in_QSV_2_1, io_in_QSV_3_1, 1'b1);
            end
        end
    end

    // Stage 2 registers (Step 1: CX on 0,1)
    logic signed [15:0] q00_r_r2, q00_i_r2;
    logic signed [15:0] q01_r_r2, q01_i_r2;
    logic signed [15:0] q10_r_r2, q10_i_r2;
    logic signed [15:0] q11_r_r2, q11_i_r2;
    logic valid_r2;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            q00_r_r2 <= '0; q00_i_r2 <= '0;
            q01_r_r2 <= '0; q01_i_r2 <= '0;
            q10_r_r2 <= '0; q10_i_r2 <= '0;
            q11_r_r2 <= '0; q11_i_r2 <= '0;
            valid_r2 <= 1'b0;
        end else begin
            valid_r2 <= valid_r1;
            if (valid_r1) begin
                q00_r_r2 <= q00_r_r1;
                q00_i_r2 <= q00_i_r1;
                
                q01_r_r2 <= q11_r_r1; // CX swaps index 1 and index 3
                q01_i_r2 <= q11_i_r1;
                
                q10_r_r2 <= q10_r_r1;
                q10_i_r2 <= q10_i_r1;
                
                q11_r_r2 <= q01_r_r1;
                q11_i_r2 <= q01_i_r1;
            end
        end
    end

    // Stage 3 registers (Step 2: H on Qubit 0)
    logic signed [15:0] q00_r_r3, q00_i_r3;
    logic signed [15:0] q01_r_r3, q01_i_r3;
    logic signed [15:0] q10_r_r3, q10_i_r3;
    logic signed [15:0] q11_r_r3, q11_i_r3;
    logic valid_r3;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            q00_r_r3 <= '0; q00_i_r3 <= '0;
            q01_r_r3 <= '0; q01_i_r3 <= '0;
            q10_r_r3 <= '0; q10_i_r3 <= '0;
            q11_r_r3 <= '0; q11_i_r3 <= '0;
            valid_r3 <= 1'b0;
        end else begin
            valid_r3 <= valid_r2;
            if (valid_r2) begin
                q00_r_r3 <= qmul_h(q00_r_r2, q01_r_r2, 1'b0);
                q00_i_r3 <= qmul_h(q00_i_r2, q01_i_r2, 1'b0);
                q01_r_r3 <= qmul_h(q00_r_r2, q01_r_r2, 1'b1);
                q01_i_r3 <= qmul_h(q00_i_r2, q01_i_r2, 1'b1);

                q10_r_r3 <= qmul_h(q10_r_r2, q11_r_r2, 1'b0);
                q10_i_r3 <= qmul_h(q10_i_r2, q11_i_r2, 1'b0);
                q11_r_r3 <= qmul_h(q10_r_r2, q11_r_r2, 1'b1);
                q11_i_r3 <= qmul_h(q10_i_r2, q11_i_r2, 1'b1);
            end
        end
    end

    assign io_out_QSV_0_0 = q00_r_r3;
    assign io_out_QSV_0_1 = q00_i_r3;
    assign io_out_QSV_1_0 = q01_r_r3;
    assign io_out_QSV_1_1 = q01_i_r3;
    assign io_out_QSV_2_0 = q10_r_r3;
    assign io_out_QSV_2_1 = q10_i_r3;
    assign io_out_QSV_3_0 = q11_r_r3;
    assign io_out_QSV_3_1 = q11_i_r3;
    assign io_out_valid   = valid_r3;

endmodule
