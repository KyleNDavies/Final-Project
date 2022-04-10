#Author: Kyle Davies
#Date Written: April 10th, 2022
#ICT 128 Final Project: 26/40
Function Find-OhmsLaw {
    Param (
        [double]$current,
        [double]$resistance,
        [double]$voltage
    )
    [double]$answer = 0
    if($current -eq 0) {
        $answer = $voltage / $resistance
        $answer
        Break
    } elseif ($resistance -eq 0) {
        $answer = $voltage / $current
        $answer
        Break
    }elseif ($voltage -eq 0) {
        $answer = $resistance * $current
        $answer
        Break
    }
    <#
    .SYNOPSIS
    Calculates Ohms Law
    .OUTPUTS
    Calculation result
    .PARAMETER -current
    The current to calculate
    .PARAMETER -resistance
    The resistance to calculate
    .PARAMETER -voltage
    The voltage to calculate
    .EXAMPLE
    Find-OhmsLaw -current 0.55 -voltage 15
    .EXAMPLE
    Find-OhmsLaw -resistance 2 -voltage 15
    #>
}