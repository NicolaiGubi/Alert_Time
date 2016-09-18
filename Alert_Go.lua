function AlertGo ()
	 
	 gma.echo ('There was a Go from Alert Timer recording')
	 cmd ('Go')
	 cmd ('Pause timer '..timer_a)
	 cmd ('Top timer '..timer_b)
	 cmd ('Go timer '..timer_b)
	 cmd ('setvar $my_timer = $timer'..timer_a)
	 timer_a, timer_b = timer_b, timer_a

	 --Get values
	 cue_time = getvar ('my_timer')
	 cue_number = getvar ('SELECTEDEXECCUE')
	 --Write to feedback window
	 feedback ('The time for cue number '..cue_number..' is: '..cue_time)
	 -- Write to file
	 file = assert(io.open(getvar ('PATH')..'/importexport/'..show_name..'.txt','a'))
	 file:write('#'..cue_number..'='..cue_time,'\n')
	 file:close()

end

return AlertGo