"""Batch evaluation: generate -> lint -> repair -> simulate, over a set of specs.

The verdict is FUNCTIONAL (ModelSim vs a Qiskit golden computed from the spec).
No ground-truth .sv is required, so novel circuits are scored exactly like corpus
ones. `rag/reference_composer.py` is used only as a DIAGNOSTIC to describe HOW a
generation differs, never as the verdict.

Reported metrics (all of them paper numbers):
  pass@1          functional PASS with no repair round
  pass@repair     functional PASS after lint-driven repair
  lint-caught     failures caught statically, before spending a simulation
  category mix    1 = elaboration, 2 = wrong statevector, 3 = unusual but correct

Every subprocess call passes an ARGUMENT LIST, never a shell string: a previous
sweep in this project silently corrupted every path because `\\r` inside a Windows
path was interpreted as a carriage return, and all six results were fake.

    python rag/eval_v2.py --specs new_circuits/specs/NC_*.py
    python rag/eval_v2.py --specs ... --backend ollama     # free
    python rag/eval_v2.py --specs ... --dry-run            # assemble only
"""

from __future__ import annotations

import argparse
import glob
import json
import re
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
RAG = ROOT / "rag"
sys.path.insert(0, str(RAG))
sys.path.insert(0, str(ROOT))

import families as fam           # noqa: E402
from hsafe import screen         # noqa: E402
from simulate import simulate    # noqa: E402

OUT = RAG / "output_v2"
RESULTS = ROOT / "results" / "eval_v2_results.json"
PY = sys.executable


def run(args, retries: int = 1, **kw):
    """Run a step, retrying once on a transient failure. Never raises."""
    last = None
    for attempt in range(retries + 1):
        try:
            r = subprocess.run([PY, *args], cwd=str(ROOT), capture_output=True,
                               text=True, errors="replace", timeout=3600, **kw)
            text = r.stdout + r.stderr
            transient = ("RemoteProtocolError" in text or "Server disconnected" in text
                         or "Connection reset" in text or "ServiceUnavailable" in text)
            if transient and attempt < retries:
                print(f"      transient API error, retrying ({attempt + 1})", flush=True)
                time.sleep(5)
                continue
            return r
        except subprocess.TimeoutExpired as e:
            last = e
            if attempt < retries:
                print(f"      step timed out, retrying ({attempt + 1})", flush=True)
                continue
    return subprocess.CompletedProcess(args, 1, "", f"step failed: {last}")


def diagnose(spec: Path, verilog_path: Path, family: str) -> str:
    """How does this differ from the rulebook's derivation? Diagnostic only."""
    if family != "2qubit-16bit":
        return "(no rulebook for this family yet)"
    try:
        import canonical_converter as cc
        from lint_generated import parse
        from reference_composer import module_sequence
        exp = module_sequence(cc.gate_tokens(cc.load_circuit(spec)))
        _, _, insts = parse(verilog_path.read_text(encoding="utf-8"))
        got = [m for m, _, _ in insts]
        if got == exp:
            return "matches rulebook exactly"
        norm = ["CompatiblePerm" if m.startswith(
            ("CompatiblePerm", "SwapPosition", "rearrangeTo1stPosition")) else m
            for m in got]
        if norm == exp:
            return "rulebook shape, different permutation module"
        return f"expected {len(exp)} inst {exp}, got {len(got)} {got}"
    except Exception as e:                                    # noqa: BLE001
        return f"(diagnostic failed: {type(e).__name__})"


