"""Functionally verify ANY Verilog against its spec. No ground truth, no reference .sv.

    python new_circuits/verify_generated.py <spec.py> <generated.sv> [top_module] [--input 10]

Golden statevector comes from Qiskit via the spec. The support library is assembled
from whatever library modules the generated file actually instantiates. Output is a
testbench + a ready-to-run ModelSim command.

FAMILY-PARAMETERIC (2/3/5 qubits). Everything that used to be hard-coded for the
2-qubit case is derived from the circuit's qubit count:

    qubits  states  width  fixed-point   families
    2       4       16     Q2.14         2qubit-16bit
    3       8        8     Q1.7          qft-3qubit-8bit
    5       32       8     Q1.7          shor-5qubit-8bit

TWO DEFECTS FIXED IN THIS FILE (both would corrupt results silently):
 1. The dependency scan required an uppercase module initial, so the five lowercase
    library modules (tieVec, tieVecLayer, untieVec, untieVecLayer,
    rearrangeTo1stPosition) were omitted: the support file compiled but failed to
    elaborate with vsim-3033. It broke ANY circuit containing a permutation,
    including a fully correct one.
 2. The input basis state was auto-picked only. `--input` now allows an explicit
    choice, which is what makes an H-unsafe circuit salvageable (see rag/hsafe.py):
    some circuits are only evaluable from a different basis state.
"""
import re, sys
from pathlib import Path
sys.path.insert(0, 'rag'); sys.path.insert(0, '.')
import canonical_converter as cc
import numpy as np
from qiskit.quantum_info import Statevector

ROOT = Path("new_circuits"); CE = Path("corpus/code_examples")
for d in ("support", "tb"): (ROOT/d).mkdir(exist_ok=True)

# qubits -> (state count, bit width, 1.0 in fixed point)
GEOM = {2: (4, 16, 1 << 14), 3: (8, 8, 1 << 7), 5: (32, 8, 1 << 7)}


def geometry(nq):
    if nq not in GEOM:
        sys.exit(f"no hardware family for {nq} qubits (have {sorted(GEOM)})")
    n_states, width, one = GEOM[nq]
    sig = [f"QSV_{i}_{j}" for i in range(n_states) for j in (0, 1)]
    out = [f"o{i}_{j}" for i in range(n_states) for j in (0, 1)]
    return n_states, width, one, sig, out


# Ground truths PER FAMILY. `CompatiblePerm`, `tieVec`, `rearrangeTo1stPosition` and
# friends exist in all three with the SAME NAME but different arity (4, 8 and 32
# states). Harvesting them into one namespace lets the 2-qubit version -- first in
# sorted order -- be used for 3- and 5-qubit designs, which then fail elaboration
# with "Port io_in_QSV_4_0 not found". The support library must be built from the
# matching family only.
FAMILY_GT = {
    2: sorted(CE.glob("Circuit*/Circuit*_ground_truth.sv")),
    3: [CE / "QFT" / "QFT_ground_truth.sv"],
    5: [CE / "Shor" / "Shor_ground_truth.sv"],
}
_hdr, _by_nq = None, {}
def _harvest(nq):
    global _hdr
    if nq in _by_nq: return _by_nq[nq]
    mods = {}
    for gt in FAMILY_GT[nq]:
        t = gt.read_text(encoding="utf-8", errors="replace")
        if _hdr is None: _hdr = t[:t.index("module ")]
        for m in re.finditer(r"^module (\w+)\(.*?^endmodule", t, re.S|re.M):
            mods.setdefault(m.group(1), m.group(0))
    _by_nq[nq] = mods
    return mods

# Must allow a lowercase initial: five library modules start lowercase and an
# [A-Z] pattern drops them silently. Keywords are excluded explicitly instead.
KW = {"module","endmodule","input","output","inout","wire","reg","logic",
      "assign","always","always_ff","always_comb","initial","function","task",
      "if","else","for","while","case","begin","end","parameter","localparam",
      "generate","genvar","integer","real","time","automatic","return"}

