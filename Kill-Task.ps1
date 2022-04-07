#Author: Kyle Davies
#Date Written: April 5th, 2022
#ICT 128 Final Project: 11/40
Function Kill-Task {
    Param(
        [Alias("p")][Parameter(Mandatory=$true)][String]$Process
    )
    $processes = Get-Process
    For($i = 0; $i -le $processes.Length; $i++) {
        if ($processes[$i].Name -match $process) {
            Stop-Process -Id $processes[$i].Id
        }
    }
<#
.SYNOPSIS
KIlls the inputted process
.DESCRIPTION
Kills the inputted process
.PARAMETER -Process
Specifies name of process to kill
.EXAMPLE
Kill-Task "Calculator"
.EXAMPLE
Kill-Task -Process "Calculator"
.EXAMPLE
Kill-Task -p "Calculator"
#>
}