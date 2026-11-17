"""Survey the circuits inside .qpy containers: what is testable, and what is new.

A .qpy written by a batch job holds many circuits, most of them repeats. Feeding
the whole file to the evaluator would bill the same structure over and over and
report an inflated circuit count, so this answers first:

  LEGAL      every gate has a hardware module in the family for that qubit count
  EVALUABLE  some basis input is both discriminating and H-safe (see hsafe.py)
  DISTINCT   how many structurally different circuits are actually in there
  NEW        signature absent from the specs already evaluated, and -- the sharper
             question -- BRACKET PROFILE absent too. A repeat signature adds no
             information; a repeat profile adds very little.

Nothing here generates or bills. It reads files and reports.

    python rag/qpy_survey.py "<glob>"
    python rag/qpy_survey.py "<glob>" --new-only      # just the refs worth running
    python rag/qpy_survey.py "<glob>" --equivalence   # .qpy vs .py, same circuit
"""

from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "rag"))
sys.path.insert(0, str(ROOT))

import canonical_converter as cc          # noqa: E402
import families as fam                    # noqa: E402
from example_retrieval import bracket_flags, bracket_runs   # noqa: E402
from hsafe import screen                  # noqa: E402

SPECS = ROOT / "new_circuits" / "specs"
CORPUS = ROOT / "corpus" / "code_examples"


def known() -> tuple[set[str], set[str]]:
    """(signatures, bracket profiles) of every circuit this project has already run.

    BOTH sources, or novelty is overstated: the eval specs in new_circuits/specs
    AND the nine corpus circuits, which live one directory each under
    corpus/code_examples and are the examples the retriever draws from.
    """
    sigs, profs = set(), set()
    for spec in sorted(SPECS.glob("*.py")) + sorted(CORPUS.glob("*/spec.py")):
        try:
            qc = cc.load_circuit(spec)
        except Exception:                                      # noqa: BLE001
            continue
        tokens = cc.gate_tokens(qc)
        sigs.add(cc.signature(qc))
        if qc.num_qubits == 2:
            profs.add(str(bracket_runs(bracket_flags(tokens))))
    return sigs, profs


def spec_index() -> dict[str, Path]:
    """signature -> the .py spec that carries it."""
    out = {}
    for spec in sorted(SPECS.glob("*.py")) + sorted(CORPUS.glob("*/spec.py")):
        try:
            out.setdefault(cc.signature(cc.load_circuit(spec)), spec)
        except Exception:                                      # noqa: BLE001
            continue
    return out


def equivalence(rows) -> int:
    """Prove the format is transparent: a circuit read from .qpy must reach the
    system exactly as the same circuit read from .py.

    Compared for every qpy circuit whose structure also exists as a spec:
    canonical text (what the model is shown), signature (what retrieval keys on),
    and the example the retriever then selects. Anything less than identical means
    .qpy circuits are being scored on a different basis than .py ones, and the two
    sets could not be reported together.
    """
    from example_retrieval import select_example

    index = spec_index()
    pairs = [(r, index[r["signature"]]) for r in rows
             if r.get("status") == "OK" and "dup_of" not in r
             and r.get("signature") in index]
    if not pairs:
        print("\n  no qpy circuit matches an existing spec — nothing to compare")
        return 0

    print("\n" + "=" * 100)
    print(f"FORMAT EQUIVALENCE — {len(pairs)} circuit(s) present in both formats")
    print("=" * 100)
    print(f"  {'qpy circuit':<16} {'matching spec':<22} {'canonical':<10} "
          f"{'signature':<10} retrieved example")
    bad = 0
    for row, spec in pairs:
        a, b = cc.load_circuit(row["ref"]), cc.load_circuit(spec)
        same_text = cc.canonical_text(a) == cc.canonical_text(b)
        same_sig = cc.signature(a) == cc.signature(b)
        fam_a = fam.FAMILY_BY_QUBITS[a.num_qubits]
        pick = [select_example(cc.signature(c), fam_a,
                              cc.gate_tokens(c))["selected"]["circuit"]
                for c in (a, b)]
        ok = same_text and same_sig and pick[0] == pick[1]
        bad += not ok
        print(f"  {row['name']:<16} {cc.ref_name(spec):<22} "
              f"{'same' if same_text else 'DIFFER':<10} "
              f"{'same' if same_sig else 'DIFFER':<10} "
              f"{pick[0]}" + ("" if pick[0] == pick[1] else f" != {pick[1]}"))
    print(f"\n  {len(pairs) - bad}/{len(pairs)} identical across formats"
          + ("" if not bad else f"   {bad} DIVERGED"))
    return 1 if bad else 0


