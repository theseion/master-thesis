debugging actions
stepOver: aContext
	"Send the selected message in selectedContext, and regain control 
	after the invoked method returns."
	
	| newContext |
	(self canStepFrom: aContext) ifFalse: [^ self].

	newContext := (exceptionProcessHolder holderForContext: aContext) completeStep.

	self updateContextTo:  
		(newContext == aContext
			ifTrue: [ self stepToFirstInterestingBytecodeIn: interruptedProcess ]
			ifFalse: [ newContext ]).

	self triggerEvent: #stepOver