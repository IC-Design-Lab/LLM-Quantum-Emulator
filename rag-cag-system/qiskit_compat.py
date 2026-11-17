"""Make Qiskit importable when `rustworkx` is blocked, and prove it still computes.

WHY THIS EXISTS
---------------
On this machine `rustworkx.pyd` fails to load:

    ImportError: DLL load failed while importing rustworkx:
    An Application Control policy has blocked this file.

The block is specific, not general. Measured on the same interpreter:

    numpy's compiled extensions   load
    qiskit/_accelerate.pyd        loads      <- Qiskit's own Rust core is fine
    rustworkx/rustworkx.pyd       BLOCKED

So Qiskit is not broken; one transitive dependency is unreachable. Qiskit imports
rustworkx at package-init time for the transpiler's DAG, and that import failing
takes down `import qiskit` entirely -- including QuantumCircuit, Statevector and
qpy, none of which use graphs at all.

WHAT IT DOES
------------
If rustworkx imports normally this module is a NO-OP: on a healthy machine nothing
here changes behaviour. If and only if the Application Control error is raised, it
registers a permissive stand-in module so that `import qiskit` completes.

WHAT IS AND IS NOT SAFE
-----------------------
The stand-in satisfies attribute access and construction, which is all Qiskit needs
during import (it builds StandardEquivalenceLibrary on a PyDiGraph at import time).
It CANNOT do graph work. Therefore:

    SAFE     QuantumCircuit construction, circuit.data walks, depth(), find_bit()
             Statevector.evolve  (dense linear algebra in numpy)
             qpy.load / qpy.dump (pure-Python serialisation)
    NOT SAFE transpile(), DAGCircuit, PassManager, anything routing or layout

This project uses only the first group -- it never transpiles; the hardware family
IS the target, and composition is decided by the rulebook, not by a pass manager.

The guarantee is not "trust the shim". selftest() re-computes every statevector with
an INDEPENDENT numpy simulator written here from the gate definitions, and compares.
Nothing depends on this module being right; it is checked.

    python qiskit_compat.py            # self-test
"""

from __future__ import annotations

import sys
import types

SHIMMED = False
_BLOCKED_MARKER = "Application Control policy"


class _PermissiveMeta(type):
    """Attribute access yields another permissive class, at any depth.

    Qiskit reads `rx.ColoringStrategy.Saturation` at import time and subclasses
    rustworkx types elsewhere, so the stand-in has to be a CLASS (subclassable)
    whose attributes are themselves classes, without bound.
    """

    def __getattr__(cls, name):
        if name.startswith("__"):
            raise AttributeError(name)
        return _PermissiveMeta(f"{cls.__name__}.{name}", (), {})


class _Permissive(metaclass=_PermissiveMeta):
    """Instances absorb any call: PyDiGraph().add_node(x) must not explode, because
    Qiskit populates an equivalence graph during import."""

    def __init__(self, *a, **kw):
        pass

    def __getattr__(self, name):
        if name.startswith("__"):
            raise AttributeError(name)
        return _Permissive()

    def __call__(self, *a, **kw):
        return _Permissive()

    def __iter__(self):
        return iter(())

    def __len__(self):
        return 0


def _stub(name: str) -> types.ModuleType:
    mod = types.ModuleType(name)

    def _getattr(attr, _n=name):
        if attr.startswith("__"):
            raise AttributeError(attr)
        return _PermissiveMeta(f"{_n}.{attr}", (_Permissive,), {})

    mod.__getattr__ = _getattr
    mod.__path__ = []
    return mod


def install() -> bool:
    """Install the stand-in only if rustworkx is genuinely blocked. Idempotent."""
    global SHIMMED
    if SHIMMED or "rustworkx" in sys.modules:
        return SHIMMED
    try:
        import rustworkx  # noqa: F401
        return False                      # healthy machine: change nothing
    except ImportError as e:
        if _BLOCKED_MARKER not in str(e) and "DLL load failed" not in str(e):
            raise                         # a different problem -- do not mask it
    for name in ("rustworkx", "rustworkx.visualization", "rustworkx.generators"):
        sys.modules[name] = _stub(name)
    SHIMMED = True
    return True


def status() -> str:
    return ("rustworkx is blocked by Application Control; stand-in installed "
            "(transpiler unavailable, simulation unaffected)"
            if SHIMMED else "rustworkx imports normally, no shim needed")


