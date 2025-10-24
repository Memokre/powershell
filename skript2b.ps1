Write-Host "alias creation"
New-Alias -Name np -Value notepad.exe
New-Alias -Name ct -Value control.exe
Get-Alias -Name np, ct


Write-Host "export aliasov"
Get-Alias -Name np, ct | ConvertTo-Json | Out-File -FilePath .\aliases.json
Get-Content .\aliases.json


Write-Host "delete aliasov"
Remove-Alias -Name np, ct
Write-Host "ak chyba tak ok, pretože neexistuju"
Get-Alias -Name np, ct

Write-Host "obnova aliasov"
Get-Content -Raw -Path .\aliases.json | ConvertFrom-Json | ForEach-Object {
    New-Alias -Name $_.Name -Value $_.Definition
}

Write-Host "final check"
Get-Alias -Name np, ct