"""Worked-example retrieval for ARM 3 — structural matching over canonical specs.

WHY NOT EMBEDDING
-----------------
The obvious move is to embed spec_canonical.txt and use cosine. Structural distance
over the canonical gate lists is used instead, for three reasons:

1. The spec files are 18-34 tokens and share an IDENTICAL template — every one opens
   with `qubits: / family: / depth: / gates:`. Cosine over such short, heavily
   templated text is dominated by the shared boilerplate. We already measured this
   failure mode on the gate corpus: 56 prose docs collapsed into a 0.027 similarity
   band. Specs are shorter and MORE templated, so the band would be tighter still.

2. It is deterministic, needs no embedding call, and every score is inspectable by
   hand — which matters when the result is a measurement.

3. What determines the composition is the bracket structure (below), which is a
   discrete function of the gate list. It is directly computable, not approximable.


METRIC v2 — "structural" (DEFAULT)
----------------------------------
v1 ranked by SequenceMatcher over gate-NAME tokens. That metric failed on Circuit0_3:
it ranked Circuit0_17 first (a clean name-subsequence of the query) and the true
structural twin Circuit0_5 only third. Generation from Circuit0_17 was wrong
(8 instantiations, over-bracketed); generation from Circuit0_5 was an exact match.
Gate-name overlap is not the signal that determines composition.

THE SIGNAL THAT DOES — the bracket rule.  Derived by reading the ordered
instantiation sequences of all nine 2qubit-16bit ground-truth circuits:

    A gate is wrapped in a CompatiblePerm bracket IFF it is neither a
    single-qubit gate on q0 nor a swap.
    Consecutive bracket-needing gates share ONE hoisted bracket pair.

  =>  instantiations = n_gates + 2 * n_maximal_bracket_runs

That closed form reproduces all nine 2-qubit circuits exactly:

    Circuit0_06   . .       0 runs   2+0 =  2   actual  2
    Circuit0_17   . B .     1 run    3+2 =  5   actual  5
    Circuit0_2    . B .     1 run    3+2 =  5   actual  5
    Circuit0_3    . B B .   1 run    4+2 =  6   actual  6
    Circuit0_4    . B .     1 run    3+2 =  5   actual  5
    Circuit0_5    . B B .   1 run    4+2 =  6   actual  6
    Circuit1_0167 . B       1 run    2+2 =  4   actual  4
    Circuit1_23   . B .     1 run    3+2 =  5   actual  5
    Circuit1_45   . B .     1 run    3+2 =  5   actual  5

Note two facts that contradict the intuitive "target != q0" rule: cx(q0,1) DOES take
a bracket (hence the Circuit1_* counts of 4/5/5 rather than 2/3/3), and swap does NOT.

PROVENANCE / LEAKAGE DISCLOSURE.  The bracket predicate was inferred by inspecting
ground-truth answers. It is family-level knowledge about the module library — the
same class of fact as the conventions documents already in the corpus — not
per-circuit knowledge, and at query time it is computed from the incoming spec alone
with no ground truth consulted. But the metric is therefore DOMAIN-INFORMED, not
generic structural similarity, and any writeup must say so. It is validated on
family `2qubit-16bit` only; see BRACKET_RULE_VALIDATED_FAMILIES.


PRE-REGISTERED WEIGHTING (fixed before any ranking was computed)
----------------------------------------------------------------
  0.60  bracket-run profile, run-length encoded   W_BRACKET
  0.30  qubit-target sequence                     W_TARGET
  0.10  gate-name sequence                        W_GATE

Rationale, in order:
  * The bracket-run profile is the DIRECT determinant of the output — it predicts the
    instantiation count exactly on 9/9 circuits above. Run length is encoded as a
    first-class atom ("brk2" != "brk1") because run length IS the hoisting behaviour.
  * The qubit-target sequence is the input from which the bracket profile is derived.
    It carries the same information plus finer detail (which qubit, not merely whether
    bracketed), so it is strictly subordinate: half the weight.
  * Gate names determine only WHICH module fills a slot, never the composition. This
    is precisely the signal that caused the v1 failure, so it keeps the residual.

Design constraint stated in advance: a perfect gate-name match must never outrank a
better bracket profile. Max combined gate+target contribution is 0.40 < W_BRACKET.

Weights were not tuned. Set `--metric legacy` to reproduce the v1 ranking exactly.


HARD CONSTRAINTS (unchanged from v1; both enforced before ranking)
------------------------------------------------------------------
* LEAVE-ONE-OUT: any example whose structural_signature equals the query's is removed
  BEFORE ranking. A circuit retrieving its own worked example measures memorisation,
  not generation. The excluded self-match is always reported.
* SAME FAMILY ONLY: a 2-qubit query must never receive a Shor example — different port
  widths, different composition scale. If no same-family example survives leave-one-out,
  NO example is returned and that fact is reported. Never substitute cross-family.
"""

