debugging actions
stepInto: aContext
	"Send the selected message in selectedContext, and take control in 
	the method invoked to allow further step or send."

	(self isContextPostMortem: aContext) ifTrue: [^ self].

	aContext isBottomContext
		ifTrue: [
			"let the process terminate itself"
			interruptedProcess resume.
			interruptedProcess := self contextStore originProcess.
			interruptedProcess suspendedContext ]
		ifFalse: [
			aContext willSend
				ifTrue: [ interruptedProcess step: aContext ]
				ifFalse: [ ^ self stepOver: aContext ] ].

	self updateContextTo: (self stepToFirstInterestingBytecodeIn: interruptedProcess).
	
	self triggerEvent: #stepInto