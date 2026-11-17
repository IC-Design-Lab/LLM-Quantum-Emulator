# LLM-Quantum-Emulator

Generating the top-level SystemVerilog for an FPGA quantum-circuit emulator with
language models, and measuring whether it is correct.

The top level of these designs is wiring only: it instantiates pre-verified library
modules — gates, and the permutation modules that move qubits onto the physical slots
those gates are hard-wired to use — and chains them. Getting it right is a composition
problem, not an arithmetic one, which makes it a fair test of whether a model can apply
a hardware convention it has been told about.

Correctness is decided by **simulation**, never by diffing against a reference file.
The expected state vector is computed from the Qiskit specification, so a circuit with
no reference implementation is scored exactly like one that has it, and a design wired
differently but computing the correct state passes.

The paper this repository accompanies, *Evaluating LLM-Generated Hardware for Quantum
Circuit Simulation*, is in [`paper/manuscript/`](paper/manuscript/).

## Two studies

**[`generation-study/`](generation-study/)** — can a model do this from a prompt alone,
and how does it fail? A grid of 11 circuits x 2 input formats x 4 prompt levels x 3
models x 5 repetitions, 661 designs of which 372 passed simulation, with failures sorted
into a taxonomy: hallucinated modules, missing permutations, wrong decomposition, wrong
latency, unstable valid protocol.

**[`rag-cag-system/`](rag-cag-system/)** — does supplying the right context fix those
failures? A generator that preloads the family's gate map, exact port lists and
composition rulebook, retrieves one structurally matched worked example, lints
statically before spending a simulation, and repairs from the lint findings.

**53 of 55 circuits match their golden state** across 2-, 3- and 5-qubit families, at
1.07 generation attempts per circuit. One failure is a defect in the gate library; the
other is a generation error that passed its screened input and was exposed only by
re-simulating from a set of inputs covering every qubit exchange. See
[`rag-cag-system/results/RESULTS.md`](rag-cag-system/results/RESULTS.md).

The second study answers the first. The failure modes catalogued in `generation-study/`
are what `rag-cag-system/` was built to eliminate, and the ablations there report which
part of the supplied context each one actually needed.

## What came out of it

Three defects were found in artifacts that were assumed correct, each by simulation
rather than by inspection:

- The **5-qubit reference implementation is wrong** — it ends with one permutation too
  many and leaves qubits 3 and 4 exchanged. It went undetected because the input it was
  customarily driven from is invariant under exactly that exchange. Any evaluation
  scoring by comparison against that reference would have marked the defect correct.
- **`sx` followed by `sxdg` returns −I** in hardware, and that negative breaks the next
  Hadamard through a sign-extension bug in `SplitMultiplier`.
- The **static linter rejected circuits it could never accept** — a gate that genuinely
  lacks two input ports could not satisfy an equality check on port lists.

## Layout

    sim/                 ModelSim driver, shared by both studies
    generation-study/    the prompt-only study and its results
    rag-cag-system/      the retrieval + preloaded-context system
    paper/               the manuscript, the table generators, and the data they read
    docs/                setup, and the provenance of the hardware and the synthesis runs

## Reproducing the results

Four tiers, by what each needs.

### Open tools only — no API key, no simulator

```bash
pip install -r rag-cag-system/requirements.txt
cd rag-cag-system
python qiskit_compat.py        # 344/344 statevectors vs an independent simulator
python rag/lint_generated.py   # reference designs lint clean
python rag/families.py         # gate -> module mappings verified against hardware
python rag/consolidate.py      # 55 scored, 53 pass, 1.07 attempts/circuit
cd .. && python paper/make_tables.py
```

`make_tables.py` reads only committed files and stops if what it finds disagrees with
what the paper states. It regenerates Table I (55/53), Table II (latency), Table III (the
context ablation) and Table IV (hardware cost) exactly as `paper/manuscript/` carries
them. Every Phase I number — the 661/372 split, the per-model grid, the failure taxonomy,
the library-use breakdown — comes from the CSVs in `generation-study/results/`.

### ModelSim required

Every functional verdict, the covering re-check, the V5\_6 route result and the cycle
counts of Table VII are simulation results:

```bash
python rag-cag-system/new_circuits/verify_generated.py <spec> <design> --input <basis>
python paper/coverage_check.py --cover      # re-score the 3- and 5-qubit designs
python paper/coverage_check.py --v56        # the route, against a copy with it removed
python paper/coverage_check.py --qft        # the full QFT, with the H-safety screen off
python paper/measure_cycles.py              # 25 runs; --recheck re-reads cycles.csv
```

See [`docs/setup.md`](docs/setup.md) for `MODELSIM_BIN` and `QSIM_DIR`.

### API key and paid model access required

Regenerating any design calls `gemini-3.5-flash` and needs `GEMINI_API_KEY`:

```bash
python rag-cag-system/rag/generate_v2.py <spec.py>
python rag-cag-system/rag/eval_v2.py --specs "rag-cag-system/new_circuits/specs/NC_*.py"
```

