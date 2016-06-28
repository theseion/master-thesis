operations
run
	self contextStore exceptionProcess masterProcessHolder: (ProcessHolder for: self contextStore originProcessHolder).
	self contextStore exceptionProcess
		debug: self contextStore exceptionContext
		title: 'Blah'