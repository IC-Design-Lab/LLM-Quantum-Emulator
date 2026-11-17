# Generation study — how prompt-only LLM Verilog fails

Can a language model emit correct top-level SystemVerilog for a quantum-circuit
emulator from a prompt alone, and when it cannot, *how* does it fail?

This is the study behind the poster, and the one that motivated
[`../rag-cag-system/`](../rag-cag-system/): the failure modes catalogued here are what
that system was built to remove.

## Design

A matched grid, so every cell differs from its neighbours in exactly one factor:

| factor | levels |
|---|---|
| circuit | 11 (`Circuit_00`–`Circuit_08`, `QFT`, `Shor`) |
| input format | 2 (`json` spec, `python` spec) |
| prompt level | 4 (`sparse`, `medium`, `medium_strict`, `full`) |
| model | 3 (`gemini-3.5-flash`, `gemini-3.1-flash-lite`, `gemini-3.1-pro-preview`) |
| repetitions | 5 |

**661 runs.** Every generated design is compiled and simulated against a self-checking
testbench that compares output amplitudes to a golden state. A FAIL is real data —
testbenches are never edited to make a run pass.

The grid is not fully balanced: `gemini-3.1-pro-preview` was run on 55 cells against
368 for `gemini-3.5-flash`, so model comparisons rest on unequal n.

## Results

The record of analysis is `results/Logging Results Cleaned.xlsx`, sheet `Logging
Results`, exported to `results/runs_matched_arms.csv` so it can be read and diffed
without a spreadsheet program.

**372 of 661 runs pass — 56.3%**, over 11 circuits.

The strongest effect by far is prompt detail:

| prompt variant | pass |
|---|---|
| `full` | 112/127 — 88.2% |
| `medium` | 105/172 — 61.0% |
| `medium_strict` | 110/208 — 52.9% |
| `sparse` | 45/154 — 29.2% |

Model matters second: `gemini-3.5-flash` 68.5%, `gemini-3.1-flash-lite` 45.0%,
`gemini-3.1-pro-preview` 23.6% (n=55, the smallest arm).

**Input format barely matters** — `python` 57.3% vs `json` 55.2%. Worth stating because
it was a plausible confound and turned out not to be one.

Failure taxonomy, tagged by hand because categorising *why* something failed is a
judgment call and not inferable from console output:

| error type | count |
|---|---|
| `functional_wrong_amplitudes` | 169 |
| `missing_perm` | 78 |
| `hallucinated_module` | 67 |
| `wrong_decomposition` | 27 |
| `syntax_error` | 25 |
| `port_name_mismatch` | 11 |
| `unstable_valid_protocol` | 7 |

A run can carry more than one tag, so these exceed the 289 failures.

The two the follow-on system targets directly are `missing_perm` — the model omits
permutation wrappers the hardware requires but the logical circuit never mentions — and
`hallucinated_module`, where it invents a module name that does not exist. Together they
account for 145 tags. Both are addressable with context: exact port lists and a stated
composition rule. That is the hypothesis [`../rag-cag-system/`](../rag-cag-system/)
tests, and `hallucinated_module` in particular is what its static lint is built to catch
before a simulation is spent.

**A note on `run_id`:** 661 runs carry 625 distinct ids, because re-runs of a cell were
logged under the id they repeated. Every row is a distinct run and all 661 count; the ids
are not a join key.

## Layout

    results/                      the analysis set of record — see results/README.md
      ├── Logging Results Cleaned.xlsx    3 sheets, the authoritative workbook
      ├── runs_matched_arms.csv           sheet 1 exported, 661 runs
      ├── runs_legacy.csv                 sheet 2 exported, 193 earlier runs
      └── conformance_map.csv             sheet 3 exported, 460 rows
    experiment/README.md          full methodology, schema, and taxonomy definitions
    experiment/matched_arms/      the main grid: drivers, specs, outputs, raw logs
      ├── outputs/                637 raw generated .v
      ├── results/*.csv           the harness's own logs, superseded by results/
      ├── json_specs/  python_specs/
      └── generate_matched.py, run_grid_*.py, conformance_analysis.py
    experiment/results/           the earlier hand-run study (claude / gemini / chatgpt)
    prompts/                      the four prompt levels
    schemas/                      per-circuit JSON specs at four detail levels
    ground_truth/  testbenches/  gate_library/

## Reproducing

Needs `GEMINI_API_KEY` and ModelSim. See [`../docs/setup.md`](../docs/setup.md).

```bash
python experiment/matched_arms/generate_matched.py   # generate a cell
python experiment/matched_arms/run_grid_circuits.py  # sweep
python experiment/matched_arms/conformance_analysis.py
```

## Not included

Per-run ModelSim transcripts (`results/logs/`, 823 files) and waveform dumps (969
`.vcd`, 830 MB) are excluded as regenerable. The CSVs and the 637 generated designs are
the evidence: the pass/fail table can be re-derived from the outputs by re-running the
testbenches.

Two archived CSV snapshots (`*_PRE_WRAPPER_FIX_ARCHIVE.csv`,
`*_QFT_PRE_PORTFIX_ARCHIVE.csv`) record results from before harness fixes, each with a
README explaining what changed and why the earlier numbers were superseded.


## Where the paper's Phase I numbers come from

| Paper | File |
|---|---|
| 661 runs, 372 passed; Table V (model x prompt level) | `results/runs_matched_arms.csv` |
| Table VII, failure classes over the 289 failing runs | the `error_types` column of the same CSV |

Table VII lists nine classes. Four more tags occur once each and are omitted from the
table: `assumed_multifile_structure`, `incomplete_generation_elided_ports`,
`packed_unpacked_type_error` and `instruction_not_followed`. Every tag, including those,
is in the `error_types` column of `results/runs_matched_arms.csv`; a run can carry
several.
| Table VIII, library use over the 460 retained designs | `results/conformance_map.csv`, written by `experiment/matched_arms/conformance_analysis.py` |
| Figure 2, pass rate by circuit size | the same CSV, grouped by circuit |

`results/Logging Results Cleaned.xlsx` is the hand-tagged workbook the CSVs were cleaned
from. `experiment/matched_arms/results/archive/` holds a superseded intermediate copy of
the conformance map; nothing reads it.

Re-running the grid needs `GEMINI_API_KEY` and ModelSim; the committed CSVs are enough
to reproduce every number the paper quotes.