def inspect(ref: str) -> dict:
    row = {"ref": ref, "name": cc.ref_name(ref)}
    try:
        qc = cc.load_circuit(ref)
    except Exception as e:                                     # noqa: BLE001
        return row | {"status": "UNREADABLE", "detail": f"{type(e).__name__}: {e}"[:70]}

    tokens = cc.gate_tokens(qc)
    row |= {"qubits": qc.num_qubits, "gates": tokens,
            "signature": cc.signature(qc)}

    family = fam.FAMILY_BY_QUBITS.get(qc.num_qubits)
    if family is None:
        return row | {"status": "NO FAMILY",
                      "detail": f"{qc.num_qubits} qubits has no hardware"}
    row["family"] = family
    problems = fam.check_legal(family, tokens)
    if problems:
        return row | {"status": "ILLEGAL", "detail": problems[0][:70]}

    row["profile"] = str(bracket_runs(bracket_flags(tokens))) if qc.num_qubits == 2 \
        else "-"
    hs = screen(ref)
    row["input"] = hs["default_input"] if hs["safe"] else hs["salvage_input"]
    if not row["input"]:
        return row | {"status": "H-UNSAFE",
                      "detail": "no discriminating H-safe basis input"}
    return row | {"status": "OK", "detail": ""}


def main(argv) -> int:
    patterns = [a for a in argv if not a.startswith("--")]
    new_only = "--new-only" in argv
    if not patterns:
        print(__doc__)
        return 1

    refs = cc.expand_refs(patterns)
    if not refs:
        print("no files matched")
        return 1
    known_sigs, known_profs = known()

    rows = [inspect(r) for r in refs]
    seen_sig: dict[str, str] = {}
    for r in rows:
        sig = r.get("signature")
        if sig is None:
            continue
        if sig in seen_sig:
            r["dup_of"] = seen_sig[sig]
        else:
            seen_sig[sig] = r["name"]
        r["new_sig"] = sig not in known_sigs
        # Bracket profiles model the 2-qubit family only; elsewhere the field is
        # "-", which must not be read as "a profile nobody has seen before".
        prof = r.get("profile", "-")
        r["new_prof"] = prof != "-" and prof not in known_profs

    print("=" * 100)
    print(f"QPY SURVEY — {len(refs)} circuits in "
          f"{len({cc.split_ref(r)[0] for r in refs})} file(s)")
    print("=" * 100)
    print(f"  {'circuit':<16} {'q':>2} {'status':<10} {'profile':<26} "
          f"{'novelty':<12} gates")
    for r in rows:
        if new_only and not (r["status"] == "OK" and r.get("new_sig")
                             and "dup_of" not in r):
            continue
        if r["status"] != "OK":
            novelty = "-"
        elif "dup_of" in r:
            novelty = f"= {r['dup_of']}"[:12]
        elif r["new_prof"]:
            novelty = "NEW PROFILE"
        elif r["new_sig"]:
            novelty = "new circuit"
        else:
            novelty = "already run"
        print(f"  {r['name']:<16} {r.get('qubits','?'):>2} {r['status']:<10} "
              f"{r.get('profile','-'):<26} {novelty:<12} "
              f"{' '.join(r.get('gates', []))[:30] or r.get('detail','')}")

    ok = [r for r in rows if r["status"] == "OK"]
    uniq = [r for r in ok if "dup_of" not in r]
    new_sig = [r for r in uniq if r["new_sig"]]
    new_prof = [r for r in uniq if r["new_prof"]]
    print("\n" + "-" * 100)
    print(f"  circuits read              : {len(rows)}")
    for status in ("UNREADABLE", "NO FAMILY", "ILLEGAL", "H-UNSAFE"):
        n = [r for r in rows if r["status"] == status]
        if n:
            print(f"  {status.lower():<26} : {len(n)}   e.g. {n[0]['detail'][:56]}")
    print(f"  evaluable                  : {len(ok)}")
    print(f"  distinct structures        : {len(uniq)}  "
          f"({len(ok) - len(uniq)} repeats of one another)")
    print(f"  not already in the spec set: {len(new_sig)}")
    print(f"  bracket profile never seen : {len(new_prof)}"
          + (f"   {sorted({r['profile'] for r in new_prof})}" if new_prof else ""))
    if new_sig:
        print("\n  worth evaluating:")
        for r in new_sig:
            print(f"    {r['ref']}")
    if "--equivalence" in argv:
        return equivalence(rows)
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
