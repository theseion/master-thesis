private
handleException: anException
	| exceptionContext |
	exceptionContext := self reifyContextsOf: anException.
	anException signalContext: exceptionContext.
	"We're not actively returning to that context but it is now
	the top context. Therefore it needs to have a return value."
	exceptionContext push: nil.
	self contextStore
		exceptionContext: exceptionContext;
		exceptionProcess: Processor activeProcess.
	
	self promise registry
		at: self promise
		put: self promise defaultReturnValue.

	self promise signal.
	Processor activeProcess suspend