Outputs were **not** byte-identical at temperature 0: of four circuits regenerated from
an identical prompt, three reproduced the same file and one did not, its text changing
while its module sequence stayed the same. A local open-model backend
(Qwen2.5-Coder-7B through Ollama) is supported with `--backend ollama`; no result in the
paper comes from it.

### Not reproducible from this repository

- **The FPGA synthesis numbers** (Table VI, `paper/data/hardware.csv`). The Vivado
  projects, the constraints and any synthesis script were not retained; only the reports
  were. They can be re-read and re-parsed, not re-run.
  [`docs/synthesis-provenance.md`](docs/synthesis-provenance.md) records how they were
  produced, and `rag-cag-system/results/vivado/synthesis-inputs/` holds the exact design
  and support files that were synthesized.
- **The 1.18 attempts-per-circuit figure** quoted for the state before the linter fix.
  The result JSONs it was computed from exist only in an earlier repository's history.
The nine `.qpy` format-equivalence circuits **are** reproducible: their containers,
`group_0_0.qpy` and `group_1_0.qpy`, are in `rag-cag-system/new_circuits/specs/`
alongside `U3.qpy` and `V5.qpy`, and the result records name them by those paths. Their
9/9 is reported in the Table I caption and is not part of the 55.

## Tables and figures: what is generated and what is not

| Artifact | Source |
|---|---|
| Tables I–IV | `paper/make_tables.py`, from `paper/data/` and `rag-cag-system/results/` |
| Table V (prompt-only grid) | hand-written from `generation-study/results/runs_matched_arms.csv` |
| Table VII (failure classes) | hand-written from the `error_types` column of the same CSV |
| Table VIII (library use) | hand-written from `generation-study/results/conformance_map.csv`, written by `generation-study/experiment/matched_arms/conformance_analysis.py` |
| Table IX (covering sets) | hand-written from `paper/data/coverage.csv`, written by `paper/coverage_check.py --cover` |
| Table X (V5\_6 route) | hand-written from `paper/data/v56_route.csv`, written by `paper/coverage_check.py --v56` |
| `fig/llm-verilog-workflow.png`, `fig/fig2_composition.png` | drawn by hand; no generating script |
| `fig/phase1_cliff.pdf` | **no generating script exists in this repository** |
| `paper/figures/*.pdf` | `paper/make_figures.py`; not used by the current manuscript |

## The hardware this builds on

The gate library and the reference designs were not written for this project.
[`docs/hardware-provenance.md`](docs/hardware-provenance.md) records where they came
from and on what terms; it states that they are

> **Open source, and therefore redistributable here.** The Chisel generator these modules
> come from, and the output it produces, are open source; Dr. Xiaokun Yang confirmed this
> on 2026-11-17.

and that the repository's `LICENSE` covers the code, documentation and experimental
records written for this project but does not extend to those hardware modules. Anyone
reusing the hardware should cite the group's prior work rather than this repository.

The excluded files, as `LICENSE` lists them:

    generation-study/gate_library/*.sv
    generation-study/ground_truth/*.sv
    generation-study/experiment/ground_truth/*.sv
    generation-study/experiment/matched_arms/ground_truth/_lib_shared.sv
    generation-study/experiment/matched_arms/ground_truth/_lib_sx.sv
    generation-study/experiment/matched_arms/ground_truth/gate_library_flat_07_08.sv
    rag-cag-system/corpus/code_examples/*/*_ground_truth.sv
    rag-cag-system/results/vivado/synthesis-inputs/support/*_gen_support.sv
    rag-cag-system/rag/output_v2/ShorFixed.sv
    rag-cag-system/results/vivado/synthesis-inputs/designs/ShorFixed.sv

Everything else is covered, including the generated designs in
`rag-cag-system/rag/output_v2/` and the composed references in
`rag-cag-system/new_circuits/reference/`, which this repository's own
`reference_composer.py` emits. `docs/hardware-provenance.md` classifies all 92 tracked
`.sv` files by origin and names the one file whose origin is not established.

## References

The FPGA quantum-circuit emulator this work generates hardware for, and the language its
reference implementation is written in:

[1] Q. Liu, X. Li, J. Liu, X. Yang, L. Li, Y. Yu, Y. Zhang, L. Ma, S. Xu and V.
Chaudhary, "Non-Separable Wire Cutting: Enhancing Quantum Compilation", QCE 2026.

[2] X. Yang, X. Li, J. W. Turner, C. D. Disomma, Y. Feng, X. Zhang, V. Chaudhary, and
S. Xu, "Scalable Quantum Circuit Simulation via Circuit Cutting and FPGA Acceleration",
HPDC 2026.

[3] UC Berkeley, EECS. *Chisel: Constructing Hardware in a Scala Embedded Language.*
Software, 2022.

## A note on the logs

Captured simulator and tool output under `paper/data/transcripts/` is verbatim. It is
evidence, and rewriting it to look tidier would make it less trustworthy, not more. The
result CSVs and JSONs have had local absolute paths rewritten to repository-relative
ones, which is lossless; the transcripts have not been touched.
