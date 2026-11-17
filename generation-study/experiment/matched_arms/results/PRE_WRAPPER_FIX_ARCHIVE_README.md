# Archived rows: pre-wrapper-fix medium/medium_strict data

`results_matched_PRE_WRAPPER_FIX_ARCHIVE.csv` holds 36 rows (run_n=1, medium and
medium_strict, all 9 circuits x 2 formats) pulled out of `results_matched.csv` on
2026-07-18.

**Why:** `gate_library/gate_library.json` was edited directly (not through this
pipeline) at 2026-07-18 12:01:29, adding an explicit `wrapper_module` field to every
gate entry. Before that edit, the file only implied wrapper names via one example
in a prose note plus a `*2QubitVector16bit` pattern -- for non-trivial gates
(HadamardGate -> HGate..., SwapGate -> SWGate..., ControlledNotGate -> CNGate...)
the model had to guess, and did so wrong almost every time.

These 36 rows were generated before that edit landed (2026-07-16, log timestamps
15:28-16:05) and show medium=0/18, medium_strict=0/18 -- a result driven by the
unfixed library, not by the medium/medium_strict prompt levels themselves.
`full` is unaffected (its `pipeline.json` attachment independently states the
correct wrapper names regardless of gate_library.json) and `sparse` is unaffected
(it never attaches gate_library.json), so only medium/medium_strict rows needed
archiving.

These numbers are superseded. Do not blend them with the live `results_matched.csv`.
Kept for the record as evidence of the pre-fix failure mode, not as valid
experiment data.
