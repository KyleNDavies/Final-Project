#Author: Kyle Davies
#Date Written: March 11th, 2022
#ICT 128 Final Project: 3/40
#Needs raudzusers.csv to function
$password = ConvertTo-SecureString "Raudz2022!" -AsPlainText -Force
Import-Csv .\raudzusers.csv | New-ADUser -AccountPassword $password -Enabled $true -PasswordNeverExpires $true -PassThru
<#
    .SYNOPSIS
    Creates only the Raudz AD users
    .DESCRIPTION
    Creates only the Raudz AD users for use in the ICT 127 Lab Case Study
#>