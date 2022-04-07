#Author: Kyle Davies
#Date Written: April 5th, 2022
#ICT 128 Final Project: 12/40
Function Install-ADDS {
    Param(
        [Parameter(Mandatory=$true)][String]$Fqdn,
        [String]$Netbios
    )
    Add-WindowsFeature AD-Domain-Services
    Install-ADDSForest -DomainName $fqdn -DomainNetbiosName $netbios -InstallDNS
    <#
    .SYNOPSIS
    Installs Active Directory Domain Services on Windows Server
    .DESCRIPTION
    Installs Active Directory Domain Services on Windows Server and creates the Fully-Qualified Domain Name
    .PARAMETER -Fqdn
    Specifies the FQDN to create
    .PARAMETER -Netbios
    Specifies the NetBios of the domain. If not specified, it defaults to the first portion of the FQDN
    .EXAMPLE
    Install-ADDS -Fqdn 'Int.Acme.Com' -Netbios 'ACME'
    #>
}
