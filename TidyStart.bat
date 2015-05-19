@echo off
REM Reset and initialize variables
set deluninst=null
set delurls=null
REM set fixuser=null
echo To modify the global start menu, the elevate utility will be required.
echo Place in the same directory as this batch or the system path.
echo Find it here: http://code.kliu.org/misc/elevate/
pause
set /p deluninst=Delete all shortcuts to uninstallers? Type yes to confirm. 
IF %deluninst% EQU yes (
	robocopy %APPDATA%\Microsoft\Windows\StartM~1 %HOMEDRIVE%\StartMenuBak\Local *Uninstall*.lnk /S /MOVE /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0
	elevate -c robocopy %ProgramData%\Microsoft\Windows\StartM~1 %HOMEDRIVE%\StartMenuBak\Global *Uninstall*.lnk /S /MOVE /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0
	)
set /p delurls=Delete all shortcuts to internet pages? Type yes to confirm. 
IF %delurls% EQU yes (
	robocopy %APPDATA%\Microsoft\Windows\StartM~1 %HOMEDRIVE%\StartMenuBak\Local *.url /S /MOVE /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0
	elevate -c robocopy %ProgramData%\Microsoft\Windows\StartM~1 %HOMEDRIVE%\StartMenuBak\Global *.url /S /MOVE /NP /NFL /NDL /NJH /NJS /NC /NS /XJ /R:0
	)
REM set /p fixuser=Move all shortcuts from the root account start menu to the global start menu?
REM echo Type yes if you have an administrative account named root.
echo All done. Bad shortcuts have been moved to %HOMEDRIVE%\StartMenuBak
echo Look there to make sure nothing important was moved.
pause
