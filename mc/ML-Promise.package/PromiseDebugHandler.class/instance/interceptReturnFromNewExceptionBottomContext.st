simulation
interceptReturnFromNewExceptionBottomContext
	| realSender originTopContext returnValue |
	returnValue := thisContext top.
	originTopContext := thisContext sender.
	realSender := self contextStore realSenderOfNewExceptionBottomContext.
	realSender bottomContext swapSender: originTopContext.
	thisContext swapSender: realSender.
	Processor activeProcess
		evaluate: [ self debugSession interruptedProcess completeTo: originTopContext ]
		onBehalfOf: self debugSession interruptedProcess