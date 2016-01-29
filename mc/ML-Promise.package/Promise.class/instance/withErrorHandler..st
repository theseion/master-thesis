as yet unclassified
withErrorHandler: aBlock
	[ aBlock value ]
		on: Error
		do: [ :ex |
			"We need a copy of the stack to ensure that the restoring
			of contexts in the continuation doesn't mess up the exception
			stack."
			"debugContinuation value: ex signalerContext copyStack"
			exceptionContext := ex signalerContext copyStack ]