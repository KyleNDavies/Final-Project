#Author: Kyle Davies
#Date Written: April 12th, 2022
#ICT 128 Final Project: 39/40
Function Toggle-Firewall {
    Param (
        [Parameter(Mandatory=$true)][String]$toggle
    )
    if ($toggle -eq "on") {
        Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
    } elseif ($toggle -eq "off") {
        Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
    } elseif ($toggle -ne "on" -or "off") {
        Write-Host "Invalid Input: Acceptable inputs are 'on' or 'off'"
    }
    <#
    .SYNOPSIS
    Turns Windows Firewall on or off
    .PARAMETER -toggle
    Determines if firewall gets turned on or off
    .EXAMPLE
    Toggle-Firewall -toggle "on"
    .EXAMPLE
    Toggle-Firewall -toggle "off"
    #>
}