def support_for(top_text, top_name, nq=2):
    _mods = _harvest(nq)
    need, seen, missing = set(), set(), set()
    inst = lambda b: {n for n in re.findall(r"^\s*([A-Za-z_]\w*)\s+\w+\s*\(", b, re.M)
                      if n not in KW}
    def scan(b):
        for n in inst(b):
            if n in seen or n == top_name: continue
            seen.add(n)
            if n in _mods: need.add(n); scan(_mods[n])
            else: missing.add(n)
    scan(top_text)
    return _hdr + "\n\n".join(_mods[n] for n in sorted(need)) + "\n", need, missing


def _swap_qubits(g, nq, a, b):
    """Reindex a statevector as if qubits a and b were exchanged."""
    out = np.empty_like(g)
    for i in range(len(g)):
        ba, bb = (i >> a) & 1, (i >> b) & 1
        j = i if ba == bb else i ^ ((1 << a) | (1 << b))
        out[i] = g[j]
    return out


def sensitivity(qc, lbl):
    """Which qubit transpositions this input's golden can actually detect.

    A golden invariant under a transposition CANNOT distinguish correct permutation
    wiring from wiring that leaves those two qubits exchanged. The old check tested
    only the state-1/state-2 swap, which is the qubit-0/qubit-1 transposition -- fine
    for 2 qubits, blind for more. It chose an input for the 5-qubit reference that
    could not see a qubit-3/qubit-4 exchange, and a real defect in that reference
    went undetected until the check was widened.
    """
    nq = qc.num_qubits
    g = Statevector.from_label(lbl).evolve(qc).data
    detects = [(a, b) for a in range(nq) for b in range(a + 1, nq)
               if not np.allclose(g, _swap_qubits(g, nq, a, b), atol=1e-9)]
    return g, detects


def covering_inputs(qc, hsafe_only=True):
    """A SET of basis inputs whose goldens jointly detect every qubit transposition.

    No single input need suffice: for the 5-qubit reference the best single input
    detects 6 of 10 transpositions and misses the very one that carries a real
    defect. Greedily cover all of them instead, so a residual permutation cannot
    hide behind an unlucky choice of test vector.
    """
    sys.path.insert(0, "rag")
    from hsafe import first_unsafe_h
    nq = qc.num_qubits
    total = {(a, b) for a in range(nq) for b in range(a + 1, nq)}
    cover = {}
    for i in range(2 ** nq):
        lbl = format(i, f"0{nq}b")
        if hsafe_only and first_unsafe_h(qc, lbl) is not None:
            continue
        _, det = sensitivity(qc, lbl)
        cover[lbl] = set(det)
    if not cover:
        return [], total
    chosen, got = [], set()
    while got != total:
        nxt = max(cover, key=lambda k: len(cover[k] - got))
        if not (cover[nxt] - got):
            break
        chosen.append(nxt)
        got |= cover[nxt]
    if not chosen:                       # everything is permutation-invariant
        chosen = [max(cover, key=lambda k: len(cover[k]))]
    return chosen, total - got


def pick_input(qc, forced=None):
    """Choose the basis input whose golden detects the MOST qubit transpositions."""
    nq = qc.num_qubits
    labels = [format(i, f"0{nq}b") for i in range(2 ** nq)]
    total = nq * (nq - 1) // 2
    if forced:
        if forced not in labels:
            sys.exit(f"--input {forced} is not a {nq}-qubit basis label")
        g, det = sensitivity(qc, forced)
        print(f"  sensitivity: detects {len(det)}/{total} qubit transpositions"
              + ("  *** VACUOUS for permutation wiring ***" if not det else ""))
        return forced, g
    best, best_det, best_g = labels[0], [], None
    for lbl in labels:
        g, det = sensitivity(qc, lbl)
        if best_g is None or len(det) > len(best_det):
            best, best_det, best_g = lbl, det, g
        if len(det) == total:
            break
    print(f"  sensitivity: |{best}> detects {len(best_det)}/{total} qubit transpositions"
          + ("  *** VACUOUS for permutation wiring ***" if not best_det else ""))
    return best, best_g


