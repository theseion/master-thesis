running
buildSmallContextsStackCurrentSize: anInteger whenDone: aBlock
	thisContext stack size < self problemSize
		ifTrue: [
			self
				buildLargeContextsStackCurrentSize: anInteger + 1
				whenDone: aBlock ]
		ifFalse: [ aBlock value ]