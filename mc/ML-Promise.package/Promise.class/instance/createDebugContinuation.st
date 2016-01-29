as yet unclassified
createDebugContinuation
	| exception |
	debugContinuation := PromiseContinuation fromContext: thisContext.
	debugContinuation class = PromiseContinuation ifTrue: [  ^ self ].
	
	"After evaluating the continuation the variable will hold the exception"
	exception := debugContinuation.
	debugContinuation := nil.
	
	self debug: exception.
	Processor activeProcess suspend