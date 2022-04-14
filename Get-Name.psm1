#Author: Kyle Davies
#Date Written: April 6th, 2022
#ICT 128 Final Project: 16/40
Function Get-Names {
    Invoke-WebRequest -uri https://www.thebump.com/b/most-popular-baby-names -OutFile .\html.html
    [Boolean]$continue = $true
    $html = Get-Content -Path .\html.html | Select-String -Pattern '$'
    $html = $html -replace '<.*?>',''
    $names = $html | Select-String -Pattern '"name":".{3,9}' -CaseSensitive -AllMatches | ForEach-Object {$_.Matches}
    $names = $names -replace '"name":"',''
    $names = $names -replace '","ge',''
    $names = $names -replace '","g',''
    $names = $names -replace '",',''
    $names = $names -replace '"',''
    $number = Get-Random -Minimum 0 -Maximum $names.Length
    $names[$number]
    While($continue -eq $true) {
        $userinput = Read-Host "Get another name? y/n"
        if($userinput -eq "y") {
            $number = Get-Random -Minimum 0 -Maximum $names.Length
            $names[$number]
        }elseif($userinput -eq "n")  {
            $continue = $false
            Break
        }
    }
    <#
    .SYNOPSIS
    Gives random name
    .DESCRIPTION
    Gives random name by scanning in a website with a list of names and filtering the raw HTML code
    #>
}