module Circuit_02 (
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

    function automatic logic signed [15:0] scale_h(
        input logic signed [15:0] a,
        input logic signed [15:0] b,
        input logic               sub
    );
        logic signed [16:0] sum_diff;
        logic signed [33:0] prod;
        begin
            if (sub)
                sum_diff = $signed(a) - $signed(b);
            else
                sum_diff = $signed(a) + $signed(b);
            prod = sum_diff * 17'sd23170; // 23170 is 1/sqrt(2) in Q15 (0.7071)
            scale_h = prod[30:15];
        end
    endfunction

    // Stage 1 Registers (H on Qubit 0)
    logic signed [15:0] r1_QSV_0_0, r1_QSV_0_1;
    logic signed [15:0] r1_QSV_1_0, r1_QSV_1_1;
    logic signed [15:0] r1_QSV_2_0, r1_QSV_2_1;
    logic signed [15:0] r1_QSV_3_0, r1_QSV_3_1;
    logic r1_valid;

    logic signed [15:0] next_r1_QSV_0_0, next_r1_QSV_0_1;
    logic signed [15:0] next_r1_QSV_1_0, next_r1_QSV_1_1;
    logic signed [15:0] next_r1_QSV_2_0, next_r1_QSV_2_1;
    logic signed [15:0] next_r1_QSV_3_0, next_r1_QSV_3_1;

    always_comb begin
        next_r1_QSV_0_0 = scale_h(io_in_QSV_0_0, io_in_QSV_1_0, 1'b0);
        next_r1_QSV_0_1 = scale_h(io_in_QSV_0_1, io_in_QSV_1_1, 1'b0);
        next_r1_QSV_1_0 = scale_h(io_in_QSV_0_0, io_in_QSV_1_0, 1'b1);
        next_r1_QSV_1_1 = scale_h(io_in_QSV_0_1, io_in_QSV_1_1, 1'b1);

        next_r1_QSV_2_0 = scale_h(io_in_QSV_2_0, io_in_QSV_3_0, 1'b0);
        next_r1_QSV_2_1 = scale_h(io_in_QSV_2_1, io_in_QSV_3_1, 1'b0);
        next_r1_QSV_3_0 = scale_h(io_in_QSV_2_0, io_in_QSV_3_0, 1'b1);
        next_r1_QSV_3_1 = scale_h(io_in_QSV_2_1, io_in_QSV_3_1, 1'b1);
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_QSV_0_0 <= '0;
            r1_QSV_0_1 <= '0;
            r1_QSV_1_0 <= '0;
            r1_QSV_1_1 <= '0;
            r1_QSV_2_0 <= '0;
            r1_QSV_2_1 <= '0;
            r1_QSV_3_0 <= '0;
            r1_QSV_3_1 <= '0;
            r1_valid   <= 1'b0;
        end else begin
            r1_QSV_0_0 <= next_r1_QSV_0_0;
            r1_QSV_0_1 <= next_r1_QSV_0_1;
            r1_QSV_1_0 <= next_r1_QSV_1_0;
            r1_QSV_1_1 <= next_r1_QSV_1_1;
            r1_QSV_2_0 <= next_r1_QSV_2_0;
            r1_QSV_2_1 <= next_r1_QSV_2_1;
            r1_QSV_3_0 <= next_r1_QSV_3_0;
            r1_QSV_3_1 <= next_r1_QSV_3_1;
            r1_valid   <= io_in_valid;
        end
    end

    // Stage 2 Registers (H on Qubit 1)
    logic signed [15:0] r2_QSV_0_0, r2_QSV_0_1;
    logic signed [15:0] r2_QSV_1_0, r2_QSV_1_1;
    logic signed [15:0] r2_QSV_2_0, r2_QSV_2_1;
    logic signed [15:0] r2_QSV_3_0, r2_QSV_3_1;
    logic r2_valid;

    logic signed [15:0] next_r2_QSV_0_0, next_r2_QSV_0_1;
    logic signed [15:0] next_r2_QSV_1_0, next_r2_QSV_1_1;
    logic signed [15:0] next_r2_QSV_2_0, next_r2_QSV_2_1;
    logic signed [15:0] next_r2_QSV_3_0, next_r2_QSV_3_1;

    always_comb begin
        next_r2_QSV_0_0 = scale_h(r1_QSV_0_0, r1_QSV_2_0, 1'b0);
        next_r2_QSV_0_1 = scale_h(r1_QSV_0_1, r1_QSV_2_1, 1'b0);
        next_r2_QSV_2_0 = scale_h(r1_QSV_0_0, r1_QSV_2_0, 1'b1);
        next_r2_QSV_2_1 = scale_h(r1_QSV_0_1, r1_QSV_2_1, 1'b1);

        next_r2_QSV_1_0 = scale_h(r1_QSV_1_0, r1_QSV_3_0, 1'b0);
        next_r2_QSV_1_1 = scale_h(r1_QSV_1_1, r1_QSV_3_1, 1'b0);
        next_r2_QSV_3_0 = scale_h(r1_QSV_1_0, r1_QSV_3_0, 1'b1);
        next_r2_QSV_3_1 = scale_h(r1_QSV_1_1, r1_QSV_3_1, 1'b1);
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_QSV_0_0 <= '0;
            r2_QSV_0_1 <= '0;
            r2_QSV_1_0 <= '0;
            r2_QSV_1_1 <= '0;
            r2_QSV_2_0 <= '0;
            r2_QSV_2_1 <= '0;
            r2_QSV_3_0 <= '0;
            r2_QSV_3_1 <= '0;
            r2_valid   <= 1'b0;
        end else begin
            r2_QSV_0_0 <= next_r2_QSV_0_0;
            r2_QSV_0_1 <= next_r2_QSV_0_1;
            r2_QSV_1_0 <= next_r2_QSV_1_0;
            r2_QSV_1_1 <= next_r2_QSV_1_1;
            r2_QSV_2_0 <= next_r2_QSV_2_0;
            r2_QSV_2_1 <= next_r2_QSV_2_1;
            r2_QSV_3_0 <= next_r2_QSV_3_0;
            r2_QSV_3_1 <= next_r2_QSV_3_1;
            r2_valid   <= r1_valid;
        end
    end

    // Stage 3 Registers (SWAP on Qubits 0 and 1)
    logic signed [15:0] r3_QSV_0_0, r3_QSV_0_1;
    logic signed [15:0] r3_QSV_1_0, r3_QSV_1_1;
    logic signed [15:0] r3_QSV_2_0, r3_QSV_2_1;
    logic signed [15:0] r3_QSV_3_0, r3_QSV_3_1;
    logic r3_valid;

    logic signed [15:0] next_r3_QSV_0_0, next_r3_QSV_0_1;
    logic signed [15:0] next_r3_QSV_1_0, next_r3_QSV_1_1;
    logic signed [15:0] next_r3_QSV_2_0, next_r3_QSV_2_1;
    logic signed [15:0] next_r3_QSV_3_0, next_r3_QSV_3_1;

    always_comb begin
        next_r3_QSV_0_0 = r2_QSV_0_0;
        next_r3_QSV_0_1 = r2_QSV_0_1;
        next_r3_QSV_1_0 = r2_QSV_2_0; // State 2 mapped to State 1
        next_r3_QSV_1_1 = r2_QSV_2_1;
        next_r3_QSV_2_0 = r2_QSV_1_0; // State 1 mapped to State 2
        next_r3_QSV_2_1 = r2_QSV_1_1;
        next_r3_QSV_3_0 = r2_QSV_3_0;
        next_r3_QSV_3_1 = r2_QSV_3_1;
    end

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_QSV_0_0 <= '0;
            r3_QSV_0_1 <= '0;
            r3_QSV_1_0 <= '0;
            r3_QSV_1_1 <= '0;
            r3_QSV_2_0 <= '0;
            r3_QSV_2_1 <= '0;
            r3_QSV_3_0 <= '0;
            r3_QSV_3_1 <= '0;
            r3_valid   <= 1'b0;
        end else begin
            r3_QSV_0_0 <= next_r3_QSV_0_0;
            r3_QSV_0_1 <= next_r3_QSV_0_1;
            r3_QSV_1_0 <= next_r3_QSV_1_0;
            r3_QSV_1_1 <= next_r3_QSV_1_1;
            r3_QSV_2_0 <= next_r3_QSV_2_0;
            r3_QSV_2_1 <= next_r3_QSV_2_1;
            r3_QSV_3_0 <= next_r3_QSV_3_0;
            r3_QSV_3_1 <= next_r3_QSV_3_1;
            r3_valid   <= r2_valid;
        end
    end

    // Output assignments
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
