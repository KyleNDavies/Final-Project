#Author: Kyle Davies
#Date Written: April 12th, 2022
#ICT 128 Final Project: 40/40
Start-Job -Name "KillFortnite" -ScriptBlock {
    While ($true) {
        Start-Sleep -seconds 300
        $processes = Get-Process | Select-Object -Property Name,starttime
        $fortnite = "FortniteClient-Win64-Shipping"
        $fortnite2 = "FortniteClient-Win64-Shipping_EAC"
        $fortnite3 = "FortniteLauncher"
        for ($i = 0; $i -le $processes.length; $i++) {
            if ($processes[$i].Name -eq $fortnite) {
                Stop-Process -Name $fortnite
                Stop-Process -Name $fortnite2
                Stop-Process -Name $fortnite3
            }
        }
    }
}

#Checks if Fortnite is running every 5 minutes. If it is, it kills the process. If not, nothing happens.
#Loops forever, use Stop-Job -Name KillFortnite to stop.