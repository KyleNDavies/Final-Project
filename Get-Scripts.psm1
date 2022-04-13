#Author: Kyle Davies
#Date Written: April 12th, 2022
#ICT 128 Final Project: 36/40
Function Get-Scripts {
    Param (
        [String]$name = "*",
        [String]$path = ".\"
    )
    $scripts = Get-ChildItem -Path $path | Select-Object -Property Name,LastWriteTime | Where-Object {$_.Name -match ".ps1"}
    if ($name -ne "*") {
        for ($i = 0; $i -le $scripts.Length; $i++) {
            if ($scripts[$i].Name -match $name) {
                $scripts[$i]
            }
        }
    } else {
        Get-ChildItem -Path $path | Select-Object -Property Name,LastWriteTime | Where-Object {$_.Name -match ".ps1"}
    }
    <#
    .SYNOPSIS
    Gets list of scripts.
    .PARAMETER -name
    Specifies the name of the script to display. If not specified it displays all .ps1 files in the directory
    .PARAMETER -path
    Specifies path to search/display. If not specified it lists .ps1 files in the current directory
    .EXAMPLE
    Get-Scripts -name "Kill-Task.ps1"
    .EXAMPLE
    Get-Scripts -path "A:\Scripts"
    .EXAMPLE
    Get-Scripts -name "Kill-Task.ps1" -path "A:\Scripts"
    #>
}