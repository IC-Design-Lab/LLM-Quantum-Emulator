"""Emit the paper's LaTeX tables. Every number is read from a file at runtime.

TABLE I  overall results by evaluation set
         counts from results/eval_v2_results_*.json, set membership and the
         hardware-failure attribution from rag/consolidate.py itself, and the
         total cross-checked against consolidate.py's own printed output.

TABLE II cycle counts, Chisel reference vs generated
         cycles from paper/data/cycles.csv (measured by measure_cycles.py);
         out-of-context status, device I/O and Fmax from the Vivado reports.

Two expectations are used as STOP-GUARDS only -- a total of 55/54 for Table I and
a 10/0/1 split for Table II. They are never emitted; if the files disagree with
them the script stops and says so.

The Table II guard was 7/3/1, taken from a table that compared the poster's Chisel
column against a separately-produced generated column. Measuring both columns by
one procedure (paper/measure_cycles.py) put three of those rows at 0 rather than
+1, and the structural check below shows why: those three designs instantiate the
same modules in the same order as their references. See paper/data/cycles_check.txt.

    python paper/make_tables.py
"""
from __future__ import annotations

import csv
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import paperlib as L  # noqa: E402

# Was (55, 54) on the screened inputs alone. The covering re-check
# (paper/coverage_check.py --cover) fails G3_06; rag/consolidate.py applies it.
EXPECTED_TOTAL = (55, 53)          # stop-guard only
EXPECTED_SPLIT = (10, 0, 1)        # stop-guard only: exact / longer / shorter

FAMILY_LABEL = {"2qubit-16bit": "2-qubit", "qft-3qubit-8bit": "3-qubit",
                "shor-5qubit-8bit": "5-qubit"}


def tex_escape(s: str) -> str:
    return s.replace("_", r"\_").replace("%", r"\%").replace("&", r"\&")


def set_label(consolidate_label: str) -> str:
    """'2q CORPUS   (leave-one-out)' -> 'Corpus (leave-one-out)'."""
    s = re.sub(r"^\dq(\+\dq)?\s+", "", consolidate_label)
    s = " ".join(s.split())
    head, _, tail = s.partition("(")
    head = head.strip().capitalize()
    out = f"{head} ({tail}" if tail else head
    # The paper names the 5-qubit family by the state it prepares (GHZ); the
    # result files still use the historical directory name.
    return out.replace("shor family", "GHZ family")


