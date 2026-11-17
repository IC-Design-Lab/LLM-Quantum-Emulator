module QFT (
    input  logic clock,
    input  logic reset,
    input  logic [7:0] io_in_QSV_0_0,
    input  logic [7:0] io_in_QSV_0_1,
    input  logic [7:0] io_in_QSV_1_0,
    input  logic [7:0] io_in_QSV_1_1,
    input  logic [7:0] io_in_QSV_2_0,
    input  logic [7:0] io_in_QSV_2_1,
    input  logic [7:0] io_in_QSV_3_0,
    input  logic [7:0] io_in_QSV_3_1,
    input  logic [7:0] io_in_QSV_4_0,
    input  logic [7:0] io_in_QSV_4_1,
    input  logic [7:0] io_in_QSV_5_0,
    input  logic [7:0] io_in_QSV_5_1,
    input  logic [7:0] io_in_QSV_6_0,
    input  logic [7:0] io_in_QSV_6_1,
    input  logic [7:0] io_in_QSV_7_0,
    input  logic [7:0] io_in_QSV_7_1,
    input  logic io_in_valid,
    output logic [7:0] io_out_QSV_0_0,
    output logic [7:0] io_out_QSV_0_1,
    output logic [7:0] io_out_QSV_1_0,
    output logic [7:0] io_out_QSV_1_1,
    output logic [7:0] io_out_QSV_2_0,
    output logic [7:0] io_out_QSV_2_1,
    output logic [7:0] io_out_QSV_3_0,
    output logic [7:0] io_out_QSV_3_1,
    output logic [7:0] io_out_QSV_4_0,
    output logic [7:0] io_out_QSV_4_1,
    output logic [7:0] io_out_QSV_5_0,
    output logic [7:0] io_out_QSV_5_1,
    output logic [7:0] io_out_QSV_6_0,
    output logic [7:0] io_out_QSV_6_1,
    output logic [7:0] io_out_QSV_7_0,
    output logic [7:0] io_out_QSV_7_1,
    output logic io_out_valid
);

    // QSV 2D array: [pipeline_stage][state_index]
    logic signed [7:0] qsv_r [0:7][0:7];
    logic signed [7:0] qsv_i [0:7][0:7];
    logic valid [0:7];

    // Constant for 1/sqrt(2) approx = 181/256
    localparam signed [31:0] INV_SQRT2 = 32'sd181;

    // Stage 0: Input assignment
    assign qsv_r[0][0] = io_in_QSV_0_0; assign qsv_i[0][0] = io_in_QSV_0_1;
    assign qsv_r[0][1] = io_in_QSV_1_0; assign qsv_i[0][1] = io_in_QSV_1_1;
    assign qsv_r[0][2] = io_in_QSV_2_0; assign qsv_i[0][2] = io_in_QSV_2_1;
    assign qsv_r[0][3] = io_in_QSV_3_0; assign qsv_i[0][3] = io_in_QSV_3_1;
    assign qsv_r[0][4] = io_in_QSV_4_0; assign qsv_i[0][4] = io_in_QSV_4_1;
    assign qsv_r[0][5] = io_in_QSV_5_0; assign qsv_i[0][5] = io_in_QSV_5_1;
    assign qsv_r[0][6] = io_in_QSV_6_0; assign qsv_i[0][6] = io_in_QSV_6_1;
    assign qsv_r[0][7] = io_in_QSV_7_0; assign qsv_i[0][7] = io_in_QSV_7_1;
    assign valid[0]    = io_in_valid;

    // Step 0: H on qubit 0 (pairs differ by 1)
    always_ff @(posedge clock) begin
        if (reset) valid[1] <= 1'b0;
        else valid[1] <= valid[0];

        qsv_r[1][0] <= 8'( ( $signed(qsv_r[0][0]) * INV_SQRT2 + $signed(qsv_r[0][1]) * INV_SQRT2 ) >>> 8 );
        qsv_i[1][0] <= 8'( ( $signed(qsv_i[0][0]) * INV_SQRT2 + $signed(qsv_i[0][1]) * INV_SQRT2 ) >>> 8 );
        qsv_r[1][1] <= 8'( ( $signed(qsv_r[0][0]) * INV_SQRT2 - $signed(qsv_r[0][1]) * INV_SQRT2 ) >>> 8 );
        qsv_i[1][1] <= 8'( ( $signed(qsv_i[0][0]) * INV_SQRT2 - $signed(qsv_i[0][1]) * INV_SQRT2 ) >>> 8 );

        qsv_r[1][2] <= 8'( ( $signed(qsv_r[0][2]) * INV_SQRT2 + $signed(qsv_r[0][3]) * INV_SQRT2 ) >>> 8 );
        qsv_i[1][2] <= 8'( ( $signed(qsv_i[0][2]) * INV_SQRT2 + $signed(qsv_i[0][3]) * INV_SQRT2 ) >>> 8 );
        qsv_r[1][3] <= 8'( ( $signed(qsv_r[0][2]) * INV_SQRT2 - $signed(qsv_r[0][3]) * INV_SQRT2 ) >>> 8 );
        qsv_i[1][3] <= 8'( ( $signed(qsv_i[0][2]) * INV_SQRT2 - $signed(qsv_i[0][3]) * INV_SQRT2 ) >>> 8 );

        qsv_r[1][4] <= 8'( ( $signed(qsv_r[0][4]) * INV_SQRT2 + $signed(qsv_r[0][5]) * INV_SQRT2 ) >>> 8 );
        qsv_i[1][4] <= 8'( ( $signed(qsv_i[0][4]) * INV_SQRT2 + $signed(qsv_i[0][5]) * INV_SQRT2 ) >>> 8 );
        qsv_r[1][5] <= 8'( ( $signed(qsv_r[0][4]) * INV_SQRT2 - $signed(qsv_r[0][5]) * INV_SQRT2 ) >>> 8 );
        qsv_i[1][5] <= 8'( ( $signed(qsv_i[0][4]) * INV_SQRT2 - $signed(qsv_i[0][5]) * INV_SQRT2 ) >>> 8 );

        qsv_r[1][6] <= 8'( ( $signed(qsv_r[0][6]) * INV_SQRT2 + $signed(qsv_r[0][7]) * INV_SQRT2 ) >>> 8 );
        qsv_i[1][6] <= 8'( ( $signed(qsv_i[0][6]) * INV_SQRT2 + $signed(qsv_i[0][7]) * INV_SQRT2 ) >>> 8 );
        qsv_r[1][7] <= 8'( ( $signed(qsv_r[0][6]) * INV_SQRT2 - $signed(qsv_r[0][7]) * INV_SQRT2 ) >>> 8 );
        qsv_i[1][7] <= 8'( ( $signed(qsv_i[0][6]) * INV_SQRT2 - $signed(qsv_i[0][7]) * INV_SQRT2 ) >>> 8 );
    end

    // Step 1: CS on qubits [1, 0]
    always_ff @(posedge clock) begin
        if (reset) valid[2] <= 1'b0;
        else valid[2] <= valid[1];

        for (int i=0; i<8; i++) begin
            if (i == 3 || i == 7) begin
                qsv_r[2][i] <= -qsv_i[1][i];
                qsv_i[2][i] <= qsv_r[1][i];
            end else begin
                qsv_r[2][i] <= qsv_r[1][i];
                qsv_i[2][i] <= qsv_i[1][i];
            end
        end
    end

    // Step 2: CP(pi/4) on qubits [2, 0]
    always_ff @(posedge clock) begin
        if (reset) valid[3] <= 1'b0;
        else valid[3] <= valid[2];

        for (int i=0; i<8; i++) begin
            if (i == 5 || i == 7) begin
                qsv_r[3][i] <= 8'( ( $signed(qsv_r[2][i]) * INV_SQRT2 - $signed(qsv_i[2][i]) * INV_SQRT2 ) >>> 8 );
                qsv_i[3][i] <= 8'( ( $signed(qsv_r[2][i]) * INV_SQRT2 + $signed(qsv_i[2][i]) * INV_SQRT2 ) >>> 8 );
            end else begin
                qsv_r[3][i] <= qsv_r[2][i];
                qsv_i[3][i] <= qsv_i[2][i];
            end
        end
    end

    // Step 3: H on qubit 1 (pairs differ by 2)
    always_ff @(posedge clock) begin
        if (reset) valid[4] <= 1'b0;
        else valid[4] <= valid[3];

        qsv_r[4][0] <= 8'( ( $signed(qsv_r[3][0]) * INV_SQRT2 + $signed(qsv_r[3][2]) * INV_SQRT2 ) >>> 8 );
        qsv_i[4][0] <= 8'( ( $signed(qsv_i[3][0]) * INV_SQRT2 + $signed(qsv_i[3][2]) * INV_SQRT2 ) >>> 8 );
        qsv_r[4][2] <= 8'( ( $signed(qsv_r[3][0]) * INV_SQRT2 - $signed(qsv_r[3][2]) * INV_SQRT2 ) >>> 8 );
        qsv_i[4][2] <= 8'( ( $signed(qsv_i[3][0]) * INV_SQRT2 - $signed(qsv_i[3][2]) * INV_SQRT2 ) >>> 8 );

        qsv_r[4][1] <= 8'( ( $signed(qsv_r[3][1]) * INV_SQRT2 + $signed(qsv_r[3][3]) * INV_SQRT2 ) >>> 8 );
        qsv_i[4][1] <= 8'( ( $signed(qsv_i[3][1]) * INV_SQRT2 + $signed(qsv_i[3][3]) * INV_SQRT2 ) >>> 8 );
        qsv_r[4][3] <= 8'( ( $signed(qsv_r[3][1]) * INV_SQRT2 - $signed(qsv_r[3][3]) * INV_SQRT2 ) >>> 8 );
        qsv_i[4][3] <= 8'( ( $signed(qsv_i[3][1]) * INV_SQRT2 - $signed(qsv_i[3][3]) * INV_SQRT2 ) >>> 8 );

        qsv_r[4][4] <= 8'( ( $signed(qsv_r[3][4]) * INV_SQRT2 + $signed(qsv_r[3][6]) * INV_SQRT2 ) >>> 8 );
        qsv_i[4][4] <= 8'( ( $signed(qsv_i[3][4]) * INV_SQRT2 + $signed(qsv_i[3][6]) * INV_SQRT2 ) >>> 8 );
        qsv_r[4][6] <= 8'( ( $signed(qsv_r[3][4]) * INV_SQRT2 - $signed(qsv_r[3][6]) * INV_SQRT2 ) >>> 8 );
        qsv_i[4][6] <= 8'( ( $signed(qsv_i[3][4]) * INV_SQRT2 - $signed(qsv_i[3][6]) * INV_SQRT2 ) >>> 8 );

        qsv_r[4][5] <= 8'( ( $signed(qsv_r[3][5]) * INV_SQRT2 + $signed(qsv_r[3][7]) * INV_SQRT2 ) >>> 8 );
        qsv_i[4][5] <= 8'( ( $signed(qsv_i[3][5]) * INV_SQRT2 + $signed(qsv_i[3][7]) * INV_SQRT2 ) >>> 8 );
        qsv_r[4][7] <= 8'( ( $signed(qsv_r[3][5]) * INV_SQRT2 - $signed(qsv_r[3][7]) * INV_SQRT2 ) >>> 8 );
        qsv_i[4][7] <= 8'( ( $signed(qsv_i[3][5]) * INV_SQRT2 - $signed(qsv_i[3][7]) * INV_SQRT2 ) >>> 8 );
    end

    // Step 4: CS on qubits [2, 1]
    always_ff @(posedge clock) begin
        if (reset) valid[5] <= 1'b0;
        else valid[5] <= valid[4];

        for (int i=0; i<8; i++) begin
            if (i == 6 || i == 7) begin
                qsv_r[5][i] <= -qsv_i[4][i];
                qsv_i[5][i] <= qsv_r[4][i];
            end else begin
                qsv_r[5][i] <= qsv_r[4][i];
                qsv_i[5][i] <= qsv_i[4][i];
            end
        end
    end

    // Step 5: H on qubit 2 (pairs differ by 4)
    always_ff @(posedge clock) begin
        if (reset) valid[6] <= 1'b0;
        else valid[6] <= valid[5];

        qsv_r[6][0] <= 8'( ( $signed(qsv_r[5][0]) * INV_SQRT2 + $signed(qsv_r[5][4]) * INV_SQRT2 ) >>> 8 );
        qsv_i[6][0] <= 8'( ( $signed(qsv_i[5][0]) * INV_SQRT2 + $signed(qsv_i[5][4]) * INV_SQRT2 ) >>> 8 );
        qsv_r[6][4] <= 8'( ( $signed(qsv_r[5][0]) * INV_SQRT2 - $signed(qsv_r[5][4]) * INV_SQRT2 ) >>> 8 );
        qsv_i[6][4] <= 8'( ( $signed(qsv_i[5][0]) * INV_SQRT2 - $signed(qsv_i[5][4]) * INV_SQRT2 ) >>> 8 );

        qsv_r[6][1] <= 8'( ( $signed(qsv_r[5][1]) * INV_SQRT2 + $signed(qsv_r[5][5]) * INV_SQRT2 ) >>> 8 );
        qsv_i[6][1] <= 8'( ( $signed(qsv_i[5][1]) * INV_SQRT2 + $signed(qsv_i[5][5]) * INV_SQRT2 ) >>> 8 );
        qsv_r[6][5] <= 8'( ( $signed(qsv_r[5][1]) * INV_SQRT2 - $signed(qsv_r[5][5]) * INV_SQRT2 ) >>> 8 );
        qsv_i[6][5] <= 8'( ( $signed(qsv_i[5][1]) * INV_SQRT2 - $signed(qsv_i[5][5]) * INV_SQRT2 ) >>> 8 );

        qsv_r[6][2] <= 8'( ( $signed(qsv_r[5][2]) * INV_SQRT2 + $signed(qsv_r[5][6]) * INV_SQRT2 ) >>> 8 );
        qsv_i[6][2] <= 8'( ( $signed(qsv_i[5][2]) * INV_SQRT2 + $signed(qsv_i[5][6]) * INV_SQRT2 ) >>> 8 );
        qsv_r[6][6] <= 8'( ( $signed(qsv_r[5][2]) * INV_SQRT2 - $signed(qsv_r[5][6]) * INV_SQRT2 ) >>> 8 );
        qsv_i[6][6] <= 8'( ( $signed(qsv_i[5][2]) * INV_SQRT2 - $signed(qsv_i[5][6]) * INV_SQRT2 ) >>> 8 );

        qsv_r[6][3] <= 8'( ( $signed(qsv_r[5][3]) * INV_SQRT2 + $signed(qsv_r[5][7]) * INV_SQRT2 ) >>> 8 );
        qsv_i[6][3] <= 8'( ( $signed(qsv_i[5][3]) * INV_SQRT2 + $signed(qsv_i[5][7]) * INV_SQRT2 ) >>> 8 );
        qsv_r[6][7] <= 8'( ( $signed(qsv_r[5][3]) * INV_SQRT2 - $signed(qsv_r[5][7]) * INV_SQRT2 ) >>> 8 );
        qsv_i[6][7] <= 8'( ( $signed(qsv_i[5][3]) * INV_SQRT2 - $signed(qsv_i[5][7]) * INV_SQRT2 ) >>> 8 );
    end

    // Step 6: SWAP on qubits [0, 2]
    always_ff @(posedge clock) begin
        if (reset) valid[7] <= 1'b0;
        else valid[7] <= valid[6];

        qsv_r[7][0] <= qsv_r[6][0]; qsv_i[7][0] <= qsv_i[6][0];
        qsv_r[7][1] <= qsv_r[6][4]; qsv_i[7][1] <= qsv_i[6][4];
        qsv_r[7][2] <= qsv_r[6][2]; qsv_i[7][2] <= qsv_i[6][2];
        qsv_r[7][3] <= qsv_r[6][6]; qsv_i[7][3] <= qsv_i[6][6];
        qsv_r[7][4] <= qsv_r[6][1]; qsv_i[7][4] <= qsv_i[6][1];
        qsv_r[7][5] <= qsv_r[6][5]; qsv_i[7][5] <= qsv_i[6][5];
        qsv_r[7][6] <= qsv_r[6][3]; qsv_i[7][6] <= qsv_i[6][3];
        qsv_r[7][7] <= qsv_r[6][7]; qsv_i[7][7] <= qsv_i[6][7];
    end

    // Output assignment
    assign io_out_QSV_0_0 = qsv_r[7][0]; assign io_out_QSV_0_1 = qsv_i[7][0];
    assign io_out_QSV_1_0 = qsv_r[7][1]; assign io_out_QSV_1_1 = qsv_i[7][1];
    assign io_out_QSV_2_0 = qsv_r[7][2]; assign io_out_QSV_2_1 = qsv_i[7][2];
    assign io_out_QSV_3_0 = qsv_r[7][3]; assign io_out_QSV_3_1 = qsv_i[7][3];
    assign io_out_QSV_4_0 = qsv_r[7][4]; assign io_out_QSV_4_1 = qsv_i[7][4];
    assign io_out_QSV_5_0 = qsv_r[7][5]; assign io_out_QSV_5_1 = qsv_i[7][5];
    assign io_out_QSV_6_0 = qsv_r[7][6]; assign io_out_QSV_6_1 = qsv_i[7][6];
    assign io_out_QSV_7_0 = qsv_r[7][7]; assign io_out_QSV_7_1 = qsv_i[7][7];
    assign io_out_valid   = valid[7];

endmodule
