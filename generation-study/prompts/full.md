# Prompt Variant: FULL (maximum scaffolding)
# Knowledge provided: circuit + gate library + architecture rules + exact pipeline
# Tests: can the model ASSEMBLE known pieces correctly? (transcription-level task)
# Attach with: circuit JSON (which includes hardware_pipeline) + gate_library.json

You are an expert hardware design engineer generating synthesizable SystemVerilog
for a quantum circuit state-vector simulation accelerator.

Generate ONE top-level Verilog module implementing the circuit described in the
attached circuit JSON, using the gate library described in the attached
gate_library.json.

## Architecture rules (follow exactly)
- Instantiate ONLY the *2QubitVector16bit wrapper modules and CompatiblePerm —
  never the primitive gates directly.
- The circuit JSON's `hardware_pipeline` array gives the EXACT stage sequence,
  module names, and instance names. Follow it verbatim — every stage, in order,
  no additions, no omissions.
- CompatiblePerm placement is already encoded in hardware_pipeline. Do not add
  or remove perms.
- Valid chain: stage 0's io_in_valid connects to the top-level io_in_valid; each
  later stage's io_in_valid connects to the PREVIOUS stage's io_out_valid; the
  final stage's io_out_valid drives the top-level io_out_valid. No extra logic
  on the valid path.
- First stage inputs connect directly to top-level io_in_QSV ports; last stage
  outputs connect directly to top-level io_out_QSV ports.
- Intermediate wires: _m_io_out_QSV_X_Y for stage 0 (instance m), then
  _m_N_io_out_QSV_X_Y for instance m_N. Also declare _m_N_io_out_valid wires.

## Encoding
- 2-qubit QSV: QSV_0=|00>, QSV_1=|01>, QSV_2=|10>, QSV_3=|11>; each amplitude is
  two 16-bit signals (_0 real, _1 imag). Q1.15 fixed point (1.0=0x4000,
  +1/sqrt2=0x2D41, -1/sqrt2=0xD2BF).

## Output requirements
- Module name = verilog_requirements.module_name from the circuit JSON.
- Named port mapping only. No initial blocks, no delays (#), no $display,
  no dead wires. Output ONLY the top-level module, no explanations.
