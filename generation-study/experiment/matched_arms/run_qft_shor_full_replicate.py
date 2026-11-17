"""Targeted replicate runner: QFT + Shor, full level ONLY, both formats.
Used to push the 4 full-level cells (already at N=1, each PASSED) up to a
higher replicate count to check reliability vs a one-off pass.

Usage:
    python run_qft_shor_full_replicate.py gemini-3.5-flash --target 5
"""
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import run_cell
import generate_matched as gm
from run_grid import existing_count

CIRCUITS = ["QFT", "Shor"]
FORMATS = ["python", "json"]
LEVEL = "full"


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    model = sys.argv[1]
    target = 5
    if "--target" in sys.argv:
        target = int(sys.argv[sys.argv.index("--target") + 1])

    cells = [(c, f, LEVEL) for c in CIRCUITS for f in FORMATS]
    print(f"== QFT/Shor full-level replicate run: {len(cells)} cells, target={target}/cell, model={model} ==")

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
                print(f"!! daily quota exhausted for {model} -- stopping here.")
                print(f"== summary: {done} calls made, {skipped} cells already satisfied, {failed_calls} failed ==")
                return
            except gm.ModelUnavailable as e:
                print(f"!! model unavailable: {e} -- stopping here.")
                return
            except Exception as e:
                print(f"!! error on {circuit}/{input_format}/{level}: {e} -- continuing.")
                failed_calls += 1
                time.sleep(5)

    print(f"\n== complete: {done} calls made, {skipped} cells already satisfied, {failed_calls} failed ==")


if __name__ == "__main__":
    main()
