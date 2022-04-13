#Author: Kyle Davies
#Date Written: April 10th, 2022
#ICT 128 Final Project: 31/40
Function Get-StoppedServices {
    $services = Get-Service | Select-Object -Property Name,Status | Where-Object {$_.Status -eq "Stopped"}
    $services | Format-Table -Property Name,Status -AutoSize 
    <#
    .SYNOPSIS
    Gets list of stopped services
    #>
}