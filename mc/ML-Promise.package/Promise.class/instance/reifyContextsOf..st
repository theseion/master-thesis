as yet unclassified
reifyContextsOf: anError
	"remote made sure that contexts don't disappear"
	| context topContext |
	topContext := anError signalContext asGhostRealObject.
	context := topContext.
	[ context sender isNil ] whileFalse: [
		context privSender: context sender asGhostRealObject.
		context := context sender ].
	
	^ topContext