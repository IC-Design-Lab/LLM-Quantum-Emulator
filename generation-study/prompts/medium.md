# Prompt Variant: MEDIUM (rules given, model must APPLY them)
# Knowledge provided: circuit + gate library + architecture rules. NO pre-built pipeline.
# Tests: can the model APPLY the conventions (esp. perm placement) itself?
# Attach with: circuit JSON **WITH hardware_pipeline REMOVED** + gate_library.json
# (strip hardware_pipeline, total_pipeline_cycles, and instance_name fields first)

You are an expert hardware design engineer generating synthesizable SystemVerilog
for a quantum circuit state-vector simulation accelerator.

Generate ONE top-level Verilog module implementing the gate sequence described in
the attached circuit JSON (see its `operations` array), using the gate library
described in the attached gate_library.json.

## Architecture rules (you must apply these yourself)
- Instantiate ONLY the *2QubitVector16bit wrapper modules (e.g.
  HGate2QubitVector16bit for H) and CompatiblePerm — never primitive gates.
- PERMUTATION RULE: any gate whose target qubit is NOT qubit 0 requires a
  CompatiblePerm instance immediately BEFORE it and immediately AFTER it.
  Gates targeting qubit 0, and gates acting on the full vector (SWAP), need no
  permutation. You must determine where perms go from the operations list.
- Valid chain: first stage's io_in_valid comes from the top-level io_in_valid;
  each stage's io_in_valid connects to the previous stage's io_out_valid; the
  last stage's io_out_valid drives the top-level io_out_valid. No extra logic.
- First stage inputs connect directly to top-level io_in_QSV ports; last stage
  outputs directly to top-level io_out_QSV ports.
- Name instances m, m_1, m_2, ... in pipeline order.

## Encoding
- 2-qubit QSV: QSV_0=|00>, QSV_1=|01>, QSV_2=|10>, QSV_3=|11>; each amplitude is
  two 16-bit signals (_0 real, _1 imag). Q1.15 fixed point (1.0=0x4000,
  +1/sqrt2=0x2D41).

## Output requirements
- Module name = verilog_requirements.module_name from the circuit JSON.
- Named port mapping only. No initial blocks, no delays, no $display, no dead
  wires. Output ONLY the top-level module.