def evaluate(spec: str, args) -> dict:
    import canonical_converter as cc
    from generate_v2 import ablation_suffix
    # Ablation artifacts carry a suffix so a run with a section withheld can never
    # be mistaken for, or overwrite, the full-context baseline.
    name = cc.ref_name(spec) + ablation_suffix(frozenset(args.drop))
    row = {"circuit": name, "spec": str(spec)}

    hs = screen(spec)
    row["h_safe"] = hs["safe"]
    row["input"] = hs["default_input"] if hs["safe"] else hs["salvage_input"]
    if not hs["safe"] and not hs["salvage_input"]:
        row |= {"verdict": "EXCLUDED",
                "category": "hardware H-bug: no H-safe discriminating input"}
        return row

    have = (OUT / f"{name}_v2.v").exists() and (OUT / f"{name}_v2_log.json").exists()
    if args.reuse and have:
        print("      reusing existing generation (not re-billed)", flush=True)
        gen = subprocess.CompletedProcess([], 0, "", "")
    else:
        gen = run(["rag/generate_v2.py", str(spec), "--backend", args.backend,
               *(["--model", args.model] if args.backend == "gemini" else []),
               *(["--ollama-model", args.ollama_model] if args.ollama_model else []),
               "--max-repairs", str(args.max_repairs),
               *[a for d in args.drop for a in ("--drop", d)],
               *(["--dry-run"] if args.dry_run else [])])
    text = gen.stdout + gen.stderr
    (OUT / f"{name}_eval_generate.log").write_text(text, encoding="utf-8")

    if "CIRCUIT CANNOT BE BUILT" in text:
        row |= {"verdict": "REFUSED", "category": "gate has no hardware in family"}
        return row
    if args.dry_run:
        row |= {"verdict": "DRY-RUN",
                "prompt_tokens": int(m.group(1).replace(",", ""))
                if (m := re.search(r"~([\d,]+) tokens", text)) else None}
        return row

    log_path = OUT / f"{name}_v2_log.json"
    if not log_path.exists():
        row |= {"verdict": "ERROR", "category": "generation produced no log",
                "detail": text[-400:]}
        return row
    glog = json.loads(log_path.read_text(encoding="utf-8"))
    row |= {"family": glog["family"], "example": glog["example"],
            "attempts": glog["attempts_used"],
            "lint_errors_final": glog["final_lint_errors"],
            "lint_errors_first": glog["attempts"][0]["lint_errors"],
            "usage": [a["usage"] for a in glog["attempts"]]}

    design = OUT / f"{name}_v2.v"
    vg = run(["new_circuits/verify_generated.py", str(spec), str(design),
              "--tag", f"{name}_v2", *(["--input", row["input"]] if row["input"] else [])])
    vtext = vg.stdout + vg.stderr
    (OUT / f"{name}_eval_verify.log").write_text(vtext, encoding="utf-8")
    top = m.group(1) if (m := re.search(r"top module\s*:\s*(\w+)", vtext)) else None
    if not top:
        row |= {"verdict": "ERROR", "category": "harness could not build a testbench",
                "detail": vtext[-400:]}
        return row
    row["top_module"] = top

    sim = simulate(design,
                   ROOT / "new_circuits" / "tb" / f"tb_{name}_v2_gen.v",
                   f"tb_{name}_v2_gen",
                   library=str(ROOT / "new_circuits" / "support" /
                               f"{name}_v2_gen_support.sv"),
                   label=f"{name}_v2")
    row |= {"verdict": sim["verdict"], "category": sim["category"],
            "checks_ok": sim["checks_ok"], "checks_failed": sim["checks_failed"],
            "mismatches": sim["mismatches"][:6],
            "diagnostic": diagnose(spec, design, row.get("family", ""))}
    return row


