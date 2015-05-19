MKDIR %HOMEDRIVE%\cygwin64\home\%USERNAME%

IF %COMPUTERNAME% EQU NERV (
	set My_Path=D:
	MKLINK /J "%HOMEDRIVE%\cygwin64\home\%USERNAME%\dcc" "D:\Downloads\dcc"
	set GitHub=%My_Path%\GitHub
	COPY %GitHub%\scripts\General.lnk "%APPDATA%\Microsoft\Windows\Start Menu\Programs\startup
	COPY %GitHub%\scripts\rsyncd.lnk "%APPDATA%\Microsoft\Windows\Start Menu\Programs\startup
) else (
	set My_Path=%HOMEDRIVE%%HOMEPATH%
	MKDIR %HOMEDRIVE%%HOMEPATH%\Desktop\dcc
	MKDIR %HOMEDRIVE%%HOMEPATH%\Games
	MKDIR %HOMEDRIVE%%HOMEPATH%\GitHub
	set OneDrive=%My_Path%\OneDrive
	MKLINK /H "%APPDATA%\Microsoft\Windows\Start Menu\Programs\startup\TwoFingerScroll.lnk" "%OneDrive%\Misc Utils\TwoFingerScroll_1_0_9-MacHater-Mod\TwoFingerScroll.lnk"
	MKLINK /J "%HOMEDRIVE%\cygwin64\home\%USERNAME%\dcc" "%HOMEDRIVE%%HOMEPATH%\Desktop\dcc"
	)

setx Desktop %My_Path%\Desktop
setx Downloads %My_Path%\Downloads
setx Games %My_Path%\Games
setx GitHub %My_Path%\GitHub
setx Music %My_Path%\Music
setx OneDrive %My_Path%\OneDrive
setx Pictures %My_Path%\Pictures
setx Videos %My_Path%\Videos
set OneDrive=%My_Path%\OneDrive
MKLINK /J "%HOMEDRIVE%\cygwin64\home\%USERNAME%\.irssi" "%ONEDRIVE%\Misc Utils\irssi\.irssi"
MKLINK /J "%HOMEDRIVE%%HOMEPATH%\pentadactyl" "%ONEDRIVE%\Misc Utils\Firefox backup\pentadactyl"
PowerShell -Command Start-Process "\"PowerShell\" \"Copy-Item $Env:OneDrive\MISCUT~1\ELEVAT~1.0-R\BIN~2.X86\elevate.exe -Destination C:\\Windows\"" -Verb runas
elevate -c MKLINK "%HOMEDRIVE%%HOMEPATH%\_pentadactylrc" "%ONEDRIVE%\Misc Utils\Firefox backup\_pentadactylrc"
elevate -c MKLINK "%HOMEDRIVE%%HOMEPATH%\.vimrc" "%ONEDRIVE%\Misc Utils\.vimrc"
Powershell -Command Start-Process "\"PowerShell\" \"Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned\" -Verb Runas
