examples
exampleTwoUserThreads
	[
		| sem |
		sem := Semaphore new. 
		[[ 1 + 2. [ self halt ] value. sem signal ] on: Halt do: [ :h |
			| session |
			session := ThreadDebugSession 
				named: 'Promise debugger'
				on: Processor activeProcess
				startedAt: h signalContext.
			UIManager default defer: [
				ThreadDebugger
					openOn: session
					withFullView: true ].
			Processor activeProcess suspend ]] newUserProcess
				priority: 30;
				resume.
		sem wait.
		4 - 3 ] newUserProcess
			priority: 30;
			resume