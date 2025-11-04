$Path = "Registry::HKEY_USERS\.DEFAULT\Control Panel\Keyboard"
$Name = "InitialKeyboardIndicators"
$ValueOn = "2"
$ValueOff = "0"

$CurrentValue = (Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue).$Name

if ($CurrentValue -eq $ValueOn) {
    Set-ItemProperty -Path $Path -Name $Name -Value $ValueOff -Type String -Force
} else {
    Set-ItemProperty -Path $Path -Name $Name -Value $ValueOn -Type String -Force
}

