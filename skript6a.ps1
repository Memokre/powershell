
$min = 10
$max = 101 

$output = @()

1..10 | ForEach-Object {
    $number = Get-Random -Minimum $min -Maximum $max
    $square = $number * $number

    $output += [PSCustomObject]@{
        Number = $number
        Square = $square
    }
}


Write-Host "Číslo Druhá mocnina"
Write-Host "----- -----------"

$output | ForEach-Object {
       "{0,5} {1,11}" -f $_.Number, $_.Square
}
