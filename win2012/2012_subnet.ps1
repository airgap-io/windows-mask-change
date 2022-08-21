Write-Output "`r`nBefore Modifying Subnet"
Get-NetIPAddress | ?{ $_.AddressFamily -eq "IPv4" -and ($_.IPAddress -match "10.225")} | Select-Object IPAddress, PrefixLength
$Interface = Get-NetIPAddress | ?{ $_.AddressFamily -eq "IPv4" -and ($_.IPAddress -match "10.225")}
$IfIndex = $Interface.InterfaceIndex
Set-NetIPAddress -InterfaceIndex "$IfIndex" -PrefixLength 32
Write-Output "`r`nAfter Modifying Subnet`r`n"
Get-NetIPAddress | ?{ $_.AddressFamily -eq "IPv4" -and ($_.IPAddress -match "10.225")} | Select-Object IPAddress, PrefixLength
