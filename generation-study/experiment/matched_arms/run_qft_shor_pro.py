"""QFT + Shor on gemini-3.1-pro-preview, with a DIFFERENT replicate target per
level (not spread evenly): full=3, medium=5, medium_strict=5, sparse=1.
Both formats, both circuits. Resumable per (circuit, format, level, model).

Usage:
    python run_qft_shor_pro.py gemini-3.1-pro-preview
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
TARGET_BY_LEVEL = {
    "full": 3,
    "medium": 5,
    "medium_strict": 5,
    "sparse": 1,
}


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    model = sys.argv[1]

    cells = [(c, f, l, t) for c in CIRCUITS for f in FORMATS for l, t in TARGET_BY_LEVEL.items()]
    total_target_calls = sum(t for *_, t in cells)
    print(f"== QFT/Shor Pro-tier run: {len(cells)} cells, per-level targets {TARGET_BY_LEVEL}, "
          f"up to {total_target_calls} total calls, model={model} ==")

    done = 0
    skipped = 0
    failed_calls = 0
    for circuit, input_format, level, target in cells:
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
