benchmarks
benchFibonacciWithAugmentedProcess
	| semaphore |
	semaphore := Semaphore new.
	1
		to: self problemSize
		do: [ :n |
			[ self fibonacciOf: n.
				semaphore signal ] newUserProcess resume.
			semaphore wait ]