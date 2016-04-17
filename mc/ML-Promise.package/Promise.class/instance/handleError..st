private
handleError: anError
	"We need a copy of the stack to ensure that the restoring
	of contexts in the continuation doesn't mess up the exception
	stack."
	exceptionContext := anError isGhost
		ifTrue: [ self reifyContextsOf: anError ]
		ifFalse: [ anError signalContext copyStack ].
	anError signalContext: exceptionContext.
	self registry
		at: self
		put: defaultReturnValue