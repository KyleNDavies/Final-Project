#Author: Kyle Davies
#Date Written: April 5th, 2022
#ICT 128 Final Project: 10/40
[String[]]$IPAddresses
$adapters = Get-NetAdapter
$adapters
$adapterChoice = Read-Host "Enter which interface (1, 2, 3, etc)"
$numberofAddresses = Read-Host "How much DNS IPs are you setting? (Max 3)"
for($i = 0; $i -le $numberofAddresses; $i++) {
    if ($i -eq 1) {
        $IP = Read-Host "Enter first address"
        $IPAddresses += $IP
    } elseif ($i -eq 2) {
        $IP = Read-Host "Enter second address"
        $IPAddresses += $IP
    } elseif ($i -eq 3) {
        $IP = Read-Host "Enter third address"
        $IPAddresses += $IP
    }
}
if($numberofAddresses -eq 1) {
    Set-DnsClientServerAddress -InterfaceIndex $adapters[$adapterChoice].InterfaceIndex -ServerAddresses ($IPAddresses[0])
}elseif($numberofAddresses -eq 2) {
    Set-DnsClientServerAddress -InterfaceIndex $adapters[$adapterChoice].InterfaceIndex -ServerAddresses ($IPAddresses[0],$IPAddresses[1])
}elseif($numberofAddresses -eq 3) {
    Set-DnsClientServerAddress -InterfaceIndex $adapters[$adapterChoice].InterfaceIndex -ServerAddresses ($IPAddresses[0],$IPAddresses[1],$IPAddresses[2])
}elseif($numberofAddresses -gt 3) {
    Write-Host "Too much IP addresses!"
    Break
}
<#
.SYNOPSIS
Sets DNS addresses for specified interface
.DESCRIPTION
Sets maxiumum of three DNS servers to specified interface
#>