Winset, AlwaysOnTop, ON, biosim™ by touch bionics 
Loop
{
PixelGetColor, color, 859, 339
If color = 0xFF0000
	Sendinput {Media_Next}
If color = 0x0000FF
	Sendinput {Media_Play_Pause}
}
