# lastpass fingerprint scanner fix
do {
	do {
		$fpwindow = Select-Window firefox | Select-ChildWindow;Start-Sleep 2
	} until ($fpwindow.Title -match "Swipe finger")
	Select-Window firefox | Set-WindowActive
	Select-Window firefox | Select-ChildWindow | Set-WindowActive
	do {
		$fpwindow = Select-Window firefox | Select-ChildWindow;Start-Sleep 2
	} while ($fpwindow.Title -match "Swipe finger")
} while ($true)
