#Author: Kyle Davies
#Date Written: April 17th, 2022
#ICT 128 Final Project: 41/40 (Extra)
Function Find-Murderer {
    Invoke-WebRequest -uri https://www.thebump.com/b/most-popular-baby-names -OutFile .\html.html
    [Boolean]$continue = $true
    [String]$stringChoice
    [Int]$lives = 3
    [String[]]$randNames
    [String]$difficulty = Read-Host "Easy, medium, or hard?"
    [String[]]$roles = "Civilian","Police Officer","Student","Teacher","Manager","Witness","Sketchy Person","Child","Drunk","Relative of victim","Best Friend of victim","Significant other of victim","Lover of victim","Sheriff","Vigilante"
    if ($difficulty -eq "easy") {
        [String[]]$randNames = " ", " ", " ", " ", " ", " "
        for ($i = 1; $i -le 5; $i++) {
            $num = Get-Random -Minimum 0 -Maximum 14
            $randNames[$i] = Name-Generator
            $randNames[$i] = "$i - " + $randNames[$i] + " - " + $roles[$num]
        }
    } elseif ($difficulty -eq "medium") {
        [String[]]$randNames = " ", " ", " ", " ", " "," ", " ", " ", " ", " ", " "
        for ($i = 1; $i -le 10; $i++) {
            $num = Get-Random -Minimum 0 -Maximum 14
            $randNames[$i] = Name-Generator
            $randNames[$i] = "$i - " + $randNames[$i] + " - " + $roles[$num]
        }
    } elseif ($difficulty -eq "hard") {
        [String[]]$randNames = " ", " ", " ", " ", " "," ", " ", " ", " ", " "," ", " ", " ", " ", " ", " "
        for ($i = 1; $i -le 15; $i++) {
            $num = Get-Random -Minimum 0 -Maximum 14
            $randNames[$i] = Name-Generator
            $randNames[$i] = "$i - " + $randNames[$i] + " - " + $roles[$num]
        } 
    }
    $num = Get-Random -Minimum 1 -Maximum ($randNames.Length)
    [String]$murderer = $randNames[$num]
    While($continue -eq $true -or $lives -eq 0) {
        $randNames | Format-List
        [Int]$choice = Read-Host "Who would you like to interrogate? 1 - $(($randNames.Length - 1))"
        #Write-Host "$($randNames[$choice]) says ..."
        if ($randNames[$choice] -match "Civilian") {
            if ($randNames[$choice] -ne $murderer) {
                Write-Host "$($randNames[$choice]) says 'I don't know who that is. Go bother someone else!'"
            } elseif ($randNames[$choice] -eq $murderer) {
                Write-Host "$($randNames[$choice]) says 'There was a murder? I hope you catch the culprit.'"
            }
        }

        if ($randNames[$choice] -match "Student") {
            if ($randNames[$choice -ne $murderer]) {
                Write-Host "$($randNames[$choice]) says 'I don't know who that is. I've got studying to do, go bother someone else!'"
            }elseif ($randNames[$choice] -eq $murderer) {
                Write-Host "$($randNames[$choice]) says 'I don't trust my teacher, they give me the creeps. If they're around go ask them.'"
            }
        }

        if ($randNames[$choice] -match "Teacher") {
            if ($randNames[$choice] -ne $murderer) {
                Write-Host "$($randNames[$choice]) says 'I don't know who that is. I've got class soon.'"
            } elseif ($randNames[$choice] -eq $murderer) {
                Write-Host "$($randNames[$choice]) says 'I have an alibi. I was teaching a class.'"
            }
        }

        if ($randNames[$choice] -match "Manager") {
            if ($randNames[$choice] -ne $murderer) {
                Write-Host "$($randNames[$choice]) says 'I don't know who that is. Now I need to make more money, go away.'"
            } elseif ($randNames[$choice] -eq $murderer) {
                Write-Host "$($randNames[$choice]) says 'I really don't care.'"
            }
        }

        if ($randNames[$choice] -match "Child") {
            if ($randNames[$choice] -ne $murderer) {
                Write-Host "$($randNames[$choice]) says 'I dunno who that is, but I think I saw a creepy person with ketchup on his hands last night'"
            } elseif ($randNames[$choice] -eq $murderer) {
                Write-Host "$($randNames[$choice]) says 'I'm sorry! It was an accident!'"
            }
        }

        if ($randNames[$choice] -match "Relative of victim") {
            if ($randNames[$choice] -ne $murderer) {
                Write-Host "$($randNames[$choice]) says 'My kid was elusive, I know nothing of their personal life anymore.'"
            } elseif ($randNames[$choice] -eq $murderer) {
                $num = Get-Random -Minimum 1 -Maximum $randNames.Length
                Write-Host "$($randNames[$choice]) says 'I never liked $($randNames[$num]), go bother them'"
            }
        }

        if ($randNames[$choice] -match "Sheriff") {
            $num = Get-Random -Minimum 1 -Maximum $randNames.Length
            if ($randNames[$choice] -ne $murderer) {
                if ($num -eq 1) {
                    Write-Host "$($randNames[$choice]) says 'We have reason to believe that it's $murderer'"
                } elseif ($num -ne 1) {
                    Write-Host "$($randNames[$choice]) says 'We have no leads'"
                }
            } elseif ($randNames[$choice] -eq $murderer) {
                Write-Host "$($randNames[$choice]) says 'We have reason to believe that it's $($randNames[$num])'"
            }
        }

        if ($randNames[$choice] -match "Police Officer") {
            if ($randNames[$choice] -ne $murderer) {
                for ($i = 1; $i -le $randNames.Length; $i++) {
                    if ($randNames[$i] -match "Significant other of victim") {
                        Write-Host "$($randNames[$choice]) says '$($randNames[$i]) was closest to the victim, they must know something!'"
                        Break
                    } 
                    if ($randNames[$i] -match "Sketchy Person") {
                        Write-Host "$($randNames[$choice]) says '$($randNames[$i]) has had run-ins with the law!'"
                        Break
                    } else {
                        $num = Get-Random -Minimum 1 -Maximum 3
                        if ($num -eq 1) {
                            Write-Host "$($randNames[$choice]) says 'The Police department has no leads.'"
                            Break
                        } elseif ($num -eq 2) {
                            Write-Host "$($randNames[$choice]) says 'We have no comment at this time.'"
                            Break
                        }
                    }
                }
            } elseif ($randNames[$choice] -eq $murderer) {
                $num = Get-Random -Minimum 1 -Maximum $randNames.Length
                if ($randNames[$num] -eq $randNames[$choice]) {
                    $num = $num - 1
                    Write-Host "$($randNames[$choice]) says 'I don't like the look of $($randNames[$num])'"
                } else {
                    Write-Host "$($randNames[$choice]) says 'I don't like the look of $($randNames[$num])'"
                }
            }
        }

        if ($randNames[$choice] -match "Significant other of victim") {
            if ($randNames[$choice] -ne $murderer) {
                Write-Host "$($randNames[$choice]) says 'I don't know anything'"
                for ($i = 1; $i -le $randNames.Length; $i++) {
                    if ($randNames[$i] -match "Best Friend of victim" -and $murderer -match "Best Friend of victim") {
                        Write-Host "$($randNames[$choice]) says 'but they went out with $($randNames[$i]) last night'"
                        Break
                    }
                    if ($randNames[$i] -match "Lover of victim" -and $murderer -match "Lover of victim") {
                        Write-Host "$($randNames[$choice]) says 'but I think they were cheating on me with $($randNames[$i]) last night!'"
                        Break
                    }
                }
            } elseif ($randNames[$choice] -eq $murderer) {
                Write-Host "$($randNames[$choice]) says 'I haven't seen them since they left for work yesterday.'"
            }
        }

        if ($randNames[$choice] -match "Lover of victim") {
            if ($randNames[$choice] -ne $murderer) {
                Write-Host "$($randNames[$choice]) says 'I don't know anything'"
                if ($murderer -match "Significant other of victim") {
                    Write-Host "$($randNames[$choice]) says 'but there's something off about their significant other...'"
                }
                if ($randNames[$choice] -eq $murderer) {
                    Write-Host "$($randNames[$choice]) says 'I haven't seen them since last night.'"
                }
            } elseif ($randNames[$choice] -eq $murderer) {
                Write-Host "$($randNames[$choice]) says 'Are you accusing me of something`? How dare you.'"
            }
        }

        if ($randNames[$choice] -match "Witness") {
            $num = Get-Random -Minimum 1 -Maximum 3
            if ($randNames[$choice] -ne $murderer){
                if ($num -eq 1) {
                    $num = Get-Random -Minimum 1 -Maximum $randNames.Length
                    $num2 = Get-Random -Minimum 1 -Maximum $randNames.Length
                    $num3 = Get-Random -Minimum 1 -Maximum 4
                    if ($num3 -eq 1) {
                        Write-Host "$($randNames[$choice]) says 'I think I saw $($randNames[$num]), $($randNames[$num2]), $murderer that night'"
                    } elseif ($num3 -eq 2) {
                        Write-Host "$($randNames[$choice]) says 'I think I saw $murderer, $($randNames[$num2]), $($randNames[$num]) that night'"
                    } elseif ($num3 -eq 3) {
                        Write-Host "$($randNames[$choice]) says 'I think I saw $($randNames[$num2]), $murderer, $($randNames[$num]) that night'"
                    }
                } elseif ($num -eq 2) {
                    $num = Get-Random -Minimum 1 -Maximum $randNames.Length
                    Write-Host "$($randNames[$choice]) says 'I couldn't see their face... Maybe $($randNames[$num])`?"
                }
            } elseif ($randNames[$choice] -eq $murderer) {
                $num = Get-Random -Minimum 1 -Maximum $randNames.Length
                Write-Host "$($randNames[$choice]) says 'I couldn't see their face... Maybe $($randNames[$num])`?"
            }
        }

        if ($randNames[$choice] -match "Sketchy Person") {
            $num = Get-Random -Minimum 1 -Maximum 11
            if ($num -ne 10 -and $randNames[$choice] -ne $murderer) {
                $num = Get-Random -Minimum 1 -Maximum $randNames.Length
                Write-Host "$($randNames[$choice]) says 'It was $($randNames[$num])!"
            } elseif ($num -eq 10 -and $randNames[$choice] -ne $murderer) {
                Write-Host "$($randNames[$choice]) says 'It was $murderer!"
            }
            if ($randNames[$choice] -eq $murderer) {
                Write-Host "$($randNames[$choice]) says 'Leave me alone, pig.'"
            }
        }

        if ($randNames[$choice] -match "Drunk") {
            Write-Host "$($randNames[$choice]) says 'Wha.. Ican'tunderstand... uhhhhh'"
            if ($randNames[$choice] -eq $murderer) {
                $num = Get-Random -Minimum 1 -Maximum $randNames.Length
                Write-Host "$($randNames[$choice]) says '...huh? Right... it was $($randNames[$num])'"
            }
        }

        if ($randNames[$choice] -match "Best Friend of victim") {
            if ($randNames[$choice] -ne $murderer) {
                if ($murderer -match "Significant other of victim") {
                    Write-Host "$($randNames[$choice]) says 'I was with them last night, we went to the bar and they got into an argument with $murderer over the phone'"
                } elseif ($murderer -match "Sketchy Person") {
                    Write-Host "$($randNames[$choice]) says 'They had an ugly history with $murderer'"
                } else {
                    Write-Host "$($randNames[$choice]) says 'I have no information for you...'"
                }
            } elseif ($randNames[$choice] -eq $murderer) {
                Write-Host "$($randNames[$choice]) says 'How dare you even suggest that I'd kill my best friend. Begone!'"
                for ($i = 1; $i -le $randNames.Length; $i++) {
                    if ($randNames[$i] -match "Witness") {
                        Write-Host "$($randNames[$choice]) says 'but Don't trust $($randNames[$i])!'"
                        Break
                    }
                }
            }
        }

        $stringChoice = Read-Host "Guess who the murderer is? Y/N"
        if ($stringChoice -eq "Y") {
            $choice = Read-Host "Who is it?"
            if ($randNames[$choice] -eq $murderer) {
                Write-Host "Congratulations! You found the murderer!" -ForegroundColor Green
                $continue = $false
                Break
            } else {
                $lives = $lives - 1
                Write-Host "$($randNames[$choice]) is not the murderer! You have $lives lives left." -ForegroundColor Red
                if ($lives -eq 0) {
                    Write-Host "The murderer was $murderer! Game Over!" -ForegroundColor Red
                    Break
                }
            }
        }
    }
    <#
    .SYNOPSIS
    A simple game where you have to find the murderer by interrogating multiple people, you have 3 guesses.
    #>
}

Function Name-Generator {
    $html = Get-Content -Path .\html.html | Select-String -Pattern '$'
    $html = $html -replace '<.*?>',''
    $names = $html | Select-String -Pattern '"name":".{3,9}' -CaseSensitive -AllMatches | ForEach-Object {$_.Matches}
    $names = $names -replace '"name":"',''
    $names = $names -replace '","ge',''
    $names = $names -replace '","g',''
    $names = $names -replace '",',''
    $names = $names -replace '"',''
    $number = Get-Random -Minimum 0 -Maximum $names.Length
    $names[$number]
}