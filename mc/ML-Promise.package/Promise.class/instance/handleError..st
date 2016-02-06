as yet unclassified
handleError: anError
	"We need a copy of the stack to ensure that the restoring
	of contexts in the continuation doesn't mess up the exception
	stack."
	exceptionContext := anError signalContext copyStack.
	self registry
		at: self
		put: nil