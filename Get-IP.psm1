#Author: Kyle Davies
#Date Written: April 6th, 2022
#ICT 128 Final Project: 18/40
Function Get-IP {
    Get-NetIPAddress -AddressFamily IPv4 | Select-Object -Property IPAddress,InterfaceAlias
    Get-NetIPAddress -AddressFamily IPv6 | Select-Object -Property IPAddress,InterfaceAlias
    <#
    .SYNOPSIS
    Gets the systems IP address
    .DESCRIPTION
    Gets the systems IPv4 and IPv6 addresses
    #>
}