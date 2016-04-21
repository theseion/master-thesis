private
handleException: anException
	| exceptionContext |
	"We need a copy of the stack to ensure that the restoring
	of contexts in the continuation doesn't mess up the exception
	stack."
	exceptionContext := anException isGhost
		ifTrue: [ self reifyContextsOf: anException ]
		ifFalse: [ anException signalContext copyStack ].
	anException signalContext: exceptionContext.
	self promise contextStore exceptionContext: exceptionContext.
	
	self promise registry
		at: self promise
		put: self promise defaultReturnValue