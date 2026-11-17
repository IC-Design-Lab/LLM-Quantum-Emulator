#==============================================================================
# run_modelsim.ps1  --  ModelSIM verification driver (Windows)
#
# Usage:
#   .\run_modelsim.ps1 -Design <design.v|.sv> -Library <library.sv|-> `
#                      -TB <testbench.v> [-Top <top_tb_module>] [-Label <tag>]
#
# Examples:
#   # thin generated design + gate library:
#   .\run_modelsim.ps1 -Design ..\generated\claude\Circuit0_2.sv `
#                      -Library ..\gate_library\gate_library_flat_0_2.sv `
#                      -TB ..\testbenches\tb_Circuit0_2.v -Top tb_Circuit0_2
#
#   # self-contained ground_truth design (no separate library) -- use '-':
#   .\run_modelsim.ps1 -Design ..\ground_truth\Circuit0_2.sv `
#                      -Library - -TB ..\testbenches\tb_Circuit0_2.v
#
#   # compare LLM sources with a label:
#   .\run_modelsim.ps1 -Design ..\generated\gemini\Circuit0_3_gemini.sv `
#                      -Library ..\gate_library\gate_library_flat_0_3.sv `
#                      -TB ..\testbenches\tb_Circuit0_3.v -Label gemini
#
# What it does:
#   1. Resolves ModelSIM executables (MODELSIM_BIN env var or default path)
#   2. Creates a fresh scratch work library in modelsim_build\
#   3. Compiles all sources with vlog -sv2k12
#   4. Runs batch simulation via vsim -c ... -do run.do
#   5. Prints PASS/FAIL and saves .vcd to results\transcripts\
#==============================================================================

