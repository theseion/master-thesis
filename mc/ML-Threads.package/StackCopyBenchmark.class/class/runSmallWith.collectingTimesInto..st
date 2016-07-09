running
runSmallWith: counter collectingTimesInto: aCollection
	| before time after |
	counter < 100000
		ifTrue: [
			self
				runWith: counter + 1
				collectingTimesInto: aCollection ]
		ifFalse: [
			before := Smalltalk vm totalGCTime.
			time := [ thisContext copyStack ] timeToRun asMilliSeconds.
			after := Smalltalk vm totalGCTime.
			aCollection add: time -> (before + time - after) ]