# ==========================================================================
# TABLE I
# ==========================================================================
def table_1() -> None:
    sys.path.insert(0, str(L.RAG / "rag"))
    import consolidate as C

    rows, excluded, families_seen = [], [], set()
    for label, path in C.SETS:
        data = C.load(path)
        if data is None:
            L.die(f"result file missing: {path}")
        data = C.apply_covering(data)
        scored = [r for r in data if r["verdict"] in ("PASS", "FAIL")]
        passed = sum(1 for r in scored if r["verdict"] == "PASS")
        fams = sorted({r["family"] for r in scored})
        families_seen |= set(fams)
        excluded += [(r["circuit"], r["verdict"], r.get("category", ""))
                     for r in data if r["verdict"] not in ("PASS", "FAIL")]
        rows.append({"set": set_label(label),
                     "family": " + ".join(FAMILY_LABEL.get(f, f) for f in fams),
                     "circuits": len(scored), "passed": passed, "file": path})

    total_scored = sum(r["circuits"] for r in rows)
    total_passed = sum(r["passed"] for r in rows)

    # --- cross-check against consolidate.py's own output -------------------
    c_scored, c_passed = L.run_consolidate()
    if (c_scored, c_passed) != (total_scored, total_passed):
        L.die(f"Table I total {total_passed}/{total_scored} disagrees with "
              f"rag/consolidate.py's {c_passed}/{c_scored}")
    if (total_scored, total_passed) != EXPECTED_TOTAL:
        L.die(f"Table I total is {total_passed}/{total_scored}, expected "
              f"{EXPECTED_TOTAL[1]}/{EXPECTED_TOTAL[0]}. "
              + ("A 63/64 total means the QPY set leaked in." if total_scored == 64 else ""))

    # --- the QPY equivalence set, caption only --------------------------------
    qpy_path = L.RESULTS / "eval_v2_results_QPY.json"
    qpy = json.loads(L.read(qpy_path))
    qpy_scored = [r for r in qpy if r["verdict"] in ("PASS", "FAIL")]
    qpy_passed = sum(1 for r in qpy_scored if r["verdict"] == "PASS")
    if any(str(qpy_path) == str(p) for _, p in C.SETS):
        L.die("QPY set is inside consolidate.SETS; it must be excluded from the total")

    # --- exclusion reasons, from files ----------------------------------------
    # Two circuits carry an EXCLUDED/ERROR record (NC_02, G5_03). The paper counts a
    # third circuit outside the 55 -- the full 3-qubit QFT -- which was never entered
    # into a scored set and so has no record here; results/RESULTS.md limitation 3
    # states all three.
    if len(excluded) != 2:
        L.die(f"expected 2 excluded records, found {len(excluded)}: {excluded}")
    reasons, reason_sources = [], []
    detail = L.RESULTS / "detail" / "families-3qubit-5qubit.md"
    for circuit, verdict, category in excluded:
        if "H-safe" in category:
            reasons.append(f"{circuit} lacked an H-safe discriminating input")
        elif circuit == "G5_03" and detail.exists() and re.search(
                r"G5_03.*OUTPUT LIMIT", L.read(detail), re.I | re.S):
            reasons.append(f"{circuit} exceeded the model's output-length limit")
            reason_sources.append(detail)
        else:
            reasons.append(f"{circuit}: {category} [UNSOURCED reason -- check]")
    hw = C.HARDWARE_FAILURES
    cov = C.covering_failures()
    if len(hw) + len(cov) != total_scored - total_passed:
        L.die(f"{total_scored - total_passed} failures but {len(hw)} hardware + {len(cov)} "
              f"covering attributions; every failure must be attributed")

    # --- LaTeX ------------------------------------------------------------------
    # Caption carries only what a reader needs at the table itself: the scoring
    # basis, which circuits are out, and the QPY set (reported here and nowhere
    # else). The exclusion reasons and the failure attribution live in the prose,
    # so restating them here would duplicate the body text.
    # The manuscript carries a short caption; the exclusions, the two failures and
    # the .qpy equivalence set are stated in the prose instead. The facts the long
    # caption used to carry are still checked above, and printed in the dump below,
    # so a change in them still stops this script.
    cap = "Functional results by evaluation set. "
    tex = ["\\begin{table}[ht]", "\\centering", f"\\caption{{{cap}}}",
           "\\label{tab:results}", "\\begin{tabular}{@{}llrr@{}}", "\\toprule",
           "Evaluation set & Family & Circuits & Passed \\\\", "\\midrule"]
    for r in rows:
        tex.append(f"{tex_escape(r['set'])} & {r['family']} & {r['circuits']} & {r['passed']} \\\\")
    tex += ["\\midrule", f"Total & & {total_scored} & {total_passed} \\\\",
            "\\bottomrule", "\\end{tabular}", "\\end{table}"]
    out = L.TABLES / "table1_results.tex"
    L.write_tex(out, tex)

    # --- dump -------------------------------------------------------------------
    print("=" * 78)
    print(f"TABLE I -> {out.relative_to(L.REPO)}")
    print("=" * 78)
    print(f"  {'Evaluation set':<30} {'Family':<18} {'Circuits':>8} {'Passed':>7}")
    for r in rows:
        print(f"  {r['set']:<30} {r['family']:<18} {r['circuits']:>8} {r['passed']:>7}")
    print(f"  {'Total':<30} {'':<18} {total_scored:>8} {total_passed:>7}")
    print(f"\n  excluded records = {reasons}")
    print("  (a third circuit is outside the 55, the full 3-qubit QFT; it has no "
          "scored record -- see results/RESULTS.md limitation 3)")
    print(f"  caption: hardware-attributed failure = {list(hw)}")
    print(f"  caption: covering re-check failure   = {sorted(cov)}  <- {C.COVERAGE.relative_to(L.REPO)}")
    print(f"  caption: QPY equivalence set = {qpy_passed}/{len(qpy_scored)} (not in total)")
    print(f"  cross-check: rag/consolidate.py prints {c_passed}/{c_scored}  OK")
    print("\n  sources:")
    for r in rows:
        print(L.source(r["file"], f"row '{r['set']}'"))
    print(L.source(L.RAG / "rag" / "consolidate.py", "set membership, HARDWARE_FAILURES, total"))
    print(L.source(C.COVERAGE, "covering re-check (G3_06 downgrade)"))
    print(L.source(qpy_path, "QPY equivalence set (caption)"))
    for s in reason_sources:
        print(L.source(s, "G5_03 exclusion reason"))


