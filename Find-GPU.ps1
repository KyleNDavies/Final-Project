#Author: Kyle Davies
#Date Written: April 1st, 2022
#ICT 128 Final Project: 7/40
Function Find-GPU {
    Invoke-WebRequest -uri https://www.evga.com/products/productlist.aspx?type=0 -OutFile .\html.html
    $html = Get-Content -Path .\html.html | Select-String -Pattern '$'
    $html = $html -replace '<.*?>',''
    $cards = $html | Select-String -Pattern 'EVGA GeForce.{8,13}','\$\d.{4,6}' -CaseSensitive -AllMatches | ForEach-Object {$_.Matches}
    $cards = $cards | Select-Object -Property @{Name="GPUs/Prices";Expression={$_.Value}}
    $cards | Format-Table -Property "GPUS/Prices" -AutoSize
    <#
    .SYNOPSIS
    Outputs live GPU prices from the offical website
    .DESCRIPTION
    Takes the HTML code from EVGAs official store, formats it, and presents it to the user.
    .OUTPUTS
    List of GPUs and prices
    #>
}