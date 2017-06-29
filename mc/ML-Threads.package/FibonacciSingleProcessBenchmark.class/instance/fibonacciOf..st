private
fibonacciOf: anInteger
	^ anInteger < 2
			ifTrue: [ 1 ]
			ifFalse: [
				(self fibonacciOf: anInteger - 1) + (self fibonacciOf: anInteger - 2) ]