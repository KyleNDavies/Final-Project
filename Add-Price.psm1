#Author: Kyle Davies
#Date Written: March 16th, 2022
#ICT 128 Final Project: 8/40
Add-Price {
    [Int64]$total = 0
    [Boolean]$stop = $false
    While ($stop -eq $false) {
        [Int64]$price = Read-Host "Type in amount to add (Enter 0 to stop)"
        $total += $price
        $total
        if ($price -eq 0) {
            Write-Host "Total money: $total"
            $stop = $true
            Break
        }
    }
}