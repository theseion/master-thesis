running
setUpBenchCopyLargeContextsStack
	| semaphore |
	self assert: (self class >> #buildLargeContextsStackCurrentSize:whenDone:) frameSize = 56.
	semaphore := Semaphore new.
	process := [
		self
			buildLargeContextsStackCurrentSize: thisContext stack size + 2
			whenDone: [
				semaphore signal.
				Processor activeProcess suspend ] ] fork.
	semaphore wait.
	self assert: (process suspendedContext stackOfSize: self problemSize) size = self problemSize