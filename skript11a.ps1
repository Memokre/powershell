param (
    [string]$Url,
    [int]$L
)

if ([string]::IsNullOrWhiteSpace($Url) -or $L -eq 0) {
    Write-Host "Nápoveda (Help):"
    Write-Host "----------------"
    Write-Host "Popis: Skript extrahuje všetky jedinečné slová o stanovenej dĺžke z webovej stránky."
    Write-Host "Použitie: .\skript11a.ps1 -Url <WebovaStranka> -L <PocetZnakov>"
    Write-Host "Príklad: .\skript11a.ps1 -Url 'https://www.example.com' -L 5"
    Write-Host "Príklad: .\skript11a.ps1 -Url 'www.denik.cz' -L 5"
    exit
}

try {
    $response = Invoke-WebRequest -Uri $Url -ErrorAction Stop
    $content = $response.Content

    $content = $content -replace '(?s)<script.*?</script>', ''
    $content = $content -replace '(?s)<style.*?</style>', ''

    $cleanText = $content -replace '<[^>]+>', ' '
    
    $decodedText = [System.Net.WebUtility]::HtmlDecode($cleanText)

    $words = $decodedText -split '\W+' | Where-Object { $_.Length -eq $L } | Select-Object -Unique | Sort-Object

    $words
}
catch {
    Write-Error "Nastala chyba pri sťahovaní URL: $_"
}
