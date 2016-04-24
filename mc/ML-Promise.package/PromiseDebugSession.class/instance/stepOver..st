debugging actions
stepOver: aContext
	"Send the selected message in selectedContext, and regain control 
	after the invoked method returns."
	
	| newContext originTopContext realSender valueContext fakeSender |
	
	(self isContextPostMortem: aContext) ifTrue: [^ self].

	newContext := interruptedProcess completeStep: aContext.
	(newContext method hasPragmaNamed: #filterBottomContexts) ifTrue: [
			originTopContext := newContext sender.
			realSender := self contextStore realSenderOfNewExceptionBottomContext.
			"Skip process termination. We're pretending that this is a single process."
			valueContext := realSender findContextSuchThat: [ :ctxt |
				ctxt sender sender == nil ].
			valueContext swapSender: originTopContext.
			newContext swapSender: realSender.
			newContext := interruptedProcess completeTo: originTopContext ].
		(newContext method hasPragmaNamed: #filterTopContexts) ifTrue: [
			realSender := self contextStore realOriginTopContext.
			fakeSender := newContext swapSender: realSender.
			newContext := interruptedProcess completeTo: fakeSender ].
	self updateContextTo:  
		(newContext == aContext
			ifTrue: [ (self stepToFirstInterestingBytecodeIn: interruptedProcess) ]
			ifFalse: [ newContext ]).

	self triggerEvent: #stepOver 