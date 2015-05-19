#NoEnv
;#HotkeyInterval 200 ;shouldnt be needed if not using volume
#SingleInstance ignore
coordmode , mouse , screen

transtrue = 0
alpha = 225
Delay = 200               

Loop {
WinWait, Swipe finger ahk_class #32770
	{
	    ;WinMinimize, ahk_class MozillaWindowClass
	    WinMinimize
	    ;Sendinput #d
	    Sleep 200
	    ;Sendinput #d
	    ;Sleep 200
	    WinActivate
	}
	WinwaitClose
}

#Enter::
	run, "C:\cygwin64\bin\mintty.exe" -i /Cygwin-Terminal.ico -
return

#b::
	WinSet, Style, ^0xC40000, A
return

; Regular lockscreen is fine.
;#l::
;	 SendMessage, 0x112, 0xF140, 0,, Program Manager ; 0x112 is WM_SYSCOMMAND -- 0xF140 is SC_SCREENSAVE
;return

; Eliminated in favor of AltDrag's "lower window"
;RAlt & WheelDown::
;	{
;	alpha -= 5
;	wingetactivetitle , trans
;	winset , transparent , %alpha% , %trans%
;	return
;	} 

;RAlt & Wheelup::
;	{
;	alpha += 5
;	wingetactivetitle , trans
;	winset , transparent , %alpha% , %trans%
;	return
;	} 

RAlt & Mbutton::
	if transtrue = 0
	{
		wingetactivetitle , trans
		winset , transparent , 130 , %trans%
		transtrue = 1
		return
	}
	else
	{
		wingetactivetitle , trans
		winset , transparent , 255 , %trans%
		transtrue = 0
		return
	}

#a::
	{
		wingetactivetitle , top
		winset , AlwaysOnTop , Toggle , %top%
		return
	}

;Xbutton1 & Rbutton::
;	WinGetTitle , active , A
;	WinGet , mize , minmax , %active%
;	mousegetpos , sto1x , sto1y
;	if sto1x < 0
;	{
;		if mize = 1
;		{
;			winrestore , %active%
;		}
;		Winmove , %active%, ,-1280 , 0
;		Winmaximize , %active%
;		return
;	}
;	else if (sto1x > 0 AND sto1x < 1280) 
;	{
;		if mize = 1
;		{
;			winrestore , %active%
;		}
;		Winmove , %active%, ,0 , 0
;		Winmaximize, %active%
;		return
;	}
;	else if sto1x > 1280
;	{
;		if mize = 1
;		{
;			winrestore , %active%
;		}
;		Winmove , %active%, ,1280 , 0
;		Winmaximize, %active%
;		return
;	}
;return

;Aight this is for how windows usually works, disable this to work with active window under mouse like x11
Xbutton1 & Lbutton::
	{
	WinGetTitle , active , A
	WinGet , mize , minmax , %active%
	mousegetpos , sto1x , sto1y
	}
return

;enable for use with x11 mouse
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

;^m::
;	wingettitle , maxi , A
;	Winmove , %maxi% , ,-1280 ,0 ,3840 ,1024


Xbutton1 & Wheelup::ShiftAltTab
Xbutton1 & WheelDown::AltTab

;Xbutton1 & MButton::
;	{
;	send !0
;	return
;	}

; The magical bugfix. Needed because AHK is fucked up. Without this, mouse alttab will have issues.
#IfWinActive , poop
	Xbutton1::q
return

;#e::Run, "C:\Program Files (x86)\FreeCommander\FreeCommander.exe"
