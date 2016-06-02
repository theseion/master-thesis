debugging actions
stepOver: aContext
	"Send the selected message in selectedContext, and regain control 
	after the invoked method returns."
	
	| newContext stack |
	
	(self isContextPostMortem: aContext) ifTrue: [^ self].

	stack := self stack.
	(interruptedProcess suspendedContext isNil or: [
		(interruptedProcess suspendedContext hasContext: aContext) not ]) ifTrue: [
			interruptedProcess := self contextStore originProcess ].

	newContext := aContext isBottomContext
		ifTrue: [
			"let the process terminate itself"
			interruptedProcess resume.
			interruptedProcess := self contextStore originProcess.
			interruptedProcess suspendedContext ]
		ifFalse: [
			(stack includes: aContext)
				ifTrue: [ interruptedProcess completeStep: aContext ]
				ifFalse: [ interruptedProcess complete: aContext ] ].

	(newContext ~= aContext and: [
		stack includes: newContext]) ifFalse: [
			^ self stepOver: newContext ].

	self updateContextTo:  
		(newContext == aContext
			ifTrue: [ (self stepToFirstInterestingBytecodeIn: interruptedProcess) ]
			ifFalse: [ newContext ]).

	self triggerEvent: #stepOver