examples
exampleTwoSystemThreads
	[[ 1 + 2. [ self halt ] value. ] on: Halt do: [ :h |
		| session |
		session := self sessionClass 
			named: 'Promise debugger'
			on: Processor activeProcess
			startedAt: h signalContext.
		UIManager default defer: [
			self
				openOn: session
				withFullView: true ].
		Processor activeProcess suspend ]] newProcess
			priority: 30;
			resume