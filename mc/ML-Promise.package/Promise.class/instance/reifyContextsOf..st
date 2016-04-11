private
reifyContextsOf: anError
	"remote made sure that contexts don't disappear"
	| context topContext |
	topContext := anError signalContext asLocalObject.
	context := topContext.
	[ context sender isNil ] whileFalse: [
		context privSender: context sender asLocalObject.
		context := context sender ].
	
	^ topContext