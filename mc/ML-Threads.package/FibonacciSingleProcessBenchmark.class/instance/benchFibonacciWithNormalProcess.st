benchmarks
benchFibonacciWithNormalProcess
	| semaphore |
	semaphore := Semaphore new.
	1
		to: self problemSize
		do: [ :n |
			[ self fibonacciOf: n.
				semaphore signal ] newProcess resume.
			semaphore wait ]