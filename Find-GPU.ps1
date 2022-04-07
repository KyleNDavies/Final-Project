#Author: Kyle Davies
#Date Written: April 1st, 2022
#ICT 128 Final Project: ?/40
Function Find-GPU {
    Param(
        [String]$GPU
    )
    Invoke-WebRequest -uri https://www.evga.com/products/productlist.aspx?type=0 -OutFile .\html.html
    $html = Get-Content -Path .\html.html | Select-String -Pattern '$'
    $html = $html -replace '<.*?>',''
    $cards = $html | Select-String -Pattern 'EVGA GeForce.{8,13}','\$\d.{4,6}','Out of Stock' -CaseSensitive -AllMatches | ForEach-Object {$_.Matches}
    For ($i = 0; $i -le $cards.Length; $i++) {
        if($GPU -eq $cards[$i]) {
            Write-Host $cards[$i] + $cards[$i + 1] + $cards[$i + 2]
        }
    }
}