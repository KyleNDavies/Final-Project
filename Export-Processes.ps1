#Author: Kyle Davies
#Date Written: April 8th, 2022
#ICT 128 Final Project: 23/40
Function Export-Processes {
    Get-Process | Select-Object -Property ProcessName,ID | Export-Csv -Path .\RunningProcesses.csv -NoTypeInformation
    <#
    .SYNOPSIS
    Gets list of running processes and exports to a .csv file
    .OUTPUTS
    Outputs a .csv file containing the list of currently running processes and their IDS
    #>
}