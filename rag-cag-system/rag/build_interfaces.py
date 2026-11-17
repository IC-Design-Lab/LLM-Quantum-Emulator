"""Generate corpus_v2 interface artifacts from ground-truth .sv files.

Two outputs per family, one purpose each:

  corpus_v2/interfaces/<family>.md            PROMPT-FACING. Compact: only the
                                              modules a top-level circuit actually
                                              instantiates (harvested from the
                                              ground-truth top levels), their one
                                              shared signature, and the adapter rule.
  corpus_v2/interfaces/<family>_catalog.json  LINT-FACING. Every module's complete
                                              port list, so the static validator can
                                              check any instantiation exactly.

WHY: the Arm-2 functional evaluation failed 3/7 circuits with 32 port-not-found
errors each because the manifest supplied NAMES without INTERFACES. NC_06 passed
the moment a permutation interface doc entered context. Interfaces are harvested,
not hand-written, so they cannot drift from the hardware.

    python rag/build_interfaces.py
"""

from __future__ import annotations

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CE = ROOT / "corpus" / "code_examples"
OUT = ROOT / "corpus_v2" / "interfaces"

FAMILY_GT = {
    "2qubit-16bit": sorted(CE.glob("Circuit*/Circuit*_ground_truth.sv")),
    "qft-3qubit-8bit": [CE / "QFT" / "QFT_ground_truth.sv"],
    "shor-5qubit-8bit": [CE / "Shor" / "Shor_ground_truth.sv"],
}

TOP_LEVEL = {"Circuit0_06NOCOMMENTS", "Circuit0_17", "Circuit0_2", "Circuit0_3",
             "Circuit0_4", "Circuit0_5", "Circuit1_0167", "Circuit1_23",
             "Circuit1_45", "QFTcircuit_8bit_NC", "ShorCircuit_8bit_NC"}

FAMILY_META = {
    "2qubit-16bit": (4, 16, "Q2.14 (1.0 = 0x4000)"),
    "qft-3qubit-8bit": (8, 8, "Q1.7 (1.0 = 0x80)"),
    "shor-5qubit-8bit": (32, 8, "Q1.7 (1.0 = 0x80)"),
}

MODULE_RE = re.compile(r"^module (\w+)\((.*?)^\);", re.S | re.M)
INST_RE = re.compile(r"^\s*([A-Za-z_]\w*)\s+\w+\s*\(\s*(?://.*)?$", re.M)
KW = {"module", "endmodule", "input", "output", "wire", "reg", "logic", "assign",
      "always", "always_ff", "always_comb", "initial", "if", "else", "for", "case",
      "begin", "end", "function", "task", "generate", "parameter", "localparam"}


def ports_of(header: str) -> list[list[str]]:
    """[[dir, width, name], ...] in declaration order."""
    header = re.sub(r"//[^\n]*", "", header)
    out, cur_dir, cur_w = [], None, ""
    for line in header.splitlines():
        line = line.strip().rstrip(",")
        if not line:
            continue
        m = re.match(r"^(input|output)\s*(\[\d+:\d+\])?\s*(\w+)$", line)
        if m:
            cur_dir, cur_w = m.group(1), m.group(2) or ""
            out.append([cur_dir, cur_w, m.group(3)])
            continue
        m = re.match(r"^(\[\d+:\d+\])?\s*(\w+)$", line)
        if m and cur_dir:
            if m.group(1):
                cur_w = m.group(1)
            out.append([cur_dir, cur_w, m.group(2)])
    return out


def harvest(files):
    """(all module port lists, names instantiated by top-level circuits)."""
    mods, top_insts = {}, set()
    for f in files:
        text = f.read_text(encoding="utf-8", errors="replace")
        for m in MODULE_RE.finditer(text):
            name = m.group(1)
            if name not in mods:
                mods[name] = ports_of(m.group(2))
            body_start = m.end()
            end = text.find("endmodule", body_start)
            if name in TOP_LEVEL:
                for im in INST_RE.finditer(text[body_start:end]):
                    if im.group(1) not in KW:
                        top_insts.add(im.group(1))
    return mods, top_insts


