benchmarks
benchFibonacciWithNormalProcesses
	1
		to: self problemSize
		do: [ :n |
			self
				fibonacciOf: n
				processSelector: #newProcess ]