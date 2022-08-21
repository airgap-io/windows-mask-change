$servers = Get-Content servers.txt
$cred = Get-Credential
Foreach ($server in $servers)
{
    Invoke-Command -ComputerName $server -Credential $cred -FilePath c:\subnet.ps1
}
