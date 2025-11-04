$Path = "Registry::HKEY_CURRENT_USER\Hrátky s PowerShellem"

if (-not (Test-Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

$Data = @{
    UzivatelskeJmeno  = $env:USERNAME
    JmenoPocitace     = $env:COMPUTERNAME
    AktualniDatum     = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    VerzePowerShellu  = $PSVersionTable.PSVersion.ToString()
}

foreach ($key in $Data.Keys) {
    Set-ItemProperty -Path $Path -Name $key -Value $Data[$key] -Type String -Force
}

$WrittenData = Get-ItemProperty -Path $Path
Write-Host "Data zapsaná v registru: $Path"
Write-Host "----------------------------------------"
Write-Host "Uživatelské jméno: $($WrittenData.UzivatelskeJmeno)"
Write-Host "Jméno počítače:   $($WrittenData.JmenoPocitace)"
Write-Host "Aktuální datum:    $($WrittenData.AktualniDatum)"
Write-Host "Verze PowerShellu: $($WrittenData.VerzePowerShellu)"
