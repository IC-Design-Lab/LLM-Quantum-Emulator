module Circuit_01 (
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

    logic signed [15:0] in_r[4];
    logic signed [15:0] in_i[4];

    assign in_r[0] = io_in_QSV_0_0;
    assign in_i[0] = io_in_QSV_0_1;
    assign in_r[1] = io_in_QSV_1_0;
    assign in_i[1] = io_in_QSV_1_1;
    assign in_r[2] = io_in_QSV_2_0;
    assign in_i[2] = io_in_QSV_2_1;
    assign in_r[3] = io_in_QSV_3_0;
    assign in_i[3] = io_in_QSV_3_1;

    logic signed [15:0] stage1_r[4];
    logic signed [15:0] stage1_i[4];
    logic               stage1_valid;

    logic signed [15:0] stage2_r[4];
    logic signed [15:0] stage2_i[4];
    logic               stage2_valid;

    logic signed [15:0] stage3_r[4];
    logic signed [15:0] stage3_i[4];
    logic               stage3_valid;

    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            stage1_valid <= 1'b0;
            for (int i = 0; i < 4; i++) begin
                stage1_r[i] <= 16'sd0;
                stage1_i[i] <= 16'sd0;
            end
        end else begin
            stage1_valid <= io_in_valid;
            if (io_in_valid) begin
                stage1_r[0] <= $signed((($signed(in_r[0]) + $signed(in_r[1])) * 16'sd23170) >>> 15);
                stage1_i[0] <= $signed((($signed(in_i[0]) + $signed(in_i[1])) * 16'sd23170) >>> 15);
                stage1_r[1] <= $signed((($signed(in_r[0]) - $signed(in_r[1])) * 16'sd23170) >>> 15);
                stage1_i[1] <= $signed((($signed(in_i[0]) - $signed(in_i[1])) * 16'sd23170) >>> 15);

                stage1_r[2] <= $signed((($signed(in_r[2]) + $signed(in_r[3])) * 16'sd23170) >>> 15);
                stage1_i[2] <= $signed((($signed(in_i[2]) + $signed(in_i[3])) * 16'sd23170) >>> 15);
                stage1_r[3] <= $signed((($signed(in_r[2]) - $signed(in_r[3])) * 16'sd23170) >>> 15);
                stage1_i[3] <= $signed((($signed(in_i[2]) - $signed(in_i[3])) * 16'sd23170) >>> 15);
            end
        end
    end

    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            stage2_valid <= 1'b0;
            for (int i = 0; i < 4; i++) begin
                stage2_r[i] <= 16'sd0;
                stage2_i[i] <= 16'sd0;
            end
        end else begin
            stage2_valid <= stage1_valid;
            if (stage1_valid) begin
                stage2_r[0] <= stage1_r[2];
                stage2_i[0] <= stage1_i[2];
                stage2_r[1] <= stage1_r[3];
                stage2_i[1] <= stage1_i[3];
                stage2_r[2] <= stage1_r[0];
                stage2_i[2] <= stage1_i[0];
                stage2_r[3] <= stage1_r[1];
                stage2_i[3] <= stage1_i[1];
            end
        end
    end

    always_ff @(posedg clock or posedge reset) begin
        if (reset) begin
            stage3_valid <= 1'b0;
            for (int i = 0; i < 4; i++) begin
                stage3_r[i] <= 16'sd0;
                stage3_i[i] <= 16'sd0;
            end
        end else begin
            stage3_valid <= stage2_valid;
            if (stage2_valid) begin
                stage3_r[0] <= stage2_r[0];
                stage3_i[0] <= stage2_i[0];
                stage3_r[1] <= stage2_r[2];
                stage3_i[1] <= stage2_i[2];
                stage3_r[2] <= stage2_r[1];
                stage3_i[2] <= stage2_i[1];
                stage3_r[3] <= stage2_r[3];
                stage3_i[3] <= stage2_i[3];
            end
        end
    end

    assign io_out_QSV_0_0 = stage3_r[0];
    assign io_out_QSV_0_1 = stage3_i[0];
    assign io_out_QSV_1_0 = stage3_r[1];
    assign io_out_QSV_1_1 = stage3_i[1];
    assign io_out_QSV_2_0 = stage3_r[2];
    assign io_out_QSV_2_1 = stage3_i[2];
    assign io_out_QSV_3_0 = stage3_r[3];
    assign io_out_QSV_3_1 = stage3_i[3];
    assign io_out_valid   = stage3_valid;

endmodule
