running
buildLargeContextsStackCurrentSize: anInteger whenDone: aBlock
	| temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8 temp9 temp10 temp11 temp12 temp13 temp14 temp15 temp16 |
	temp1 := 'temp1'. temp2 := 'temp2'. temp3 := 'temp3'. temp4 := 'temp4'.
	temp5 := 'temp5'. temp6 := 'temp6'. temp7 := 'temp7'. temp8 := 'temp8'.
	temp9 := 'temp9'. temp10 := 'temp10'. temp11 := 'temp11'. temp12 := 'temp12'.
	temp13 := 'temp13'. temp14 := 'temp14'. temp15 := 'temp15'. temp16 := 'temp16'.
	
	anInteger < self problemSize
		ifTrue: [
			self buildLargeContextsStackCurrentSize: anInteger + 1
			whenDone: aBlock ]
		ifFalse: [ aBlock value ]