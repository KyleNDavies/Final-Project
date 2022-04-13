#Author: Kyle Davies
#Date Written: April 12th, 2022
#ICT 128 Final Project: 37/40
Function Get-SteamGames {
    Param (
        [String]$name = "*",
        [String]$path = "C:\Program Files (x86)\Steam\steamapps\common"
    )
    $games = Get-ChildItem -Path $path | Select-Object -Property Name
    if ($name -ne "*") {
        for ($i = 0; $i -le $games.Length; $i++) {
            if ($games[$i].Name -match $name) {
                $games[$i]
            }
        }
    } else {
        Get-ChildItem -Path $path | Select-Object -Property Name
    }
    <#
    .SYNOPSIS
    Gets list of installed Steam games.
    .PARAMETER -name
    Specifies the name of the game to filter for. If not specified it displays all games in the directory
    .PARAMETER -path
    Specifies path to search/display. If not specified it lists all games in the C:\ Steam directory
    .EXAMPLE
    Get-SteamGames -name "Half-Life"
    .EXAMPLE
    Get-SteamGames -path "D:\SteamLibrary\steamapps\common"
    .EXAMPLE
    Get-SteamGames -name "Half-Life" -path "D:\SteamLibrary\steamapps\common"
    #>
}