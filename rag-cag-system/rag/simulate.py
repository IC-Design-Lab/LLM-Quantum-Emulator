"""Run one design through ModelSim and return a trustworthy verdict.

WHY THIS EXISTS: `run_modelsim.ps1` writes its vsim transcript to the console
stream, so capturing stdout from Python or `Out-String` yields a PARTIAL log. Two
wrapper attempts in this project reported "elaboration error" for runs that had
plainly PASSED. Misreading a verdict is worse than no verdict, so the result is
read from ModelSim's own `modelsim_build/transcript` file, which always contains
the full log, and the wrapper refuses to guess when the marker is absent.

    python rag/simulate.py <design.sv> <tb.v> <tb_top> [--library <lib.sv>|-] [--label L]
"""

from __future__ import annotations

import os
import re
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

# The ModelSim driver is shared with the generation study, so it lives at the
# repository root rather than inside either study. QSIM_DIR overrides that for a
# checkout laid out differently, or for a driver installed elsewhere.
SIM = Path(os.environ.get("QSIM_DIR") or ROOT.parent / "sim").resolve()
DRIVER = SIM / "run_modelsim.ps1"
TRANSCRIPT = SIM / "modelsim_build" / "transcript"
LOCK = SIM / "modelsim_build" / ".sim.lock"


class _Lock:
    """Serialize ModelSim runs across processes.

    ModelSim writes to ONE shared transcript and ONE shared work library. Two
    concurrent runs interleave and each reads the other's verdict -- silently, and
    the results look plausible. Rather than rely on remembering not to overlap,
    make overlap impossible.
    """

    def __init__(self, timeout: int = 1800, stale: int = 1800):
        self.timeout, self.stale = timeout, stale
        self.fd = None

    def __enter__(self):
        LOCK.parent.mkdir(parents=True, exist_ok=True)
        deadline = time.time() + self.timeout
        while True:
            try:
                self.fd = os.open(str(LOCK), os.O_CREAT | os.O_EXCL | os.O_WRONLY)
                os.write(self.fd, str(os.getpid()).encode())
                return self
            except FileExistsError:
                try:                       # reclaim a lock left by a killed process
                    if time.time() - LOCK.stat().st_mtime > self.stale:
                        LOCK.unlink(missing_ok=True)
                        continue
                except OSError:
                    pass
                if time.time() > deadline:
                    raise SystemExit(
                        f"simulate: timed out waiting for the ModelSim lock ({LOCK}). "
                        f"Another simulation is running; delete the file if it is stale.")
                time.sleep(1.0)

    def __exit__(self, *exc):
        if self.fd is not None:
            os.close(self.fd)
        LOCK.unlink(missing_ok=True)
        return False


def simulate(design: Path, tb: Path, tb_top: str, library: str = "-",
             label: str = "run", timeout: int = 900) -> dict:
    # Resolve BEFORE handing over: the driver runs with cwd=SIM, so a caller's
    # relative path silently resolves against the simulator directory instead of
    # the project and the run dies with no transcript.
    design, tb = Path(design).resolve(), Path(tb).resolve()
    for p in (design, tb):
        if not p.exists():
            raise SystemExit(f"simulate: file not found: {p}")

    with _Lock():
        return _run_locked(design, tb, tb_top, library, label, timeout)


def _run_locked(design, tb, tb_top, library, label, timeout) -> dict:
    if TRANSCRIPT.exists():
        TRANSCRIPT.unlink()          # never read a stale verdict
    # -Command with single-quoted arguments, NOT -File with an argument list.
    # Under -File, the literal "-" for a self-contained design is parsed as the
    # start of a parameter name and PowerShell exits with code 2 and no output.
    # Single quotes are literal in PowerShell, so paths containing spaces survive.
    inner = (f"& '{DRIVER}' -Design '{design}' -Library '{library}' "
             f"-TB '{tb}' -Top '{tb_top}' -Label '{label}'")
    cmd = ["powershell", "-NoProfile", "-ExecutionPolicy", "Bypass", "-Command", inner]
    proc = subprocess.run(cmd, cwd=str(SIM), capture_output=True, text=True,
                          errors="replace", timeout=timeout)

    log = TRANSCRIPT.read_text(encoding="utf-8", errors="replace") \
        if TRANSCRIPT.exists() else ""
    # A COMPILE failure aborts before vsim starts, so no transcript is ever written
    # and the only record of the error is the driver's own output. Reading only the
    # transcript scored those runs "UNKNOWN — no transcript produced", which reads as
    # a broken simulator; one was in fact a duplicate wire declaration, a real defect
    # in the generated design. Fall back to the driver output so a compile error is
    # classified as the FAIL it is.
    if not log:
        log = proc.stdout + proc.stderr
    # Count the markers the testbench emits. Multi-vector testbenches prefix each
    # tag with the input label ("ok   |00100> QSV_0_0 = .."), so patterns anchored
    # tightly around "QSV" are fragile.
    mismatches = re.findall(r"FAIL\s+(.+?): got (\S+) expected (\S+)", log)
    n_ok = len(re.findall(r"^#?\s*ok\s+\S", log, re.M))
    n_bad = len(mismatches)
    n3063 = len(re.findall(r"vsim-3063", log))
    n3033 = len(re.findall(r"vsim-3033", log))

    if "RESULT: PASS" in log:
        verdict, cat = "PASS", None
    elif "RESULT: FAIL" in log:
        verdict, cat = "FAIL", "2-wrong-statevector"
    elif "TIMEOUT" in log:
        verdict, cat = "FAIL", "2-timeout-valid-never-asserted"
    elif n3063:
        verdict, cat = "FAIL", f"1-elaboration-{n3063}-port-not-found"
    elif n3033:
        verdict, cat = "FAIL", f"1-elaboration-{n3033}-missing-design-unit"
    elif re.search(r"^Errors: [1-9]", log, re.M):
        verdict, cat = "FAIL", "1-compile-error"
    elif not log:
        verdict, cat = "UNKNOWN", "no transcript produced"
    else:
        verdict, cat = "UNKNOWN", "no RESULT marker in transcript"

    return {"verdict": verdict, "category": cat, "checks_ok": n_ok,
            "checks_failed": n_bad,
            "mismatches": mismatches,
            "log": log}


def main(argv) -> int:
    if len(argv) < 3:
        print(__doc__)
        return 1
    design, tb, top = Path(argv[0]), Path(argv[1]), argv[2]
    library = argv[argv.index("--library") + 1] if "--library" in argv else "-"
    label = argv[argv.index("--label") + 1] if "--label" in argv else "run"
    r = simulate(design, tb, top, library, label)
    print(f"  verdict : {r['verdict']}" + (f"  [{r['category']}]" if r['category'] else ""))
    print(f"  checks  : {r['checks_ok']} ok, {r['checks_failed']} failed")
    for tag, got, exp in r["mismatches"][:6]:
        print(f"      {tag}: got {got} expected {exp}")
    return 0 if r["verdict"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