# ==========================================================================
# TABLE II
# ==========================================================================
def table_2() -> None:
    cyc_path = L.DATA / "cycles.csv"
    if not cyc_path.exists():
        L.die("paper/data/cycles.csv not found -- run paper/measure_cycles.py first")
    cyc = {r["name"]: r for r in csv.DictReader(cyc_path.open(encoding="utf-8"))}

    # hardware, parsed from the reports (also written out for the record)
    hw, hw_rows = {}, []
    for d in sorted(L.REPORTS.iterdir()):
        if d.is_dir():
            stem = next(s for s, _ in L.generated_designs() if s.lower() == d.name.lower())
            hw[stem] = L.parse_reports(d)
            hw_rows.append({"design": stem, **{k: v for k, v in hw[stem].items()
                                                if k != "sources"}})
    L.write_csv(L.DATA / "hardware.csv", hw_rows)

    # Table II compares every design that has a reference. ShorFixed is in it as
    # the hand-corrected reference (kind "corrected_reference"), which is why one
    # row is a cycle short; the split below counts it separately from the
    # generated designs, as the paper's prose does.
    MEASURED = ("generated", "corrected_reference")
    pairs = [(n, r["reference_of"]) for n, r in cyc.items()
             if r["kind"] in MEASURED and r["reference_of"]]
    pairs.sort(key=lambda p: p[1])
    exact = plus = minus = 0
    table = []
    for gen, ref in pairs:
        g, c = int(cyc[gen]["cycles"]), int(cyc[ref]["cycles"])
        d = g - c
        exact += d == 0
        plus += d > 0
        minus += d < 0
        table.append((ref, gen, c, g, d))
    if (exact, plus, minus) != EXPECTED_SPLIT:
        L.die(f"cycle-count split is {exact} exact / {plus} longer / {minus} shorter, "
              f"expected {EXPECTED_SPLIT}. Table II NOT written.")
    minus_rows = [t for t in table if t[4] < 0]
    if [t[1] for t in minus_rows] != ["ShorFixed"]:
        L.die(f"the -1 row is expected to be ShorFixed; found {[t[1] for t in minus_rows]}")

    # --- structure: equal cycle counts should mean equal sequences of modules ---
    # Every module in this library has a fixed latency, so two designs built from
    # the same modules in the same order must take the same number of cycles. This
    # is an independent check on the measurement, not a restatement of it.
    seq = {}
    for ref, gen, _c, _g, _d in table:
        rt = L.read(L.REPO / cyc[ref]["source_file"])
        gt = L.read(L.REPO / cyc[gen]["source_file"])
        seq[gen] = (L.instantiation_sequence(rt, L.top_module(rt)),
                    L.instantiation_sequence(gt, L.top_module(gt)))
    identical = sorted(g for g, (r, x) in seq.items() if r == x)
    equal_cc = sorted(t[1] for t in table if t[4] == 0)
    if identical != equal_cc:
        L.die("cycle equality and module-sequence identity do not coincide:\n"
              f"  equal cycle counts     : {equal_cc}\n"
              f"  identical module lists : {identical}")
    sref, sgen = seq["ShorFixed"]
    if len(sref) - len(sgen) != 1 or sgen != sref[:len(sgen)]:
        L.die("ShorFixed is not its reference less one trailing module:\n"
              f"  reference : {sref}\n  generated : {sgen}")
    removed = sref[-1]

    # The collaborator's transcribed table starts counting at a different edge.
    # Read for a CHECK ONLY, and the check is that the difference is one constant
    # across every design -- which is what makes it a counting convention rather
    # than a disagreement about any particular design. Table II uses the measured
    # values regardless; nothing below is emitted.
    trans = L.RESULTS / "vivado" / "rag_cag_designs.csv"
    offset_note = "transcribed table not found"
    if trans.exists():
        offs, fmax_bad = {}, {}
        for r in csv.DictReader(trans.open(encoding="utf-8")):
            m = r["module"]
            if m in cyc:
                offs[m] = int(cyc[m]["cycles"]) - int(r["latency_cycles"])
            if m in hw and abs(float(r["fmax_mhz"]) - hw[m]["fmax_mhz"]) >= 0.01:
                fmax_bad[m] = (r["fmax_mhz"], round(hw[m]["fmax_mhz"], 2))
        vals = set(offs.values())
        if len(vals) != 1:
            L.die("the measured cycle column is not a constant offset from the "
                  f"transcribed one, so the difference is not a counting "
                  f"convention and must be understood first: {offs}")
        if fmax_bad:
            L.die(f"transcribed Fmax disagrees with the Vivado reports: {fmax_bad}")
        offset_note = (f"measured = transcribed {vals.pop():+d} cycles for all "
                       f"{len(offs)} designs (counting convention); Fmax agrees with "
                       f"the reports for all {len(hw)} to within 0.01 MHz")

    # Out-of-context facts, from the reports and the port lists.
    ooc = sorted(s for s, h in hw.items() if h["out_of_context"])
    iob = {h["iob_available"] for h in hw.values()}
    if len(iob) != 1:
        L.die(f"reports disagree on device I/O: {iob}")
    iob = iob.pop()
    over = {n: int(r["pins"]) for n, r in cyc.items() if int(r["pins"]) > iob}
    ooc_refs = [ref for gen, ref in pairs if gen in ooc]
    for ref in ooc_refs:
        if ref not in over:
            L.die(f"{ref} is the reference of an out-of-context design but its port "
                  f"list ({cyc[ref]['pins']} pins) fits the device ({iob})")
    device = {h["device"] for h in hw.values()}.pop()

    # Short caption, as the manuscript carries it; how the measurement is defined
    # and what the one mismatching row means are stated in the prose.
    cap = "Latency in clock cycles."
    tex = ["\\begin{table}[ht]", "\\centering", f"\\caption{{{cap}}}",
           "\\label{tab:cycles}", "\\begin{tabular}{@{}lrrr@{}}", "\\toprule",
           "Circuit & Chisel (cycles) & Generated (cycles) & Difference \\\\", "\\midrule"]
    for ref, gen, c, g, d in table:
        diff = "0" if d == 0 else (f"$+{d}$" if d > 0 else f"${d}$")
        # A row whose generated design differs from its reference names both, so
        # the label matches the text (the Shor row's generated design is ShorFixed).
        label = tex_escape(ref) if d == 0 else f"{tex_escape(ref)} / {tex_escape(gen)}"
        tex.append(f"{label} & {c} & {g} & {diff} \\\\")
    # Generated designs with no reference implementation still have a measured
    # latency; the manuscript lists them with an em-dash in the reference columns.
    noref = [n for n, r in cyc.items()
             if r["kind"] in MEASURED and not r["reference_of"]]
    for n in sorted(noref, key=lambda x: NOREF_ORDER.index(x)
                    if x in NOREF_ORDER else len(NOREF_ORDER)):
        tex.append(f"{tex_escape(n.replace('_v2', ''))} & -- & {int(cyc[n]['cycles'])} & -- \\\\")
    tex += ["\\bottomrule", "\\end{tabular}", "\\end{table}"]
    out = L.TABLES / "table2_cycles.tex"
    L.write_tex(out, tex)

    print("\n" + "=" * 78)
    print(f"TABLE II -> {out.relative_to(L.REPO)}")
    print("=" * 78)
    print(f"  {'Circuit':<14} {'generated design':<16} {'Chisel':>7} {'Gen':>5} {'Diff':>5}")
    for ref, gen, c, g, d in table:
        print(f"  {ref:<14} {gen:<16} {c:>7} {g:>5} {d:>+5}")
    print(f"\n  split: {exact} exact, {plus} longer, {minus} shorter   "
          f"(guard {EXPECTED_SPLIT}: OK)")
    print(f"  structure: module sequence identical to the reference for exactly the "
          f"{len(identical)} equal-cycle designs")
    print(f"  structure: ShorFixed = reference minus trailing {removed!r} (-1 module, "
          f"-1 cycle)")
    print(f"  transcribed table: {offset_note}")
    print(f"  out-of-context (0 bonded IOBs in report): {ooc}")
    print(f"  pins over the device's {iob} IOBs: {over}")
    print(f"  Vivado: {sorted({h['tool'] for h in hw.values()})}  device {device}")
    print(f"  hardware table written: {(L.DATA / 'hardware.csv').relative_to(L.REPO)}")
    print("\n  sources:")
    print(L.source(cyc_path, "all cycle counts (both columns)"))
    print(L.source(L.REPORTS, "OOC status, device I/O, Fmax (per-design *.rpt)"))
    print(L.source(L.OUT2, "pin counts: generated top-level port lists"))
    print(L.source(L.CORPUS, "pin counts: reference top-level port lists"))
    print(L.source(L.OUT2, "module sequences: generated top-level instantiations"))
    print(L.source(L.CORPUS, "module sequences: reference top-level instantiations"))
    if trans.exists():
        print(L.source(trans, "convention-offset + Fmax cross-check ONLY (transcribed)"))


