$servers = Get-Content servers.txt
$cred = Get-Credential
Foreach ($server in $servers)
{
    Invoke-Command -ComputerName $server -Credential $cred -FilePath c:\win2012\2012_subnet.ps1
}
