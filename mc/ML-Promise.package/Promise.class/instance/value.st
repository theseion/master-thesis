public-operations
value
	self wait.
	openDebuggerOnError ifTrue: [ self debug ].
	
	^ self registry at: self