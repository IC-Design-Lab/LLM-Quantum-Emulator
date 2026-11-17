"""Mechanical error_type auto-tagging for matched-arms grid runs. Only tags
patterns that are unambiguous from the log text / generated file structure --
anything not clearly identifiable is left blank for manual review, per the
"leave genuinely ambiguous ones blank" rule.

Tags:
  hallucinated_module        - compile/elaborate error naming an undefined module
  wire_width_mismatch        - a QSV-carrying wire declared without a [N:0] range
  port_name_mismatch         - "Port 'X' not found" style connection error
  multiple_driver_wire_reuse - ModelSim "multiply driven" warning/error
  missing_perm                - circuit's ground-truth perm_hints says a perm is
                                required somewhere, but the generated file has
                                zero CompatiblePerm instantiations at all
  functional_wrong_amplitudes - simulation ran to completion, golden-state
                                mismatch (not a timeout, not a compile failure)
  incomplete_generation_elided_ports - the model wrote a "/*...*/"-style elision
                                comment in place of real port connections or
                                module body, instead of complete Verilog
  implicit_net_declaration    - a port/net declared without an explicit type
                                keyword (vlog-2892 "Net type ... not explicitly
                                declared"), or a malformed compound token like
                                "output_logic" that a tool misreads as an
                                interface reference (vsim-3695) -- same root
                                class (invalid/incomplete port declaration
                                syntax), different exact surface symptom
  unstable_valid_protocol     - compiles and elaborates cleanly (0 errors, 0
                                warnings) but io_out_valid never asserts within
                                the simulation timeout -- restored from the
                                project's earlier (pre-matched-arms) taxonomy
  infrastructure_error        - reserved for failures that do NOT reproduce
                                when the exact same generated file is recompiled
                                and resimulated fresh -- i.e. a tooling/
                                environment hiccup, not a defect in the
                                generated code. Never auto-applied here; only
                                assigned after a manual reproduce-or-not check,
                                so it can't silently inflate model-failure counts.
  assumed_multifile_structure - the generated file `include`s an external file
                                that was never provided (single-file compile
                                only), or the compiler reports it can't open one
  packed_unpacked_type_error  - a packed/unpacked array type mismatch at
                                compile time (vlog-13215-style error)
  wrong_decomposition          - the count of real (non-perm) gate-module
                                mentions in the generated file doesn't match
                                the number of non-perm operations in the
                                circuit's own json spec -- a rough, deliberately
                                conservative proxy (whole-word substring count,
                                not a full parse), since this doesn't attempt to
                                distinguish direct instantiation from macro-based
                                generation
  instruction_not_followed    - a Slot-3 requirement was directly violated:
                                wrong top-level module name, an `initial` block,
                                a hardcoded `#N` delay, or a $display/$monitor
                                statement in the DUT itself
"""
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import assemble

_HALLUCINATED_PATTERNS = (
    "design unit was not found",
    "Instantiation of",
    "Cannot open",
)
_PORT_MISMATCH_PATTERNS = (
    "Port '",  # covers both vsim-3389 "not found in the connected module" and vsim-3063
)
_MULTI_DRIVER_PATTERNS = (
    "multiply driven",
)
_IMPLICIT_NET_PATTERNS = (
    "Net type of",  # vlog-2892: "Net type of 'X' was not explicitly declared"
    "must be passed an actual interface",  # vsim-3695: malformed compound port token
)
_MULTIFILE_PATTERNS = (
    "Cannot open",
    "`include",
)
_PACKED_UNPACKED_PATTERNS = (
    "unpacked type",
    "packed type",
)

# Real (non-perm) gate wrapper modules per circuit family, for the
# wrong_decomposition proxy check.
_REAL_GATE_MODULES = {
    "qft": ("HGate3QubitVector8bit", "CSGate3QubitVector8bit", "CTGate3QubitVector8bit", "SWGate3QubitVector8bit"),
    "shor": ("HGate5QubitVector8bit", "CNGate5QubitVector8bit"),
    "2qubit": ("HGate2QubitVector16bit", "XGate2QubitVector16bit", "SWGate2QubitVector16bit",
               "CNGate2QubitVector16bit", "SXGate2QubitVector16bit", "SXDGate2QubitVector16bit"),
}

_QSV_WIRE_DECL = re.compile(
    r"^\s*wire\s+((?:\w*(?:QSV|qsv)\w*\s*,?\s*)+);", re.MULTILINE
)
_HAS_WIDTH = re.compile(r"\[\s*\d+\s*:\s*\d+\s*\]")


def _has_any(text: str, patterns) -> bool:
    return any(p in text for p in patterns)


