#Author: Kyle Davies
#Date Written: April 8th, 2022
#ICT 128 Final Project: 25/40
Function Export-Processes {
    Get-Service | Select-Object -Property Name,Status | Where-Object {$_.Status -eq 'Running'} | Export-Csv -Path .\RunningServices.csv -NoTypeInformation
    <#
    .SYNOPSIS
    Gets list of running services and exports to a .csv file
    .OUTPUTS
    Outputs a .csv file containing the list of currently running services
    #>
}