# Todo
# 	Configuration migration
# 	Configure paths (move desktop and downloads and etc to d:\)
#		https://gallery.technet.microsoft.com/scriptcenter/b2aee1a5-1163-43c5-b3cf-fef42629e4ec
#	Configure internet explorer
# 	Shortcut transfer from root to global
#   AHK's thingy for admin stuff
#   WinX
# revo uninstaller
# gvimx64, freecommander not covered here
# set wallpaper
# set taskbar settings
# hide desktop icons
# regs
# putty shortcut, or other means of ssh

if ( -NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator") ) {
	Write-Host "Updating Shell Paths"
	Write-Warning "Downloads, Saved Games, and Searches must be set manually, probably."
	# Replace with WASP?
		$key1 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
		$key2 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
		set-ItemProperty -path $key1 -name AppData "H:\Roaming"
		set-ItemProperty -path $key2 -name AppData "H:\Roaming"
		set-ItemProperty -path $key1 -name Desktop "H:\Desktop"
		set-ItemProperty -path $key2 -name Desktop "H:\Desktop"
		set-ItemProperty -path $key1 -name "My Music" "H:\Music"
		set-ItemProperty -path $key2 -name "My Music" "H:\Music"
		set-ItemProperty -path $key1 -name "My Pictures" "H:\Pictures"
		set-ItemProperty -path $key2 -name "My Pictures" "H:\Pictures"
		set-ItemProperty -path $key1 -name "My Video" "H:\Videos"
		set-ItemProperty -path $key2 -name "My Video" "H:\Videos"
		set-ItemProperty -path $key1 -name "Personal" "H:\OneDrive\Documents"
		set-ItemProperty -path $key2 -name "Personal" "H:\OneDrive\Documents"
	$getdir = Get-Location
	Start-Process powershell.exe -ArgumentList "$getdir\silentinstall.ps1" -Verb Runas
}
else {
	Write-Host "Downloading and installing hashcheck..."
		Invoke-WebRequest -UseBasicParsing "http://code.kliu.org/hashcheck/downloads/HashCheckInstall-latest.exe" -OutFile "$ENV:TEMP\HashCheckInstall-latest.exe"
		Start-Process "$ENV:TEMP\HashCheckInstall-latest.exe" "/quiet"
	Write-Host "Downloading and installing vcredist..."
		Invoke-WebRequest -UseBasicParsing "http://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE" -OutFile "$ENV:TEMP\vcredist_x64.exe"
		Invoke-WebRequest -UseBasicParsing "http://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE" -OutFile "$ENV:TEMP\vcredist_x86.exe"
		Start-Process "$ENV:TEMP\vcredist_x64.EXE" "/Q" -wait
		Start-Process "$ENV:TEMP\vcredist_x86.EXE" "/Q" -wait
	Write-Host "Downloading and installing hardlink shell extension (explorer will restart)..."
		Invoke-WebRequest -UseBasicParsing "http://schinagl.priv.at/nt/hardlinkshellext/HardLinkShellExt_X64.exe" -OutFile "$ENV:TEMP\HardLinkShellExt_X64.exe"
		Start-Process "$ENV:TEMP\HardLinkShellExt_X64.exe" "/S /Language=English"
	Write-Host "Downloading and installing sumatrapdf..."
		Invoke-WebRequest -UseBasicParsing "https://kjkpub.s3.amazonaws.com/sumatrapdf/rel/SumatraPDF-3.0-install.exe" -OutFile "$ENV:TEMP\SumatraPDF-3.0-install.exe"
		Start-Process "$ENV:TEMP\SumatraPDF-3.0-install.exe" "/s /register"
	Write-Host "Downloading and installing AHK..."
		Invoke-WebRequest -UseBasicParsing "http://ahkscript.org/download/ahk-install.exe" -OutFile "$ENV:TEMP\ahk-install.exe"
		Start-Process "$ENV:TEMP\ahk-install.exe" "/S /U64"
	Write-Host "Downloading and installing AltDrag..."
		Invoke-WebRequest -UseBasicParsing "https://github.com/stefansundin/altdrag/releases/download/v1.0/AltDrag-1.0.exe" -OutFile "$ENV:TEMP\AltDrag-1.0.exe"
		Start-Process "$ENV:TEMP\AltDrag-1.0.exe" "/S"
	Write-Host "Downloading and installing ProcessHacker..."
		Invoke-WebRequest -UseBasicParsing "http://processhacker.googlecode.com/files/processhacker-2.33-setup.exe" -OutFile "$ENV:TEMP\processhacker-2.33-setup.exe"
		Start-Process "$ENV:TEMP\processhacker-2.33-setup.exe" "/SILENT"
	Write-Host "Downloading and installing Steam..."
		Invoke-WebRequest -UseBasicParsing "http://media.steampowered.com/client/installer/SteamSetup.exe" -OutFile "$ENV:TEMP\SteamSetup.exe"
		Start-Process "$ENV:TEMP\SteamSetup.exe" "/S"
	Write-Host "Downloading and installing directx..."
		Invoke-WebRequest -UseBasicParsing "http://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe" -OutFile "$ENV:TEMP\dxwebsetup.exe"
		Start-Process "$ENV:TEMP\dxwebsetup.exe" "/Q"
	#Write-Host "Downloading and installing MPC-HC..." # x86 for SVP
	#	Start-Process "$ENV:TEMP\MPC-HC_v1.7.8_x64" "/SILENT"
	#Write-Host "Downloading and installing Ditto..."
	#	Start-Process "$ENV:TEMP\DittoSetup_64bit_3_20_54_0.exe" "/SILENT"
	# Write-Host "Downloading and installing irfanview 4.38..."
	#	Start-Process "$ENV:TEMP\irfanview438.exe" "/silent /group=1 /allusers=1 /assocallusers=1"
	Write-Host "Downloading and installing paint.net..."
		Invoke-WebRequest -UseBasicParsing "http://www.dotpdn.com/files/paint.net.4.0.5.install.zip" -OutFile "$ENV:TEMP\paint.net.4.0.5.install.zip"
		Add-Type -assembly "system.io.compression.filesystem"
		[io.compression.zipfile]::ExtractToDirectory("$ENV:TEMP\paint.net.4.0.5.install.zip", "$ENV:TEMP")
		Start-Process "$ENV:TEMP\paint.net.4.0.5.install.exe" "/auto"
	
	Write-Host "Hamachi's fucking MSI is fucking retarded so I will not be using the fucking silent option and apparently it fucking pings google every time you install it"
	
	Write-Host "Downloading and installing GitHub, Honeyview, Vistaswitcher, and Vtuploader..."
	Write-Warning "Firefox, foobar2000, Geforce Experience, GitHub, Honeyview, Vistaswitcher, and Vtuploader don't have silent installs"
		Invoke-WebRequest -UseBasicParsing "https://download-installer.cdn.mozilla.net/pub/firefox/releases/38.0.1/win32/en-US/Firefox%20Setup%20Stub%2038.0.1.exe" -OutFile "$ENV:TEMP\Firefox Setup Stub 38.0.1.exe"
	#	Invoke-WebRequest -UseBasicParsing "http://www.foobar2000.org/getfile/5ade2dfcc3b9483f33cfff60cf8189e7/foobar2000_v1.3.8.exe" -OutFile "$ENV:TEMP\foobar2000_v1.3.8.exe"
		Invoke-WebRequest -UseBasicParsing "http://us.download.nvidia.com/GFE/GFEClient/2.4.3.31/GeForce_Experience_v2.4.3.31.exe" -OutFile "$ENV:TEMP\GeForce_Experience_v2.4.3.31.exe"
		Invoke-WebRequest -UseBasicParsing "https://github-windows.s3.amazonaws.com/GitHubSetup.exe" -OutFile "$ENV:TEMP\GitHubSetup.exe"
		Invoke-WebRequest -UseBasicParsing "http://www.bandisoft.com/honeyview/dl.php?web" -OutFile "$ENV:TEMP\honeyview.exe"
		Invoke-WebRequest -UseBasicParsing "http://download01.logitech.com/web/ftp/pub/techsupport/gaming/LGS_8.58.183_x64_Logitech.exe" -OutFile "$ENV:TEMP\LGS_8.58.183_x64_Logitech.exe"
		Invoke-WebRequest -UseBasicParsing "http://www.ntwind.com/download/VistaSwitcher_1.1.5-setup.exe" -OutFile "$ENV:TEMP\VistaSwitcher_1.1.5-setup.exe"
		Invoke-WebRequest -UseBasicParsing "https://www.virustotal.com/static/bin/vtuploader2.2.exe" -OutFile "$ENV:TEMP\vtuploader2.2.exe"
	
	# No silent yet
		Start-Process "$ENV:TEMP\Firefox Setup Stub 38.0.1.exe"
	#	Start-Process "$ENV:TEMP\foobar2000_v1.3.8.exe"
		Start-Process "$ENV:TEMP\GeForce_Experience_v2.4.3.31.exe"
		Start-Process "$ENV:TEMP\GitHubSetup.exe"
		Start-Process "$ENV:TEMP\honeyview.exe"
		Start-Process "$ENV:TEMP\LGS_8.58.183_x64_Logitech.exe"
		Start-Process "$ENV:TEMP\VistaSwitcher_1.1.5-setup.exe"
		Start-Process "$ENV:TEMP\vtuploader2.2.exe"
}
