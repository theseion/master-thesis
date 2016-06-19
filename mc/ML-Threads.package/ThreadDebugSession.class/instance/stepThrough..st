debugging actions
stepThrough: aContext
	"Send messages until you return to selectedContext.
	 Used to step into a block in the method."
	(self isContextPostMortem: aContext) ifTrue: [^ self].

	aContext willSend ifFalse: [ ^ self stepOver: aContext ].

	interruptedProcess stepToHome: aContext.
	self updateContextTo: (self stepToFirstInterestingBytecodeIn: interruptedProcess).
			
	self triggerEvent: #stepThrough 