#==============================================================================
# log_run_matched.ps1  --  logs one matched-arms experiment run end-to-end (ModelSim)
#
# Usage:
#   .\log_run_matched.ps1 -Circuit Circuit_01 -InputFormat python -PromptLevel sparse `
#                          -Model gemini-3.5-flash -GeneratedFile C:\path\to\generated.v `
#                          -Attachments "gate_library.json;architecture_rules.md"
#
# Reuses the EXACT ModelSim compile/simulate/parse logic already verified in
# experiment/log_run.ps1 (same vlog/vsim invocation, same PASS/FAIL parsing).
# What's different: run_id format, and a wider CSV schema (input_format and
# prompt_level as separate columns, run_n, and an attachments column so any
# run's payload is reconstructable). error_types is left BLANK -- filled in by
# hand after reviewing a failure, same as the existing pipeline.
#
# This script never edits a testbench or a generated file to change a result.
#==============================================================================

param(
    [Parameter(Mandatory)][string]$Circuit,
    [Parameter(Mandatory)][ValidateSet("python","json")][string]$InputFormat,
    [Parameter(Mandatory)][ValidateSet("full","medium","medium_strict","sparse")][string]$PromptLevel,
    [Parameter(Mandatory)][string]$Model,
    [Parameter(Mandatory)][string]$GeneratedFile,
    [string]$Attachments = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$MatchedRoot = $PSScriptRoot
$ExpRoot     = Split-Path $MatchedRoot -Parent
$RepoRoot    = Split-Path $ExpRoot -Parent

if (-not (Test-Path $GeneratedFile)) { Write-Error "Generated file not found: $GeneratedFile" }

# ---- resolve gate library for this circuit -----------------------------------
$Suffix       = $Circuit -replace '^Circuit', ''
$LibCandidate = Join-Path $RepoRoot "gate_library\gate_library_flat_$Suffix.sv"
$LibGeneric   = Join-Path $RepoRoot "gate_library\gate_library_flat.sv"
$Library = if (Test-Path $LibCandidate) { $LibCandidate }
           elseif (Test-Path $LibGeneric) { $LibGeneric }
           else { Write-Error "No gate library found for $Circuit (tried $LibCandidate and $LibGeneric)" }

# ---- resolve testbench (format-agnostic -- same golden state regardless of input_format) ----
$TB = Join-Path $ExpRoot "testbenches\tb_$Circuit.v"
if (-not (Test-Path $TB)) { Write-Error "No testbench found for $Circuit at $TB" }

# ---- generate run_id (auto-incrementing NNN) -------------------------------------
# NextN is derived from the MAX of two sources, not just one: files in outputs/
# (fast/local) AND rows already logged in results_matched.csv (authoritative --
# survives outputs/ losing files to external sync pruning, which has been
# observed to happen on this machine's OneDrive-managed Downloads folder).
# Relying on the file count alone risks the counter resetting mid-run and two
# different real generations silently colliding on the same run_id.
$Prefix     = "${Circuit}_${InputFormat}_${PromptLevel}_${Model}_"
$OutputsDir = Join-Path $MatchedRoot "outputs"
New-Item -ItemType Directory -Force $OutputsDir | Out-Null
$ExistingFiles = Get-ChildItem $OutputsDir -Filter "$Prefix*" -ErrorAction SilentlyContinue |
    ForEach-Object {
        if ($_.BaseName -match "^$([regex]::Escape($Prefix))(\d+)$") { [int]$Matches[1] }
    }
$MaxFromFiles = if ($ExistingFiles) { [int](($ExistingFiles | Measure-Object -Maximum).Maximum) } else { 0 }

$CsvPath = Join-Path $MatchedRoot "results\results_matched.csv"
$MaxFromCsv = 0
if (Test-Path $CsvPath) {
    Import-Csv $CsvPath | Where-Object {
        $_.circuit -eq $Circuit -and $_.input_format -eq $InputFormat -and
        $_.prompt_level -eq $PromptLevel -and $_.model -eq $Model
    } | ForEach-Object {
        if ($_.run_id -match "^$([regex]::Escape($Prefix))(\d+)$") {
            if ([int]$Matches[1] -gt $MaxFromCsv) { $MaxFromCsv = [int]$Matches[1] }
        }
    }
}

$NextN = [Math]::Max($MaxFromFiles, $MaxFromCsv) + 1
$RunId = "{0}{1:D3}" -f $Prefix, $NextN
$RunN  = $NextN
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

$BuildDir = Join-Path $MatchedRoot "results\build"
$WorkLib  = Join-Path $BuildDir "work"
$VcdDir   = Join-Path $MatchedRoot "results\vcd"
$LogsDir  = Join-Path $MatchedRoot "results\logs"
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
$FailureStage = ""
$Notes        = ""
$SimOutput    = @()

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
        $FailureStage = "pass"
    } elseif ($SimOutput -match "TIMEOUT") {
        $PassFail = "FAIL"
        $FailureStage = "simulation"
        $Notes = "timeout - io_out_valid never asserted"
    } elseif ($SimOutput -match "RESULT:\s*FAIL") {
        $PassFail = "FAIL"
        $FailureStage = "simulation"
        $MismatchLine = ($SimOutput | Select-String -Pattern "\d+ mismatch") | Select-Object -First 1
        $Notes = if ($MismatchLine) { $MismatchLine.Matches[0].Value } else { "amplitude mismatch" }
    } else {
        $PassFail = "FAIL"
        $FailureStage = "compile"
        $ErrLines = ExtractErrorLines $SimOutput
        $Notes = if ($ErrLines) { "simulation error: " + ($ErrLines -join " / ") } else { "no RESULT line found - simulation errored, see log" }
    }

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
    "circuit=$Circuit input_format=$InputFormat prompt_level=$PromptLevel model=$Model run_n=$RunN"
    "attachments=$Attachments"
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

