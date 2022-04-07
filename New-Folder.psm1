#Author: Kyle Davies
#Date Written: March 31st, 2022
#ICT 128 Final Project: 6/40
Function New-Folder {
    [Boolean]$done = $false
    [Boolean]$prompt = $false
    $path = ".\"
    while ($done -eq $false) {
        $folder = Read-Host "Enter Folder name"
        New-Item -Path $path -Name $folder -ItemType "directory"
        while ($prompt -eq $false) {
            $askPath = Read-Host "Create folder here, in the newly created folder, in the previous folder, set custom path, or exit? (here/new/previous/custom/list/;)"
            if ($askPath -eq "new") {
                Push-Location ".\$folder"
                $prompt = $true
            } elseif ($askPath -eq "list") {
                Get-ChildItem | Format-Table -Property Name
            } elseif ($askPath -eq "here") {
                $prompt = $true
            } elseif ($askPath -eq "custom") {
                $path = Read-Host "Enter path"
                Push-Location -Path $path
                $prompt = $true
            } elseif ($askPath -eq "previous") {
                Pop-Location
                $path = Get-Location
                $prompt = $true
            } elseif ($askPath -eq ";") {
                $prompt = $true
                $done = $true
                Break
            }
        }
        $prompt = $false
    }
    <#
    .SYNOPSIS
    Creates folders
    .DESCRIPTION
    Creates a user defined folder structure
    .OUTPUTS
    Outputs the set folders
    #>
}