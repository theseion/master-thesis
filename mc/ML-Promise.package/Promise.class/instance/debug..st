private
debug: aContext
	| activeProcess context |
	"ensure that the promise can be resolved when proceeding execution
	of the caller process"
	activeProcess := Processor activeProcess.
	self trimStackOf: aContext.
	context := self createCombinedStackFrom: aContext.
	
	(Process 
		forContext: context
		priority: Processor activeProcess priority) debug.
	UIManager default spawnNewProcess.
	activeProcess suspend