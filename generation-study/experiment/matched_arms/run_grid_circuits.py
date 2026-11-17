"""Targeted replicate runner scoped to specific circuits (e.g. new circuit
families being added), leaving all other circuits untouched. Reuses
run_grid.py's resumable existing_count() logic.

Usage:
    python run_grid_circuits.py gemini-3.1-flash-lite --circuits QFT,Shor --target 1
"""
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import assemble
import run_cell
import generate_matched as gm
from run_grid import existing_count

FORMATS = assemble.FORMATS
LEVELS = assemble.LEVELS


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    model = sys.argv[1]
    circuits = ["QFT", "Shor"]
    target = 1
    if "--circuits" in sys.argv:
        circuits = sys.argv[sys.argv.index("--circuits") + 1].split(",")
    if "--target" in sys.argv:
        target = int(sys.argv[sys.argv.index("--target") + 1])

    cells = [(c, f, l) for c in circuits for f in FORMATS for l in LEVELS]
    print(f"== targeted replicate run: {len(cells)} cells, circuits={circuits}, target={target}/cell, model={model} ==")

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
