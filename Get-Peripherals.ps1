#Author: Kyle Davies
#Date Written: April 12th, 2022
#ICT 128 Final Project: 38/40
Function Get-Peripherals {
    $keyboard = Get-CimInstance -ClassName Win32_Keyboard | Select-Object -Property Description
    $keyboard = $keyboard -replace "HID Keyboard Device",""
    $keyboard = $keyboard -replace "USB Input Device",""
    $keyboard = $keyboard -replace "@{Description=",""
    $keyboard = $keyboard -replace "}",""
    $mouse = Get-CimInstance win32_POINTINGDEVICE | Select-Object -Property Name
    $mouse = $mouse -replace "HID-compliant mouse",""
    $mouse = $mouse -replace "USB Input Device",""
    $mouse = $mouse -replace "@{Name=",""
    $mouse = $mouse -replace "}",""
    $keyboard
    $mouse
    <#
    .SYNOPSIS
    Gets keyboard and mouse *Note* If using Razer devices the output appears a little wonky
    #>
}