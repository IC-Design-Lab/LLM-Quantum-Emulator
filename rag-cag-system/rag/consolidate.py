"""Consolidate every evaluation set into the paper's tables. Pure analysis, no runs.

Reads the per-set result JSONs and reports the 2-qubit family as a whole, split by
how far each circuit sits from the corpus:

  CORPUS   the 9 circuits that ARE the corpus, scored under leave-one-out
  HELD-OUT the 10 NC circuits authored independently in IBM Quantum Composer
  NOVEL    the GEN circuits built to cover bracket profiles the corpus lacks

The split matters because it is the generalization axis: a system that only works on
CORPUS is memorising, one that also works on NOVEL is composing.

Failures are attributed, not merely counted. A circuit whose composition matches the
derived rulebook but whose simulation fails is a HARDWARE limitation, not a generation
error, and is reported separately -- lumping the two together would overstate the
system's error rate in one direction and hide a real library defect in the other.

    python rag/consolidate.py
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
RAG = ROOT / "rag"

SETS = [("2q CORPUS   (leave-one-out)", ROOT / "results" / "eval_v2_results_CORPUS.json"),
        ("2q HELD-OUT (NC, independent)", ROOT / "results" / "eval_v2_results_NC.json"),
        ("2q NOVEL    (GEN, profile-covering)", ROOT / "results" / "eval_v2_results_GEN.json"),
        ("3q NOVEL    (G3, qft family)", ROOT / "results" / "eval_v2_results_3Q.json"),
        ("5q NOVEL    (G5, shor family)", ROOT / "results" / "eval_v2_results_5Q.json"),
        ("3q+5q SUPPLIED (.qpy, user-authored)",
         ROOT / "results" / "eval_v2_results_USER.json")]

# Failures established as hardware limitations rather than generation errors.
HARDWARE_FAILURES = {
    "GEN_02": "hardware sx.sxdg = -I, and that negative breaks the following H "
              "(SplitMultiplier sign bug); composition matches the rulebook exactly",
}

# COVERING RE-CHECK. Each circuit above was scored from ONE screened input. The
# scored 3- and 5-qubit designs were later re-simulated from a set of H-safe inputs
# that together detect every qubit transposition (paper/coverage_check.py --cover).
# A design that passed its screened input but fails that set is a FAIL: the screened
# input could not see its defect. The result JSONs are left as recorded; the
# downgrade is applied here, from the CSV, so it is visible and reproducible.
COVERAGE = ROOT.parent / "paper" / "data" / "coverage.csv"

# Every circuit the covering re-check fails must be attributed here, or the script
# stops. An unexplained failure is not allowed to change the totals silently.
COVERING_FAILURES = {
    "G3_06": "GENERATION — spec swap(0,1) h(0); emitted SWGate, CompatiblePerm_2, HGate. "
             "CompatiblePerm_2 exchanges qubits 0 and 1 and cancels the swap (the G3_01 "
             "defect). Invisible from the scored |000>; wrong from |001>.",
}


def load(p: Path):
    return json.loads(p.read_text(encoding="utf-8")) if p.exists() else None


def covering_failures() -> dict[str, str]:
    """{circuit: attribution} for scored designs that fail the covering re-check."""
    if not COVERAGE.exists():
        return {}
    import csv
    failed = {r["circuit"] for r in csv.DictReader(COVERAGE.open(encoding="utf-8"))
              if r["pass"] == "hsafe" and r["all_within_tol"] != "True"}
    unexplained = failed - set(COVERING_FAILURES)
    if unexplained:
        raise SystemExit(f"covering re-check fails {sorted(unexplained)} with no attribution "
                         f"in COVERING_FAILURES; investigate before reporting totals")
    return {c: COVERING_FAILURES[c] for c in failed}


def apply_covering(rows):
    """Copy of `rows` with covering-check failures turned into FAIL verdicts."""
    cov = covering_failures()
    out = []
    for r in rows:
        if r["circuit"] in cov and r["verdict"] == "PASS":
            r = dict(r, verdict="FAIL", category="covering re-check", covering=cov[r["circuit"]])
        out.append(r)
    return out


def profile_of(circuit: str, rows) -> str:
    try:
        sys.path.insert(0, str(RAG)); sys.path.insert(0, str(ROOT))
        import canonical_converter as cc
        from example_retrieval import bracket_flags, bracket_runs
        spec = Path(next(r["spec"] for r in rows if r["circuit"] == circuit))
        return str(bracket_runs(bracket_flags(cc.gate_tokens(cc.load_circuit(spec)))))
    except Exception:                                          # noqa: BLE001
        return "?"


def main() -> int:
    print("=" * 96)
    print("corpus_v2 — all families, consolidated")
    print("=" * 96)

    grand = {"scored": 0, "pass": 0, "hw": 0, "gen_fail": 0, "excluded": 0,
             "attempts": 0, "in": 0, "out": 0, "think": 0}
    profiles = {}
    missing = []
    per_family = []

    for label, path in SETS:
        rows = load(path)
        if rows is None:
            missing.append(path.name)
            continue
        rows = apply_covering(rows)
        two_q = label.startswith("2q")   # bracket profiles only model the 2q family
        fam_scored = fam_pass = 0
        print(f"\n--- {label} ---")
        print(f"  {'circuit':<14} {'profile':<28} {'att':>3} {'verdict':<9} attribution")
        for r in sorted(rows, key=lambda x: x["circuit"]):
            c = r["circuit"]
            if r["verdict"] in ("EXCLUDED", "REFUSED", "ERROR"):
                grand["excluded"] += 1
                print(f"  {c:<14} {'-':<28} {'-':>3} {r['verdict']:<9} "
                      f"{r.get('category','')}")
                continue
            prof = profile_of(c, rows) if two_q else "-"
            if two_q:
                profiles.setdefault(prof, []).append(c)
            grand["scored"] += 1
            grand["attempts"] += r.get("attempts", 0)
            for u in r.get("usage", []):
                for k in ("in", "out", "think"):
                    grand[k] += u.get(k, 0) or 0
            if r["verdict"] == "PASS":
                grand["pass"] += 1
                attribution = r.get("diagnostic", "")
            elif c in HARDWARE_FAILURES:
                grand["hw"] += 1
                attribution = "HARDWARE — " + HARDWARE_FAILURES[c]
            elif r.get("covering"):
                grand["gen_fail"] += 1
                attribution = r["covering"]
            else:
                grand["gen_fail"] += 1
                attribution = "GENERATION — " + str(r.get("category", ""))
            fam_scored += 1
            fam_pass += r["verdict"] == "PASS"
            print(f"  {c:<14} {prof:<28} {r.get('attempts','-'):>3} "
                  f"{r['verdict']:<9} {attribution[:52]}")
        per_family.append((label, fam_pass, fam_scored))

    if missing:
        print(f"\n  NOTE: result files not found, these sets are absent from the "
              f"totals: {missing}")

    s = grand
    print("\n" + "=" * 96)
    print("PER SET")
    print("=" * 96)
    for label, pa, sc in per_family:
        print(f"  {label:<36} {pa}/{sc}")
    print("=" * 96)
    print("TOTALS — all families")
    print("=" * 96)
    print(f"  circuits scored                : {s['scored']}")
    print(f"  functional PASS                : {s['pass']}/{s['scored']}"
          f"   ({100*s['pass']/max(s['scored'],1):.0f}%)")
    print(f"  failures attributed to HARDWARE: {s['hw']}")
    print(f"  failures attributed to GENERATION: {s['gen_fail']}")
    print(f"  excluded before scoring        : {s['excluded']} (H-unsafe / no hardware)")
    if s["scored"]:
        eff = s["scored"] - s["hw"]
        print(f"  PASS excluding hardware defects: {s['pass']}/{eff}"
              f"   ({100*s['pass']/max(eff,1):.0f}%)")
    print(f"  generation attempts / circuit  : {s['attempts']/max(s['scored'],1):.2f}"
          f"   (1.00 = no repair was ever needed)")
    print(f"  cost  in {s['in']:,}  out {s['out']:,}  thinking {s['think']:,}"
          f"   output-rate {s['out']+s['think']:,}")

    print(f"\n  DISTINCT BRACKET PROFILES COVERED: {len(profiles)}")
    print("  (the 9 corpus circuits span only 4 of these)")
    for prof, names in sorted(profiles.items(), key=lambda kv: -len(kv[1])):
        print(f"    {prof:<30} {len(names):>2}  {', '.join(sorted(names))[:56]}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