from __future__ import annotations

import re
from difflib import SequenceMatcher
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CODE_EXAMPLES = ROOT / "corpus" / "code_examples"

W_BRACKET = 0.60
W_TARGET = 0.30
W_GATE = 0.10

# The bracket predicate was validated against ground truth for this family only.
# Ranking never runs for the others (both are singletons, so leave-one-out empties
# the candidate pool), but the code must not silently claim coverage it lacks.
BRACKET_RULE_VALIDATED_FAMILIES = {"2qubit-16bit"}

# Gates that never take a permutation bracket regardless of their targets.
BRACKET_EXEMPT_GATES = {"swap"}

DEFAULT_METRIC = "structural"


# --------------------------------------------------------------------------- #
# canonical gate-token parsing
# --------------------------------------------------------------------------- #

_TOK_PARAM = re.compile(r"^([a-z]+)\(([^)]*)\)@q([\d,]+)$")
_TOK_PLAIN = re.compile(r"^([a-z]+)\(q([\d,]+)\)$")


def parse_gate_token(tok: str) -> tuple[str, tuple[int, ...]]:
    """'cx(q0,1)' -> ('cx', (0, 1));  'cp(pi/4)@q2,0' -> ('cp', (2, 0))."""
    m = _TOK_PARAM.match(tok) or _TOK_PLAIN.match(tok)
    if not m:
        raise ValueError(f"unparseable canonical gate token: {tok!r}")
    name = m.group(1)
    qubits = m.group(3) if m.re is _TOK_PARAM else m.group(2)
    return name, tuple(int(x) for x in qubits.split(","))


def needs_bracket(name: str, targets: tuple[int, ...]) -> bool:
    """The bracket rule. See module docstring for derivation and validation scope.

    cx CORRECTION (validated in ModelSim on NC_05): the native
    CNGate2QubitVector16bit implements cx(control=q1, target=q0). Therefore a cx
    is bracketed IFF its target (the LAST qubit in the token) is q1 — bracketing
    a cx(1,0) would wrap the native orientation in a qubit swap and implement the
    OPPOSITE gate, functionally wrong hardware even though it looks structural.
    Every corpus circuit's cx is cx(q0,1) (target q1, bracketed), which is why
    the original bracket-every-cx rule scored 9/9 structurally yet was wrong.
    """
    if name in BRACKET_EXEMPT_GATES:
        return False
    if name == "cx":
        return targets[-1] == 1
    if len(targets) == 1 and targets[0] == 0:
        return False
    return True


def bracket_flags(tokens: list[str]) -> list[str]:
    """Per-gate 'brk' / 'free' in circuit order."""
    out = []
    for t in tokens:
        name, targets = parse_gate_token(t)
        out.append("brk" if needs_bracket(name, targets) else "free")
    return out


def bracket_runs(flags: list[str]) -> list[str]:
    """Run-length encode the flag sequence: ['free1', 'brk2', 'free1'].

    Run length is a first-class atom because run length IS the hoisting behaviour:
    two consecutive bracketed gates share one pair, three share one pair, and so on.
    'brk2' and 'brk1' must therefore be unequal tokens, not near-equal ones.
    """
    runs, i = [], 0
    while i < len(flags):
        j = i
        while j < len(flags) and flags[j] == flags[i]:
            j += 1
        runs.append(f"{flags[i]}{j - i}")
        i = j
    return runs


def n_bracket_runs(flags: list[str]) -> int:
    return sum(1 for r in bracket_runs(flags) if r.startswith("brk"))


def predicted_instantiations(tokens: list[str]) -> int:
    """n_gates + 2 * n_bracket_runs. Exact on all nine 2qubit-16bit circuits."""
    return len(tokens) + 2 * n_bracket_runs(bracket_flags(tokens))


def target_sequence(tokens: list[str]) -> list[str]:
    """Ordered target-qubit sets: ['q0', 'q1', 'q1', 'q0+q1']."""
    out = []
    for t in tokens:
        _, targets = parse_gate_token(t)
        out.append("+".join(f"q{q}" for q in sorted(targets)))
    return out


def gate_names(tokens: list[str]) -> list[str]:
    return [parse_gate_token(t)[0] for t in tokens]


