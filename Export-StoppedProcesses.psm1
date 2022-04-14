#Author: Kyle Davies
#Date Written: April 10th, 2022
#ICT 128 Final Project: 29/40
Get-Service | Select-Object -Property Name,Status | Where-Object {$_.Status -eq 'Stopped'} | Export-Csv -Path .\StoppedServices.csv -NoTypeInformation
    <#
    .SYNOPSIS
    Gets list of stopped services and exports to a .csv file
    .OUTPUTS
    Outputs a .csv file containing the list of stopped services
    #>