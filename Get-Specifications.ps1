#Author: Kyle Davies
#Date Written: April 8th, 2022
#ICT 128 Final Project: 22/40
Function Get-Specifications {
    [String[]]$specifications = Get-WmiObject Win32_VideoController | Select-Object -Property Caption
    $specifications += Get-WmiObject Win32_processor | Select-Object -Property Name
    $specifications += [String](Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum /1gb
    $specifications[2] += "GB of RAM"
    $specifications += Get-WmiObject win32_baseboard | Select-Object -Property Product
    $specifications = $specifications -replace '@{',''
    $specifications = $specifications -replace '}',''
    $specifications = $specifications -replace 'Name=',''
    $specifications = $specifications -replace 'Caption=',''
    $specifications = $specifications -replace 'Product=',''
    $specifications | Format-Table
    <#
    .SYNOPSIS
    Gets the current system specifications
    #>
}