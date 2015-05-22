# lastpass fingerprint scanner fix
Import-Module UIAutomation
[UIAutomation.Mode]::Profile = [UIAutomation.Modes]::Normal;

Function detect-lp {
	Wait-UiaWindow -Name "Swipe finger" -Class "#32770" -Timeout 99999 -OutVariable lpfinger
	if ($lpfinger -eq "True") {
		Invoke-UiaHotkey -Key t -Win
		Invoke-UiaHotkey -Key Esc
		Get-UiaWindow -Name "Swipe finger" -Class "#32770" -OutVariable lpfinger | Set-UiaFocus
		do {
			Start-Sleep 5
		} until ($lpfinger.WindowInteractionState -match "Closing")
	}
}

do {
	detect-lp
} while($true)
