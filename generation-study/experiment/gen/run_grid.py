"""Generation + verification grid runner.

For each (circuit, prompt_variant, run) this:
  1. Calls Gemini once (generate.generate_verilog) to get a fresh .v file.
  2. Saves it to a scratch path.
  3. Shells out to the EXISTING experiment/log_run.ps1 -- unmodified -- which
     does the ModelSim compile+sim, appends the CSV row, and POSTs to the
     Sheets webhook exactly like every other run already in results.csv.

Nothing about log_run.ps1, results.csv, or the Apps Script is touched here.
"""
import argparse
import subprocess
import sys
import tempfile
from pathlib import Path

import generate as gen
import prompt_variants as pv

EXPERIMENT_DIR = pv.EXPERIMENT_DIR
LOG_RUN_PS1 = EXPERIMENT_DIR / "log_run.ps1"

ALL_CIRCUITS = [
    "Circuit0_06", "Circuit0_17", "Circuit0_2", "Circuit0_3",
    "Circuit0_4", "Circuit0_5", "Circuit1_0167",
]


def run_one(circuit: str, variant: str, model: str, run_index: int, scratch_dir: Path) -> bool:
    print(f"== generating {circuit} / {variant} (run {run_index}) ==", flush=True)
    verilog = gen.generate_verilog(circuit, variant, model=model)

    scratch_file = scratch_dir / f"{circuit}_{variant}_{model}_{run_index:03d}.v"
    scratch_file.write_text(verilog, encoding="utf-8")

    print(f"== verifying {circuit} / {variant} via log_run.ps1 ==", flush=True)
    result = subprocess.run(
        [
            "powershell", "-NoProfile", "-File", str(LOG_RUN_PS1),
            "-Circuit", circuit,
            "-Model", model,
            "-PromptVariant", variant,
            "-InputFormat", "json",
            "-GeneratedFile", str(scratch_file),
        ],
        cwd=str(EXPERIMENT_DIR),
        capture_output=True, text=True,
    )
    print(result.stdout)
    if result.returncode != 0:
        print(result.stderr, file=sys.stderr)
        return False
    return "result  : PASS" in result.stdout or "RESULT: PASS" in result.stdout


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--circuits", nargs="+", default=ALL_CIRCUITS)
    ap.add_argument("--variants", nargs="+", default=list(pv.VARIANTS), choices=pv.VARIANTS)
    ap.add_argument("--n", type=int, default=3, help="runs per (circuit, variant)")
    ap.add_argument("--model", default=gen.DEFAULT_MODEL)
    args = ap.parse_args()

    with tempfile.TemporaryDirectory(prefix="llm_verilog_gen_") as tmp:
        scratch_dir = Path(tmp)
        summary = []
        for circuit in args.circuits:
            for variant in args.variants:
                for i in range(1, args.n + 1):
                    ok = run_one(circuit, variant, args.model, i, scratch_dir)
                    summary.append((circuit, variant, i, ok))

    print("\n== grid summary ==")
    for circuit, variant, i, ok in summary:
        print(f"  {circuit:15s} {variant:8s} run {i}: {'PASS' if ok else 'FAIL/ERROR'}")


if __name__ == "__main__":
    main()
