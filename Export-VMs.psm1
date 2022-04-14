#Author: Kyle Davies
#Date Written: April 11th, 2022
#ICT 128 Final Project: 34/40
Function Export-VMs {
    $mem = 0
    $VMS = Get-VM | Select-Object -Property Name,MemoryAssigned,State
    for ($i = 0; $i -le $VMS.Length; $i++) {
        $mem += $VMS[$i].MemoryAssigned
    }
    $memoryUsedTotal = New-Object -Typename psobject
    $memoryUsedTotal | Add-Member -MemberType NoteProperty -name 'Name' -Value 0
    $memoryUsedTotal.Name = $memoryUsedTotal.Name += $mem
    $VMs | Export-Csv -path .\VMS.csv -NoTypeInformation
    $memoryUsedTotal | Select-Object -Property Name | Export-Csv -path .\VMS.csv -NoTypeInformation -Append -Force
    <#
    .SYNOPSIS
    Exports all VMs on the system to a csv document, along with total memory used by running VMs.
    .OUTPUTS
    A csv file, VMS.csv
    #>
}