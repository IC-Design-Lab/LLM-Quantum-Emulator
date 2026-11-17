module Shor (
    input  logic       clock,
    input  logic       reset,
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
    input  logic [7:0] io_in_QSV_8_0,
    input  logic [7:0] io_in_QSV_8_1,
    input  logic [7:0] io_in_QSV_9_0,
    input  logic [7:0] io_in_QSV_9_1,
    input  logic [7:0] io_in_QSV_10_0,
    input  logic [7:0] io_in_QSV_10_1,
    input  logic [7:0] io_in_QSV_11_0,
    input  logic [7:0] io_in_QSV_11_1,
    input  logic [7:0] io_in_QSV_12_0,
    input  logic [7:0] io_in_QSV_12_1,
    input  logic [7:0] io_in_QSV_13_0,
    input  logic [7:0] io_in_QSV_13_1,
    input  logic [7:0] io_in_QSV_14_0,
    input  logic [7:0] io_in_QSV_14_1,
    input  logic [7:0] io_in_QSV_15_0,
    input  logic [7:0] io_in_QSV_15_1,
    input  logic [7:0] io_in_QSV_16_0,
    input  logic [7:0] io_in_QSV_16_1,
    input  logic [7:0] io_in_QSV_17_0,
    input  logic [7:0] io_in_QSV_17_1,
    input  logic [7:0] io_in_QSV_18_0,
    input  logic [7:0] io_in_QSV_18_1,
    input  logic [7:0] io_in_QSV_19_0,
    input  logic [7:0] io_in_QSV_19_1,
    input  logic [7:0] io_in_QSV_20_0,
    input  logic [7:0] io_in_QSV_20_1,
    input  logic [7:0] io_in_QSV_21_0,
    input  logic [7:0] io_in_QSV_21_1,
    input  logic [7:0] io_in_QSV_22_0,
    input  logic [7:0] io_in_QSV_22_1,
    input  logic [7:0] io_in_QSV_23_0,
    input  logic [7:0] io_in_QSV_23_1,
    input  logic [7:0] io_in_QSV_24_0,
    input  logic [7:0] io_in_QSV_24_1,
    input  logic [7:0] io_in_QSV_25_0,
    input  logic [7:0] io_in_QSV_25_1,
    input  logic [7:0] io_in_QSV_26_0,
    input  logic [7:0] io_in_QSV_26_1,
    input  logic [7:0] io_in_QSV_27_0,
    input  logic [7:0] io_in_QSV_27_1,
    input  logic [7:0] io_in_QSV_28_0,
    input  logic [7:0] io_in_QSV_28_1,
    input  logic [7:0] io_in_QSV_29_0,
    input  logic [7:0] io_in_QSV_29_1,
    input  logic [7:0] io_in_QSV_30_0,
    input  logic [7:0] io_in_QSV_30_1,
    input  logic [7:0] io_in_QSV_31_0,
    input  logic [7:0] io_in_QSV_31_1,
    input  logic       io_in_valid,
    
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
    output logic [7:0] io_out_QSV_8_0,
    output logic [7:0] io_out_QSV_8_1,
    output logic [7:0] io_out_QSV_9_0,
    output logic [7:0] io_out_QSV_9_1,
    output logic [7:0] io_out_QSV_10_0,
    output logic [7:0] io_out_QSV_10_1,
    output logic [7:0] io_out_QSV_11_0,
    output logic [7:0] io_out_QSV_11_1,
    output logic [7:0] io_out_QSV_12_0,
    output logic [7:0] io_out_QSV_12_1,
    output logic [7:0] io_out_QSV_13_0,
    output logic [7:0] io_out_QSV_13_1,
    output logic [7:0] io_out_QSV_14_0,
    output logic [7:0] io_out_QSV_14_1,
    output logic [7:0] io_out_QSV_15_0,
    output logic [7:0] io_out_QSV_15_1,
    output logic [7:0] io_out_QSV_16_0,
    output logic [7:0] io_out_QSV_16_1,
    output logic [7:0] io_out_QSV_17_0,
    output logic [7:0] io_out_QSV_17_1,
    output logic [7:0] io_out_QSV_18_0,
    output logic [7:0] io_out_QSV_18_1,
    output logic [7:0] io_out_QSV_19_0,
    output logic [7:0] io_out_QSV_19_1,
    output logic [7:0] io_out_QSV_20_0,
    output logic [7:0] io_out_QSV_20_1,
    output logic [7:0] io_out_QSV_21_0,
    output logic [7:0] io_out_QSV_21_1,
    output logic [7:0] io_out_QSV_22_0,
    output logic [7:0] io_out_QSV_22_1,
    output logic [7:0] io_out_QSV_23_0,
    output logic [7:0] io_out_QSV_23_1,
    output logic [7:0] io_out_QSV_24_0,
    output logic [7:0] io_out_QSV_24_1,
    output logic [7:0] io_out_QSV_25_0,
    output logic [7:0] io_out_QSV_25_1,
    output logic [7:0] io_out_QSV_26_0,
    output logic [7:0] io_out_QSV_26_1,
    output logic [7:0] io_out_QSV_27_0,
    output logic [7:0] io_out_QSV_27_1,
    output logic [7:0] io_out_QSV_28_0,
    output logic [7:0] io_out_QSV_28_1,
    output logic [7:0] io_out_QSV_29_0,
    output logic [7:0] io_out_QSV_29_1,
    output logic [7:0] io_out_QSV_30_0,
    output logic [7:0] io_out_QSV_30_1,
    output logic [7:0] io_out_QSV_31_0,
    output logic [7:0] io_out_QSV_31_1,
    output logic       io_out_valid
);

    localparam signed [15:0] H_FACTOR = 181;

    always_ff @(posedge clock) begin
        if (reset) begin
            io_out_valid <= 1'b0;
        end else begin
            io_out_valid <= io_in_valid;

            io_out_QSV_0_0  <= ( ( $signed(io_in_QSV_0_0)  + $signed(io_in_QSV_1_0)  ) * H_FACTOR ) >>> 8;
            io_out_QSV_0_1  <= ( ( $signed(io_in_QSV_0_1)  + $signed(io_in_QSV_1_1)  ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_1_0  <= ( ( $signed(io_in_QSV_2_0)  - $signed(io_in_QSV_3_0)  ) * H_FACTOR ) >>> 8;
            io_out_QSV_1_1  <= ( ( $signed(io_in_QSV_2_1)  - $signed(io_in_QSV_3_1)  ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_2_0  <= ( ( $signed(io_in_QSV_6_0)  + $signed(io_in_QSV_7_0)  ) * H_FACTOR ) >>> 8;
            io_out_QSV_2_1  <= ( ( $signed(io_in_QSV_6_1)  + $signed(io_in_QSV_7_1)  ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_3_0  <= ( ( $signed(io_in_QSV_4_0)  - $signed(io_in_QSV_5_0)  ) * H_FACTOR ) >>> 8;
            io_out_QSV_3_1  <= ( ( $signed(io_in_QSV_4_1)  - $signed(io_in_QSV_5_1)  ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_4_0  <= ( ( $signed(io_in_QSV_12_0) + $signed(io_in_QSV_13_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_4_1  <= ( ( $signed(io_in_QSV_12_1) + $signed(io_in_QSV_13_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_5_0  <= ( ( $signed(io_in_QSV_14_0) - $signed(io_in_QSV_15_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_5_1  <= ( ( $signed(io_in_QSV_14_1) - $signed(io_in_QSV_15_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_6_0  <= ( ( $signed(io_in_QSV_10_0) + $signed(io_in_QSV_11_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_6_1  <= ( ( $signed(io_in_QSV_10_1) + $signed(io_in_QSV_11_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_7_0  <= ( ( $signed(io_in_QSV_8_0)  - $signed(io_in_QSV_9_0)  ) * H_FACTOR ) >>> 8;
            io_out_QSV_7_1  <= ( ( $signed(io_in_QSV_8_1)  - $signed(io_in_QSV_9_1)  ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_8_0  <= ( ( $signed(io_in_QSV_24_0) + $signed(io_in_QSV_25_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_8_1  <= ( ( $signed(io_in_QSV_24_1) + $signed(io_in_QSV_25_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_9_0  <= ( ( $signed(io_in_QSV_26_0) - $signed(io_in_QSV_27_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_9_1  <= ( ( $signed(io_in_QSV_26_1) - $signed(io_in_QSV_27_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_10_0 <= ( ( $signed(io_in_QSV_30_0) + $signed(io_in_QSV_31_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_10_1 <= ( ( $signed(io_in_QSV_30_1) + $signed(io_in_QSV_31_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_11_0 <= ( ( $signed(io_in_QSV_28_0) - $signed(io_in_QSV_29_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_11_1 <= ( ( $signed(io_in_QSV_28_1) - $signed(io_in_QSV_29_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_12_0 <= ( ( $signed(io_in_QSV_20_0) + $signed(io_in_QSV_21_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_12_1 <= ( ( $signed(io_in_QSV_20_1) + $signed(io_in_QSV_21_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_13_0 <= ( ( $signed(io_in_QSV_22_0) - $signed(io_in_QSV_23_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_13_1 <= ( ( $signed(io_in_QSV_22_1) - $signed(io_in_QSV_23_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_14_0 <= ( ( $signed(io_in_QSV_18_0) + $signed(io_in_QSV_19_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_14_1 <= ( ( $signed(io_in_QSV_18_1) + $signed(io_in_QSV_19_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_15_0 <= ( ( $signed(io_in_QSV_16_0) - $signed(io_in_QSV_17_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_15_1 <= ( ( $signed(io_in_QSV_16_1) - $signed(io_in_QSV_17_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_16_0 <= ( ( $signed(io_in_QSV_16_0) + $signed(io_in_QSV_17_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_16_1 <= ( ( $signed(io_in_QSV_16_1) + $signed(io_in_QSV_17_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_17_0 <= ( ( $signed(io_in_QSV_18_0) - $signed(io_in_QSV_19_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_17_1 <= ( ( $signed(io_in_QSV_18_1) - $signed(io_in_QSV_19_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_18_0 <= ( ( $signed(io_in_QSV_22_0) + $signed(io_in_QSV_23_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_18_1 <= ( ( $signed(io_in_QSV_22_1) + $signed(io_in_QSV_23_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_19_0 <= ( ( $signed(io_in_QSV_20_0) - $signed(io_in_QSV_21_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_19_1 <= ( ( $signed(io_in_QSV_20_1) - $signed(io_in_QSV_21_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_20_0 <= ( ( $signed(io_in_QSV_28_0) + $signed(io_in_QSV_29_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_20_1 <= ( ( $signed(io_in_QSV_28_1) + $signed(io_in_QSV_29_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_21_0 <= ( ( $signed(io_in_QSV_30_0) - $signed(io_in_QSV_31_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_21_1 <= ( ( $signed(io_in_QSV_30_1) - $signed(io_in_QSV_31_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_22_0 <= ( ( $signed(io_in_QSV_26_0) + $signed(io_in_QSV_27_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_22_1 <= ( ( $signed(io_in_QSV_26_1) + $signed(io_in_QSV_27_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_23_0 <= ( ( $signed(io_in_QSV_24_0) - $signed(io_in_QSV_25_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_23_1 <= ( ( $signed(io_in_QSV_24_1) - $signed(io_in_QSV_25_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_24_0 <= ( ( $signed(io_in_QSV_8_0)  + $signed(io_in_QSV_9_0)  ) * H_FACTOR ) >>> 8;
            io_out_QSV_24_1 <= ( ( $signed(io_in_QSV_8_1)  + $signed(io_in_QSV_9_1)  ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_25_0 <= ( ( $signed(io_in_QSV_10_0) - $signed(io_in_QSV_11_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_25_1 <= ( ( $signed(io_in_QSV_10_1) - $signed(io_in_QSV_11_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_26_0 <= ( ( $signed(io_in_QSV_14_0) + $signed(io_in_QSV_15_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_26_1 <= ( ( $signed(io_in_QSV_14_1) + $signed(io_in_QSV_15_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_27_0 <= ( ( $signed(io_in_QSV_12_0) - $signed(io_in_QSV_13_0) ) * H_FACTOR ) >>> 8;
            io_out_QSV_27_1 <= ( ( $signed(io_in_QSV_12_1) - $signed(io_in_QSV_13_1) ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_28_0 <= ( ( $signed(io_in_QSV_4_0)  + $signed(io_in_QSV_5_0)  ) * H_FACTOR ) >>> 8;
            io_out_QSV_28_1 <= ( ( $signed(io_in_QSV_4_1)  + $signed(io_in_QSV_5_1)  ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_29_0 <= ( ( $signed(io_in_QSV_6_0)  - $signed(io_in_QSV_7_0)  ) * H_FACTOR ) >>> 8;
            io_out_QSV_29_1 <= ( ( $signed(io_in_QSV_6_1)  - $signed(io_in_QSV_7_1)  ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_30_0 <= ( ( $signed(io_in_QSV_2_0)  + $signed(io_in_QSV_3_0)  ) * H_FACTOR ) >>> 8;
            io_out_QSV_30_1 <= ( ( $signed(io_in_QSV_2_1)  + $signed(io_in_QSV_3_1)  ) * H_FACTOR ) >>> 8;
            
            io_out_QSV_31_0 <= ( ( $signed(io_in_QSV_0_0)  - $signed(io_in_QSV_1_0)  ) * H_FACTOR ) >>> 8;
            io_out_QSV_31_1 <= ( ( $signed(io_in_QSV_0_1)  - $signed(io_in_QSV_1_1)  ) * H_FACTOR ) >>> 8;
        end
    end

endmodule
