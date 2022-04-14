#Author: Kyle Davies
#Date Written: April 7th, 2022
#ICT 128 Final Project: 33/40
Function Start-AllVMS {
    $offVMS = Get-VM | Where-Object {$_.State -eq 'Off'}
    $offVMS | Start-VM
    <#
    .SYNOPSIS
    Starts all turned off VMs.
    .DESCRIPTION
    Turns on all off VMs.
    #>
}