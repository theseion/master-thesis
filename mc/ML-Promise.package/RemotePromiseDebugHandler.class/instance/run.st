operations
run
	self contextStore exceptionProcess masterProcessHolder: self contextStore masterProcessHolder.
	UIManager default
		debugProcess: self contextStore exceptionProcess 
		context: self contextStore exceptionContext
		label: 'Remote promise debugger' 
		fullView: false