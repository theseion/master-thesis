private
debug: aContext
	| activeProcess |
	"ensure that the promise can be resolved when proceeding execution
	of the caller process"
	activeProcess := Processor activeProcess.
	self
		trimStackOf: aContext;
		attachFrozenContextsTo: aContext.
	
	(Process 
		forContext: aContext
		priority: Processor activeProcess priority) debug.
	UIManager default spawnNewProcess.
	activeProcess suspend