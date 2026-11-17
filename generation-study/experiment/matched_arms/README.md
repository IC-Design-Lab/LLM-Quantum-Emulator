# Matched Input-Format Arms — Python vs JSON

Generated from the `.qpy` source of truth (the circuit-cutting pipeline output).

## The design principle
**The circuit description carries ONLY the circuit.**
All hardware knowledge lives in the prompt level's attachments — identical for both arms.

This makes `input_format` a clean single variable.

## The three slots of every prompt

| Slot | Content | Varies by |
|---|---|---|
| 1. CIRCUIT | `Circuit_NN.py` **or** `Circuit_NN.json` | `input_format` — the ONLY difference |
| 2. HARDWARE KNOWLEDGE | gate_library.json + rules + pipeline | `prompt_level` (identical across formats) |
| 3. TASK INSTRUCTION | "Generate SystemVerilog..." + output reqs | constant everywhere |

## Slot 2 by prompt level (attach the SAME thing to both arms)
| Level | Gate library | Arch rules | Pipeline | Perm hints |
|---|---|---|---|---|
| `full` | yes | yes | yes | yes |
| `medium` | yes | yes | no | yes |
| `medium_strict` | yes | yes | no | **no** |
| `sparse` | **no** | **no** | no | no |

## What's in these files
Both formats carry exactly: gates, their target qubits, qubit count, module name.
**Nothing else.** Verified: no `module`, `perm_required`, `pipeline_cycles`,
`hardware_pipeline`, `architecture_rules`, `gate_library`, or `encoding` fields.

## Circuit map
| File | Gate sequence | Your original name |
|---|---|---|
| Circuit_00 | h[0] → swap[0,1] | Circuit0_06 |
| Circuit_01 | h[0] → x[1] → swap[0,1] | Circuit0_17 |
| Circuit_02 | h[0] → h[1] → swap[0,1] | Circuit0_2 |
| Circuit_03 | h[0] → x[1] → h[1] → swap[0,1] | Circuit0_3 |
| Circuit_04 | h[0] → sxdg[1] → swap[0,1] | Circuit0_4 |
| Circuit_05 | h[0] → x[1] → sxdg[1] → swap[0,1] | Circuit0_5 |
| Circuit_06 | h[0] → cx[0,1] | Circuit1_0167 (Bell) |
| Circuit_07 | h[0] → cx[0,1] → h[0] | HCXH |
| Circuit_08 | h[0] → cx[0,1] → sx[0] | HCXSX |

Measurement stripped from all (hardware implements only the unitary gates).

## The grid
```
for circuit in circuits:
  for fmt in {python, json}:          # SLOT 1 — the variable under test
    for level in {full, medium, medium_strict, sparse}:   # SLOT 2
      for model in models:
        for run in 1..N:
          generate → verify (format-agnostic harness) → log
```

## Logging
`run_id`: `Circuit_01_python_sparse_gemini-3.5-flash_001`
Columns: `run_id, circuit, input_format, prompt_level, model, run_n,
          pass_fail, failure_stage, error_types, notes`

## IMPORTANT — comparability note
Your EARLIER json runs used specs that carried hardware fields inline (module names,
perm flags, pipeline). Those are NOT informationally matched to these Python files.
- Old JSON data — still valid as your taxonomy foundation (the cliff, the mechanism).
- Format comparison — use THESE matched specs for both arms, freshly run.
Mixing them would confound format with knowledge content.

## Validation (your professor's point)
To eyeball any circuit from source:
```python
from qiskit import qpy
qc = qpy.load(open('subcircuits/group_0_0.qpy','rb'))[0]
print(qc)     # draws the circuit — visual confirmation
```
