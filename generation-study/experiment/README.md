# Experiment: LLM-generated quantum-simulation Verilog error taxonomy

Tests whether LLMs can generate correct SystemVerilog for quantum-circuit
simulation, across models, prompt detail levels, and input formats, and
categorizes *how* generated Verilog fails when it fails.

## Folder layout

- **prompts/** — Prompt templates, saved once, referenced by name (not
  duplicated per run). `full.md` is the maximally-detailed baseline (copied
  from the original verified template). `medium.md` and `sparse.md` are
  reduced-detail variants — currently placeholders, need to be written.

- **inputs/** — Circuit spec files (currently JSON, one per circuit; QASM or
  image inputs would also land here when that input_format is tested).

- **ground_truth/** — Known-correct `.sv` answer-key files, one per circuit.

- **testbenches/** — Self-checking testbenches, one per circuit. Compares 8
  output amplitudes against golden-state values. **Never edit these to make
  a run pass** — a FAIL is real data.

- **outputs/** — Generated code under test, one file per run, named
  `<run_id>.<ext>` (e.g. `Circuit0_17_sparse_claude_001.v`). Written
  automatically by `log_run.ps1` — never hand-edited.

- **results/results.csv** — One row per run: `run_id, circuit, model,
  prompt_variant, input_format, pass_fail, failure_stage, error_types, notes`.
  - `failure_stage` (`compile` / `functional`, blank on PASS) is auto-derived by
    `log_run.ps1` from *which phase* failed: `compile` means vlog failed or vsim
    couldn't even elaborate the design (e.g. an instantiated module doesn't
    exist — no cycle ever ran); `functional` means it elaborated and ran, but
    timed out or the amplitudes didn't match golden state.
  - `error_types` is a `;`-separated list (e.g. `hallucinated_module;wrong_latency`)
    from a fixed taxonomy: `hallucinated_module`, `missing_perm`,
    `wrong_decomposition`, `wrong_latency`, `unstable_valid_protocol` (added
    2026-07-11: design uses a one-shot/FSM control structure instead of the
    expected continuous pipeline, so a held-high `io_in_valid` re-triggers it
    and clobbers the result register before the testbench samples it). Always
    blank until tagged by hand —
    `log_run.ps1` never fills this in, since categorizing *why* is a judgment
    call, not something to infer from console output.
  - Rows logged before 2026-07-04 used a single `error_category` column instead;
    they were mechanically realigned to the new schema (blank fields inserted)
    without reinterpreting any recorded result.

- **results/logs/** — Full compile+simulate transcript per run, `<run_id>.log`.
  `notes` in the CSV is a truncated pointer to the real error text; this is
  where the complete ModelSim output (including exact line numbers for things
  like undefined-module errors) lives.

- **results/vcd/** — Waveform per run, named `<run_id>.vcd`.

- **results/build/** — Scratch ModelSim work library, safe to delete/regenerate.

`gate_library/` is NOT duplicated here — `log_run.ps1` references
`../gate_library/` directly.

## Running one test

1. Get a circuit spec from `inputs/<Circuit>.json`, a prompt from
   `prompts/<variant>.md`, feed both to the LLM, save its Verilog output
   somewhere (anywhere — a temp path is fine).
2. Run:
   ```powershell
   .\log_run.ps1 -Circuit Circuit0_2 -Model claude -PromptVariant sparse `
                 -InputFormat json -GeneratedFile C:\path\to\generated.sv
   ```
3. That's it. `log_run.ps1` saves the code to `outputs/`, compiles +
   simulates it in ModelSim, saves the waveform to `results/vcd/`, saves the
   full transcript to `results/logs/`, and appends a row to
   `results/results.csv` with PASS/FAIL and `failure_stage` filled in and
   `error_types` left blank for you to tag.

Gate library resolution is automatic: `Circuit0_2` → tries
`gate_library_flat_0_2.sv`, falling back to the generic
`gate_library_flat.sv` if no per-circuit file exists (same convention used
elsewhere in this project).

## Summarizing results

```powershell
.\summarize.ps1
```

Prints total pass rate, pass rate broken down by model / prompt variant /
input format, a failure count by `failure_stage` (compile vs functional), and
a count of each individual `error_types` tag among failures (a multi-tagged
row counts toward each of its tags, plus an `(untagged)` bucket for failures
not yet reviewed). This is the source for the paper's results table.

## Adding a new circuit

Drop `Circuit<name>.json` into `inputs/`, `Circuit<name>.sv` into
`ground_truth/`, and `tb_Circuit<name>.v` into `testbenches/`. If the
circuit needs gates not in the generic `gate_library_flat.sv`, add
`gate_library_flat_<suffix>.sv` to `../gate_library/` following the existing
naming convention.
