"""Official 2-qubit matched-arms grid (Circuit_00..08 ONLY -- QFT/Shor are
explicitly out of scope, hardcoded exclusion, not just default args). Runs a
given (level, target) tier: both formats, all 9 two-qubit circuits.
Resumable -- skips any cell already at or above target in results_matched.csv.

Usage:
    python run_official_2qubit_grid.py gemini-3.5-flash --levels sparse,medium_strict --target 5
    python run_official_2qubit_grid.py gemini-3.5-flash --levels full,medium --target 3
"""
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import assemble
import run_cell
import generate_matched as gm
from run_grid import existing_count

TWO_QUBIT_CIRCUITS = assemble.TWO_QUBIT_CIRCUITS  # Circuit_00..Circuit_08 only
FORMATS = assemble.FORMATS


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    model = sys.argv[1]
    levels = ["sparse", "medium_strict"]
    target = 5
    if "--levels" in sys.argv:
        levels = sys.argv[sys.argv.index("--levels") + 1].split(",")
    if "--target" in sys.argv:
        target = int(sys.argv[sys.argv.index("--target") + 1])

    cells = [(c, f, l) for c in TWO_QUBIT_CIRCUITS for f in FORMATS for l in levels]
    print(f"== official 2-qubit grid: {len(cells)} cells (9 circuits x 2 formats x "
          f"{len(levels)} levels={levels}), target={target}/cell, model={model} ==")
    print(f"-- circuits in scope: {TWO_QUBIT_CIRCUITS}")

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

    print(f"\n== tier complete: {done} calls made, {skipped} cells already satisfied, {failed_calls} failed ==")


if __name__ == "__main__":
    main()
