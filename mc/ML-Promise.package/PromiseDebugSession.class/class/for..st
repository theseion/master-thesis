instance creation
for: aPromise
	| debugProcess instance |
	debugProcess := Process 
		forContext: aPromise contextStore combinedContext
		priority: Processor activeProcess priority.
	instance := self
		named: 'Promise debugger'
		on: debugProcess
		startedAt: aPromise contextStore combinedContext.
	^ instance
		promise: aPromise;
		yourself