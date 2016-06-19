private
switchProcessFor: aContext or: aBlock
	^ (aContext isBottomContext or: [
		(interruptedProcess suspendedContext hasContext: aContext) not ])
			ifTrue: [
				"let the process terminate itself"
				interruptedProcess resume.
				interruptedProcess := interruptedProcess master.
				interruptedProcess suspendedContext ]
			ifFalse: [ aBlock value ]