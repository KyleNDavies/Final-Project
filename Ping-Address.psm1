#Author: Kyle Davies
#Date Written: April 6th, 2022
#ICT 128 Final Project: 17/40
Function Ping-Address {
    Param (
        [Parameter(Mandatory=$true)][String]$IP,
        [String]$IP2,
        [String]$IP3
    )
    if ($IP2 -eq '' -and $IP3 -eq '') {
        Test-Connection -ComputerName $IP
    } elseif ($IP2 -ne '' -and $IP3 -eq '') {
        Test-Connection -ComputerName $IP,$IP2
    } elseif($IP2 -eq '' -and $IP3 -ne '') {
        $IP2 = $IP3
        Test-Connection -ComputerName $IP,$IP2
    } elseif($IP2 -ne '' -and $IP3 -ne '') {
        Test-Connection -ComputerName $IP,$IP2,$IP3
    }
    <#
    .SYNOPSIS
    Pings specified address(es)
    .DESCRIPTION
    Pings the specified IPv4 addresses, up to 3
    .PARAMETER -IP
    First IP, mandatory
    .PARAMETER -IP2
    Second IP
    .PARAMETER -IP3
    Third IP
    #>
}