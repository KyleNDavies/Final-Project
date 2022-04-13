#Author: Kyle Davies
#Date Written: April 11th, 2022
#ICT 128 Final Project: 35/40
Function Remove-Program {
    Param(
        [Parameter(Mandatory=$true)][String]$app
    )
    $applications = Get-Package -Provider Programs
    [String[]]$placeholder = Get-Package -Provider Programs | Select-Object -Property Name
    $placeholder = $placeholder -replace '@{Name=',''
    $placeholder = $placeholder -replace '}',''
    $placeholder = $placeholder -replace '[0-9]',''
    $placeholder = $placeholder -replace "\.\.\.",''
    $placeholder = $placeholder -replace "\.\.",''
    $placeholder = $placeholder -replace "\.",''
    For($i = 0; $i -le $applications.Length; $i++) {
        $placeholder[$i]
        if ($placeholder[$i] -match $app) {
            Uninstall-Package -Name $applications[$i].Name
            Break
        }
    }
}