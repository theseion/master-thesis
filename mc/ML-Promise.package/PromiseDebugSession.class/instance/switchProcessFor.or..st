private
switchProcessFor: aContext or: aBlock
	^ (aContext isBottomContext or: [
		(interruptedProcess suspendedContext hasContext: aContext) not ])
			ifTrue: [
				"let the process terminate itself"
				interruptedProcess resume.
				interruptedProcess := self contextStore originProcess.
				interruptedProcess suspendedContext ]
			ifFalse: [ aBlock value ]