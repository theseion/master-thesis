initialization
initializeWith: aContext
	self copyFrom: aContext.
	self
		at: 1
		put: receiver.
	receiver := nil