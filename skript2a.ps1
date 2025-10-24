<#
.SYNOPSIS
#>

$markerStart = "#START_CUSTOM_PROFILE_INFO"
$markerEnd = "#END_CUSTOM_PROFILE_INFO"

$contentBlock = @"

$markerStart
Write-Host "Execution Policy: $(Get-ExecutionPolicy)" -ForegroundColor Yellow
Write-Host "Profilepath: $PROFILE" -ForegroundColor Green
$markerEnd
"@

$profilePath = $PROFILE

if (-not (Test-Path $profilePath)) {
    Write-Host "neexistuje profile vytvaram" -ForegroundColor Cyan
    
    $profileDir = Split-Path $profilePath
    if (-not (Test-Path $profileDir)) {
        New-Item -Path $profileDir -ItemType Directory -Force | Out-Null
    }

    Set-Content -Path $profilePath -Value ($contentBlock.TrimStart())
    Write-Host "podarilo sa" -ForegroundColor Green
    Write-Host "Restartujte PowerShell pre nový vizuál"
    return
}

$currentContent = Get-Content -Path $profilePath -Raw

if ($currentContent -match [regex]::Escape($markerStart)) {
    Write-Host "info found" -ForegroundColor Cyan
    
    $regexPattern = "(?s)$([regex]::Escape($markerStart)).*?$([regex]::Escape($markerEnd))\s*"
    $newContent = $currentContent -replace $regexPattern, ''
    
    Set-Content -Path $profilePath -Value $newContent.Trim()
    Write-Host "podarilo sa" -ForegroundColor Yellow
    
} else {
    Write-Host "profil found" -ForegroundColor Cyan
    
    Add-Content -Path $profilePath -Value $contentBlock
    Write-Host "podarilo sa" -ForegroundColor Green
}

Write-Host "Restartujte PowerShell pre nový vizuál"