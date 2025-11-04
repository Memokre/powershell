function Show-DirectoryBrowser {
    
    while ($true) {
        try {
            $currentPath = Get-Location
            Clear-Host
            Write-Host "--- Explorer 2000 idk ---" -ForegroundColor Yellow
            Write-Host "Aktuální adresář: $($currentPath.Path)"
            Write-Host "---------------------------------"

            # Získání souborů a statistik
            $files = Get-ChildItem -Path $currentPath.Path -File -ErrorAction SilentlyContinue
            $totalFiles = $files.Count
            
            Write-Host "Počet souborů: $totalFiles"

            if ($totalFiles -gt 0) {
                try {
                    $sortedFiles = $files | Sort-Object Length
                    $smallestFile = $sortedFiles[0]
                    $largestFile = $sortedFiles[-1]
                    Write-Host "Nejmenší soubor: $($smallestFile.Name) ($($smallestFile.Length) bytes)"
                    Write-Host "Největší soubor: $($largestFile.Name) ($($largestFile.Length) bytes)"
                } catch {
                    Write-Host "Nelze analyzovat soubory (možná chybí oprávnění)."
                }
            } else {
                Write-Host "Nejmenší soubor: N/A"
                Write-Host "Největší soubor: N/A"
            }
            
            Write-Host "---------------------------------"
            
            # Získání podadresářů
            $subdirs = Get-ChildItem -Path $currentPath.Path -Directory -ErrorAction SilentlyContinue
            
            if ($subdirs.Count -gt 0) {
                Write-Host "Podadresáře:"
                for ($i = 0; $i -lt $subdirs.Count; $i++) {
                    Write-Host "  [$($i+1)] $($subdirs[$i].Name)"
                }
            } else {
                Write-Host "Žádné podadresáře."
            }
        } catch {
            Write-Host "Došlo k chybě při čtení adresáře: $($_.Exception.Message)"
            Write-Host "Stiskněte Enter pro návrat o úroveň výš."
            Read-Host
            Set-Location -Path ".."
            continue
        }
        
        Write-Host "---------------------------------"
        Write-Host "[U] O úroveň výš"
        Write-Host "[Q] Ukončit"
        Write-Host "---------------------------------"

        $input = Read-Host "Zvolte možnost"

        switch ($input.ToLower()) {
            'q' {
                break
            }
            'u' {
                try {
                    Set-Location -Path ".." -ErrorAction Stop
                } catch {
                    Write-Host "Nelze přejít o úroveň výš. Stiskněte Enter."
                    Read-Host
                }
            }
            default {
                if ([int]::TryParse($input, [ref]$null)) {
                    $index = [int]$input - 1
                    if ($index -ge 0 -and $index -lt $subdirs.Count) {
                        try {
                            Set-Location -Path $subdirs[$index].FullName -ErrorAction Stop
                        } catch {
                            Write-Host "Do adresáře nelze vstoupit (oprávnění?). Stiskněte Enter."
                            Read-Host
                        }
                    } else {
                        Write-Host "Neplatná volba. Stiskněte Enter."
                        Read-Host
                    }
                } else {
                    Write-Host "Neplatná volba. Stiskněte Enter."
                    Read-Host
                }
            }
        }
    }
    Clear-Host
    Write-Host "Průzkumník ukončen."
}

Show-DirectoryBrowser
