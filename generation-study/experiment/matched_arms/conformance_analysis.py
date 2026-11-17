"""Read-only library-conformance classifier. Does NOT modify results_matched.csv
or any generated .v file -- writes a standalone conformance_map.csv instead.

For every row in results_matched.csv with a surviving generated file, classifies:
  A) LIBRARY USE  -- which real wrapper modules are instantiated, and how many times
  B) BEHAVIORAL LOGIC -- always blocks / arithmetic / fixed-point constants /
     saturation logic present in the file

conformance_class:
  conformant   - library modules present, no behavioral logic
  from-scratch - no library modules, behavioral logic present
  hybrid       - both present
  neither      - neither present (likely malformed/empty/non-functional stub)

Usage:
    python conformance_analysis.py
"""
import csv
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent
OUTPUTS_DIR = ROOT / "outputs"
RESULTS_CSV = ROOT / "results" / "results_matched.csv"
OUT_CSV = ROOT / "results" / "conformance_map.csv"

REAL_MODULES = [
    "HGate2QubitVector16bit", "XGate2QubitVector16bit", "YGate2QubitVector16bit",
    "ZGate2QubitVector16bit", "TGate2QubitVector16bit", "SXGate2QubitVector16bit",
    "SXDGate2QubitVector16bit", "CNGate2QubitVector16bit", "SWGate2QubitVector16bit",
    "HGate3QubitVector8bit", "CSGate3QubitVector8bit", "CTGate3QubitVector8bit",
    "SWGate3QubitVector8bit", "HGate5QubitVector8bit", "CNGate5QubitVector8bit",
]
# CompatiblePerm and CompatiblePerm_N handled separately (variant suffix)

_FIXED_POINT_CONSTANTS = re.compile(
    r"16'[hH](2D41|4000|1FFF|D2BF|E001|E95F|E960)|8'[hH](5B|2D|7F|00)\b", re.IGNORECASE
)
_ARITH_SHIFT = re.compile(r">>>|<<<")
_ALWAYS_BLOCK = re.compile(r"\balways(_ff|_comb|_latch)?\s*@")
_SATURATE = re.compile(r"saturat", re.IGNORECASE)
_ARITH_OP_IN_ASSIGN = re.compile(
    r"(?:assign\s+[^;]*?=[^;]*?[\w\]]\s*[\*\+\-]\s*[\w\$])", re.MULTILINE
)
_MODULE_DEF = re.compile(r"^\s*module\s+(\w+)", re.MULTILINE)
_INSTANTIATION = re.compile(r"\b([A-Za-z_]\w*)\s+(\w+)\s*\(", re.MULTILINE)
# Macro INVOCATION only, e.g. `GATE_INST(HGate3QubitVector8bit, m, 0) -- must
# explicitly exclude preprocessor directives (`define, `ifdef, etc.), whose
# "arguments" are parameter names being declared, not modules being referenced.
_PREPROCESSOR_DIRECTIVES = {
    "define", "ifdef", "ifndef", "else", "elsif", "endif", "undef",
    "include", "timescale", "default_nettype", "resetall", "celldefine",
    "endcelldefine", "unconnected_drive", "nounconnected_drive",
}
_MACRO_CALL_LINE = re.compile(r"`(\w+)\(\s*([A-Za-z_]\w*)\s*,")
# Real wrapper modules are always CamelCase and contain "Gate" or "Perm"
# (HGate2QubitVector16bit, CompatiblePerm_9, ...). Many models also generate
# their OWN helper macros for wire declaration / port connection (e.g.
# `DECLARE_STAGE_WIRES(_m_io_out_QSV, _m_io_out_valid)) whose arguments are
# wire-name prefixes, not module names -- restricting to this naming shape
# is what keeps those out of the module-candidate set.
_LOOKS_LIKE_MODULE_NAME = re.compile(r"^[A-Z]\w*(Gate|Perm)\w*$")


def _macro_invocations(text: str) -> list[str]:
    return [
        module for directive, module in _MACRO_CALL_LINE.findall(text)
        if directive.lower() not in _PREPROCESSOR_DIRECTIVES
        and _LOOKS_LIKE_MODULE_NAME.match(module)
    ]

_VERILOG_KEYWORDS = {
    "if", "else", "for", "while", "case", "begin", "end", "function", "task",
    "module", "endmodule", "input", "output", "inout", "wire", "reg", "logic",
    "assign", "always", "initial", "parameter", "localparam", "generate",
    "endgenerate", "genvar", "return", "signed", "unsigned", "automatic",
    "posedge", "negedge", "integer", "endfunction", "endtask", "endcase",
    "void", "typedef", "struct", "packed", "unique", "priority", "default",
}

