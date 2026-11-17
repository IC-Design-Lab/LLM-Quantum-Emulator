# Archived rows: pre-port-fix QFT full/medium/medium_strict data

`results_matched_QFT_PRE_PORTFIX_ARCHIVE.csv` holds 6 rows (QFT, full/medium/medium_strict,
both formats) pulled out of `results_matched.csv` on 2026-07-18.

**Why:** `gate_library/gate_library_QFT.json` documented `CSGate3QubitVector8bit` with the
full uniform 18-port interface, but the real compiled module (verified directly against
`QFTcircuit_8bit_NC.sv`) is missing `io_in_QSV_3_1` and `io_in_QSV_7_1` on the input side --
CIRCT proved the imaginary component feeding this CS instance is always zero at this point
in the circuit and pruned those two ports entirely. Only one `CSGate3QubitVector8bit`
module definition exists (shared by both instances in the circuit), so this pruning is
consistent, not instance-specific. H, CT, SW, and all three CompatiblePerm variants were
checked too and match their documented ports exactly -- CS was the only gate wrong.

All 6 archived rows show the model correctly using the real module names and the real
pipeline stage sequence, then wiring to the (wrong) documented port list -- a genuine
library documentation bug, not a model mistake. QFT/sparse (no gate library attached) and
all Shor rows are unaffected and were NOT archived.

**Methodological note for the record:** CIRCT's circuit-specific port pruning means the
"correct" generated Verilog here must match an optimizer-pruned interface, not the
canonical/generic gate interface. A model that produced the full-port (tied-off) version
of CS would be functionally correct hardware but would still fail this exact-match compile
check. That is a real limitation of exact-match verification against an optimized
baseline -- noted here, not corrected by loosening verification.

These 6 rows are superseded. Do not blend them with the live `results_matched.csv`. Kept
for the record as evidence of the pre-fix failure mode, not as valid experiment data.
