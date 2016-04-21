operations
run
	| activeProcess |
	"ensure that the promise can be resolved when proceeding execution
	of the caller process"
	activeProcess := Processor activeProcess.
	self
		trimExceptionStack;
		trimOriginStack;
		combineStacks.
	
	(Process 
		forContext: self contextStore combinedContext
		priority: Processor activeProcess priority) debug.
	UIManager default spawnNewProcess.
	activeProcess suspend