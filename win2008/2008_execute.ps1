$servers = Get-Content servers.txt
$cred = Get-Credential
Foreach ($server in $servers)
{
    #Set-Item WSMan:\localhost\Client\TrustedHosts -Value $server -Force
    Write-Output "`r`nBefore Modifying Subnet"
    Invoke-Command -ComputerName $server -Credential $cred -ScriptBlock {netsh interface ipv4 show config | findstr "Subnet Prefix"}
    Invoke-Command -ComputerName $server -Credential $cred -InDisconnectedSession -FilePath c:\win2008\2008_subnet.ps1
    sleep 5
    Write-Output "`r`nAfter Modifying Subnet"
    Invoke-Command -ComputerName $server -Credential $cred -ScriptBlock {netsh interface ipv4 show config | findstr "Subnet Prefix"}
}
