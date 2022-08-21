netsh interface ipv4 show config | findstr "Subnet Prefix"
$wmi = Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter "IPEnabled = 'true' and DHCPEnabled = 'False'" | Where-Object {$_.ipaddress -like '10.225.*'}
$ipaddr = $wmi.IPAddress[0]
$defaultgw = $wmi.DefaultIPGateway
$ifname =  $wmi |% {$_.GetRelated("win32_NetworkAdapter")} | select NetConnectionID |%{$_.NetConnectionID}
netsh interface ip set address $ifname static $ipaddr 255.255.255.255 $defaultgw
