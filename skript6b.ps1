$text = "Kobyla má malý bok"

$normalizedText = $text -replace ' ', '' | ForEach-Object { $_.ToLower() }


$sortedCharacters = $normalizedText.ToCharArray() | Sort-Object


$result = $sortedCharacters -join ''

Write-Output "$text"
Write-Output " $result"

#zoradene podla asciii kodu, neviem ako docieliť to aby 
#sa písmená s diakritikou zaradili správne eg. aá atď
#a nie na koniec
