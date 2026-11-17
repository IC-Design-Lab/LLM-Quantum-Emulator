"""Extract what each CompatiblePerm variant ACTUALLY does, by simulation.

WHY NOT READ THE NAME. `CompatiblePerm_4` wraps `SwapPosition4and2atSize32`, which
looks self-documenting. But a schema file in this project already claimed a gate
targeted qubit 1 when the spec said qubit 0, and an entire rule derivation was
corrupted by trusting it. Module names are metadata; the hardware is the fact.

METHOD. The permutation modules only move data — they perform no arithmetic. So
drive a DISTINCT tag into every state index at once (index i gets the value i+1),
simulate, and read the outputs: if output j carries tag i+1 then input index i maps
to output index j. One simulation per variant recovers the entire permutation
exactly, with no reliance on any name.

The recovered index permutation is then reduced to the qubit transposition it
implements, which is what a composition rule needs.

    python rag/permcat.py                 # all families, writes the catalog
    python rag/permcat.py --family shor-5qubit-8bit
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
RAG = ROOT / "rag"
sys.path.insert(0, str(RAG))
sys.path.insert(0, str(ROOT))

import families as fam                     # noqa: E402
from simulate import simulate              # noqa: E402

CE = ROOT / "corpus" / "code_examples"
TB_DIR = ROOT / "new_circuits" / "tb"
CATALOG = ROOT / "corpus_v2" / "permutations.json"

GT = {"2qubit-16bit": CE / "Circuit0_3" / "Circuit0_3_ground_truth.sv",
      "qft-3qubit-8bit": CE / "QFT" / "QFT_ground_truth.sv",
      "shor-5qubit-8bit": CE / "Shor" / "Shor_ground_truth.sv"}


def build_tb(family: str, module: str, n_states: int, width: int) -> tuple[Path, str]:
    """Testbench that tags every input index and reports where each tag lands."""
    tag = f"perm_{module}"
    top = f"tb_{tag}"
    ins = "\n".join(f"  reg [{width-1}:0] i{k};" for k in range(n_states))
    outs = "\n".join(f"  wire [{width-1}:0] o{k};" for k in range(n_states))
    # real part carries the tag; imaginary part is held at zero
    conn_in = ",\n    ".join(
        f".io_in_QSV_{k}_0(i{k}), .io_in_QSV_{k}_1({width}'h0)" for k in range(n_states))
    conn_out = ",\n    ".join(
        f".io_out_QSV_{k}_0(o{k}), .io_out_QSV_{k}_1()" for k in range(n_states))
    drive = "\n".join(f"    i{k} = {width}'d{k + 1};" for k in range(n_states))
    show = "\n".join(
        f'    $display("MAP out=%0d tag=%0d", {k}, o{k});' for k in range(n_states))

    src = f"""// {top}.v -- recover the permutation of {module} by tagging every index.
