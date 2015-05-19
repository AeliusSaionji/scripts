"This script will move undesirable shortcuts from the start menu to $Env:HOMEDRIVE\StartMenuBak with folder structure intact." 
if (Test-Path C:\Users\root) {
	$fixroot = Read-Host "First, copy all shortcuts from root's start menu to the global one? Yes to confirm"
	if ($fixroot -eq "yes") {
		Start-Process "robocopy" "C:\Users\root\AppData\Roaming\Microsoft\Windows\StartM~1 $Env:ProgramData\Microsoft\Windows\StartM~1 /S /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0" -Verb RunAs
	}
}
$deluninst = Read-Host "Remove all shortcuts to uninstallers? Yes to confirm"
if ($deluninst -eq "yes") {
	robocopy $Env:APPDATA\Microsoft\Windows\StartM~1 $Env:HOMEDRIVE\StartMenuBak\Local *Uninstall*.lnk /S /MOVE /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0
	Start-Process "robocopy" "$Env:ProgramData\Microsoft\Windows\StartM~1 $Env:HOMEDRIVE\StartMenuBak\Global *Uninstall*.lnk /S /MOVE /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0" -Verb RunAs
}
$delurls = Read-Host "Remove all shortcuts to websites? Yes to confirm"
if ($delurls -eq "yes") {
	robocopy $Env:APPDATA\Microsoft\Windows\StartM~1 $Env:HOMEDRIVE\StartMenuBak\Local *.url /S /MOVE /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0
	Start-Process "robocopy" "$Env:ProgramData\Microsoft\Windows\StartM~1 $Env:HOMEDRIVE\StartMenuBak\Global *.url /S /MOVE /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0" -Verb RunAs
}
