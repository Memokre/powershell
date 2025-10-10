$hexString = "506f7765725368656c6c2069732077657273746f66656221"

$asciiString = for ($i = 0; $i -lt $hexString.Length; $i += 2) {
    # Get the two-character hex chunk (e.g., "50")
    $hexByte = $hexString.Substring($i, 2)
    
    # Convert hex to an integer, then cast the integer to an ASCII character
    [char][int]::Parse($hexByte, 'HexNumber')
}

# The array of characters is joined back into a single string.
$result = -join $asciiString

Write-Host "Original Hex: $hexString"
Write-Host "Converted ASCII: $result"
