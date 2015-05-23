# Todo
# Configure internet explorer
# AHK's UI ACCESS
# Shortcuts to WinX
# gvimx64, freecommander not covered here
# set wallpaper
# set taskbar settings
# hide desktop icons
# Import regs
# putty shortcut, or other means of ssh


# Check for Administrator
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
	# Restart as Administrator
	$getdir = Get-Location
	Start-Process powershell.exe -ArgumentList "$getdir\silentinstall.ps1" -Verb Runas
}
else {
	# Silently download and install the following
	Write-Host "Downloading and installing hashcheck..."
		Invoke-WebRequest -UseBasicParsing -Uri "http://code.kliu.org/hashcheck/downloads/HashCheckInstall-latest.exe" -OutFile "$ENV:TEMP\HashCheckInstall-latest.exe"
		Start-Process -FilePath "$ENV:TEMP\HashCheckInstall-latest.exe" -ArgumentList "/quiet"
	Write-Host "Downloading and installing vcredist..."
		Invoke-WebRequest -UseBasicParsing -Uri "http://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE" -OutFile "$ENV:TEMP\vcredist_x64.exe"
		Invoke-WebRequest -UseBasicParsing -Uri "http://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE" -OutFile "$ENV:TEMP\vcredist_x86.exe"
		Start-Process -FilePath "$ENV:TEMP\vcredist_x64.EXE" -ArgumentList "/Q" -wait
		Start-Process -FilePath "$ENV:TEMP\vcredist_x86.EXE" -ArgumentList "/Q" -wait
	Write-Host "Downloading and installing hardlink shell extension (explorer will restart)..."
		Invoke-WebRequest -UseBasicParsing -Uri "http://schinagl.priv.at/nt/hardlinkshellext/HardLinkShellExt_X64.exe" -OutFile "$ENV:TEMP\HardLinkShellExt_X64.exe"
		Start-Process -FilePath "$ENV:TEMP\HardLinkShellExt_X64.exe" -ArgumentList "/S /Language=English"
	Write-Host "Downloading and installing sumatrapdf..."
		Invoke-WebRequest -UseBasicParsing -Uri "https://kjkpub.s3.amazonaws.com/sumatrapdf/rel/SumatraPDF-3.0-install.exe" -OutFile "$ENV:TEMP\SumatraPDF-3.0-install.exe"
		Start-Process -FilePath "$ENV:TEMP\SumatraPDF-3.0-install.exe" -ArgumentList "/s /register"
	Write-Host "Downloading and installing AHK..."
		Invoke-WebRequest -UseBasicParsing -Uri "http://ahkscript.org/download/ahk-install.exe" -OutFile "$ENV:TEMP\ahk-install.exe"
		Start-Process -FilePath "$ENV:TEMP\ahk-install.exe" -ArgumentList "/S /U64"
	Write-Host "Downloading and installing AltDrag..."
		Invoke-WebRequest -UseBasicParsing -Uri "https://github.com/stefansundin/altdrag/releases/download/v1.0/AltDrag-1.0.exe" -OutFile "$ENV:TEMP\AltDrag-1.0.exe"
		Start-Process -FilePath "$ENV:TEMP\AltDrag-1.0.exe" -ArgumentList "/S"
	Write-Host "Downloading and installing ProcessHacker..."
		Invoke-WebRequest -UseBasicParsing -Uri "http://processhacker.googlecode.com/files/processhacker-2.33-setup.exe" -OutFile "$ENV:TEMP\processhacker-2.33-setup.exe"
		Start-Process -FilePath "$ENV:TEMP\processhacker-2.33-setup.exe" -ArgumentList "/SILENT"
	Write-Host "Downloading and installing Steam..."
		Invoke-WebRequest -UseBasicParsing -Uri "http://media.steampowered.com/client/installer/SteamSetup.exe" -OutFile "$ENV:TEMP\SteamSetup.exe"
		Start-Process -FilePath "$ENV:TEMP\SteamSetup.exe" -ArgumentList "/S"
	Write-Host "Downloading and installing directx..."
		Invoke-WebRequest -UseBasicParsing -Uri "http://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe" -OutFile "$ENV:TEMP\dxwebsetup.exe"
		Start-Process -FilePath "$ENV:TEMP\dxwebsetup.exe" -ArgumentList "/Q"
	#Write-Host "Downloading and installing MPC-HC..." # x86 for SVP
	#	Start-Process -FilePath "$ENV:TEMP\MPC-HC_v1.7.8_x64.exe" -ArgumentList "/SILENT"
	#Write-Host "Downloading and installing Ditto..."
	#	Start-Process -FilePath "$ENV:TEMP\DittoSetup_64bit_3_20_54_0.exe" -ArgumentList "/SILENT"
	# Write-Host "Downloading and installing irfanview 4.38..."
	#	Start-Process -FilePath "$ENV:TEMP\irfanview438.exe" -ArgumentList "/silent /group=1 /allusers=1 /assocallusers=1"
	Write-Host "Downloading and installing paint.net..."
		Invoke-WebRequest -UseBasicParsing -Uri "http://www.dotpdn.com/files/paint.net.4.0.5.install.zip" -OutFile "$ENV:TEMP\paint.net.4.0.5.install.zip"
		Add-Type -assembly "system.io.compression.filesystem"
		[io.compression.zipfile]::ExtractToDirectory("$ENV:TEMP\paint.net.4.0.5.install.zip", "$ENV:TEMP")
		Start-Process -FilePath "$ENV:TEMP\paint.net.4.0.5.install.exe" -ArgumentList "/auto"
	
	Write-Host "Hamachi's MSI is retarded, don't use it. In addition to not working, it pings google every time you install it"
	
	Write-Host "Downloading and installing GitHub, Honeyview, Vistaswitcher, and Vtuploader..."
	Write-Warning "Firefox, foobar2000, Geforce Experience, GitHub, Honeyview, Vistaswitcher, and Vtuploader don't have silent installs"
		Invoke-WebRequest -UseBasicParsing -Uri "https://download-installer.cdn.mozilla.net/pub/firefox/releases/38.0.1/win32/en-US/Firefox%20Setup%20Stub%2038.0.1.exe" -OutFile "$ENV:TEMP\Firefox Setup Stub 38.0.1.exe"
	#	Invoke-WebRequest -UseBasicParsing -Uri "http://www.foobar2000.org/getfile/5ade2dfcc3b9483f33cfff60cf8189e7/foobar2000_v1.3.8.exe" -OutFile "$ENV:TEMP\foobar2000_v1.3.8.exe"
		Invoke-WebRequest -UseBasicParsing -Uri "http://us.download.nvidia.com/GFE/GFEClient/2.4.3.31/GeForce_Experience_v2.4.3.31.exe" -OutFile "$ENV:TEMP\GeForce_Experience_v2.4.3.31.exe"
		Invoke-WebRequest -UseBasicParsing -Uri "https://github-windows.s3.amazonaws.com/GitHubSetup.exe" -OutFile "$ENV:TEMP\GitHubSetup.exe"
		Invoke-WebRequest -UseBasicParsing -Uri "http://www.bandisoft.com/honeyview/dl.php?web" -OutFile "$ENV:TEMP\honeyview.exe"
		Invoke-WebRequest -UseBasicParsing -Uri "http://download01.logitech.com/web/ftp/pub/techsupport/gaming/LGS_8.58.183_x64_Logitech.exe" -OutFile "$ENV:TEMP\LGS_8.58.183_x64_Logitech.exe"
		Invoke-WebRequest -UseBasicParsing -Uri "http://6d249e2930674d9a0246-22b39505feb4cbdca036d208d587baec.r76.cf1.rackcdn.com/RevoUninProSetup.exe" -OutFile "$ENV:TEMP\RevoUninProSetup.exe"
		Invoke-WebRequest -UseBasicParsing -Uri "http://www.ntwind.com/download/VistaSwitcher_1.1.5-setup.exe" -OutFile "$ENV:TEMP\VistaSwitcher_1.1.5-setup.exe"
		Invoke-WebRequest -UseBasicParsing -Uri "https://www.virustotal.com/static/bin/vtuploader2.2.exe" -OutFile "$ENV:TEMP\vtuploader2.2.exe"
	
	# No silent yet
		Start-Process -FilePath "$ENV:TEMP\Firefox Setup Stub 38.0.1.exe"
	#	Start-Process -FilePath "$ENV:TEMP\foobar2000_v1.3.8.exe"
		Start-Process -FilePath "$ENV:TEMP\GeForce_Experience_v2.4.3.31.exe"
		Start-Process -FilePath "$ENV:TEMP\GitHubSetup.exe"
		Start-Process -FilePath "$ENV:TEMP\honeyview.exe"
		Start-Process -FilePath "$ENV:TEMP\LGS_8.58.183_x64_Logitech.exe"
		Start-Process -FilePath "$ENV:TEMP\RevoUninProSetup.exe"
		Start-Process -FilePath "$ENV:TEMP\VistaSwitcher_1.1.5-setup.exe"
		Start-Process -FilePath "$ENV:TEMP\vtuploader2.2.exe"
}
