# Slot 2 — Hardware-Knowledge Attachments (format-independent)

Attach the SAME set to a given prompt level regardless of input format (json/python).
The circuit spec (Slot 1) carries only the circuit; these carry all hardware knowledge.

| Level | gate_library.json | architecture_rules.md | pipelines/<C>_pipeline.json | perm_hints/<C>_perm_hints.json |
|---|---|---|---|---|
| full          | YES | YES | YES | (implicit in pipeline) |
| medium        | YES | YES | no  | YES |
| medium_strict | YES | YES | no  | **no** |
| sparse        | no  | no  | no  | no |

- gate_library.json = `gate_library/gate_library.json` (already lists both `ControlledNotGate`/CX
  and `SqrtXGate`/SX as primitives — no additions needed for Circuit_07/Circuit_08).
- architecture_rules.md = general rules (perm rule stated, valid chain, encoding, naming).
- pipelines/ = per-circuit exact stage sequence w/ instances + cycles (FULL only).
- perm_hints/ = per-circuit statement of WHICH gates need perms (MEDIUM; replaces the
  old per-op perm_required/reason fields that used to live inside the circuit JSON).

medium vs medium_strict: identical EXCEPT medium_strict omits the per-circuit perm
hints — the model must derive placement from the rule + targets alone.

## Status update on Circuit_07/Circuit_08 (resolved 2026-07-16)
The original note here flagged two open items — both are now resolved:
- CX wrapper source: `CNGate2QubitVector16bit` was already present locally in
  `gate_library/gate_library_flat_1_0167.sv` (it's what made the verified Bell/Circuit1_0167
  pass). No file from Jeremy was needed.
- SX wrapper name/existence: `SXGate2QubitVector16bit` didn't exist yet, so it was built by
  wrapping the real `SqrtXGate` primitive (`gate_library/SqrtXGate.sv`) in the exact same
  two-layer pattern already verified for `HGate2QubitVector16bit` (16bit passthrough +
  2-instance vector wrapper, one per amplitude pair). No new arithmetic was invented — it's
  the same structural pattern, just instantiating SqrtXGate instead of HadamardGate.

Both circuits were then simulated end-to-end in ModelSim against real ground-truth wiring
(H → [perm] CX [perm] → H or SX), extending the verified Bell pipeline by one stage. See
`experiment/matched_arms/ground_truth/` for the derivation and `experiment/testbenches/
tb_Circuit_07.v` / `tb_Circuit_08.v` for the now-simulation-confirmed golden values (Circuit_08's
negative-imaginary values came out as `0xE95F`, 1 LSB off the hand-derived `0xE960` guess —
same rounding behavior already seen on the verified SXdg/Circuit0_4 run). Both are PASS.
