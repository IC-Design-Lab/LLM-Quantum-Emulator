#==============================================================================
# summarize.ps1  --  prints pass-rate, failure_stage, and error_types breakdowns from results.csv
# Usage: .\summarize.ps1  [-Csv path\to\results.csv]
#==============================================================================

param(
    [string]$Csv = (Join-Path $PSScriptRoot "results\results.csv")
)

$rows = @(Import-Csv $Csv)
if ($rows.Count -eq 0) {
    Write-Host "No runs logged yet in $Csv"
    return
}

$total  = $rows.Count
$passed = @($rows | Where-Object { $_.pass_fail -eq "PASS" }).Count

Write-Host "=== Overall ==="
Write-Host ("Total runs: {0}   Pass: {1}   Fail: {2}   Pass rate: {3:P1}" -f `
    $total, $passed, ($total - $passed), ($passed / $total))

Write-Host "`n=== Pass rate per model ==="
$rows | Group-Object model | Sort-Object Name | ForEach-Object {
    $p = @($_.Group | Where-Object { $_.pass_fail -eq "PASS" }).Count
    "{0,-14} {1,3}/{2,-3}  {3:P1}" -f $_.Name, $p, $_.Count, ($p / $_.Count)
}

Write-Host "`n=== Pass rate per prompt variant ==="
$rows | Group-Object prompt_variant | Sort-Object Name | ForEach-Object {
    $p = @($_.Group | Where-Object { $_.pass_fail -eq "PASS" }).Count
    "{0,-14} {1,3}/{2,-3}  {3:P1}" -f $_.Name, $p, $_.Count, ($p / $_.Count)
}

Write-Host "`n=== Pass rate per input format ==="
$rows | Group-Object input_format | Sort-Object Name | ForEach-Object {
    $p = @($_.Group | Where-Object { $_.pass_fail -eq "PASS" }).Count
    "{0,-14} {1,3}/{2,-3}  {3:P1}" -f $_.Name, $p, $_.Count, ($p / $_.Count)
}

$fails = @($rows | Where-Object { $_.pass_fail -eq "FAIL" })

Write-Host "`n=== Failure stage (compile vs functional) ==="
if ($fails.Count -gt 0) {
    $fails | Group-Object failure_stage | Sort-Object Count -Descending | ForEach-Object {
        $label = if ([string]::IsNullOrWhiteSpace($_.Name)) { "(unspecified)" } else { $_.Name }
        "{0,-14} {1}" -f $label, $_.Count
    }
} else {
    Write-Host "(no failures logged)"
}

Write-Host "`n=== Error type counts (failures only; a run can have multiple types) ==="
if ($fails.Count -gt 0) {
    # error_types is a ';'-separated list -- split before tallying so a row tagged
    # "hallucinated_module;wrong_latency" counts toward BOTH buckets, not its own combo bucket.
    $tags = $fails | ForEach-Object {
        $raw = $_.error_types
        if ([string]::IsNullOrWhiteSpace($raw)) { "(untagged)" }
        else { $raw -split ';' | ForEach-Object { $_.Trim() } | Where-Object { $_ } }
    }
    $tags | Group-Object | Sort-Object Count -Descending | ForEach-Object {
        "{0,-24} {1}" -f $_.Name, $_.Count
    }
} else {
    Write-Host "(no failures logged)"
}