def report(rows, args) -> None:
    print("\n" + "=" * 92)
    print(f"corpus_v2 EVALUATION — backend={args.backend}"
          + (f" model={args.model}" if args.backend == "gemini" else ""))
    print("=" * 92)
    print(f"  {'circuit':<12} {'fam':<5} {'att':>3} {'lint1':>5} {'verdict':<8} "
          f"{'checks':>9}  diagnostic")
    for r in rows:
        if r["verdict"] in ("EXCLUDED", "REFUSED", "ERROR", "DRY-RUN"):
            print(f"  {r['circuit']:<12} {'-':<5} {'-':>3} {'-':>5} "
                  f"{r['verdict']:<8} {'-':>9}  {r.get('category','')}")
            continue
        fam_short = {"2qubit-16bit": "2q", "qft-3qubit-8bit": "3q",
                     "shor-5qubit-8bit": "5q"}.get(r.get("family", ""), "?")
        print(f"  {r['circuit']:<12} {fam_short:<5} {r['attempts']:>3} "
              f"{r['lint_errors_first']:>5} {r['verdict']:<8} "
              f"{str(r.get('checks_ok',0))+'/'+str(r.get('checks_ok',0)+r.get('checks_failed',0)):>9}"
              f"  {r.get('diagnostic','')[:44]}")

    scored = [r for r in rows if r["verdict"] in ("PASS", "FAIL")]
    if not scored:
        return
    p1 = [r for r in scored if r["verdict"] == "PASS" and r["attempts"] == 1]
    pr = [r for r in scored if r["verdict"] == "PASS" and r["attempts"] > 1]
    caught = [r for r in scored if r["lint_errors_first"] > 0]
    print(f"\n  scored circuits : {len(scored)}")
    print(f"  pass@1          : {len(p1)}/{len(scored)}")
    print(f"  pass@repair     : {len(p1) + len(pr)}/{len(scored)}"
          f"   (+{len(pr)} recovered by repair)")
    print(f"  lint caught     : {len(caught)} generation(s) had static errors "
          f"on the first attempt")
    excl = [r for r in rows if r["verdict"] == "EXCLUDED"]
    if excl:
        print(f"  excluded (H-bug): {len(excl)}  {[r['circuit'] for r in excl]}")
    tot = {"in": 0, "out": 0, "think": 0}
    for r in scored:
        for u in r.get("usage", []):
            for k in tot:
                tot[k] += u.get(k, 0) or 0
    if tot["out"]:
        print(f"  cost            : in {tot['in']:,}  out {tot['out']:,}  "
              f"thinking {tot['think']:,}  (output-rate {tot['out']+tot['think']:,})")


def main(argv) -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--specs", nargs="+", required=True)
    ap.add_argument("--backend", default="gemini", choices=["gemini", "ollama"])
    ap.add_argument("--model", default="gemini-3.5-flash")
    ap.add_argument("--ollama-model", default=None)
    ap.add_argument("--max-repairs", type=int, default=2)
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--drop", action="append", default=[],
                    choices=["interfaces", "rulebook", "example"],
                    help="ablation: withhold a context section from every prompt")
    ap.add_argument("--reuse", action="store_true",
                    help="skip generation when a complete prior result exists")
    # Without an explicit destination every sweep overwrote the same file; the GEN
    # run clobbered the NC results and they had to be re-scored to recover them.
    ap.add_argument("--out", default=None,
                    help="destination for the results JSON "
                         "(default rag/eval_v2_results.json)")
    args = ap.parse_args(argv)

    # One reference per CIRCUIT, not per file: a .qpy is a container and expands to
    # `file.qpy#0 .. #n-1`, so `--specs "*.qpy"` evaluates every circuit inside.
    import canonical_converter as cc
    specs = cc.expand_refs(args.specs)
    if not specs:
        print("no specs matched")
        return 1
    OUT.mkdir(exist_ok=True)

    rows = []
    for i, s in enumerate(specs, 1):
        print(f"[{i}/{len(specs)}] {cc.ref_name(s)} ...", flush=True)
        try:
            r = evaluate(s, args)
        except Exception as e:                       # noqa: BLE001
            # One bad circuit must never discard the rest of the sweep.
            from generate_v2 import ablation_suffix as _abl
            r = {"circuit": cc.ref_name(s) + _abl(frozenset(args.drop)),
                 "verdict": "ERROR",
                 "category": f"{type(e).__name__}: {e}"[:200]}
        print(f"      -> {r['verdict']}"
              + (f"  [{r['category']}]" if r.get("category") else ""), flush=True)
        rows.append(r)

    report(rows, args)
    dest = Path(args.out) if args.out else RESULTS
    dest.write_text(json.dumps(rows, indent=2), encoding="utf-8")
    print(f"\n  results -> {dest}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
