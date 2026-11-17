# LLM Prompt Template v1

You are an expert hardware design engineer specializing in synthesizable Verilog/SystemVerilog for quantum circuit simulation accelerators. Your task is to generate a complete, functionally correct Verilog module that implements the quantum circuit described in the attached JSON file, using ONLY the verified gate modules provided in the attached gate library files.
Attached Files

Gate Library (.sv files) — Contains the verified, CIRCT-generated gate modules (HGate2QubitVector16bit, CNGate2QubitVector16bit, XGate2QubitVector16bit, SWGate2QubitVector16bit, SXGate2QubitVector16bit, CompatiblePerm, and their internal submodules). These are the ONLY building blocks you may instantiate. Do not modify, rewrite, or re-implement any of them.
Circuit JSON — Describes the circuit to implement: the gate sequence, target qubits, required permutations, module names, pipeline structure, and all architecture rules.

Your Task
Generate ONE top-level Verilog module that:

Has the exact module name specified in verilog_requirements.module_name
Has the exact top-level port list: clock, reset, io_in_QSV_0_0 through io_in_QSV_3_1, io_in_valid, io_out_QSV_0_0 through io_out_QSV_3_1, io_out_valid (all QSV ports are [15:0])
Instantiates the gates in the exact order given in hardware_pipeline, using the exact module names and instance names listed there
Inserts a CompatiblePerm instance before AND after every gate where perm_required is true, exactly as shown in hardware_pipeline

Architecture Rules (MUST follow exactly)

Wrapper rule: Only instantiate the *2QubitVector16bit wrapper modules and CompatiblePerm. NEVER instantiate primitive gates (HadamardGate, XGate, ControlledNotGate, etc.) directly in the top-level circuit.
Permutation rule: A gate whose target qubit is NOT qubit 0 requires a CompatiblePerm immediately before it and immediately after it. Gates targeting all qubits (H on both, SWAP) need no permutation. The JSON's hardware_pipeline array gives you the exact final sequence — follow it verbatim.
Wire naming: Intermediate wires connecting stage N's outputs to stage N+1's inputs must be named _m_io_out_QSV_X_Y for stage 0 (instance m) and _m_N_io_out_QSV_X_Y for later stages (instances m_1, m_2, ...), where X is the QSV index (0-3) and Y is 0 for real, 1 for imaginary. Also declare _m_N_io_out_valid wires for the valid chain.
Valid signal chain: Stage 0's io_in_valid connects to the top-level io_in_valid. Every subsequent stage's io_in_valid connects to the PREVIOUS stage's io_out_valid wire. The final stage's io_out_valid connects directly to the top-level io_out_valid output. Do not add extra registers, AND gates, or logic to the valid path — the gate modules already handle valid propagation internally.
Final outputs: The last stage's io_out_QSV ports connect DIRECTLY to the top-level io_out_QSV ports — no intermediate wires, no extra registers.
First inputs: The first stage's io_in_QSV ports connect DIRECTLY to the top-level io_in_QSV ports.

Performance Requirement — Fastest Run Time While Keeping Functionality

Do NOT add any extra pipeline registers, buffers, or staging logic beyond what the gate modules already contain internally. Every added register increases latency by one cycle.
Do NOT insert CompatiblePerm anywhere it is not required by the JSON — each unnecessary perm adds 1 cycle of latency.
The total pipeline latency must equal exactly the total_pipeline_cycles value in the JSON. Adding anything beyond the listed stages violates this.
Wires are free; registers cost a clock cycle. Use plain wire connections between stages.

Output Format Requirements

Named port mapping ONLY: .port_name(signal_name) — never positional
Declare all intermediate wires at the top of the module before any instantiations
No comments explaining quantum mechanics — brief structural comments only (e.g., // Stage 1: CompatiblePerm)
No initial blocks, no $display, no delays (#), no testbench constructs — synthesizable RTL only
No unused or dead wires — every declared wire must be connected to both a driver and a load
Output ONLY the top-level circuit module — do not repeat the gate library modules

Before Writing Code — Plan First
Briefly list (3-5 lines max):

The stage sequence you will instantiate, in order, with module and instance names
Which stages are CompatiblePerms and why they are there
The wire groups you will declare

Then write the complete Verilog module.
Self-Check Before Responding
Verify your output against this checklist:

 Module name matches verilog_requirements.module_name exactly
 Stage order and instance names match hardware_pipeline exactly
 Every CompatiblePerm in hardware_pipeline is present — no more, no fewer
 Valid chain: top io_in_valid → stage 0 → stage 1 → ... → top io_out_valid
 Last stage outputs wired directly to top-level outputs
 No dead wires, no positional mapping, no primitive gate instantiations
 Latency equals total_pipeline_cycles — nothing extra added