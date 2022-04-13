#Author: Kyle Davies
#Date Written: April 10th, 2022
#ICT 128 Final Project: 32/40
Function Set-VirtualSwitch {
    Param (
        [Parameter(Mandatory=$true)][String]$Name,
        [String]$Type,
        [String]$adapter
    )
    if ($Type -eq "External") {
        if ($adapter -eq '') {
            Write-Host "ERROR: If editing an external switch you MUST specify which network adapter to use with the -adapter parameter."
            Break
        }
        Set-VMSwitch -Name $Name -NetAdapterName $adapter
    } else {
        Set-VMSwitch -Name $Name -SwitchType $Type
    }
    <#
    .SYNOPSIS
    Edits a virtual switch
    .PARAMETER -Name
    Name of the switch to edit
    .PARAMETER -Type
    Type of switch to change to (Internal, Private, External)
    .EXAMPLE
    Set-VirtualSwitch -Name "Virtual Switch" -Type External -adapter "Ethernet 2"
    .EXAMPLE
    Set-VirtualSwitch -Name "Virtual Switch" -Type Private
    #>
}