accessing
stack
	^ interruptedProcess isUserProcess
		ifTrue: [ self filteredCombinedStack ]
		ifFalse: [ super stack ]