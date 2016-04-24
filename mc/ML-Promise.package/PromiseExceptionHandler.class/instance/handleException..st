private
handleException: anException
	| exceptionContext |
	exceptionContext := anException isGhost
		ifTrue: [ anException signalContext ]
		ifFalse: [ anException signalContext copyStack ].
	anException signalContext: exceptionContext.
	"We're not actively returning to that context but it is now
	the top context. Therefore it needs to have a return value."
	exceptionContext push: nil.
	self promise contextStore exceptionContext: exceptionContext.
	
	self promise registry
		at: self promise
		put: self promise defaultReturnValue