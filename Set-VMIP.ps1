#Author: Kyle Davies
#Date Written: April 7th, 2022
#ICT 128 Final Project: 20/40
Function Set-VMIP {
    Param (
        [Parameter(Mandatory=$true)][String]$IP,
        [Parameter(Mandatory=$true)][String]$VMName,
        [String]$IP2,
        [String]$VMName2,
        [String]$IP3,
        [String]$VMName3
    )
    Enable-PSRemoting
    $adapters = Get-NetAdapter
    if($IP2 -eq '' -and $IP3 -eq '') {
        Enter-PSSession -VMName $VMName
        $adapters = Get-NetAdapter
        Set-NetIPAddress -InterfaceIndex $adapters[0].InterfaceIndex -IPAddress $IP -PrefixLength 24 -AddressFamily IPv4
        Exit-PSSession
    } elseif ($IP2 -ne '' -and $IP3 -eq '') {
        Enter-PSSession -VMName $VMName
        $adapters = Get-NetAdapter
        Set-NetIPAddress -InterfaceIndex $adapters[0].InterfaceIndex -IPAddress $IP -PrefixLength 24 -AddressFamily IPv4
        Exit-PSSession

        Enter-PSSession -VMName $VMName2
        $adapters = Get-NetAdapter
        Set-NetIPAddress -InterfaceIndex $adapters[0].InterfaceIndex -IPAddress $IP2 -PrefixLength 24 -AddressFamily IPv4
        Exit-PSSession
    } elseif ($IP2 -ne '' -and $IP3 -ne '') {
        Enter-PSSession -VMName $VMName
        $adapters = Get-NetAdapter
        Set-NetIPAddress -InterfaceIndex $adapters[0].InterfaceIndex -IPAddress $IP -PrefixLength 24 -AddressFamily IPv4
        Exit-PSSession

        Enter-PSSession -VMName $VMName2
        $adapters = Get-NetAdapter
        Set-NetIPAddress -InterfaceIndex $adapters[0].InterfaceIndex -IPAddress $IP2 -PrefixLength 24 -AddressFamily IPv4
        Exit-PSSession

        Enter-PSSession -VMName $VMName3
        $adapters = Get-NetAdapter
        Set-NetIPAddress -InterfaceIndex $adapters[0].InterfaceIndex -IPAddress $IP3 -PrefixLength 24 -AddressFamily IPv4
        Exit-PSSession
    } elseif ($IP2 -eq '' -and $IP3 -ne '') {
        $IP2 = $IP3
        Enter-PSSession -VMName $VMName
        $adapters = Get-NetAdapter
        Set-NetIPAddress -InterfaceIndex $adapters[0].InterfaceIndex -IPAddress $IP -PrefixLength 24 -AddressFamily IPv4
        Exit-PSSession

        Enter-PSSession -VMName $VMName2
        $adapters = Get-NetAdapter
        Set-NetIPAddress -InterfaceIndex $adapters[0].InterfaceIndex -IPAddress $IP2 -PrefixLength 24 -AddressFamily IPv4
    }
    <#
    .SYNOPSIS
    Changes virtual machine IP addresses.
    .DESCRIPTION
    Changes virtual machine IPv4 addresses to the specified IP address
    .PARAMETER -IP1
    IP for first VM 
    .PARAMETER -VMName
    Name of first VM
    .PARAMETER -IP2
    IP for second VM
    .PARAMETER -VMName2
    Name of second VM
    .PARAMETER -IP3
    IP for third VM
    .PARAMETER -VMName3
    Name of third VM
    .EXAMPLE
    Set-VMIP -IP 192.168.0.1 -VMName "VM1"
    .EXAMPLE
    Set-VMIP -IP 192.168.0.1 -VMName "VM1" -IP2 192.168.0.2 -VMName2 "VM2"
    .EXAMPLE
    Set-VMIP -IP 192.168.0.1 -VMName "VM1" -IP2 192.168.0.2 -VMName2 "VM2" -IP3 192.168.0.3 -VMName3 "VM3"
    #>
}