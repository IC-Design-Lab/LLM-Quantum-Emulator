"""Static validator for generated top-level SystemVerilog. No simulator, no cost.

Catches every failure mode observed in the Arm-2 functional evaluation BEFORE
spending a ModelSim run or a repair call:

  Arm-2 failure            caught by
  -----------------------  --------------------------------------------------
  32x port-not-found       PORTS   (names checked against harvested catalog)
  SwapPosition at top      LEGAL   (not in top_level_instantiable)
  invented module          LEGAL
  missing/extra top port   IFACE
  broken chain wiring      CHAIN

Findings are returned as structured text so a repair prompt can quote them
verbatim. Severity `error` means it cannot elaborate; `warn` means suspicious
but legal.

    python rag/lint_generated.py --self-test          # 9 ground truths must be clean
    python rag/lint_generated.py <file.v> <family>
"""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
IFACE = ROOT / "corpus_v2" / "interfaces"

FAMILY_META = {           # family -> (n_states, width)
    "2qubit-16bit": (4, 16),
    "qft-3qubit-8bit": (8, 8),
    "shor-5qubit-8bit": (32, 8),
}

KW = {"module", "endmodule", "input", "output", "inout", "wire", "reg", "logic",
      "assign", "always", "always_ff", "always_comb", "initial", "if", "else",
      "for", "while", "case", "begin", "end", "parameter", "localparam",
      "generate", "genvar", "integer", "function", "task"}

INST_OPEN = re.compile(r"^\s*([A-Za-z_]\w*)\s+([A-Za-z_]\w*)\s*\(\s*(?://.*)?$")
CONN = re.compile(r"^\s*\.([A-Za-z_]\w*)\s*\(\s*([^)]*?)\s*\)")
MOD_DECL = re.compile(r"^module\s+(\w+)\s*\(", re.M)


def load_catalog(family: str) -> dict:
    p = IFACE / f"{family}_catalog.json"
    if not p.exists():
        raise SystemExit(f"missing {p} — run: python rag/build_interfaces.py")
    return json.loads(p.read_text(encoding="utf-8"))


def expected_top_ports(family: str) -> list[str]:
    n, _ = FAMILY_META[family]
    p = ["clock", "reset"]
    p += [f"io_in_QSV_{i}_{j}" for i in range(n) for j in (0, 1)]
    p += ["io_in_valid"]
    p += [f"io_out_QSV_{i}_{j}" for i in range(n) for j in (0, 1)]
    p += ["io_out_valid"]
    return p


def parse(text: str):
    """(top_module_name, declared_top_ports, [(module, inst, [(port, signal)])])."""
    lines = [re.sub(r"//.*$", "", ln) for ln in text.splitlines()]
    decls = MOD_DECL.findall(text)
    top = decls[0] if decls else None

    # top-level port names: everything between `module X(` and the closing `);`
    top_ports, inside = [], False
    for ln in lines:
        if re.match(r"^module\s+\w+\s*\(", ln):
            inside = True
            continue
        if inside:
            if ln.strip().startswith(");"):
                break
            for w in re.findall(r"\b([a-z_]\w*)\s*(?:,|$)", ln.strip()):
                if w not in ("input", "output", "inout", "wire", "reg", "logic"):
                    top_ports.append(w)

    insts, i = [], 0
    while i < len(lines):
        m = INST_OPEN.match(lines[i])
        if m and m.group(1) not in KW:
            conns, i = [], i + 1
            while i < len(lines) and not lines[i].strip().startswith(");"):
                c = CONN.match(lines[i])
                if c:
                    conns.append((c.group(1), c.group(2)))
                i += 1
            insts.append((m.group(1), m.group(2), conns))
        i += 1
    return top, top_ports, insts


