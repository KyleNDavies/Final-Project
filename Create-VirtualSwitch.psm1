#Author: Kyle Davies
#Date Written: April 7th, 2022
#ICT 128 Final Project: 21/40
Function Create-VirtualSwitch {
    Param (
        [Parameter(Mandatory=$true)][String]$Name,
        [Parameter(Mandatory=$true)][String]$Type
    )
    if ($Type -eq "External") {
        $netAdapter = Get-NetAdapter
        New-VMSwitch -Name $Name -NetAdapterName $netAdapter.Name
    } else {
        New-VMSwitch -Name $Name -SwitchType $Type
    }
    <#
    .SYNOPSIS
    Creates a virtual switch
    .DESCRIPTION
    Creates a new switch by user parameters
    .PARAMETER -Name
    Name of the new switch
    .PARAMETER -Type
    Type of switch (Internal, Private, External)
    .EXAMPLE
    Create-VirtualSwitch -Name "External Switch" -Type External
    .EXAMPLE
    Create-VirtualSwitch -Name "Private Switch" -Type Private
    #>
}