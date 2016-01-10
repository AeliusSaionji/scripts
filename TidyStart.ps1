# Link Satonaka
# 1.0
#	Initial release
# 1.5
# 	camelCase, variable $adminName & user printout
# 	Revo Uninstaller exception
# 	Steam folder exception
# 	Backups now go to C:\tools\TidyStart, following the Chocolatey convention
# TODO
# 	Choose from a list of users instead of having to type the username
# 	Make text output pretty
# 	Condense all actions under one UAC prompt
# 	When Chocolatey updates Get-BinRoot, detect it via environment variable (keep OneGet support in mind)

Write-Output "This script will move undesirable shortcuts from the start menu to $ENV:HOMEDRIVE\tools\TidyStart\StartMenuBak with folder structure intact." 
$fixRoot = Read-Host "First, copy all shortcuts from an admin's start menu to the global one? Yes to confirm"
if ($fixRoot -eq "yes") {
	$userList = Get-ChildItem "$ENV:HOMEDRIVE\Users" -Exclude Public,Default*
	Write-Output $userList.Name
	$adminName = Read-Host "Please enter the username of the admin user exactly as it appears above"
	Start-Process "robocopy" "$ENV:HOMEDRIVE\Users\$adminName\AppData\Roaming\Microsoft\Windows\StartM~1 $ENV:ProgramData\Microsoft\Windows\StartM~1 /S /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0" -Verb RunAs
}
$delUninst = Read-Host "Remove all shortcuts to uninstallers? Yes to confirm"
if ($delUninst -eq "yes") {
	robocopy $ENV:APPDATA\Microsoft\Windows\StartM~1 $ENV:HOMEDRIVE\tools\TidyStart\StartMenuBak\Local *Uninstall*.lnk /S /MOVE /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0 /XF "Revo Uninstaller Pro.lnk"
	Start-Process "robocopy" "$ENV:ProgramData\Microsoft\Windows\StartM~1 $ENV:HOMEDRIVE\tools\TidyStart\StartMenuBak\Global *Uninstall*.lnk /S /MOVE /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0 /XF ""Revo Uninstaller Pro.lnk""" -Verb RunAs
}
$delUrls = Read-Host "Remove all shortcuts to websites? Yes to confirm"
if ($delUrls -eq "yes") {
	robocopy $ENV:APPDATA\Microsoft\Windows\StartM~1 $ENV:HOMEDRIVE\tools\TidyStart\StartMenuBak\Local *.url /S /MOVE /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0 /XD Steam
	Start-Process "robocopy" "$ENV:ProgramData\Microsoft\Windows\StartM~1 $ENV:HOMEDRIVE\tools\TidyStart\StartMenuBak\Global *.url /S /MOVE /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0 /XD Steam" -Verb RunAs
}
