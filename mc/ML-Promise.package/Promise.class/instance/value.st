public-operations
value
	| value |
	self wait.
	value := self registry at: self.
	self hasException
		ifTrue: [
			openDebuggerOnError
				ifTrue: [ self debug ]
				ifFalse: [
					value ifNil:[
						"Can't use #resignalAs: since the exception happened in a different
						context chain. Exception handlers around this method would not be asked
						to handle the exception."
						PromiseProcessExceptionWarning signal ] ] ].
	
	^ value