--Proof of concept multi key press
--Here 11 is a modifier that changes xbutton1 (button4) to right click
--The button must be unassigned in the gui and mapped here in order to 'swallow' the default action when the modifier is pressed
--Otherwise, both the default action and the new mod action will be sent


Mod = 0

function OnEvent(event, arg)
    if arg == 11 then
		if event == "MOUSE_BUTTON_PRESSED" then
			--OutputLogMessage("Mod \n")
			Mod = 1
		elseif event == "MOUSE_BUTTON_RELEASED" then
			Mod = 0
		end
    elseif arg == 4 then
		if event == "MOUSE_BUTTON_PRESSED" then
			if Mod == 1 then
				PressMouseButton(3)
			elseif Mod == 0 then
				PressMouseButton(4)
			end
		elseif event == "MOUSE_BUTTON_RELEASED" then
			ReleaseMouseButton(3)
			ReleaseMouseButton(4)
		end
	end
end