def composition_check(insts, spec_path: Path | None, family: str):
    """Compare the emitted module sequence to the rulebook's prediction.

    WARNING, not error: NC_06 proved a different-but-working composition exists.
    This catches the other observed failure mode — omitted permutation brackets
    (NC_03, NC_10) — which is invisible to every port-level check but is exactly
    what produced a wrong statevector.
    """
    if spec_path is None or family != "2qubit-16bit":
        return []
    sys.path.insert(0, str(ROOT / "rag"))
    sys.path.insert(0, str(ROOT))
    import canonical_converter as cc
    from reference_composer import module_sequence
    exp = module_sequence(cc.gate_tokens(cc.load_circuit(spec_path)))
    PERMS = ("CompatiblePerm", "SwapPosition", "rearrangeTo1stPosition")
    got = [m for m, _, _ in insts]
    norm = ["CompatiblePerm" if m.startswith(PERMS) else m for m in got]
    if norm == exp:
        return []
    return [("warn",
             f"COMPOSITION: emitted {len(got)} instantiations, the rulebook derives "
             f"{len(exp)} from the spec.\n      expected: {exp}\n      emitted : {got}")]


def lint(text: str, family: str, spec_path: Path | None = None) -> list[tuple[str, str]]:
    cat = load_catalog(family)
    legal = set(cat["top_level_instantiable"])
    mods = cat["modules"]
    out: list[tuple[str, str]] = []

    top, top_ports, insts = parse(text)
    if top is None:
        return [("error", "no module declaration found")]

    # ---- IFACE: top-level port list ------------------------------------
    exp = expected_top_ports(family)
    missing = [p for p in exp if p not in top_ports]
    extra = [p for p in top_ports if p not in exp]
    if missing:
        out.append(("error", f"IFACE: top module `{top}` is missing required ports: "
                             f"{missing}"))
    if extra:
        out.append(("warn", f"IFACE: top module `{top}` declares unexpected ports: "
                            f"{extra}"))

    if not insts:
        out.append(("error", "no module instantiations found in the top level"))
        return out

    # ---- LEGAL + PORTS --------------------------------------------------
    # Severity is decided by whether it will ELABORATE, not by style. Circuit
    # NC_06 instantiated an internal module directly, wired its real `ket` ports
    # correctly, and PASSED functional verification — so "internal module at top
    # level" is a warning when its ports are right and only becomes an error via
    # the PORTS check when they are wrong (NC_01/04/09: 32 port-not-found each).
    for mod, inst, conns in insts:
        if mod not in legal:
            if mod not in mods:
                out.append(("error",
                            f"LEGAL: `{mod}` (instance `{inst}`) does not exist in "
                            f"family {family}. Legal: {sorted(legal)}"))
                continue
            out.append(("warn",
                        f"LEGAL: `{mod}` (instance `{inst}`) is an INTERNAL module. It "
                        f"elaborates only if wired with its own interface; the intended "
                        f"top-level adapter is CompatiblePerm."))
        declared = [p[2] for p in mods[mod]]
        used = [p for p, _ in conns]
        bad = [p for p in used if p not in declared]
        omitted = [p for p in declared if p not in used]
        if bad:
            out.append(("error",
                        f"PORTS: instance `{inst}` ({mod}) connects ports that do not "
                        f"exist on that module: {bad}. Its actual ports are: "
                        f"{declared}"))
        if omitted:
            out.append(("error",
                        f"PORTS: instance `{inst}` ({mod}) leaves required ports "
                        f"unconnected: {omitted}"))

    # ---- DECL -----------------------------------------------------------
    # A wire declared twice is a hard compile error, and the compile aborts before
    # vsim runs -- so it produced no transcript and scored UNKNOWN rather than FAIL
    # until simulate.py learned to read the driver's output. It is trivially
    # detectable here, which is where a free check belongs.
    declared_wires: list[str] = []
    for m in re.finditer(r"^\s*wire\s*(?:\[[^\]]*\])?\s*([^;]+);", text, re.M):
        declared_wires += [w.strip() for w in m.group(1).split(",") if w.strip()]
    seen: set[str] = set()
    dupes = sorted({w for w in declared_wires if w in seen or seen.add(w)})
    if dupes:
        out.append(("error",
                    f"DECL: wire(s) declared more than once, which will not compile: "
                    f"{dupes[:4]}"))

    # ---- CHAIN ----------------------------------------------------------
    def bus(conns, kind):
        return [s for p, s in conns if p.startswith(f"io_{kind}_QSV")]

    for k, (mod, inst, conns) in enumerate(insts):
        names = {p for p, _ in conns}
        for req in ("clock", "reset"):
            if req in {p[2] for p in mods.get(mod, [])} and req not in names:
                out.append(("error", f"CHAIN: instance `{inst}` does not connect {req}"))
        ins, outs = bus(conns, "in"), bus(conns, "out")
        if k == 0:
            if ins and not all(s.startswith("io_in_QSV") for s in ins):
                out.append(("error",
                            f"CHAIN: first instance `{inst}` must read the top-level "
                            f"inputs io_in_QSV_*, got {ins[:3]}..."))
        else:
            # A stage consumes the previous stage's outputs -- but only on the ports
            # it actually HAS. `CSGate3QubitVector8bit` genuinely lacks io_in_QSV_3_1
            # and io_in_QSV_7_1 (a real deviation in the hardware, see
            # build_interfaces.py), so it can never take all 16 signals a preceding
            # gate emits. Comparing the raw lists made every 3-qubit circuit
            # containing a CS gate fail this check, burn all its repair rounds, and
            # get "fixed" into something worse.
            # Match by PORT INDEX, not by list position: named port connections are
            # order-free in Verilog, so comparing the two signal lists in order
            # flagged correct wiring whenever the model happened to emit the ports
            # in a different sequence.
            driven = {p[len("io_out_"):]: s for p, s in insts[k - 1][2]
                      if p.startswith("io_out_QSV")}
            wrong = []
            for p, s in conns:
                if not p.startswith("io_in_QSV"):
                    continue
                want = driven.get(p[len("io_in_"):])
                # A port the previous stage has no output for is not an error: the
                # CS gate genuinely lacks io_in_QSV_3_1 / io_in_QSV_7_1, a real
                # deviation in the hardware (see build_interfaces.py).
                if want is not None and s != want:
                    wrong.append(f"{p} reads `{s}`, previous stage drives `{want}`")
            if ins and wrong:
                out.append(("error",
                            f"CHAIN: instance `{inst}` does not consume the previous "
                            f"instance's outputs -- " + "; ".join(wrong[:2])
                            + (f" (+{len(wrong) - 2} more)" if len(wrong) > 2 else "")))
        if k == len(insts) - 1:
            if outs and not all(s.startswith("io_out_QSV") for s in outs):
                out.append(("error",
                            f"CHAIN: last instance `{inst}` must drive the top-level "
                            f"outputs io_out_QSV_*, got {outs[:3]}..."))

    out += composition_check(insts, spec_path, family)
    return out


