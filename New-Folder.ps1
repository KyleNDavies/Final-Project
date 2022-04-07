#Author: Kyle Davies
#Date Written: March 31st, 2022
#ICT 128 Final Project: 6/40
Function New-Folder {
    [Boolean]$done = $false
    [Boolean]$prompt = $false
    $path = ".\"
    #$previousFolder = " "
    while ($done -eq $false) {
        $folder = Read-Host "Folder name"
        New-Item -Path $path -Name $folder -ItemType "directory"
        while ($prompt -eq $false) {
            $askPath = Read-Host "Create folder here or in the new folder? (here/new/list)"
            if ($askPath -eq "new") {
                $path = ".\$folder"
                #$previousFolder = $folder
                $prompt = $true
            } elseif ($askPath -eq "list") {
                Get-ChildItem
            } elseif ($askPath -eq "here") {
                $prompt = $true
            }
        }
    }
}