`timescale 1ns/1ps
module {top};
  reg clock = 0, reset = 1, io_in_valid = 0;
{ins}
{outs}
  wire io_out_valid;
  {module} dut(.clock(clock), .reset(reset),
    {conn_in},
    .io_in_valid(io_in_valid),
    {conn_out},
    .io_out_valid(io_out_valid));
  always #5 clock = ~clock;
  initial begin
    $dumpfile("{top}.vcd"); $dumpvars(0, {top});
{drive}
    repeat(4) @(negedge clock); reset = 0; io_in_valid = 1;
    @(posedge io_out_valid); repeat(64) @(posedge clock); #1;
    $display("PERMUTATION {module}");
{show}
    $display("RESULT: PASS");
    $finish;
  end
  initial begin #60000; $display("TIMEOUT"); $finish; end
endmodule
"""
    p = TB_DIR / f"{top}.v"
    p.write_text(src, encoding="utf-8")
    return p, top


def index_perm_to_qubit_swap(perm: dict[int, int], n_qubits: int):
    """If the index permutation is a transposition of two qubit positions, name it.

    perm maps input index -> output index. Swapping qubits a and b (0-based, with
    qubit 0 the LEAST significant bit, matching Qiskit) permutes basis indices by
    exchanging bits a and b.
    """
    def swap_bits(x, a, b):
        ba, bb = (x >> a) & 1, (x >> b) & 1
        if ba == bb:
            return x
        return x ^ ((1 << a) | (1 << b))

    for a in range(n_qubits):
        for b in range(a + 1, n_qubits):
            if all(perm[i] == swap_bits(i, a, b) for i in perm):
                return (a, b)
    return None


def variants_of(family: str) -> list[str]:
    text = GT[family].read_text(encoding="utf-8", errors="replace")
    return sorted({m for m in re.findall(r"^module (CompatiblePerm\w*)\(", text, re.M)},
                  key=lambda s: (len(s), s))


def run_family(family: str) -> dict:
    n_states, width, _ = fam.FAMILY_META[family]
    n_qubits = n_states.bit_length() - 1
    design = GT[family]
    out = {}
    print(f"\n=== {family} — {n_states} states, {n_qubits} qubits ===")
    for module in variants_of(family):
        tb, top = build_tb(family, module, n_states, width)
        r = simulate(design, tb, top, library="-", label=f"perm_{module}")
        pairs = re.findall(r"MAP out=(\d+) tag=(\d+)", r["log"])
        if not pairs:
            print(f"  {module:<20} NO OUTPUT — {r['category']}")
            out[module] = {"index_permutation": None, "qubit_swap": None,
                           "name_claims": None, "name_matches_hardware": False,
                           "bijective": False, "error": r["category"]}
            continue
        # tag t at output j  =>  input (t-1) maps to output j
        perm = {int(t) - 1: int(j) for j, t in pairs if int(t) > 0}
        complete = len(perm) == n_states and sorted(perm.values()) == list(range(n_states))
        swap = index_perm_to_qubit_swap(perm, n_qubits) if complete else None
        name_claim = re.search(r"SwapPosition(\d+)and(\d+)atSize",
                               GT[family].read_text(encoding="utf-8", errors="replace")
                               [_body_span(GT[family], module)])
        claimed = (int(name_claim.group(2)) - 1, int(name_claim.group(1)) - 1) \
            if name_claim else None
        agree = (swap is not None and claimed is not None
                 and tuple(sorted(swap)) == tuple(sorted(claimed)))
        out[module] = {"index_permutation": perm, "qubit_swap": swap,
                       "name_claims": claimed, "name_matches_hardware": agree,
                       "bijective": complete}
        desc = (f"swaps qubits {swap[0]} and {swap[1]}" if swap
                else "NOT a qubit transposition")
        flag = "" if agree else "   <-- NAME DISAGREES WITH HARDWARE"
        print(f"  {module:<20} {desc:<28} name says {claimed}{flag}")
    return out


def _body_span(path: Path, module: str) -> slice:
    t = path.read_text(encoding="utf-8", errors="replace")
    m = re.search(rf"^module {module}\(.*?^endmodule", t, re.S | re.M)
    return slice(m.start(), m.end()) if m else slice(0, 0)


def main(argv) -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--family", default=None)
    args = ap.parse_args(argv)
    TB_DIR.mkdir(parents=True, exist_ok=True)

    fams = [args.family] if args.family else list(GT)
    catalog = {}
    for f in fams:
        catalog[f] = run_family(f)

    CATALOG.parent.mkdir(parents=True, exist_ok=True)
    prev = json.loads(CATALOG.read_text(encoding="utf-8")) if CATALOG.exists() else {}
    prev.update(catalog)
    CATALOG.write_text(json.dumps(prev, indent=1), encoding="utf-8")

    total = sum(len(v) for v in catalog.values())
    bad = [(f, m) for f, v in catalog.items() for m, d in v.items()
           if not d["name_matches_hardware"]]
    print(f"\n  catalog -> {CATALOG.relative_to(ROOT)}")
    if bad:
        print(f"  *** {len(bad)} variant(s) where the module NAME does not match the "
              f"measured hardware: {bad} ***")
    else:
        print(f"  all {total} variant(s) measured; every name matches its "
              f"hardware permutation")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
