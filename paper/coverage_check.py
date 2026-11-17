"""Two checks the paper's single-input verdicts leave open, by simulation only.

No model is called and no design is regenerated; every design simulated here is a
file already in rag-cag-system/rag/output_v2, so no published verdict can change.

--v56     IS THE V5_6 ROUTE ACTUALLY DOING ANYTHING?
          V5_6 needs the qubit-2/3 exchange the 5-qubit library has no module for,
          and the model routed it as CompatiblePerm_9, _10, _9. It was scored from
          |00000>, whose golden is unchanged by that exchange, so a design with the
          route deleted would have scored identically. This builds exactly that
          design (the generated file less its last three instantiations) and
          simulates both from |00000> and from two inputs that can see the exchange.
          Those two drive negative amplitudes into the 8-bit Hadamard, which rounds
          them down, so a correct design may miss +/-1 LSB there. The quantity that
          separates the designs is therefore the largest error, not PASS/FAIL.

--cover   DO THE 3- AND 5-QUBIT DESIGNS SURVIVE A COVERING SET OF INPUTS?
          Scoring drove each circuit from one screened input, and that screen tests
          one qubit transposition. verify_generated.py already has covering_inputs():
          a greedy set of H-safe inputs that together detect every transposition. It
          is not on the scoring path. This runs it on every scored 3- and 5-qubit
          design. The circuit's originally scored input is added to the set as an
          anchor; if it no longer passes, the run stops, because then this harness
          and the published one disagree. Transpositions no H-safe input can see are
          covered in a second pass from any input, judged by error size as above.
          2-qubit circuits are left out: two qubits have one transposition, and the
          screen used for scoring already requires the input to detect it.

--qft     THE FULL QFT, WITH THE H-SAFETY SCREEN OFF.
          The full 3-qubit QFT was never functionally scored: its only H-safe input,
          |000>, detects no qubit transposition, so the screen excluded it. The screen
          exists for a sign defect found only in the 2-qubit library; the 3-qubit
          Hadamard sign-extends. This simulates the generated QFT (rag/output_v2/
          QFT_v2.v, produced with no worked example) from all eight basis inputs,
          next to a control with its SWGate removed -- the logical swap(0,2)
          dropped, which exchanges qubits 0 and 2 in the output. Inputs that feed
          negative amplitudes to the 8-bit Hadamard are rounded down, so, as for
          --v56, the evidence is the error size of the design against the control.

--recheck recompute the summary from the CSVs alone, without a simulator.

OUTPUT (all under paper/data/)
    controls/V5_6_noroute.v      the route-deleted control, built here
    controls/QFT_noswap.v        the swap-deleted QFT control, built here
    v56_route.csv                one row per (design, input)
    qft_check.csv                one row per (design, input)
    coverage.csv                 one row per circuit, per pass
    transcripts/*.log            every ModelSim transcript this script produced

    python paper/coverage_check.py --v56
    python paper/coverage_check.py --cover
    python paper/coverage_check.py --qft
    python paper/coverage_check.py --recheck
"""
from __future__ import annotations

import contextlib
import csv
import importlib.util
import io
import json
import os
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import paperlib as L  # noqa: E402

V56 = "V5_6"
ROUTE = ["CompatiblePerm_9", "CompatiblePerm_10", "CompatiblePerm_9"]
V56_INPUTS = ["00000", "00100", "01000"]   # blind to the 2<->3 exchange, then two that see it
SCORED_SETS = ["3Q", "5Q", "USER"]         # the 3- and 5-qubit scored sets of Table I
CONTROLS = L.DATA / "controls"
TRANSCRIPTS = L.DATA / "transcripts"


def _import(path: Path, name: str):
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


# --------------------------------------------------------------------------
# the control design
# --------------------------------------------------------------------------
INST = re.compile(r"^\s*([A-Za-z_]\w*)\s+([A-Za-z_]\w*)\s*\(\s*$", re.M)


def instances(text: str, top: str) -> list[tuple[str, str, int, int]]:
    """(module, instance, start, end) for each instantiation in `top`, by offset."""
    body_start = re.search(rf"^module\s+{re.escape(top)}\b", text, re.M).start()
    out = []
    for m in INST.finditer(text, body_start):
        if m.group(1) in L.VERILOG_KW or m.group(1) == top:
            continue
        end = text.index(");", m.end()) + 2
        out.append((m.group(1), m.group(2), m.start(), end))
    return out


