#Author: Kyle Davies
#Date Written: April 10th, 2022
#ICT 128 Final Project: 30/40
Function Get-RunningServices {
    $services = Get-Service | Select-Object -Property Name,Status | Where-Object {$_.Status -eq "Running"}
    $services | Format-Table -Property Name,Status -AutoSize 
    <#
    .SYNOPSIS
    Gets list of currently running services
    #>
}