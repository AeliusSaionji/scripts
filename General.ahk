#NoEnv
#SingleInstance ignore
coordmode , mouse , screen

Xbutton1 & Wheelup::ShiftAltTab
Xbutton1 & WheelDown::AltTab

;The magical bugfix. Needed because AHK is fucked up. Without this, mouse alttab will have issues.
;It seems a recent version of AHK now screwed this up. I really need to just dump this language.
;Xbutton1 + leftclick defocuses a window with this uncommented, and thus breaks my resize function
;#IfWinActive , poop
;	Xbutton1::q
;return

;#b::
;	WinSet, Style, ^0xC40000, A
;return

; Regular lockscreen is fine.
;#l::
;	 SendMessage, 0x112, 0xF140, 0,, Program Manager ; 0x112 is WM_SYSCOMMAND -- 0xF140 is SC_SCREENSAVE
;return

;This is for how windows usually works, disable this to work with active window under mouse like x11
Xbutton1 & Lbutton::
	{
	WinGetTitle , active , A
	WinGet , mize , minmax , %active%
	mousegetpos , sto1x , sto1y
	}
return

;Enable for use with x11 mouse
/*
~Lbutton & Rbutton::
	WinGetTitle , active , A
	WinGet , mize , minmax , %active%
return

Xbutton1 & Lbutton::
	mousegetpos , sto1x , sto1y
return
*/
;end x11

Xbutton1 & Lbutton up::
	mousegetpos , sto2x , sto2y
	sto3x := sto2x - sto1x
	sto3y := sto2y - sto1y

	if (sto3x < 0 AND sto3y < 0)
	{
		sto3x := sto1x - sto2x
		sto3y := sto1y - sto2y
		if mize = 1
		{
			winrestore , %active%
		}
		winmove , %active% , , sto2x , sto2y , sto3x , sto3y
		return
	}

	if sto3x < 0
	{
		sto3x := sto1x - sto2x
		if mize = 1
		{
			winrestore , %active%
		}
		Winmove  , %active% , , sto2x , sto1y , sto3x , sto3y
		return
	}

	if sto3y < 0
	{
		sto3y := sto1y - sto2y
		if mize = 1
		{
			winrestore , %active%
		}
		winmove , %active% , , sto1x , sto2y , sto3x , sto3y
		return
	}

	if mize = 1
		{
		winrestore , %active%
		}
		winmove , %active% , , sto1x , sto1y , sto3x , sto3y
	return
