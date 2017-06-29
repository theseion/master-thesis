private
fibonacciOf: anInteger processSelector: aSymbol
	| result semaphore |
	semaphore := Semaphore new.

	result := 0.
	([ result := anInteger < 2
			ifTrue: [ 1 ]
			ifFalse: [
				(self fibonacciOf: anInteger - 1 processSelector: aSymbol) + (self fibonacciOf: anInteger - 2 processSelector: aSymbol) ].
	semaphore signal ] perform: aSymbol) resume.
	
	semaphore wait.
	^ result