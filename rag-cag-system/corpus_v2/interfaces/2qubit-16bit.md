# Module interfaces — family `2qubit-16bit`

State vector: 4 basis states x (real, imag), 16-bit fixed point Q2.14 (1.0 = 0x4000).

## The ONLY modules a top-level circuit instantiates

Gates: `CNGate2QubitVector16bit`, `HGate2QubitVector16bit`, `SWGate2QubitVector16bit`, `SXDGate2QubitVector16bit`, `SXGate2QubitVector16bit`, `XGate2QubitVector16bit`
Permutations: `CompatiblePerm`

## Their single shared interface (exact, harvested from verified hardware)

Every module above uses EXACTLY this port list. Any other port name fails
to elaborate.

```
  input          clock
  input          reset
  input  [15:0]  io_in_QSV_0_0
  input  [15:0]  io_in_QSV_0_1
  input  [15:0]  io_in_QSV_1_0
  input  [15:0]  io_in_QSV_1_1
  input  [15:0]  io_in_QSV_2_0
  input  [15:0]  io_in_QSV_2_1
  input  [15:0]  io_in_QSV_3_0
  input  [15:0]  io_in_QSV_3_1
  input          io_in_valid
  output [15:0]  io_out_QSV_0_0
  output [15:0]  io_out_QSV_0_1
  output [15:0]  io_out_QSV_1_0
  output [15:0]  io_out_QSV_1_1
  output [15:0]  io_out_QSV_2_0
  output [15:0]  io_out_QSV_2_1
  output [15:0]  io_out_QSV_3_0
  output [15:0]  io_out_QSV_3_1
  output         io_out_valid
```

## CRITICAL — the permutation adapter rule

`SwapPosition*` and `rearrangeTo1stPosition*` modules exist in the library
but use a DIFFERENT interface (`io_in_ket_*`/`io_out_ket_*`) and are
internal. NEVER instantiate them in a top-level circuit. `CompatiblePerm`
and its numbered variants are the top-level adapters: standard `io_*_QSV_*`
interface, permutation wrapped inside.
