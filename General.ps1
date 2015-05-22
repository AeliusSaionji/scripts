# lastpass fingerprint scanner fix
Import-Module UIAutomation
[UIAutomation.Mode]::Profile = [UIAutomation.Modes]::Normal;
do {
	Wait-UiaWindow -Name "Swipe finger" -Class '#32770' -Timeout 99999
	Invoke-UiaHotkey -Key t -Win
	Invoke-UiaHotkey -Key Esc
	Get-UiaWindow -ProcessName firefox -OutVariable firefox
	Get-UiaWindow -Name "Swipe finger" -Class "#32770" | Set-UiaFocus
	do {
		Start-Sleep 5
	} until ($firefox.WindowInteractionState -match "ReadyForUserInteraction")
} while ($true)