# ==========================================================================
# TABLE III  context ablation
# ==========================================================================
# One row per condition, numbered so the text can refer to rows by index
# (the ablation is the paper's only multi-condition comparison).  pass@1 and
# the first-attempt lint counts are recomputed from the raw run records, not
# copied from RESULTS.md.
ABLATION_ROWS = [
    ("None (full context)", "eval_v2_results_NC.json"),
    ("Module interfaces", "eval_v2_ablation_no_interfaces.json"),
    ("Composition rulebook", "eval_v2_ablation_no_rulebook.json"),
    ("Worked example", "eval_v2_ablation_no_example.json"),
    ("Example \\emph{and} interfaces", "eval_v2_ablation_no_example_no_interfaces.json"),
]
EXPECTED_PASS1 = (9, 9, 9, 9, 0)   # stop-guard only: the redundancy result


def table_3() -> None:
    rows, srcs = [], []
    for label, fname in ABLATION_ROWS:
        path = L.RESULTS / fname
        if not path.exists():
            L.die(f"ablation result file missing: {path}")
        data = json.loads(L.read(path))
        scored = [r for r in data if r["verdict"] in ("PASS", "FAIL")]
        pass1 = sum(1 for r in scored
                    if r["verdict"] == "PASS" and r["attempts"] == 1)
        final = sum(1 for r in scored if r["verdict"] == "PASS")
        lint = [r["lint_errors_first"] for r in scored]
        lo, hi = min(lint), max(lint)
        rows.append({"label": label, "n": len(scored), "pass1": pass1,
                     "final": final, "lint": "0" if hi == 0 else f"{lo}--{hi}"})
        srcs.append(path)

    n = {r["n"] for r in rows}
    if len(n) != 1:
        L.die(f"ablation conditions do not share one circuit set: {n}")
    n = n.pop()
    if tuple(r["pass1"] for r in rows) != EXPECTED_PASS1:
        L.die(f"ablation pass@1 is {tuple(r['pass1'] for r in rows)}, expected "
              f"{EXPECTED_PASS1}. Table III NOT written.")
    if any(r["final"] != n for r in rows):
        L.die("every ablation condition should reach n/n after repair; it does not")

    cap = (f"Context ablation on the {n} held-out 2-qubit circuits, one section "
           f"withheld per run at the same model and temperature. Only row "
           f"{len(rows)} changes the outcome: interface knowledge is supplied "
           f"twice, in the interfaces document and in the worked example, so "
           f"withholding either alone leaves the other. Every condition reaches "
           f"{n}/{n} after repair.")
    tex = ["\\begin{table}[ht]", "\\centering", f"\\caption{{{cap}}}",
           "\\label{tab:ablation}", "\\begin{tabular}{@{}clrrr@{}}", "\\toprule",
           "\\# & Context withheld & pass@1 & Lint err. & Final \\\\", "\\midrule"]
    for i, r in enumerate(rows, 1):
        # the last row is the only informative condition: bold it
        emph = (lambda s: "\\textbf{" + s + "}") if i == len(rows) else (lambda s: s)
        cells = [str(i), r["label"], f"{r['pass1']}/{n}", r["lint"], f"{r['final']}/{n}"]
        cells[1:] = [emph(c) for c in cells[1:]]
        tex.append(" & ".join(cells) + " \\\\")
    tex += ["\\bottomrule", "\\end{tabular}", "\\end{table}"]
    out = L.TABLES / "table3_ablation.tex"
    L.write_tex(out, tex)

    print("\n" + "=" * 78)
    print(f"TABLE III -> {out.relative_to(L.REPO)}")
    print("=" * 78)
    print(f"  {'#':<2} {'withheld':<32} {'pass@1':>7} {'lint':>7} {'final':>7}")
    for i, r in enumerate(rows, 1):
        print(f"  {i:<2} {r['label']:<32} {r['pass1']:>5}/{n} {r['lint']:>7} "
              f"{r['final']:>5}/{n}")
    print(f"\n  pass@1 pattern: {tuple(r['pass1'] for r in rows)}  "
          f"(guard {EXPECTED_PASS1}: OK)")
    print(f"  all conditions reach {n}/{n} after repair: OK")
    print("\n  sources:")
    for (label, _), p in zip(ABLATION_ROWS, srcs):
        print(L.source(p, f"row '{label}'"))


