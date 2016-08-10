evaluating
evaluate: aBlock for: aRemotePromise
	| semaphore result |
	semaphore := Semaphore new.
	result := nil.
	[ [ result := aBlock value.
		semaphore wait ]
			on: Error
			do: [ :ex |
				aRemotePromise contextStore
					exceptionContext: ex signalContext;
					exceptionProcess: Processor activeProcess.
				semaphore signal.
				Processor activeProcess suspend ] ] newUserProcess resume.
	
	semaphore wait.
	^ result