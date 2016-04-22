private
handleException: anException
	| exceptionContext |
	exceptionContext := anException isGhost
		ifTrue: [ anException signalContext ]
		ifFalse: [ anException signalContext copyStack ].
	anException signalContext: exceptionContext.
	self promise contextStore exceptionContext: exceptionContext.
	
	self promise registry
		at: self promise
		put: self promise defaultReturnValue