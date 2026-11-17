"""Full matched-arms grid runner: 9 circuits x 2 formats x 4 levels x model,
1 run per cell by default. Resumable -- skips any (circuit, input_format,
prompt_level, model) combo that already has a row in results_matched.csv, so
a re-invocation after an interruption doesn't waste quota on duplicate work.

Usage:
    python run_grid.py gemini-3.1-flash-lite
    python run_grid.py gemini-3.1-flash-lite --target 2   # 2 runs per cell
"""
import csv
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import assemble
import run_cell
import generate_matched as gm

ROOT = Path(__file__).resolve().parent
RESULTS_CSV = ROOT / "results" / "results_matched.csv"

CIRCUITS = assemble.CIRCUITS
FORMATS = assemble.FORMATS
LEVELS = assemble.LEVELS


def existing_count(circuit, input_format, level, model) -> int:
    if not RESULTS_CSV.exists():
        return 0
    n = 0
    with open(RESULTS_CSV, newline="", encoding="utf-8") as f:
        for row in csv.DictReader(f):
            if (row["circuit"] == circuit and row["input_format"] == input_format
                    and row["prompt_level"] == level and row["model"] == model):
                n += 1
    return n


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    model = sys.argv[1]
    target = 1
    if "--target" in sys.argv:
        target = int(sys.argv[sys.argv.index("--target") + 1])

    cells = [(c, f, l) for c in CIRCUITS for f in FORMATS for l in LEVELS]
    total = len(cells)
    print(f"== matched-arms grid: {len(CIRCUITS)} circuits x {len(FORMATS)} formats x "
          f"{len(LEVELS)} levels = {total} cells, target={target}/cell, model={model} ==")

    done = 0
    skipped = 0
    failed_calls = 0
    for circuit, input_format, level in cells:
        have = existing_count(circuit, input_format, level, model)
        needed = max(0, target - have)
        if needed == 0:
            skipped += 1
            continue
        for _ in range(needed):
            print(f"\n-- {circuit}/{input_format}/{level}/{model} (have {have}, need {needed}) --")
            try:
                run_cell.run_one(circuit, input_format, level, model)
                done += 1
            except gm.DailyQuotaExceeded:
                print(f"!! daily quota exhausted for {model} -- stopping grid here.")
                print(f"== summary: {done} calls made this run, {skipped} cells already satisfied, "
                      f"{failed_calls} calls failed and were skipped ==")
                return
            except gm.ModelUnavailable as e:
                print(f"!! model unavailable: {e} -- stopping grid here.")
                return
            except Exception as e:
                print(f"!! error on {circuit}/{input_format}/{level}: {e} -- logging nothing, continuing.")
                failed_calls += 1
                time.sleep(5)

    print(f"\n== grid complete: {done} calls made, {skipped} cells already satisfied, "
          f"{failed_calls} calls failed and were skipped ==")


if __name__ == "__main__":
    main()
