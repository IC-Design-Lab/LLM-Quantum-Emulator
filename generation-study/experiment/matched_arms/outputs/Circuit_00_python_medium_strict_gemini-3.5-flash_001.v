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

    wire [15:0] h_out_QSV_0_0;
    wire [15:0] h_out_QSV_0_1;
    wire [15:0] h_out_QSV_1_0;
    wire [15:0] h_out_QSV_1_1;
    wire [15:0] h_out_QSV_2_0;
    wire [15:0] h_out_QSV_2_1;
    wire [15:0] h_out_QSV_3_0;
    wire [15:0] h_out_QSV_3_1;
    wire        h_out_valid;

    HGate2QubitVector16bit h_gate_inst (
        .clock          (clock),
        .reset          (reset),
        .io_in_QSV_0_0  (io_in_QSV_0_0),
        .io_in_QSV_0_1  (io_in_QSV_0_1),
        .io_in_QSV_1_0  (io_in_QSV_1_0),
        .io_in_QSV_1_1  (io_in_QSV_1_1),
        .io_in_QSV_2_0  (io_in_QSV_2_0),
        .io_in_QSV_2_1  (io_in_QSV_2_1),
        .io_in_QSV_3_0  (io_in_QSV_3_0),
        .io_in_QSV_3_1  (io_in_QSV_3_1),
        .io_in_valid    (io_in_valid),
        .io_out_QSV_0_0 (h_out_QSV_0_0),
        .io_out_QSV_0_1 (h_out_QSV_0_1),
        .io_out_QSV_1_0 (h_out_QSV_1_0),
        .io_out_QSV_1_1 (h_out_QSV_1_1),
        .io_out_QSV_2_0 (h_out_QSV_2_0),
        .io_out_QSV_2_1 (h_out_QSV_2_1),
        .io_out_QSV_3_0 (h_out_QSV_3_0),
        .io_out_QSV_3_1 (h_out_QSV_3_1),
        .io_out_valid   (h_out_valid)
    );

    SWGate2QubitVector16bit swap_gate_inst (
        .clock          (clock),
        .reset          (reset),
        .io_in_QSV_0_0  (h_out_QSV_0_0),
        .io_in_QSV_0_1  (h_out_QSV_0_1),
        .io_in_QSV_1_0  (h_out_QSV_1_0),
        .io_in_QSV_1_1  (h_out_QSV_1_1),
        .io_in_QSV_2_0  (h_out_QSV_2_0),
        .io_in_QSV_2_1  (h_out_QSV_2_1),
        .io_in_QSV_3_0  (h_out_QSV_3_0),
        .io_in_QSV_3_1  (h_out_QSV_3_1),
        .io_in_valid    (h_out_valid),
        .io_out_QSV_0_0 (io_out_QSV_0_0),
        .io_out_QSV_0_1 (io_out_QSV_0_1),
        .io_out_QSV_1_0 (io_out_QSV_1_0),
        .io_out_QSV_1_1 (io_out_QSV_1_1),
        .io_out_QSV_2_0 (io_out_QSV_2_0),
        .io_out_QSV_2_1 (io_out_QSV_2_1),
        .io_out_QSV_3_0 (io_out_QSV_3_0),
        .io_out_QSV_3_1 (io_out_QSV_3_1),
        .io_out_valid   (io_out_valid)
    );

endmodule
