operations
run
	| activeProcess debugProcess debugSession |
	"ensure that the promise can be resolved when proceeding execution
	of the caller process"
	UIManager default class = NonInteractiveUIManager ifTrue: [
		ProvideAnswerNotification signal: 'Opening Debugger'.
		^ self ].
	activeProcess := Processor activeProcess.
	self
		trimExceptionStack;
		trimOriginStack;
		combineStacks.
	
	debugProcess := Process 
		forContext: self contextStore combinedContext
		priority: activeProcess priority.
	debugSession := PromiseDebugSession
		named: 'Promise debugger'
		on: debugProcess
		startedAt: self contextStore combinedContext.
		
	UIManager default defer: [
		PromiseDebugger
		openOn: debugSession
		withFullView: true ].
	"This is the promise process. It must not be resumed until the debugger is closed.
	Otherwise the waiting process will be woken up."
	UIManager default spawnNewProcessIfThisIsUI: activeProcess.
	activeProcess suspend