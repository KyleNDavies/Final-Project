#Author: Kyle Davies
#Date Written: March 31st, 2022
#ICT 128 Final Project: 4/40
Function New-Virtual-Machine {
    $vmName = Read-Host "Enter VM name"
    [Int64]$vmRAM = Read-Host "Enter allocated RAM in MB"
    $vmRAM = 1MB * $vmRAM
    $vmExistingVHDPrompt = Read-Host "Do you want to use an existing VHD (Differencing VHDX)? yes/no"

    if ($vmExistingVHDPrompt -eq "yes") {
        $vmVHDPath = Read-Host "Enter path to differencing VHDX"
    } elseif ($vmExistingVHDPrompt -eq "no") {
        $vmNewVHDPath = Read-Host "Enter exact path to create VHD, including name and file extension (.vhdx)"
        [Int64]$vmVHDSize = Read-Host "Enter max amount of space for the VMs VHDX in GB"
        $vmVHDSize = 1GB * $vmVHDSize
    }

    $vmPath = Read-Host "Enter exact location to store the VM"
    [Int]$vmGeneration = Read-Host "Enter VM generation (1 or 2)"

    if ($vmExistingVHDPrompt -eq "yes") {
        $vmBootDevice = Read-Host "What would you like to boot from? (CD, VHD)"
    }

    $vmSwitch = Read-Host "Which virtual switch do you want to use? You must use the full name"
    $vmISOPrompt = Read-Host "Do you want to specify an iso file for OS installation?"

    if ($vmISOPrompt -eq "yes") {
        $isoPath = Read-Host "Enter path to iso file, including the file name and extension" 
    }

    if ($vmExistingVHDPrompt -eq "yes"){
        New-VM -Name $vmName -MemoryStartupBytes $vmRAM -VHDPath $vmVHDPath -Path $vmPath -Generation $vmGeneration -BootDevice $vmBootDevice -SwitchName $vmSwitch
    } elseif ($vmExistingVHDPrompt -eq "no") {
        if ($vmISOPrompt -eq "yes") {
            New-VM -Name $vmName -MemoryStartupBytes $vmRAM -NewVHDPath $vmNewVHDPath -NewVHDSizeBytes $vmVHDSize -Path $vmPath -Generation $vmGeneration -SwitchName $vmSwitch
            Set-VM -Name $vmName -BootDevice CD
            Add-VMDvdDrive -VMName $vmName -Path $isoPath
        } else {
            New-VM -Name $vmName -MemoryStartupBytes $vmRAM -NewVHDPath $vmNewVHDPath -NewVHDSizeBytes $vmVHDSize -Path $vmPath -Generation $vmGeneration -SwitchName $vmSwitch
        }
    }
<#
    .SYNOPSIS
    Walks the user through virtual machine creation
    .DESCRIPTION
    Walks the user through virtual machine creation, asking input for every step and offers the possibility of creating a Virtual Switch.
    .OUTPUTS
    Creates a Virtual Machine to the users specifications
#>
}