# Superseded intermediate results

`conformance_map_2026-07-24.csv` is the pre-cleanup conformance map (102,719 bytes,
2026-07-24), written by `../../conformance_analysis.py` before the run set was cleaned.

**It is not the paper's source.** Table VIII and the library-use figures in the paper
come from `generation-study/results/conformance_map.csv` (93,499 bytes, 2026-09-15).
Both files are kept because the older one records the run set as it stood at the time;
no script reads this copy. Re-running `conformance_analysis.py` writes a fresh
`conformance_map.csv` into the parent directory and leaves this archive alone.