def main(spec, gen_sv, top=None, forced_input=None, tag=None):
    gen = Path(gen_sv); text = gen.read_text(encoding="utf-8", errors="replace")
    if not top:
        cands = re.findall(r"^module (\w+)\s*\(", text, re.M)
        if not cands: sys.exit("no module found in " + gen_sv)
        top = cands[0]
    # `spec` may carry a .qpy circuit index (`file.qpy#3`), so it is a reference,
    # not a plain path -- name it through the converter.
    tag = tag or cc.ref_name(spec)
    # The tag is interpolated into `module tb_<tag>_gen;`, so anything illegal in a
    # Verilog identifier makes ModelSim fail to elaborate -- which surfaces only as
    # "no transcript produced" and 0/0 checks, i.e. looks like a dead simulator
    # rather than a bad name. Refuse it here, where the cause is still obvious.
    if not re.fullmatch(r"[A-Za-z_]\w*", tag):
        sys.exit(f"tag {tag!r} is not a legal Verilog identifier; it becomes a "
                 f"module name. Use letters, digits and underscores only.")
    qc = cc.load_circuit(spec)
    n_states, width, one, SIG, OUT = geometry(qc.num_qubits)
    hexw = width // 4
    q = lambda x: int(round(x * one)) & ((1 << width) - 1)

    if forced_input:
        labels = [forced_input]
        uncovered = set()
    else:
        labels, uncovered = covering_inputs(qc)
        if not labels:
            sys.exit("no H-safe input exists for this circuit")
    nq = qc.num_qubits
    total = nq * (nq - 1) // 2
    print(f"  test vectors: {len(labels)} input(s) {labels} covering "
          f"{total - len(uncovered)}/{total} qubit transpositions"
          + (f"  UNCOVERED {sorted(uncovered)}" if uncovered else ""))

    # DRIVE THE LARGEST REPRESENTABLE POSITIVE VALUE, NOT `one`.
    # In signed Q1.7 (the 8-bit families) 1.0 is NOT representable: the range is
    # [-1, 1-2^-7], so driving 0x80 drives -1.0. That silently inverted the input,
    # which then hit the H gate's SplitMultiplier sign bug and produced saturated
    # garbage. Q2.14 spans [-2,2) so 0x4000 really is +1.0. Evolution is linear, so
    # the golden is scaled by exactly the amplitude actually driven.
    drive = min(one, (1 << (width - 1)) - 1)
    scale = drive / one
    tests = []
    for lbl in labels:
        gold = Statevector.from_label(lbl).evolve(qc).data
        g = [q(gold[i//2].real * scale) if i % 2 == 0 else q(gold[i//2].imag * scale)
             for i in range(2 * n_states)]
        tests.append((lbl, g))

    sup, mods, missing = support_for(text, top, qc.num_qubits)
    (ROOT/"support"/f"{tag}_gen_support.sv").write_text(sup, encoding="utf-8")
    if missing:
        print(f"  !! generated file instantiates unknown modules: {sorted(missing)}")
        print(f"     (compile will fail -- that is itself a legitimate FAIL result)")

    def stimulus(lbl, g):
        nl = chr(10)
        z = nl.join(f"    in{i}_{j} = 0;" for i in range(n_states) for j in (0, 1))
        chk = nl.join(
            f'    check("|{lbl}> {s2}", {o}, {width}\'h{v:0{hexw}X});'
            for s2, o, v in zip(SIG, OUT, g))
        return f"""    // ---- input |{lbl}> ----
    reset = 1; io_in_valid = 0;
    repeat(4) @(negedge clock);
{z}
    in{int(lbl, 2)}_0 = {width}'h{drive:0{hexw}X};
    reset = 0; io_in_valid = 1;
    @(posedge io_out_valid); repeat(`SETTLE) @(posedge clock); #1;
    $display("  input |{lbl}>:");
{chk}
    @(negedge clock);
"""
    body = "\n".join(stimulus(l, g) for l, g in tests)
    decl_r = ", ".join(f"in{i}_{j}" for i in range(n_states) for j in (0, 1))
    decl_w = ", ".join(OUT)
    conns = ",\n    ".join(
        f".io_in_{s}(in{s[4:]})" for s in SIG)
    oconns = ",\n    ".join(
        f".io_out_{s}({o})" for s, o in zip(SIG, OUT))

    # tolerance scales with the format: +/-16 LSB at Q2.14, +/-1 LSB at Q1.7
    tol = 16 if width == 16 else 1

    tb = f"""// tb_{tag}_gen.v -- functional check of GENERATED verilog vs Qiskit golden.
// Goldens from spec {Path(spec).name}. No ground truth involved.
// {qc.num_qubits} qubits -> {n_states} states, {width}-bit, tolerance +/-{tol} LSB.
`timescale 1ns/1ps
// SETTLE: io_out_valid can assert BEFORE the data settles. Verified on the QFT
// ground truth, which returns all-zeros when sampled one clock after valid and
// the exact golden when given time. Sampling on valid alone silently fails
// correct hardware, so we wait for valid (keeping the timeout meaningful) and
// then settle generously -- simulation is sub-second, so the margin is free.
`define SETTLE 128
module tb_{tag}_gen;
  reg clock=0, reset=1, io_in_valid=0;
  reg  [{width-1}:0] {decl_r};
  wire [{width-1}:0] {decl_w};
  wire io_out_valid; integer errs=0;
  {top} dut(.clock(clock), .reset(reset),
    {conns},
    .io_in_valid(io_in_valid),
    {oconns},
    .io_out_valid(io_out_valid));
  always #5 clock = ~clock;
  function within_tol(input [{width-1}:0] got, input [{width-1}:0] exp);
    reg signed [{width}:0] d;
    begin d = $signed({{got[{width-1}],got}}) - $signed({{exp[{width-1}],exp}});
          within_tol = (d <= {width+1}'sd{tol}) && (d >= -{width+1}'sd{tol}); end
  endfunction
  task check(input [127:0] tag, input [{width-1}:0] got, input [{width-1}:0] exp);
    begin
      if (!within_tol(got,exp)) begin $display("  FAIL %0s: got %h expected %h",tag,got,exp); errs=errs+1; end
      else $display("  ok   %0s = %h",tag,got);
    end
  endtask
  initial begin
    $dumpfile("{tag}_gen.vcd"); $dumpvars(0, tb_{tag}_gen);
    $display("{top} FUNCTIONAL verification, {len(tests)} input vector(s):");
{body}
    if (errs==0) $display("RESULT: PASS  (generated hardware matches Qiskit)");
    else         $display("RESULT: FAIL  (%0d mismatches)", errs);
    $finish;
  end
  initial begin #60000; $display("TIMEOUT: io_out_valid never asserted"); $finish; end
endmodule
"""
    (ROOT/"tb"/f"tb_{tag}_gen.v").write_text(tb, encoding="utf-8")
    print(f"  top module : {top}")
    print(f"  family     : {qc.num_qubits} qubits, {n_states} states, {width}-bit")
    print(f"  drive      : {drive:#0{hexw+2}x} ({scale:.4f} of unit)")
    print(f"  input |{tests[0][0]}>  golden: "
          + " ".join(f"{v:0{hexw}X}" for v in tests[0][1][:8])
          + (" ..." if len(g) > 8 else ""))
    print(f"  support    : {len(mods)} modules -> new_circuits/support/{tag}_gen_support.sv")
    print(f"  testbench  : new_circuits/tb/tb_{tag}_gen.v")

if __name__ == "__main__":
    a = sys.argv[1:]
    forced = None
    if "--input" in a:
        i = a.index("--input"); forced = a[i+1]; a = a[:i] + a[i+2:]
    tag = None
    if "--tag" in a:
        i = a.index("--tag"); tag = a[i+1]; a = a[:i] + a[i+2:]
    main(*a, forced_input=forced, tag=tag)
