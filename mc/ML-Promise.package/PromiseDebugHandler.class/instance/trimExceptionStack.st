private
trimExceptionStack
	"Remove unwanted stack frames"
	| context |
	context := self contextStore exceptionContext findContextSuchThat: [ :ctxt |
		ctxt sender notNil and: [
			"local"
			(ctxt sender method hasPragmaNamed: #promiseRunMethod) or: [
				"remote"
				ctxt sender selector = #executeFor: ] ] ].
	context ifNil: [ ^ self ].
	
	self contextStore	realSenderOfNewExceptionBottomContext: (context swapSender: nil)