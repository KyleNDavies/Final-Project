#Author: Kyle Davies
#Date Written: March 10th, 2022
#ICT 128 Final Project: 2/40
#Needs the raudzou.csv to function
New-ADOrganizationalUnit -Name "RauDZ" -ProtectedFromAccidentalDeletion $false
import-csv .\raudzou.csv | New-ADOrganizationalUnit -ProtectedFromAccidentalDeletion $false -PassThru
<#
    .SYNOPSIS
    Creates only the Raudz OU structure
    .DESCRIPTION
    Creates only the Raudz OU structure for use in the ICT 127 Case Study
#>