# ==========================================================================
# TABLE IV  hardware cost of the generated designs
# ==========================================================================
# Laid out like the companion paper's hardware-cost tables: a "Resource Cost"
# group and a "Power" group over a row per design.  Rows are restricted to the
# 3- and 5-qubit designs; the nine 2-qubit circuits are summarized as ranges in
# the prose, since listing them costs a third of a page and they are the
# circuits where the generated and prompt-only designs are already identical.
#
# NOTE ON COMPARABILITY: these runs target xcu250 (Alveo U250).  The companion
# paper's published resource tables target a DIFFERENT part, so its numbers
# must NOT be placed in this table as a baseline column.
# All 14 placed-and-routed designs, in the order the manuscript lists them. The
# nine 2-qubit rows are labelled by the benchmark circuit they implement, which is
# how cycles.csv names their references.
HW_ROWS = ["Circuit_00_v2", "Circuit_01_v2", "Circuit_02_v2", "Circuit_03_v2",
           "Circuit_04_v2", "Circuit_05_v2", "Circuit_06_v2", "Circuit_07_v2",
           "Circuit_08_v2", "QFT_v2", "ShorFixed", "U3_5_v2", "G5_05_v2", "V5_6_v2"]
HW_LABEL = {"QFT_v2": "QFT", "U3_5_v2": "U3\\_5", "G5_05_v2": "G5\\_05",
            "ShorFixed": "ShorFixed", "V5_6_v2": "V5\\_6"}