def structural_profile(tokens: list[str]) -> dict:
    flags = bracket_flags(tokens)
    return {
        "tokens": tokens,
        "flags": flags,
        "runs": bracket_runs(flags),
        "n_runs": n_bracket_runs(flags),
        "targets": target_sequence(tokens),
        "names": gate_names(tokens),
        "predicted_inst": len(tokens) + 2 * n_bracket_runs(flags),
    }


def _ratio(a: list[str], b: list[str]) -> float:
    return SequenceMatcher(None, a, b).ratio()


def structural_similarity(qp: dict, cp: dict) -> dict:
    """Weighted three-term similarity. Returns the total and every component."""
    s_bracket = _ratio(qp["runs"], cp["runs"])
    s_target = _ratio(qp["targets"], cp["targets"])
    s_gate = _ratio(qp["names"], cp["names"])
    return {
        "bracket": s_bracket,
        "target": s_target,
        "gate": s_gate,
        "total": W_BRACKET * s_bracket + W_TARGET * s_target + W_GATE * s_gate,
    }


# --------------------------------------------------------------------------- #
# corpus loading
# --------------------------------------------------------------------------- #

def _frontmatter(text: str) -> dict:
    end = text.find("\n---", 4)
    fm = {}
    for line in text[4:end].splitlines():
        m = re.match(r"^([A-Za-z_]+):\s*(.*)$", line)
        if m:
            fm[m.group(1)] = m.group(2).strip().strip('"')
    return fm


def gate_tokens_from_canonical(canonical: str) -> list[str]:
    """The ordered gate list out of a canonical spec block."""
    out, seen_gates = [], False
    for line in canonical.splitlines():
        if line.startswith("gates:"):
            seen_gates = True
            continue
        if seen_gates and line.startswith("  "):
            out.append(line.strip())
    return out


def wiring_payload(wrapper_md: str) -> str:
    """The '## Ground-truth Verilog (wiring section)' fenced block, verbatim."""
    m = re.search(
        r"## Ground-truth Verilog \(wiring section\)\s*\n```verilog\n(.*?)\n```",
        wrapper_md, re.S,
    )
    if not m:
        raise ValueError("wiring payload block not found in wrapper.md")
    return m.group(1)


def load_examples() -> list[dict]:
    out = []
    for d in sorted(CODE_EXAMPLES.iterdir()):
        if not d.is_dir():
            continue
        wrapper = (d / "wrapper.md").read_text(encoding="utf-8")
        fm = _frontmatter(wrapper)
        canonical = (d / "spec_canonical.txt").read_text(encoding="utf-8")
        tokens = gate_tokens_from_canonical(canonical)
        out.append({
            "circuit": fm["circuit"],
            "family": fm["family"],
            "signature": fm["structural_signature"],
            "instantiation_count": int(fm["instantiation_count"]),
            "canonical": canonical,
            "tokens": tokens,
            "profile": structural_profile(tokens),
            "wiring": wiring_payload(wrapper),
            "wiring_lines": len(wiring_payload(wrapper).splitlines()),
        })
    return out


# --------------------------------------------------------------------------- #
# selection
# --------------------------------------------------------------------------- #

def select_example(query_signature: str, query_family: str,
                   query_tokens: list[str], metric: str = DEFAULT_METRIC) -> dict:
    """Rank same-family examples after leave-one-out. Returns a full audit trail.

    Only the SIMILARITY FUNCTION is switchable. Leave-one-out and the same-family
    filter are unconditional and identical for every metric.
    """
    if metric not in ("structural", "legacy"):
        raise ValueError(f"unknown metric {metric!r} (structural | legacy)")

    everything = load_examples()
    qprofile = structural_profile(query_tokens)

    self_match = [e["circuit"] for e in everything
                  if e["signature"] == query_signature]
    same_family = [e for e in everything if e["family"] == query_family]
    # leave-one-out FIRST, then family — order does not matter, both are hard filters
    candidates = [e for e in same_family if e["signature"] != query_signature]

    rows = []
    for e in candidates:
        if metric == "structural":
            comp = structural_similarity(qprofile, e["profile"])
            score = comp["total"]
        else:
            score = SequenceMatcher(None, query_tokens, e["tokens"]).ratio()
            comp = None
        rows.append({
            "circuit": e["circuit"],
            "score": score,
            "components": comp,
            "tokens": e["tokens"],
            "profile": e["profile"],
            "instantiation_count": e["instantiation_count"],
            "wiring_lines": e["wiring_lines"],
            "len_delta": abs(len(e["tokens"]) - len(query_tokens)),
            "_full": e,
        })

    ranked = sorted(rows, key=lambda r: (-r["score"], r["len_delta"], r["circuit"]))

    top = ranked[0] if ranked else None
    tied = [r["circuit"] for r in ranked
            if top and abs(r["score"] - top["score"]) < 1e-9]

    return {
        "metric": metric,
        "query_signature": query_signature,
        "query_family": query_family,
        "query_profile": qprofile,
        "bracket_rule_validated": query_family in BRACKET_RULE_VALIDATED_FAMILIES,
        "excluded_self": self_match,
        "family_pool": [e["circuit"] for e in same_family],
        "candidates_after_loo": [e["circuit"] for e in candidates],
        "ranked": ranked,
        "selected": top,
        "tied_at_top": tied if len(tied) > 1 else [],
        "no_example_available": top is None,
    }


