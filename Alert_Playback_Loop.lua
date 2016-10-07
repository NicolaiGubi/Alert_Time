get_var = gma.show.getvar
cmd = gma.cmd
function feedback_test ()
active_cue = get_var('SELECTEDEXECCUE')
current_cue = active_cue 
looper = 1
	while looper == 1 do
		if active_cue ~= current_cue then
			cmd ('top timer 4')
			cmd ('Assign Timer 4 /countdowntime='..a[active_cue])
			cmd ('go timer 4')
			current_cue = active_cue
		else
			gma.feedback('Plugin Loop Running.')
			gma.sleep(0.25)
			active_cue = get_var('SELECTEDEXECCUE')
		end
	end
end

return feedback_test