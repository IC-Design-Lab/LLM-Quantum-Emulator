# Prompt Variant Kit — Error Taxonomy Probe

Three prompt levels that differ ONLY in how much domain knowledge they provide.
Each failure is attributable to the specific knowledge that level removes.

| Level  | Gate library JSON | Architecture rules | Pre-built pipeline | Tests |
|--------|-------------------|--------------------|--------------------|-------|
| FULL   | yes               | yes                | yes                | assembly/transcription |
| MEDIUM | yes               | yes                | NO                 | rule APPLICATION (perm placement) |
| SPARSE | NO                | NO                 | NO                 | unaided domain knowledge |

## How to run one probe (e.g. Circuit0_17)
1. FULL:   attach circuit JSON (as-is) + gate_library.json + full.md text
2. MEDIUM: attach circuit JSON with hardware_pipeline/total_pipeline_cycles/
           instance_name fields DELETED + gate_library.json + medium.md text
3. SPARSE: attach circuit JSON stripped to {circuit_name, qubits, operations
           (gate+targets only), verilog_requirements.module_name} + sparse.md text
           — NO gate_library.json

Same circuit, same model, same session settings. The ONLY variable is knowledge.

## Predictions (what failure at each level means)
- Fails FULL           -> basic generation problem (syntax, wiring)
- Passes FULL, fails MEDIUM -> cannot APPLY the perm rule / valid chain itself
- Passes MEDIUM, fails SPARSE -> lacks the domain conventions unaided
  (this failure class is the RAG motivation: retrieval supplies exactly
   the knowledge SPARSE removes)

## Logging
Record each run as: circuit, model, prompt_variant, input_format, pass/fail,
error_category. Save the generated .v named circuit_variant_model_NNN.v.
Never modify a testbench to make a run pass — failures are the data.
