accessing
stack
	^ self trimmedExceptionStack
		addAll: self trimmedOriginStack;
		yourself