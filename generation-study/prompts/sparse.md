# Prompt Variant: SPARSE (minimal — model must KNOW the domain)
# Knowledge provided: circuit only. NO gate library JSON, NO architecture rules.
# Tests: does the model know the conventions unaided? (This is what RAG will fix.)
# Attach with: circuit JSON **WITH hardware_pipeline AND architecture_rules AND
# gate_library sections REMOVED** — only the operations list, qubits, and module
# name. Do NOT attach gate_library.json.

Generate a synthesizable SystemVerilog top-level module implementing the 2-qubit
quantum circuit described in the attached JSON, targeting a quantum state-vector
simulation hardware library.

The module must be named as specified in the JSON and expose ports:
clock, reset, io_in_QSV_0_0 through io_in_QSV_3_1, io_in_valid,
io_out_QSV_0_0 through io_out_QSV_3_1, io_out_valid (QSV ports are [15:0]).

Implement the gate sequence from the JSON's operations list by instantiating the
appropriate verified gate modules from the quantum gate library. Output only the
Verilog module.
