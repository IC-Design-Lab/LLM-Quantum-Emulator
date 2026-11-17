"""Per-variant prompt text and circuit-JSON stripping rules.

Rules come from llm-verilog/prompts/README.md:
  FULL          - circuit JSON as-is           + gate_library.json
  MEDIUM        - circuit JSON minus hardware_pipeline/total_pipeline_cycles/
                  operations[].instance_name   + gate_library.json
  MEDIUM_STRICT - same as MEDIUM, plus operations[].perm_required and
                  operations[].reason also removed -- the model must derive
                  where permutations go from gate+target alone, instead of
                  being told directly. Prompt WORDING is identical to MEDIUM
                  (reuses medium.md) -- only the JSON payload differs, so the
                  hint-removal is isolated as the single variable. See the
                  2026-07-13 API_Call_Budget_FINAL.md spec.
  SPARSE        - circuit JSON reduced to {circuit_name, qubits, operations
                  (gate/targets/controls only), verilog_requirements.module_name}
                  -- NO gate_library.json

In addition (not in the README, added because it's an obvious answer leak):
  expected_output and pipeline_cycles_note are stripped from ALL variants --
  both reference the golden/ground-truth values the run is being graded against.
"""
import json
import re
from pathlib import Path

GEN_DIR = Path(__file__).resolve().parent
EXPERIMENT_DIR = GEN_DIR.parent
REPO_ROOT = EXPERIMENT_DIR.parent

PROMPTS_DIR = REPO_ROOT / "prompts"
GATE_LIBRARY_JSON_PATH = REPO_ROOT / "gate_library" / "gate_library.json"
INPUTS_DIR = EXPERIMENT_DIR / "inputs"

VARIANTS = ("full", "medium", "medium_strict", "sparse")

# medium_strict has no prompt file of its own -- it reuses medium.md verbatim,
# since only the JSON payload differs between the two.
_PROMPT_FILE_OVERRIDE = {"medium_strict": "medium"}

_LEAK_KEYS = ("expected_output", "pipeline_cycles_note")


def _strip_leading_comment_block(text: str) -> str:
    """Drop the leading '#'-prefixed note-to-humans header from a prompt .md
    file, keeping only the text meant to actually be sent to the model."""
    lines = text.splitlines()
    i = 0
    while i < len(lines) and (lines[i].strip() == "" or lines[i].lstrip().startswith("#")):
        i += 1
    return "\n".join(lines[i:]).strip()


def load_system_prompt(variant: str) -> str:
    if variant not in VARIANTS:
        raise ValueError(f"unknown variant {variant!r}, expected one of {VARIANTS}")
    file_stem = _PROMPT_FILE_OVERRIDE.get(variant, variant)
    path = PROMPTS_DIR / f"{file_stem}.md"
    raw = path.read_text(encoding="utf-8")
    text = _strip_leading_comment_block(raw)
    if not text or text.upper().startswith("TODO"):
        raise ValueError(f"{path} looks like an unwritten placeholder, refusing to use it")
    return text


def load_circuit_json(circuit: str) -> dict:
    path = INPUTS_DIR / f"{circuit}.json"
    return json.loads(path.read_text(encoding="utf-8"))


def _drop_leak_keys(d: dict) -> dict:
    return {k: v for k, v in d.items() if k not in _LEAK_KEYS}


def build_full_payload(circuit_json: dict) -> str:
    circuit_json = _drop_leak_keys(circuit_json)
    gate_library = json.loads(GATE_LIBRARY_JSON_PATH.read_text(encoding="utf-8"))
    return (
        "Circuit JSON:\n```json\n" + json.dumps(circuit_json, indent=2) + "\n```\n\n"
        "gate_library.json:\n```json\n" + json.dumps(gate_library, indent=2) + "\n```"
    )


def build_medium_payload(circuit_json: dict) -> str:
    circuit_json = _drop_leak_keys(circuit_json)
    circuit_json = dict(circuit_json)
    circuit_json.pop("hardware_pipeline", None)
    circuit_json.pop("total_pipeline_cycles", None)
    circuit_json["operations"] = [
        {k: v for k, v in op.items() if k != "instance_name"}
        for op in circuit_json.get("operations", [])
    ]
    gate_library = json.loads(GATE_LIBRARY_JSON_PATH.read_text(encoding="utf-8"))
    return (
        "Circuit JSON:\n```json\n" + json.dumps(circuit_json, indent=2) + "\n```\n\n"
        "gate_library.json:\n```json\n" + json.dumps(gate_library, indent=2) + "\n```"
    )


def build_medium_strict_payload(circuit_json: dict) -> str:
    circuit_json = _drop_leak_keys(circuit_json)
    circuit_json = dict(circuit_json)
    circuit_json.pop("hardware_pipeline", None)
    circuit_json.pop("total_pipeline_cycles", None)
    circuit_json["operations"] = [
        {k: v for k, v in op.items() if k not in ("instance_name", "perm_required", "reason")}
        for op in circuit_json.get("operations", [])
    ]
    gate_library = json.loads(GATE_LIBRARY_JSON_PATH.read_text(encoding="utf-8"))
    return (
        "Circuit JSON:\n```json\n" + json.dumps(circuit_json, indent=2) + "\n```\n\n"
        "gate_library.json:\n```json\n" + json.dumps(gate_library, indent=2) + "\n```"
    )


def build_sparse_payload(circuit_json: dict) -> str:
    # README: "operations (gate+targets only)". Extended to also keep
    # 'controls' when present -- dropping it would make a controlled gate
    # (e.g. CX) ambiguous about which qubit is the control, which isn't the
    # thing SPARSE is meant to test.
    reduced_ops = []
    for op in circuit_json.get("operations", []):
        reduced = {"gate": op["gate"], "targets": op["targets"]}
        if "controls" in op:
            reduced["controls"] = op["controls"]
        reduced_ops.append(reduced)

    reduced = {
        "circuit_name": circuit_json["circuit_name"],
        "qubits": circuit_json["qubits"],
        "operations": reduced_ops,
        "verilog_requirements": {
            "module_name": circuit_json["verilog_requirements"]["module_name"]
        },
    }
    return "Circuit JSON:\n```json\n" + json.dumps(reduced, indent=2) + "\n```"


_BUILDERS = {
    "full": build_full_payload,
    "medium": build_medium_payload,
    "medium_strict": build_medium_strict_payload,
    "sparse": build_sparse_payload,
}


def build_user_payload(variant: str, circuit: str) -> str:
    if variant not in VARIANTS:
        raise ValueError(f"unknown variant {variant!r}, expected one of {VARIANTS}")
    circuit_json = load_circuit_json(circuit)
    return _BUILDERS[variant](circuit_json)


def extract_verilog(response_text: str) -> str:
    """Pull code out of a ```verilog / ```systemverilog / ``` fenced block if
    present; otherwise return the raw text as-is."""
    m = re.search(r"```(?:verilog|systemverilog|sv)?\s*\n(.*?)```", response_text, re.DOTALL)
    return m.group(1).strip() + "\n" if m else response_text.strip() + "\n"
