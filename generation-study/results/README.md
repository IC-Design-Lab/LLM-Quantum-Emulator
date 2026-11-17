# Results of record

`Logging Results Cleaned.xlsx` is authoritative. Every number in
[`../README.md`](../README.md) comes from it.

The three CSVs beside it are that workbook's sheets exported verbatim, so the data can be
read, diffed and re-analysed without a spreadsheet program, and so a reviewer can check
the reported numbers against a text file in the same commit.

| file | sheet | rows |
|---|---|---|
| `runs_matched_arms.csv` | `Logging Results` | 661 runs — the matched-arms grid |
| `runs_legacy.csv` | `Old Testing` | 193 runs — the earlier hand-run study |
| `conformance_map.csv` | `Conformance_map` | 460 rows |

## Why the raw harness CSVs differ

`../experiment/matched_arms/results/results_matched.csv` (620 rows) and
`../experiment/results/results.csv` (197 rows) are the logging scripts' own output. They
are **superseded**: the workbook is the cleaned and hand-tagged analysis built from them,
and it is larger because tagging continued after those exports were taken.

They are kept because they are what the harness actually wrote, and deleting the raw log
because a cleaned version exists is the kind of tidying that makes a result impossible to
audit. **Cite the workbook, not these.**

## `run_id` is not unique

The 661 runs carry 625 distinct `run_id`s. Re-runs of a grid cell were logged under the
id they repeated, so 36 ids appear twice with different outcomes. Every row is a distinct
run and all 661 count toward the reported rates.

The practical consequence: **do not join on `run_id`**, and do not deduplicate by it. A
join against `outputs/` will attach one generated design to two runs; the file on disk is
whichever of the pair was written last.
