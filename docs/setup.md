# Setup

## Python

```bash
pip install -r rag-cag-system/requirements.txt
```

Developed against Python 3.12. There is no embedding or vector-store dependency: the
system does no similarity search, so the install is small.

## Environment variables

| variable | needed for | default |
|---|---|---|
| `GEMINI_API_KEY` | generation | none — required |
| `MODELSIM_BIN` | simulation | the driver's built-in guess at a ModelSim install |
| `QSIM_DIR` | simulation | `<repo>/sim`, which is correct for a normal checkout |

Only `GEMINI_API_KEY` normally has to be set. `QSIM_DIR` exists for a checkout laid out
differently or a driver installed elsewhere.

## ModelSim

Simulation needs ModelSim (developed against ModelSim ASE) on the machine. Point
`MODELSIM_BIN` at the directory holding `vlog` and `vsim` if the driver cannot find it.

Everything in `sim/` is shared by both studies. It writes a scratch library and a
transcript into `sim/modelsim_build/`, which is gitignored — the directory is recreated
per run, and concurrent runs are serialised by a lock file, since ModelSim shares one
work library and two simultaneous runs corrupt each other's verdicts.

## Versions that affect results

A verdict here depends on more than the Python packages:

| | version used |
|---|---|
| generation model | `gemini-3.5-flash`, temperature 0 |
| Qiskit | 2.5.0 |
| simulator | ModelSim ASE |
| hardware modules | lowered from Chisel by `firtool` 1.62.0 |

CORRECTED 2026-09-15: temperature 0 was NOT verified deterministic. Of four
regenerations from byte-identical prompts, three reproduced the file and one did not
(G3_03). One run per circuit remains the practice, but it rests on convention, not on a
determinism result. The original claim read: temperature 0 was verified deterministic
(byte-identical output on replay), which is why
one run per circuit is enough. A different model version will not reproduce these numbers
exactly, and should not be expected to.

## Running without an API key

Four checks need neither a key nor a simulator, and together they verify the analysis
path end to end:

```bash
cd rag-cag-system
python qiskit_compat.py        # cross-checks every statevector against an independent
                               # numpy simulator written from the gate definitions
python rag/lint_generated.py   # the linter must pass all 9 reference designs before
                               # it is trusted to judge a generated one
python rag/families.py         # gate -> module mappings, checked against the harvested
                               # interface catalogs
python rag/consolidate.py      # recomputes the results table from the raw run records
```

A prompt can also be assembled without spending a call:

```bash
python rag/generate_v2.py new_circuits/specs/NC_03.py --dry-run
```

## If `import qiskit` fails

On a machine where an Application Control policy blocks `rustworkx`, `import qiskit`
fails even though nothing in this project transpiles. `rag-cag-system/qiskit_compat.py`
installs a stand-in for `rustworkx` in exactly that case and is a no-op otherwise. Its
self-test re-computes every statevector with an independent simulator and compares, so
the workaround is checked rather than assumed. The transpiler is unavailable under it.
