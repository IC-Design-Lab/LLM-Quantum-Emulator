"""Spec -> reference .sv + support lib + testbench. Usage: build_nc.py <spec.py> <input_label>"""
import re, sys
from pathlib import Path
sys.path.insert(0, 'rag'); sys.path.insert(0, '.')
import canonical_converter as cc, reference_composer as rc, example_retrieval as er
import numpy as np
from qiskit import QuantumCircuit
from qiskit.quantum_info import Statevector

ROOT = Path("new_circuits"); CE = Path("corpus/code_examples")
for d in ("reference","support","tb"): (ROOT/d).mkdir(exist_ok=True)

MUL = {'HGate2QubitVector16bit','SXGate2QubitVector16bit','SXDGate2QubitVector16bit'}
def step(sv, mod):
    q = QuantumCircuit(2)
    {'HGate2QubitVector16bit':lambda:q.h(0),'XGate2QubitVector16bit':lambda:q.x(0),
     'SXGate2QubitVector16bit':lambda:q.sx(0),'SXDGate2QubitVector16bit':lambda:q.sxdg(0),
     'SWGate2QubitVector16bit':lambda:q.swap(0,1),'CompatiblePerm':lambda:q.swap(0,1),
     'CNGate2QubitVector16bit':lambda:q.cx(1,0)}[mod]()
    return sv.evolve(q)
q214 = lambda x: int(round(x*(1<<14))) & 0xFFFF

_hdr, _mods = None, {}
def _harvest():
    global _hdr
    for gt in sorted(CE.glob("Circuit*/Circuit*_ground_truth.sv")):
        t = gt.read_text(encoding="utf-8", errors="replace")
        if _hdr is None: _hdr = t[:t.index("module ")]
        for m in re.finditer(r"^module (\w+)\(.*?^endmodule", t, re.S|re.M):
            _mods.setdefault(m.group(1), m.group(0))
def support_for(top_text):
    if not _mods: _harvest()
    need, seen = set(), set()
    def scan(b):
        for n in _mods:
            if n in seen: continue
            if re.search(rf"^\s*{n}\s+\w+\s*\(", b, re.M):
                seen.add(n); need.add(n); scan(_mods[n])
    scan(top_text)
    return _hdr + "\n\n".join(_mods[n] for n in sorted(need)) + "\n", need

SIG = ["QSV_0_0","QSV_0_1","QSV_1_0","QSV_1_1","QSV_2_0","QSV_2_1","QSV_3_0","QSV_3_1"]
OUT = ["o0_0","o0_1","o1_0","o1_1","o2_0","o2_1","o3_0","o3_1"]
INREG = {'00':'in0_0','01':'in1_0','10':'in2_0','11':'in3_0'}

def build(spec_path, label):
    nc = Path(spec_path).stem
    qc = cc.load_circuit(Path(spec_path)); toks = cc.gate_tokens(qc)
    seq = rc.module_sequence(toks)
    gold = Statevector.from_label(label).evolve(qc).data
    sv = Statevector.from_label(label); fires = False
    for m in seq:
        if m in MUL and any(c.real<-1e-9 or c.imag<-1e-9 for c in sv.data): fires = True
        sv = step(sv, m)
    model_ok = np.allclose(sv.data, gold, atol=1e-9)
    perm = gold.copy(); perm[1],perm[2] = gold[2],gold[1]
    disc = not np.allclose(gold, perm, atol=1e-9)

    (ROOT/"reference"/f"{nc}.sv").write_text(rc.compose(toks, nc), encoding="utf-8")
    sup, mods = support_for(rc.compose(toks, nc))
    (ROOT/"support"/f"{nc}_support.sv").write_text(sup, encoding="utf-8")

    g = [q214(gold[i//2].real) if i%2==0 else q214(gold[i//2].imag) for i in range(8)]
    checks = "\n".join(f'    check("{s}", {o}, 16\'h{v:04X});' for s,o,v in zip(SIG,OUT,g))
    tb = f"""// tb_{nc}.v -- gate-level check vs Qiskit golden. input |{label}>. tol +/-16 LSB.
`timescale 1ns/1ps
module tb_{nc};
  reg clock=0, reset=1, io_in_valid=0;
  reg  [15:0] in0_0,in0_1,in1_0,in1_1,in2_0,in2_1,in3_0,in3_1;
  wire [15:0] o0_0,o0_1,o1_0,o1_1,o2_0,o2_1,o3_0,o3_1;
  wire io_out_valid; integer errs=0;
  {nc} dut(.clock(clock), .reset(reset),
    .io_in_QSV_0_0(in0_0), .io_in_QSV_0_1(in0_1), .io_in_QSV_1_0(in1_0), .io_in_QSV_1_1(in1_1),
    .io_in_QSV_2_0(in2_0), .io_in_QSV_2_1(in2_1), .io_in_QSV_3_0(in3_0), .io_in_QSV_3_1(in3_1),
    .io_in_valid(io_in_valid),
    .io_out_QSV_0_0(o0_0), .io_out_QSV_0_1(o0_1), .io_out_QSV_1_0(o1_0), .io_out_QSV_1_1(o1_1),
    .io_out_QSV_2_0(o2_0), .io_out_QSV_2_1(o2_1), .io_out_QSV_3_0(o3_0), .io_out_QSV_3_1(o3_1),
    .io_out_valid(io_out_valid));
  always #5 clock = ~clock;
  function within_tol(input [15:0] got, input [15:0] exp);
    reg signed [16:0] d;
    begin d = $signed({{got[15],got}}) - $signed({{exp[15],exp}});
          within_tol = (d <= 17'sd16) && (d >= -17'sd16); end
  endfunction
  task check(input [127:0] tag, input [15:0] got, input [15:0] exp);
    begin
      if (!within_tol(got,exp)) begin $display("  FAIL %0s: got %h expected %h", tag,got,exp); errs=errs+1; end
      else $display("  ok   %0s = %h (expected %h)", tag,got,exp);
    end
  endtask
  initial begin
    $dumpfile("{nc}.vcd"); $dumpvars(0, tb_{nc});
    in0_0=0; in0_1=0; in1_0=0; in1_1=0; in2_0=0; in2_1=0; in3_0=0; in3_1=0;
    {INREG[label]}=16'h4000;
    repeat(4) @(negedge clock); reset=0; io_in_valid=1;
    @(posedge io_out_valid); @(posedge clock); #1;
    $display("{nc} verification (input |{label}>):");
{checks}
    if (errs==0) $display("RESULT: PASS  ({nc} matches Qiskit golden)");
    else         $display("RESULT: FAIL  (%0d mismatches)", errs);
    $finish;
  end
  initial begin #6000; $display("TIMEOUT: io_out_valid never asserted"); $finish; end
endmodule
"""
    (ROOT/"tb"/f"tb_{nc}.v").write_text(tb, encoding="utf-8")
    short = " ".join(m.replace('Gate2QubitVector16bit','').replace('CompatiblePerm','P').replace('SWGate2QubitVector16bit','SW') for m in seq)
    print(f"{nc}: {' '.join(toks)}")
    print(f"  predicted : {short}  ({len(seq)} inst) | runs={er.bracket_runs(er.bracket_flags(toks))}")
    print(f"  input |{label}>  discriminating={disc}  bug-fires={fires}  model={'CORRECT' if model_ok else 'MISMATCH'}")
    print(f"  golden    : " + " ".join(f"{v:04X}" for v in g))
    print(f"  support   : {len(mods)} modules")

if __name__ == "__main__":
    build(sys.argv[1], sys.argv[2])
