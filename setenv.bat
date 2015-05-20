MKDIR %HOMEDRIVE%\cygwin64\home\%USERNAME%

IF %COMPUTERNAME% EQU NERV (
	set My_Path=H:
	COPY H:\GitHub\scripts\General.lnk "H:\Roaming\Microsoft\Windows\Start Menu\Programs\startup"
	COPY H:\GitHub\scripts\rsyncd.lnk "H:\Roaming\Microsoft\Windows\Start Menu\Programs\startup"
	COPY H:\GitHub\scripts\EasyWindowDrag.lnk "H:\Roaming\Microsoft\Windows\Start Menu\Programs\startup"
	MKLINK /J "%HOMEDRIVE%\cygwin64\home\%USERNAME%\dcc" "H:\Downloads\dcc"
	MKLINK /J "H:\Roaming\Mozilla\Firefox\Profiles\zvybsi3a.Link\searchplugins" "H:\GitHub\dotfiles\home\Link\.mozilla\searchplugins"
	MKLINK /J "H:\Roaming\Mozilla\Firefox\Profiles\zvybsi3a.Link\requestpolicy" "H:\OneDrive\Misc Utils\Firefox backup\requestpolicy"
	MKLINK /H "H:\Roaming\Mozilla\Firefox\Profiles\zvybsi3a.Link\search-metadata.json" "H:\GitHub\dotfiles\home\Link\.mozilla\search-metadata.json"
	MKLINK /H "H:\Roaming\Mozilla\Firefox\Profiles\zvybsi3a.Link\distill.sqlite" "H:\OneDrive\Misc Utils\Firefox backup\NERV\distill.sqlite"
	MKLINK /H "H:\Roaming\Mozilla\Firefox\Profiles\zvybsi3a.Link\permissions.sqlite" "H:\OneDrive\Misc Utils\Firefox backup\permissions.sqlite"
	H:\OneDrive\MISCUT~1\ELEVAT~1.0-R\BIN~2.X86\elevate.exe -c MKLINK "%HOMEDRIVE%%HOMEPATH%\.pentadactylrc" "H:\GitHub\dotfiles\home\Link\.pentadactylrc"
	H:\OneDrive\MISCUT~1\ELEVAT~1.0-R\BIN~2.X86\elevate.exe -c MKLINK "%HOMEDRIVE%%HOMEPATH%\.vimrc" "H:\GitHub\dotfiles\home\Link\.vimrc"
) else (
	set My_Path=%HOMEDRIVE%%HOMEPATH%
	COPY %HOMEDRIVE%%HOMEPATH%\GitHub\scripts\EasyWindowDrag.lnk "%APPDATA%\Microsoft\Windows\Start Menu\Programs\startup"
	MKDIR %HOMEDRIVE%%HOMEPATH%\Desktop\dcc
	MKDIR %HOMEDRIVE%%HOMEPATH%\Games
	MKDIR %HOMEDRIVE%%HOMEPATH%\GitHub
	MKLINK /H "%APPDATA%\Microsoft\Windows\Start Menu\Programs\startup\TwoFingerScroll.lnk" "%HOMEDRIVE%%HOMEPATH%\OneDrive\Misc Utils\TwoFingerScroll_1_0_9-MacHater-Mod\TwoFingerScroll.lnk"
	MKLINK /H "%APPDATA%\Mozilla\Firefox\Profiles\zvybsi3a.Link\search-metadata.json" "%HOMEDRIVE%%HOMEPATH%\GitHub\dotfiles\home\Link\.mozilla\search-metadata.json"
	MKLINK /H "%APPDATA%\Mozilla\Firefox\Profiles\zvybsi3a.Link\permissions.sqlite" "%HOMEDRIVE%%HOMEPATH%\OneDrive\Misc Utils\Firefox backup\permissions.sqlite"
	MKLINK /H "%HOMEDRIVE%%HOMEPATH%\.pentadactylrc" "%HOMEDRIVE%%HOMEPATH%\GitHub\dotfiles\home\Link\.pentadactylrc"
	MKLINK /H "%HOMEDRIVE%%HOMEPATH%\.vimrc" "%HOMEDRIVE%%HOMEPATH%\GitHub\dotfiles\home\Link\.vimrc"
	MKLINK /J "%HOMEDRIVE%\cygwin64\home\%USERNAME%\dcc" "%HOMEDRIVE%%HOMEPATH%\Desktop\dcc"
	MKLINK /J "%APPDATA%\Mozilla\Firefox\Profiles\zvybsi3a.Link\searchplugins" "%HOMEDRIVE%%HOMEPATH%\GitHub\dotfiles\home\Link\.mozilla\searchplugins"
	MKLINK /J "%APPDATA%\Mozilla\Firefox\Profiles\zvybsi3a.Link\requestpolicy" "%HOMEDRIVE%%HOMEPATH%\OneDrive\Misc Utils\Firefox backup\requestpolicy"
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
MKLINK /J "%HOMEDRIVE%%HOMEPATH%\pentadactyl" "%GitHub%\dotfiles\home\Link\.pentadactyl"

PowerShell -Command Start-Process "\"PowerShell\" \"Copy-Item $Env:OneDrive\\MISCUT~1\\ELEVAT~1.0-R\\BIN~2.X86\\elevate.exe -Destination C:\\Windows\"" -Verb runas
Powershell -Command Start-Process "\"PowerShell\" \"Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned\" -Verb Runas