def render(findings) -> str:
    if not findings:
        return "LINT: clean"
    errs = sum(1 for s, _ in findings if s == "error")
    L = [f"LINT: {errs} error(s), {len(findings) - errs} warning(s)"]
    L += [f"  [{s.upper()}] {m}" for s, m in findings]
    return "\n".join(L)


def self_test() -> int:
    """The lint must pass all nine verified ground truths before it judges anything."""
    sys.path.insert(0, str(ROOT / "rag"))
    from reference_composer import TOP_MODULE
    CE = ROOT / "corpus" / "code_examples"
    circuits = ["Circuit0_06", "Circuit0_17", "Circuit0_2", "Circuit0_3", "Circuit0_4",
                "Circuit0_5", "Circuit1_0167", "Circuit1_23", "Circuit1_45"]
    bad = 0
    print("SELF-TEST — lint must be clean on every verified ground truth\n")
    for c in circuits:
        top = TOP_MODULE.get(c, c)
        text = (CE / c / f"{c}_ground_truth.sv").read_text(encoding="utf-8",
                                                           errors="replace")
        keep, body = False, []
        for ln in text.splitlines():
            if ln.startswith(f"module {top}("):
                keep = True
            if keep:
                body.append(ln)
                if ln.startswith("endmodule"):
                    break
        f = lint("\n".join(body), "2qubit-16bit")
        errs = [x for x in f if x[0] == "error"]
        bad += bool(errs)
        print(f"  {c:<14} {'clean' if not f else render(f).splitlines()[0]}")
        for s, m in f:
            print(f"      [{s}] {m[:130]}")
    print(f"\n  {9 - bad}/9 ground truths lint clean")
    return 1 if bad else 0


def main(argv) -> int:
    if not argv or argv[0] == "--self-test":
        return self_test()
    text = Path(argv[0]).read_text(encoding="utf-8", errors="replace")
    spec = Path(argv[2]) if len(argv) > 2 else None
    print(render(lint(text, argv[1], spec)))
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
