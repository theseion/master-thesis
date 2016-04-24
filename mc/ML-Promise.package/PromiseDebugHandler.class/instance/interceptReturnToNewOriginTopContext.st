simulation
interceptReturnToNewOriginTopContext
	<filterTopContexts>
	"| realSender |
	realSender := self contextStore realOriginTopContext.
	thisContext swapSender: realSender."
	^ thisContext pop