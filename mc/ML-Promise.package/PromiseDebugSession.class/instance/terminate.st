debugging actions
terminate
	(interruptedProcess notNil and: [
		interruptedProcess == self contextStore originProcess ]) ifFalse: [
			interruptedProcess terminate.
			interruptedProcess := self contextStore originProcess ].
	
	super terminate