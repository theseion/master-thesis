initialization
initialize
	super initialize.
	
	self
		classes: { thisContext sender sender methodClass theNonMetaClass }; "For convenience."
		subscribeForExecution.
		
	ActionDescriptionStateWaitingForExecute setOn: self