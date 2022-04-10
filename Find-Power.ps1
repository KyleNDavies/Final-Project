#Author: Kyle Davies
#Date Written: April 10th, 2022
#ICT 128 Final Project: 27/40
Function Find-Power {
    Param (
        [Parameter(Mandatory=$true)][Double]$voltage,
        [Parameter(Mandatory=$true)][Double]$current
    )
    $answer = $voltage * $current
    $answer
    <#
    .SYNOPSIS
    Calculates voltage
    .OUTPUTS
    Calculation result
    .PARAMETER -current
    The current to calculate
    .PARAMETER -voltage
    The voltage to calculate
    .EXAMPLE
    Find-Power -current 0.55 -voltage 15
    #>
}