_LINE_COMMENT = re.compile(r"//.*")
_BLOCK_COMMENT = re.compile(r"/\*.*?\*/", re.DOTALL)


def _strip_comments(text: str) -> str:
    """Removes // and /* */ comments before any instantiation/behavioral regex
    runs -- natural-language text in comments (e.g. "// Stage 10: Swap Gate
    (q0, q2)") otherwise reads as a fake module instantiation."""
    text = _BLOCK_COMMENT.sub(" ", text)
    text = _LINE_COMMENT.sub("", text)
    return text


def _library_usage(text: str) -> dict:
    """Whole-word occurrence count per real module name, anywhere in the
    (comment-stripped) file. Deliberately NOT tied to a specific instantiation
    or macro-argument-position syntax -- models use direct instantiation,
    macros with the module name as the 1st arg, macros with it as the 2nd arg
    (e.g. `CONNECT_STAGE(instance, ModuleName, ...)), or other conventions
    entirely. A whole-word presence count is less precise about exact
    instance counts but is robust to all of those, which position-based
    parsing was not."""
    usage = {}
    for mod in REAL_MODULES:
        n = len(re.findall(r"\b" + re.escape(mod) + r"\b", text))
        if n:
            usage[mod] = n
    for name in set(re.findall(r"\b(CompatiblePerm\w*)\b", text)):
        usage[name] = len(re.findall(r"\b" + re.escape(name) + r"\b", text))
    return usage


def _behavioral_markers(text: str) -> list[str]:
    markers = []
    if _ALWAYS_BLOCK.search(text):
        markers.append("always_block")
    if _ARITH_SHIFT.search(text):
        markers.append("arithmetic_shift")
    if _FIXED_POINT_CONSTANTS.search(text):
        markers.append("fixed_point_constant")
    if _SATURATE.search(text):
        markers.append("saturation_logic")
    if _ARITH_OP_IN_ASSIGN.search(text):
        markers.append("arithmetic_in_assign")
    return markers


def _unknown_modules(text: str) -> list[str]:
    locally_defined = set(_MODULE_DEF.findall(text))
    known = set(REAL_MODULES)
    candidates = set()
    for name, _inst in _INSTANTIATION.findall(text):
        candidates.add(name)
    for name in _macro_invocations(text):
        candidates.add(name)
    unknown = []
    for name in candidates:
        if name in _VERILOG_KEYWORDS or name.lower() in _PREPROCESSOR_DIRECTIVES:
            continue
        if name in known or name.startswith("CompatiblePerm"):
            continue
        if name in locally_defined:
            continue
        unknown.append(name)
    return sorted(set(unknown))


def classify(text: str):
    usage = _library_usage(text)
    markers = _behavioral_markers(text)
    has_lib = bool(usage)
    has_behavior = bool(markers)
    if has_lib and not has_behavior:
        cls = "conformant"
    elif has_behavior and not has_lib:
        cls = "from-scratch"
    elif has_lib and has_behavior:
        cls = "hybrid"
    else:
        cls = "neither"
    return cls, usage, markers


def main():
    with open(RESULTS_CSV, newline="", encoding="utf-8") as f:
        rows = list(csv.DictReader(f))

    out_rows = []
    missing = 0
    for r in rows:
        gen = OUTPUTS_DIR / f"{r['run_id']}.v"
        if not gen.exists():
            missing += 1
            continue
        text = _strip_comments(gen.read_text(encoding="utf-8", errors="replace"))
        cls, usage, markers = classify(text)
        unknown = _unknown_modules(text)
        out_rows.append({
            "run_id": r["run_id"],
            "circuit": r["circuit"],
            "prompt_level": r["prompt_level"],
            "input_format": r["input_format"],
            "model": r["model"],
            "pass_fail": r["pass_fail"],
            "conformance_class": cls,
            "library_modules_used": ";".join(f"{m}:{n}" for m, n in sorted(usage.items())),
            "behavioral_markers_found": ";".join(markers),
            "unknown_modules_instantiated": ";".join(unknown),
        })

    with open(OUT_CSV, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=list(out_rows[0].keys()), quoting=csv.QUOTE_ALL)
        w.writeheader()
        w.writerows(out_rows)

    print(f"classified {len(out_rows)} files, skipped {missing} rows with no surviving file")
    print(f"wrote {OUT_CSV}")


if __name__ == "__main__":
    main()
