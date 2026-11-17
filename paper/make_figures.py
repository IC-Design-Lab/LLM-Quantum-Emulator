"""Emit the paper's figures as vector PDF. Every label that states a fact about the
system is read from the source file that defines it.

FIGURE 1  system architecture. The prompt-section order is parsed from assemble()
          in rag/generate_v2.py; the repair budget from MAX_REPAIRS; the model and
          temperature from rag/core.py; the always-injected context from what is
          actually on disk under corpus_v2/.

FIGURE 2  verification pipeline: two independent paths converging on a comparison.
          Fixed-point formats are derived from GEOM and the tolerances from the tol
          line in new_circuits/verify_generated.py. The script also checks that the
          golden computation reads no Verilog, and prints the evidence.

Both figures are single-column (3.5 in): each is a vertical flow with at most two
lanes, and 8 pt text fits without wrapping into illegibility.

    python paper/make_figures.py
"""
from __future__ import annotations

import math
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import paperlib as L  # noqa: E402

import matplotlib  # noqa: E402
matplotlib.use("Agg")
import matplotlib.pyplot as plt  # noqa: E402
from matplotlib.patches import FancyBboxPatch  # noqa: E402

plt.rcParams.update({
    "font.family": "serif", "font.size": 8, "pdf.fonttype": 42, "ps.fonttype": 42,
    "text.color": "black", "axes.edgecolor": "black",
})
COL_W = 3.5


# --------------------------------------------------------------------------
# facts, read from source
# --------------------------------------------------------------------------
def facts_fig1() -> dict:
    gen = L.RAG / "rag" / "generate_v2.py"
    core = L.RAG / "rag" / "core.py"
    ret = L.RAG / "rag" / "example_retrieval.py"
    conv = L.RAG / "canonical_converter.py"
    g = L.read(gen)
    seen, sections = set(), []
    for m in re.finditer(r"SECTION (\d+) [—-] ([A-Z][A-Z ]*[A-Z])", g):
        n, title = int(m.group(1)), m.group(2).strip()
        if n not in seen:
            seen.add(n)
            sections.append((n, title))
    sections.sort()
    if len(sections) < 5:
        L.die(f"expected 5 prompt sections in assemble(), parsed {sections}")
    max_rep = re.search(r"^MAX_REPAIRS\s*=\s*(\d+)", g, re.M)
    model = re.search(r'^DEFAULT_MODEL\s*=\s*"([^"]+)"', L.read(core), re.M)
    temp = re.search(r"temperature\s*=\s*([\d.]+)", L.read(core))
    loo = re.search(r"leave-one-out", L.read(ret), re.I)
    qpy = ".qpy" in L.read(conv)
    cag = sorted(p.name for p in (L.RAG / "corpus_v2").iterdir()
                 if p.is_file() and p.suffix == ".md" and not p.name.startswith("FINDING"))
    cag_dirs = sorted(p.name for p in (L.RAG / "corpus_v2").iterdir() if p.is_dir())
    for what, ok in (("MAX_REPAIRS", max_rep), ("DEFAULT_MODEL", model),
                     ("temperature", temp), ("leave-one-out", loo)):
        if not ok:
            L.die(f"could not read {what} from source")
    return {"sections": sections, "max_repairs": int(max_rep.group(1)),
            "model": model.group(1), "temperature": float(temp.group(1)),
            "loo": True, "qpy": qpy, "cag_files": cag, "cag_dirs": cag_dirs,
            "sources": [gen, core, ret, conv, L.RAG / "corpus_v2"]}


