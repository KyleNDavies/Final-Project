#Author: Kyle Davies
#Date Written: April 5th, 2022
#ICT 128 Final Project: 15/40
Function Set-DFSDrive {
    Param(
        [Parameter(Mandatory=$true)][String]$Path,
        [Parameter(Mandatory=$true)][Int]$SizeGB,
        [Parameter(Mandatory=$true)][String]$VMName
    )
    $SizeGB = $SizeGB * 1GB
    New-VHD -Path $Path -Fixed -SizeBytes $SizeGB
    Add-VMHardDiskDrive -Name $VMName -Path $Path
    <#
    .SYNOPSIS
    Creates a VHD and mounts it to a VM
    .DESCRIPTION
    Creates a fixed size VHD to mount to a VM for use for DFS
    .PARAMETER -Path
    Specifies the path to create the VHD
    .PARAMETER -SizeGB
    Specifies the size of the VHD in GB
    .PARAMETER -VMName
    Specifies the name of the VM to mount the drive to
    .EXAMPLE
    Set-DFSDrive -Path 'E:\VHD\harddrive.vhd' -SizeGB 5 -VMName 'DC01'
    #>
}