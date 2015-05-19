CoordMode, Mouse, Screen
MouseGetPos, mx, my
WinGetPos, , , width, height, A
WinMove, A, ,  mx-(1/2*width), my-(1/2*height)
