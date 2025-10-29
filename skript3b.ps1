$DriveLetter = "C:"
$NewLabel = "System"

$Volume = Get-CimInstance -ClassName Win32_Volume -Filter "DriveLetter='$DriveLetter'"

if ($Volume) {
    if ($Volume.Label -ne $NewLabel) {
        Set-CimInstance -InputObject $Volume -Property @{Label=$NewLabel}
        
        $NewVolume = Get-CimInstance -ClassName Win32_Volume -Filter "DriveLetter='$DriveLetter'"
    } else {
        "Disk $DriveLetter: již má požadovaný název '$NewLabel'. Přeskakuji přejmenování."
    }
} else {
    "Chyba: Disk s písmenem $DriveLetter: nebyl nalezen."
}



cim only solution

(Get-CimInstance -ClassName Win32_Volume -Filter "DriveLetter='C:'").Label

$Volume = Get-CimInstance -ClassName Win32_Volume -Filter "DriveLetter='C:'"
Set-CimInstance -InputObject $Volume -Property @{Label='System'}
