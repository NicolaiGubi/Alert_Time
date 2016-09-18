function AlertSetup ()
	 getvar = gma.show.getvar
	 cmd = gma.cmd
	 feedback = gma.feedback
	 timer_a = 2
	 timer_b = 3

	 show_name = getvar ('SHOWFILE')
	 assert(io.open(getvar ('PATH')..'/importexport/'..show_name..'.txt','w'))

end

return AlertSetup