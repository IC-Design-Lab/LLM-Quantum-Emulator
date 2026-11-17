"""Run ONE matched-arms cell end-to-end: assemble -> generate (isolated call)
-> save -> compile+simulate via log_run_matched.ps1 -> CSV row -> auto-tag.

Usage:
    python run_cell.py Circuit_01 python sparse gemini-3.5-flash
"""
import csv
import json
import re
import subprocess
import sys
import urllib.request
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import assemble
import auto_tag
import generate_matched as gm

ROOT = Path(__file__).resolve().parent
SCRATCH_DIR = ROOT / "outputs" / "_scratch"
RESULTS_CSV = ROOT / "results" / "results_matched.csv"
LOGS_DIR = ROOT / "results" / "logs"
OUTPUTS_DIR = ROOT / "outputs"
WEBHOOK_FILE = ROOT.parent / "sheets_webhook_url.txt"


def _apply_auto_tags(run_id: str):
    """Reads the just-written CSV row for run_id, computes mechanical
    error_type tags, and if any are found, updates both the CSV row and the
    mirrored Sheets row (via the existing update webhook action)."""
    if not RESULTS_CSV.exists():
        return
    with open(RESULTS_CSV, newline="", encoding="utf-8") as f:
        rows = list(csv.DictReader(f))
    row = next((r for r in rows if r["run_id"] == run_id), None)
    if row is None:
        return

    ext = ".v"
    generated_file = OUTPUTS_DIR / f"{run_id}{ext}"
    log_file = LOGS_DIR / f"{run_id}.log"
    tags = auto_tag.auto_tag(
        row["circuit"], generated_file, log_file,
        row["pass_fail"], row["failure_stage"], row["notes"],
    )
    if not tags:
        return

    tag_str = ";".join(tags)
    print(f"-- auto-tagged {run_id}: {tag_str}")

    # rewrite CSV row in place
    with open(RESULTS_CSV, newline="", encoding="utf-8") as f:
        reader = csv.reader(f)
        header = next(reader)
        all_rows = list(reader)
    idx = header.index("error_types")
    id_idx = header.index("run_id")
    for r in all_rows:
        if r[id_idx] == run_id:
            r[idx] = tag_str
            break
    with open(RESULTS_CSV, "w", newline="", encoding="utf-8") as f:
        w = csv.writer(f, quoting=csv.QUOTE_ALL)
        w.writerow(header)
        w.writerows(all_rows)

    # mirror to Sheets via the existing update action
    if WEBHOOK_FILE.exists():
        webhook_url = WEBHOOK_FILE.read_text(encoding="utf-8").strip()
        if webhook_url:
            body = json.dumps({"action": "update", "run_id": run_id, "error_types": tag_str}).encode("utf-8")
            req = urllib.request.Request(webhook_url, data=body, headers={"Content-Type": "application/json"})
            try:
                urllib.request.urlopen(req, timeout=15)
            except Exception as e:
                print(f"-- sheets tag sync failed (CSV still updated): {e}")


def run_one(circuit: str, input_format: str, level: str, model: str = gm.DEFAULT_MODEL):
    print(f"== assembling payload: {circuit}/{input_format}/{level} ==")
    system_instruction, contents, attachment_names = assemble.build_payload(circuit, input_format, level)
    print(f"-- attachments sent: {attachment_names or '(none -- sparse)'}")

    print(f"== calling {model} (isolated) ==")
    verilog, attachment_names = gm.generate_verilog_matched(circuit, input_format, level, model=model)
    print(f"-- received {len(verilog)} chars of Verilog")

    SCRATCH_DIR.mkdir(parents=True, exist_ok=True)
    scratch_file = SCRATCH_DIR / f"{circuit}_{input_format}_{level}_{model}.v"
    scratch_file.write_text(verilog, encoding="utf-8")

    attachments_str = ";".join(attachment_names)
    print("== compiling + simulating (log_run_matched.ps1) ==")
    ps_cmd = [
        "powershell", "-NoProfile", "-Command",
        f"& '{ROOT / 'log_run_matched.ps1'}' "
        f"-Circuit {circuit} -InputFormat {input_format} -PromptLevel {level} "
        f"-Model {model} -GeneratedFile '{scratch_file}' -Attachments '{attachments_str}'"
    ]
    result = subprocess.run(ps_cmd, capture_output=True, text=True)
    print(result.stdout)
    if result.returncode != 0:
        print("STDERR:", result.stderr)

    m = re.search(r"== run_id: (\S+) ==", result.stdout)
    if m:
        _apply_auto_tags(m.group(1))

    return system_instruction, contents, verilog


if __name__ == "__main__":
    if len(sys.argv) < 4:
        print(__doc__)
        sys.exit(1)
    circuit_arg, fmt_arg, level_arg = sys.argv[1], sys.argv[2], sys.argv[3]
    model_arg = sys.argv[4] if len(sys.argv) > 4 else gm.DEFAULT_MODEL
    run_one(circuit_arg, fmt_arg, level_arg, model_arg)
