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

    // Function to scale by 1/sqrt(2) in fixed-point Q1.15
    function automatic logic [15:0] scale_inv_sqrt2(input logic signed [16:0] val);
        logic signed [32:0] prod;
        prod = val * 16'sd23170;
        return prod[30:15];
    endfunction

    // Stage 1 Registers (Hadamard on qubit 0)
    logic [15:0] s1_QSV_0_0, s1_QSV_0_1;
    logic [15:0] s1_QSV_1_0, s1_QSV_1_1;
    logic [15:0] s1_QSV_2_0, s1_QSV_2_1;
    logic [15:0] s1_QSV_3_0, s1_QSV_3_1;
    logic        s1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s1_QSV_0_0 <= '0; s1_QSV_0_1 <= '0;
            s1_QSV_1_0 <= '0; s1_QSV_1_1 <= '0;
            s1_QSV_2_0 <= '0; s1_QSV_2_1 <= '0;
            s1_QSV_3_0 <= '0; s1_QSV_3_1 <= '0;
            s1_valid   <= 1'b0;
        end else begin
            s1_valid <= io_in_valid;
            if (io_in_valid) begin
                s1_QSV_0_0 <= scale_inv_sqrt2($signed(io_in_QSV_0_0) + $signed(io_in_QSV_1_0));
                s1_QSV_0_1 <= scale_inv_sqrt2($signed(io_in_QSV_0_1) + $signed(io_in_QSV_1_1));

                s1_QSV_1_0 <= scale_inv_sqrt2($signed(io_in_QSV_0_0) - $signed(io_in_QSV_1_0));
                s1_QSV_1_1 <= scale_inv_sqrt2($signed(io_in_QSV_0_1) - $signed(io_in_QSV_1_1));

                s1_QSV_2_0 <= scale_inv_sqrt2($signed(io_in_QSV_2_0) + $signed(io_in_QSV_3_0));
                s1_QSV_2_1 <= scale_inv_sqrt2($signed(io_in_QSV_2_1) + $signed(io_in_QSV_3_1));

                s1_QSV_3_0 <= scale_inv_sqrt2($signed(io_in_QSV_2_0) - $signed(io_in_QSV_3_0));
                s1_QSV_3_1 <= scale_inv_sqrt2($signed(io_in_QSV_2_1) - $signed(io_in_QSV_3_1));
            end
        end
    end

    // Stage 2 Registers (CX on qubit 0 control, qubit 1 target -> Swap QSV_1 and QSV_3)
    logic [15:0] s2_QSV_0_0, s2_QSV_0_1;
    logic [15:0] s2_QSV_1_0, s2_QSV_1_1;
    logic [15:0] s2_QSV_2_0, s2_QSV_2_1;
    logic [15:0] s2_QSV_3_0, s2_QSV_3_1;
    logic        s2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s2_QSV_0_0 <= '0; s2_QSV_0_1 <= '0;
            s2_QSV_1_0 <= '0; s2_QSV_1_1 <= '0;
            s2_QSV_2_0 <= '0; s2_QSV_2_1 <= '0;
            s2_QSV_3_0 <= '0; s2_QSV_3_1 <= '0;
            s2_valid   <= 1'b0;
        end else begin
            s2_valid <= s1_valid;
            if (s1_valid) begin
                s2_QSV_0_0 <= s1_QSV_0_0;
                s2_QSV_0_1 <= s1_QSV_0_1;

                s2_QSV_1_0 <= s1_QSV_3_0;
                s2_QSV_1_1 <= s1_QSV_3_1;

                s2_QSV_2_0 <= s1_QSV_2_0;
                s2_QSV_2_1 <= s1_QSV_2_1;

                s2_QSV_3_0 <= s1_QSV_1_0;
                s2_QSV_3_1 <= s1_QSV_1_1;
            end
        end
    end

    // Stage 3 Registers (Hadamard on qubit 0)
    logic [15:0] s3_QSV_0_0, s3_QSV_0_1;
    logic [15:0] s3_QSV_1_0, s3_QSV_1_1;
    logic [15:0] s3_QSV_2_0, s3_QSV_2_1;
    logic [15:0] s3_QSV_3_0, s3_QSV_3_1;
    logic        s3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            s3_QSV_0_0 <= '0; s3_QSV_0_1 <= '0;
            s3_QSV_1_0 <= '0; s3_QSV_1_1 <= '0;
            s3_QSV_2_0 <= '0; s3_QSV_2_1 <= '0;
            s3_QSV_3_0 <= '0; s3_QSV_3_1 <= '0;
            s3_valid   <= 1'b0;
        end else begin
            s3_valid <= s2_valid;
            if (s2_valid) begin
                s3_QSV_0_0 <= scale_inv_sqrt2($signed(s2_QSV_0_0) + $signed(s2_QSV_1_0));
                s3_QSV_0_1 <= scale_inv_sqrt2($signed(s2_QSV_0_1) + $signed(s2_QSV_1_1));

                s3_QSV_1_0 <= scale_inv_sqrt2($signed(s2_QSV_0_0) - $signed(s2_QSV_1_0));
                s3_QSV_1_1 <= scale_inv_sqrt2($signed(s2_QSV_0_1) - $signed(s2_QSV_1_1));

                s3_QSV_2_0 <= scale_inv_sqrt2($signed(s2_QSV_2_0) + $signed(s2_QSV_3_0));
                s3_QSV_2_1 <= scale_inv_sqrt2($signed(s2_QSV_2_1) + $signed(s2_QSV_3_1));

                s3_QSV_3_0 <= scale_inv_sqrt2($signed(s2_QSV_2_0) - $signed(s2_QSV_3_0));
                s3_QSV_3_1 <= scale_inv_sqrt2($signed(s2_QSV_2_1) - $signed(s2_QSV_3_1));
            end
        end
    end

    // Output assignments
    assign io_out_QSV_0_0 = s3_QSV_0_0;
    assign io_out_QSV_0_1 = s3_QSV_0_1;
    assign io_out_QSV_1_0 = s3_QSV_1_0;
    assign io_out_QSV_1_1 = s3_QSV_1_1;
    assign io_out_QSV_2_0 = s3_QSV_2_0;
    assign io_out_QSV_2_1 = s3_QSV_2_1;
    assign io_out_QSV_3_0 = s3_QSV_3_0;
    assign io_out_QSV_3_1 = s3_QSV_3_1;
    assign io_out_valid   = s3_valid;

endmodule
