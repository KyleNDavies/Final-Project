#Author: Kyle Davies
#Date: March 16th, 2022
#ICT 128 Final Project: 1/40
function Add-People
{
    [Boolean]$continue = $True
    $add = @()
    while($continue -eq $True) {
        $name = Read-Host "Enter name"
        $age = Read-Host "Enter age"
        $data = New-Object PSObject -Property @{
            Age = $age
            Name = $name
        }
        $add += $data
        $prompt = Read-Host "Add more? Y/N"
        if($prompt -eq 'N') {
            $add | Export-Csv .\people.csv -NoTypeInformation
            $continue = $False
            break
        }
    }
    <#
    .SYNOPSIS
    Takes in a name and an age and exports to a .csv file
    .DESCRIPTION
    Takes in a name and an age until specified otherwise, and exports the data to a .csv file
    .OUTPUTS
    Outputs a .csv file
    #>
}