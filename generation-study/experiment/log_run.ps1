#==============================================================================
# log_run.ps1  --  logs one experiment run end-to-end (ModelSim)
#
# Usage:
#   .\log_run.ps1 -Circuit Circuit0_2 -Model claude -PromptVariant sparse `
#                 -InputFormat json -GeneratedFile C:\path\to\generated.sv
#
# What it does:
#   1. Generates a run_id: <circuit>_<prompt_variant>_<model>_NNN (auto-incrementing)
#   2. Saves the generated file to outputs/<run_id>.<ext>
#   3. Resolves the right gate_library file for this circuit and the testbench
#   4. Compiles + simulates with ModelSim (same invocation verified in sim/run_modelsim.ps1:
#      vlog -sv with -modelsimini is fine; vsim must NOT get -modelsimini, it relies on
#      $env:MODELSIM instead -- passing it explicitly throws vsim-7 EINVAL on this install)
#   5. Parses PASS/FAIL from the sim output, and on FAIL auto-derives failure_stage:
#        "compile"    - vlog failed, or vsim couldn't elaborate the design at all
#                       (e.g. an instantiated module doesn't exist -- never ran a cycle)
#        "functional" - it elaborated and ran, but timed out or amplitudes mismatched
#   6. Copies the produced .vcd to results/vcd/<run_id>.vcd
#   7. Appends one row to results/results.csv with error_types left BLANK --
#      that column (a ';'-separated list, e.g. "hallucinated_module;wrong_latency")
#      is filled in by hand after reviewing a failure. failure_stage is NOT manual --
#      the script derives it directly from which tool/phase failed.
#
# This script never edits a testbench or a generated file to change a result.
#==============================================================================

