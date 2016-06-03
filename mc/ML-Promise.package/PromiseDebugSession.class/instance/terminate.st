debugging actions
terminate
	(interruptedProcess notNil and: [
		interruptedProcess ~= self contextStore originProcess ]) ifTrue: [
			interruptedProcess terminate.
			interruptedProcess := self contextStore originProcess ].
	
	super terminate