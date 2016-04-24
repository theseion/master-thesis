simulation
interceptReturnFromNewExceptionBottomContext
<filterBottomContexts>
	| returnValue |
	returnValue := thisContext pop.
	"originTopContext := thisContext sender.
	realSender := self contextStore realSenderOfNewExceptionBottomContext.
	realSender bottomContext swapSender: originTopContext.
	thisContext swapSender: realSender.
	Processor activeProcess completeTo: originTopContext."
	^ returnValue