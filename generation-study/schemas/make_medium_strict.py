"""Convert *_MEDIUM.json circuit specs into *_MEDIUM_STRICT.json.

medium_strict removes the per-operation "perm_required" and "reason" hint
fields -- the model must derive where permutations go from the gate/target
qubit itself, instead of being told directly. Nothing else changes: the
general architecture_rules.perm_rule stays (the model still knows the RULE,
just not which specific operations it applies to), and hardware_pipeline /
total_pipeline_cycles stay absent (already removed for medium).

Usage:
    python make_medium_strict.py <input_dir> <output_dir>

Only reads *_MEDIUM.json files in <input_dir>; writes matching
*_MEDIUM_STRICT.json files to <output_dir>. Never modifies the inputs.
"""
import argparse
import json
import sys
from pathlib import Path

STRIPPED_FIELDS = ("perm_required", "reason")


def make_strict(medium: dict) -> tuple[dict, int]:
    strict = dict(medium)
    ops = []
    changed = 0
    for op in medium.get("operations", []):
        new_op = {k: v for k, v in op.items() if k not in STRIPPED_FIELDS}
        if len(new_op) != len(op):
            changed += 1
        ops.append(new_op)
    strict["operations"] = ops
    return strict, changed


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("input_dir", type=Path)
    ap.add_argument("output_dir", type=Path)
    args = ap.parse_args()

    if not args.input_dir.is_dir():
        sys.exit(f"input dir not found: {args.input_dir}")
    args.output_dir.mkdir(parents=True, exist_ok=True)

    inputs = sorted(args.input_dir.glob("*_MEDIUM.json"))
    if not inputs:
        sys.exit(f"no *_MEDIUM.json files found in {args.input_dir}")

    for src in inputs:
        medium = json.loads(src.read_text(encoding="utf-8"))
        strict, changed = make_strict(medium)

        out_name = src.name[: -len("_MEDIUM.json")] + "_MEDIUM_STRICT.json"
        dst = args.output_dir / out_name

        text = json.dumps(strict, indent=2, ensure_ascii=False)
        json.loads(text)  # validate round-trip before writing
        dst.write_text(text + "\n", encoding="utf-8")

        print(f"{src.name} -> {dst.name}: {changed}/{len(medium.get('operations', []))} operations stripped")


if __name__ == "__main__":
    main()
