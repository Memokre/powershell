
Get-LocalUser | Where-Object { -not $_.LastLogon } | Select-Object Name, Description, LastLogon


Get-CimInstance -ClassName Win32_UserAccount -Filter "LocalAccount = True" | Where-Object { -not $_.LastLogon } | Select-Object Name, Caption, LocalAccount







Get-LocalUser | Where-Object { $_.AccountIsLockedOut -eq $True } | Select-Object Name, AccountIsLockedOut, LastLogon

Get-CimInstance -ClassName Win32_UserAccount -Filter "Lockout = True AND LocalAccount = True" | Select-Object Name, Caption, Lockout
