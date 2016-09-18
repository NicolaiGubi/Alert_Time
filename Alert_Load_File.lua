function LoadFile ()

	 getvar = gma.show.getvar
	 show_name = getvar ('SHOWFILE')
	 file = assert(io.open(getvar ('PATH')..'/importexport/'..show_name..'.txt','r'))
	 a = {}

	 for input in file:lines() do	
		 local t = input	
		 --gma.feedback (t)
		 local sep = string.find(t, '=')
		 --gma.feedback (sep)
		 local cue_number = string.sub(t,2,sep - 1)
		 local cue_time = string.sub(t,sep + 1,-1)
		 a[cue_number] = cue_time

	 end
	 gma.feedback ('File is loaded.')
	 
end

return LoadFile