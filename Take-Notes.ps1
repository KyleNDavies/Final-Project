#Author: Kyle Davies
#Date Written: March 31st, 2022
#ICT 128 Final Project: 5/40
$text = Read-Host "Input text"
$text | Out-File .\notes.txt
<#
    .SYNOPSIS
    Writes specified text
    .OUTPUTS
    Outputs a .txt file named notes
#>