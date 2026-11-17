# gui.do -- one-window ModelSIM GUI workflow for the llm-verilog testbenches.
#
# SOURCE THIS ONCE per ModelSIM session:
#   do {<repo>/sim/gui.do}
#
# Then run any testbench with ONE short command:
#   tb 0_3              ;# ground-truth Circuit0_3
#   tb 0_4             ;# ground-truth Circuit0_4
#   tb 0_3 claude      ;# claude-generated Circuit0_3
#   tb 0_3 gemini      ;# gemini-generated Circuit0_3
#
# It compiles the design + (gate library) + testbench, loads it, adds all
# waves in hex, runs, and zooms. No PowerShell, no cd, no path typing.

# Set to your checkout, or pass -gREPO=... to vsim.
set ::REPO [file normalize [file join [file dirname [info script]] ..]]

proc tb {circuit {source ground}} {
  set repo $::REPO
  set build $repo/sim/modelsim_build
  file mkdir $build
  cd $build

  # ---- locate the three source files ----------------------------------------
  set tbfile $repo/testbenches/tb_Circuit$circuit.v
  if {![file exists $tbfile]} { error "no testbench: $tbfile" }

  if {$source eq "ground"} {
    set design $repo/ground_truth/Circuit$circuit.sv
    set lib ""
  } else {
    # generated files are either Circuit0_3.sv or Circuit0_3_gemini.sv
    set design $repo/generated/$source/Circuit$circuit.sv
    if {![file exists $design]} {
      set design $repo/generated/$source/Circuit${circuit}_$source.sv
    }
    set lib $repo/gate_library/gate_library_flat_$circuit.sv
    if {![file exists $lib]} { set lib "" }
  }
  if {![file exists $design]} { error "no design: $design" }

  # ---- compile --------------------------------------------------------------
  if {![file exists work]} { vlib work }
  set srcs $design
  if {$lib ne ""} { lappend srcs $lib }
  lappend srcs $tbfile
  echo "== compiling Circuit$circuit ($source) =="
  if {[catch {eval vlog -sv $srcs} msg]} { error "COMPILE FAILED:\n$msg" }

  # ---- simulate + waves -----------------------------------------------------
  vsim -voptargs=+acc work.tb_Circuit$circuit
  do $repo/sim/wave.do
}

echo "gui.do loaded. Run a testbench with e.g.:  tb 0_3      or   tb 0_3 claude"
