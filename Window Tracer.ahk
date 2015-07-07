;Link Satonaka
#NoEnv
#SingleInstance ignore
CoordMode, Mouse, Screen

; Store the name of the active window before XButton1 is pressed.
XButton1::
{
	WinGetTitle, active, A
	SendInput {XButton1}
	Return
}

~XButton1 & LButton::
{
	WinGet, mize, MinMax, %active%
	MouseGetPos, sto1x, sto1y
	Return
}

~XButton1 & LButton up::
{
	MouseGetPos, sto2x, sto2y
	sto3x := sto2x - sto1x
	sto3y := sto2y - sto1y

	if (sto3x < 0 AND sto3y < 0)
	{
		sto3x := sto1x - sto2x
		sto3y := sto1y - sto2y
		if mize = 1
		{
			WinRestore, %active%
		}
		WinMove, %active%,, sto2x, sto2y, sto3x, sto3y
		WinActivate, %active%
		Return
	}

	if sto3x < 0
	{
		sto3x := sto1x - sto2x
		if mize = 1
		{
			WinRestore, %active%
		}
		WinMove, %active%,, sto2x, sto1y, sto3x, sto3y
		WinActivate, %active%
		Return
	}

	if sto3y < 0
	{
		sto3y := sto1y - sto2y
		if mize = 1
		{
			WinRestore, %active%
		}
		WinMove, %active%,, sto1x, sto2y, sto3x, sto3y
		WinActivate, %active%
		Return
	}

	if mize = 1
	{
		WinRestore, %active%
	}

	WinMove, %active%,, sto1x, sto1y, sto3x, sto3y
	WinActivate, %active%
	Return
}
