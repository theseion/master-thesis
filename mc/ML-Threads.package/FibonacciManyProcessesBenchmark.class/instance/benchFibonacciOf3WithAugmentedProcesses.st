benchmarks
benchFibonacciOf3WithAugmentedProcesses
	| signals mutex semaphore |
	signals := 0.
	mutex := Mutex new.
	semaphore := Semaphore new.
	self problemSize timesRepeat: [
		[ self
			fibonacciOf: 3
			processSelector: #newUserProcess.
		mutex critical: [ signals := signals + 1 ].
		signals = self problemSize ifTrue: [ semaphore signal ] ] newUserProcess resume ].

	semaphore wait