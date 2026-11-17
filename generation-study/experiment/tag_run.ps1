#==============================================================================
# tag_run.ps1 -- hand-tag a run's error_types (and optionally notes) after
# reviewing a failure. Edits results/results.csv in place AND pushes the same
# correction to the already-synced Google Sheet row via Code.gs's "update"
# action (requires the 2026-07-11 Code.gs redeploy -- see google_apps_script/).
#
# Usage:
#   .\tag_run.ps1 -RunId Circuit0_2_sparse_gemini-3.5-flash_001 -ErrorTypes unstable_valid_protocol
#   .\tag_run.ps1 -RunId <id> -ErrorTypes "hallucinated_module;wrong_latency" -Notes "extra detail"
#==============================================================================

param(
    [Parameter(Mandatory)][string]$RunId,
    [Parameter(Mandatory)][string]$ErrorTypes,
    [string]$Notes
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ExpRoot = $PSScriptRoot
$Csv = Join-Path $ExpRoot "results\results.csv"

# ---- parse + rewrite the matching CSV row (simple quoted-CSV, no embedded newlines) ----
function ParseCsvLine([string]$line) {
    $fields = @()
    $cur = ""
    $inQuotes = $false
    $i = 0
    while ($i -lt $line.Length) {
        $c = $line[$i]
        if ($inQuotes) {
            if ($c -eq '"') {
                if ($i + 1 -lt $line.Length -and $line[$i+1] -eq '"') { $cur += '"'; $i++ }
                else { $inQuotes = $false }
            } else { $cur += $c }
        } else {
            if ($c -eq '"') { $inQuotes = $true }
            elseif ($c -eq ',') { $fields += $cur; $cur = "" }
            else { $cur += $c }
        }
        $i++
    }
    $fields += $cur
    return $fields
}
function CsvField([string]$s) { '"' + ($s -replace '"', '""') + '"' }

$lines = Get-Content $Csv
$found = $false
$newLines = for ($idx = 0; $idx -lt $lines.Count; $idx++) {
    $line = $lines[$idx]
    if ($idx -eq 0 -or [string]::IsNullOrWhiteSpace($line)) { $line; continue }
    $f = ParseCsvLine $line
    if ($f[0] -eq $RunId) {
        $found = $true
        $f[7] = $ErrorTypes
        if ($PSBoundParameters.ContainsKey('Notes')) { $f[8] = $Notes }
        ($f | ForEach-Object { CsvField $_ }) -join ","
    } else {
        $line
    }
}
if (-not $found) { Write-Error "run_id not found in $Csv : $RunId" }
Set-Content -Path $Csv -Value $newLines

Write-Host "== CSV updated =="
Write-Host "   run_id      : $RunId"
Write-Host "   error_types : $ErrorTypes"
if ($PSBoundParameters.ContainsKey('Notes')) { Write-Host "   notes       : $Notes" }

# ---- push the same correction to the Sheet (best-effort, mirrors log_run.ps1's sync) ----
$WebhookFile = Join-Path $ExpRoot "sheets_webhook_url.txt"
if (Test-Path $WebhookFile) {
    $WebhookUrl = (Get-Content $WebhookFile -Raw).Trim()
    if ($WebhookUrl) {
        $Body = @{ action = "update"; run_id = $RunId; error_types = $ErrorTypes }
        if ($PSBoundParameters.ContainsKey('Notes')) { $Body.notes = $Notes }
        try {
            $Resp = Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body ($Body | ConvertTo-Json) -ContentType "application/json"
            if ($Resp.status -eq "ok") {
                Write-Host "== sheet updated == (row $($Resp.updated_row))"
            } else {
                Write-Host "== sheet update FAILED == $($Resp.message)"
                Write-Host "   (Has Code.gs been redeployed with the 2026-07-11 update action?)"
            }
        } catch {
            Write-Host "== sheet update FAILED == $($_.Exception.Message)"
            Write-Host "   (Has Code.gs been redeployed with the 2026-07-11 update action?)"
        }
    }
} else {
    Write-Host "== no sheets_webhook_url.txt found, skipped sheet sync =="
}
