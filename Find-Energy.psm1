#Author: Kyle Davies
#Date Written: April 10th, 2022
#ICT 128 Final Project: 28/40
Function Find-Energy {
    Param (
        [Parameter(Mandatory=$true)][Double]$power,
        [Parameter(Mandatory=$true)][Double]$time
    )
    $answer = $power * $time
    $answer
    <#
    .SYNOPSIS
    Calculates energy
    .OUTPUTS
    Calculation result
    .PARAMETER -power
    The power to calculate
    .PARAMETER -time
    The time to calculate
    .EXAMPLE
    Find-Energy -power 5 -time 15
    #>
}