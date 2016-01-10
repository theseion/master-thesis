private
basicExecute
	| process |
	process := Processor activeProcess.

	[
		self context: (self description continueUntilPredicate
			ifNotNil: [
				process
					stepUntil: self description continueUntilPredicate
					from: self context ]
			ifNil: [ self context ]).
		self openDebuggerForProcess: process
	] fork.
		
	process suspend