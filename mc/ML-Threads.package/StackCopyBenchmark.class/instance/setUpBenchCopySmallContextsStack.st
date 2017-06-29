running
setUpBenchCopySmallContextsStack
	| semaphore |
	self assert: (self class >> #buildSmallContextsStackCurrentSize:whenDone:) frameSize = 16.
	semaphore := Semaphore new.
	process := [
		self
			buildSmallContextsStackCurrentSize: thisContext stack size + 2
			whenDone: [
				semaphore signal.
				Processor activeProcess suspend ] ] fork.
	semaphore wait.
	self assert: (process suspendedContext stackOfSize: self problemSize) size = self problemSize