# ---------------------------------------------------------------------------
# Independent reference simulator -- the check ON the shim, not part of the
# pipeline. Written from the gate definitions so that agreeing with Qiskit is
# real evidence rather than the same code run twice.
# ---------------------------------------------------------------------------

def _ref_statevector(tokens, n_qubits, label):
    """Evolve |label> through (name, params, qubits) tokens.

    Qiskit conventions: qubit 0 is the LEAST significant bit, and a from_label
    string is written most-significant qubit first.
    """
    import cmath

    import numpy as np

    dim = 1 << n_qubits
    state = np.zeros(dim, dtype=complex)
    state[int(label, 2)] = 1.0

    r2 = 1 / np.sqrt(2)
    ONE_Q = {
        "h":    np.array([[r2, r2], [r2, -r2]], dtype=complex),
        "x":    np.array([[0, 1], [1, 0]], dtype=complex),
        "sx":   0.5 * np.array([[1 + 1j, 1 - 1j], [1 - 1j, 1 + 1j]], dtype=complex),
        "sxdg": 0.5 * np.array([[1 - 1j, 1 + 1j], [1 + 1j, 1 - 1j]], dtype=complex),
    }

    for name, params, qubits in tokens:
        if name in ("measure", "barrier"):
            continue
        if name in ONE_Q:
            u, q = ONE_Q[name], qubits[0]
            new = np.zeros(dim, dtype=complex)
            for i in range(dim):
                b = (i >> q) & 1
                new[i] = (u[b, 0] * state[i & ~(1 << q)]
                          + u[b, 1] * state[i | (1 << q)])
            state = new
        elif name == "swap":
            a, b = qubits
            new = np.zeros(dim, dtype=complex)
            for i in range(dim):
                ba, bb = (i >> a) & 1, (i >> b) & 1
                new[i] = state[i if ba == bb else i ^ ((1 << a) | (1 << b))]
            state = new
        elif name == "cx":
            c, t = qubits
            new = np.zeros(dim, dtype=complex)
            for i in range(dim):
                new[i] = state[i ^ (1 << t)] if (i >> c) & 1 else state[i]
            state = new
        elif name in ("cs", "cp"):
            a, b = qubits
            theta = cmath.pi / 2 if name == "cs" else float(params[0])
            phase = cmath.exp(1j * theta)
            state = np.array([state[i] * (phase if ((i >> a) & 1) and ((i >> b) & 1)
                                          else 1.0) for i in range(dim)])
        else:
            raise ValueError(f"reference simulator has no definition for '{name}'")
    return state


def selftest(specs=None) -> int:
    """Cross-check Qiskit-under-shim against the independent simulator."""
    import glob
    from pathlib import Path

    import numpy as np

    install()
    print(f"qiskit_compat: {status()}")

    from qiskit import QuantumCircuit
    from qiskit.quantum_info import Statevector

    import canonical_converter as cc

    qc = QuantumCircuit(2)
    qc.h(0)
    qc.cx(0, 1)
    bell = Statevector.from_label("00").evolve(qc).data
    assert np.allclose(bell, [2 ** -0.5, 0, 0, 2 ** -0.5]), bell
    print("  bell state                                  OK")

    root = Path(__file__).resolve().parent
    specs = specs or sorted(glob.glob(str(root / "new_circuits" / "specs" / "*.py")))
    checked = bad = 0
    for s in specs:
        circ = cc.load_circuit(s)
        tokens = [(i.operation.name, i.operation.params,
                   [circ.find_bit(q).index for q in i.qubits]) for i in circ.data]
        for lbl in (format(i, f"0{circ.num_qubits}b")
                    for i in range(1 << circ.num_qubits)):
            got = Statevector.from_label(lbl).evolve(circ).data
            exp = _ref_statevector(tokens, circ.num_qubits, lbl)
            checked += 1
            if not np.allclose(got, exp, atol=1e-9):
                bad += 1
                print(f"  MISMATCH {Path(s).name} from |{lbl}>")
    print(f"  {checked} statevectors over {len(specs)} specs cross-checked against "
          f"an independent simulator")
    print(f"  {checked - bad} agree, {bad} differ")
    return 1 if bad else 0


install()

if __name__ == "__main__":
    raise SystemExit(selftest())
