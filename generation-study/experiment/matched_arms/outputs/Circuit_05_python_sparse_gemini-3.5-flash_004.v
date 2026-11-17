module Circuit_05 (
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

    // Saturation helper functions
    function automatic logic [15:0] saturate(input logic signed [16:0] val);
        if (val > 17'sd32767) begin
            return 16'sd32767;
        end else if (val < -17'sd32768) begin
            return -16'sd32768;
        end else begin
            return val[15:0];
        end
    endfunction

    function automatic logic [15:0] shift_and_saturate(input logic signed [17:0] val);
        logic signed [16:0] shifted;
        shifted = val >>> 1;
        if (shifted > 17'sd32767) begin
            return 16'sd32767;
        end else if (shifted < -17'sd32768) begin
            return -16'sd32768;
        end else begin
            return shifted[15:0];
        end
    endfunction

    // Stage 0: Input capture
    logic signed [15:0] st0_QSV_0_0, st0_QSV_0_1;
    logic signed [15:0] st0_QSV_1_0, st0_QSV_1_1;
    logic signed [15:0] st0_QSV_2_0, st0_QSV_2_1;
    logic signed [15:0] st0_QSV_3_0, st0_QSV_3_1;
    logic st0_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            st0_valid   <= 1'b0;
            st0_QSV_0_0 <= '0; st0_QSV_0_1 <= '0;
            st0_QSV_1_0 <= '0; st0_QSV_1_1 <= '0;
            st0_QSV_2_0 <= '0; st0_QSV_2_1 <= '0;
            st0_QSV_3_0 <= '0; st0_QSV_3_1 <= '0;
        end else begin
            st0_valid   <= io_in_valid;
            st0_QSV_0_0 <= $signed(io_in_QSV_0_0);
            st0_QSV_0_1 <= $signed(io_in_QSV_0_1);
            st0_QSV_1_0 <= $signed(io_in_QSV_1_0);
            st0_QSV_1_1 <= $signed(io_in_QSV_1_1);
            st0_QSV_2_0 <= $signed(io_in_QSV_2_0);
            st0_QSV_2_1 <= $signed(io_in_QSV_2_1);
            st0_QSV_3_0 <= $signed(io_in_QSV_3_0);
            st0_QSV_3_1 <= $signed(io_in_QSV_3_1);
        end
    end

    // Stage 1: Hadamard on Q0
    logic signed [16:0] sum_0_1_R, diff_0_1_R, sum_0_1_I, diff_0_1_I;
    logic signed [16:0] sum_2_3_R, diff_2_3_R, sum_2_3_I, diff_2_3_I;

    assign sum_0_1_R  = st0_QSV_0_0 + st0_QSV_1_0;
    assign diff_0_1_R = st0_QSV_0_0 - st0_QSV_1_0;
    assign sum_0_1_I  = st0_QSV_0_1 + st0_QSV_1_1;
    assign diff_0_1_I = st0_QSV_0_1 - st0_QSV_1_1;

    assign sum_2_3_R  = st0_QSV_2_0 + st0_QSV_3_0;
    assign diff_2_3_R = st0_QSV_2_0 - st0_QSV_3_0;
    assign sum_2_3_I  = st0_QSV_2_1 + st0_QSV_3_1;
    assign diff_2_3_I = st0_QSV_2_1 - st0_QSV_3_1;

    logic signed [32:0] prod_0_R, prod_0_I, prod_1_R, prod_1_I;
    logic signed [32:0] prod_2_R, prod_2_I, prod_3_R, prod_3_I;

    assign prod_0_R = sum_0_1_R  * 17'sd23170;
    assign prod_0_I = sum_0_1_I  * 17'sd23170;
    assign prod_1_R = diff_0_1_R * 17'sd23170;
    assign prod_1_I = diff_0_1_I * 17'sd23170;

    assign prod_2_R = sum_2_3_R  * 17'sd23170;
    assign prod_2_I = sum_2_3_I  * 17'sd23170;
    assign prod_3_R = diff_2_3_R * 17'sd23170;
    assign prod_3_I = diff_2_3_I * 17'sd23170;

    logic signed [16:0] sh_0_R, sh_0_I, sh_1_R, sh_1_I;
    logic signed [16:0] sh_2_R, sh_2_I, sh_3_R, sh_3_I;

    assign sh_0_R = prod_0_R >>> 15;
    assign sh_0_I = prod_0_I >>> 15;
    assign sh_1_R = prod_1_R >>> 15;
    assign sh_1_I = prod_1_I >>> 15;

    assign sh_2_R = prod_2_R >>> 15;
    assign sh_2_I = prod_2_I >>> 15;
    assign sh_3_R = prod_3_R >>> 15;
    assign sh_3_I = prod_3_I >>> 15;

    logic signed [15:0] st1_QSV_0_0, st1_QSV_0_1;
    logic signed [15:0] st1_QSV_1_0, st1_QSV_1_1;
    logic signed [15:0] st1_QSV_2_0, st1_QSV_2_1;
    logic signed [15:0] st1_QSV_3_0, st1_QSV_3_1;
    logic st1_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            st1_valid   <= 1'b0;
            st1_QSV_0_0 <= '0; st1_QSV_0_1 <= '0;
            st1_QSV_1_0 <= '0; st1_QSV_1_1 <= '0;
            st1_QSV_2_0 <= '0; st1_QSV_2_1 <= '0;
            st1_QSV_3_0 <= '0; st1_QSV_3_1 <= '0;
        end else begin
            st1_valid   <= st0_valid;
            st1_QSV_0_0 <= saturate(sh_0_R);
            st1_QSV_0_1 <= saturate(sh_0_I);
            st1_QSV_1_0 <= saturate(sh_1_R);
            st1_QSV_1_1 <= saturate(sh_1_I);
            st1_QSV_2_0 <= saturate(sh_2_R);
            st1_QSV_2_1 <= saturate(sh_2_I);
            st1_QSV_3_0 <= saturate(sh_3_R);
            st1_QSV_3_1 <= saturate(sh_3_I);
        end
    end

    // Stage 2: X on Q1
    logic signed [15:0] st2_QSV_0_0, st2_QSV_0_1;
    logic signed [15:0] st2_QSV_1_0, st2_QSV_1_1;
    logic signed [15:0] st2_QSV_2_0, st2_QSV_2_1;
    logic signed [15:0] st2_QSV_3_0, st2_QSV_3_1;
    logic st2_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            st2_valid   <= 1'b0;
            st2_QSV_0_0 <= '0; st2_QSV_0_1 <= '0;
            st2_QSV_1_0 <= '0; st2_QSV_1_1 <= '0;
            st2_QSV_2_0 <= '0; st2_QSV_2_1 <= '0;
            st2_QSV_3_0 <= '0; st2_QSV_3_1 <= '0;
        end else begin
            st2_valid   <= st1_valid;
            st2_QSV_0_0 <= st1_QSV_2_0;
            st2_QSV_0_1 <= st1_QSV_2_1;
            st2_QSV_1_0 <= st1_QSV_3_0;
            st2_QSV_1_1 <= st1_QSV_3_1;
            st2_QSV_2_0 <= st1_QSV_0_0;
            st2_QSV_2_1 <= st1_QSV_0_1;
            st2_QSV_3_0 <= st1_QSV_1_0;
            st2_QSV_3_1 <= st1_QSV_1_1;
        end
    end

    // Stage 3: SXdg on Q1
    logic signed [17:0] temp_sxdg_0_R, temp_sxdg_0_I;
    logic signed [17:0] temp_sxdg_1_R, temp_sxdg_1_I;
    logic signed [17:0] temp_sxdg_2_R, temp_sxdg_2_I;
    logic signed [17:0] temp_sxdg_3_R, temp_sxdg_3_I;

    assign temp_sxdg_0_R = $signed(st2_QSV_0_0) + $signed(st2_QSV_0_1) + $signed(st2_QSV_2_0) - $signed(st2_QSV_2_1);
    assign temp_sxdg_0_I = $signed(st2_QSV_0_1) - $signed(st2_QSV_0_0) + $signed(st2_QSV_2_1) + $signed(st2_QSV_2_0);
    assign temp_sxdg_2_R = $signed(st2_QSV_0_0) - $signed(st2_QSV_0_1) + $signed(st2_QSV_2_0) + $signed(st2_QSV_2_1);
    assign temp_sxdg_2_I = $signed(st2_QSV_0_1) + $signed(st2_QSV_0_0) + $signed(st2_QSV_2_1) - $signed(st2_QSV_2_0);

    assign temp_sxdg_1_R = $signed(st2_QSV_1_0) + $signed(st2_QSV_1_1) + $signed(st2_QSV_3_0) - $signed(st2_QSV_3_1);
    assign temp_sxdg_1_I = $signed(st2_QSV_1_1) - $signed(st2_QSV_1_0) + $signed(st2_QSV_3_1) + $signed(st2_QSV_3_0);
    assign temp_sxdg_3_R = $signed(st2_QSV_1_0) - $signed(st2_QSV_1_1) + $signed(st2_QSV_3_0) + $signed(st2_QSV_3_1);
    assign temp_sxdg_3_I = $signed(st2_QSV_1_1) + $signed(st2_QSV_1_0) + $signed(st2_QSV_3_1) - $signed(st2_QSV_3_0);

    logic signed [15:0] st3_QSV_0_0, st3_QSV_0_1;
    logic signed [15:0] st3_QSV_1_0, st3_QSV_1_1;
    logic signed [15:0] st3_QSV_2_0, st3_QSV_2_1;
    logic signed [15:0] st3_QSV_3_0, st3_QSV_3_1;
    logic st3_valid;

    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            st3_valid   <= 1'b0;
            st3_QSV_0_0 <= '0; st3_QSV_0_1 <= '0;
            st3_QSV_1_0 <= '0; st3_QSV_1_1 <= '0;
            st3_QSV_2_0 <= '0; st3_QSV_2_1 <= '0;
            st3_QSV_3_0 <= '0; st3_QSV_3_1 <= '0;
        end else begin
            st3_valid   <= st2_valid;
            st3_QSV_0_0 <= shift_and_saturate(temp_sxdg_0_R);
            st3_QSV_0_1 <= shift_and_saturate(temp_sxdg_0_I);
            st3_QSV_1_0 <= shift_and_saturate(temp_sxdg_1_R);
            st3_QSV_1_1 <= shift_and_saturate(temp_sxdg_1_I);
            st3_QSV_2_0 <= shift_and_saturate(temp_sxdg_2_R);
            st3_QSV_2_1 <= shift_and_saturate(temp_sxdg_2_I);
            st3_QSV_3_0 <= shift_and_saturate(temp_sxdg_3_R);
            st3_QSV_3_1 <= shift_and_saturate(temp_sxdg_3_I);
        end
    end

    // Stage 4: Swap(0, 1) to Outputs
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            io_out_valid   <= 1'b0;
            io_out_QSV_0_0 <= '0; io_out_QSV_0_1 <= '0;
            io_out_QSV_1_0 <= '0; io_out_QSV_1_1 <= '0;
            io_out_QSV_2_0 <= '0; io_out_QSV_2_1 <= '0;
            io_out_QSV_3_0 <= '0; io_out_QSV_3_1 <= '0;
        end else begin
            io_out_valid   <= st3_valid;
            io_out_QSV_0_0 <= st3_QSV_0_0;
            io_out_QSV_0_1 <= st3_QSV_0_1;
            io_out_QSV_1_0 <= st3_QSV_2_0;  // Swapped with 2
            io_out_QSV_1_1 <= st3_QSV_2_1;
            io_out_QSV_2_0 <= st3_QSV_1_0;  // Swapped with 1
            io_out_QSV_2_1 <= st3_QSV_1_1;
            io_out_QSV_3_0 <= st3_QSV_3_0;
            io_out_QSV_3_1 <= st3_QSV_3_1;
        end
    end

endmodule