param(
    [Parameter(Mandatory)][string]$Circuit,
    [Parameter(Mandatory)][string]$Model,
    [Parameter(Mandatory)][string]$PromptVariant,
    [Parameter(Mandatory)][string]$InputFormat,
    [Parameter(Mandatory)][string]$GeneratedFile
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ExpRoot  = $PSScriptRoot
$RepoRoot = Split-Path $ExpRoot -Parent

if (-not (Test-Path $GeneratedFile)) { Write-Error "Generated file not found: $GeneratedFile" }

# ---- resolve gate library for this circuit -----------------------------------
# Convention established in sim/run_modelsim.ps1 usage: CircuitX_Y -> gate_library_flat_X_Y.sv,
# falling back to the generic gate_library_flat.sv when no per-circuit file exists.
$Suffix       = $Circuit -replace '^Circuit', ''
$LibCandidate = Join-Path $RepoRoot "gate_library\gate_library_flat_$Suffix.sv"
$LibGeneric   = Join-Path $RepoRoot "gate_library\gate_library_flat.sv"
$Library = if (Test-Path $LibCandidate) { $LibCandidate }
           elseif (Test-Path $LibGeneric) { $LibGeneric }
           else { Write-Error "No gate library found for $Circuit (tried $LibCandidate and $LibGeneric)" }

# ---- resolve testbench ----------------------------------------------------------
$TB = Join-Path $ExpRoot "testbenches\tb_$Circuit.v"
if (-not (Test-Path $TB)) { Write-Error "No testbench found for $Circuit at $TB" }

# ---- generate run_id (auto-incrementing NNN) -------------------------------------
$Prefix     = "${Circuit}_${PromptVariant}_${Model}_"
$OutputsDir = Join-Path $ExpRoot "outputs"
$Existing = Get-ChildItem $OutputsDir -Filter "$Prefix*" -ErrorAction SilentlyContinue |
    ForEach-Object {
        if ($_.BaseName -match "^$([regex]::Escape($Prefix))(\d+)$") { [int]$Matches[1] }
    }
$NextN = if ($Existing) { [int](($Existing | Measure-Object -Maximum).Maximum) + 1 } else { 1 }
$RunId = "{0}{1:D3}" -f $Prefix, $NextN
Write-Host "== run_id: $RunId =="

# ---- save generated code (never overwritten by a later run) ----------------------
$Ext = [IO.Path]::GetExtension($GeneratedFile)
$SavedDesign = Join-Path $OutputsDir "$RunId$Ext"
Copy-Item $GeneratedFile $SavedDesign -Force

# ---- ModelSIM setup ---------------------------------------------------------------
$Bin = if ($env:MODELSIM_BIN) { $env:MODELSIM_BIN } else { (Join-Path $env:USERPROFILE "Downloads\modelsim_ase\win32aloem") }
$VLIB = Join-Path $Bin "vlib.exe"
$VLOG = Join-Path $Bin "vlog.exe"
$VSIM = Join-Path $Bin "vsim.exe"
$ModelSimIni = if ($env:MODELSIM_INI) { $env:MODELSIM_INI } else { Join-Path (Split-Path -Parent $Bin) "modelsim.ini" }
$env:MODELSIM = $ModelSimIni

$BuildDir = Join-Path $ExpRoot "results\build"
$WorkLib  = Join-Path $BuildDir "work"
$VcdDir   = Join-Path $ExpRoot "results\vcd"
$LogsDir  = Join-Path $ExpRoot "results\logs"
New-Item -ItemType Directory -Force $BuildDir | Out-Null
New-Item -ItemType Directory -Force $VcdDir   | Out-Null
New-Item -ItemType Directory -Force $LogsDir  | Out-Null
if (Test-Path $WorkLib) { Remove-Item $WorkLib -Recurse -Force }

Write-Host "== vlib =="
& $VLIB $WorkLib | Out-Null

Write-Host "== vlog (compile) =="
$VlogArgs = @("-sv", "-work", $WorkLib, "-modelsimini", $ModelSimIni, $SavedDesign, $Library, $TB)
$CompileOutput = & $VLOG @VlogArgs 2>&1
$CompileOutput | Write-Host
$CompileOk = ($LASTEXITCODE -eq 0)

$PassFail     = "FAIL"
$FailureStage = ""   # only meaningful on FAIL; stays blank on PASS
$Notes        = ""
$SimOutput    = @()   # stays empty if compile fails, so log-writing below always has a value

# lines ModelSim itself flags as errors, from either tool -- this is what
# actually explains a FAIL, as opposed to just "no RESULT line found"
function ExtractErrorLines($lines) {
    @($lines) | Where-Object { $_ -match '\*\*\s*Error|^\s*Error:' } | ForEach-Object { $_.ToString().Trim() }
}

if (-not $CompileOk) {
    $FailureStage = "compile"
    $ErrLines = ExtractErrorLines $CompileOutput
    $Notes = if ($ErrLines) { "compile error: " + ($ErrLines -join " / ") } else { "compile error (see log)" }
} else {
    $Top = "tb_$Circuit"
    $DoFile = Join-Path $RepoRoot "sim\run.do"
    Push-Location $BuildDir
    $prevEAP = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    $VsimArgs = @("-c", "-voptargs=+acc", "-lib", $WorkLib, "work.$Top", "-do", "do {$DoFile}")
    $SimOutput = & $VSIM @VsimArgs 2>&1
    $ErrorActionPreference = $prevEAP
    $SimOutput | Write-Host
    Pop-Location

    if ($SimOutput -match "RESULT:\s*PASS") {
        $PassFail = "PASS"
    } elseif ($SimOutput -match "TIMEOUT") {
        $PassFail = "FAIL"
        $FailureStage = "functional"   # it elaborated and ran; the pipeline just never asserted valid
        $Notes = "timeout - io_out_valid never asserted"
    } elseif ($SimOutput -match "RESULT:\s*FAIL") {
        $PassFail = "FAIL"
        $FailureStage = "functional"   # it ran to completion; amplitudes just didn't match golden state
        $MismatchLine = ($SimOutput | Select-String -Pattern "\d+ mismatch") | Select-Object -First 1
        $Notes = if ($MismatchLine) { $MismatchLine.Matches[0].Value } else { "amplitude mismatch" }
    } else {
        $PassFail = "FAIL"
        $FailureStage = "compile"   # elaboration never succeeded (e.g. undefined module) -- no cycle ever ran
        $ErrLines = ExtractErrorLines $SimOutput
        $Notes = if ($ErrLines) { "simulation error: " + ($ErrLines -join " / ") } else { "no RESULT line found - simulation errored, see log" }
    }

    # ---- copy VCD ----------------------------------------------------------------
    $VcdRaw = (Get-Content $TB | Select-String -Pattern '\$dumpfile\s*\(\s*"([^"]+)"' | Select-Object -First 1).Matches.Groups[1].Value
    if ($VcdRaw) {
        $Produced = Join-Path $BuildDir $VcdRaw
        if (Test-Path $Produced) {
            Copy-Item $Produced (Join-Path $VcdDir "$RunId.vcd") -Force
        } else {
            $Notes = ($Notes + " | vcd not produced").Trim(' |')
        }
    }
}

# ---- write full compile+sim transcript, always (pass or fail) --------------------
$LogPath = Join-Path $LogsDir "$RunId.log"
@(
    "=== $RunId ==="
    "circuit=$Circuit model=$Model prompt_variant=$PromptVariant input_format=$InputFormat"
    "design=$SavedDesign"
    "library=$Library"
    "testbench=$TB"
    ""
    "--- vlog (compile) ---"
    $CompileOutput
    ""
    "--- vsim (simulate) ---"
    $SimOutput
    ""
    "result=$PassFail"
) | Out-String | Set-Content -Path $LogPath

# CSV/Sheets note stays short; point at the full transcript for everything else
if ($Notes.Length -gt 300) { $Notes = $Notes.Substring(0, 300) + "..." }
$Notes = ($Notes + " [log: results/logs/$RunId.log]").Trim()

# ---- append CSV row ----------------------------------------------------------------
# Schema: run_id, circuit, model, prompt_variant, input_format, pass_fail,
#         failure_stage (compile/functional, auto), error_types (';'-list, manual), notes
$Csv = Join-Path $ExpRoot "results\results.csv"
function CsvField([string]$s) { '"' + ($s -replace '"', '""') + '"' }
$Fields = @($RunId, $Circuit, $Model, $PromptVariant, $InputFormat, $PassFail, $FailureStage, "", $Notes)
($Fields | ForEach-Object { CsvField $_ }) -join "," | Add-Content -Path $Csv

# ---- best-effort mirror to Google Sheets (never fails the run) -------------------
$WebhookFile = Join-Path $ExpRoot "sheets_webhook_url.txt"
$SheetsStatus = "not configured"
if (Test-Path $WebhookFile) {
    $WebhookUrl = (Get-Content $WebhookFile -Raw).Trim()
    if ($WebhookUrl) {
        try {
            $Body = @{
                run_id = $RunId; circuit = $Circuit; model = $Model
                prompt_variant = $PromptVariant; input_format = $InputFormat
                pass_fail = $PassFail; failure_stage = $FailureStage; error_types = ""; notes = $Notes
            } | ConvertTo-Json
            Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $Body -ContentType "application/json" | Out-Null
            $SheetsStatus = "synced"
        } catch {
            $SheetsStatus = "sync failed (local CSV is unaffected) - $($_.Exception.Message)"
        }
    }
}

Write-Host "== logged =="
Write-Host "   run_id  : $RunId"
Write-Host "   result  : $PassFail"
Write-Host "   stage   : $(if ($FailureStage) { $FailureStage } else { 'n/a (pass)' })"
Write-Host "   notes   : $Notes"
Write-Host "   csv     : $Csv  (error_types left blank -- tag it by hand)"
Write-Host "   sheets  : $SheetsStatus"