if ($Notes.Length -gt 300) { $Notes = $Notes.Substring(0, 300) + "..." }
$Notes = ($Notes + " [log: matched_arms/results/logs/$RunId.log]").Trim()

# ---- append CSV row ----------------------------------------------------------------
# Schema: run_id, circuit, input_format, prompt_level, model, run_n,
#         pass_fail, failure_stage, error_types (manual), attachments, notes
$Csv = Join-Path $MatchedRoot "results\results_matched.csv"
function CsvField([string]$s) { '"' + ($s -replace '"', '""') + '"' }
$Fields = @($RunId, $Circuit, $InputFormat, $PromptLevel, $Model, $RunN, $PassFail, $FailureStage, "", $Attachments, $Notes)
($Fields | ForEach-Object { CsvField $_ }) -join "," | Add-Content -Path $Csv

# ---- best-effort mirror to Google Sheets (never fails the run) -------------------
# Reuses the existing webhook + append action untouched. prompt_level is sent in
# the prompt_variant slot; run_n/attachments are folded into notes since the
# Sheet's columns weren't part of this change.
$WebhookFile = Join-Path $ExpRoot "sheets_webhook_url.txt"
$SheetsStatus = "not configured"
if (Test-Path $WebhookFile) {
    $WebhookUrl = (Get-Content $WebhookFile -Raw).Trim()
    if ($WebhookUrl) {
        try {
            $SheetsNotes = "run_n=$RunN attachments=[$Attachments] $Notes"
            $Body = @{
                run_id = $RunId; circuit = $Circuit; model = $Model
                prompt_variant = $PromptLevel; input_format = $InputFormat
                pass_fail = $PassFail; failure_stage = $FailureStage; error_types = ""; notes = $SheetsNotes
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
Write-Host "   stage   : $FailureStage"
Write-Host "   notes   : $Notes"
Write-Host "   csv     : $Csv  (error_types left blank -- tag it by hand)"
Write-Host "   sheets  : $SheetsStatus"
