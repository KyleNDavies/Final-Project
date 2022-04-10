#Author: Kyle Davies
#Date Written: April 7th, 2022
#ICT 128 Final Project: 19/40
Function Stop-AllVMS {
    $runningVMS = Get-VM | Where-Object {$_.State -eq 'Running'}
    $runningVMS | Stop-VM
    <#
    .SYNOPSIS
    Stops all running VMs.
    .DESCRIPTION
    Turns off all running VMs, not gracefully.
    #>
}