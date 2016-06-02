private
stepWith: aBlock inContext: aContext inStack: aCollection
	^ aContext isBottomContext
		ifTrue: [
			"let the process terminate itself"
			interruptedProcess resume.
			interruptedProcess := self contextStore originProcess.
			interruptedProcess suspendedContext ]
		ifFalse: [
			(aCollection includes: aContext)
				ifTrue: [
					aBlock
						value: interruptedProcess
						value: aContext ]
				ifFalse: [ interruptedProcess complete: aContext ] ]