def build_control(src: Path, dst: Path, lint) -> list[str]:
    text = L.read(src)
    top = L.top_module(text)
    insts = instances(text, top)
    seq = [m for m, *_ in insts]
    if seq != L.instantiation_sequence(text, top):
        L.die(f"instance parser disagrees with paperlib: {seq} vs "
              f"{L.instantiation_sequence(text, top)}")
    if seq[-3:] != ROUTE:
        L.die(f"{src.name} does not end in the route {ROUTE}; it ends {seq[-3:]}")
    keep_last = insts[-4]                       # becomes the output stage
    new_last_name = keep_last[1]
    # Delete the three route instantiations (back to front so offsets stay valid).
    for _, _, s, e in reversed(insts[-3:]):
        line_start = text.rfind("\n", 0, s) + 1
        text = text[:line_start] + text[e:].lstrip("\n")
    # Re-close the chain: the kept last stage drives the top-level outputs.
    s, e = keep_last[2], keep_last[3]
    block = text[s:e]
    rewired, n = re.subn(rf"\(\s*_{re.escape(new_last_name)}_(io_out_\w+)\s*\)", r"(\1)", block)
    if n == 0:
        L.die(f"no outputs of {new_last_name} found to reconnect")
    text = text[:s] + rewired + text[e:]
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_text(
        f"// CONTROL for paper/coverage_check.py --v56: {src.name} with its final\n"
        f"// {', '.join(ROUTE)} instantiations removed and {new_last_name} driving the\n"
        f"// top-level outputs. Built by script; do not edit.\n" + text, encoding="utf-8")

    ctext = L.read(dst)
    cseq = L.instantiation_sequence(ctext, L.top_module(ctext))
    if cseq != seq[:-3]:
        L.die(f"control sequence {cseq} is not the original less the route")
    errors = [m for sev, m in lint.lint(ctext, "shor-5qubit-8bit") if sev == "error"]
    if errors:
        L.die("control design does not lint clean:\n  " + "\n  ".join(errors))
    return cseq


CONN_RE = re.compile(r"\.(io_(?:in|out)_\w+)\s*\(\s*([A-Za-z_]\w*)\s*\)")


def build_qft_control(src: Path, dst: Path, lint) -> list[str]:
    """QFT_v2.v with its single SWGate instance deleted and the chain re-joined:
    every net the SWGate drove is replaced by the net it read."""
    text = L.read(src)
    top = L.top_module(text)
    insts = instances(text, top)
    seq = [m for m, *_ in insts]
    if seq != L.instantiation_sequence(text, top):
        L.die(f"instance parser disagrees with paperlib: {seq}")
    sw = [i for i, m in enumerate(seq) if m.startswith("SWGate")]
    if len(sw) != 1 or sw[0] in (0, len(seq) - 1):
        L.die(f"expected exactly one interior SWGate in {src.name}; sequence {seq}")
    _, name, s, e = insts[sw[0]]
    conns = dict(CONN_RE.findall(text[s:e]))
    ins = {k[len("io_in_"):]: v for k, v in conns.items() if k.startswith("io_in_")}
    outs = {k[len("io_out_"):]: v for k, v in conns.items() if k.startswith("io_out_")}
    if set(ins) != set(outs):
        L.die(f"{name}: input and output port sets differ, cannot bypass: "
              f"{sorted(set(ins) ^ set(outs))}")
    line_start = text.rfind("\n", 0, s) + 1
    rest = text[e:].lstrip("\n")
    for port, onet in outs.items():               # downstream reads what SWGate read
        rest, n = re.subn(rf"\(\s*{re.escape(onet)}\s*\)", f"({ins[port]})", rest)
        if n == 0:
            L.die(f"{name}.{port}: output net {onet} is not read downstream")
    text = text[:line_start] + rest
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_text(f"// CONTROL for paper/coverage_check.py --qft: {src.name} with {name} "
                   f"({seq[sw[0]]}) removed and the chain re-joined. Built by script; do not edit.\n"
                   + text, encoding="utf-8")
    ctext = L.read(dst)
    cseq = L.instantiation_sequence(ctext, L.top_module(ctext))
    if cseq != seq[:sw[0]] + seq[sw[0] + 1:]:
        L.die(f"QFT control sequence {cseq} is not the original less the SWGate")
    errors = [m for sev, m in lint.lint(ctext, "qft-3qubit-8bit") if sev == "error"]
    if errors:
        L.die("QFT control does not lint clean:\n  " + "\n  ".join(errors))
    return cseq


