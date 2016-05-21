private
reifyContextsOf: anException
	"remote made sure that contexts don't disappear"
	| context topContext |
	anException signalContext isGhost ifFalse: [
		^ anException signalContext copyStack ].
	
	topContext := anException signalContext asLocalObject.
	context := topContext.
	[ context sender isNil ] whileFalse: [
		context privSender: context sender asLocalObject.
		context := context sender ].
	
	^ topContext