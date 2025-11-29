
$checkInterval = 10
$lastClipboard = "" 


$reg_Structure = '(?i)\b([a-zA-Z0-9_]+)\s*[:=]\s*["'']?((?=.*[\d\W])[a-zA-Z0-9_\-\.!@#$%^&*]{6,100})["'']?'

$reg_Keys      = '(sk-[a-zA-Z0-9]{10,}|ghp_[a-zA-Z0-9]{10,}|eyJ[a-zA-Z0-9\-_]+\.[a-zA-Z0-9\-_]+\.[a-zA-Z0-9\-_]+)'

$reg_IP        = '\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b'

Clear-Host
Write-Host "Monitoring clipboard for STRUCTURES (Label: Secret)..." -ForegroundColor Green

while ($true) {
    try {
        $raw = Get-Clipboard -Raw
        if ($null -eq $raw) { $content = "" } else { $content = $raw.Trim() }
    } catch { $content = "" }

    if ($content -ne $lastClipboard) {
        $lastClipboard = $content
        
        if ($content.Length -gt 0) {
            $detectedTypes = @()
            $displayOutput = $content
            $foundSomething = $false

            if ($content -match $reg_IP) {
                $foundSomething = $true
                $detectedTypes += "`e[36mIP Address`e[0m"
                $matches = [regex]::Matches($content, $reg_IP)
                foreach ($m in $matches) { 
                    $displayOutput = $displayOutput.Replace($m.Value, "`e[36m$($m.Value)`e[0m") 
                }
            }

            if ($content -match $reg_Keys) {
                $foundSomething = $true
                $detectedTypes += "`e[95mAPI Token`e[0m"
                $matches = [regex]::Matches($content, $reg_Keys)
                foreach ($m in $matches) { 
                    $displayOutput = $displayOutput.Replace($m.Value, "`e[95m$($m.Value)`e[0m") 
                }
            }

            if ($content -match $reg_Structure) {
                $foundSomething = $true
                $detectedTypes += "`e[91mFound Secret`e[0m"
                $matches = [regex]::Matches($content, $reg_Structure)
                
                foreach ($m in $matches) {
                    $fullMatch = $m.Value
                    $labelName = $m.Groups[1].Value
                    $secretVal = $m.Groups[2].Value
                    

                    $coloredVersion = $fullMatch -replace $labelName, "`e[36m$labelName`e[0m"
                    $coloredVersion = $coloredVersion -replace [regex]::Escape($secretVal), "`e[91m$secretVal`e[0m"
                    
                    $displayOutput = $displayOutput.Replace($fullMatch, $coloredVersion)
                }
            }

            if ($foundSomething) {
                $timestamp = Get-Date -Format "HH:mm:ss"
                $typesString = ($detectedTypes | Select-Object -Unique) -join ", "
                Write-Host "$timestamp / $typesString / :"
                Write-Host "$displayOutput`n"
            }
        }
    } else {
        Write-Host "clipboard not changed" -ForegroundColor DarkGray
    }

    Start-Sleep -Seconds $checkInterval
}