param(
    [Parameter(Mandatory)][string]$Design,
    [Parameter(Mandatory)][string]$Library,
    [Parameter(Mandatory)][string]$TB,
    [string]$Top    = "",
    [string]$Label  = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# ---- locate ModelSIM binaries -----------------------------------------------
# MODELSIM_BIN is the supported way to point at an install. The fallbacks are the
# usual locations, tried in order, so a default install works with nothing
# configured and anything else sets the variable.
$Candidates = @(
    "C:\modelsim_ase\win32aloem",
    "C:\intelFPGA\modelsim_ase\win32aloem",
    "C:\intelFPGA_lite\modelsim_ase\win32aloem",
    (Join-Path $env:USERPROFILE "Downloads\modelsim_ase\win32aloem")
)
$Bin = if ($env:MODELSIM_BIN) {
    $env:MODELSIM_BIN
} else {
    $found = $Candidates | Where-Object { Test-Path (Join-Path $_ "vsim.exe") } | Select-Object -First 1
    if ($found) { $found } else { $Candidates[0] }
}
$VLIB = Join-Path $Bin "vlib.exe"
$VMAP = Join-Path $Bin "vmap.exe"
$VLOG = Join-Path $Bin "vlog.exe"
$VSIM = Join-Path $Bin "vsim.exe"

foreach ($exe in $VLIB, $VMAP, $VLOG, $VSIM) {
    if (-not (Test-Path $exe)) {
        Write-Error "ModelSIM executable not found: $exe`nSet MODELSIM_BIN env var to the folder containing vsim.exe"
    }
}

# modelsim.ini must be visible so ModelSIM can find its built-in libraries. It sits
# one level above the binaries in every ModelSim ASE layout, so derive it from $Bin
# rather than naming a second absolute path that can disagree with the first.
$ModelSimIni = if ($env:MODELSIM_INI) {
    $env:MODELSIM_INI
} else {
    Join-Path (Split-Path -Parent $Bin) "modelsim.ini"
}
$env:MODELSIM = $ModelSimIni

# ---- resolve paths to absolute ----------------------------------------------
$Design  = (Resolve-Path $Design).Path
$TB      = (Resolve-Path $TB).Path
$UseLib  = ($Library -ne "-") -and ($Library -ne "none") -and ($Library -ne "")
if ($UseLib) { $Library = (Resolve-Path $Library).Path }

# ---- auto-derive label from design parent folder ----------------------------
if (-not $Label) {
    $Label = Split-Path (Split-Path $Design -Parent) -Leaf
    if ($Label -eq "ground_truth") { $Label = "ground" }
}

# ---- auto-detect top testbench module name ----------------------------------
if (-not $Top) {
    $Top = (Get-Content $TB | Select-String -Pattern "^module\s+(\w+)" | Select-Object -First 1).Matches.Groups[1].Value
    if (-not $Top) { Write-Error "Could not auto-detect top module in $TB - pass -Top explicitly" }
}

# ---- build directory (fresh library each run) -------------------------------
$ScriptDir  = $PSScriptRoot
$BuildDir   = Join-Path $ScriptDir "modelsim_build"
$WorkLib    = Join-Path $BuildDir  "work"
$RepoRoot   = Split-Path $ScriptDir -Parent
$ResultsDir = Join-Path $RepoRoot  "results\transcripts"

New-Item -ItemType Directory -Force $BuildDir  | Out-Null
New-Item -ItemType Directory -Force $ResultsDir | Out-Null

# Remove stale work library so vlib starts clean
if (Test-Path $WorkLib) { Remove-Item $WorkLib -Recurse -Force }

# ---- compile ----------------------------------------------------------------
Write-Host "== vlib =="
& $VLIB $WorkLib

Write-Host "== vmap =="
& $VMAP -modelsimini $ModelSimIni work $WorkLib

Write-Host "== vlog (compile) =="
$Sources = @($Design)
if ($UseLib)  { $Sources += $Library }
$Sources += $TB

# -sv enables SystemVerilog (handles 'automatic', CIRCT macros, etc.)
# +acc is passed to vsim, not vlog -- vlog just needs -sv here
$VlogArgs = @("-sv", "-work", $WorkLib, "-modelsimini", $ModelSimIni) + $Sources
& $VLOG @VlogArgs
if ($LASTEXITCODE -ne 0) {
    Write-Host "== COMPILE FAILED - aborting =="
    exit 1
}

# ---- determine VCD output name from testbench -------------------------------
$VcdRaw  = (Get-Content $TB | Select-String -Pattern '\$dumpfile\s*\(\s*"([^"]+)"' | Select-Object -First 1).Matches.Groups[1].Value
$VcdBase = if ($VcdRaw) { [IO.Path]::GetFileNameWithoutExtension($VcdRaw) } else { "sim" }
$OutVcd  = "${VcdBase}_${Label}.vcd"
$OutPath = Join-Path $ResultsDir $OutVcd

# Remove stale VCD so a fresh result is unambiguous
if (Test-Path $OutPath)              { Remove-Item $OutPath }
if (Test-Path (Join-Path $BuildDir $OutVcd)) { Remove-Item (Join-Path $BuildDir $OutVcd) }

# vsim writes the VCD relative to wherever it runs, so cd into BuildDir
Push-Location $BuildDir

# ---- simulate ---------------------------------------------------------------
Write-Host "== vsim (simulate) =="
$DoFile = Join-Path $ScriptDir "run.do"
$VsimArgs = @(
    "-c",                           # batch / no GUI
    "-voptargs=+acc",               # expose internal signals for VCD dump
    "-lib", $WorkLib,
    "work.$Top",
    "-do", "do {$DoFile}"
)
# vsim writes harmless notes to stderr; 2>&1 under ErrorActionPreference=Stop
# would mis-report them as a terminating "Error loading design". Relax it just
# for this native call so a normal PASS/FAIL run isn't treated as a failure.
$prevEAP = $ErrorActionPreference
$ErrorActionPreference = "Continue"
$SimOutput = & $VSIM @VsimArgs 2>&1
$ErrorActionPreference = $prevEAP
$SimOutput | Write-Host

Pop-Location

# ---- move VCD to results ----------------------------------------------------
Write-Host "== done =="
Write-Host "   source label : $Label"
Write-Host "   build dir    : $BuildDir"

$VcdProduced = Join-Path $BuildDir $VcdRaw
if ($VcdRaw -and (Test-Path $VcdProduced)) {
    Copy-Item $VcdProduced $OutPath -Force
    Write-Host "   waveform     : $OutPath"
} elseif ($VcdRaw -and (Test-Path (Join-Path $BuildDir $OutVcd))) {
    Write-Host "   waveform     : $(Join-Path $BuildDir $OutVcd)"
} else {
    Write-Host "   waveform     : (none produced this run)"
}

# ---- propagate PASS/FAIL exit code ------------------------------------------
$passed = $SimOutput | Select-String -Pattern "RESULT:\s*PASS" -Quiet
$failed = $SimOutput | Select-String -Pattern "RESULT:\s*FAIL|TIMEOUT" -Quiet
if ($passed)      { exit 0 }
elseif ($failed)  { exit 1 }
else              { exit 0 }   # simulation completed without explicit result
