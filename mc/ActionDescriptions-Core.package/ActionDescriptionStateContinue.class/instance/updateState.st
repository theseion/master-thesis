private
updateState
	super updateState.
	
	self nextStateClass = ActionDescriptionStateFinished ifFalse: [ ^ self ].
	
	self description handleContext: self context