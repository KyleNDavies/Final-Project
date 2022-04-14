#Author: Kyle Davies
#Date Written: April 5th, 2022
#ICT 128 Final Project: 13/40
Function Install-DHCP {
    Param(
        [Parameter(Mandatory=$true)][String]$Name,
        [Parameter(Mandatory=$true)][String]$StartRange,
        [Parameter(Mandatory=$true)][String]$EndRange,
        [Parameter(Mandatory=$true)][String]$SubnetMask,
        [Parameter(Mandatory=$true)][String]$DnsServerIP,
        [Parameter(Mandatory=$true)][String]$RouterIP
    )
    Install-WindowsFeature -Name 'DHCP' -IncludeManagementTools
    Add-DhcpServerV4Scope -Name $Name -StartRange $StartRange -EndRange $EndRange -SubnetMask $SubnetMask
    Set-DhcpServerV4OptionValue -DnsServer $DnsServerIP -Router $RouterIP
    Restart-Service dhcpserver
    <#
    .SYNOPSIS
    Installs DHCP on Windows Server
    .DESCRIPTION
    Installs DHCP on Windows Server and creates the IPv4 address scope, as well as IP addresses for a DNS Server and Default Gateway
    .PARAMETER -Name
    Specifies the scope name
    .PARAMETER -StartRange
    IP Address to start the scope
    .PARAMETER -EndRange
    IP Address to end the scope
    .PARAMETER -SubnetMask
    Subnet mask of IP addresses to lease
    .PARAMETER -DnsServerIP
    IP Address of the DNS server to give out
    .PARAMETER -RouterIP
    IP Address of the default gateway to give out
    .EXAMPLE
    Install-DHCP -Name IPv4Scope -StartRange 192.168.0.101 -EndRange 192.168.0.200 -SubnetMask 255.255.255.0 -DnsServerIP 192.168.0.1 -RouterIP 192.168.0.254
    #>
}