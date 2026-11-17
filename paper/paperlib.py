"""Shared helpers for the paper scripts. Every value comes from a file at runtime.

Nothing in this module carries a measured number. It knows WHERE things are and HOW
to read them; the scripts that import it decide what to do when what they read does
not match what was expected.
"""
from __future__ import annotations

import csv
import re
import subprocess
import sys
from pathlib import Path

PAPER = Path(__file__).resolve().parent
REPO = PAPER.parent
RAG = REPO / "rag-cag-system"
RESULTS = RAG / "results"
OUT2 = RAG / "rag" / "output_v2"
CORPUS = RAG / "corpus" / "code_examples"
REPORTS = RESULTS / "vivado" / "reports"
DATA = PAPER / "data"
TABLES = PAPER / "tables"
FIGURES = PAPER / "figures"

VERILOG_KW = {"module", "input", "output", "wire", "reg", "assign", "always",
              "initial", "begin", "end", "if", "else", "endmodule", "logic",
              "parameter", "localparam", "function", "task", "case", "default"}


def die(msg: str) -> None:
    print(f"\nSTOP: {msg}", file=sys.stderr)
    raise SystemExit(2)


def read(p: Path) -> str:
    return p.read_text(encoding="utf-8", errors="replace")


def source(path: Path, what: str) -> str:
    """One line for the provenance list printed under every table and figure."""
    try:
        rel = path.resolve().relative_to(REPO)
    except ValueError:
        rel = path
    return f"    {what:<44} <- {rel}"


# --------------------------------------------------------------------------
# Verilog structure
# --------------------------------------------------------------------------
def strip_comments(text: str) -> str:
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
    return re.sub(r"//[^\n]*", "", text)


def declared_modules(text: str) -> list[str]:
    return re.findall(r"^\s*module\s+([A-Za-z_]\w*)", strip_comments(text), re.M)


def top_module(text: str) -> str:
    """The module no other module in the file instantiates.

    firtool emits leaf modules first and the top last; the generated designs hold
    a single module; the corrected Shor puts its top first. Declaration order is
    therefore not a rule, but 'not instantiated by anyone' is.
    """
    clean = strip_comments(text)
    mods = declared_modules(clean)
    if not mods:
        die("no module declaration found")
    if len(mods) == 1:
        return mods[0]
    instantiated = set()
    for m in re.finditer(r"^\s*([A-Za-z_]\w*)\s+[A-Za-z_]\w*\s*\(", clean, re.M):
        name = m.group(1)
        if name in mods and name not in VERILOG_KW:
            instantiated.add(name)
    tops = [m for m in mods if m not in instantiated]
    if len(tops) == 1:
        return tops[0]
    # More than one orphan: ShorFixed keeps the definition of the permutation
    # module whose instantiation it removed. The top is the orphan that roots the
    # largest instantiation tree.
    bodies = {m.group(1): m.group(2) for m in re.finditer(
        r"^\s*module\s+([A-Za-z_]\w*)(.*?)^\s*endmodule", clean, re.M | re.S)}
    children = {n: {c for c in re.findall(r"^\s*([A-Za-z_]\w*)\s+[A-Za-z_]\w*\s*\(", b, re.M)
                    if c in mods and c not in VERILOG_KW}
                for n, b in bodies.items()}

    def reach(n, seen=None):
        seen = set() if seen is None else seen
        for c in children.get(n, ()):
            if c not in seen:
                seen.add(c)
                reach(c, seen)
        return seen

    ranked = sorted(tops, key=lambda n: len(reach(n)), reverse=True)
    if len(reach(ranked[0])) == len(reach(ranked[1])):
        die(f"could not identify a unique top module: candidates {tops}")
    return ranked[0]


