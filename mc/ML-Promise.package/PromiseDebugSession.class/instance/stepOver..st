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
			interruptedProcess resume.
			interruptedProcess := self contextStore originProcess.
			interruptedProcess suspendedContext ]
		ifFalse: [ interruptedProcess completeStep: aContext ].
	"self haltIf: [ newContext isNil or: [ newContext selector = #run and: [ newContext receiver class = PromiseDebugHandler ] ] ]."
	(newContext ~= aContext and: [
		stack includes: newContext]) ifFalse: [
			self stepOver: newContext ].
	
	(stack includes: newContext) ifFalse: [
		newContext := interruptedProcess complete: newContext ].

	self updateContextTo:  
		(newContext == aContext
			ifTrue: [ (self stepToFirstInterestingBytecodeIn: interruptedProcess) ]
			ifFalse: [ newContext ]).

	self triggerEvent: #stepOver