as yet unclassified
debug: aContext
	| context activeProcess |
	"ensure that the promise can be resolved when proceeding execution
	of the caller process"
	self registry
		at: self
		put: nil.
	activeProcess := Processor activeProcess.
	"Remove unwanted stack frames"
	context := aContext findContextSuchThat: [ :ctxt |
		ctxt sender receiver == self and: [ 
			ctxt sender selector = #run: ] ].
	context swapSender: [
		activeProcess
			suspendedContext: activeProcess suspendedContext sender;
			resume.
		Processor activeProcess terminate ] asContext.
	
	(Process 
		forContext: aContext
		priority: Processor activeProcess priority) debug.
	UIManager default spawnNewProcess.
	activeProcess suspend