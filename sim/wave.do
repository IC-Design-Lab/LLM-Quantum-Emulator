# wave.do -- ModelSIM interactive waveform do file
# Use this when launching ModelSIM in GUI mode to inspect signals.
#
# IMPORTANT: source it with an absolute path (ModelSIM's cwd is often the
# modelsim_build library dir, not sim\):
#   vsim -voptargs=+acc work.tb_Circuit0_2
#   do {<repo>/sim/wave.do}
#
# This build of ModelSIM (ASE) does NOT support the /*/region/signal path
# wildcard form -- it only resolves plain '*' (current region) and recursion
# via '-r *'. So we use those, which are top-name agnostic and work for any
# Circuit testbench.

# Bail out early with a clear message if no design is loaded yet.
if {[catch {find signals -r *} _probe]} {
  echo "ERROR: no design loaded. Run first (from sim/modelsim_build):"
  echo "  vsim -voptargs=+acc work.tb_Circuit0_2"
  return
}

# Everything, recursively from the current top region (testbench -> dut -> ...)
add wave -divider "All Signals (recursive)"
add wave -r *

# Show the fixed-point QSV ports in hex. find -r walks the whole tree; we
# filter by name and set radix. catch{} keeps a non-match from aborting.
foreach s [find signals -r *] {
  if {[string match *QSV* $s]} {
    catch {property wave -radix hexadecimal $s}
  }
}

# Run the simulation and zoom to fit
run -all
wave zoom full
