evaluating
unwindAndRestartToContext: aContext
	self
		switchProcessFor: aContext
		or: [ ].
	
	super unwindAndRestartToContext: aContext