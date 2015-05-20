# This is meant to be run as root.
# Todo
# 	Configuration migration
# 	Configure paths (move desktop and downloads and etc to d:\)
#		https://gallery.technet.microsoft.com/scriptcenter/b2aee1a5-1163-43c5-b3cf-fef42629e4ec
#	Configure internet explorer
# 	Shortcut transfer from root to global
#   AHK's thingy for admin stuff
#   WinX 

if ( -NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator") ) {
	COPY .\silentinstall.ps1 $Env:PUBLIC
	Start-Process "powershell" "$Env:PUBLIC\silentinstall.ps1" -Verb Runas
}
else {
$webclient = New-Object System.Net.WebClient
Write-Host "Downloading and installing hashcheck..."
	$webclient.DownloadFile( "http://code.kliu.org/hashcheck/downloads/HashCheckInstall-latest.exe", "$Env:TEMP\HashCheckInstall-latest.exe" )
	Start-Process "$Env:TEMP\HashCheckInstall-latest.exe" "/quiet"
Write-Host "Downloading and installing vcredist..."
	$webclient.DownloadFile( "http://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE", "$Env:TEMP\vcredist_x64.exe" )
	$webclient.DownloadFile( "http://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE", "$Env:TEMP\vcredist_x86.exe" )
	Start-Process "$Env:TEMP\vcredist_x64.EXE" "/Q" -wait
	Start-Process "$Env:TEMP\vcredist_x86.EXE" "/Q" -wait
Write-Host "Downloading and installing hardlink shell extension (explorer will restart)..."
	$webclient.DownloadFile( "http://schinagl.priv.at/nt/hardlinkshellext/HardLinkShellExt_X64.exe", "$Env:TEMP\HardLinkShellExt_X64.exe" )
	Start-Process "$Env:TEMP\HardLinkShellExt_X64.exe" "/S /Language=English"
Write-Host "Downloading and installing sumatrapdf..."
	$webclient.DownloadFile( "https://kjkpub.s3.amazonaws.com/sumatrapdf/rel/SumatraPDF-3.0-install.exe", "$Env:TEMP\SumatraPDF-3.0-install.exe" )
	Start-Process "$Env:TEMP\SumatraPDF-3.0-install.exe" "/s /register"
Write-Host "Downloading and installing AHK..."
	$webclient.DownloadFile( "http://ahkscript.org/download/ahk-install.exe", "$Env:TEMP\ahk-install.exe" )
	Start-Process "$Env:TEMP\ahk-install.exe" "/S /U64"
Write-Host "Downloading and installing ProcessHacker..."
	$webclient.DownloadFile( "http://processhacker.googlecode.com/files/processhacker-2.33-setup.exe", "$Env:TEMP\processhacker-2.33-setup.exe" )
	Start-Process "$Env:TEMP\processhacker-2.33-setup.exe" "/SILENT"
Write-Host "Downloading and installing Steam..."
	$webclient.DownloadFile( "http://media.steampowered.com/client/installer/SteamSetup.exe", "$Env:TEMP\SteamSetup.exe" )
	Start-Process "$Env:TEMP\SteamSetup.exe" "/S"
Write-Host "Downloading and installing directx..."
	$webclient.DownloadFile( "http://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe", "$Env:TEMP\dxwebsetup.exe" )
	Start-Process "$Env:TEMP\dxwebsetup.exe" "/Q"
Write-Host "Downloading and installing MPC-HC x86..." # x86 for SVP
	$webclient.DownloadFile( "http://superb-dca3.dl.sourceforge.net/project/mpc-hc/MPC%20HomeCinema%20-%20Win32/MPC-HC_v1.7.7_x86/MPC-HC.1.7.7.x86.exe", "$Env:TEMP\MPC-HC.1.7.7.x86.exe" )
	Start-Process "$Env:TEMP\MPC-HC.1.7.7.x86.exe" "/SILENT"
Write-Host "Downloading and installing Ditto..."
	$webclient.DownloadFile( "http://downloads.sourceforge.net/project/ditto-cp/Ditto/3.20.54.0/DittoSetup_64bit_3_20_54_0.exe", "$Env:TEMP\DittoSetup_64bit_3_20_54_0.exe" )
	Start-Process "$Env:TEMP\DittoSetup_64bit_3_20_54_0.exe" "/SILENT"
Write-Host "Downloading and installing irfanview 4.38..."
	$webclient.DownloadFile( "http://filehippo.com/download/file/c1fd292cac18c899909fd45098bfe9e636271c70111cdf484635b78e267521e0/", "$Env:TEMP\irfanview438.exe" )
	Start-Process "$Env:TEMP\irfanview438.exe" "/silent /group=1 /allusers=1 /assocallusers=1"
Write-Host "Downloading and installing paint.net..."
	$webclient.DownloadFile( "http://www.dotpdn.com/files/paint.net.4.0.5.install.zip", "$Env:TEMP\paint.net.4.0.5.install.zip" )
	Add-Type -assembly "system.io.compression.filesystem"
	[io.compression.zipfile]::ExtractToDirectory("$Env:TEMP\paint.net.4.0.5.install.zip", "$Env:TEMP")
	Start-Process "$Env:TEMP\paint.net.4.0.5.install.exe" "/auto"

Write-Host "Hamachi's fucking MSI is fucking retarded so I will not be using the fucking silent option and apparently it fucking pings google every time you install it"

Write-Host "Downloading and installing GitHub, Honeyview, Vistaswitcher, and Vtuploader..."
Write-Warning "GitHub, Honeyview, Vistaswitcher, and Vtuploader don't have silent installs"
	$webclient.DownloadFile( "https://download-installer.cdn.mozilla.net/pub/firefox/releases/38.0.1/win32/en-US/Firefox%20Setup%20Stub%2038.0.1.exe", "$ENV:TEMP\Firefox Setup Stub 38.0.1.exe" )
	$webclient.DownloadFile( "http://us.download.nvidia.com/GFE/GFEClient/2.4.3.31/GeForce_Experience_v2.4.3.31.exe", "$ENV:TEMP\GeForce_Experience_v2.4.3.31.exe" )
	$webclient.DownloadFile( "https://github-windows.s3.amazonaws.com/GitHubSetup.exe", "$ENV:TEMP\GitHubSetup.exe" )
	$webclient.DownloadFile( "http://www.bandisoft.com/honeyview/dl.php?web", "$Env:TEMP\honeyview.exe" )
	$webclient.DownloadFile( "http://download01.logitech.com/web/ftp/pub/techsupport/gaming/LGS_8.58.183_x64_Logitech.exe", "$ENV:TEMP\LGS_8.58.183_x64_Logitech.exe" )
	$webclient.DownloadFile( "http://www.ntwind.com/download/VistaSwitcher_1.1.5-setup.exe", "$Env:TEMP\VistaSwitcher_1.1.5-setup.exe" )
	$webclient.DownloadFile( "https://www.virustotal.com/static/bin/vtuploader2.2.exe", "$Env:TEMP\vtuploader2.2.exe" )

# No silent yet
	Start-Process "$ENV:TEMP\Firefox Setup Stub 38.0.1.exe"
	Start-Process "$ENV:TEMP\GeForce_Experience_v2.4.3.31.exe"
	Start-Process "$ENV:TEMP\GitHubSetup.exe"
	Start-Process "$ENV:TEMP\honeyview.exe"
	Start-Process "$ENV:TEMP\LGS_8.58.183_x64_Logitech.exe"
	Start-Process "$Env:TEMP\VistaSwitcher_1.1.5-setup.exe"
	Start-Process "$Env:TEMP\vtuploader2.2.exe"
}

Remove-Item $Env:PUBLIC\silentinstall.ps1