def render_report(sel: dict) -> str:
    qp = sel["query_profile"]
    L = [f"  metric          : {sel['metric']}"
         + ("  (weights 0.60 bracket-run / 0.30 target-seq / 0.10 gate-name)"
            if sel["metric"] == "structural" else
            "  (v1: SequenceMatcher over gate-name tokens)"),
         "  query signature : " + sel["query_signature"],
         "  query family    : " + sel["query_family"],
         "  query targets   : " + " ".join(qp["targets"]),
         "  query brackets  : " + " ".join(qp["flags"])
         + f"   runs={qp['runs']}  n_runs={qp['n_runs']}",
         f"  predicted inst  : {qp['predicted_inst']} "
         f"(= {len(qp['tokens'])} gates + 2 x {qp['n_runs']} bracket runs)",
         f"  same-family pool: {len(sel['family_pool'])}  {sel['family_pool']}"]
    if sel["metric"] == "structural" and not sel["bracket_rule_validated"]:
        L.append("  *** WARNING: the bracket rule is validated on 2qubit-16bit only. "
                 "Scores for this family are UNVALIDATED. ***")
    L.append(f"  LEAVE-ONE-OUT   : excluded self-match {sel['excluded_self']}"
             if sel["excluded_self"] else
             "  LEAVE-ONE-OUT   : no self-match present in corpus (unexpected)")
    L.append(f"  candidates after LOO: {len(sel['candidates_after_loo'])}")
    if sel["no_example_available"]:
        L += ["",
              "  *** NO SAME-FAMILY EXAMPLE AVAILABLE after leave-one-out. ***",
              "  No worked example will be included. Cross-family substitution is",
              "  deliberately NOT performed (wrong port widths / composition scale)."]
        return "\n".join(L)
    L.append("")
    L.append("  ranked candidates:")
    for i, r in enumerate(sel["ranked"], 1):
        mark = " <== SELECTED" if r is sel["selected"] else ""
        p = r["profile"]
        L.append(f"    {i}. {r['score']:.4f}  {r['circuit']:<14} "
                 f"inst={r['instantiation_count']:2d} wiring={r['wiring_lines']:4d}L"
                 f"{mark}")
        if r["components"]:
            c = r["components"]
            L.append(f"         brk={c['bracket']:.3f} tgt={c['target']:.3f} "
                     f"gate={c['gate']:.3f}   runs={p['runs']}  "
                     f"targets={' '.join(p['targets'])}")
        else:
            L.append(f"         {', '.join(r['tokens'])}")
    if sel["tied_at_top"]:
        L.append(f"  NOTE: tie at top score between {sel['tied_at_top']} — broken by "
                 f"(smaller length delta, then name). Reported, not hidden.")
    return "\n".join(L)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

if __name__ == "__main__":
    import argparse
    import sys

    sys.path.insert(0, str(ROOT))
    sys.path.insert(0, str(ROOT / "rag"))

    ap = argparse.ArgumentParser()
    ap.add_argument("spec", nargs="?", default=None)
    ap.add_argument("--metric", default=DEFAULT_METRIC,
                    choices=["structural", "legacy"])
    args = ap.parse_args()

    import canonical_converter as cc
    from generate import DEFAULT_SPEC

    spec = Path(args.spec) if args.spec else DEFAULT_SPEC
    qc = cc.load_circuit(spec)
    canonical = cc.canonical_text(qc)
    sel = select_example(cc.signature(qc), cc.family_of(qc),
                         gate_tokens_from_canonical(canonical), metric=args.metric)
    print(f"WORKED-EXAMPLE RETRIEVAL — spec: {spec.name}\n")
    print(render_report(sel))
    if sel["selected"]:
        e = sel["selected"]["_full"]
        print(f"\n  selected example payload: {e['wiring_lines']} lines of wiring, "
              f"{e['instantiation_count']} instantiations")