def fmt_ports(ports) -> str:
    return "\n".join(f"  {d:<6} {w:<7} {n}" for d, w, n in ports)


def render_prompt_doc(family: str, mods: dict, top_insts: set) -> str:
    n_states, width, fmt = FAMILY_META[family]
    insts = sorted(top_insts)
    # Base signature = the most common one. Deviations are documented per module,
    # never averaged away: CIRCT prunes ports it proves unused (e.g. the QFT CS
    # gate lacks io_in_QSV_3_1 / io_in_QSV_7_1), and wiring a pruned port fails
    # elaboration exactly like a misnamed one.
    from collections import Counter
    sig_of = {n: tuple(map(tuple, mods[n])) for n in insts}
    base = Counter(sig_of.values()).most_common(1)[0][0]
    base_names = {p[2] for p in base}
    deviants = {}
    for n in insts:
        if sig_of[n] != base:
            names = {p[2] for p in sig_of[n]}
            deviants[n] = (sorted(base_names - names), sorted(names - base_names))
    sig = list(base)

    perms = [n for n in insts if n.startswith("CompatiblePerm")]
    gates = [n for n in insts if not n.startswith("CompatiblePerm")]

    L = [f"# Module interfaces — family `{family}`",
         "",
         f"State vector: {n_states} basis states x (real, imag), {width}-bit fixed "
         f"point {fmt}.",
         "",
         "## The ONLY modules a top-level circuit instantiates",
         "",
         f"Gates: {', '.join(f'`{g}`' for g in gates)}",
         f"Permutations: {', '.join(f'`{p}`' for p in perms)}",
         "",
         "## Their single shared interface (exact, harvested from verified hardware)",
         "",
         "Every module above uses EXACTLY this port list. Any other port name fails",
         "to elaborate.",
         "",
         "```",
         fmt_ports(sig),
         "```",
         ""]
    if deviants:
        L += ["## EXCEPTIONS — modules whose port list deviates from the base",
              "",
              "The hardware generator prunes ports it proves unused. Connecting a",
              "pruned port fails elaboration exactly like a misnamed one.",
              ""]
        for n, (missing, extra) in sorted(deviants.items()):
            if missing:
                L.append(f"- `{n}` does NOT have: " +
                         ", ".join(f"`{p}`" for p in missing) +
                         " — omit these connections entirely.")
            if extra:
                L.append(f"- `{n}` additionally has: " +
                         ", ".join(f"`{p}`" for p in extra))
        L.append("")
    L += ["## CRITICAL — the permutation adapter rule",
         "",
         "`SwapPosition*` and `rearrangeTo1stPosition*` modules exist in the library",
         "but use a DIFFERENT interface (`io_in_ket_*`/`io_out_ket_*`) and are",
         "internal. NEVER instantiate them in a top-level circuit. `CompatiblePerm`",
         "and its numbered variants are the top-level adapters: standard `io_*_QSV_*`",
         "interface, permutation wrapped inside.",
         ""]
    return "\n".join(L)


def main() -> int:
    OUT.mkdir(parents=True, exist_ok=True)
    for family, files in FAMILY_GT.items():
        mods, top_insts = harvest(files)
        lib = {n: p for n, p in mods.items() if n not in TOP_LEVEL}

        doc = render_prompt_doc(family, mods, top_insts)
        p_md = OUT / f"{family}.md"
        p_md.write_text(doc, encoding="utf-8")

        catalog = {
            "family": family,
            "top_level_instantiable": sorted(top_insts),
            "modules": {n: lib[n] for n in sorted(lib)},
        }
        p_js = OUT / f"{family}_catalog.json"
        p_js.write_text(json.dumps(catalog, indent=1), encoding="utf-8")

        print(f"  {family:<18} prompt-doc {len(doc):>6,} chars "
              f"({len(top_insts)} instantiable) | catalog {len(lib)} modules")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
