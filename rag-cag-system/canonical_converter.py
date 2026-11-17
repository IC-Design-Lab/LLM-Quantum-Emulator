"""Canonical gate-structure converter for the quantum-circuit Verilog RAG corpus.

Loads a circuit VIA QISKIT — not regex — walks circuit.data, strips measure/barrier,
and emits canonical gate-structure text. Two input formats, one code path:

    .py    a spec defining exactly one QuantumCircuit
    .qpy   Qiskit's binary serialisation; a container, so `file.qpy#3` picks one

Whichever it came from, the circuit reaches the rest of the system as the same
object, so structural signatures are comparable across formats.
The SAME converter must run on corpus specs at build time and on incoming queries at
retrieval time, so any change here invalidates stored structural signatures.

Canonical text format:

    qubits: 5
    family: shor-5qubit-8bit
    depth: 5
    gates:
      h(q0)
      cx(q0,1)
      ...

Gate token format:
  - no params:   name(q<i>[,<j>...])          e.g.  h(q0)      cx(q0,1)
  - with params: name(<params>)@q<i>[,<j>...] e.g.  cp(pi/4)@q2,0
Params are rendered symbolically as multiples of pi where possible (pi/4, -pi/2, ...).

signature() returns the stable structural key: "<N>q|" + ";".join(gate tokens) —
the ORDERED, FULL-LENGTH gate sequence with params preserved. Bag-of-gates or prefix
matching would conflate circuits that differ only in a late gate (e.g. the three
h->cx circuits Circuit1_0167 / Circuit1_23 / Circuit1_45).

CLI:
    python canonical_converter.py <spec.py>              -> canonical text on stdout
    python canonical_converter.py <file.qpy#3>           -> same, from a .qpy
    python canonical_converter.py <spec.py> --signature  -> structural signature only
"""

from __future__ import annotations

import math
import sys
from fractions import Fraction
from pathlib import Path

# Must precede any qiskit import: on this machine rustworkx is blocked by an
# Application Control policy and `import qiskit` fails without the stand-in.
# No-op wherever rustworkx is healthy.
sys.path.insert(0, str(Path(__file__).resolve().parent))
import qiskit_compat  # noqa: E402,F401

# Family inference from qubit count — strings must match the gate-library
# frontmatter EXACTLY (short forms like "2q-16bit" are wrong).
FAMILY_BY_QUBITS = {
    2: "2qubit-16bit",
    3: "qft-3qubit-8bit",
    5: "shor-5qubit-8bit",
}

# Complete gate vocabulary of this corpus. Anything else is an error, not a warning:
# a silent pass-through would embed a token the retrieval side has never seen.
GATE_VOCAB = {"cp", "cs", "cx", "h", "swap", "sx", "sxdg", "x"}

SKIP_OPS = {"measure", "barrier"}


def split_ref(spec_ref):
    """Split a spec reference into (path, index).

    A .qpy file is a CONTAINER -- Qiskit writes any number of circuits into one
    file -- so a path alone does not always name a circuit. `file.qpy#3` selects
    the fourth. A `.py` spec holds exactly one circuit and takes no index.
    """
    text = str(spec_ref)
    head, sep, tail = text.rpartition("#")
    if sep and tail.isdigit():
        return Path(head), int(tail)
    return Path(text), None


def unitary_part(qc):
    """The circuit with readout removed: no measure/barrier, no classical bits.

    A `.qpy` exported from Composer or a hardware run ends in measurements, and
    `Statevector.evolve` refuses any instruction touching classical bits. The
    hardware families here have no measurement primitive either -- the top-level
    emits the state vector -- so readout is not part of what gets built, and
    `gate_tokens` has always skipped it.

    A TERMINAL measurement is dropped: it does not change the state that precedes
    it. A MID-CIRCUIT measurement does change it, and is refused rather than
    quietly discarded, which would evaluate a circuit nobody asked for.
    """
    from qiskit import QuantumCircuit

    if not any(i.operation.name in SKIP_OPS for i in qc.data):
        return qc

    ops = [(i.operation, [qc.find_bit(q).index for q in i.qubits]) for i in qc.data]
    measured: set[int] = set()
    for op, qubits in ops:
        if op.name == "measure":
            measured.update(qubits)
        elif op.name != "barrier" and measured.intersection(qubits):
            raise ValueError(
                f"circuit has a MID-CIRCUIT measurement: `{op.name}` acts on qubit(s) "
                f"{sorted(measured.intersection(qubits))} after they were measured. "
                f"Its state is not a pure statevector, so it cannot be evaluated "
                f"against a Statevector golden.")

    out = QuantumCircuit(qc.num_qubits, name=qc.name)
    for op, qubits in ops:
        if op.name not in SKIP_OPS:
            out.append(op, qubits)
    return out


