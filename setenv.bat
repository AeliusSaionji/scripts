IF %COMPUTERNAME% EQU NERV (
	set My_Path=H:
REM The following github folders might not exist, check for existence?
	COPY H:\GitHub\scripts\General.ps1.lnk "H:\Roaming\Microsoft\Windows\Start Menu\Programs\startup"
	COPY H:\GitHub\scripts\rsyncd.bat.lnk "H:\Roaming\Microsoft\Windows\Start Menu\Programs\startup"
	H:\OneDrive\MISCUT~1\ELEVAT~1.0-R\BIN~2.X86\elevate.exe -c MKLINK "%HOMEDRIVE%%HOMEPATH%\.pentadactylrc" "H:\GitHub\dotfiles\home\Link\.pentadactylrc"
	H:\OneDrive\MISCUT~1\ELEVAT~1.0-R\BIN~2.X86\elevate.exe -c MKLINK "%HOMEDRIVE%%HOMEPATH%\.vimrc" "H:\GitHub\dotfiles\home\Link\.vimrc"
	H:\OneDrive\MISCUT~1\ELEVAT~1.0-R\BIN~2.X86\elevate.exe -c MKLINK "%windir%\lua52.dll" "H:\OneDrive\MISCUT~1\lua52.dll"
	H:\OneDrive\MISCUT~1\ELEVAT~1.0-R\BIN~2.X86\elevate.exe -c MKLINK "%windir%\elevate.exe" "H:\OneDrive\MISCUT~1\ELEVAT~1.0-R\BIN~2.X86\elevate.exe"
) else (
	set My_Path=%HOMEDRIVE%%HOMEPATH%
	MKDIR %HOMEDRIVE%%HOMEPATH%\Games
	MKDIR %HOMEDRIVE%%HOMEPATH%\GitHub
	MKLINK /H "%HOMEDRIVE%%HOMEPATH%\.pentadactylrc" "%HOMEDRIVE%%HOMEPATH%\GitHub\dotfiles\home\Link\.pentadactylrc"
	MKLINK /H "%HOMEDRIVE%%HOMEPATH%\.vimrc" "%HOMEDRIVE%%HOMEPATH%\GitHub\dotfiles\home\Link\.vimrc"
	%HOMEDRIVE%%HOMEPATH%\OneDrive\MISCUT~1\ELEVAT~1.0-R\BIN~2.X86\elevate.exe -c MKLINK /H "%windir%\lua52.dll" "%HOMEDRIVE%%HOMEPATH%\OneDrive\MISCUT~1\lua52.dll"
	%HOMEDRIVE%%HOMEPATH%\OneDrive\MISCUT~1\ELEVAT~1.0-R\BIN~2.X86\elevate.exe -c MKLINK /H "%windir%\elevate.exe" "%HOMEDRIVE%%HOMEPATH%\OneDrive\MISCUT~1\ELEVAT~1.0-R\BIN~2.X86\elevate.exe"
	)

setx PATH "%PATH%;C:\cygwin64\bin;"
setx Desktop %My_Path%\Desktop
setx Downloads %My_Path%\Downloads
setx Games %My_Path%\Games
setx GitHub %My_Path%\GitHub
setx Music %My_Path%\Music
setx OneDrive %My_Path%\OneDrive
setx Pictures %My_Path%\Pictures
setx Videos %My_Path%\Videos
set GitHub=%My_Path%\GitHub
set OneDrive=%My_Path%\OneDrive
MKLINK /J "%HOMEDRIVE%%HOMEPATH%\pentadactyl" "%GitHub%\dotfiles\home\Link\.pentadactyl"

Powershell -Command Start-Process "\"PowerShell\" \"Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned\" -Verb Runas
