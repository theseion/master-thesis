operations
run
	| activeProcess |
	UIManager default class = NonInteractiveUIManager ifTrue: [
		ProvideAnswerNotification signal: 'Opening Debugger'.
		^ self ].
	
	UIManager default defer: [
		PromiseDebugger
			openOn: self debugSession
			withFullView: true ].
	"This is the promise process. It must not be resumed until the debugger is closed.
	Otherwise the waiting process will be woken up."
	activeProcess := Processor activeProcess.
	UIManager default spawnNewProcessIfThisIsUI: activeProcess.
	activeProcess suspend