# --------------------------------------------------------------------------
# simulation and measurement
# --------------------------------------------------------------------------
LINE = re.compile(r"^#?\s*(ok|FAIL)\s+\|([01]+)>\s+(QSV_\d+_\d+)\s*(?:=\s*|:\s*got\s+)(\S+)", re.M)


def golden_codes(vg, qc, lbl: str) -> dict[str, int]:
    """The integer the testbench expects for each QSV component, computed exactly as
    verify_generated.py computes it (drive scaling, rounding, width)."""
    from qiskit.quantum_info import Statevector
    n_states, width, one, sig, _ = vg.geometry(qc.num_qubits)
    drive = min(one, (1 << (width - 1)) - 1)
    gold = Statevector.from_label(lbl).evolve(qc).data * (drive / one)
    codes = {}
    for k, name in enumerate(sig):
        x = gold[k // 2].real if k % 2 == 0 else gold[k // 2].imag
        codes[name] = int(round(x * one)) & ((1 << width) - 1)
    return codes


def signed(v: int, width: int) -> int:
    return v - (1 << width) if v >> (width - 1) else v


def errors_by_input(vg, qc, log: str) -> dict[str, dict]:
    """Per input label: components checked, components within tolerance, and the
    largest |got - expected| in LSB. An unknown ('x'/'z') value counts as
    unmeasurable and is reported, never silently skipped."""
    _, width, *_ = vg.geometry(qc.num_qubits)
    tol = 16 if width == 16 else 1
    gold, out = {}, {}
    for status, lbl, comp, got in LINE.findall(log):
        if lbl not in gold:
            gold[lbl] = golden_codes(vg, qc, lbl)
        r = out.setdefault(lbl, {"checks": 0, "ok": 0, "max_lsb": 0, "unknown": 0})
        r["checks"] += 1
        if not re.fullmatch(r"[0-9a-fA-F]+", got):
            r["unknown"] += 1
            continue
        d = abs(signed(int(got, 16), width) - signed(gold[lbl][comp], width))
        r["max_lsb"] = max(r["max_lsb"], d)
        r["ok"] += d <= tol
        if (status == "ok") != (d <= tol):
            L.die(f"transcript says {status} for |{lbl}> {comp} but the recomputed "
                  f"error is {d} LSB (tolerance {tol}); golden computation disagrees "
                  f"with the harness")
    return out


def run_one(vg, sim, spec: str, design: Path, tag: str, forced: str | None):
    buf = io.StringIO()
    try:
        with contextlib.redirect_stdout(buf):
            vg.main(spec, str(design), forced_input=forced, tag=tag)
    except SystemExit as e:
        L.die(f"{tag}: harness refused: {e}\n{buf.getvalue()}")
    text = buf.getvalue()
    top = re.search(r"top module\s*:\s*(\w+)", text)
    if not top:
        L.die(f"{tag}: harness produced no testbench\n{text}")
    cov = re.search(r"test vectors: \d+ input\(s\) \[(.*?)\] covering (\d+)/(\d+) qubit transpositions"
                    r"(?:\s+UNCOVERED (\[.*\]))?", text)
    res = sim.simulate(design, L.RAG / "new_circuits" / "tb" / f"tb_{tag}_gen.v", f"tb_{tag}_gen",
                       library=str(L.RAG / "new_circuits" / "support" / f"{tag}_gen_support.sv"),
                       label=tag)
    TRANSCRIPTS.mkdir(parents=True, exist_ok=True)
    (TRANSCRIPTS / f"{tag}.log").write_text(res["log"], encoding="utf-8")
    return res, cov


def setup():
    os.chdir(L.RAG)                            # the harness uses relative paths
    for p in (L.RAG / "rag", L.RAG):
        sys.path.insert(0, str(p))
    vg = _import(L.RAG / "new_circuits" / "verify_generated.py", "verify_generated")
    sim = _import(L.RAG / "rag" / "simulate.py", "simulate")
    lint = _import(L.RAG / "rag" / "lint_generated.py", "lint_generated")
    if not sim.DRIVER.exists():
        L.die(f"ModelSim driver not found at {sim.DRIVER}")
    return vg, sim, lint


def scored(set_name: str) -> list[dict]:
    path = L.RESULTS / f"eval_v2_results_{set_name}.json"
    return json.loads(L.read(path))


# --------------------------------------------------------------------------
# --v56
# --------------------------------------------------------------------------
def v56(vg, sim, lint) -> list[dict]:
    rec = next(r for r in scored("USER") if r["circuit"] == V56)
    if rec["verdict"] != "PASS" or rec["input"] != V56_INPUTS[0]:
        L.die(f"committed V5_6 record is {rec['verdict']} from {rec['input']}; this "
              f"check assumes PASS from {V56_INPUTS[0]}")
    spec = rec["spec"]
    gen = L.OUT2 / f"{V56}_v2.v"
    ctrl = CONTROLS / f"{V56}_noroute.v"
    cseq = build_control(gen, ctrl, lint)
    print(f"control built: {ctrl.relative_to(L.REPO)}  ({len(cseq)} instantiations: {cseq})")

    qc = vg.cc.load_circuit(spec)
    rows = []
    for design, kind in ((gen, "generated"), (ctrl, "route_removed")):
        for lbl in V56_INPUTS:
            tag = f"cov_{V56}_{kind}_{lbl}"
            res, _ = run_one(vg, sim, spec, design, tag, lbl)
            e = errors_by_input(vg, qc, res["log"]).get(lbl)
            if not e:
                L.die(f"{tag}: no checks parsed ({res['verdict']}, {res['category']})")
            rows.append({"design": kind, "input": lbl, "verdict": res["verdict"],
                         "checks": e["checks"], "within_tol": e["ok"],
                         "max_err_lsb": e["max_lsb"], "unknown": e["unknown"],
                         "file": design.relative_to(L.REPO).as_posix()})
            print(f"  {kind:<14} |{lbl}>  {res['verdict']:<5} {e['ok']:>2}/{e['checks']}"
                  f"  max error {e['max_lsb']} LSB")
    anchor = next(r for r in rows if r["design"] == "generated" and r["input"] == V56_INPUTS[0])
    if anchor["verdict"] != "PASS":
        L.die("V5_6 from |00000> does not reproduce its committed PASS; stopping")
    L.write_csv(L.DATA / "v56_route.csv", rows)
    return rows


# --------------------------------------------------------------------------
# --cover
# --------------------------------------------------------------------------
def cover(vg, sim) -> list[dict]:
    targets = []
    for s in SCORED_SETS:
        for r in scored(s):
            if r["verdict"] in ("PASS", "FAIL"):
                targets.append(r)
    nq = {r["circuit"]: vg.cc.load_circuit(r["spec"]).num_qubits for r in targets}
    if any(n == 2 for n in nq.values()):
        L.die("a 2-qubit circuit is in a 3/5-qubit set")
    print(f"{len(targets)} scored 3- and 5-qubit designs "
          f"({sum(n == 3 for n in nq.values())} at 3 qubits, {sum(n == 5 for n in nq.values())} at 5).")
    print("2-qubit circuits skipped: one transposition, already required by the scoring screen.\n")

    original = vg.covering_inputs
    rows = []
    for i, r in enumerate(targets, 1):
        name, spec, anchor_lbl = r["circuit"], r["spec"], r["input"]
        design = L.OUT2 / f"{name}_v2.v"
        qc = vg.cc.load_circuit(spec)
        n_trans = qc.num_qubits * (qc.num_qubits - 1) // 2

        for pass_name, hsafe in (("hsafe", True), ("any", False)):
            chosen = {}

            def patched(q, hsafe_only=True, _h=hsafe):
                labels, uncovered = original(q, hsafe_only=_h)
                chosen["cover"] = list(labels)
                if isinstance(uncovered, int):          # no candidate at all
                    uncovered = {(a, b) for a in range(q.num_qubits) for b in range(a + 1, q.num_qubits)}
                if _h and anchor_lbl not in labels:
                    labels = labels + [anchor_lbl]
                return labels, uncovered
            vg.covering_inputs = patched
            try:
                tag = f"cov_{name}_{pass_name}"
                res, cov = run_one(vg, sim, spec, design, tag, None)
            finally:
                vg.covering_inputs = original
            per = errors_by_input(vg, qc, res["log"])
            covered = int(cov.group(2)) if cov else 0
            uncovered = cov.group(4) if cov and cov.group(4) else ""
            cover_lbls = chosen.get("cover", [])
            worst = max((per[l]["max_lsb"] for l in cover_lbls if l in per), default="")
            within = all(per[l]["ok"] == per[l]["checks"] and per[l]["unknown"] == 0
                         for l in cover_lbls if l in per)
            row = {"circuit": name, "qubits": qc.num_qubits, "pass": pass_name,
                   "scored_input": anchor_lbl, "cover_inputs": " ".join(cover_lbls),
                   "transpositions_covered": covered, "transpositions_total": n_trans,
                   "uncovered": uncovered, "all_within_tol": within,
                   "max_err_lsb": worst, "sim_verdict": res["verdict"]}
            if pass_name == "hsafe":
                a = per.get(anchor_lbl)
                if not a or a["ok"] != a["checks"]:
                    L.die(f"{name}: originally scored input |{anchor_lbl}> no longer passes "
                          f"({a}); this harness disagrees with the published verdict")
                row["anchor_ok"] = f"{a['ok']}/{a['checks']}"
            else:
                row["anchor_ok"] = ""
            rows.append(row)
            print(f"  [{i:>2}/{len(targets)}] {name:<6} {pass_name:<5} inputs={row['cover_inputs']:<24} "
                  f"covers {covered}/{n_trans}  within_tol={within}  max={worst} LSB")
            if pass_name == "hsafe" and not uncovered:
                break                                   # nothing left for a second pass
    L.write_csv(L.DATA / "coverage.csv", rows)
    return rows


# --------------------------------------------------------------------------
# --qft
# --------------------------------------------------------------------------
QFT_SPEC = "corpus/code_examples/QFT/spec.py"


def qft(vg, sim, lint) -> list[dict]:
    gen = L.OUT2 / "QFT_v2.v"
    log = json.loads(L.read(L.OUT2 / "QFT_v2_log.json"))
    if log.get("example") is not None:
        L.die(f"QFT_v2 log says example={log.get('example')!r}; expected a no-example generation")
    ctrl = CONTROLS / "QFT_noswap.v"
    cseq = build_qft_control(gen, ctrl, lint)
    print(f"control built: {ctrl.relative_to(L.REPO)}  ({len(cseq)} instantiations)")
    qc = vg.cc.load_circuit(QFT_SPEC)
    labels = [format(i, f"0{qc.num_qubits}b") for i in range(2 ** qc.num_qubits)]
    sys.path.insert(0, str(L.RAG / "rag"))
    from hsafe import first_unsafe_h
    rows = []
    for design, kind in ((gen, "generated"), (ctrl, "swap_removed")):
        for lbl in labels:
            tag = f"qft_{kind}_{lbl}"
            res, _ = run_one(vg, sim, QFT_SPEC, design, tag, lbl)
            e = errors_by_input(vg, qc, res["log"]).get(lbl)
            if not e:
                L.die(f"{tag}: no checks parsed ({res['verdict']}, {res['category']})")
            _, det = vg.sensitivity(qc, lbl)
            rows.append({"design": kind, "input": lbl,
                         "h_safe": first_unsafe_h(qc, lbl) is None,
                         "transpositions_detected": len(det),
                         "verdict": res["verdict"], "checks": e["checks"], "within_tol": e["ok"],
                         "max_err_lsb": e["max_lsb"], "unknown": e["unknown"],
                         "file": design.relative_to(L.REPO).as_posix()})
            print(f"  {kind:<13} |{lbl}>  h_safe={rows[-1]['h_safe']!s:<5} detects {len(det)}/3  "
                  f"{res['verdict']:<5} {e['ok']:>2}/{e['checks']}  max error {e['max_lsb']} LSB")
    L.write_csv(L.DATA / "qft_check.csv", rows)
    return rows


# --------------------------------------------------------------------------
# summary, from the CSVs only
# --------------------------------------------------------------------------
def summarise() -> int:
    status = 0
    p = L.DATA / "qft_check.csv"
    if p.exists():
        rows = list(csv.DictReader(p.open(encoding="utf-8")))
        g = [r for r in rows if r["design"] == "generated"]
        c = [r for r in rows if r["design"] == "swap_removed"]
        sens = [r["input"] for r in g if int(r["transpositions_detected"]) > 0]
        print("\n=== full QFT, screen off (paper/data/qft_check.csv)")
        print(f"  inputs: {len(g)}; exchange-sensitive: {len(sens)}; H-safe: "
              f"{sum(r['h_safe'] == 'True' for r in g)}")
        print(f"  generated: {sum(int(r['within_tol']) == int(r['checks']) for r in g)}/{len(g)} inputs fully "
              f"within +/-1 LSB; largest error {max(int(r['max_err_lsb']) for r in g)} LSB")
        cs = [int(r["max_err_lsb"]) for r in c if r["input"] in sens]
        print(f"  swap removed, exchange-sensitive inputs: largest error {min(cs)}-{max(cs)} LSB")
        print(f"  from |000> (detects nothing): generated "
              f"{next(r['max_err_lsb'] for r in g if r['input'] == '000')} LSB, swap removed "
              f"{next(r['max_err_lsb'] for r in c if r['input'] == '000')} LSB")
    p = L.DATA / "v56_route.csv"
    if p.exists():
        rows = list(csv.DictReader(p.open(encoding="utf-8")))
        print("\n=== V5_6 route (paper/data/v56_route.csv)")
        for r in rows:
            print(f"  {r['design']:<14} |{r['input']}>  {r['within_tol']}/{r['checks']} within tolerance, "
                  f"max error {r['max_err_lsb']} LSB")
        g = {r["input"]: int(r["max_err_lsb"]) for r in rows if r["design"] == "generated"}
        c = {r["input"]: int(r["max_err_lsb"]) for r in rows if r["design"] == "route_removed"}
        sens = V56_INPUTS[1:]
        print(f"  from the exchange-sensitive inputs: largest error {max(g[l] for l in sens)} LSB with the route, "
              f"{min(c[l] for l in sens)}-{max(c[l] for l in sens)} LSB without it")
        print(f"  from |{V56_INPUTS[0]}>: {g[V56_INPUTS[0]]} LSB with, {c[V56_INPUTS[0]]} LSB without "
              f"(expected equal-looking: this input cannot see the exchange)")
    else:
        print(f"(no {p.name} yet)")

    p = L.DATA / "coverage.csv"
    if p.exists():
        rows = list(csv.DictReader(p.open(encoding="utf-8")))
        hs = [r for r in rows if r["pass"] == "hsafe"]
        full = [r for r in hs if not r["uncovered"]]
        clean = [r for r in hs if r["all_within_tol"] == "True"]
        any_rows = {r["circuit"]: r for r in rows if r["pass"] == "any"}
        print("\n=== covering inputs (paper/data/coverage.csv)")
        print(f"  circuits: {len(hs)}")
        print(f"  H-safe inputs cover every transposition: {len(full)}/{len(hs)}")
        print(f"  all H-safe covering vectors within tolerance: {len(clean)}/{len(hs)}")
        worst = max(int(r["max_err_lsb"]) for r in hs if r["max_err_lsb"] != "")
        print(f"  largest error over H-safe covering vectors: {worst} LSB")
        for r in hs:
            if r["uncovered"] or r["all_within_tol"] != "True":
                a = any_rows.get(r["circuit"])
                extra = (f"; any-input pass covers {a['transpositions_covered']}/{a['transpositions_total']}, "
                         f"max {a['max_err_lsb']} LSB") if a else ""
                print(f"  ! {r['circuit']}: H-safe covers {r['transpositions_covered']}/{r['transpositions_total']} "
                      f"(uncovered {r['uncovered'] or 'none'}), within_tol={r['all_within_tol']}, "
                      f"max {r['max_err_lsb']} LSB{extra}")
                if r["all_within_tol"] != "True":
                    status = 1
    else:
        print(f"(no {p.name} yet)")
    return status


def dry(vg, lint) -> int:
    """No simulator. Builds the control, checks this script's golden computation
    against the testbench the harness writes, and lists what --cover would run."""
    rec = next(r for r in scored("USER") if r["circuit"] == V56)
    cseq = build_control(L.OUT2 / f"{V56}_v2.v", CONTROLS / f"{V56}_noroute.v", lint)
    print(f"control OK: {len(cseq)} instantiations, lint clean: {cseq}")
    qc = vg.cc.load_circuit(rec["spec"])
    for lbl in V56_INPUTS:
        tag = f"dry_{V56}_{lbl}"
        with contextlib.redirect_stdout(io.StringIO()):
            vg.main(rec["spec"], str(L.OUT2 / f"{V56}_v2.v"), forced_input=lbl, tag=tag)
        tb = L.read(L.RAG / "new_circuits" / "tb" / f"tb_{tag}_gen.v")
        want = {c: int(v, 16) for l, c, v in
                re.findall(r'check\("\|([01]+)> (QSV_\d+_\d+)", \w+, \d+\'h([0-9A-Fa-f]+)\)', tb) if l == lbl}
        mine = golden_codes(vg, qc, lbl)
        if len(want) != 64 or want != mine:
            L.die(f"golden mismatch for |{lbl}>: harness has {len(want)} codes; differ at "
                  f"{[c for c in want if want[c] != mine.get(c)][:5]}")
        print(f"golden codes for |{lbl}> match the harness testbench (64/64)")
    n = 0
    for s in SCORED_SETS:
        for r in scored(s):
            if r["verdict"] not in ("PASS", "FAIL"):
                continue
            q = vg.cc.load_circuit(r["spec"])
            with contextlib.redirect_stdout(io.StringIO()):
                labels, unc = vg.covering_inputs(q)
            n += 1
            print(f"  {r['circuit']:<6} {q.num_qubits}q scored |{r['input']}>  H-safe cover {labels}"
                  f"  uncovered {sorted(unc) if unc else '-'}")
    print(f"--cover would simulate {n} designs (plus a second pass for any with uncovered transpositions)")

    qcq = vg.cc.load_circuit(QFT_SPEC)
    qseq = build_qft_control(L.OUT2 / "QFT_v2.v", CONTROLS / "QFT_noswap.v", lint)
    print(f"QFT control OK: {len(qseq)} instantiations, lint clean")
    for i in range(8):
        lbl = format(i, "03b"); tag = f"dry_QFT_{lbl}"
        with contextlib.redirect_stdout(io.StringIO()):
            vg.main(QFT_SPEC, str(L.OUT2 / "QFT_v2.v"), forced_input=lbl, tag=tag)
        tb = L.read(L.RAG / "new_circuits" / "tb" / f"tb_{tag}_gen.v")
        want = {c: int(v, 16) for l, c, v in
                re.findall(r'check\("\|([01]+)> (QSV_\d+_\d+)", \w+, \d+\'h([0-9A-Fa-f]+)\)', tb) if l == lbl}
        if len(want) != 16 or want != golden_codes(vg, qcq, lbl):
            L.die(f"QFT golden mismatch for |{lbl}>")
    print("QFT golden codes match the harness testbench for all 8 inputs; --qft would run 16 simulations")
    return 0


def main() -> int:
    args = set(sys.argv[1:])
    if not args & {"--v56", "--cover", "--qft", "--recheck", "--dry"}:
        print(__doc__)
        return 2
    if "--dry" in args:
        vg, _, lint = setup()
        return dry(vg, lint)
    if args & {"--v56", "--cover", "--qft"}:
        vg, sim, lint = setup()
        if "--qft" in args:
            print("--- full QFT from all eight inputs: generated vs swap removed")
            qft(vg, sim, lint)
        if "--v56" in args:
            print("--- V5_6 route: generated vs route removed")
            v56(vg, sim, lint)
        if "--cover" in args:
            print("--- covering inputs on the scored 3- and 5-qubit designs")
            cover(vg, sim)
    return summarise()


if __name__ == "__main__":
    raise SystemExit(main())
