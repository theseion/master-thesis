debugging actions
stepInto: aContext
	"Send the selected message in selectedContext, and take control in 
	the method invoked to allow further step or send."

	| newContext |
	(self isContextPostMortem: aContext) ifTrue: [^ self].

	newContext := self
		stepWith: [ :process :context | process step: context ]
		inContext: aContext.
		
	self updateContextTo: (self stepToFirstInterestingBytecodeIn: interruptedProcess).
	
	self triggerEvent: #stepInto