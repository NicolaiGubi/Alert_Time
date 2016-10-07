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

--Defines generasl variables
getvar = gma.show.getvar
getobj = gma.show.getobj
handle = getobj.handle
cmd = gma.cmd
feedback = gma.feedback

function LoadFile ()
	-- Defines variables
	show_name = getvar ('SHOWFILE')		-- Reads the name of the show file
	exec_num = getvar ('SELECTEDEXEC')	-- Reads the number of the selected executor
	local h = handle('exec '..exec_num)	-- Gets the handle of the executor
	-- Reads the label of the selected executor
	if getobj.label(h) then
		seq_name = getobj.label(h)		-- There is a label set and it is read
	else
		seq_name = 'Sequ'				-- There is no label set, definesa one
	end
	-- Opens the file for reading
	if io.open(getvar ('PATH')..'/importexport/'..show_name..'@'..seq_name..'.txt','r') then
		file = assert(io.open(getvar ('PATH')..'/importexport/'..show_name..'@'..seq_name..'.txt','r'))
		if a then								-- Check if the table exist
			table.remove(a)						-- Clears any exixting table
			a = {}								-- Defines a table
		else									
			a = {}								-- Defines a table
		end
		for input in file:lines() do					-- For each line in the file
			local t = input								-- Read the line
			local sep = string.find(t, '=')				-- Finds the seperator
			local cue_number = string.sub(t,2,sep - 1)	-- Reads the cue number
			local cue_time = string.sub(t,sep + 1,-1)	-- Reads the Cue time
			a[cue_number] = cue_time					-- Store the values in the table
			feedback('The time is: '..a[cue_number]..' for cue '..cue_number)
		end
	feedback ('File is loaded.')							-- Feedback to the user
	else													-- If there is no file for this sequence
		feedback ('There is no file for this sequence!')	-- Feedback to the user
		cmd ('Plugin "Alert Playback Stop"')				-- Stops the playback
		cmd ('Go Macro "STOP Alert Playback"')				-- Runs the Stop macro
	end
	

end

return LoadFile