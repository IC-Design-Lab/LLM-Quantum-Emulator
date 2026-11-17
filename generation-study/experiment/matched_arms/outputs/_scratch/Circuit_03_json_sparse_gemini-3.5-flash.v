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

    // Quantum H-gate fixed-point helper function
    function automatic logic signed [15:0] h_gate(
        input logic signed [15:0] x,
        input logic signed [15:0] y,
        input logic is_diff
    );
        logic signed [16:0] sum_diff;
        logic signed [33:0] prod;
        begin
            if (is_diff) begin
                sum_diff = x - y;
            end else begin
                sum_diff = x + y;
            end
            prod = sum_diff * 17'sd23170; // 23170 / 32768 ~ 0.7071
            h_gate = 16'((prod + 34'sd16384) >>> 15);
        end
    endfunction

    // Stage 0: Register Input State Vector
    logic signed [15:0] r0_0_0, r0_0_1, r0_1_0, r0_1_1, r0_2_0, r0_2_1, r0_3_0, r0_3_1;
    logic r0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r0_valid <= 1'b0;
        end else begin
            r0_valid <= io_in_valid;
        end
    end

    always_ff @(posedge clock) begin
        r0_0_0 <= $signed(io_in_QSV_0_0);
        r0_0_1 <= $signed(io_in_QSV_0_1);
        r0_1_0 <= $signed(io_in_QSV_1_0);
        r0_1_1 <= $signed(io_in_QSV_1_1);
        r0_2_0 <= $signed(io_in_QSV_2_0);
        r0_2_1 <= $signed(io_in_QSV_2_1);
        r0_3_0 <= $signed(io_in_QSV_3_0);
        r0_3_1 <= $signed(io_in_QSV_3_1);
    end

    // Stage 1: Step 0 - H gate on qubit 0 (pairs 0-1 and 2-3)
    logic signed [15:0] r1_0_0, r1_0_1, r1_1_0, r1_1_1, r1_2_0, r1_2_1, r1_3_0, r1_3_1;
    logic r1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r1_valid <= 1'b0;
        end else begin
            r1_valid <= r0_valid;
        end
    end

    always_ff @(posedge clock) begin
        r1_0_0 <= h_gate(r0_0_0, r0_1_0, 1'b0);
        r1_0_1 <= h_gate(r0_0_1, r0_1_1, 1'b0);
        r1_1_0 <= h_gate(r0_0_0, r0_1_0, 1'b1);
        r1_1_1 <= h_gate(r0_0_1, r0_1_1, 1'b1);
        
        r1_2_0 <= h_gate(r0_2_0, r0_3_0, 1'b0);
        r1_2_1 <= h_gate(r0_2_1, r0_3_1, 1'b0);
        r1_3_0 <= h_gate(r0_2_0, r0_3_0, 1'b1);
        r1_3_1 <= h_gate(r0_2_1, r0_3_1, 1'b1);
    end

    // Stage 2: Step 1 - X gate on qubit 1 (swaps 0-2 and 1-3)
    logic signed [15:0] r2_0_0, r2_0_1, r2_1_0, r2_1_1, r2_2_0, r2_2_1, r2_3_0, r2_3_1;
    logic r2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r2_valid <= 1'b0;
        end else begin
            r2_valid <= r1_valid;
        end
    end

    always_ff @(posedge clock) begin
        r2_0_0 <= r1_2_0;
        r2_0_1 <= r1_2_1;
        r2_1_0 <= r1_3_0;
        r2_1_1 <= r1_3_1;
        r2_2_0 <= r1_0_0;
        r2_2_1 <= r1_0_1;
        r2_3_0 <= r1_1_0;
        r2_3_1 <= r1_1_1;
    end

    // Stage 3: Step 2 - H gate on qubit 1 (pairs 0-2 and 1-3)
    logic signed [15:0] r3_0_0, r3_0_1, r3_1_0, r3_1_1, r3_2_0, r3_2_1, r3_3_0, r3_3_1;
    logic r3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r3_valid <= 1'b0;
        end else begin
            r3_valid <= r2_valid;
        end
    end

    always_ff @(posedge clock) begin
        r3_0_0 <= h_gate(r2_0_0, r2_2_0, 1'b0);
        r3_0_1 <= h_gate(r2_0_1, r2_2_1, 1'b0);
        r3_2_0 <= h_gate(r2_0_0, r2_2_0, 1'b1);
        r3_2_1 <= h_gate(r2_0_1, r2_2_1, 1'b1);

        r3_1_0 <= h_gate(r2_1_0, r2_3_0, 1'b0);
        r3_1_1 <= h_gate(r2_1_1, r2_3_1, 1'b0);
        r3_3_0 <= h_gate(r2_1_0, r2_3_0, 1'b1);
        r3_3_1 <= h_gate(r2_1_1, r2_3_1, 1'b1);
    end

    // Stage 4: Step 3 - SWAP gate on qubits 0 and 1 (swaps 1 and 2)
    logic signed [15:0] r4_0_0, r4_0_1, r4_1_0, r4_1_1, r4_2_0, r4_2_1, r4_3_0, r4_3_1;
    logic r4_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            r4_valid <= 1'b0;
        end else begin
            r4_valid <= r3_valid;
        end
    end

    always_ff @(posedge clock) begin
        r4_0_0 <= r3_0_0;
        r4_0_1 <= r3_0_1;
        r4_1_0 <= r3_2_0;
        r4_1_1 <= r3_2_1;
        r4_2_0 <= r3_1_0;
        r4_2_1 <= r3_1_1;
        r4_3_0 <= r3_3_0;
        r4_3_1 <= r3_3_1;
    end

    // Outputs
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
