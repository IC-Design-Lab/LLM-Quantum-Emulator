# RAG + CAG for quantum-circuit Verilog composition

Generates the top-level SystemVerilog that implements a Qiskit circuit by wiring
together pre-verified hardware modules. Correctness is decided by simulation against a
Qiskit-derived golden statevector, so circuits outside the corpus are scored exactly
like ones inside it.

**Current result: 53 of 55 circuits match their golden state across 2-, 3- and 5-qubit
families**, at 1.07 generation attempts per circuit. One failure is a defect in the gate
library (`GEN_02`); the other is a generation error (`G3_06`) that its screened input
could not see. See `results/RESULTS.md`, and run `python rag/consolidate.py` to
reproduce the count.

## Use

    python rag/generate_v2.py <spec.py>              # generate one circuit
    python rag/eval_v2.py --specs "<glob>"           # generate + verify a set
    python rag/generate_v2.py <spec.py> --dry-run    # assemble the prompt, no API call

Requires `GEMINI_API_KEY`. `--backend ollama` runs a local model free of charge for
pipeline iteration (not for results -- a 7B model fails these prompts).

## Input formats

A circuit comes in either as a `.py` spec or as `.qpy`, Qiskit's binary
serialisation -- what Composer and hardware jobs actually export. Both load through
`canonical_converter.load_circuit`, so retrieval, lint and the golden see the same
object either way.

    python rag/generate_v2.py <file.qpy>             # single-circuit file
    python rag/generate_v2.py <file.qpy#3>           # one circuit out of a container
    python rag/eval_v2.py --specs "<dir>/*.qpy"      # every circuit in every file
    python rag/qpy_survey.py "<glob>"                # what is in there, free

A `.qpy` is a container of any number of circuits, so `#N` selects one and a bare
path is refused when the file holds several -- circuit 0 is not a meaningful default.
Terminal measurements are dropped (the hardware has no readout primitive); a
mid-circuit measurement is refused rather than silently discarded.

`qpy_survey.py` is worth running first: these files are written in batches and are
mostly repeats. Of the 128 circuits in the sample set, 9 are structurally distinct.

## How it works

    spec.py
      |
      +- families.py .............. legality: does this gate exist in this family?
      |
      +- CAG: corpus_v2/ .......... injected in full, every time (~2.4k tokens)
      |     gates.md ............... gate -> module, per family
      |     interfaces/<fam>.md .... exact port lists, harvested from hardware
      |     composition/<fam>.md ... the composition rulebook
      |
      +- RAG: example_retrieval.py  one worked example, structurally matched,
      |                             leave-one-out enforced
      |
      +- generate_v2.py ........... assemble -> generate -> lint -> repair (<=2)
      |     +- lint_generated.py ... static validation before spending a simulation
      |
      +- verification .............. verify_generated.py + simulate.py + hsafe.py

The split is deliberate. Family knowledge is PRELOADED rather than retrieved because
similarity search measurably failed at it: the critical permutation document was
retrieved in 0 of 7 queries. The single worked example is the retrieved part, because
structure is what a rulebook conveys poorly.

## Layout

    rag/                   the system, plus the tools that build its corpus
    corpus_v2/             the CAG payload (built by build_interfaces.py + permcat.py)
    corpus/code_examples/  the 11 worked examples and their verified hardware
    new_circuits/          evaluation specs and the verification harness
    results/               RESULTS.md, raw run records, per-circuit detail
    results/baseline/      the measurements that motivated the design

## Environment note

`qiskit_compat.py` exists because `rustworkx.pyd` is blocked by an Application
Control policy on the development machine, which takes down `import qiskit` even
though Qiskit's own `_accelerate.pyd` loads. It installs a stand-in for rustworkx
ONLY when that specific failure occurs, and is a no-op anywhere rustworkx is
healthy. The transpiler is unavailable under the stand-in; nothing here transpiles.

    python qiskit_compat.py     # cross-checks every statevector against an
                                # independent numpy simulator -- 344/344 agree

## Rebuilding the corpus

`corpus_v2/` is generated, not hand-written, so it cannot drift from the hardware:

    python rag/build_interfaces.py   # port lists from the ground-truth .sv files
    python rag/permcat.py            # measures each permutation module by simulation
    python rag/derive_rule.py        # recovers native gate positions per family

The composition rulebooks are the one hand-written part, and they are derived from
what those tools measure.


## Entry points

```bash
python qiskit_compat.py                 # statevector cross-check, no API key
python rag/lint_generated.py            # static checks against the reference designs
python rag/consolidate.py               # the scored results: 55 circuits, 53 pass
python rag/generate_v2.py <spec.py>     # needs GEMINI_API_KEY
python rag/eval_v2.py --specs "<glob>"  # generate + verify a set (also needs ModelSim)
python new_circuits/verify_generated.py <spec> <design> --input <basis>
```

`results/` holds the evaluation records: `eval_v2_results_*.json` per set, `RESULTS.md`
for the written account, `detail/` for per-family notes, and `vivado/` for the synthesis
reports plus the exact design and support files that were synthesized
(`vivado/synthesis-inputs/`, described in `../docs/synthesis-provenance.md`).

`corpus_v2/` is the knowledge that goes into every prompt: the gate reference, the module
interfaces per family, and the composition rulebooks. `corpus/code_examples/` holds the
worked examples and the reference designs — see `../docs/hardware-provenance.md` before
redistributing those `.sv` files.
