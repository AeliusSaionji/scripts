# Aelius Saionji
# 1.0
#	Initial release
# 1.5
#	camelCase, variable $adminName & user printout
#	Revo Uninstaller exception
#	Steam folder exception
#	Backups now go to C:\tools\TidyStart, following the Chocolatey convention
# 1.8
#	Increased readability + decreased line length
#	Condense admin actions under one UAC prompt
#	Don't make changes until end of script
#	Make output text pretty
#	
# TODO
#	Numerical selection for root user
#	If a folder only contains one shortcut: save shortcut, delete folder
#	Use sane versions
#	Reduce / eliminate new windows opened
#	Reconsider use of heredocs- manually expanded script blocks are an option

$startMenu = 'Microsoft\Windows\StartM~1'
$roboArgs = '/S /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0'
$backupDir = "$ENV:HOMEDRIVE\tools\TidyStart\StartMenuBak"
$cumulativeCmd = ""
$cumulativeCmdAdmin = ""

Write-Host -ForegroundColor Yellow "This script will move undesirable shortcuts from the start menu to $backupDir with folder structure intact."
Write-Host -ForegroundColor Yellow "First, copy all shortcuts from an admin's start menu to the global one?"
$fixRoot = Read-Host "Yes to confirm"
if ($fixRoot -eq "yes") {
	$userList = Get-ChildItem "$ENV:HOMEDRIVE\Users" -Exclude Public,Default*
	Format-Table -Property Name -InputObject $userList
	Write-Host -ForegroundColor Yellow "Please enter the username of the admin user exactly as it appears above."
	$adminName = Read-Host "Name"
	$cumulativeCmdAdmin += @"
	Start-Process "robocopy" "$ENV:HOMEDRIVE\Users\$adminName\AppData\Roaming\$startMenu $ENV:ProgramData\$StartMenu $roboArgs";
"@
}

Write-Host -ForegroundColor Yellow "Remove all shortcuts to uninstallers?"
$delUninst = Read-Host "Yes to confirm"
if ($delUninst -eq "yes") {
	$cumulativeCmd += @"
	Start-Process "robocopy" "$ENV:APPDATA\$startMenu     $backupDir\Local  *Uninstall*.lnk $roboArgs /MOVE /XF 'Revo Uninstaller Pro.lnk'";
"@
	$cumulativeCmdAdmin += @"
	Start-Process "robocopy" "$ENV:ProgramData\$startMenu $backupDir\Global *Uninstall*.lnk $roboArgs /MOVE /XF 'Revo Uninstaller Pro.lnk'";
"@
}

Write-Host -ForegroundColor Yellow "Remove all shortcuts to websites?"
$delUrls = Read-Host "Yes to confirm"
if ($delUrls -eq "yes") {
	$cumulativeCmd += @"
	Start-Process "robocopy" "$ENV:APPDATA\$startMenu     $backupDir\Local  *.url $roboArgs /MOVE /XD Steam";
"@
	$cumulativeCmdAdmin += @"
	Start-Process "robocopy" "$ENV:ProgramData\$startMenu $backupDir\Global *.url $roboArgs /MOVE /XD Steam";
"@
}

$bytesAdmin = [System.Text.Encoding]::Unicode.GetBytes($cumulativeCmdAdmin)
$bytes      = [System.Text.Encoding]::Unicode.GetBytes($cumulativeCmd)
$encodedCommandAdmin = [Convert]::ToBase64String($bytesAdmin)
$encodedCommand      = [Convert]::ToBase64String($bytes)
Start-Process "powershell.exe" "-WindowStyle Hidden -EncodedCommand $encodedCommandAdmin" -Verb RunAs -Wait
Start-Process "powershell.exe" "-WindowStyle Hidden -EncodedCommand $encodedCommand"