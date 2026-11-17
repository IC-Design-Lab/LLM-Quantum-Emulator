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

    function automatic logic [15:0] qmul_h_add(logic [15:0] a, logic [15:0] b);
        logic signed [16:0] sum;
        logic signed [32:0] prod;
        sum = $signed(a) + $signed(b);
        prod = sum * 33'sd23170;
        return prod[30:15];
    endfunction

    function automatic logic [15:0] qmul_h_sub(logic [15:0] a, logic [15:0] b);
        logic signed [16:0] diff;
        logic signed [32:0] prod;
        diff = $signed(a) - $signed(b);
        prod = diff * 33'sd23170;
        return prod[30:15];
    endfunction

    // Stage 1 Registers (after Step 0: Hadamard on Qubit 0)
    logic [15:0] r0_0_s1, r0_1_s1;
    logic [15:0] r1_0_s1, r1_1_s1;
    logic [15:0] r2_0_s1, r2_1_s1;
    logic [15:0] r3_0_s1, r3_1_s1;
    logic        valid_s1;

    // Stage 2 Registers (after Step 1: SWAP on Qubits 0 and 1)
    logic [15:0] r0_0_s2, r0_1_s2;
    logic [15:0] r1_0_s2, r1_1_s2;
    logic [15:0] r2_0_s2, r2_1_s2;
    logic [15:0] r3_0_s2, r3_1_s2;
    logic        valid_s2;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_0_s1  <= 16'h0;
            r0_1_s1  <= 16'h0;
            r1_0_s1  <= 16'h0;
            r1_1_s1  <= 16'h0;
            r2_0_s1  <= 16'h0;
            r2_1_s1  <= 16'h0;
            r3_0_s1  <= 16'h0;
            r3_1_s1  <= 16'h0;
            valid_s1 <= 1'b0;
        end else begin
            valid_s1 <= io_in_valid;
            if (io_in_valid) begin
                r0_0_s1 <= qmul_h_add(io_in_QSV_0_0, io_in_QSV_1_0);
                r0_1_s1 <= qmul_h_add(io_in_QSV_0_1, io_in_QSV_1_1);
                r1_0_s1 <= qmul_h_sub(io_in_QSV_0_0, io_in_QSV_1_0);
                r1_1_s1 <= qmul_h_sub(io_in_QSV_0_1, io_in_QSV_1_1);
                
                r2_0_s1 <= qmul_h_add(io_in_QSV_2_0, io_in_QSV_3_0);
                r2_1_s1 <= qmul_h_add(io_in_QSV_2_1, io_in_QSV_3_1);
                r3_0_s1 <= qmul_h_sub(io_in_QSV_2_0, io_in_QSV_3_0);
                r3_1_s1 <= qmul_h_sub(io_in_QSV_2_1, io_in_QSV_3_1);
            end
        end
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_0_s2  <= 16'h0;
            r0_1_s2  <= 16'h0;
            r1_0_s2  <= 16'h0;
            r1_1_s2  <= 16'h0;
            r2_0_s2  <= 16'h0;
            r2_1_s2  <= 16'h0;
            r3_0_s2  <= 16'h0;
            r3_1_s2  <= 16'h0;
            valid_s2 <= 1'b0;
        end else begin
            valid_s2 <= valid_s1;
            if (valid_s1) begin
                // State 0 remains State 0
                r0_0_s2 <= r0_0_s1;
                r0_1_s2 <= r0_1_s1;
                // State 1 becomes State 2
                r1_0_s2 <= r2_0_s1;
                r1_1_s2 <= r2_1_s1;
                // State 2 becomes State 1
                r2_0_s2 <= r1_0_s1;
                r2_1_s2 <= r1_1_s1;
                // State 3 remains State 3
                r3_0_s2 <= r3_0_s1;
                r3_1_s2 <= r3_1_s1;
            end
        end
    end

    assign io_out_QSV_0_0 = r0_0_s2;
    assign io_out_QSV_0_1 = r0_1_s2;
    assign io_out_QSV_1_0 = r1_0_s2;
    assign io_out_QSV_1_1 = r1_1_s2;
    assign io_out_QSV_2_0 = r2_0_s2;
    assign io_out_QSV_2_1 = r2_1_s2;
    assign io_out_QSV_3_0 = r3_0_s2;
    assign io_out_QSV_3_1 = r3_1_s2;
    assign io_out_valid   = valid_s2;

endmodule
