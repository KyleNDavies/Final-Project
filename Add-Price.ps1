#Author: Kyle Davies
#Date Written: April 2nd, 2022
#ICT 128 Final Project: 8/40
Function Add-Price {
    [Decimal]$total = 0
    [Boolean]$stop = $false
    While ($stop -eq $false) {
        [Decimal]$price = Read-Host "Type in amount to add (Enter 0 to stop)"
        $total += $price
        $total
        if ($price -eq 0) {
            Write-Host "Total price: `$$total"
            $stop = $true
            Break
        }
    }
}
<#
.SYNOPSIS
Calculates total price.
.DESCRIPTION
A simple calculator that calculates total user input
.OUTPUTS
Outputs total price
#>