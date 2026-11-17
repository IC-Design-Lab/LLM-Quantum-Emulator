"""Per-family gate vocabulary and gate->module mapping. Single source of truth.

Mirrors corpus_v2/gates.md (which is the prompt-facing view of the same facts) and
is validated against the harvested interface catalogs by `python rag/families.py`.

A gate absent from a family is NOT a soft failure. The hardware does not exist, so
the circuit cannot be built; the generator refuses rather than substituting.
"""

from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
IFACE = ROOT / "corpus_v2" / "interfaces"

FAMILY_BY_QUBITS = {2: "2qubit-16bit", 3: "qft-3qubit-8bit", 5: "shor-5qubit-8bit"}

# family -> {canonical gate name: module}
GATE_MODULE = {
    "2qubit-16bit": {
        "h": "HGate2QubitVector16bit",
        "x": "XGate2QubitVector16bit",
        "sx": "SXGate2QubitVector16bit",
        "sxdg": "SXDGate2QubitVector16bit",
        "swap": "SWGate2QubitVector16bit",
        "cx": "CNGate2QubitVector16bit",
    },
    "qft-3qubit-8bit": {
        "h": "HGate3QubitVector8bit",
        "cs": "CSGate3QubitVector8bit",
        "cp": "CTGate3QubitVector8bit",   # cp(pi/4) == controlled-T
        "swap": "SWGate3QubitVector8bit",
    },
    "shor-5qubit-8bit": {
        "h": "HGate5QubitVector8bit",
        "cx": "CNGate5QubitVector8bit",
    },
}

FAMILY_META = {                    # family -> (n_states, bit width, fixed-point)
    "2qubit-16bit": (4, 16, "Q2.14"),
    "qft-3qubit-8bit": (8, 8, "Q1.7"),
    "shor-5qubit-8bit": (32, 8, "Q1.7"),
}

PERM_PREFIX = "CompatiblePerm"


def catalog(family: str) -> dict:
    p = IFACE / f"{family}_catalog.json"
    if not p.exists():
        raise SystemExit(f"missing {p} — run: python rag/build_interfaces.py")
    return json.loads(p.read_text(encoding="utf-8"))


def perm_variants(family: str) -> list[str]:
    """Top-level permutation adapters available in this family, in catalog order."""
    return [m for m in catalog(family)["top_level_instantiable"]
            if m.startswith(PERM_PREFIX)]


# A controlled-phase is only buildable at the two angles that have hardware.
# The angle IS the gate here: `CTGate3QubitVector8bit` is pi/4 and nothing else,
# so cp(pi/8) is not a near miss, it is a different unitary with no module.
# pi/2 is accepted because it is exactly controlled-S, which does have hardware --
# IBM Quantum Composer emits controlled-S as CP(pi/2), so refusing it would reject
# a circuit the library can build.
CP_ANGLE_MODULE = {"pi/4": "cp", "pi/2": "cs"}


def check_legal(family: str, gate_tokens: list[str]) -> list[str]:
    """Return human-readable reasons this circuit cannot be built. Empty == buildable."""
    import re
    known = GATE_MODULE[family]
    problems = []
    for t in gate_tokens:
        name = re.match(r"^([a-z]+)", t).group(1)
        if name not in known:
            have = ", ".join(sorted(known))
            problems.append(
                f"gate `{name}` (in `{t}`) has NO hardware module in family "
                f"{family}. Available gates: {have}.")
            continue
        if name == "cp":
            angle = m.group(1) if (m := re.match(r"^cp\(([^)]*)\)", t)) else ""
            if angle not in CP_ANGLE_MODULE:
                problems.append(
                    f"`{t}`: controlled-phase hardware exists only at pi/4 "
                    f"(CTGate, controlled-T) and pi/2 (CSGate, controlled-S). "
                    f"Angle `{angle}` has no module in family {family}.")
    return problems


def cp_equivalent(token: str) -> str | None:
    """Which gate a cp token is really asking for: 'cp' (pi/4) or 'cs' (pi/2)."""
    import re
    m = re.match(r"^cp\(([^)]*)\)", token)
    return CP_ANGLE_MODULE.get(m.group(1)) if m else None


def _self_test() -> int:
    ok = True
    for family, gm in GATE_MODULE.items():
        legal = set(catalog(family)["top_level_instantiable"])
        missing = {g: m for g, m in gm.items() if m not in legal}
        n_states, width, fmt = FAMILY_META[family]
        print(f"  {family:<18} {len(gm)} gates, {len(perm_variants(family))} perm "
              f"variant(s), {n_states} states x {width}-bit {fmt}")
        if missing:
            ok = False
            print(f"      MISMATCH: modules not in harvested catalog: {missing}")
    print(f"\n  {'all gate->module mappings verified against hardware' if ok else 'FAILURES'}")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(_self_test())