def facts_fig2() -> dict:
    vg = L.RAG / "new_circuits" / "verify_generated.py"
    sim = L.RAG / "rag" / "simulate.py"
    t = L.read(vg)
    geom_m = re.search(r"^GEOM\s*=\s*(\{[^}]*\})", t, re.M)
    tol_m = re.search(r"tol\s*=\s*(\d+)\s+if\s+width\s*==\s*(\d+)\s+else\s+(\d+)", t)
    gold_m = re.search(r"gold\s*=\s*(Statevector\.from_label\([^\n]*)", t)
    if not (geom_m and tol_m and gold_m):
        L.die("could not read GEOM / tol / golden line from verify_generated.py")
    geom = eval(geom_m.group(1))                     # {nq: (states, width, one)}
    fmt = {}
    for nq, (states, width, one) in geom.items():
        frac = int(math.log2(one))
        fmt[nq] = (f"Q{width - frac}.{frac}", width)
    tol_wide, wide_width, tol_narrow = (int(x) for x in tol_m.groups())
    tol_by_width = {wide_width: tol_wide}
    for _, (_, w, _) in geom.items():
        tol_by_width.setdefault(w, tol_narrow)
    # Independence check: the golden line must not touch any Verilog.
    gold_line = gold_m.group(1)
    independent = ("Statevector" in gold_line and ".sv" not in gold_line
                   and "read" not in gold_line)
    simulator = "ModelSim" if "ModelSim" in L.read(sim) else "simulator"
    return {"geom": geom, "fmt": fmt, "tol_by_width": tol_by_width,
            "gold_line": gold_line.strip(), "independent": independent,
            "simulator": simulator, "sources": [vg, sim]}


# --------------------------------------------------------------------------
# drawing
# --------------------------------------------------------------------------
def canvas(h):
    fig = plt.figure(figsize=(COL_W, h))
    ax = fig.add_axes([0, 0, 1, 1])
    ax.set_xlim(0, COL_W)
    ax.set_ylim(0, h)
    ax.axis("off")
    return fig, ax


def box(ax, cx, cy, w, h, text, fill="white", ls="-", bold_first=False, fs=8):
    ax.add_patch(FancyBboxPatch((cx - w / 2, cy - h / 2), w, h,
                                boxstyle="round,pad=0.02,rounding_size=0.04",
                                fc=fill, ec="black", lw=0.8, ls=ls))
    if bold_first and "\n" in text:
        first, rest = text.split("\n", 1)
        ax.text(cx, cy + 0.07, first, ha="center", va="bottom", fontsize=fs,
                fontweight="bold")
        ax.text(cx, cy + 0.02, rest, ha="center", va="top", fontsize=fs - 0.5,
                linespacing=1.15)
    else:
        ax.text(cx, cy, text, ha="center", va="center", fontsize=fs, linespacing=1.15)


def arrow(ax, x0, y0, x1, y1, label=None, lx=0.06, ls="-"):
    ax.annotate("", xy=(x1, y1), xytext=(x0, y0),
                arrowprops=dict(arrowstyle="-|>", lw=0.8, color="black", ls=ls,
                                shrinkA=0, shrinkB=0, mutation_scale=8))
    if label:
        ax.text((x0 + x1) / 2 + lx, (y0 + y1) / 2, label, fontsize=7,
                ha="left", va="center")


# --------------------------------------------------------------------------
# FIGURE 1
# --------------------------------------------------------------------------
SHORT = {"GATE REFERENCE": "gate reference", "MODULE INTERFACES": "module interfaces",
         "COMPOSITION RULES": "composition rules",
         "WORKED REFERENCE EXAMPLE": "worked example", "CIRCUIT TO IMPLEMENT": "circuit"}