HW_QUBITS = {"QFT_v2": 3, "U3_5_v2": 3, "G5_05_v2": 5, "ShorFixed": 5, "V5_6_v2": 5}
# Table II lists the designs that have no reference after those that do.
NOREF_ORDER = ["U3_5_v2", "G5_05_v2", "V5_6_v2"]
# Static power is dropped from the table because it is the device's baseline,
# not a property of the design. Guard: only drop it while that stays true.
SP_MAX_SPREAD_W = 0.05


def table_4() -> None:
    path = L.DATA / "hardware.csv"
    if not path.exists():
        L.die(f"{path} missing -- run table_2() first, it writes this file")
    hw = {r["design"]: r for r in csv.DictReader(path.open(encoding="utf-8"))}

    missing = [d for d in HW_ROWS if d not in hw]
    if missing:
        L.die(f"hardware.csv has no row for {missing}")
    devices = {hw[d]["device"] for d in HW_ROWS}
    if len(devices) != 1:
        L.die(f"rows span more than one device, cost columns not comparable: {devices}")
    device = devices.pop()

    twoq = [r for d, r in hw.items() if d.startswith("Circuit_")]
    if len(twoq) != 9:
        L.die(f"expected 9 two-qubit designs to summarise, found {len(twoq)}")
    lut_lo, lut_hi = min(int(r["luts"]) for r in twoq), max(int(r["luts"]) for r in twoq)
    ff_lo, ff_hi = min(int(r["ffs"]) for r in twoq), max(int(r["ffs"]) for r in twoq)

    ooc = [d for d in HW_ROWS if hw[d]["out_of_context"] == "True"]

    sp = [float(r["static_w"]) for r in hw.values()]
    sp_lo, sp_hi = min(sp), max(sp)
    if sp_hi - sp_lo > SP_MAX_SPREAD_W:
        L.die(f"static power spans {sp_lo}-{sp_hi} W; no longer a device constant, "
              f"so it cannot be dropped from Table IV")

    # Short caption in the companion paper's style. The caveats it used to carry
    # (2-qubit ranges, static power, MOF variation) are stated in the prose.
    # Pin counts come from cycles.csv (top-level port lists); the OOC designs
    # report 0 bonded IOBs precisely because nothing was placed.
    cyc_rows = list(csv.DictReader((L.DATA / "cycles.csv").open(encoding="utf-8")))
    pins = {r["name"]: int(r["pins"]) for r in cyc_rows}
    # benchmark name per generated design, for the 2-qubit row labels
    ref_of = {r["name"]: r["reference_of"] for r in cyc_rows if r["reference_of"]}
    unlabelled = [d for d in HW_ROWS if d not in HW_LABEL and d not in ref_of]
    if unlabelled:
        L.die(f"no label for {unlabelled}: not in HW_LABEL and no reference in cycles.csv")
    ooc_pins = {pins[d] for d in ooc}
    if len(ooc_pins) != 1:
        L.die(f"out-of-context designs disagree on pin count: {ooc_pins}")
    ooc_pins = ooc_pins.pop()
    iob = {hw[d]["iob_available"] for d in HW_ROWS}.pop()
    # Short caption, as the manuscript carries it. What the dagger means, and why
    # the out-of-context rows report lower dynamic power, is stated in the prose;
    # the pin and I/O figures behind it are still checked above.
    cap = "Hardware cost of all 14 placed and routed designs."
    tex = ["\\begin{table}[ht]", "\\centering", "\\footnotesize",
           "\\setlength{\\tabcolsep}{4pt}", f"\\caption{{{cap}}}",
           "\\label{tab:hardware}", "\\begin{tabular}{@{}lcrrrrr@{}}", "\\toprule",
           "Circuit & $n$ & LUTs & FFs & DSPs & DP (W) & MOF (MHz) \\\\",
           "\\midrule"]
    for d in HW_ROWS:
        r = hw[d]
        label = HW_LABEL.get(d) or tex_escape(ref_of.get(d) or d)
        label += "$^\\dag$" if d in ooc else ""
        tex.append(f"{label} & {HW_QUBITS.get(d, 2)} & {int(r['luts']):,} & {int(r['ffs']):,} & "
                   f"{r['dsps']} & {float(r['dynamic_w']):.3f} & "
                   f"{float(r['fmax_mhz']):.0f} \\\\")
    tex += ["\\bottomrule", "\\end{tabular}", "\\end{table}"]
    out = L.TABLES / "table4_hardware.tex"
    L.write_tex(out, tex)

    print("\n" + "=" * 78)
    print(f"TABLE IV -> {out.relative_to(L.REPO)}")
    print("=" * 78)
    print(f"  {'design':<12} {'LUTs':>7} {'FFs':>7} {'DSP':>4} {'SP':>7} {'DP':>7} {'Fmax':>6}")
    for d in HW_ROWS:
        r = hw[d]
        print(f"  {d:<12} {int(r['luts']):>7,} {int(r['ffs']):>7,} {r['dsps']:>4} "
              f"{float(r['static_w']):>7.3f} {float(r['dynamic_w']):>7.3f} "
              f"{float(r['fmax_mhz']):>6.0f}")
    print(f"\n  2-qubit designs summarized in caption: LUTs {lut_lo}-{lut_hi}, "
          f"FFs {ff_lo}-{ff_hi} (n={len(twoq)})")
    print(f"  static power, all {len(sp)} designs: {sp_lo}-{sp_hi} W "
          f"(spread {sp_hi - sp_lo:.3f} W <= {SP_MAX_SPREAD_W}: dropped from table)")
    print(f"  out-of-context: {ooc}")
    print(f"  device (single, checked): {device}")
    print("\n  sources:")
    print(L.source(path, "all resource, power and Fmax figures"))
    print(L.source(L.REPORTS, "per-design Vivado reports behind hardware.csv"))


if __name__ == "__main__":
    table_1()
    table_2()
    table_3()
    table_4()
