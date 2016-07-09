running
runLargeWith: counter collectingTimesInto: aCollection
	| temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8 before time after |
	temp1 := 'temp1'. temp2 := 'temp2'. temp3 := 'temp3'. temp4 := 'temp4'.
	 temp5 := 'temp5'. temp6 := 'temp6'. temp7 := 'temp7'. temp8 := 'temp8'.
	
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