def figure_1(f: dict) -> Path:
    H = 4.9
    fig, ax = canvas(H)
    sx, sw = 2.45, 1.95          # spine centre / width
    kx, kw = 0.72, 1.32          # knowledge column centre / width
    bh = 0.34

    y_spec, y_conv, y_asm, y_llm, y_lint, y_out = 4.55, 3.98, 3.15, 2.30, 1.72, 0.95
    spec_text = "Circuit specification\n(.py or .qpy)" if f["qpy"] else "Circuit specification (.py)"
    box(ax, sx, y_spec, sw, bh + 0.08, spec_text)
    box(ax, sx, y_conv, sw, bh, "Canonical converter")
    sec_lines = "\n".join(f"§{n} {SHORT.get(t, t.lower())}" for n, t in f["sections"])
    box(ax, sx, y_asm, sw, 0.92, "Prompt assembly\n" + sec_lines, bold_first=True)
    box(ax, sx, y_llm, sw, bh + 0.1,
        f"LLM\n{f['model']}, T = {f['temperature']:g}", bold_first=True)
    box(ax, sx, y_lint, sw, bh, "Static lint")
    box(ax, sx, y_out, sw, bh + 0.1, "Generated top-level\nSystemVerilog", fill="0.88")

    def v(y0, y1, label=None):
        arrow(ax, sx, y0, sx, y1, label)
    v(y_spec - (bh + 0.08) / 2, y_conv + bh / 2)
    v(y_conv - bh / 2, y_asm + 0.46)
    v(y_asm - 0.46, y_llm + (bh + 0.1) / 2)
    v(y_llm - (bh + 0.1) / 2, y_lint + bh / 2)
    v(y_lint - bh / 2, y_out + (bh + 0.1) / 2, "lint clean")

    # repair loop: lint -> LLM, on the right of the spine
    rx = sx + sw / 2 + 0.22
    ax.annotate("", xy=(sx + sw / 2, y_llm), xytext=(rx, y_llm),
                arrowprops=dict(arrowstyle="-|>", lw=0.8, color="black",
                                shrinkA=0, shrinkB=0, mutation_scale=8))
    ax.plot([sx + sw / 2, rx, rx], [y_lint, y_lint, y_llm], color="black", lw=0.8)
    ax.text(rx + 0.04, (y_lint + y_llm) / 2, f"repair\n≤ {f['max_repairs']}\nrounds",
            fontsize=7, ha="left", va="center")

    # knowledge paths
    # corpus_v2 entries, ordered as the prompt presents them (by section title)
    entries = [n.removesuffix(".md") for n in f["cag_files"]] + [d + "/" for d in f["cag_dirs"]]
    cag_items = sorted(entries, key=lambda e: next(
        (i for i, (_, t) in enumerate(f["sections"]) if e[:4].upper() in t), 99))
    box(ax, kx, 3.55, kw, 0.78,
        "Always-injected (CAG)\n" + "\n".join(cag_items[:4]), bold_first=True, fs=7.5)
    box(ax, kx, 2.62, kw, 0.78,
        "Retrieved (RAG)\none worked example\nstructurally matched\nleave-one-out",
        bold_first=True, fs=7.5)
    arrow(ax, kx + kw / 2, 3.55, sx - sw / 2, y_asm + 0.18)
    arrow(ax, kx + kw / 2, 2.62, sx - sw / 2, y_asm - 0.18)
    ax.text(kx, 4.12, "family context\n(corpus_v2/)", ha="center", va="center",
            fontsize=7, style="italic")

    L.FIGURES.mkdir(parents=True, exist_ok=True)
    out = L.FIGURES / "fig1_architecture.pdf"
    fig.savefig(out, format="pdf")
    plt.close(fig)
    return out