def _tag_wire_width_mismatch(verilog_text: str) -> bool:
    """A 'wire' declaration line naming QSV signals with no [N:0] range at all
    on that line is a real-width-mismatch candidate. Deliberately narrow: only
    fires on lines that mention QSV and have zero bit-range anywhere on the
    line, to avoid false positives on legitimately-1-bit valid/control wires."""
    for line in verilog_text.splitlines():
        if re.match(r"^\s*wire\s", line) and re.search(r"QSV", line, re.IGNORECASE):
            if not _HAS_WIDTH.search(line):
                return True
    return False


def _tag_missing_perm(circuit: str, verilog_text: str) -> bool:
    perm_hints_path = assemble.PERM_HINTS_DIR / f"{circuit}_perm_hints.json"
    if not perm_hints_path.exists():
        return False
    hints = json.loads(perm_hints_path.read_text(encoding="utf-8"))
    needs_perm = any(op.get("perm_required") for op in hints.get("perm_hints", []))
    if not needs_perm:
        return False
    has_perm_instance = bool(re.search(r"\bCompatiblePerm\w*\s+\w+\s*\(", verilog_text))
    return not has_perm_instance


def _tag_wrong_decomposition(circuit: str, verilog_text: str) -> bool:
    """Whole-word count of real-gate-module mentions vs the number of
    operations in the circuit's own json spec. Deliberately conservative --
    a substring count, not a parse -- so this only fires on a clear mismatch,
    not an off-by-macro-expansion-style ambiguity."""
    family = assemble._family(circuit)
    modules = _REAL_GATE_MODULES.get(family)
    if not modules:
        return False
    json_spec_path = assemble.JSON_SPECS / f"{circuit}.json"
    if not json_spec_path.exists():
        return False
    spec = json.loads(json_spec_path.read_text(encoding="utf-8"))
    expected = len(spec.get("operations", []))
    if expected == 0:
        return False
    actual = sum(len(re.findall(r"\b" + re.escape(m) + r"\b", verilog_text)) for m in modules)
    return actual != expected


def _tag_instruction_not_followed(circuit: str, verilog_text: str) -> bool:
    if re.search(r"\binitial\s+begin\b", verilog_text):
        return True
    if re.search(r"#\d+\s*;", verilog_text) or re.search(r"#\d+\s+\w", verilog_text):
        return True
    if re.search(r"\$display|\$monitor", verilog_text):
        return True
    m = re.search(r"\bmodule\s+(\w+)\s*[\(#;]", verilog_text)
    if m and m.group(1) != circuit:
        return True
    return False


def auto_tag(circuit: str, generated_file: Path, log_file: Path,
             pass_fail: str, failure_stage: str, notes: str) -> list[str]:
    """Returns a sorted list of error_type tags. Empty list if nothing
    mechanically identifiable (leave blank for manual review) or if the run
    passed."""
    if pass_fail == "PASS":
        return []

    tags = set()
    log_text = log_file.read_text(encoding="utf-8", errors="replace") if log_file.exists() else ""
    verilog_text = generated_file.read_text(encoding="utf-8", errors="replace") if generated_file.exists() else ""

    if failure_stage == "compile":
        if _has_any(log_text, _HALLUCINATED_PATTERNS):
            tags.add("hallucinated_module")
        if _has_any(log_text, _PORT_MISMATCH_PATTERNS):
            tags.add("port_name_mismatch")
        if _has_any(log_text, _IMPLICIT_NET_PATTERNS):
            tags.add("implicit_net_declaration")
        if _has_any(log_text, _MULTIFILE_PATTERNS) or "`include" in verilog_text:
            tags.add("assumed_multifile_structure")
        if _has_any(log_text, _PACKED_UNPACKED_PATTERNS):
            tags.add("packed_unpacked_type_error")

    if _has_any(log_text, _MULTI_DRIVER_PATTERNS):
        tags.add("multiple_driver_wire_reuse")

    if failure_stage == "simulation" and "TIMEOUT" in log_text and "Errors: 0, Warnings: 0" in log_text:
        tags.add("unstable_valid_protocol")

    if verilog_text and _tag_wire_width_mismatch(verilog_text):
        tags.add("wire_width_mismatch")

    if verilog_text and _tag_missing_perm(circuit, verilog_text):
        tags.add("missing_perm")

    if failure_stage == "simulation" and re.search(r"\d+ mismatch", notes):
        tags.add("functional_wrong_amplitudes")

    if verilog_text and re.search(r"/\*\s*\.\.\.", verilog_text):
        tags.add("incomplete_generation_elided_ports")

    if verilog_text and _tag_wrong_decomposition(circuit, verilog_text):
        tags.add("wrong_decomposition")

    if verilog_text and _tag_instruction_not_followed(circuit, verilog_text):
        tags.add("instruction_not_followed")

    return sorted(tags)
