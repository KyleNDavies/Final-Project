#Author: Kyle Davies
#Date Written: April 5th, 2022
#ICT 128 Final Project: 14/40
Function Set-DomainComputer {
    Param (
        [Parameter(Mandatory=$true)][String]$DomainName,
        [Parameter(Mandatory=$true)][SecureString]$Credentials,
        [Parameter(Mandatory=$true)][String]$ComputerName
    )
    Add-Computer -DomainName $DomainName -Credential $Credentials
    Rename-Computer -NewName $Name -Restart
    <#
    .SYNOPSIS
    Configures basic PC settings
    .DESCRIPTION
    Configures basic PC settings to join a created domain
    .PARAMETER -DomainName
    Specifies the domain to join
    .PARAMETER -ComputerName
    Specifies computer name
    .PARAMETER -Credentials
    Specifies the credentials that have rights to join domain
    .EXAMPLE
    Set-DomainComputer -DomainName 'Int.Acme.Com' -Credentials 'ACME\Administrator' -ComputerName 'PC01'
    #>
}