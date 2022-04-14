#Author: Kyle Davies
#Date Written: April 5th, 2022
#ICT 128 Final Project: 9/40
Function Change-IPAddress {
    $adapters = Get-NetAdapter
    $adapters
    $adapterChoice = Read-Host "Enter which interface (1, 2, 3, etc)"
    $ip = Read-Host "Enter IP address for " + $adapters[$adapterChoice].InterfaceName
    $prefix = Read-Host "Enter prefix length (Ex 24, 30)"
    Set-NetIPAddress -InterfaceIndex $adapter[$adapterChoice].InterfaceIndex -IPAddress $ip -PrefixLength $prefix -AddressFamily IPv4
    <#
    .SYNOPSIS
    Sets IP address for chosen adapter
    .DESCRIPTION
    Changes IPv4 address and subnet mask for specified adapter
    #>
}