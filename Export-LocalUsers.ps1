#Author: Kyle Davies
#Date Written: April 8th, 2022
#ICT 128 Final Project: 24/40
Function Export-LocalUsers {
    Get-LocalUser | Select-Object -Property Name,Enabled | Export-Csv .\localusers.csv -NoTypeInformation
    <#
    .SYNOPSIS
    Gets list of local users and exports to a .csv file
    .OUTPUTS
    Outputs a .csv file containing the list of local users and exports the name and status.
    #>
}