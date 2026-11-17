# Module interfaces — family `qft-3qubit-8bit`

State vector: 8 basis states x (real, imag), 8-bit fixed point Q1.7 (1.0 = 0x80).

## The ONLY modules a top-level circuit instantiates

Gates: `CSGate3QubitVector8bit`, `CTGate3QubitVector8bit`, `HGate3QubitVector8bit`, `SWGate3QubitVector8bit`
Permutations: `CompatiblePerm`, `CompatiblePerm_1`, `CompatiblePerm_2`

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
  output         io_out_valid
```

## EXCEPTIONS — modules whose port list deviates from the base

The hardware generator prunes ports it proves unused. Connecting a
pruned port fails elaboration exactly like a misnamed one.

- `CSGate3QubitVector8bit` does NOT have: `io_in_QSV_3_1`, `io_in_QSV_7_1` — omit these connections entirely.

## CRITICAL — the permutation adapter rule

`SwapPosition*` and `rearrangeTo1stPosition*` modules exist in the library
but use a DIFFERENT interface (`io_in_ket_*`/`io_out_ket_*`) and are
internal. NEVER instantiate them in a top-level circuit. `CompatiblePerm`
and its numbered variants are the top-level adapters: standard `io_*_QSV_*`
interface, permutation wrapped inside.
