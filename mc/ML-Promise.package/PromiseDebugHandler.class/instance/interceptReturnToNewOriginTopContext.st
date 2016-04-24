simulation
interceptReturnToNewOriginTopContext
	| realSender |
	realSender := self contextStore realOriginTopContext.
	thisContext swapSender: realSender.
	^ thisContext top