--[[
Made by

      ::::::::  :::    ::: ::::::::: ::::::::::: 
    :+:    :+: :+:    :+: :+:    :+:    :+:      
   +:+        +:+    +:+ +:+    +:+    +:+       
  :#:        +#+    +:+ +#++:++#+     +#+        
 +#+   +#+# +#+    +#+ +#+    +#+    +#+         
#+#    #+# #+#    #+# #+#    #+#    #+#          
########   ########  ######### ###########       

nicolaigubi@gmail.com

This is part of the Alert Timer function.
--]]

function EndLoop ()
	looper = 2										-- Stops the loop in the previous plugin
	gma.cmd('Off Plugin "Alert Playback Start"')	-- Turn off the previous plugin
	gma.cmd('Off Timer 2 Thru4 ')					-- Turns off the timers 
end

return EndLoop