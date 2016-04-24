debugging actions
stepOver: aContext
	"Send the selected message in selectedContext, and regain control 
	after the invoked method returns."
	
	| newContext originTopContext realSender valueContext |
	
	(self isContextPostMortem: aContext) ifTrue: [^ self].

	newContext := interruptedProcess completeStep: aContext.
	(newContext method hasPragmaNamed: #filterContexts) ifTrue: [
			originTopContext := newContext sender.
			realSender := self contextStore realSenderOfNewExceptionBottomContext.
			newContext swapSender: realSender.
			"Skip process termination. We're pretending that this is a single process."
			valueContext := realSender findContextSuchThat: [ :ctxt |
				ctxt sender sender == nil ].
			valueContext swapSender: self contextStore realOriginTopContext.
			newContext := interruptedProcess completeTo: originTopContext.
			self stepToFirstInterestingBytecodeIn: interruptedProcess ].
	self updateContextTo:  
		(newContext == aContext
			ifTrue: [ (self stepToFirstInterestingBytecodeIn: interruptedProcess) ]
			ifFalse: [ newContext ]).

	self triggerEvent: #stepOver 