def module_ports(text: str, top: str) -> list[tuple[str, str, int]]:
    """(name, direction, width) for every port of `top`, in declaration order.

    Handles both styles present in this repository:
        input  [15:0]  a,        (generated: one declaration per port)
        input  [15:0]  a,  b,    (firtool: later names inherit direction/width)
    """
    clean = strip_comments(text)
    m = re.search(rf"^\s*module\s+{re.escape(top)}\s*\((.*?)\)\s*;", clean, re.M | re.S)
    if not m:
        die(f"could not read the port list of module {top}")
    ports, cur_dir, cur_w = [], None, 1
    for piece in m.group(1).split(","):
        piece = " ".join(piece.split())
        if not piece:
            continue
        pm = re.match(r"(?:(input|output|inout)\s+)?(?:(?:wire|reg|logic)\s+)?"
                      r"(?:\[\s*(\d+)\s*:\s*(\d+)\s*\]\s*)?([A-Za-z_]\w*)$", piece)
        if not pm:
            die(f"unparsed port declaration {piece!r} in module {top}")
        direction, hi, lo, name = pm.groups()
        if direction:
            cur_dir = direction
            cur_w = (int(hi) - int(lo) + 1) if hi is not None else 1
        elif hi is not None:
            cur_w = int(hi) - int(lo) + 1
        if cur_dir is None:
            die(f"port {name} has no direction in module {top}")
        ports.append((name, cur_dir, cur_w))
    return ports


def pin_count(ports) -> int:
    return sum(w for _, _, w in ports)


def instantiation_sequence(text: str, top: str) -> list[str]:
    """The module names `top` instantiates, in source order.

    Two designs built from the same library with the same sequence of modules
    have the same structure, and -- since every module in this library has a
    fixed latency -- the same latency. Used to check whether designs measured at
    equal cycle counts are in fact structurally equal.
    """
    clean = strip_comments(text)
    m = re.search(rf"^\s*module\s+{re.escape(top)}\b.*?^\s*endmodule",
                  clean, re.M | re.S)
    if not m:
        die(f"could not read the body of module {top}")
    # Not filtered against declared_modules(): the generated designs are a single
    # module and instantiate library modules defined nowhere in their own file.
    return [n for n in re.findall(r"^\s*([A-Za-z_]\w*)\s+[A-Za-z_]\w*\s*\(",
                                  m.group(0), re.M)
            if n not in VERILOG_KW and n != top]


# --------------------------------------------------------------------------
# Vivado reports
# --------------------------------------------------------------------------
def _util_cell(text: str, label: str, col: int = 1):
    m = re.search(rf"^\|\s*{re.escape(label)}\s*\|((?:[^|\n]*\|){{{col}}})", text, re.M)
    if not m:
        return None
    return m.group(1).split("|")[col - 1].strip()


def parse_reports(design_dir: Path) -> dict:
    """Every hardware column of the paper's table, from the three post-route reports."""
    rpts = list(design_dir.glob("*.rpt"))
    util = next((p for p in rpts if "routed_utilization" in p.name), None)
    tim = next((p for p in rpts if "routed_timing_summary" in p.name), None)
    pwr = next((p for p in rpts if "power" in p.name), None)
    if not (util and tim and pwr):
        die(f"{design_dir.name}: missing a routed utilization/timing/power report")

    u = read(util)
    row = {
        "luts": int(_util_cell(u, "CLB LUTs")),
        "luts_as_logic": int(_util_cell(u, "LUT as Logic")),
        "luts_as_mem": int(_util_cell(u, "LUT as Memory")),
        "ffs": int(_util_cell(u, "CLB Registers")),
        "dsps": int(_util_cell(u, "DSPs")),
        "bonded_iob_used": int(_util_cell(u, "Bonded IOB")),
        "iob_available": int(_util_cell(u, "Bonded IOB", col=4)),
        "device": re.search(r"\|\s*Device\s*:\s*(\S+)", u).group(1),
        "tool": re.search(r"Tool Version\s*:\s*(Vivado v\.[\d.]+)", u).group(1),
    }

    t = read(tim)
    per = re.search(r"^clk\s+\{[^}]*\}\s+([\d.]+)\s+([\d.]+)", t, re.M)
    if not per:
        die(f"{design_dir.name}: no clock line in the timing summary")
    row["clock_period_ns"] = float(per.group(1))
    # First data row under the design-wide "WNS(ns)" header.
    wns = re.search(r"WNS\(ns\)[^\n]*\n[^\n]*\n\s*(-?[\d.]+)", t)
    if not wns:
        die(f"{design_dir.name}: no WNS in the timing summary")
    row["wns_ns"] = float(wns.group(1))
    row["fmax_mhz"] = 1000.0 / (row["clock_period_ns"] - row["wns_ns"])

    p = read(pwr)
    row["dynamic_w"] = float(re.search(r"Dynamic \(W\)\s*\|\s*([\d.]+)", p).group(1))
    row["static_w"] = float(re.search(r"Device Static \(W\)\s*\|\s*([\d.]+)", p).group(1))
    # Out-of-context synthesis bonds no I/O: the report shows zero used IOBs.
    row["out_of_context"] = row["bonded_iob_used"] == 0
    row["sources"] = [util, tim, pwr]
    return row


