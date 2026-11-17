# Module interfaces — family `shor-5qubit-8bit`

State vector: 32 basis states x (real, imag), 8-bit fixed point Q1.7 (1.0 = 0x80).

## The ONLY modules a top-level circuit instantiates

Gates: `CNGate5QubitVector8bit`, `HGate5QubitVector8bit`
Permutations: `CompatiblePerm`, `CompatiblePerm_1`, `CompatiblePerm_10`, `CompatiblePerm_2`, `CompatiblePerm_3`, `CompatiblePerm_4`, `CompatiblePerm_5`, `CompatiblePerm_6`, `CompatiblePerm_9`

## Their single shared interface (exact, harvested from verified hardware)

Every module above uses EXACTLY this port list. Any other port name fails
to elaborate.

```
  input          clock
  input          reset
  input  [7:0]   io_in_QSV_0_0
  input  [7:0]   io_in_QSV_0_1
  input  [7:0]   io_in_QSV_1_0
  input  [7:0]   io_in_QSV_1_1
  input  [7:0]   io_in_QSV_2_0
  input  [7:0]   io_in_QSV_2_1
  input  [7:0]   io_in_QSV_3_0
  input  [7:0]   io_in_QSV_3_1
  input  [7:0]   io_in_QSV_4_0
  input  [7:0]   io_in_QSV_4_1
  input  [7:0]   io_in_QSV_5_0
  input  [7:0]   io_in_QSV_5_1
  input  [7:0]   io_in_QSV_6_0
  input  [7:0]   io_in_QSV_6_1
  input  [7:0]   io_in_QSV_7_0
  input  [7:0]   io_in_QSV_7_1
  input  [7:0]   io_in_QSV_8_0
  input  [7:0]   io_in_QSV_8_1
  input  [7:0]   io_in_QSV_9_0
  input  [7:0]   io_in_QSV_9_1
  input  [7:0]   io_in_QSV_10_0
  input  [7:0]   io_in_QSV_10_1
  input  [7:0]   io_in_QSV_11_0
  input  [7:0]   io_in_QSV_11_1
  input  [7:0]   io_in_QSV_12_0
  input  [7:0]   io_in_QSV_12_1
  input  [7:0]   io_in_QSV_13_0
  input  [7:0]   io_in_QSV_13_1
  input  [7:0]   io_in_QSV_14_0
  input  [7:0]   io_in_QSV_14_1
  input  [7:0]   io_in_QSV_15_0
  input  [7:0]   io_in_QSV_15_1
  input  [7:0]   io_in_QSV_16_0
  input  [7:0]   io_in_QSV_16_1
  input  [7:0]   io_in_QSV_17_0
  input  [7:0]   io_in_QSV_17_1
  input  [7:0]   io_in_QSV_18_0
  input  [7:0]   io_in_QSV_18_1
  input  [7:0]   io_in_QSV_19_0
  input  [7:0]   io_in_QSV_19_1
  input  [7:0]   io_in_QSV_20_0
  input  [7:0]   io_in_QSV_20_1
  input  [7:0]   io_in_QSV_21_0
  input  [7:0]   io_in_QSV_21_1
  input  [7:0]   io_in_QSV_22_0
  input  [7:0]   io_in_QSV_22_1
  input  [7:0]   io_in_QSV_23_0
  input  [7:0]   io_in_QSV_23_1
  input  [7:0]   io_in_QSV_24_0
  input  [7:0]   io_in_QSV_24_1
  input  [7:0]   io_in_QSV_25_0
  input  [7:0]   io_in_QSV_25_1
  input  [7:0]   io_in_QSV_26_0
  input  [7:0]   io_in_QSV_26_1
  input  [7:0]   io_in_QSV_27_0
  input  [7:0]   io_in_QSV_27_1
  input  [7:0]   io_in_QSV_28_0
  input  [7:0]   io_in_QSV_28_1
  input  [7:0]   io_in_QSV_29_0
  input  [7:0]   io_in_QSV_29_1
  input  [7:0]   io_in_QSV_30_0
  input  [7:0]   io_in_QSV_30_1
  input  [7:0]   io_in_QSV_31_0
  input  [7:0]   io_in_QSV_31_1
  input          io_in_valid
  output [7:0]   io_out_QSV_0_0
  output [7:0]   io_out_QSV_0_1
  output [7:0]   io_out_QSV_1_0
  output [7:0]   io_out_QSV_1_1
  output [7:0]   io_out_QSV_2_0
  output [7:0]   io_out_QSV_2_1
  output [7:0]   io_out_QSV_3_0
  output [7:0]   io_out_QSV_3_1
  output [7:0]   io_out_QSV_4_0
  output [7:0]   io_out_QSV_4_1
  output [7:0]   io_out_QSV_5_0
  output [7:0]   io_out_QSV_5_1
  output [7:0]   io_out_QSV_6_0
  output [7:0]   io_out_QSV_6_1
  output [7:0]   io_out_QSV_7_0
  output [7:0]   io_out_QSV_7_1
  output [7:0]   io_out_QSV_8_0
  output [7:0]   io_out_QSV_8_1
  output [7:0]   io_out_QSV_9_0
  output [7:0]   io_out_QSV_9_1
  output [7:0]   io_out_QSV_10_0
  output [7:0]   io_out_QSV_10_1
  output [7:0]   io_out_QSV_11_0
  output [7:0]   io_out_QSV_11_1
  output [7:0]   io_out_QSV_12_0
  output [7:0]   io_out_QSV_12_1
  output [7:0]   io_out_QSV_13_0
  output [7:0]   io_out_QSV_13_1
  output [7:0]   io_out_QSV_14_0
  output [7:0]   io_out_QSV_14_1
  output [7:0]   io_out_QSV_15_0
  output [7:0]   io_out_QSV_15_1
  output [7:0]   io_out_QSV_16_0
  output [7:0]   io_out_QSV_16_1
  output [7:0]   io_out_QSV_17_0
  output [7:0]   io_out_QSV_17_1
  output [7:0]   io_out_QSV_18_0
  output [7:0]   io_out_QSV_18_1
  output [7:0]   io_out_QSV_19_0
  output [7:0]   io_out_QSV_19_1
  output [7:0]   io_out_QSV_20_0
  output [7:0]   io_out_QSV_20_1
  output [7:0]   io_out_QSV_21_0
  output [7:0]   io_out_QSV_21_1
  output [7:0]   io_out_QSV_22_0
  output [7:0]   io_out_QSV_22_1
  output [7:0]   io_out_QSV_23_0
  output [7:0]   io_out_QSV_23_1
  output [7:0]   io_out_QSV_24_0
  output [7:0]   io_out_QSV_24_1
  output [7:0]   io_out_QSV_25_0
  output [7:0]   io_out_QSV_25_1
  output [7:0]   io_out_QSV_26_0
  output [7:0]   io_out_QSV_26_1
  output [7:0]   io_out_QSV_27_0
  output [7:0]   io_out_QSV_27_1
  output [7:0]   io_out_QSV_28_0
  output [7:0]   io_out_QSV_28_1
  output [7:0]   io_out_QSV_29_0
  output [7:0]   io_out_QSV_29_1
  output [7:0]   io_out_QSV_30_0
  output [7:0]   io_out_QSV_30_1
  output [7:0]   io_out_QSV_31_0
  output [7:0]   io_out_QSV_31_1
  output         io_out_valid
```

## CRITICAL — the permutation adapter rule

`SwapPosition*` and `rearrangeTo1stPosition*` modules exist in the library
but use a DIFFERENT interface (`io_in_ket_*`/`io_out_ket_*`) and are
internal. NEVER instantiate them in a top-level circuit. `CompatiblePerm`
and its numbered variants are the top-level adapters: standard `io_*_QSV_*`
interface, permutation wrapped inside.
