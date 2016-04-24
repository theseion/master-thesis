debugging actions
stepInto: aContext
	"Send the selected message in selectedContext, and take control in 
	the method invoked to allow further step or send."

	| possiblyNextContext |
	(self isContextPostMortem: aContext) ifTrue: [^ self].

	possiblyNextContext := interruptedProcess step: aContext.
	(possiblyNextContext method hasPragmaNamed: #filterContexts)
		ifTrue: [ self stepOver: possiblyNextContext ]
		ifFalse: [
			self updateContextTo: (self stepToFirstInterestingBytecodeIn: interruptedProcess) ].
	
	self triggerEvent: #stepInto