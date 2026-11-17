"""Schedule-driven grid runner for the multi-day API call budget.

Unlike run_grid.py (flat circuits x variants x N cartesian product), this
reads a day's schedule -- a JSON list of {circuit, variant, model, target}
entries -- and for each entry only generates the SHORTFALL between what's
already logged in results.csv for that exact (circuit, variant, model) triple
and the entry's target count. That makes it safe to re-run the same day's
schedule file multiple times (e.g. after a crash, or after manually tagging
failures) without creating extra duplicate runs beyond the target.

Each model gets its own per-run safety cap (default 19, one under the 20/day
free-tier ceiling) -- once an entry's calls would exceed the cap, that model
is skipped for the rest of THIS invocation (remaining entries for it are left
for tomorrow's schedule / a re-run after the daily reset). A model hitting
the API's own daily-quota error is handled the same way, gracefully, instead
of crashing the whole run.

Usage:
    .\\.venv\\Scripts\\python.exe run_budget.py schedule\\day1.json
    .\\.venv\\Scripts\\python.exe run_budget.py schedule\\day1.json --cap 18
"""
import argparse
import csv
import json
import subprocess
import sys
import tempfile
from pathlib import Path

import generate as gen
import prompt_variants as pv

RESULTS_CSV = pv.EXPERIMENT_DIR / "results" / "results.csv"
LOG_RUN_PS1 = pv.EXPERIMENT_DIR / "log_run.ps1"

DEFAULT_SAFETY_CAP = 19  # leave 1 unit of headroom under the observed 20/day ceiling


def existing_count(circuit: str, variant: str, model: str) -> int:
    if not RESULTS_CSV.exists():
        return 0
    n = 0
    with open(RESULTS_CSV, newline="", encoding="utf-8") as f:
        reader = csv.reader(f)
        next(reader, None)  # header
        for row in reader:
            if not row:
                continue
            run_id, c, m, v = row[0], row[1], row[2], row[3]
            if c == circuit and v == variant and m == model:
                n += 1
    return n


def run_one(circuit: str, variant: str, model: str, scratch_dir: Path) -> str:
    print(f"== generating {circuit}/{variant}/{model} ==", flush=True)
    verilog = gen.generate_verilog(circuit, variant, model=model)

    scratch_file = scratch_dir / f"{circuit}_{variant}_{model}_budget.v"
    scratch_file.write_text(verilog, encoding="utf-8")

    print("== verifying via log_run.ps1 ==", flush=True)
    result = subprocess.run(
        [
            "powershell", "-NoProfile", "-File", str(LOG_RUN_PS1),
            "-Circuit", circuit,
            "-Model", model,
            "-PromptVariant", variant,
            "-InputFormat", "json",
            "-GeneratedFile", str(scratch_file),
        ],
        cwd=str(pv.EXPERIMENT_DIR),
        capture_output=True, text=True,
    )
    print(result.stdout)
    if result.returncode != 0:
        print(result.stderr, file=sys.stderr)
    return result.stdout


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("schedule", help="path to a day's schedule JSON file")
    ap.add_argument("--cap", type=int, default=DEFAULT_SAFETY_CAP,
                     help="max NEW calls per model in this invocation (default %(default)s)")
    args = ap.parse_args()

    entries = json.loads(Path(args.schedule).read_text(encoding="utf-8"))

    calls_used = {}
    stopped_models = {}  # model -> reason

    with tempfile.TemporaryDirectory(prefix="llm_verilog_budget_") as tmp:
        scratch_dir = Path(tmp)
        for entry in entries:
            circuit, variant, model, target = entry["circuit"], entry["variant"], entry["model"], entry["target"]

            if model in stopped_models:
                print(f"-- skip {circuit}/{variant}/{model}: {stopped_models[model]} --")
                continue

            have = existing_count(circuit, variant, model)
            needed = max(0, target - have)
            if needed == 0:
                print(f"-- {circuit}/{variant}/{model}: already at target ({have}/{target}) --")
                continue

            for _ in range(needed):
                used = calls_used.get(model, 0)
                if used >= args.cap:
                    stopped_models[model] = f"hit this run's safety cap ({args.cap})"
                    print(f"-- {model}: {stopped_models[model]}, stopping this model for now --")
                    break
                try:
                    run_one(circuit, variant, model, scratch_dir)
                    calls_used[model] = used + 1
                except gen.DailyQuotaExceeded:
                    stopped_models[model] = "daily free-tier quota exhausted (confirmed by API)"
                    print(f"-- {model}: {stopped_models[model]}, stopping this model for today --")
                    break
                except gen.ModelUnavailable as e:
                    stopped_models[model] = f"not callable on this account ({e})"
                    print(f"-- {model}: {stopped_models[model]}, stopping this model entirely --", file=sys.stderr)
                    break
                except Exception as e:
                    # Transient (5xx, network, etc.) -- generate_verilog already
                    # retried internally. Don't take down the whole multi-hour
                    # run over one bad call: log it and move on. The shortfall
                    # logic picks this attempt back up on the next invocation
                    # since no CSV row was written for it.
                    print(f"-- {circuit}/{variant}/{model}: transient error, skipping this attempt: {e} --", file=sys.stderr)

    print("\n== budget run summary ==")
    for model, count in calls_used.items():
        print(f"  {model}: {count} new calls this run")
    for model, reason in stopped_models.items():
        print(f"  {model}: STOPPED -- {reason}")

    remaining = []
    for entry in entries:
        have = existing_count(entry["circuit"], entry["variant"], entry["model"])
        if have < entry["target"]:
            remaining.append(f"{entry['circuit']}/{entry['variant']}/{entry['model']} ({have}/{entry['target']})")
    if remaining:
        print(f"\n  {len(remaining)} entries still short of target (carry over to next run):")
        for r in remaining:
            print(f"    {r}")
    else:
        print("\n  all entries at target -- this schedule is fully satisfied.")


if __name__ == "__main__":
    main()