def ref_name(spec_ref) -> str:
    """A stable, filesystem-safe artifact name for a spec reference.

    Corpus specs are all called `spec.py` under a per-circuit directory, so the
    stem alone collides (QFT and Shor both give "spec"); a silent overwrite of
    another circuit's artifacts already cost one sweep on this project. A `.qpy`
    index collides the same way, so it is folded into the name.
    """
    path, index = split_ref(spec_ref)
    base = path.parent.name if path.stem in ("spec", "circuit") else path.stem
    return base if index is None else f"{base}_{index}"


def circuit_count(path) -> int:
    """How many circuits a file holds. 1 for a .py spec."""
    path = Path(path)
    if path.suffix.lower() != ".qpy":
        return 1
    from qiskit import qpy

    with path.open("rb") as fh:
        return len(list(qpy.load(fh)))


def expand_refs(patterns) -> list[str]:
    """Glob patterns -> one reference per CIRCUIT, sorted and de-duplicated.

    A `.qpy` naming several circuits expands to `file.qpy#0 .. #n-1`, so a caller
    that thinks in files still ends up iterating circuits. An explicit `#N` in the
    pattern is honoured as-is.
    """
    import glob as _glob

    refs: list[str] = []
    for pattern in patterns:
        base, index = split_ref(pattern)
        if index is not None:
            refs.append(str(pattern))
            continue
        for hit in sorted(_glob.glob(str(base))):
            path = Path(hit)
            if path.suffix.lower() != ".qpy":
                refs.append(str(path))
                continue
            n = circuit_count(path)
            refs += [str(path)] if n == 1 else [f"{path}#{i}" for i in range(n)]
    # Sort on (path, index) rather than on the string: '#10' sorts before '#2'
    # lexically, which would list a large container out of order.
    unique = list(dict.fromkeys(refs))
    return sorted(unique, key=lambda r: (str(split_ref(r)[0]),
                                         split_ref(r)[1] if split_ref(r)[1]
                                         is not None else -1))


def load_circuit(spec_path, index=None):
    """Return the QuantumCircuit described by a `.py` spec or a `.qpy` file.

    Both formats reach the same object, so everything downstream -- structural
    signature, retrieval, lint, the Qiskit golden -- is identical either way.

    A `.qpy` holding several circuits requires an index, given as `file.qpy#N` or
    as the `index` argument. Ambiguity is an error rather than a silent choice of
    the first circuit: these files are written in batches and circuit 0 is not a
    meaningful default.
    """
    from qiskit import QuantumCircuit  # deferred so --help works without qiskit

    spec_path, ref_index = split_ref(spec_path)
    index = ref_index if index is None else index
    if not spec_path.exists():
        raise FileNotFoundError(spec_path)

    if spec_path.suffix.lower() == ".qpy":
        from qiskit import qpy

        with spec_path.open("rb") as fh:
            circuits = list(qpy.load(fh))
        if not circuits:
            raise ValueError(f"{spec_path}: contains no circuits")
        if index is None:
            if len(circuits) != 1:
                raise ValueError(
                    f"{spec_path}: holds {len(circuits)} circuits; select one as "
                    f"'{spec_path.name}#N', N = 0..{len(circuits) - 1}")
            index = 0
        if not 0 <= index < len(circuits):
            raise IndexError(f"{spec_path}: index {index} out of range, file holds "
                             f"{len(circuits)} circuit(s)")
        return unitary_part(circuits[index])

    if index is not None:
        raise ValueError(f"{spec_path}: a .py spec holds one circuit; the '#N' "
                         f"index applies to .qpy files only")
    ns: dict = {}
    exec(compile(spec_path.read_text(encoding="utf-8"), str(spec_path), "exec"), ns)
    qcs = [v for v in ns.values() if isinstance(v, QuantumCircuit)]
    if len(qcs) != 1:
        raise ValueError(
            f"{spec_path}: expected exactly one QuantumCircuit, found {len(qcs)}"
        )
    return unitary_part(qcs[0])


