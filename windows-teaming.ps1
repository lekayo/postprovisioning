﻿Set-ExecutionPolicy -ExecutionPolicy Unrestricted  -Scope process -Force
$publicname = Get-NetConnectionProfile -IPv4Connectivity Internet -ErrorAction SilentlyContinue
$privatename = get-NetIPAddress -ipaddress 10*
#get IP and subnet
$public = get-NetIPAddress -InterfaceAlias $publicname.InterfaceAlias -AddressFamily IPv4
#find Gateway
$gateway = Get-WmiObject -Class Win32_IP4RouteTable | where { $_.destination -eq '0.0.0.0' -and $_.mask -eq '0.0.0.0'} | Sort-Object metric1 | select nexthop
#create teamed nic
new-netlbfoteam -Name "PublicTeamed" -TeamMembers "PublicNetwork-A","PublicNetwork-B" -TeamingMode SwitchIndependent -Confirm:$false
Start-Sleep -s 20
#set public ip/subnet/gateway
New-netIPAddress -InterfaceAlias "PublicTeamed" -IPAddress $public.IPAddress -Prefixlength $public.PrefixLength -DefaultGateway $gateway.nexthop
Set-DnsClientServerAddress -InterfaceAlias "PublicTeamed" -ServerAddresses ("10.0.80.11","10.0.80.12")

#create new private team
new-netlbfoteam -Name "PrivateTeamed" -TeamMembers "PrivateNetwork-A","PrivateNetwork-B" -TeamingMode SwitchIndependent -Confirm:$false
Start-Sleep -s 20
New-netIPAddress -InterfaceAlias "PrivateTeamed" -IPAddress $privatename.IPAddress -Prefixlength $privatename.PrefixLength 
Set-DnsClientServerAddress -InterfaceAlias "PrivateTeamed" -ServerAddresses ("10.0.80.11","10.0.80.12")
