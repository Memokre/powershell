function Test-IsPalindrome {
    param(
        [Parameter(Mandatory=$true)]
        [int]$Number
    )

    $string = "$Number"
    $reversedString = $string[-1..-($string.Length)] -join ''
    return $string -eq $reversedString
}


$minFactor = 100
$maxFactor = 999

$largestPalindrome = 0
$largestFactors = @()
$smallestPalindrome = 999 * 999 # Inicializace s maximálním možným součinem
$smallestFactors = @()



for ($i = $maxFactor; $i -ge $minFactor; $i--) {
    for ($j = $i; $j -ge $minFactor; $j--) {
        $product = $i * $j
            if ($product -lt $largestPalindrome) {
            break
        }
        
   
        if (Test-IsPalindrome -Number $product) {
            

            if ($product -gt $largestPalindrome) {
                $largestPalindrome = $product
                $largestFactors = "$i x $j"
            }
  
            if ($product -lt $smallestPalindrome) {
                $smallestPalindrome = $product
                $smallestFactors = "$i x $j"
            }
        }
    }
}

Write-Host "Největší palindrom:"
Write-Host "   Palindrom: $($largestPalindrome)"
Write-Host "   Vznikl násobením: $($largestFactors)"
Write-Host ""
Write-Host "Nejmenší palindrom:"
Write-Host "   Palindrom: $($smallestPalindrome)"
Write-Host "   Vznikl násobením: $($smallestFactors)"
