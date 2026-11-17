# run.do -- ModelSIM batch simulation do file
# Called by run_modelsim.ps1 via: vsim -c ... -do "do {run.do}"
# Runs the simulation to completion and exits cleanly.

run -all
quit -f
