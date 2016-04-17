public-operations
value
	| value |
	self wait.
	openDebuggerOnError ifTrue: [ self debug ].

	value := self registry at: self.
	^ (value isNil and: [
		self hasException ])
			ifTrue: [
				"Can't use #resignalAs: since the exception happened in a different
				context chain. Exception handlers around this method would not be asked
				to handle the exception."
				PromiseProcessExceptionWarning signal ]
			ifFalse: [ value ]