# --------------------------------------------------------------------------
# Designs
# --------------------------------------------------------------------------
def generated_designs() -> list[tuple[str, Path]]:
    """(stem, path) for every design that has a Vivado report directory."""
    out = []
    for d in sorted(REPORTS.iterdir()):
        if not d.is_dir():
            continue
        cands = [p for p in OUT2.iterdir()
                 if p.suffix in (".v", ".sv") and p.stem.lower() == d.name.lower()]
        if len(cands) != 1:
            die(f"report dir {d.name}: expected exactly one design file, found {cands}")
        out.append((cands[0].stem, cands[0]))
    return out


def reference_designs() -> dict[str, Path]:
    return {d.name: next(d.glob("*_ground_truth.sv"))
            for d in sorted(CORPUS.iterdir()) if d.is_dir()}


def derive_mapping(gen: list[tuple[str, Path]]) -> dict[str, str]:
    """generated stem -> corpus circuit name, DERIVED from files.

    Each generated design's prompt carries the canonical text of the circuit it
    was asked to implement (SECTION 5). That text is compared against the canonical
    text of every corpus spec; a unique match is the mapping. ShorFixed has no
    prompt -- it is the hand-corrected reference -- and maps to Shor by definition.
    """
    sys.path.insert(0, str(RAG))
    import canonical_converter as cc

    corpus_canon = {}
    for name in reference_designs():
        spec = CORPUS / name / "spec.py"
        corpus_canon[cc.canonical_text(cc.load_circuit(spec)).strip()] = name

    mapping = {}
    for stem, path in gen:
        if stem == "ShorFixed":
            mapping[stem] = "Shor"
            continue
        prompt = OUT2 / f"{stem.removesuffix('_v2')}_prompt.txt"
        if not prompt.exists():
            continue                        # novel circuit, no reference counterpart
        m = re.search(r"# SECTION 5[^\n]*\n\s*```\n(.*?)```", read(prompt), re.S)
        if not m:
            die(f"{prompt.name}: SECTION 5 block not found")
        hit = corpus_canon.get(m.group(1).strip())
        if hit:
            mapping[stem] = hit
    return mapping


def run_consolidate() -> tuple[int, int]:
    """(scored, passed) exactly as rag/consolidate.py prints them."""
    r = subprocess.run([sys.executable, str(RAG / "rag" / "consolidate.py")],
                       cwd=RAG, capture_output=True, text=True, errors="replace")
    m1 = re.search(r"circuits scored\s*:\s*(\d+)", r.stdout)
    m2 = re.search(r"functional PASS\s*:\s*(\d+)/(\d+)", r.stdout)
    if not (m1 and m2):
        die("could not parse rag/consolidate.py output:\n" + r.stdout[-600:])
    return int(m2.group(2)), int(m2.group(1))


def write_tex(path: Path, lines: list[str]) -> None:
    """Write a LaTeX fragment, refusing one that would not compile.

    A bare '_' in text mode is a LaTeX error, and it is easy to introduce by
    interpolating a circuit or module name into a caption without escaping it.
    Caught here rather than in the paper's build.
    """
    text = "\n".join(lines) + "\n"
    bad = [l for l in text.splitlines() if re.search(r"(?<!\\)_", l)]
    if bad:
        die("unescaped '_' in generated LaTeX -- it would not compile:\n  "
            + "\n  ".join(bad))
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8")


def write_csv(path: Path, rows: list[dict]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as fh:
        w = csv.DictWriter(fh, fieldnames=list(rows[0].keys()))
        w.writeheader()
        w.writerows(rows)
