private
terminationContext
	| activeProcess |
	activeProcess := Processor activeProcess.
	^ [
		activeProcess
			suspendedContext: activeProcess suspendedContext sender;
			resume.
		Processor activeProcess terminate ] asContext