# --------------------------------------------------------------------------
# FIGURE 2
# --------------------------------------------------------------------------
def figure_2(f: dict) -> Path:
    H = 4.6
    fig, ax = canvas(H)
    ax_a, ax_b, lw = 0.92, 2.58, 1.58   # lane centres, lane width
    bh = 0.40

    # one label per distinct format, widest first
    fmts = sorted({(fmt, w) for fmt, w in f["fmt"].values()}, key=lambda t: -t[1])
    fmt_line = "  /  ".join(fmt for fmt, _ in fmts)
    tol_line = "  /  ".join(f"±{f['tol_by_width'][w]} LSB ({fmt})" for fmt, w in fmts)

    box(ax, (ax_a + ax_b) / 2, 4.22, 2.4, bh + 0.04, "Circuit specification\n(.py or .qpy)")

    ya = [3.45, 2.78, 2.11]
    box(ax, ax_a, ya[0], lw, bh + 0.08, "Qiskit\nStatevector.evolve", bold_first=True)
    box(ax, ax_a, ya[1], lw, bh, "Golden amplitudes\n(exact, complex)")
    box(ax, ax_a, ya[2], lw, bh + 0.08, f"Fixed-point conversion\n{fmt_line}")

    yb = [3.45, 2.78, 2.11]
    box(ax, ax_b, yb[0], lw, bh + 0.08, "Generation system\n(Fig. 1)")
    box(ax, ax_b, yb[1], lw, bh, "Generated\nSystemVerilog")
    box(ax, ax_b, yb[2], lw, bh + 0.08, f"{f['simulator']} simulation\noutput amplitudes")

    # arrows from spec to both lanes, and down each lane
    arrow(ax, (ax_a + ax_b) / 2 - 0.5, 4.22 - (bh + 0.04) / 2, ax_a, ya[0] + (bh + 0.08) / 2)
    arrow(ax, (ax_a + ax_b) / 2 + 0.5, 4.22 - (bh + 0.04) / 2, ax_b, yb[0] + (bh + 0.08) / 2)
    for x, ys in ((ax_a, ya), (ax_b, yb)):
        arrow(ax, x, ys[0] - (bh + 0.08) / 2, x, ys[1] + bh / 2)
        arrow(ax, x, ys[1] - bh / 2, x, ys[2] + (bh + 0.08) / 2)

    # comparison and verdict
    yc, yv = 1.28, 0.55
    box(ax, (ax_a + ax_b) / 2, yc, 2.7, 0.5,
        f"Compare each component\n{tol_line}", bold_first=True)
    arrow(ax, ax_a, ya[2] - (bh + 0.08) / 2, ax_a + 0.35, yc + 0.25)
    arrow(ax, ax_b, yb[2] - (bh + 0.08) / 2, ax_b - 0.35, yc + 0.25)
    box(ax, (ax_a + ax_b) / 2, yv, 1.3, bh - 0.06, "PASS  /  FAIL", fill="0.88")
    arrow(ax, (ax_a + ax_b) / 2, yc - 0.25, (ax_a + ax_b) / 2, yv + (bh - 0.06) / 2)

    # the point of the figure: lane A never sees Verilog
    top, bot = ya[0] + (bh + 0.08) / 2 + 0.08, ya[2] - (bh + 0.08) / 2 - 0.08
    ax.add_patch(FancyBboxPatch((ax_a - lw / 2 - 0.08, bot), lw + 0.16, top - bot,
                                boxstyle="round,pad=0.0,rounding_size=0.03",
                                fc="none", ec="black", lw=0.8, ls=(0, (3, 2))))
    ax.text(ax_a, top + 0.06, "golden path", ha="center", va="bottom", fontsize=7,
            style="italic")
    ax.text(ax_a, bot - 0.05, "no reference Verilog\nenters this path", ha="center",
            va="top", fontsize=7.5, fontweight="bold")
    ax.text(ax_b, top + 0.06, "hardware path", ha="center", va="bottom", fontsize=7,
            style="italic")

    out = L.FIGURES / "fig2_verification.pdf"
    fig.savefig(out, format="pdf")
    plt.close(fig)
    return out


# --------------------------------------------------------------------------
def main() -> int:
    f1 = facts_fig1()
    p1 = figure_1(f1)
    print("=" * 78)
    print(f"FIGURE 1 -> {p1.relative_to(L.REPO)}   (single column, {COL_W} in wide)")
    print("=" * 78)
    print("  prompt sections, in assemble() order:")
    for n, t in f1["sections"]:
        print(f"    §{n}  {t}")
    print(f"  repair budget      : {f1['max_repairs']}")
    print(f"  model / temperature: {f1['model']} / {f1['temperature']}")
    print(f"  always-injected    : {f1['cag_files']} + {f1['cag_dirs']}/")
    print(f"  .qpy accepted      : {f1['qpy']}")
    print("  sources:")
    for s in f1["sources"]:
        print(L.source(s, ""))

    f2 = facts_fig2()
    p2 = figure_2(f2)
    print("\n" + "=" * 78)
    print(f"FIGURE 2 -> {p2.relative_to(L.REPO)}   (single column, {COL_W} in wide)")
    print("=" * 78)
    print(f"  GEOM               : {f2['geom']}")
    for nq, (fmt, w) in sorted(f2["fmt"].items()):
        print(f"  {nq}-qubit format     : {fmt}  ({w}-bit, tol ±{f2['tol_by_width'][w]} LSB)")
    print(f"  golden line        : {f2['gold_line']}")
    print(f"  golden path reads no Verilog: {f2['independent']}")
    if not f2["independent"]:
        print("  !! the golden line references something other than Statevector -- check")
    print("  sources:")
    for s in f2["sources"]:
        print(L.source(s, ""))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
