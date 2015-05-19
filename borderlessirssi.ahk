if A_ComputerName = Nadeko
{
	WinSet, Style, ^0xC40000, ahk_class irssiclass
	;WinSet, AlwaysOnTop, On, ahk_class irssiclass
	WinMove, ahk_class irssiclass, , 1, 0, 3199, 1800
	return
}
else if A_ComputerName = NERV
{
	WinSet, Style, ^0xC40000, ahk_class irssiclass
	;WinSet, AlwaysOnTop, On, ahk_class irssiclass
	WinMove, ahk_class irssiclass, , -1600, 764, 1600, 316
	return
}
else
msgbox add this computer to the script
exitapp
