function AlertRecordingStop ()

	 cmd ('off timer 2')
	 cmd ('off timer 3')
	 cmd ('setvar $my_timer =')
	 feedback('Alert time recording stopped')

end

function CleanUp()
     gma.echo('Cleanup called') --Give a feedback in system monitor that plugin has ended
	 feedback('Done.. Have Fun')
end

return AlertRecordingStop, CleanUp
