"""Emit the prompt-only study's pass-rate figure (fig/phase1_cliff.pdf).

The figure states four fractions: how many designs passed simulation at the full
prompt level and at every lower level combined, for 2-qubit circuits and for 3- and
5-qubit circuits. All four are counted here from the study's own run records,

    generation-study/results/runs_matched_arms.csv

so the figure cannot drift from the data behind it. Nothing is hard-coded: the script
prints what it counted and writes the same numbers into the bars.

    python paper/make_phase1_cliff.py              -> paper/figures/phase1_cliff.pdf
    python paper/make_phase1_cliff.py --out <path> -> write somewhere else
"""
from __future__ import annotations

import csv
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import paperlib as L  # noqa: E402

RUNS = L.REPO / "generation-study" / "results" / "runs_matched_arms.csv"
FULL = "full"
# Circuit size per benchmark. The nine 2-qubit circuits are the Circuit* family; the
# other two circuits in the grid are the 3-qubit QFT and the 5-qubit GHZ ("Shor").
SIZE = {"QFT": 3, "Shor": 5}


def qubits(circuit: str) -> int:
    return SIZE.get(circuit, 2)


def counts() -> dict:
    if not RUNS.exists():
        L.die(f"{RUNS} not found")
    rows = list(csv.DictReader(RUNS.open(encoding="utf-8")))
    if not rows:
        L.die(f"{RUNS} is empty")
    groups = {"2-qubit": lambda c: qubits(c) == 2,
              "3- and 5-qubit": lambda c: qubits(c) != 2}
    out = {}
    for name, keep in groups.items():
        g = [r for r in rows if keep(r["circuit"])]
        for level, pick in (("full", lambda r: r["prompt_variant"] == FULL),
                            ("below", lambda r: r["prompt_variant"] != FULL)):
            s = [r for r in g if pick(r)]
            if not s:
                L.die(f"no runs for {name}/{level}")
            out[(name, level)] = (sum(r["pass_fail"] == "PASS" for r in s), len(s))
    total = sum(n for _, n in out.values())
    if total != len(rows):
        L.die(f"the four cells cover {total} runs, not the {len(rows)} in the file")
    return out


def main() -> int:
    c = counts()
    print(f"counted from {RUNS.relative_to(L.REPO)}")
    for (grp, lvl), (p, n) in c.items():
        print(f"  {grp:<16} {lvl:<6} {p:>3}/{n:<4} = {100 * p / n:5.1f}%")

    try:
        import matplotlib
        matplotlib.use("Agg")
        import matplotlib.pyplot as plt
    except ImportError:
        L.die("matplotlib is needed to draw the figure (pip install matplotlib); "
              "the counts above are the figure's content")

    out = Path(sys.argv[sys.argv.index("--out") + 1]) if "--out" in sys.argv \
        else L.FIGURES / "phase1_cliff.pdf"
    groups = ["2-qubit", "3- and 5-qubit"]
    fig, ax = plt.subplots(figsize=(3.4, 2.2))
    width = 0.34
    for i, lvl in enumerate(("full", "below")):
        xs = [j + (i - 0.5) * width for j in range(len(groups))]
        ys = [100 * c[(g, lvl)][0] / c[(g, lvl)][1] for g in groups]
        bars = ax.bar(xs, ys, width,
                      label="Full prompt level" if lvl == "full" else "Below full prompt level",
                      color="#4C6EB1" if lvl == "full" else "#B1B5BF",
                      edgecolor="black", linewidth=0.4)
        for b, g in zip(bars, groups):
            p, n = c[(g, lvl)]
            ax.annotate(f"{p}/{n}\n{100 * p / n:.1f}", (b.get_x() + b.get_width() / 2, b.get_height()),
                        ha="center", va="bottom", fontsize=6)
    ax.set_xticks(range(len(groups)))
    ax.set_xticklabels(groups, fontsize=8)
    ax.set_ylabel("Designs passing simulation (%)", fontsize=8)
    ax.set_ylim(0, 112)
    ax.set_yticks([0, 25, 50, 75, 100])
    ax.tick_params(labelsize=7)
    ax.legend(fontsize=6, frameon=False, loc="upper right")
    ax.spines[["top", "right"]].set_visible(False)
    fig.tight_layout()
    out.parent.mkdir(parents=True, exist_ok=True)
    fig.savefig(out)
    print(f"\nwrote {out}")
    print("The committed figure in paper/manuscript/fig/phase1_cliff.pdf was drawn "
          "separately; this script reproduces its numbers, not its styling.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