def _fmt_param(p) -> str:
    """Render a gate parameter, preferring exact multiples of pi (pi/4, -pi/2...)."""
    try:
        x = float(p)
    except (TypeError, ValueError):
        return str(p)
    if x == 0:
        return "0"
    frac = Fraction(x / math.pi).limit_denominator(64)
    if frac != 0 and abs(x - math.pi * float(frac)) < 1e-9:
        num, den = frac.numerator, frac.denominator
        sign = "-" if num < 0 else ""
        num = abs(num)
        core = "pi" if num == 1 else f"{num}pi"
        return f"{sign}{core}" + ("" if den == 1 else f"/{den}")
    return repr(x)


def _normalize(name: str, params) -> tuple[str, list]:
    """Fold a gate onto the canonical name for the unitary it actually is.

    `cp(pi/2)` is EXACTLY controlled-S (both verified equal as operators), and it
    is what you get from IBM Quantum Composer, whose controlled-S exports as
    `PhaseGate(pi/2).control(1)` -- a `cp`, not a `cs`. Left alone it would key
    retrieval on a token the corpus has never seen and, worse, be shown to the
    model as a `cp`, whose only module is the pi/4 CTGate: the wrong unitary,
    silently. `cp(pi/4)` stays `cp` because that IS the corpus spelling for
    controlled-T.
    """
    if name == "cp" and params and abs(float(params[0]) - math.pi / 2) < 1e-9:
        return "cs", []
    return name, list(params)


def gate_tokens(qc) -> list[str]:
    """Ordered, full-length gate token list; measure/barrier stripped."""
    tokens = []
    for inst in qc.data:
        op = inst.operation
        if op.name in SKIP_OPS:
            continue
        if op.name not in GATE_VOCAB:
            raise ValueError(
                f"gate '{op.name}' is outside the corpus vocabulary {sorted(GATE_VOCAB)}"
            )
        name, params = _normalize(op.name, op.params)
        qubits = ",".join(str(qc.find_bit(q).index) for q in inst.qubits)
        if params:
            rendered = ",".join(_fmt_param(p) for p in params)
            tokens.append(f"{name}({rendered})@q{qubits}")
        else:
            tokens.append(f"{name}(q{qubits})")
    return tokens


def family_of(qc) -> str:
    try:
        return FAMILY_BY_QUBITS[qc.num_qubits]
    except KeyError:
        raise ValueError(
            f"no family defined for {qc.num_qubits} qubits "
            f"(known: {sorted(FAMILY_BY_QUBITS)})"
        ) from None


def canonical_text(qc) -> str:
    lines = [
        f"qubits: {qc.num_qubits}",
        f"family: {family_of(qc)}",
        f"depth: {qc.depth()}",
        "gates:",
    ]
    lines += [f"  {t}" for t in gate_tokens(qc)]
    return "\n".join(lines) + "\n"


def signature(qc) -> str:
    """Stable structural key: ordered full-length sequence, params preserved."""
    return f"{qc.num_qubits}q|" + ";".join(gate_tokens(qc))


def main(argv: list[str]) -> int:
    if not argv or argv[0] in ("-h", "--help"):
        print(__doc__)
        return 0
    qc = load_circuit(argv[0])
    if "--signature" in argv[1:]:
        print(signature(qc))
    else:
        sys.stdout.write(canonical_text(qc))
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
