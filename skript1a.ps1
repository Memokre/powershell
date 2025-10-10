$Days = 10
$LogName = 'System'
$StartDate = (Get-Date).AddDays(-$Days)
$QueryRange = "last $Days days (since $($StartDate.ToString('yyyy-MM-dd HH:mm:ss')))"
$LevelError = 2 
$LevelWarning = 3 

# 1. Search for Error events (Level 2)
$ErrorFilter = @{ LogName = $LogName; StartTime = $StartDate; Level = $LevelError }
Write-Host "Searching for 'Error' events in the '$LogName' log from the $QueryRange..." -ForegroundColor Cyan

$Events = try {
    Get-WinEvent -FilterHashtable $ErrorFilter -ErrorAction Stop
} catch {
    Write-Error "Could not read the event log: $($_.Exception.Message)"
    exit 1
}

if ($Events) {
    Write-Host "`n[ RESULT: ERROR ] Found $($Events.Count) event(s):" -ForegroundColor Red
    $Events | Select-Object TimeCreated, Id, LevelDisplayName, ProviderName, @{N='Message'; E={$_.Message.Split("`n")[0].Trim()}} | Format-Table -Wrap
}
else {
    Write-Host "`n[ INFO ] No Error events found. Searching for 'Warning' events instead..." -ForegroundColor Yellow
    
    # 2. If no Errors, check for Warning events (Level 3)
    $WarningFilter = @{ LogName = $LogName; StartTime = $StartDate; Level = $LevelWarning }
    $Events = try {
        Get-WinEvent -FilterHashtable $WarningFilter -ErrorAction Stop
    } catch {
        Write-Error "Could not read the event log: $($_.Exception.Message)"
        exit 1
    }

    if ($Events) {
        Write-Host "`n[ RESULT: WARNING ] Found $($Events.Count) event(s):" -ForegroundColor Yellow
        $Events | Select-Object TimeCreated, Id, LevelDisplayName, ProviderName, @{N='Message'; E={$_.Message.Split("`n")[0].Trim()}} | Format-Table -Wrap
    }
    else {
        Write-Host "`n[ RESULT ] No Error or Warning events found in the '$LogName' log in the $QueryRange." -ForegroundColor Green
    }
}
