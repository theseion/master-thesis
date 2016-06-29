operations
run
	self contextStore exceptionProcess masterProcessHolder: self contextStore originProcessHolder.
	UIManager default
		debugProcess: self contextStore exceptionProcess 
		context: self contextStore exceptionContext
		label: 'Blah' 
		fullView: false