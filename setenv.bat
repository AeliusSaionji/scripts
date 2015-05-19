REM todo - simplify this by assigning the desination to a variable rather than making duplicate lines
setx LS_OPTIONS "-bhAC --more --color=auto --recent --streams"
setx GREP_OPTIONS "--binary-files=text -d skip --color=auto"
MKDIR %HOMEDRIVE%\cygwin64\home\%USERNAME%

IF %COMPUTERNAME% EQU NERV (
	setx Desktop D:\Desktop
	setx Downloads D:\Downloads
	setx Games D:\Games
	setx Music D:\Music
	setx Pictures D:\Pictures
	setx Videos D:\Videos
	setx OneDrive D:\OneDrive
	set OneDrive=D:\OneDrive
	PowerShell -Command Start-Process "\"PowerShell\" \"Copy-Item $Env:OneDrive\MISCUT~1\ELEVAT~1.0-R\BIN~2.X86\elevate.exe -Destination C:\\Windows\"" -Verb runas
	elevate -c MKLINK "%HOMEDRIVE%%HOMEPATH%\_pentadactylrc" "%ONEDRIVE%\Misc Utils\Firefox backup\_pentadactylrc"
	elevate -c MKLINK "%HOMEDRIVE%%HOMEPATH%\.vimrc" "%ONEDRIVE%\Misc Utils\.vimrc"
	MKLINK /J "%HOMEDRIVE%\cygwin64\home\%USERNAME%\dcc" "D:\Downloads\dcc"
	) else (
	setx Desktop %HOMEDRIVE%%HOMEPATH%\Desktop
	setx Downloads %HOMEDRIVE%%HOMEPATH%\Downloads
	mkdir %HOMEDRIVE%%HOMEPATH%\Games
	setx Games %HOMEDRIVE%%HOMEPATH%\Games
	setx Music %HOMEDRIVE%%HOMEPATH%\Music
	setx Pictures %HOMEDRIVE%%HOMEPATH%\Pictures
	setx Videos %HOMEDRIVE%%HOMEPATH%\Videos
	setx OneDrive %HOMEDRIVE%%HOMEPATH%\OneDrive
	set OneDrive=%HOMEDRIVE%%HOMEPATH%\OneDrive
	PowerShell -Command Start-Process "\"PowerShell\" \"Copy-Item $Env:OneDrive\MISCUT~1\ELEVAT~1.0-R\BIN~2.X86\elevate.exe -Destination C:\\Windows\"" -Verb runas
	MKLINK /H "%HOMEDRIVE%%HOMEPATH%\_pentadactylrc" "%ONEDRIVE%\Misc Utils\Firefox backup\_pentadactylrc"
	MKLINK /H "%HOMEDRIVE%%HOMEPATH%\.vimrc" "%ONEDRIVE%\Misc Utils\.vimrc"
	MKLINK /H "%APPDATA%\Microsoft\Windows\Start Menu\Programs\startup\TwoFingerScroll.lnk" "%OneDrive%\Misc Utils\TwoFingerScroll_1_0_9-MacHater-Mod\TwoFingerScroll.lnk"
	MKDIR %HOMEDRIVE%%HOMEPATH%\Desktop\dcc
	MKLINK /J "%HOMEDRIVE%\cygwin64\home\%USERNAME%\dcc" "%HOMEDRIVE%%HOMEPATH%\Desktop\dcc"
	)

MKLINK /J "%HOMEDRIVE%\cygwin64\home\%USERNAME%\.irssi" "%ONEDRIVE%\Misc Utils\irssi\.irssi"
MKLINK /J "%HOMEDRIVE%%HOMEPATH%\pentadactyl" "%ONEDRIVE%\Misc Utils\Firefox backup\pentadactyl"

Powershell -Command Start-Process "\"PowerShell\" \"Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned\" -Verb Runas
