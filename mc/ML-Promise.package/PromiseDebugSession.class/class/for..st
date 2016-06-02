instance creation
for: aPromise
	| debugProcess instance |
	debugProcess := Process 
		forContext: aPromise contextStore exceptionContext
		priority: Processor activeProcess priority.
	instance := self
		named: 'Promise debugger'
		on: debugProcess
		startedAt: aPromise contextStore exceptionContext.
	^ instance
		promise: aPromise;
		yourself