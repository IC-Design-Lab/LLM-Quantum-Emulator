# paper/

The manuscript, the scripts that generate its tables and figures, and the data those
scripts read.

    manuscript/     main.tex, xy.bib, IEEEtran.cls, fig/, the table .tex files, main.pdf
    make_tables.py  emits Tables I-IV of the manuscript
    make_figures.py emits paper/figures/fig1_architecture.pdf and fig2_verification.pdf
                    (not used by the current manuscript)
    make_phase1_cliff.py  counts the four pass-rate fractions of the prompt-only
                    figure from runs_matched_arms.csv and redraws it
    measure_cycles.py  measures pipeline latency in ModelSim -> data/cycles.csv
    coverage_check.py  the covering-input, V5_6-route and full-QFT checks
    paperlib.py     shared helpers: locate files, parse reports, write .tex and .csv
    data/           the measured inputs to the tables, and the transcripts behind them
    tables/         the generated .tex, byte-identical to the copies in manuscript/
    figures/        make_figures.py output

## Entry points

```bash
python paper/make_tables.py        # no simulator, no API key; stops if a guard fails
python paper/measure_cycles.py     # ModelSim; --recheck re-reads data/cycles.csv
python paper/coverage_check.py --cover | --v56 | --qft | --recheck
```

`make_tables.py` writes into `tables/`. The manuscript's copies are the same bytes, so
regenerating and copying over them is a no-op; a difference means the data moved.

## Which numbers come from where

Tables I–IV are generated. Tables V, VII, VIII, IX and X are hand-written from script
output — the top-level `README.md` names the script behind each.

The manuscript's `fig/phase1_cliff.pdf` was drawn by hand. `make_phase1_cliff.py`
recomputes its four fractions — 89/90, 256/414, 23/37 and 4/120 — from
`generation-study/results/runs_matched_arms.csv` and redraws the figure into
`figures/phase1_cliff.pdf`. The numbers match; the styling does not, so the manuscript
keeps its own copy.

`data/transcripts/` is raw ModelSim output, kept verbatim, local paths included.
